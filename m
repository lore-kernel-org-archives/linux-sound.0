Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E20D3E6392
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963803; cv=none; b=fxawZo/bUR4q41XPdksRcIjncgGZOrnJXEcTLnZJxBe5A63KTKb94HVuKPjS4GocpfYcs4T0TAq7yhw8ckYOFGnHEK90qvBH0JZLp+cLJqEBSAIQBjoFGdVNT6CSGPlBSlyUShBpllVU4THcWMrK2FCbjIWlUWzwaC7/I/zfYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963803; c=relaxed/simple;
	bh=uv/yT7qHO1N52roMBm78ys1qAr6VsMBQrnpyFaIi6dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyUwpUc/AZgIE7xeDbrTWJe5TbbPWNAc4UFQWO07OF7EI+SOWmYmDb+jn2TEQcM4HFzZAhWQ89bbnjRsQjYXcA+QFzkmEPPgkenne+Xh6qDalLDyNlo1KSEIxupFd0uHvfCrKL9KETWowgRGkPuyAAu8chXUHZ1T+U0eHmgJ0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3fQN3Mm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3fQN3Mm"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2379651a91.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963798; x=1787568598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=W3fQN3MmOCpHYLwSB0haOwbbXnSDukEOpuSjFp5uikOCwSnObYXBXzes3QcIwsgajD
         cNT+PrpkVbjZnuoJteSG29VjafNVPXlb+2T4LNoAE6SgHjFtX7zhYvFmao+hVvwrPoIR
         Fu1q8s9gHFH3/viRMfORptmnI5V1i1rOPU/0e4/Uj/j3R4i1gbIOM54Smvuyqmr4IUMM
         y21HkNz4U68RqqUa3LRqlXXotSYkuWNjUkBvPR8yyV9dFMww07sGpOSc48I/lT2EDZQj
         KJl7sSLAA4OU3hmaWkB8nWeMKY7TGQQS2dN4zN+p7hNQHo5ITwe8EGHrsW4dHPBAIAx8
         GSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963798; x=1787568598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=EiKe9EjzOsbsIosXTVsgE3T3KxwksId0UAFcbbAe8ecfpI7BnAL1wiDwb+hARuAnj0
         mhEJySJPFCi3eU1DoW+Q/pZ0KlzTKWLKSYzPB0imj3h+ecjVMC4QVlTSfmASpQ7q42fk
         6s7DjmPuzP8rUfSX98INQgSeApMuIgV0wUe4RCCnoH9EFLDvQd7pS96M4Qxhp2tOqUJH
         MjOOSPK37hX1YZWFaO9XYca34XP1OdyTMwmdaK5yUMnPoJyyAZ6i3Lb9GmcrqqON69iF
         SWbjLxBvgfbFzzz7iLglSKlzXJXw+mlcbgE0rkIYsYZuCDgfMyQ2dE0jv7ha43X6Czfj
         JQcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSijPYUgeFFviITWia6cKjfai++oGS0BrvHdw2moIhfQbttSEOnI53ZLv3Thbhecp/zyP4L7rAW85e7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqVpJg8cqpZFRw/eiMj2aU2VTI9QHi4i/d1b/4+nCEcmfGKYS3
	vfz90iHCse4+e4KHD3j9xBOx7xiq7CHIDcqIvVRE/qFXLoaX28iK/eXN
X-Gm-Gg: AR+sD12bo5vO1Jo3b5XfDMxtBpz6hkxm4iaYmO7jdC7xZu6DFxJESVRBY49YG1AqntY
	gLKgROgvhkwn9F7+zOoutrJePwbLw97cPsFp9yNjEzU5ykIrOPbER8NDx6uQTf3gQFiTHKBkiAk
	gUAtz/kLnFciReKp4jN1gaApFnvfc1y5joSlJigg+qnnOETvFDhzPTkFUmHxxoMRPCErc8gPyE7
	P/ATP44WtQML5s8CFBjH6akQGwmgjiLAWfEbPJ0P4Y/B2wCNYR4qloMQWMuSbpmWgN0J53B6ocS
	p0b/0K4Z5TfkDLCHDPgGe0msGlmzjNGDUrn4XAL4th3OasmUUPhjWkMIXJC+nGg+8dh6KQOvNac
	0Pz3bP5KIyqFGg01c+BnKknSpLzMYYOszjg+N+YNJVkRANQmOj0uT+E9TG39HzXMNBlv/TCcOb1
	WNAypMTb+8WrtC/cAlMoVKc+OtfN3lO78/h9DELDks4Y9A7FZYRQ8Yr0mvInQZo9JZZ0TI92017
	qti1sOQPBuLtm/gONDN8Yt3cXoTR4bcBbXBY2sY1lyDVG19m/kESlHYl0NTAHvtNnZgtOLblWk9
	KoAR
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr26013326a91.12.1786963797943;
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt2701: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 17:49:29 +0700
Message-ID: <20260817104929.63152-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c  | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..3c5a76591ea7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1622,10 +1622,8 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 778a9dccfcaa..af833a8daa2a 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -366,10 +366,8 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 							= codec_node_bt_mrg;
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
 							  GPIOD_OUT_LOW);
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 84b3d6cd77a5..25ea3e274aa8 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -137,10 +137,8 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		goto put_codec_node;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-- 
2.43.0

