Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28F46AF19
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692580; cv=none; b=GvS/T5QsFjzVon1Ux8MVJlEJ6Q2BPbZddchYhSF5tSFCZcPN3g+fy8oOrFvn7gLOb+mpeMU8F9VYhrivqCY8e18H9Dvl1RzHSz+IA7N10+ih92089oyKfK7L4k8JEEHKRaVddJJZQ29CsiV7xnGonzfEk5cj3hC3iagjJj0dLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692580; c=relaxed/simple;
	bh=y8ow6yxkPBd9p6g+ra0bZiCZf15W/mXoZiP9ucube1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvXTpIGV3DjErhgCVEfqvwyzEPvQVGq/v2Jqv1mL23cHcJ5JteHNAVqtdJgSRsG9atV87CZom46Qshptih6kC0/jCBi3o/gTXvUm9qHd6HFlN8oTb0UXlpvKIy1U9NAxwHIxwLnwjO/XQJehjjeQ/gx5TYKIYX0uhGwgGNSMub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBukvJJa; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBukvJJa"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d8362a58so601791eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=rBukvJJavnwHKo3H/Bg9UN/15Rxbl3BQW/l67zj1Nbx+Z/FlqMl+WLu0DkDLFCug/O
         9FY0Vr6dhekp26bCf1D+OxXULLOmO7xTK17EE1m0w8GvgNDVpCwzoeK1BQHGqL1fYudU
         JoZXLMrZxvBhOGs0VI4TanD8caJ/4oQqGD9Q1StiSNfqKcW0i86nSZ7T4KAtmxG9fDcl
         WcQ+F8NVpx6Yh2blWV/HxykzaJpgM6swULAVnewzsrUWvAmHSiMoGeGS/vgRYKDQcRFN
         5VniePPFkxgruO/7cYlrtOxN5begiJG9Olbsco3oICrbT4gyvv7N6Nd1YUfdMMp894pS
         7y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=aejLti9MaiUjr2i53lEg/CUZpiErWaxfOT2az+/pfujls1x8VmLMv/lzFkALvW66EF
         y0fyH7zTnQmBBLgDWG/f6zBLnYf1tC1wJ9C/O2tJoXtwsjS/y0fTD4Mhb64W5rsVqN2P
         0cCKzJ1CCZt5vuLS+ow1z8Um6sCpXUTF5vW/51Pk2kppSfigTo/bb5o2ntXM1DVhV+wx
         q/5P+99vWhWxIZMlLQ8IjoyjCpt6tGjTULQzQA48otsoMUxMZX0C8sqn1lmgu7S5E0QE
         FwDZv7f64+0fu2Ij2pDAVsaunjAeM9g9KAxsDMLpnMZWTAEFyjB6KZntk8OASCgq+9W4
         dSMA==
X-Forwarded-Encrypted: i=1; AFNElJ8X3U0Dk+TfuZ7bJn+Bg6igHxgAUVtiqiDK3G9k1QyQWEBLhcs3CBtgbTz+rxJTffHgtBHDTYnZe6LU5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ35x+vso45s/1/QR5UYwwnlphZAltNNeFceJuPVjTbDb7COs4
	dbKDmVcU9IxlpNf+TgDUi0AEM0vpC1r2NEUFGOErvb+wZmRluOfbdgpV
X-Gm-Gg: AfdE7ckFCcnWCCo8mz8If+5SB8Hh4ETAFSuHYvt7cv3FFZ0fcddTUZFoie1wztkjVL6
	TUWDTnLhFH2ExzHdvTS5RcxyfniSkBRkkeViL7r17ggK5BhAZGXs1hDEhfubH+MTDw1lmVNZEXv
	QmOxU6SlsWxcb4wV5jSPVoJ5AUVvDdH0S11N+/ldjObTgZwhiNNI7uThc6qet8MrNNtNjLwaOgo
	8n5pCjbM/G2JEJC/kR4uaZ0kUQ8hkHybv4mBerH1x1NNO1nr+kWLjFWSooo92RciG8DN4kYD5JR
	4JPgJy/AJ7ODt/wX+wh3YXzMM0voTUiqKV6lIOHsr7NJyGTCfWdBi+zfJ0nqio8VzAdpBcjXhoB
	dpvFnyO1t0ApEbwH8XxpsAJQjG4g6BjY5nLtyOqRqo8twRxlXAV8eQWp8BIxXGYcA/dHmMJnUjP
	QE7jURzYAt0ETirm3nI+OhbXPBcRZ6QaJ0I9SdQb3kDnXcAw0=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

