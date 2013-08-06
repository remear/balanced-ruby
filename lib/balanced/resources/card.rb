module Balanced
  # A card represents a source of funds for an Account. You may Hold or Debit
  # funds from the account associated with the Card.
  #
  class Card
    include Balanced::Resource

    def initialize attributes = {}
      Balanced::Utils.stringify_keys! attributes
      unless attributes.has_key? 'uri'
        attributes['uri'] = self.class.uri
      end
      super attributes
    end

    # Creates a Debit of funds from this Card to your Marketplace's escrow account.
    #
    # If +appears_on_statement_as+ is nil, then Balanced will use the
    # +domain_name+ property from your Marketplace.
    #
    # @param [Array] args
    # @option args [Integer] :amount the amount of the purchase in cents
    # @option args [String] :appears_on_statement_as
    # @option args [String] :hold_uri
    # @option args [Hash] :meta a hash of data to save with the Debit
    # @option args [String] :description
    # @option args [String] :source_uri
    #
    # @return [Debit]
    def debit *args
      warn_on_positional args
      options = args.last.is_a?(Hash) ? args.pop : {}
      amount = args[0] || options.fetch(:amount) { nil }
      appears_on_statement_as = args[1] || options.fetch(:appears_on_statement_as) { nil }
      hold_uri = args[2] || options.fetch(:hold_uri) { nil }
      meta = args[3] || options.fetch(:meta) { nil }
      description = args[3] || options.fetch(:description) { nil }

      ensure_associated_to_customer!

      self.account.debit(
          :amount => amount,
          :appears_on_statement_as => appears_on_statement_as,
          :hold_uri => hold_uri,
          :meta => meta,
          :description => description,
          :source_uri => self.uri
      )
    end

    # Creates a Hold of funds from this Card to your Marketplace.
    #
    # @return [Hold]
    def hold *args
      options = args.last.is_a?(Hash) ? args.pop : {}
      amount = args[0] || options.fetch(:amount) { }
      meta = args[1] || options.fetch(:meta) { nil }
      source_uri = args[2] || options.fetch(:source_uri) { nil }
      description = args[3] || options.fetch(:description) { nil }
      appears_on_statement_as = args[4] || options.fetch(:appears_on_statement_as) { nil }
      
      ensure_associated_to_customer!
      
      hold = Hold.new(
          :uri => self.customer.holds_uri,
          :amount => amount,
          :meta => meta,
          :source_uri => self.uri,
          :description => description,
          :appears_on_statement_as => appears_on_statement_as
      )
      hold.save

    end

    def invalidate
      self.is_valid = false
      save
    end

    private
    # Ensure that one of account, account_uri, customer or customer_uri are set.
    # Otherwise raise an exception.
    def ensure_associated_to_customer!
      if attributes.values_at('account', 'account_uri', 'customer', 'customer_uri').compact.empty?
        raise UnassociatedCardError.new(self)
      end
    end
  end

end
