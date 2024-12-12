Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248044375
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964459; cv=none; b=AMUr9WnZB4EuV6SoEp+8fkRanA7JdPBGVhX8Zo34OHCEnpMxotMbRo4J+PVjtkWgYYqR8TxUKD8uUxHhIaJomLV5KvYY9rbRTsvQcgVLrws8Bb23vIxhNh2FTdAnHxQRYwuZubjwPgXOrPs5GU3+a4TgLRBYyQvlXTSXAQYqvuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964459; c=relaxed/simple;
	bh=Jmxl411WFIZqWVvYYq3LtnoW5zZ2OdPhG9ySRHWVXfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edJHaBFpMry8flmCPFwryFmIGMeV5CTrSKRUj6XJFT+dPTlLeJMSpVMKiG9WIs8U9BKwGoVo4CwMizhTpvXKISaystaJcbrquIBSqLW031fR21DroZpEx+zyezwYIXZ8QmpOjwIM4KbGoMupL7t4AFb1VIRN8YKsIAM7pL5HNjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjRDvb1F; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjRDvb1F"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so43725f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964456; x=1734569256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6kZLHzerZib3Tom9bwdP4TG475dJUZl/s7CFHt6iaE=;
        b=tjRDvb1F88wUHJ/B1IYOwB7PvHy/mJkMgF2zsbeUhIUU3nsIvflb8rzNEJUmc6P5/i
         1EIKwIk++vOrkhfXbb6aHgEa7+HKCcLHpKVW4ulVs+KW2z/xbXKi9jvBj2sIC+c8kPQW
         eXRSoT9zPjZ99r5shf8XVPDl+3KubEYtp7zZwugn+ZA6Zj5mgpyJNJlDBZ1M4cOMy+n4
         Xwqq9XoUVrs7jkk25L0FkfOv+lJaGULT1TSsEKBrVEmj8yIFiMOLVNzDqBw16A7ktTI/
         OcVYw0P6B79UGAs542zrBaIfoBPiUcjruhOnvcGMDB6AyAqYVIejxJz+/neu7c7i5fUv
         ugkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964456; x=1734569256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6kZLHzerZib3Tom9bwdP4TG475dJUZl/s7CFHt6iaE=;
        b=xNj1bG8fTp1lbuLr6bSs7EpwvCX4EvrzlduVCa0Zjfu+9L15WARKeWREq2VALzi/Bt
         Mzy8LGhGhHYrRCRPMah0KejtXQZ/OTt0DPoHbcdaLBWF6pQJ7pyNwCvgXwNLx3gw3vVl
         B5O02pAWlpT5GontdPBjeyKJu+zm2YceFG0601/zqvQQIVDGjH32pkT0/bPYXER0kgO8
         YzNnw2wobW38HWDe1+B7/LEcwd8SEtboOSIZx819270VxFj8UacYFc5w6ublrSSzE8fl
         wM+bZJz9ewTG1Gp+JmkQJ2bEypvG2rRFFoK3oWYTngSrmfwe3yTTFOy2ZRzGp68m+dCX
         XJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXviMZLPrp2GwHnmeCs8/1BUQfmHC+e91WMqpd2wc0B+AkOjdfSfFbn0prkSE+5YbTTpdTo0wJaZGCxkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NfbFMkBa03E/bcIsUkfi960yAhpJ7lLqqyBESw6ZZ5+8oINh
	tPN28hBkZ6Q26HHnRzI0zyT9+iFas6GkEK+zObE3hcc4nnaDuWM+7EaUtTA5Ukw=
X-Gm-Gg: ASbGncuAnVouTqyNeH8QvNhnxjek4li+QH4kPokXrJIYh44HMp4JiNbgRiRKzebpUSC
	Bqg9+Ise+vyTZHmurKQPu+VO0UpY9Av3Ax+q8dIOxJX5OSWpamFEjoesKbAVtc8IBEn6648/8sq
	f6vcyLtr4+KUvqg/4Ur6DX0hmdrYE7EpSz9PkhcVmKt9jp2e8ue/wYf+7JPCg6mAHJxGEy6QkOc
	mzNjWgdhzaUHcOFk2TK99DU1DZspysureUIgOOPvcwEqClpLqu9CE8CgYYk0RjVPlXONq5K
X-Google-Smtp-Source: AGHT+IEi1kamexVrbGthx4QEBUCr69JkP9/Hp4vgbpEuhKuOMH1s/oYcZgmQpyQA1HV0TbxjEV4tZw==
X-Received: by 2002:a05:6000:a07:b0:385:e10a:4d97 with SMTP id ffacd0b85a97d-38788825765mr825870f8f.21.1733964456279;
        Wed, 11 Dec 2024 16:47:36 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:35 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/14] ASoC: codecs: lpass-rx-macro: add sm6115 compatible
Date: Thu, 12 Dec 2024 00:47:16 +0000
Message-ID: <20241212004727.2903846-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rxmacro compatible for sm6115.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index febbbe073962..61c321e0f753 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-- 
2.45.2

