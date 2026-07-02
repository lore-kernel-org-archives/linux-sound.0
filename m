Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFF47D922
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984715; cv=none; b=DwbgTdceOcZWpp9aNad1Umzh4DIUSjBM/4POvsGVlV42dyLt/LdMww3P+cfQyWaZ0IRnGXALN1AClftJ8SelBkhms6F0oEHO6lmPkIxkEOX5KdjHGlUHZWP/LPF9TShDxg3oTwftIZgZYV6XABO0GTEyuNUcHhuPtqTQfClBWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984715; c=relaxed/simple;
	bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbLFhlMSfbXPqEUF2MZ/g5AYg+bolroA1C2rZ/VOSi5z8i9TS+cFMwDKTIwGV2lIfbR7iomDTHUGMofiQXLHOfnh74ph55r5/8E+8ET1KuPIsdfOHy5KUWoSvkYQyufjsxDnwkmUbbRLazX2rFRBUkUJWzy+l9vqedqE/l5NYsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqGS7k8T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqGS7k8T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so1176650f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984712; x=1783589512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=ZqGS7k8TUJ4zj0ubR5D4n9EiN41zmLUCRcEjxVdsnv0tZtAPTovzDGWbWHyEHjwqpa
         T8VyhestgY7tC7bIaKN7CH9InPmFImkBoI2cMmcMFserBvkwNdkiZPAFuhPddG9u/SB+
         NsjZX3Nq/lJ1CYCsCEB8ShME1jZES3kMMgcIxFXCBMEosSHxu5gaebTHi1pU3HN5Md8s
         4kDZGfA6uEHzVLkvfAPR7/1hb/fWT2yzykqoHC+9OLtw7go/2CCZXglgMN0UQAs/0XFx
         R8W+iS9Lu18KZ4OR35rG9Ouj45j3vYD/J9I6agbpngxv9d/qsxL2MoppFt7J2RKBuUZc
         L1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984712; x=1783589512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=ZyPBMQTv0VTcXNEjxRWczEtQHF+V06REXNN+/5R6JG6Owj+63XHjDx/yM8tJ58FJnj
         YLdPjEToK88GPL0cJw21qGXIa2ABbgnMB+NUK4C0ppzXBkn9Sf5vgWfHXCABkBrR6ZPz
         v9+YF53WCBJ3+hONfZYH5pTLY6g8Eh/eQtujjfIMyU/gy4781Z8QVCmJRutkPMCZwt9g
         iR791ogr+XatwGS15GiqS82yWTU52fwYfjQRzHqjLN3IYxNAeZfYcStUkKKLXIKLwXEv
         37LveFzATQ0X0srvxCk+3JSUR++pyC4V5B5R/Irc9uL6pEIzWLdix560munU35sh0c/R
         folA==
X-Forwarded-Encrypted: i=1; AHgh+RoLXFMtThgOgvJ1wIL8q0ZWveBJ811Fg3ys026euzfAbJp0RtQC7TM2m/M5Td+VKvzhyHuZ4TaX7W56KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweGDo3ecll0LMlzTQI0PP/YsXbl2+hsgPBLNz5cC8tuML6pOKZ
	bJSK2Gbq9oD6B1DxUpkjUdyDyslFld34NHVaWnwXkOU+jNpAqC8e54Xh+hSgg0lX34w=
X-Gm-Gg: AfdE7cnZf2FtK0CDqI1yZF3NfVPsb97gYESSCY4tc1mFv7T1sy2s1Fyzh1fIpTqcDEy
	QkIW0+/LhjjxgzmTVtQk64I2pAN3CWIdFYdb5SGjF/0EKrWI40zSUCuazN3TZzGCGWJAnu+TlzH
	WHGayXr7gNLOlmQ5HCSIli7xBy0SEzG9vXBZWDw01R7tmREV4JOD/7aZTyLqT17WyvY4HHsF8Z3
	Z0oUo201rnbp9XM8G49ACS+QZv1zG+kwLnnK0Naac/UrBJOnBXLUv8VUdzPdgIbunPUUxzDtyDk
	MDch7Sm5BHFbA30nQt/hyFIhB1hlwYdTLImqmtQBEK2yA8Sh6gFZc8q5mtkAN7MrYxvnEXSoYcR
	oO97J/ECtXrENzDU7U4Yc8syvEMvAc+HHnUfh52snCmWPElAVMzwXAR2mAWYbb6dZYRIhTnvJvj
	NjdaJOHfllRrwmJ3frCpVzCWJVosqE64juZA==
X-Received: by 2002:a05:6000:709:b0:478:77c1:787c with SMTP id ffacd0b85a97d-47877c17ae9mr2019954f8f.56.1782984711543;
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:46 +0200
Subject: [PATCH v2 2/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket
 S2 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-2-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjACezRvsknWsM09U/yvYorrMqp0JqWPBXtnXx+2
 676kkYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0cM2D/
 9TbbYYcNW/X+u703M7JQJBMzXYex9vzQQG7wzxMq4PyWDALJBB1ua3Dl+LkwxWta2ISbCowgBn2b84
 WKoH69+/zgb03NI9Xo/LNHQa+EmWrQYbCTsw6/8ZR13voMkrWN+bU/mcCEFG9gBErMIYMMBgH95Hd4
 5Bg5tC84KRHI5uLcTPG3j1W/fDkd2q+7qPRMFsMgUJm4hPcmvJRiQDUH9/AFc0wbQDtOfDs/RTV2VE
 1fN2xgHWXkhLP5v8OI5srcWPUYPFld4+Ve6ELIfHbLg+3NzldfcvvmsYs4X9dbuEfhtptrAM1/8Y5A
 uP/mskG1JueNulRh19b0bBhefmBlJOM+GXenJDaRVPWm/lwJTpVzpwQQxl8fIBCfxpQq8zpZr75KuX
 uKSnpLvtNVrrxxsXaAuLQ+b4IsYPH50rSeZW2QqZUKJ9wNlJYYL9ywAJ7H3fE9NxjJ4G9bd8z88p+i
 mrqYPGD+OYi9rT+X1NakjlJ2nth5hNQvzc1opXY8j3aybFGaaBLBoilPq0pBMGIB4/guRrCL8ieuDJ
 kdKiEP4fRJ1Eaa4ftyvIRlarK/+SuTiDpWDpEKxDG/wbawSOEtxa6KYppdiEjguK7mhjPX+HAOQxGU
 iGzzY9131B2vrbDnBWXonTn/nqoIwAvxehsCZ2ldP3Yitx0eHAW1UfS2T/tg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

