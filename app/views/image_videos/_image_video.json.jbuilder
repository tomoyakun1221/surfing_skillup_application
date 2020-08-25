json.extract! image_video,
              :id,
              :photograph_day_on,
              :title,
              :created_at,
              :updated_at
json.url image_video_url(image_video, format: :json)