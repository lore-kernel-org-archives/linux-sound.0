Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705A367F3A
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801336; cv=none; b=CRjoyvrNhTRq70QS3kqcb+n2xDcBxY1VGHduu7Bhxy2+J8zzuh397pWARA1awwSuCQedmm3z31mLhVJj07jJWi2qmAtPnTS9PeTX2kFe3r5rXCWMoymLrOoZP4Q4Snbf5bUZSEIJXdDbPt7ik2HvKccLUV5STVhWYydMOvI8t9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801336; c=relaxed/simple;
	bh=vGG3xbNRD9aTcWhmHrqO23PJ1N/lJS4R0ZsiliefWlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppteohq17sxKf/lxl110F1Vuh3XGbi161WAcSrqPUXnzH57Hrh1CykF+y3t3URiQql9YECCPrKa020mg5hqdWwXIYJW/zPwK4RzWfabW1RF8oBnOnJlmotx3+d/7MpL7B6NTcL52sYYLxyGw+Ff2nfmtu9Z7BKEQoDkYOfHOaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iikW7/XF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iikW7/XF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845eb7b96feso1193329b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801330; x=1783406130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=iikW7/XFxMIYt2zCfY1OKO1XlDleR5pTxxM21X07QOl+ZdDlfS6BXSg2guTIYNIXAw
         vE7GvrjRwKPyoGBUigc/itaSuDgOubzczDdsw/q8czzxTFbSBG2FkJb0J/XoLD0y+gYL
         V/unBJJctmC3eL9xiV4k5QBMRvdqsOuT/G7afHnlj/4L4d+If8vvHQ+uRB7tXo4ouxVf
         US6NqYj78nKeNnHweZ09MwwnBgP6VzB5SBB2kJU3XPVWLUSso0nu5Yyt7NZEM4wA3Kzp
         NvbukxgTcBFShxwHLY0fip6Wo4dYyqMg7geyBhdhLn0lBzRh604NpRNSfqTrk2WTyWLH
         hYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801330; x=1783406130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=hWmpqcDN1NuIDDWKwU4BwWwWGKXO5s2rHZMzRrfbP6yO1+cQNdLlBbqIxn/pkyrwQ/
         jcFmRPGb8A5RUGeQPFPEjPS8I1KS/4MGwjzxCD6Eqm4dNzEmdrRgvYsw3iV29wseOS0J
         61EeVjumaMETTVa6KWimcJrZz8Z0drAQ6MFovlqZayQoMBg6sXbiQ06t3KpYfBE5pQbY
         CnVLciVVUcJDurMrZBM/QxHBhj/nyeb9sr4GEJxo6w+13Lx5Y2QfchtSLmXfrO4LsA94
         hQO1voMWlpCb1RTn4mooWSZa4bvIs/ssaWG8HBAtGZUJzaiqkdNk4AJiv5BOtXB6EmMq
         cn6A==
X-Forwarded-Encrypted: i=1; AHgh+Rp4SRujsfxk2p38e2MUliDpIhVqU3fzm2YTNsoThqMexC/G1Gdq3aulKE5fOh6pIb5Oug6S1Usw/bqMvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDy/WA8/mBH20WCwyZMu+fP/bzhxYlcj0OU7CSL6csg24uYFB2
	Uhqtrn/tkLuk4eZTGKlhVTc0bsSkb6/ISwm1bCE64eIyrNLkYy79r/Xy
X-Gm-Gg: AfdE7clUHXeJTt0UcHRu/y87EnaoFOjP7TiOkUweCYtzOYok91PaHPtOl84AMEp0A6f
	vaKxN1UHbiXliXl9ZjASp5QapTDYwribNSo6+oWjc/WOgG6M1T5DWTx59WLGS2us26+m3MJgAnR
	5InbPg2Q/XtrhCN17NnR597dQ1q+IzEttHApD3tepn5/Nkzuw4whovXmlXUwuQ3LSaUCgh6IxNM
	plajhh1s3BecAb702zYF/5HIhBtDL5DLmo/YJv5uBkhLiROPpkUTW9xvusgkBiJ1W35AylH6QjR
	lHpGjuPphs80uyJb6KEFxjizBlZtCsrfoLDqawyutZHj8BV2Hcpuco87DHgEL4GBqFSZCuEET96
	GPnqIsjvFnXwHXpTuCzvjuLnTexZCZcu+T4bL5H7XB8vKQFfflniXekFGA7dBUhruYszTeI0mAV
	DqgeDbTruGDSLG1zCZvzDu0UWT1G5GIWSrzpkhH95VpSYmBA4=
X-Received: by 2002:a05:6a00:3d04:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8479f1004f4mr1954813b3a.14.1782801329607;
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:25 +0700
Message-ID: <20260630063449.503996-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..e83dab0b7083 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -621,15 +622,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +683,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +699,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +724,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +735,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

