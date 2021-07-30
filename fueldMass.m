function m_Prop = fueldMass(thrust, imp, m, t)

propThr = thrust ./ imp .* m;
m_Prop = zeros(1, length(t));
m_Prop(1) = m;
for i = 2:length(t) - 1
    tmp = (propThr(i - 1) + propThr(i)) / 2 * 0.01;
    tmp = m_Prop(i - 1) - tmp;
    if tmp < 0
        break
    else
        m_Prop(i) = tmp;
    end
end

