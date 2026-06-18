Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A0B35295C
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781099; cv=none; b=Ob8ydPFAq9Ar4R1V+ng/+vwRrAYrY+BPZLumVUpxP+Y7iCBSmFeJILNZN4SWUuGCraVUL5+ywwJ3K0O7jpa63j5pAu8IwzfqkIwkJwHuI7eD+QWpeVmNH3knuquY5QiluQ4Qp0vvO8/AL2dy8vH2508LNjvEJdqrZcwZQSPZdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781099; c=relaxed/simple;
	bh=bLW2D0WmrIkzzwlGmVFMlDfU1k3KJHtIGoz6p5efmEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V39RjaPHu5dK6Nn9OAJgptuVqnBou1wP5nVzWWyrcbhwmP4wiFr5o7iIUdPdgte/5uUXbhL+CtWnICkExjguNAmMDuXQxWhZqLfMzYUGTi2IXromK5KgYB44vHh6TrueFWQnwmcD1KOoogsHvqlkEFMCEWoiRs6TtNbX+3dwYhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvtxViAI; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvtxViAI"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8857a27041so368141a12.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=JvtxViAIrtPqiKTRd6qAd4bs04+pqRubMbERq4uNu2kIKnjF8ql8pKq9oC4DHvwTiE
         8RMzg6Q5AjA9geLCyvhezjDfFtYkLDNvruAeLGCsOuMRhfdNaS0OaVIsllSWwrGypcGs
         E7FROmas0Op5HrQ6bs3YfIH3qA6tgCkcpDcKfEq4Fwym7Odv0cGsY8BE9H2fCJzCMwI5
         Zq7MRajBouLKkmOfrxIk3NvfOkdBWDYsXAcaL0PbF0u+t8UPIGv+8Ta8gn4HMdWncde7
         JBc8KbQN/AcHlZd0QhtGraUpnlAvluXwJAoSNnPFaC2w4sSa64wDMfZdU7khERZVBqUv
         U8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=qQPQaN8MHhwrPIGHDIs6FijdiXCYDlcEzt1pNzBr9nDkogjiA1PwtMp4/RBI1L7yAC
         XJ8S2eA5oafYVgYrTxGJnbLjgximggZmeu/626PkkVjHtq9pKdpA/fOI+z4xkUra4Y3M
         9TcwEV8+0vYSlO5iq8MbWPtF7nCS3o9CNfZddXFHSQH7e/WlULK6QRZmVWdJWzhZ6VST
         3vHUeOpVpxTaQsKQpD8Sw+uE/x7b1mGNRzCJj2reYwuQM98mXZl5wlJy8SKICu/eG3vl
         wVSlatiTjz9tej5sH184Cb0f05mz134J0YBV7AV7VNfffno2iSEESA6pUkK6mkbIgEhO
         V4EA==
X-Forwarded-Encrypted: i=1; AFNElJ+CqiV1f3OL2iiJGKhkiEZ3IsJEF4Ctwttl/5pMY9dYQLRwKrobXdr8zHOwIIvgarOtjsa+uUeXWmjWPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/bfMprlcG8Vtkp+wwftqeOlU9qfOlmxc3/xfJu/0RH2zH6IH
	R5tJS69P5Cul584KXNE2sIP/HM0ILUOLiJOoe1qqX84B75J7R/+ThNuG
X-Gm-Gg: AfdE7ckmr4Ne4GckGESETmJQDVedwV8MKmNjMPKu+AzKbJvZoTpzhoBFZG+OViYGbpk
	9zyYJoZPY/sv6AiFWymcwx4w1Gg5G99LXjyBXJiNzJuKlFv/2x8Cj0tKLA5fW/oqKVK3DawFOPP
	c7HZl55ZT/0su2IoPV28XpSFVSvx9W4i4Xz43PJwMMIdfm8NTc+mQ0oHTW5wSDpf0HFFsqNAqSh
	2bUho6Hncwu8rrXFGjMxoiumyYUndbssoJOSxJtiKgxbuXem4hR/RDLVXqQMLO3tyGZPwnDyzWz
	hCF7NiOb0Cq7Uc2Rri6kYo2uhfGSr5xeRFUFtNNFCAajku0vKV7ZFNQeugmCKwoaWmH83jfVagy
	0+k6DaNZpt1sJbE5OU3rbrQKQzureAo7bPXJ1eMDoKH0KZtP0xgA55votnERwWM7YatPAEDCfR+
	CasqX7/DkhV6O5ftGMG4EUbKQUAfTDOdvNSUm9WWQUxQooYwI=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
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
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

