Geocoder.configure(
  http_headers: { "User-Agent" => "ambeard" },
    esri: {
      api_key: [
          Rails.application.credentials.arcgis_api_user_id,
          Rails.application.credentials.arcgis_api_secret_key
        ], 
        for_storage: true
    }
)
