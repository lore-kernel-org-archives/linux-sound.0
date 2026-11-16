Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826975;
	b=tzgY462Jor1OTuCsgFLjR7Hf/MmmGhE8FKxEr4jWCn9o0wbDoED96o1P6GdU2+SxACPS
	 6aokbIuqDc9DVRW90dcPtqZjJKVL4pGqWQtjm/jTFyyFn22SN65KMdgXitOFCB5utyOIM
	 Q6GtlaPee69TTgokxRD7QXLQMosL+w1qqJw4IL6b3Zqj5GC40gJR6AN1drRlachAaoMia
	 yPioysnMVFawdFlU+KJOBWIckoJ1EvYOeXOUN5xLE4otKBkJKvnVGFbPH5YtWNH30Rtlv
	 3+PNgfkPX0VFt6/SoVLMikb0eS8gpX10OJ4F6Ck29USZ510B/MfTgRaseW5Mv67RhWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
	b=J7nIQggr38w0SZQY3NtXNPfYPcapxzQDo1iibewga4QoDW34JBJ+eKHPjs2Om8sqVTfe
	 WLERufhQLgHevmKncFn+rKEbxYEe0XL9khznuSyoZs0FBHN+r101dHOKK9eqGxZNeFRmb
	 oU6Z9WO8VUVjhCIXWAqj6HLz1pg8099d14dTqp3TzeczgsJoCu4DLlcNhtIL5vgW8MAB3
	 Bgu4ffrX1+88QPnNqyb1BFDyhnjEfJpgSIuA/AKOhbdvD+DE8m98Wfsm7aTDl672KJ4ff
	 LoaKkai/yTm9JIxHfo0v27IcOfq2UV2G/RX49Yrc/aA5e0Xp41uuKQ58J6TD1+QC2VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMZ6RrSI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8422606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 11:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8422606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMZ6RrSI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so47361eec.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826974; x=1795431774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=LMZ6RrSImd48pHOJIHhBHVrBcPACVhRDjWCcCZfFuoZSScBeEnhHRVlK/IUeg98XyT
         RZdiiAT621b2taev2kFq5QdbyLw1uk1mQEYaAmEEJ3icRUESsp0tMk4yb8/dvT6dCq0h
         You04Ua+2g1vrOknhObEc4EPKrVR8qrqYNO8k1lAmfA2m4dg8RpqhIxpEHEaSpEBwwtG
         YnqYV319L0y+2WsPWUFYPhzEDzF4bQNpy+3BiHOo19mmvTbwTm0NKfuYBvZvJhcTjmfv
         D6dHV4jLSwHzUb7s4CbLIkmfA/Y17OZdIcR7bf6GJnctSW9IHLn/onUni5aIBS31n//K
         b/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826974; x=1795431774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=YL6+sdzMhqnuXwqbVPOFhOunK00KSHn3TleYRBmRGNYMsNpdTxS2+DnmHhhL0RHhtF
         7eIGA3TSjWIESietvpLmdIX3x6isbK5lUYtyw9BTJKXyFk5hQIbfiBX/P+AlFrKdwjS3
         jQzxSE9tEedvmwuAARLdj0T2O5C4vBnXQVtuyhweYaX9GHZxMYH8eQMJ+V4H2z34+9EK
         0NpKKWAf8/ix6j/yM30ydG0M89YHBt3umZS1KnWLZ2g8S45msPPGzHspk1fiIc/5wPV8
         JIwXtc77uK1NRKYXQh173vpsDx5xz5oZCy9PK55uwVPwJYjy1Q6SESqLidQw2r42Q8eu
         tRCA==
X-Forwarded-Encrypted: i=1; AL+hErEfx6FUpG4Kgh2R/KH1IvoVGUIjVtXTazv9TypnYzV6CkCkDfOhMK71XgTZi+qTHuIlZSWYG4SgOSk0DA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TJfF+k7y3RcbdOkQBLJsCSeU0MXjCg1XD1YWMyZt7qeuuwPjc
	BmKba2HvYo3uX6+KGf5quHfDd7VSxr+3hD0uNWe2k1rFdShNMZg/dvGd
X-Gm-Gg: AZFdTZdSOyorkekFwHSjPKx3qDhL40w4YVWOLZPUlR1+JzJv454cDxar/0KY1KGFZBR
	sQIA67DAZhhgTD/TgeNxjkqS5CsN/wEMvQgg47k8Lz0Fs3dwc3sU4/rULt2/u3SYcI4BryWslW+
	N2rTeNOO+3VTPFagAbh+BSqt0yiCcSiHLUpm5isDW8ykATHpUf8s2fE1UoUl/eyCAAQ0uJ6SgWx
	O2nYY+SVb8jEjF2PA9fHTR6p5LUtVzUHuVkd9KE8rGCoL0alruJQDONCc2gXlEW3rUZqQsGBiE4
	x2v5FVM1a1sV0bvs4OtXdAfz11PsaqaAv7DkEVGv11bnatIoo4FE10mMuOVYE67l2sS3sD2GvAN
	KrDFncibgBlkyUjlJMhq3kPJ4nNZkFc5ONMpLJwcEn/NMr1FMpO8AM1NwV8EYTWaCH5kMSAeJwJ
	xrllDnamaPykGdtnQxb9AOo2lIW1FTZx2t7YGE5NpjEwn648MLQEhykkmhJ28/bTRbwd47dNGlX
	+YpxJQDOLzBPPAnEsmhS/AdRL1lqRGWrjVblXd20bNoAW0czwnJikDQJdoJuwC1ZTzGkZwMB7fL
	jrk+oXVDmGbYxbjbQm8ypaynTPnbreXFTkcEnbC1ab8FBPimpxe09D2addzXevGjQdm52iMVPPw
	vRJ538V7Tn991YPkLtb0GSMmIMbSTRnZZrnYtH4GoKa0+
X-Received: by 2002:a05:7300:bf9c:b0:375:370e:f1ff with SMTP id 5a478bee46e88-379671238f1mr9906182eec.35.1794826973517;
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm51018182eec.8.2026.11.16.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
Date: Mon, 16 Nov 2026 18:02:12 +0700
Message-ID: <20261116110212.522478-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

busy_stream is set in hw_params() but only cleared in remove(), so the
"Audio Filter" and "SINC Filter Order" controls keep returning -EBUSY
after the first hw_params().

Add a hw_free() callback that clears busy_stream, to balance hw_params(),
and drop the reset from remove().

Fixes: 2ed1a4a5c005 ("ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 039b2eba0d9d..8b55d864f3d5 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -614,6 +614,15 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mchp_pdmc_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
+
+	atomic_set(&dd->busy_stream, 0);
+	return 0;
+}
+
 static void mchp_pdmc_noise_filter_workaround(struct mchp_pdmc *dd)
 {
 	u32 tmp, steps = 16;
@@ -748,6 +757,7 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.set_fmt	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
 	.hw_params	= mchp_pdmc_hw_params,
+	.hw_free	= mchp_pdmc_hw_free,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
 	.auto_selectable_formats	= &mchp_selectable_formats,
@@ -1121,8 +1131,6 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
-	atomic_set(&dd->busy_stream, 0);
-
 	if (!pm_runtime_status_suspended(dd->dev))
 		mchp_pdmc_runtime_suspend(dd->dev);
 
-- 
2.43.0

