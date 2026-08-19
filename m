Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3642903B
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134687; cv=none; b=a7bp68DcJQ1Od7E5rBMajDhSe8fd9X4AiM7xtTdZrEOk2yAFaIZgMVRTlSEMtgcSIrF55ElQLuvKIxJx7XBI45wk2prs2nda/vUIorIClVMOZSp8Xf2gxaK/3M7tBF5Yi+EuS4TcXWypLIiYKn4gW4KxDeHh+71pADHWKoxLGg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134687; c=relaxed/simple;
	bh=72OhJbn7ckcKZW74co4duZG8fWOdc+WwYXFeX4PAns8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8N63EZm8W1ocPyZVtNxB2fTUGT1b+lPiK0oYz8vFtI2Rv92P8EYq+EMzWEugr1827YVAnCMBk+KfpYTGQ6bnQjeANlJddz/bcwhCjpSEQoMg+tMSx3iV16vrS6iGVeQODIiypQtCYtU3lz8vo6rfGhy3ylyikoeZ06tIGePt+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Na5dr/Zr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Na5dr/Zr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38101f85591so1745792a91.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134685; x=1787739485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=Na5dr/Zr/MfdzV1KMr0YibfMORd7RTpF0b7w4Gl1oFO1LhfDngRCIQ5+h+jaDAJM9b
         l9CMsUArly1g94bTvv+CL9HjM3I1D8OvM2LQ81BToOdYVEiej3YxbZoFziJiNYd3JYjg
         hagdAQKk4abgoHyXK9eAa+/pp/P3Uh7R2X8Gs/ZXmiHREJsyiPP77BJ9p+LhA1E8q1t8
         txmv0CEuV6OYKsrhY6iAdxdXgWuPN7Cifkh5XxkDPtdD/m/9j2jqF3QM3b1uHuy4YYt/
         9Jphl8wLuOZDi6kFSWpKZOLc5sOwYoF9AtWOOH4IqQ6l4z4lZ1BbhW1VaS9tGTg0eu88
         6gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134685; x=1787739485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=c+kTlaG+WmEwZnRRpicaxAqbynSXfQhrYk60OT0Ynnf+wFmxWNJrVv6L51yhTTAs0r
         hwTwnyIyJFVOnVzpPt2hr1xseYEs70Pw36gbLrY64xtL5haYaE6YJmvjc7UPuWvvYpsK
         dUnTEcJ6SgcEOunbQ1AFONSkXkub1FByfE4vTsuyr0zA4JL0ikd964eba/yOEIexJ1e3
         3sYe58P4wogOX6SAPSQavUxeiFXbfk3SdpOxub7RwelBwSntzaeOySI8VFPEtZLxazoi
         q6hEAmZUJ2up/rPtLGXA2Ax+s1JJ5RfcylmlqwvI4ByDMfgcoznNTlRaxkoJgtN+9fL7
         X4fw==
X-Forwarded-Encrypted: i=1; AHgh+RrDZEgGJP9WpJoY0qof+ohQbE1DXIdSgfspihY/ZbHunsyjlDgiXswNdOW3uLIgCr5w96xGbOTaUzl3EQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mQDaKS+vHlrIGxNWL4bDlG+iihitvvw6mlDN+1wwkGVIFDnt1f
	FeWoMMuD8/EXbhwhe1bWsXRfrNDEmP6BELzhn5rSKa4lg4IxdG85PU2M
X-Gm-Gg: AR+sD10v8l3t5qLrDTq8rhW3G4oJqK1QKrK6fjmdOT+UTUyy+bdn/PsnjNoaN7F5rnp
	0M1Yeuh3fPO2JxVXXJMPu7HpOUFb7PqNL/9+uHkWuUIOKNPH3NFn41x5191hK87UoviVYtjYHZM
	A0mk9096v3LUVm+HLyCJUsjZBHQILNjU8CC6OTkctNeF04PUVf9A6CXXjWSEavAeTqvXTLUKfGr
	jDnbNVfvnyhxUMuqp4Ca7Ru7a0cezC1ifvn+NxeNIRw3Hi0j6p+g6SSnthSUov0l8HoTujLlRvf
	f2IosN0xLssdH31V+taX8BqH1ciKs0rgT6kqEPQmZWijr5G5YIQkTRiFaNMjsaTebo5+ySB5x+X
	5MOdOUnkeM73ZHDnQXn36EuquTZwjtZTggOtL6iepWezsRSaqnNKccZYM6okZQb/Ssy/W4aqob3
	w/wZrgmbmtCuFHJelouLV81MJP6j7w0ldqDU3hC1BYopU660fohUlZ2vgmNciGObQaNMiX30SUe
	5ztIm9MMjCdu9toDjgmrqapaUG2i2zJQo+JkfVti/EtjWGufXJUAzYzwiDRdUEkuKoH4lRIT7Vo
	Dpmw
X-Received: by 2002:a17:90b:1d0d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3957f8f8c35mr3775298a91.5.1787134685426;
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:17:36 +0700
Message-ID: <20260819101736.67632-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

