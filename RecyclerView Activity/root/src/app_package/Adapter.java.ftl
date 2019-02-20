package ${packageName}.adapter;
import ${packageName}.bean.${componentName}Bean;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
import ${packageName}.R;



public class ${componentName}Adapter extends RecyclerView.Adapter<${componentName}Adapter.${componentName}Holder> {

    List<${componentName}Bean> list=new ArrayList<>();

    @NonNull
    @Override
    public ${componentName}Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view= LayoutInflater.from(parent.getContext()).inflate(R.layout.${lowerInputClass}_adapter_item,parent,false);
        return new ${componentName}Holder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ${componentName}Holder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return list.size();
    }
	
	//刷新列表
	public void setList( List<${componentName}Bean> list){
		this.list=list;
		 notifyDataSetChanged();
	}

    class ${componentName}Holder extends RecyclerView.ViewHolder {
        ${componentName}Holder(View itemView) {
            super(itemView);
        }
    }
	
	public interface ${componentName}AdapterInterface{
		void clickItem();
	}
}
