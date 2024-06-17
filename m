Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1EC19046D
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616118; cv=none; b=sV3WQ1Sw/3daW57ogFiwWRb8y4cYKXp2EAT3llZyrUYdmqxsxDyT0zukaydQ/lPUjEQJvoRxXW7XB1QsRSZdQuUAWJMdk94B23Twmly8xyZ51f0bPYLXADLSrFQik5sjX7XMKXyK3PkVUcm5bBLVLILKP+hMZknvrOhAgPfyBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616118; c=relaxed/simple;
	bh=xervD/akNAn+3bajOSvxHM3QVMxTAKhY2J5D0oWTDdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBTd+yqtZ3MPkMEsrKI89OcYOMyeKqekLjMrlxm6FIY3U2c92y592utq4sruRvjbN7i/3XP1L4PKLbVSVts24Js+FbQVpnzWKqJ74nLaJB4okPAlqGk2UsyoTg5EwH9/37DhgrzlPQ8pdMsUT08hMUQIQMYqvMiBAbB0i+PreuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1Q1oNn6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1Q1oNn6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso638750166b.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616115; x=1719220915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AL9vCWb26ggkgGLF0K/9fugVAtzgFV6EBJsc+Ci/VT0=;
        b=G1Q1oNn6T/Jaqo5wZp9huewBbTTqQ5sgGK5mtxFu/23kNNGA/qAyAOvKf5kRG1d/ID
         uTVt5qGULWTyBuoCd32RTaH460iyNEajbivXwA1dWdd9rHwZO4Scc2BYcwsUb/U5KclO
         6bA3g9p2LEb+4Oil6gB2DfPsY+V8W8LKYVmJB3mAm+Y9ySUk4g30AAQOSSBfkC1SZ7qf
         tAIA4eEP4hlbV99AKa+v6SO5YtkjYW70vYosdmRl/bAwLleUHwTFcaT2aOl5QfMMIsl3
         JSsnWl6khA+BPiSzrcSlrm/TzIXPiddKGqXe0edOoHAkU74+w6I5hhBsr9EYJBhNARp9
         jNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616115; x=1719220915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AL9vCWb26ggkgGLF0K/9fugVAtzgFV6EBJsc+Ci/VT0=;
        b=uu9dTYWTCNb0yMmchf2u6WE0iEsoI9lRw4Kj33vPqBZPfLcwydo0SdnbphIdQBZh6Y
         9KpWfN3DTdkkZy4/OGSN4cp07WN9gH5rS3JABy7gEd0hgQE5IO3VaP87GgEbZAhWy4Hp
         J61CG6Ol5tdUk9DVdNEBtCCpM8IOxooloC+A+bjCYasJ2uJe65V8x9WY6iIn/PGG3zqT
         XHmVi5suk7k9Sc8ZawYNj86/8QlkPpUe2bJ0frx+hXndjAKI/3uuDSOYhiYuivypdV6O
         yqSvjM7RL+2becbtkMxXhwDmnEvoZIRuq43VBGVvpe5QQCSn0VwFztzgY4+NdiwkFmBt
         6aPw==
X-Forwarded-Encrypted: i=1; AJvYcCUSFSDqMimXaRdjLSlzRPvoS7LDjLiIj5SXBzE5wle77XZeEkRsDJzdHWS2GBAsQl/zDaX979g7oUJiovZ9ngH/XMBp8teqtWYTssU=
X-Gm-Message-State: AOJu0YxNSQFltlj55ez/GtP2IZKU5tLxHPVyGb8b4mQR+FoFivWtb6U8
	PdvHNzKrTUiRqOkY4tpyCZYzgD3GbkY5+Xd3tkZpZ2Jrn1AUCHzsAj8RH/VwYco=
X-Google-Smtp-Source: AGHT+IFLPbl4cACD6B5wyibfTQu8bh5NfSr1rfSOwZYEb5WkGOlYQmmuS5S7vCodWDvRJd2pyBRJcg==
X-Received: by 2002:a17:907:b9d5:b0:a68:b159:11ee with SMTP id a640c23a62f3a-a6f52403808mr813822266b.12.1718616115319;
        Mon, 17 Jun 2024 02:21:55 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed359bsm497944966b.137.2024.06.17.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:21:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: soc-dai.h: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 11:21:51 +0200
Message-ID: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core ASoC code does not modify contents of the
'auto_selectable_formats' array passed in 'struct snd_soc_dai_ops', so
make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 15ef268c9845..279223c4ef5e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -361,7 +361,7 @@ struct snd_soc_dai_ops {
 	 * see
 	 *	snd_soc_dai_get_fmt()
 	 */
-	u64 *auto_selectable_formats;
+	const u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
 	/* probe ordering - for components with runtime dependencies */
-- 
2.43.0

