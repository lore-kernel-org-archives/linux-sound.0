Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D7153804
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568718; cv=none; b=BYR3GyWeIRgAiAqmciUl54EG35WOEjOhHRPce1SAPVln5R54XFmalm/8SG+y5cP0AVyVviJMNprIDCHBivkoCqjLSc7reUjgt1isUevKJGwIzqamMoWnqGmjG4xF9pbt6wxR/YDyKmyNfpo4QZow0wQ759vemtTZCDFUaxEqPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568718; c=relaxed/simple;
	bh=ucYPMV442p30SxLxZMrLgQRWfuQy7jPceEvUT16eTtw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GVx7rsRDaddlI0d9oQ29NEXBbAC9uTf5T3Q2qI+MpYOPiyD1o5aotSUZ1G2W2vhz+8V0PCg4QeI0/VM22VrxMX8ScQFX5kRQzow3VGmD+fcs8T/zgLa6sdHRACiN+xyPvW6rkg16Z3tJpaXbKASXn/AbA1pbfwIt0ZnXD80U4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4UX/Q3F; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4UX/Q3F"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3674e1931b7so331575f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719568715; x=1720173515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnCrcRP7t2cWM1AO0t9JWEwOXAFYL4HbHcO1KAiAVOo=;
        b=n4UX/Q3Fw25r9RJRIiruRO34OmYaHSAnDVnilJShlC2vhOCgIla8fxMUxD77Hv4m2z
         WcDYjHuZQ3gTlZ41fcJFGkr6wmj84Rp6Zl/YJZhqkXsPkRQyYqGIB/f7ihg68CTkdJ0w
         9XNSy7MonqTt6C/19l1eQe7jV/6vYH9GuLMcx3RatAa7WE/QqdUNF/HOKSJXyOaZdgTe
         FNKq+ab0cWjx+zRJM33QKXbYx6CLoD+THfcvCt76/r3kQx4tEZRGIhPPrgeNTJLnxXFg
         vSsqMdJzSdt84CbKHqorHPBc5dvSfvrcroPJhqfgKd/MhCsh76Yx9nmF7moP3o1zi6RG
         j3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568715; x=1720173515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnCrcRP7t2cWM1AO0t9JWEwOXAFYL4HbHcO1KAiAVOo=;
        b=aDcDdfjwhbAUE8htEjlVGSgDF/EpSY0bd5z/eHHpAjVN1PHUtg80RImrvQH+5xLBeG
         9HbwEV+4xypALYTj2AoMvD/XbiQnK/i4aOf0+lgppBbVX2dvY3ATgGDXxNElmsKPf84u
         Qnj9spi31dhIKFVqW+7qbqHPNZdSG3r/3rhb8wNcNtxz/2W/O5eeI+jD4NMeRdtet2R4
         zCe2yJCXyvpjtB3YKM/aVr4jaM0GyQO0Ufz6ppzFP15iwNFIkHhKKvq6FF7N337mlLP6
         EYW5zf5ZPKCna6Soj2WDKre/7+Q41UTZ0CAEAQEPqVmdT40252qv0RrJkQ0+TMmS6ZQl
         yU9A==
X-Forwarded-Encrypted: i=1; AJvYcCX2noy68NUiXIEnCbhMPmVTk5115+IqCK2nP4/YMsy62EaXBJFTJh5x928R1dFbICr0meZuDl2XFGqE3N17AKm1OHceHq6E05gxXvU=
X-Gm-Message-State: AOJu0YzFlRXyCvENldWrr+Cf8elb4L7tf/DHEbGw8DMNuc+J6xOp2UAO
	F9R64mSdnSW2zxKG0NlG5NRSoTd+ZqGqI+2tHr2QmKxctR8zKZ2Td/dj6vMqKm4=
X-Google-Smtp-Source: AGHT+IGj5zErCya6zo4TRvSCsMgDrJeZu+46l03p6bj9wmdPmAbzwhqn1j9jubXkm8l8eNFE6EkAUA==
X-Received: by 2002:a05:6000:156a:b0:367:434f:ca9a with SMTP id ffacd0b85a97d-367434fcca3mr3973868f8f.0.1719568714852;
        Fri, 28 Jun 2024 02:58:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e13d4sm1760802f8f.56.2024.06.28.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:58:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer in probe() dev_err
Date: Fri, 28 Jun 2024 11:58:30 +0200
Message-ID: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'rx->dev' is assigned closer to the end of the probe() function, so
the dev_err() must not use it - it is still NULL at this point.  Instead
there is already a local 'dev' variable.

Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 08308a63d1b7..8d4a61f7debc 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3843,7 +3843,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 				rx_2_5_defaults, sizeof(rx_2_5_defaults));
 		break;
 	default:
-		dev_err(rx->dev, "Unsupported Codec version (%d)\n", rx->codec_version);
+		dev_err(dev, "Unsupported Codec version (%d)\n", rx->codec_version);
 		ret = -EINVAL;
 		goto err;
 	}
-- 
2.43.0

