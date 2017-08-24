function patch_table = get_patchs(filename,lineind)

C = textread(filename, '%s','delimiter', '\n');
s = C{lineind};
patch_table = sscanf(s,strcat('%f',','));

end