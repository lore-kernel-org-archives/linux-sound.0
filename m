Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBF18130D
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208949; cv=none; b=om7O1PVQccuxRUWiAm2i2Bcha36mF9/uPG9rgoHPNu6+88whKE4KJ76j119G41p6cMylr5B+/MBa74mhTHbn4fn7waQTPkx4z1LOgquz231PYgP3nVqAK25TNQQowebjZrwvTNlUVNDlatUTiU1v3k+dwCbYJ3pSc+YDUUTaeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208949; c=relaxed/simple;
	bh=TdNpNaj0eDwPSxq1ZGkE2FZQIvk+R7zfpn4gMLOjX+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeN97HZtjpW8eY7YKIsaZuTw6zPSyzGdO7CgcLmQwYmcxFZqx1J57VZKA1Bi9kVUqqvVr9IH7ZooOdrCdZITcWAo1+3yZtN2JOmbZry544Sr3oH8t1n6X8FYmmbEUZTGVz8m0gCXpUa50dOipxtvfgJL+7zrqRmSbbhb8c1Tv88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4iMsgmc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4iMsgmc"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso75594e87.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208945; x=1718813745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaKNd5i+gdVNaPciWa/D++J8qKGcN7FLtSQUh7AiY4Y=;
        b=U4iMsgmcHxnFMQKFtU8WVw92WSKfnIptJbp11d8m30gCwhg0YhS4eGcYVP+OLThvKQ
         GZyCDOLug5oAS2TZvewEnBJlY0RVapJaKnoqLRJciI1dBLQYA9P7iyT6FAkQbbA+eem1
         yNLl4jN6XND5m7f3kDhX+y0+e5fx2UixNzYC/7WSsTegKWzy3lUIywW0nyy4amieUw79
         fDGv0EQjd0l4sNqYfTTbHcp7AquWcqqm5P/zZ36UausG3lYwuXcwWoP2r6ZBOcSHm1n9
         DDYgmHiqnNu1sIaNeVWCyWGW5m0/VfY+ytcWmyUPMecYK5SO7T6OOsiwsBzzWMzS8REg
         Bvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208945; x=1718813745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaKNd5i+gdVNaPciWa/D++J8qKGcN7FLtSQUh7AiY4Y=;
        b=YPtn2ETLRvQrcRsWkpkZtTGRXIxmSGQhw3NxG5zEHI7FRidj38j5zBvyvp5QDU0cbx
         TCD1nAYYwlvSlMKo9Whnub0cTLgq58gbWm4kIHPmYSFG1lkgLu5BpRQE+wgvsnbDUN9+
         ceJ+pTsgp8zhgL53MEpOBWZqBbTlP7NynWi+n3MB1SU50Wl2cXVE8exns1emH7eraapF
         DE2XquVDC71xvvoplD6U3KGBAo+rajbzSSFlphRDjM4se5Lr87bdlVH+LeqEX6l7/XtQ
         5RWkYhEs2gUDCE2kmPaq6gQcgJfwpuIarBuPB3fKri7Cb+jhjdzaYggH9tYzf+erclb1
         SYCA==
X-Forwarded-Encrypted: i=1; AJvYcCVXqPYPtJdbuQIZJbo3sANtBfVQnHDJ5g00KKYP5wn4NC80ZyqahmjiMHqYyPaTXwhBwAi2cYUjVZQfk5d6pOO8GuXvyHpZl/JY9jk=
X-Gm-Message-State: AOJu0Yz32KT/qv9duLZUEJsqTZ/lPqQxxSgwBi0hLO4qliY4x9VVVHyG
	p0eyxfGCCjx1E83Jb+NkCIbL2+KxT+BUNqoM8EBZuDaCdEqaUIIjhc2nI6Z5YJQ=
X-Google-Smtp-Source: AGHT+IEzwT2wxUG76kYf4EvMc9Yl30u9Y8PGMPa0J3TjZNyfXgkujITCkQDy+SdY3WFDHmynS9zvlg==
X-Received: by 2002:ac2:4255:0:b0:52c:823f:2a10 with SMTP id 2adb3069b0e04-52c9a3bfbacmr1594725e87.1.1718208944923;
        Wed, 12 Jun 2024 09:15:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:15 +0200
Subject: [PATCH 02/23] ASoC: codecs: wcd9335: Drop unused state container
 fields
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-2-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TdNpNaj0eDwPSxq1ZGkE2FZQIvk+R7zfpn4gMLOjX+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmY8YBeHR15m8f+5MErlfvmIqZp0bmj+SsSf
 RNUS9y57USJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmAAKCRDBN2bmhouD
 1wL1D/4m9Z8zECPMaR+QlPgGunewXkoXk4J8kftoxOJj041f12JKBnLg6dCCKMumkStuyALj26P
 GTcjwaDvh8pZ5ZDQdWRsIkz0ybb+P/SV4w+fFivPV5aCA9vSd8FhFe27SR/cR5pUHdaOZbbCCwa
 7wdTp6mQ8vU/913MBTKAmIwvyRxxUYgizmDR+DCXgCqW4DXSiStrHVgWxNpTHGrr6y6FOOs5jHE
 98kKSF0cCcmjlSBq066h1hq5n6RdiAWXqQ09R19dGMGIVh/+2tBtmhqdLsJuOpJv7U7Icuj3+wz
 Nos33lpPPUdIP7fjGEsrCfjTEHwYm9XWH5lLbFHAiL02thR/RSmCITEUjr2wHXfitMb7/BwlXbA
 r5RSwDsmqyIJTBxg2Ai90wyi2k3OxY9Z1Wv2D7/8A9pInpnBnn1/4dRebMXHO16T5TeNfESqOqo
 r0yonRkAWKWERkv+/Uwcb8FVJ/axk3ruw6xL6kG00RORnksktUrVx82ugI08z7Dt7h2x2eL6GWn
 9JoeEUUWe9aJuMELV/BWAb2UuzdbomV7pXF6on3ZH4310rP2TBQda6pWWWKRmnLdb00KkTrWmZl
 OzoEH4Ir5kYhjM29ccF3nGwj845CsJGLXUivBinWBT2uxMvuWGRQmU8IKJYCHMSElYQze7OFE4V
 dI8DwQKo7I0y9Dw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The driver does not use few 'struct wcd9335_codec' members, so just drop
them for smaller code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 42a99978fe5a..60e7704e48d2 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -297,7 +297,6 @@ struct wcd9335_codec {
 	struct clk *mclk;
 	struct clk *native_clk;
 	u32 mclk_rate;
-	u8 version;
 
 	struct slim_device *slim;
 	struct slim_device *slim_ifc_dev;
@@ -347,8 +346,6 @@ struct wcd9335_codec {
 	int dmic_4_5_clk_cnt;
 	int dmic_sample_rate;
 	int mad_dmic_sample_rate;
-
-	int native_clk_users;
 };
 
 struct wcd9335_irq {
@@ -5109,7 +5106,6 @@ static int wcd9335_bring_up(struct wcd9335_codec *wcd)
 
 	if (byte0 == 0x1) {
 		dev_info(wcd->dev, "WCD9335 CODEC version is v2.0\n");
-		wcd->version = WCD9335_VERSION_2_0;
 		regmap_write(rm, WCD9335_CODEC_RPM_RST_CTL, 0x01);
 		regmap_write(rm, WCD9335_SIDO_SIDO_TEST_2, 0x00);
 		regmap_write(rm, WCD9335_SIDO_SIDO_CCL_8, 0x6F);

-- 
2.43.0

