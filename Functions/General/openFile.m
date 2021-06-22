function File = openFile(path, name , ext)

if strcmp(ext, '.xls') ||  strcmp(ext, '.xlsx') 
    
   File = xlsread([path, name, ext]);
else
   File = dlmread([path, name, ext]);
end
