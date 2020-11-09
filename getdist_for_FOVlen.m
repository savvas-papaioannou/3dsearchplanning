function v = getdist_for_FOVlen(fov_len,phi)


d = @(r,phi) round(r./ (2.*tan(deg2rad(phi)./2) ));

v = d(fov_len,phi);


end

