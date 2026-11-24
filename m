Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=hR+7DC3kDS4h7vl5tC+awQYYk7kS3CrNGGh1UbA/iDmahcYf0/j7zn25hBA1/Ly9juwI
	 dBgJPJ/IomAI+hstrN3N3TgoKOGQJOObeFiG11CwT3E8Slkw6FFe1WjSVvYdkwgYFt1cW
	 BRz83ofL0Pz+Wb5T7O8S0ElBDI89IWmEy2s6Qq65+BixV4H1At7hF6feJV0wvU8mXZOng
	 JkBRwL+NN1sONqxySGE3+upSq0170nBg2aql+1E6mCgLVD/ZIcp75i25nBITMbiS/qP1F
	 CkLvmcnyzqMLfEG1rhVkZ9J/JyFXdly9uJB3i3Cmq8s8gqyg8oGPD/KL5ihqwX7vSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
	b=lnEKbkHPMcOKclCvwTfDHrM1B5uyOzFeNQboCO3pRWHg0d8MEvp0wDm10mKpI4/2HIoZ
	 bDFCxNuOoOV/zFQbsa3EflfDsVK9A8stpN0HA2ORbab4lt7ISLVxMBq2a71vpgsrhqOyO
	 ByEmM0+XGWbL3tbJcy1a7+BARFlUhqUR7fwZg1XPogfaWRa430DTqtKJMXsOR+oAOViVl
	 pBJME9SlYnIQfKkc177+JjvZihZT7/4dV5lwfNr/HhKn7yc+rKLT3AvAD4qyOVKRYrdGy
	 iVmlik2+WMDGWlUzkrU8m2vRiqVF5szqch6GrV5Dz3qXQvTLkC03jX9LFL1K732tMOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58860A3808
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF58860A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a32576da88so2798962f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541547; x=1796146347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=CAzlwEmN9dC0GaiVbvr6PRQMqbM1riHbYgXNkb53ws4oCaBivG/BoCh6bN1Sw/ZEHC
         w07Y5Et6b/7Vwgw93y8Zf9iNg8vLY94qHeb9zERCMCMU/gbsQk7eRXSLhop7B/BBXFbo
         r3kXgiOfdeRzVurOJekr/lfLMZ7bJwhUHvdi9zx4ADlaWpCBE6sElkHpP0oMyTGVk78T
         JDa9oMJobNxa685jtKfLjKFNv7bgE4QDUJ2lh6gVwAGC/sIqtAtVKPd/R6WShfIj97bK
         k6JI+94y8BtWCVvlCbOJcO/Nwmuty1yIT+ES+lJlj1cfMDmBNSk6+eqeEPHGwxq4uT2h
         5U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541547; x=1796146347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=MdNQr5OnPXaIs/bxdXozpR9hEbmZnL8PXq1K74qoYPWdrgXy5AXRNfeGEewl6qgPY7
         Hp52UdX/vuMbU5LsFvSOO3+s9qpKjhSfO9xFz2IxklEN1oAg4lNSK78rK7yJ664YEFqE
         MakUg2sfNwrghtGuKPcZTsU/TJ+BsLJm+3tJPHiGbS5BoDN7gnvVE3VW7+fGkED5Clop
         7dOS5FFXYmwYH93yGLL2nhlp3QE1YR1tqfWvglY/HkgcfzlupI1J4qR8RcXifvrp/qjl
         081BkChddI+XOdjLZ+Wv6pZzJs9POIdSb41K/VajVV6ch8Ovg47WESeVmAsNyjEiwzk9
         pBkA==
X-Gm-Message-State: APuU4Z99fleSL8jSRUoHJWgjoqMI3jGgD9yGVs6Q0JMfLvLoIei/a9M9
	pZQAwX0gNb+FeqvPnLw6d7doH3DWAjAqtXwZxHQnFIwkNwVFvQ3EKhAr4dlV6BL8wyE=
X-Gm-Gg: AZFdTZfy13oybv/PZ0jC9mWxJqq/drExvx7cwkK0Di8jZZtFFno8ezE34IItfJ7PwEU
	8+hvIxpZfDom4TTh7Drtqa1cU/QhAPYNPKn/ebY//VkyB/KMFo57o6wXyk+NMlYLnmx2nDuY017
	SxOnpxVgQfAKmu/JVEeN+1Fv1/OhdxQFEJSlmM2Fk6dtMfsq+wYyxfIBT2BmeTL2dpPUzjR5PLc
	nSnBVm+sMaO750sBaAp34NimPptIJYYeRLw5+nsUw8Vc6xchKXUwnxz+V+q2eQ70UllpIbAaGrP
	EMipH5f/zLkWV7habSbdrmbma412v7cBRTwXcB1HUBiExWNaVct9kt0C9VsibKb+2m9dEETSFhM
	+Gp/pvVBrQR/7HmxshMl2ps0DZOVWJFFfzmFgIA9Ugrdx5EP+O+vbeXkcsPL7Kw6usLVFq3Fdyt
	cwMaJBMH66byyZ3wQYqvYYs+OEAYsWn01qKM5Grl6WSU81CsPRUz2Uj5+mDHjTAeHPA7iTgBts4
	H8rolrUbbISTPHm0iFtPUdrLE4cIHcQcxb6AhUqnVDLgVHvh7jWB+ITnmO+bWlPuIBVrOAgVpW/
	UBK8JuHBIx1JexMzLCvs08xduBg2kHLL7hd6dl+fwtwzysZ2Bw==
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr34327691f8f.44.1795541547074;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:14 +0100
Subject: [PATCH v2 07/19] ASoC: codecs: lpass-wsa-macro: handle the macro &
 dcodec power domains
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-7-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hVFg3Y31Ispb6dIhV4lKOW6ZJCfvIzuJH+rNG0A18RE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcod3y0YQ0h2BUQpIM4apyqk8yOgOGlztGUy36oe
 7e2JPcqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0Se7EA
 DFos36gYy4RYDRa7R1O6n7gn3ZjBST+lXq0rc+BtlYRhQBkv+plvM/fdkv1vhFxFcAL3LMJm26pgg6
 EAc4ea/zyMm9nLe9JZyBXI6R6tXmPSAmnPfA/pkc1g+26Bi6HDrv0w4qYPDemOZ4TR9ErrHRlxZiZu
 mpt2Ay4r42L0T5QF0jszfiuoqbbFFNGNiGzfHH4Tg0br95tQSgrAQBQx0RkLJR1s8YJfxUpEe63yof
 SC4bjrgMa0Ahd1TUkY6pTmdg+OKqeokhbO+Q/Fx/ay0lrjEHJVMytyAXvxH+PFZY2iyjXS/y9jhaF8
 VhOvgz9bAIx6y+fvgPBlsT7Dr//jgYQ7DswTbC/UxeDRt9LTUo4Mj+9atQYvyI5jyPcfTpcamZD7kK
 w6cWGJvKV3dh1t+oG9+UReA+HOfaoaTxhqTRKBcawcNNKXZPJBAfKylGj3lepPQKcOr355h5x5kT54
 1i9QipL2N1hlE/atQCVwnJqBXhn8CLUitlCjTufD97ldbJisg0H39XzrNTkk+7vYdzMqM9EbVnM8X8
 DLDZFllX1fV2ip2iOIdk0cOgB8X+pJgjDWJqUG116Z2A/oTam9YlFZUMurEh2KcRo5TI3JTrI8Efsy
 URFlBGIaJG7OAI/gE5gHeOFA3XAzLGZtxhSz552Lx6KQ/360SRc1kHU0qUFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the WSA macro lies
in the LPASS core and audio power domains like the RX, TX and VA
macros, so attach and power them with lpass_macro_pds_init() like
the other macro drivers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2b63954f783b..254b8faaa8a1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -419,6 +419,7 @@ struct wsa_macro {
 	struct clk *macro;
 	struct clk *dcodec;
 	struct clk *fsgen;
+	struct lpass_macro *pds;
 	struct clk_hw hw;
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
@@ -2769,6 +2770,14 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->fsgen))
 		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
 
+	wsa->pds = lpass_macro_pds_init(dev);
+	if (IS_ERR(wsa->pds))
+		return PTR_ERR(wsa->pds);
+
+	ret = devm_add_action_or_reset(dev, lpass_macro_pds_exit_action, wsa->pds);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.34.1

