function xo = aft_SetHandle(xo, hname, hvalue)
% AFT::SetHandle  - method for any xff type
%
% FORMAT:       [obj = ] obj.SetHandle(hname, hvalue);
%
% Input fields:
%
%       hname       handle name (valid identifier ~= 'xff')
%       hvalue      handle value
%
% Output fields:
%
%       obj         altered object
%
% TYPES: ALL
%
% Note: not valid for the root object.

% Version:  v1.1
% Build:    16012416
% Date:     Jan-24 2016, 4:32 PM EST
% Author:   Jochen Weber, SCAN Unit, Columbia University, NYC, NY, USA
% URL/Info: http://neuroelf.net/

% Copyright (c) 2010 - 2016, Jochen Weber
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in the
%       documentation and/or other materials provided with the distribution.
%     * Neither the name of Columbia University nor the
%       names of its contributors may be used to endorse or promote products
%       derived from this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

% only valid for single file
if nargin < 3 || numel(xo) ~= 1 || ~xffisobject(xo, true) || xo.L(1) == 'X' || ...
   ~ischar(hname) || ~isrealvarname(hname(:)') || strcmpi(hname(:)', 'xff')
    error('neuroelf:xff:badArgument', 'Invalid call to %s.', mfilename);
end

% set handles
try
    xo.H.(hname(:)') = hvalue;
catch xfferror
    rethrow(xfferror);
end
