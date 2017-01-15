module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      content_tag(:sapn, "", :class => "fa fa-lock")
    else
      content_tag(:sapn, "", :class => "fa fa-globe")
    end
  end
end
