function report_callbacks(h_report,T)
    next_callback=['page=str2num(get(h_report.page,"String"));'...
        'set(h_report.page,"String",num2str(page+1));'...
        'page=str2num(get(h_report.page,"String"));'...
        'xlim(h_report.graph, [(page-1)*4 (page)*4]);'...
        'xlim(h_report.spectro,[(page-1)*4 (page)*4]);'];
    set(h_report.next,'Callback',next_callback);
    
    page_callback=['page=str2num(get(h_report.page,"String"));'...
        'xlim(h_report.graph, [(page-1)*4 (page)*4]);'...
        'xlim(h_report.spectro,[(page-1)*4 (page)*4]);'];
    set(h_report.page,'Callback',page_callback);
    
    prev_callback=['page=str2num(get(h_report.page,"String"));'...
        'set(h_report.page,"String",num2str(page-1));'...
        'page=str2num(get(h_report.page,"String"));'...
        'xlim(h_report.graph, [(page-1)*4 (page)*4]);'...
        'xlim(h_report.spectro,[(page-1)*4 (page)*4]);'];
    set(h_report.prev,'Callback',prev_callback);
    
    final_callback=['set(h_report.page,"String",floor(T(end)/4)+1);'...
        'xlim(h_report.graph, [floor(T(end)/4)*4 (floor(T(end)/4)+1)*4]);'...
        'xlim(h_report.spectro,[floor(T(end)/4)*4 (floor(T(end)/4)+1)*4]);'];
    set(h_report.final,'Callback',final_callback);
    
    home_callback=['set(h_report.page,"String",1);'...
        'xlim(h_report.graph, [0 4]);'...
        'xlim(h_report.spectro,[0 4]);'];
    set(h_report.home,'Callback',home_callback);
    
end
    
    

