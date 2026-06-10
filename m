Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61AB3947B5
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077319; cv=none; b=f3zVMl6FZoBauFYij5zbfpFw5Zy9oZCIn8EvOK+D4c11jWrsGZEbedQZxTMBng+ivOzs5yd0A8k5iPMfiWfoR/8KAC9PJQXpo+NMlDEETlPCShfoZTH6L5/0ZxzZ2N22Sq4lg1qpvhFpYAkJuRpnCZkOnZWlykf0C2zXAJwTWEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077319; c=relaxed/simple;
	bh=RUQYACSew3cfYX34zgSR284JiIolXCPlfeeA2gfHrsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqfTtyJLO0Hhi9e4IUgW0437B+RmiQaFCzfTjKaLPeBW13NLyy3BdW+UixpH7sN1bcxFCTN16DP4ECJUTLYxeJszJTIIWC8vx7t55XIpXLhis3hdrPcwj1J/F0SrhjO3LizXCBXaHJlagVrv29gTp4O5OhdYGGojZ6SmiKxgeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKzBnPJT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKzBnPJT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46015dc517aso5156656f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 00:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077314; x=1781682114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrqigCCHxDsMi9xkcr3nQgEkjpdgCmWeRsU/XEzQWc0=;
        b=MKzBnPJTID6e6EF21YmyQCtBRczubFhoGJDzbSdVy7gb2kD0euOVSRjXSe1e+IAWqg
         cc/EHBgRUM2N8gPFVYRIrTH7Kol3lLzyM7Ss1EspMX418JCPCD/DAiGZspM2bOQKXo3L
         j9Z94F14mslPsMEBa1JZS+MoDF3c5UjjIeAS8v3p1dSSgrSOW/oz5Yqh/S2O+9GV1Cow
         Rimy+6BUwQ0y9vBBmLpWE7piLRWowY/bzGof73kJZcwOyscKfXpkzUV+8EEcG7otXWKj
         8KxSrsL32F9u9A8yj5dAdgO+qPu5Ho68cl9twdBau3WpSJ2CSalYxpac7UNE7igmTl88
         TE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077314; x=1781682114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrqigCCHxDsMi9xkcr3nQgEkjpdgCmWeRsU/XEzQWc0=;
        b=aU0/4X8j0Hv+v5xon6KdIt7LnLjkQodLdmJDBOLzX1P2uovM/Ty2WGo3LgLEhgQvMe
         1nBNnDlZ4Ui1sETIXnuWOqYdWSARbNNFIOLeXGV1YOd5v47ACmF41wx3ng4vzn+QO7sB
         j8P6Jo/3sQI/gVY1xR1ljuA7kg2LdkZkqQRjV+vTMZrwNFAIbPrL3GeF1bXYR878dN0T
         pYyDTUAdc66HsZeAwBpqFMDkFS54HsUxYIXkjA1DSwjFTOeRc+H3xjTtGH9l+Mv716gd
         NGiCHHxNge/I5lwfPKyXXrR1feQjkBJANVydxRDggfNUIO/Xq153qiCAL492B8zBJIOP
         XT7A==
X-Forwarded-Encrypted: i=1; AFNElJ/WbkvlhHPWDOdZvH6AGYudXggpR+hNvrw+h2kqMkSsbfoEIhIaAAbrq9GWD7HWmYhvKIxpPD0bO3kr5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydumexEon8rJWRIDlQHVfgaZvcvev6MkeVlt5QN240RNSZmE66
	fQlDMVzoUvbnIZkxr2SeHLGg5G26tszfZp5vdqUWR+h3swtBrd0PrftmwHoc3ggeSbI=
X-Gm-Gg: Acq92OGmdEpNBkdyMUooEcWaz/XRG1zMJoyibYD4fzFcxAOFZg04YwQ024RbQ+zvpRC
	9z+fl65C+ZpE+oAMncSSmAxlZ1W2LEgM1rjUihpjlp++Om7vjDKI/85zM4f6qjgWekXmNqn4oH9
	U2GR1P5t/HwKKabP8o2fLr0WB2QFU/rVTgS+6/VOCKASojUggt3tIl17tRFMb/A02BclHcJznGq
	NSzyzCqzSnbS+ObSaK/SZN3C9fvTMf2LMx7jBByV6s43hzhK0zrQ7TmeEWWdY0sso5NZjSQ2rTS
	6cabdhw20z9TiLhNI2GcA8Z4kmIwldJ9pOsMO1Sb7vZIK6PPVwqsmMNVMTRe3yVIDoZOBY7RS1o
	aXFjVSZID93hv6X6mAuEWUJvWsG6f3Mx7C/FFTOd3uClXiKsJF8FXDe3QNJ48JT0JdYx2XekCaD
	hidTA+ZrS6aNhp2kb4xXYO6l1i0l7KWpIp44hg5k6AHd49ganh1nr/Rak=
X-Received: by 2002:adf:efc6:0:b0:45e:fa7b:a7cf with SMTP id ffacd0b85a97d-460304ee122mr26773651f8f.2.1781077314148;
        Wed, 10 Jun 2026 00:41:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:48 +0200
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-4-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RUQYACSew3cfYX34zgSR284JiIolXCPlfeeA2gfHrsM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU8wuDWQxwbLtSGmJeawuYayQs0Qcj0laB5GNNz
 X7mZs6iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVPAAKCRB33NvayMhJ0eykD/
 47yri/yFEa9A9JkT/e28+Ty0O9LdEXHm1iWQMBFYse3uP5q3qDm4PyuXsgzjBhkrbOdtrgt38OY/P9
 8goI3bThbQ0y2BaxrAlVTveukcI9xRdNXOae7Ul29NITYrtHCIKNHFO7Zk9S4VZLwbyojH+Iq3WQny
 HTYCrPzx+2v4DPmePsGaTDRCDpc6yVFtpm3NjuwahOFzpLOAMxYupiXLqRRJvZv3BnvOn20Om57HHq
 UdDrKaatlJP6ElvH3540DXldo2UtPr8hpOlA7HFqKEkZ0WA4qOBle1RvbQRjQi1eyKZch5SDmJdTSp
 i1HL+N/NnVSzQZcw2yKdM0tWXfGSO/kJpHuVb/hi1XMGd2VFaGLpaoUy7+blqCybW3VkgRSer24a5C
 4JpTz7H+6fsTmfL4vohISWvgSBSE/2wocxDQm/Ve+BsdSdpbuB2buXyH0KM1zsX3D14BXf7+C7dXbz
 PvmsmlBVez4cT4Zuiolubyg66PkkgjOUoWKhiQWeDoVz/z5HIB45kWVD5gcoXzumukHymQPsCh4QyL
 zje233G+4XG86o6qRjVx7aZrLTgF+IxH3l37vm1rpfzJ0S+yW+yjhZO1DhPRp9V79OnoVi+4KosAzl
 WjAf2ezex07diTiV4OJxOw4zIX/ea50YPFI98KXrD+07tOiD4zN8iGgt38WA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..1fc458276ab3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1

