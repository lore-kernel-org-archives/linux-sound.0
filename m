Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658474;
	b=pE4IAPdvCwhrq/nVSUz4REaeAKkLeAHaLu+w4XNGY7tXh/12MBYAeBdCi6x4E7GL8oXh
	 +E2M+Y3SGRR++3Oe/nZWmVyC0EKdPyQfJmED4xzf4zX3SgUP7vkpe6oC7rZQ4xdc+fE/r
	 C40ONAU5VvLhsW6sZiBlZV1q/PrB13eaQWVF0guPzIlLCdoVWpGIXH5PggtL2x4ESg64q
	 FFtZSbibu6w+KcZQvOetU2ruvkjzQG0gG5QANqHf0OuA62VFgxt+JPRFMxoXd7Kr0s5gC
	 hGbCI5mLh4+NokgY92Z3eEr0Hjwu62SRtju6vBrArDBRqWQsCf2P1Ztnb7G1IBcsS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
	b=ynMg7m2zWiFuXfqPAPXTAMCykDQQ/Df5CEsl8bYV51Ja7gz6hLgggn9FzMWf08ELUJmA
	 pWsZItTayXMDRaI6xhpIxabbFMAFpYUQ9DakP+bWmmPtY0OsUh7lOXfp68RL1p8MJAXRp
	 hv33Hq98KiEX4N1x3CTJooyOmd7MHBc4MrhasMyJw9kVN1nxem7t2lk78KaNvAQvHcnYF
	 WI2c7ktUsQkVB/XhixltWla9+JjPiFN2H+++uSzlZdODh7+PrbHYLQ86UwgP8fHX21rfk
	 QA55K1qnkh8pqyVjAUcWXIA0E52m3nDBkYdyVo8vuzfnbOV+09hXmBtZbeDkOqslBKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+6T5aX1;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBC606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FBC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+6T5aX1
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso617636a12.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658474; x=1793263274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
        b=N+6T5aX1PZWcOEirFLBCnUdMk9n7dXk/tySBMjcZA+LdXebMm6TYHg83BlSiBmuOA7
         hE1RQuBihUwi02JJ01p9pZK54s7BBo4HX1xfZ1ezM1VUczkk4MqYbdO4fnn+KFn002Sf
         fAfObTp8CqkrV5+uk3s3W1wML0YyD1ZPuvulq+xtaR79m8V+kkALoW/22jzXkWeWrt47
         vHckyDjpH+qmwBiLkz6ag+h+t7gp4Zvynp1n6IkjSdhrSIeNQhBoiZ/dxrW8mWzXkFPn
         OxHzpRuf33prZVyBYevtKcWnzgm0ZxfH3XogRlynVvMJ5TJSsGdRucMS4dZ5CvpEOD/z
         G0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658474; x=1793263274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
        b=q/4wQNX7NRFVa9JfsIiuFyzs0BgjPvE9NZhQzwl4F5JJNDvww+HdQNbwC1CaLxoVSA
         079JmZhhzRdCadWKj/8QLdZDTmZEmXVtYaa7INnkS6Mq3TmBpSuxSnVuhDOGv9iOiIwY
         aC3Yk0B26PZZIu9LGlJz/rYQ+nlAhQSnX7PxLo911GOnrjzh1zIRNwcfZeK7vOQaIx/A
         8xwCbi15sHYacft5D1GzFcpYDOsyhWbqBrgHPy03cgdrluvOPkDwY8SRsRrLO2ZdEu2Q
         1g5f0jN8mbqyZXXGIYR4S6PWMghZCk/4mI9RBzZo8gWIElg2pC/8uFwYrXT73giODEZi
         lkfg==
X-Forwarded-Encrypted: i=1; AKwUvBzK6Engw+774Y+jmKoKOzzdH2tWBbytmrnzY9/HE35P4F4qrVL1V634VN3YS+Q51gSOnkSp1FdwDbHcVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIWBG0YAr1HwUN5Hx2BXzsDvnUEqftDifyBrYqG29wNeLHHABl4
	ZMcMTXwYPSNzU5A1xj2LX23x7ZSB8bKBOSci9qHYnbnF152trApysZrC
X-Gm-Gg: AYBFou2UG+83Uiat0d2wiZOKnPJRmaMbznLebLJG1t9VaElMeArOkpkF/QSKvLwaTyU
	wZ5ldpLI/OfOGj9cDXIH2Q33f2lDXMG7wQjpSkr8pvTfGoTqbo9NBOY+ZDu6KJ2kYCRXb2BJxdl
	ROFmDS8xE8DtgBX656BNaqa6mAw8B7yOQrGbVP2lKSZ5AS9kQcLVle/Oxo51GYqLwjVKFC+KZjE
	X/Ah96nOXwC0jSqe67SKf6Y+l3c/qkEwV98lK788j6jV7eIbjtnIGTnf4a18AAwL1Fmg1JllZz/
	RjEFhV7VM3XW+/Rwvf1bp60toZyICbe4GXIZgwpf3JUJKeScHuypgWbhO5ypdvKoovCnQM3WWLc
	II1trcPoCoTQGMFgn4xsWuGhTpgmfV0+cyFIh98YToGHtsR1lx/k0Rp3awGMIQem5WzTP3R/ok6
	uH8/N5QfvTnqqqdwQ9HBd08jXL4N8MJh2PvD5ZAHvTmRornFKKCjy56wvOP4pycc8dKKZNHJ0ME
	/hWsvSFpd0pvJDDOy1AbGTq23StDEfmRr/KnYqCVwTziXcFZopEa5+KrKbPzqgrfwHuLgQE6Kwo
	YYRu5xABXk14Og+qvMA4KN/FsIfOLKG6u49sCRnlIVJl5TbOGzeJijjhkfCKGBZPsWeBbcs=
X-Received: by 2002:a17:90b:50cb:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ad86f650acmr3855130a91.52.1792658473545;
        Thu, 22 Oct 2026 01:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:41:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 2/2] ASoC: loongson: Handle clock enable errors in set_fmt
Date: Thu, 22 Oct 2026 15:40:40 +0700
Message-ID: <20261022084040.31181-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022084040.31181-1-phucduc.bui@gmail.com>
References: <20261022084040.31181-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

loongson_i2s_set_fmt() treats all clock enable errors as timeouts,
warns, and returns success. This hides errors other than -ETIMEDOUT.

Preserve the existing behaviour for -ETIMEDOUT, but propagate other
errors. Also clear MASTER, MCLK_EN and MSB on the error path to
clean up the controller state, including when the clock provider
format is invalid.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 109cb61c6ddf..4823b89cab8a 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -185,34 +185,50 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MCLK_EN, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MSB, 0);
+
+	return ret;
 }
 
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

