module TranslationsHelper
  def language_help language
    case (language.name rescue nil)
      when 'Greek' then render partial: 'languages/help_greek'
      else
        nil
    end
  end
end
