module ApplicationHelper
  def set_top_by_namespace
    namespace = controller_path.split(/\//)[0]
    if namespace == 'shop'
      return '26px'
    end
    if namespace == 'admin'
      return '11px'
    end
    if namespace == 'devise'
      return '10px'
    end
  end
end
