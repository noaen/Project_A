function patch_table = get_patchs(C,lineind)

s = C{lineind};
patch_table = sscanf(s,strcat('%f',','));

end