Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF484FB9B5
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977354; cv=none; b=jYIp7kQLllUNsDh8e6VZCbZRkrSjThuIvdd8NDXshkqT541W1BvNfT93dGdFOjWRKB1BmtqD2wCjqGESFzIQOYbb2k1VPfoFVQ/i/xT4Zycg4TJmIRRQc8NMfGCEG2QEXFrtsrQDKeED+ZBXp4roSwVMRrhQLDKlWzVsPqSyQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977354; c=relaxed/simple;
	bh=To5BF44wlTdm1QMgqrjm6gI9AMNv9JspjYZX9OK0DpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlQ1U3/qVr3LntFVszyEH/LY7gjtPB/1jQH+VLBZgmdNbe+e9ozxFjMR0ESlgLLTsOLWJ8EtWy3qpUXb4HFjdzUu9SPRNBbnOaY/DueM3rofy1mHNuOjQCKOuV7Tom1V7Ocs9xlbt2z2AqCP9rq72jHUn9bYcvy0Ax+K+Rpmx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+RQhTMf; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+RQhTMf"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso114663a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977352; x=1792582152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=;
        b=a+RQhTMfQHZcVNdemWbDzzaAer45m7uNNouux4yDKjCjXxr4F9ekpd4Z6aiGFputOb
         ZznxlqqIJVBCwGouA/hmNyqGdclWUtGm2XJnZ9FuyEMKYOf8dWc4H5cDVPC4NHH23csB
         RnAeOf3fYz0ZZPrzsyS1HkPT8Bf6db/wDU+9koXiA3/tUJiQ0+wRNpoPilRLtL3QiBNx
         JSRZ3spI2/QJTcdTc3loxavE7rAZmMcgJwRP1CYC5n0/k/aENfR/QTb3PUQ0STctdmz6
         NjlaDe14SwqchSd2vOLG1lMGSlWACFJLKCvilsF8Tro0COZTazKP+y9uSX0KxRSN4+rD
         6VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977352; x=1792582152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=;
        b=pdC6x8W34m9yVFcc37rKhw6pvCvHU5u0T7899/PerCyQzoQP3DSZhBYKnKsuSsohiN
         3m4eIJg/3gkTIOaBkkw77OqN2yRbcd8bPKUU5vWEqq7O5xY31vL8b80YBAIG3dNYYXLc
         TltrwCTTV7oi3DQC494SSvox7qZBs6Wzk7cMI33QSQcWcEt5vQKaMuXDaKekvWpw5kEu
         N051qJen6c3BKGjZgDYKU/8jiKlt5/Qu1Wp3e+4vVVXr2Cs3NJTWuB7/wVQpQbAu4XZE
         dt5iJ+dEuTKVmGWBV4JF41Duw7h7NxxQbSDuwNZKXHsxcYDtYSxU0Vg7gvd+Sv4Hvsym
         JVeA==
X-Forwarded-Encrypted: i=1; AKwUvByI4viuz/dPAevDwFUQZPVfwmtkWA3juKrwdRnRhRnKenLCn8yH2GrzEArBxL4AWbBHL1EvsHDJ7KtjIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjOrJaRJ57iyz9fL5dAC2FSeez5H2jfY362vhmnioBdb6RfsFs
	9+mY39Mbsx5GkTBdYBKrQsBMgpaXAt/Y8OPl7NpnD1om9fnDzsSzid+n
X-Gm-Gg: AYBFou2AaV8Nfs61HQtJ5xnwg2bFWe48GcqSuC+WyrXxhOKXVIOf5lnAtOVCibsxDMB
	8Kp/d5UnNPB7Mgv8OKFp568D1fMwNs9gvddijamKYosfhLUIze9FZ5GEol/uueMEdOdOW52l482
	iQoZOihK2zLemWibCOrOoiPsOxEK+sugH79gwrnrfbMEQHHm4zz+RNzOcY9v03nByaiElcIHxmk
	A0yd9/2L+N7T8+zvuqWciEnIw+dCTWGAq1ZKXwNZAiv5NB+b94FjhgoJohsdBIfqGIFJbU+IOwm
	G8d+Ib4Pdgn7x3vwFSwYX+0ijyzwRWXb43uUaTUnGDyZM6n4bopXphfJmuKXCAViyHSZGnGt+IJ
	B4tVsYJpe7X/fi0+pW6BuRThFR9Oxa5vjAhBtRYn45wdLw2XKpGisbuo3EZGHLbIGn6qXiX2fw+
	So59jyI1/NX7XcYaoFNJnDOPe6Gu+g6uDMMz+tq5BZHPsM+y8Qu3tRTYwSNdSN4EGgc6+A3IH2p
	kFXNYz/y/KmdtGBo6WOfLi3ZJnWBiTaESfNUojGGka5Xe5qbPN/SS3/X6mg6Z63HXVKy8e6zb6l
	yb+LizvCO7Bp5A==
X-Received: by 2002:a17:90b:4ace:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ab3a97a06bmr15237233a91.57.1791977352463;
        Wed, 14 Oct 2026 04:29:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/16] ASoC: mediatek: mt8195: Remove redundant error message
Date: Wed, 14 Oct 2026 18:27:45 +0700
Message-ID: <20261014112752.683032-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
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
dev_warn() and dev_err_probe() call is redundant and can be removed.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 19047887ee21..75d4d0578bcc 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3090,7 +3090,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3137,7 +3137,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3195,10 +3195,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0

