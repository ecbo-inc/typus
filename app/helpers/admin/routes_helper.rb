module Admin::RoutesHelper

  def application_models
    {
      AffiliateTag: "payment",
      AffiliatersPayout: "payment",
      AmznSpace: "pickup",
      AreaSection: "space",
      Banner: "cloak",
      Booking: "booking",
      BookingsLocker: "booking",
      Category: "space",
      CloakConfiguration: "cloak",
      ConversionTag: "cloak",
      Country: "space",
      Coupon: "cloak",
      DayOff: "space",
      Deliverer: "auth",
      DeliverersPayout: "payment",
      Facility: "space",
      Fee: "booking",
      Holiday: "space",
      Information: "cloak",
      Inviter: "auth",
      InvitersPayout: "payment",
      LockerPlan: "cloak",
      OnSiteSale: "booking",
      Owner: "auth",
      Payment: "payment",
      Payout: "payment",
      Prefecture: "space",
      PrefecturesTrainsLine: "space",
      PromoCode: "cloak",
      Review: "space",
      ServiceFee: "space",
      Space: "space",
      SpaceAddressMap: "space",
      SpacePhoto: "space",
      Station: "space",
      SubAreaSection: "space",
      SubCategory: "space",
      TrainsLine: "space",
      User: "auth"
    }
  end

  def service_host(model_name)
    service_name = application_models[model_name]
    Internal::ServiceClient::SERVICE_URL_MAPPING[service_name] || service_name
  end

  def admin_manage_url(model_name)
    service_host(model_name) + "/admin/#{model_name.to_s.underscore.pluralize}"
  end

  def model_name_in_locale(model_name)
    I18n.t(model_name.to_s.underscore, scope: "activerecord.models")
  end
end
