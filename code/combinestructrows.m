function combined = combinestructrows(metstruct)
% combinestructrows Combine rows in a structure

    % Get list of field names
    fields = fieldnames(metstruct);
    
    % Loop over fields, and vertcat the arrays
    nfields = size(fields,1);
    for i = 1 : nfields
        field = fields{i};
        combined.(field) = vertcat(metstruct.(field));
    end