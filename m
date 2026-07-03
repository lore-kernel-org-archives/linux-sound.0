Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4635E1A3
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058130; cv=none; b=j7k/XjMsRsTCclu8Pzxq6l2K/z7A/sv0yXRCkdvGgvXUR3++2nIaOdMbONwfPIjTDjatTYTK+xiTeUBF0izQAdMYZv+nQ6dYqrl/dVEUhfoLmZlKN9NraQoRdL6EQy9uap7MQKJv97ENaHIQvbLdq6dYb4tka6GzUOg6cTYmTjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058130; c=relaxed/simple;
	bh=OqNQ0wtsuuL6+CNsnbsafgnka32swlgaGxVNsspVsn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDtxAtk3H81+mtbx5fQVBY3AiCxAfK15xvBcKYWpqyJx2YttjDMCQgxcVf1lB6yQ2oMkSnsMFIhIwzg44iartKme0BAdbbX9THSJA66fLbEaZ7q3gfJ/5quN9AztW4T7R49mdcO2uQLZQMzafJ78wGxebHiBM9rEj8FVq/4N9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA142nv+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA142nv+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so192988b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058128; x=1783662928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=PA142nv+m/6zq9HLTz2uyOvxD8lBl4aF7UjuMo2bHWhtDs/f4f6QbQBKuY6fDLToic
         RA0KBiYifbV4tYRpoPGS8gCMz+6y74ETfJRbZ70suFQHRF/QGnXq8bF5QelYg7gqOc1M
         1GqkB310jYDW6nDumaPUvt8WwXP1uUVvMTvow/Dgo1gnHp30UO6FAg065hmactfK4Ei6
         ULfO4H1SabG9u+c/7P4W2dus0Yd88G56/CWnx+9la6JsejrC8qWzEby79Fe1+AjoyAL+
         bBW4gEpEx1dY1tkUBGRtGK0ViTXc9IUtpbrO+P1rxoZd1btJcuSgfIno78LTBUcSeXCn
         +aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058128; x=1783662928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=cAes3eyYAOVtlxQRMKkzt9CjK3S6KD80fM9tlbzkbA3o1w0Z/OFu4NLrnlhf/NICWv
         fPZKT62aCOsdv9NivrxAOgxWN51Pd2XBU29eu4ZxYEPwUGMzYC72Kcy6ghcEhB1aBjC2
         vOK2VKDra0c9dOSnauKdjuiWQuhBHpbwwDUQFvg22uBsvADPRZq0mjiN9eLUJt6kOUwe
         VyYlRknLFvhuHGojizG843A4yMNlP+SIiOy6XoN3VtOcNahNZ89exjfC9fpMEaBFJuF/
         /fTeXvD1Cf2/HkjvdKMRMQkKddKgzAIcafBDaWYSwlmAwB4lS4+ncUXuRx7OzciEv/P0
         WwnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XkpyLVnwoZyk7+4FEJKiOGYskhwU1EpfFhLxXSFKKShMAyV3693G+Bnk+nT18SGXyQFCAV6G9Wzr2Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWKSaElLnqAwXQEm41fU+4y25ikeLE7sTOINLZwG7GVkowvOp
	CHvoXr5I0mNwEl5VXYrdFpw4lBGmjQsdj2c7tjtQF2QZB/Zw5YPEAGFC
X-Gm-Gg: AfdE7cnr3KbCB7AcyW9kf++US1Gf/XyWsN57Hub9r0ISupcPyivbuU5SghPPw194qI2
	Y2tJ/aSNELRFTwW2r+V7484cZxxgl9sCBsuLFplLCClp5LWM6+zfi4JPRjeufRwdDkVixWlzkKr
	r+U6l3CQaLmQzvhVqxgsYIhvv/6kdzhBhRly6LR8nEiao/w0dpgjApw1ND/reHtdjAMZvr+o930
	WfoGzkdJb1yYDra2h6M8cOFJ08dAcQMNQ9oCxGD//+OtP/A88w+CunueFXWhCkBGnm+ZTdXtAJD
	QDPsqTWGCfUF5rSEviwyvKoCHMkTlaxH9M8fgzdJxvaQXuA37rosnBvP7IMUpTRtcH2fUr6GjJu
	EQ9s16LXj+Q9/g+Ts55LwW7jHF9bNY/ddMOqcDCEjjnVkSKuU8ywmCJOcaKJO4sijG6BzvIfrVn
	XmfPzMBRZhM6OO+bPpS/NO4VWCQR5xhCcJpAcAAE3h7SYhmic=
X-Received: by 2002:a05:6a00:340a:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-847c09889d9mr7899560b3a.34.1783058128176;
        Thu, 02 Jul 2026 22:55:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:39 +0700
Message-ID: <20260703055355.244898-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..b931b8602566 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/bitops.h>
@@ -960,11 +961,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +973,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1036,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1047,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1185,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

