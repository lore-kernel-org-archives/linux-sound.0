Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B02331A46
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 21:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473031; cv=none; b=OpmCO4xIoY+TDGIWNedvU4hI6lnn1syAgK68ORInr9GXURrvTLvgHsz1Q/WznH+DJ4C+vIhaROzpVsFNezZrOnMO6XrXevpTWSS3Pv3n/yDY5pYKd7FECcIyDgDUO+NCZ6i4nGOtLswIe1d8WN9m7xGaxamHbpC+THGM+TaPkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473031; c=relaxed/simple;
	bh=EdB6DPiN8FKeiio8Zju6nWp05TVS4Vg3vXPECqfqVio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJEjPDK9OxeukiBJbtYS9Oa5yKJ5b/2xxIm5hm2euZ5U7YiSvGx2P0NoJLVWrhAVVY880V85FtDrQU8+9ffmocH+bkYCaSrAe9gf9L8NmzGN/Ds8W2r2z/7if0elZBp2HdH6unUa+36JI42h6IsPG6Gk/T27henk6gYH4aBZb6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+WYWLBd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+WYWLBd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so2215025e9.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 14:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774473029; x=1775077829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15zkOITK805bj4kGcIz33FjQCtlZ3HG9BF9nSIpqkFU=;
        b=p+WYWLBdmsOSqKjKWYi3Yzecx7V01yIOrJlSXr7cX03kmTfdWnn7fSyoRJnAp5Far4
         1Qh6FUYD3c/3JSuDJyzjjxuEGwaEbh3lLdjMR/oa4Ag1Yr4C0dAcm9wrPenmNIeVSd91
         fDnj1HnqKRtBMQNF0YQzO5azaclLynlPk4EsoJWS7xrJ0T6qncRWaH8hj4JBxxH/bN7k
         x7VxaN4Cmte/isCqd/81y/AKYecWS5ExSWnHCGR0cyt3/B60ZG1xnDDYGv3VGLb1yIy+
         FUxo6cLVIR8MqKh/eFaCtJvKVY+IwzdrgcrUFxueoVzV5Kph/zrf1+Z2p4zu3IfV77eW
         fUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473029; x=1775077829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15zkOITK805bj4kGcIz33FjQCtlZ3HG9BF9nSIpqkFU=;
        b=bLvvlLKoggOK+isbCt9wlZCrOQnrTObCNy96SDkJeg0Y2fAiL7Muhcj/6JKojxIPcu
         UW1LXOsw26heI3R+nQ38BE90FXYVbJaODWH3q5EVow4bWKkbzIbnIi94/SJ0nx9ItiUo
         oFAJXNBc3tyNROlZFhqiNi2FLyS84oEYiNsBvHgWwqqRHFYgjPoogHYtXlmsAFArTjKM
         bY8jDJoGtGkJWPDUMeXFHIblNNarpXQfLK8QFyDr2tswdW4FZVC6ZYALoVCzMVf/zz0L
         ii+F3C7UrC9ibnVSmTQ9nUmvei244TiYWwkNTScDT/u0Uph4aKjWPOv4CW5PxH/iRcjD
         oLTg==
X-Forwarded-Encrypted: i=1; AJvYcCWCNnxq2DzZYhI6nKco3VqfAjI/7N9fWhpcD8Nbgyj6eEqzeUWyNT+WkYA1XU+RAtMfbA76ZI5aqGy4Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLucYL+xdNSR8uUhp4WH7ZzcSfPWcybq+s0BoYESW8Xxk4+SJy
	AdDZ4dxmyjGUVDRHhxSlUdv6c2GKQDIik0vT2NDqkUSyeuZ8HrEPTDE=
X-Gm-Gg: ATEYQzy5GljLGeh3/VQQwbh2VXW5rzG8FCC8OR964YCG7TyZgYQ//GmehDAD31JKdAp
	lq3PwrWgKq4G7PNp1dCut9i7I4TaaDBvto2VFpPq4nUenFlxdH7bBVkyDKAaVuImN9dtyASxBvj
	Ag5U2SS73SNLpr9kK9iDN/U09StBtAu7nllPznQNAQzSAerPlQrQT7gU/kC4Mrkga6CScWumSYK
	en/p6Blh2hAs2Bv/tJD4DpT8sH/1LedbaDmjTo1u8SWzO9kZQmH7oQX4VFnifGsSMHjt52csWNF
	KW9nW380Ij6uZrqAnqzc/eNsKpwBnJo2ED6LDufQfE/JmJ6PwD3daxoLXDuHn1p2bKZYhIsLTnH
	yjWYmd1qQGs7yrU9RInvBln7XlPr3ILT6KTg1cJLwKcMfhxj0dbcpNYmSJlRRF0j+8K804Jtmnp
	YSI71yilwLTds+2i76A044YPbBaD5r30vnSxQWJAlRUw==
X-Received: by 2002:a05:600c:3e1a:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48715fbabedmr66812585e9.7.1774473028721;
        Wed, 25 Mar 2026 14:10:28 -0700 (PDT)
Received: from localhost.localdomain ([78.241.70.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb336c3sm11673765e9.2.2026.03.25.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:10:28 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v2 1/2] ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
Date: Wed, 25 Mar 2026 22:07:03 +0100
Message-ID: <20260325210704.76847-2-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_set_power() calls clk_prepare_enable() but discards the return
value. If the clock enable fails, the driver proceeds to access registers
on unpowered hardware, potentially causing silent corruption.

Make adau1372_set_power() return int and propagate the error from
clk_prepare_enable(). Update adau1372_set_bias_level() to return the
error directly for the STANDBY and OFF cases.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
Changes in v2:
- No changes.

 sound/soc/codecs/adau1372.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index fdee689cae53..6345342218d6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -782,15 +782,18 @@ static void adau1372_enable_pll(struct adau1372 *adau1372)
 		dev_err(adau1372->dev, "Failed to lock PLL\n");
 }

-static void adau1372_set_power(struct adau1372 *adau1372, bool enable)
+static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 {
 	if (adau1372->enabled == enable)
-		return;
+		return 0;

 	if (enable) {
 		unsigned int clk_ctrl = ADAU1372_CLK_CTRL_MCLK_EN;
+		int ret;

-		clk_prepare_enable(adau1372->mclk);
+		ret = clk_prepare_enable(adau1372->mclk);
+		if (ret)
+			return ret;
 		if (adau1372->pd_gpio)
 			gpiod_set_value(adau1372->pd_gpio, 0);

@@ -829,6 +832,8 @@ static void adau1372_set_power(struct adau1372 *adau1372, bool enable)
 	}

 	adau1372->enabled = enable;
+
+	return 0;
 }

 static int adau1372_set_bias_level(struct snd_soc_component *component,
@@ -842,11 +847,9 @@ static int adau1372_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		adau1372_set_power(adau1372, true);
-		break;
+		return adau1372_set_power(adau1372, true);
 	case SND_SOC_BIAS_OFF:
-		adau1372_set_power(adau1372, false);
-		break;
+		return adau1372_set_power(adau1372, false);
 	}

 	return 0;
--
2.47.3

