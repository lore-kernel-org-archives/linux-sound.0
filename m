Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7DF45BD5F
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692557; cv=none; b=f2xrG2etAPRs1KQZ1q/1NLXHNNzWfFPx8c4/YsWN3HJguwYX6gQjnsyh+gLzco9PfXI/8i03ayWAh0EWaAL9KwO/SiDqWTdVAVG8kyrzFA1qUxVcvazRzfCYC/jw7DjDSAnSi8mXPhbUzclEievfhzKHE3yL16aCGFQQK+QGdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692557; c=relaxed/simple;
	bh=HwBnP5jMPzDPf7Fr6DP+mqDNQGTymWfg0eGYV92iBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l74sX7N2fQLUJfMDHrehjxQP7Zv6QDj4wz6aYcrfKXbY0pfmxdiwvnfsUh2DF1QTj9KqrcP7dob52H4oHzaX6YEapLgEjORyk3FTOvACPmWvsWqATib6uhGqB2oOcxVopOlRsqOpWqe4fxZCLZ99onj4aOOqULJUbYr+IwARfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGFgkC7U; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGFgkC7U"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bd445db39so181516eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=qGFgkC7UrjTo0OhpDSDj39jMysf2WjLwUOzuUEDBMwXJR0W2sFFWeVMA6KQVnzRj3b
         Z+g0KA3t+rHq4C95E2DI8DMnmUBHN3sY7tqqSR0dEOF0OD8/DYkTJYKiF7+R1xxHjpZI
         bJoORAZoRCq/t1SjKX9PCb7oni4ZsPxKE3A45Mp41cO/1RTTVkSeWD3DsYfbS6MTVZmQ
         cLSzhkbbTj/fBq65GMBYEEpXqObayV+vxrQARNwxfWpU8xH59BqyuGCtNDkif0OUYNdV
         fDD9w1aHw/Z/i8PyB0yGBvoolqvAqmYNmBOg6fx/cItr/a7UY28az9M/lwpQTU2IIPdb
         a9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=ldREOLr0qdOix0aGsyKabQXBWjQjAdYoUpy5VOGeuLKe1EUfTWPAk3EpD6oD9S8/To
         EfOTrgFHddtWhIpbv1udeGC0ioG/5Z7TEozKZkmG7YK53owYKqoaLqxXswia6FV/UrSg
         FR62+kr9YhySzMUEYovU4vBIcbF1EYrsfv/Q5OU9O20+O/YZBGL7GwjQWXVT/UnHtA0Q
         8+Fa8SuSWuNOIkNPCCSqqPzCMifBoxtrpZ4xBhmcWv9Vj1gPveCwuBdhh64u2WOTPn7x
         KEqmQW2VwhXeuKh23SkCgNHrXFq6KrzmTfwq9sooC2GtWlONtOlyYZ2y+Mj/FiDoc+Vi
         ntlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5J4yNKAfjEcRy3tlknEuOBea93olWoqLdFqTTdfGfGHFhs4s9CJ1whWDD1En2F6SUDXcJ73lKtRJ2jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEcbf728DbBsPZtr6OWD7Fqsl6jxNz0Nt55/F6T6brwHNyk33
	ZqVoVPUvahYOqFRZrZglYoogqUGiSAgOMKJZm6N4JJ/tVF6gqS2cWPfW
X-Gm-Gg: AfdE7cnY/TMQ0xleZXTvtbMOF8cwuwcTQE66Vy5wYp79+Tm6Bq3VPZbENc4pdTBXrfa
	aL9mcaCb33/b3LnhBV1EStL6Th8Jm2TVV43IBaBMWfNPEqrjoVe2woFISsoxBUE3LI8+0wH2S89
	nMqtRE4o9hIHwCtZ2iVbvOkZQTH0Zk5nghWDjzkcGVK6xdvinykbWgA86e7wMa1iBO/v7RuJ7Er
	1MxK8A1B2Vcs+oTQPzD3PGB93kxmM8LBRNx7TF9hijMxLImOzwhckeQ42jGvb1N1vulMQbmRSkL
	yANV+5cTJ5xocsXEP6AX8sWJ7hl1un5iLnc+R2LAR/fPwkFjwnRJb3hq+hb6RHsQ01yAl/QxZJx
	48DYXLKsbco7Ydi6/LhC5TGBTb3ekredKptjmZWShOi6G6Dfdy7J40P0TtapL6+3Yjitkl4y6c+
	EQhXQWA+rs37YiNazExkW1qMxq7pKZ4iWcUu2Xx4C1ZhhSs4w=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr689839eec.10.1781692547532;
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
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
Subject: [PATCH 18/78] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:35 +0700
Message-ID: <20260617103235.449609-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..7a69f79fe496 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1285,9 +1285,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1316,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

