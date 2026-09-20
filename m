Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D383CE4B9
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880229; cv=none; b=NMnpxUZFqx9SyafnoIpoeXRASn98fzyKR9X077tYR3i9BM+++5Ymp3qTBWswndydWg0DqYoS1TYVGP/a8m9bHjB3i2aFU7TGmvJIA741WEDy/s0gb2hZQFJ/sxNNe/e40EWOMJn2JCu+4RVCThALsywsW2P25QTJdHiAJsE8Dc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880229; c=relaxed/simple;
	bh=zDu5vJd6sfeXYn8zauBK//VBQImq8vA1wPLHgVDUDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWvLx7wnIn6Z4C+Zy1LNt8BcgB5KJFiyIIXSNsO/D4grwUjkZDpFMbsZmfuvUaMlS7ocRwx1qH9virltrdRxEeeg4yDhXazPV1xBq5O1tsxx9eERTMBTwW1Qrocstgv1WFI90R3+ZcZQBFBSZcPW87uy36+8uw4zCa0WijCkDD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU6ysIVy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU6ysIVy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6963865ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880228; x=1790485028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=MU6ysIVyzkpcx83zVOelibKJ9YkpZfJk1Lc3//btlSzrhnH267nrs1W6N3tbRHznrW
         1br5IJVL/iTxyB3f5l3g0WEhQ7BrzcDCnjAcOO5Y4JjOMTk2S2dXCKkrX4EiFgf1X8uD
         z8zkqhKi4bWyQkaLKc0qpjslOjkKjzyYpktBdHQcX55a9h00YteB5GjdMrdQWeDiuG88
         tUL2OFdirSbQJEvLlNIZmpSm2MA9kfc/NFpSrdpeWHaXp+oQyZYAUk1wbfi/b1R2ntqD
         Xr/xuflN99QCynIrXIIbNrQjBQNul7FFX9UsIRD9RUZFz11RaAaylEsxpOovwJ/g1dO3
         vDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880228; x=1790485028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=dDw0qTeqBqf+z32lRa/HJ/YXG19IY6paGaHO7vsPlQ8Qm1/CKi+SZfmXDn+BPPOidw
         TSoqhQv0L8kbBOCPz6YMTUbCEY02TrDXebyDiytUizY0sOFX1JK369ROP4EirQVVlqec
         xQhHYkgTM1sjcArWqG9iilfx5H3VOd5r5XBAfZJIFQ7lfjQ+pjO+bYlZ5ixOrYnMLG1k
         WFYTeNhJVQABQwSzKvKMYcd7sg4GdjJe9me9A8Cicga5+9/2glEyHXu/yHawx1MQ0WxY
         QoO05AoxG3+z52m91UWyTJl2xdpcKLZfAlFz9SF4Sqb/wmsYykyQzZwg9hsO3wDAoMsR
         Lv2A==
X-Forwarded-Encrypted: i=1; AKwUvBxIApJFXYqnFALuflTwGJ3QwvczXbnElE9UqjSJcjQonkZjJj/U5UuvzXLM82+KRRMvget0oqjKN+qvzw==@vger.kernel.org
X-Gm-Message-State: AFuF++mDfHvoQZUI2fNErSmhmwEZe0el/I1gjP+RVPv7SWROR9ztUNCV
	n0ZBg1C+c9HrFzYroF6UXXyh6JyCh+Qws7ctG8EsyjbbvctkcZ4IIR9P
X-Gm-Gg: AYBFou29Gh46oZFSjXbguxd+3doK2p2sRntQwALZ0aL0NV57w88sNHJm/HaUrCkZSOu
	B8v5LRZ31rXRCCX4qd9cm7HA8dGP6boPiX/hLNV1ZfqEjXmf0J4A7y20mZXgO4iL6JNuhYn/jD2
	MFySGfZGIj6UvKSaDt67sA58duoPv8gDF5jfNwh4yTP3ribe0v4RYRkhJyKCVsKIzYSiBQcZYDW
	CIMapoHJp8cqea6/vFMYOWlRZLpH0iHJYAQcdBl7D0ZXmzY05yCoK5BTgHEt3DT/SUVHUXtDbOm
	9otSiGEYzJD04Dn67GBMhEt2RKZRG1U7yQLsWjK6XTmGyU920Vy0wnkD5wGmZzRJPWrJYqpWE00
	+B0y61OQ73y6wDLW74bVvJGgTmf0EOhqWBLOcuv44BwsM9fB8hJhBFNv4rCbd0yRDjffi0ztXnT
	7C1rkmBUz8okMw3Lhj69rL8pYhxFrcNHvGKJpOjj6NrgnYr530GQNC0g2wC21kElCU+SvOLBACP
	1hPtP2BYNcewipjSWSBAwqq4AlUgpKsAm0qy4Zm84JMJC1J+kVcTQOJnbBvVgTyfqWMu/pxBRkj
	mY6GoM1a29fo6EJkSdgsSMVASJ7LyW6RbLdmp7TRcr2jeXw=
X-Received: by 2002:a17:903:1786:b0:2dd:c053:b9c6 with SMTP id d9443c01a7336-2ddc053ba3amr47265835ad.23.1789880227909;
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:52 +1000
Subject: [PATCH 13/28] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-13-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbV/kqyabeldw5w2j/zMmctyr9Nt7e4LXyl2qa2
 mN+iVsSHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKnWTGb4H9DXG5xQ1eBqtVFoYY2L8Brh1RZyjQeO3XsbkSDNPeXYd4Z/iu2mXVX
 qp19ZtQiuXdPgxaSWP+vVtKRV37rcbndO7dvPBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0

