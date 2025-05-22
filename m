Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C719995D
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=hYBjDpJ6u1HJwHSYphmn1ar1iRI/k/pFr+tfgB0Gyctlp7NdAdP0o2znCuKPAZoOheEpxplvH79j0r1CI+/0LtQ9JpbqCzZ9AvECIcHZw6OiYCCixfB0FMIyVhm/+8TemxniExj9OdClrjj1gnRB8B61QDcsR3tC0aXgG70E4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BTGlPNBUqufLWTLKvpNxjSK3+Nvn4+q+dEmnWIZc2m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5g2FKq29lEbVBZkqLzS6OV65xD1x5xCSM5wwa9tIez1rfHMUw3oqCjXNvPjef804mkcLBsOrGDPemF7Ifo5qek9E6wvLoL6z48ZzlW6rYLnlteZjtRF+1+KW21Q2GEMZIGjwYlgPJGZ6WaBwqNWQYrUv7WEpJ1TXDVjmSl4YR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuClYz/F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuClYz/F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so103463515e9.3
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935656; x=1748540456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=xuClYz/FNAcR1XBd9lrteBSgwu079CrWakSSFOvN+AGBTh2bDUnfa3e37KFsfYqzmU
         Go8qmzJzm0dAbHptyDJ1NQF81Nk4oWWedSFUucy6ccFHPjwnrASDProjJhK8nhpPPqSJ
         y6BzFUWEVMHyq15AK25wwqr04K1j1nnAjTerHmpKilzO/T2462exJrY9QDT+/vV1nUPZ
         9H1Ig0hh7fuvIJD9Wk5/FSqY6z3RBIAJ3FoQHGuV0QmXPqw5xs9tlJshZPC93MuZFTW5
         wBU5GCzbab7hDhR+xAgMEBLo+cDamjHIOEYBHr95fnED1S3MttbHCeVZcBhOnqQlPohh
         LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935656; x=1748540456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=IqJuLrHA4JT+vY+maMNBFNtpCjtuVLcNH13vDXMeUlrLvDcUauKSFkRkQ1pNiFPnD1
         b392F1aUkUnUHr7gceyOidZoPOwAXcBHGalSew7igpceWgHg7tHHwa86wIomLdlEXtp3
         PZGucGfWBFcsRpSNAexkeD9XJtvPLjJQyQ3J7qdlJSOxGRKXIw2BdRjzaUhW3g+BQ17V
         alE5unh3E0ngarA/yx2hXeuwAlnyBx3dhb0nA8MEHf3NnyNs61umvcPL07AJ9sKpez/5
         +x2XkYiTHjT6nBB3T+8WyfGJ2XDa/4PCHFdfggnaGhGobThsfVJXCxtZl34KWXgh8uU+
         +1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVBX/eoXkYR9kP+DurKfimMFr3E+JiuNPXNymVtKxL2LajdHYoac/AB4H4XBn5zMwur8hc5eNCR++0g1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bUwI3XXQdaPqp15k85TzTOdji2yPrBe7LRsWsgh/9726gc+K
	RUy1n8H5jnNaTalc3JBCfn1AgMjsCoJM+Lrju40Cb9+Ua95luvVCRI5mfaNGsBvJQp8=
X-Gm-Gg: ASbGncsnTNwxuEYymYSIpXlEMp8V9DY4aHQ9X3tfDFK09t9uJlTwvx1AElbQ9cz9rxK
	ad+DT4G5u3kgLz+dVh9IY7w3VdwyR53kiq7U4hjdgMwquQZ7mOxdHciKeXxG/A/FfOe7G9K7qYP
	fcElCSCJDu2hqFKuAVU9CvkjRPFmQ9Qq6iQMJvCEA7U7eYuT6W+OorxF6RPK/LK4504KrA6bDWh
	lelEsOU8PsqMpgimYHuP8BeXGdti7iBaTTU6lJmLKpl5jWYdQ21aShUexzQnEPnXWwWhlOu+9+k
	awUHYkL7YOet4YhbXqihZbalqfMADOM+TQ+qoIjHuxEu5XvZ6ZG7mut5oRPIRL2KbNHHrQ==
X-Google-Smtp-Source: AGHT+IEBbmBeEZeBEDTgs2S0bIt/X0hdjEoD/gWNab7fsmjGtWFgCjNCvRyckETck0ijr3VIY19D5w==
X-Received: by 2002:a05:600d:c:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-442ff8e1221mr214812715e9.12.1747935656418;
        Thu, 22 May 2025 10:40:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:52 +0100
Subject: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

The pattern matching incorrectly selects "wsa" because of "sa" substring
and evaluates it as a SoC component or block.

Wsa88xx are family of amplifiers and should not be evaluated here.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
   required:
     - compatible
 

-- 
2.47.2

