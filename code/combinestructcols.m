function combined = combinestructcols(multicolstruct)
% combinestructcols Combine columns in a structure
% e.g. combined = combinestructcols(multicolstruct)

    % Get list of field names
    fields = fieldnames(multicolstruct);
    
    % Loop over fields, and vertcat the arrays
    nfields = size(fields,1);
    for i = 1 : nfields
        field = fields{i};
        combined.(field) = vertcat(multicolstruct.(field));
    end