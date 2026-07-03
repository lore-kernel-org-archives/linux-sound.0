Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B6356764
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058103; cv=none; b=EX0PiMT8LFNyLynqWivba9VzFeMexbmlzpGBZQQ/O2L0K6dxNi1Lp6AKN5Ze0myj7JGlszLBfPkMYTbmqbYHAUWxWD2gaGntLaPYvreX4yxqjj16EIFTvCLBWTv8RLnQLG+GR6tY1TQJPANWt/Yh4DSdfeCsDK32yCeEmSFYRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058103; c=relaxed/simple;
	bh=XBo9TFWfRkkBDWeIBbEHSqFNAD+gQAnKPasD7gZlVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLRHK0DcKD/jAGYP24EFdHyGy5FHFMfMCv5w1PsQfVyZBWhktbOxkphyX7dIOHmy46Cj6yNSexwzcy154l0AbcgZLgGxGEWPjWMcDfaGsTqbGG0kVoCWGBkK9BJ0kU/5SivwyCv+T8ykbY6wAntPIUGvAeWE8bFFxyKuOUlIY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGgFf6vZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGgFf6vZ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso101399b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058101; x=1783662901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=QGgFf6vZdrwdDNChMnobf2S4peV9/DwtQW8lXeXorpUeUg6zDPUmOVrdbRdqO8EB1J
         34o1jrrji6NQfuQSUx1jGFjAdDVrsQRCbdEvLHXFI5Tiey8ctZldPF0rXLLUg3ConJE4
         raXmmsnznRnt0BvfFOggTZ+6EvCWBqPU70kDqp/FYXcvym+wOtlFsHuHAXMiIJ31gQFE
         qAJsj09ItPiqAm9DWqWH2us6tDB0TKSXhW6h619FvsDFrjaz0ZFaeaE514YsJ70poj17
         4rOKpJJmXBsw4cBmrwTZN57QHuFKYVUfqusedlFwRiL8MBAyiruxL7VTCojIg6QDXfOg
         OvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058101; x=1783662901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=iyjYqtmgltRtGgOFK9NNcCQ/krKLyN37Qx23ewHjGu7P2/DrWy+mU78UYUgk0kepgI
         dJoFFna7/+3CqK66rwfWmBmVur2il5+0ACqInOWQb7i4jlXmh/ZI91rD6FxYICuijhFU
         ygKIp88D/EcvLCR8rplv8BdwpAZlNyilIVQdiRVk7HVupXaazFu0izumpbgCFaBepLCU
         gQ+C5b+xcQIB8yvxAsrqqbeNdkgtOkDN8FumUFLIgFnbHF6sEz+YcYYcWzg12CBoGFr3
         wv9GDPuJ2aO+F/VfPHYEdvNbNWJj/XfoNIodTGvg76iY7dfSDSCTGcm+OU/VO5vjYI6A
         kLow==
X-Forwarded-Encrypted: i=1; AFNElJ8REBuEjCOcFWGWJY6iBX7/6XwS1Q6O+NkK1ZlX92JxBAIFBQrWRyh4aSRlEgPXORALp84dGJBZVOGR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaqHPtatxoGRTWfB0ae/c919s8OjDbw9GrEZiof2qm9deKeoi
	1Mec4YcYZc2Eg3YbU0MxQ7eh+i/ZG0WF0OGkIYGEmmvwrzhdZyJYgWmD
X-Gm-Gg: AfdE7cnyFLJVK0yTIPMoTVUJGjsQ6dw3aATqfg2ewlpXgObV5lIRBHruKl6h1Vz7kpF
	Ew3NZ2Vtl5XBFDnK7RRMNRP/cexPbSSljJBDHP9BWPL5Ro3nuRWWNwvJgfSq9Ty+HUQQTt6jKr8
	aEjqHWT0sZEYlBitiZY2OuFYfAvVhWMlgVpAotD8TYpEhCpRdP5EkX+9wWJjd2LfwRJrDYk3xxj
	FDUCE8EYqhmOi8bpbAliAzIPbjGBhswUi99E/c39eBh4IeOe9/WGWHN/CE89De2AeCqwKC0j4V2
	tITCf8bAETuXZCRFpItvUbXjSBC+kDlfTvcv7PjFAR6WJXZcFjK23wnlcH0D/j46uU0TkprTfIz
	FWKT/ksnD8nWauI6794spg6EL+zhDrMniWI7r9lSYD4gvXPXbHUYOWQUTG102T9uohfrBT2Zs1k
	dvERb4VirQ9L/fuoFbsxt5MGmNf7tHrjXNaqKk4VnZjRP8+Eg=
X-Received: by 2002:a05:6a00:9286:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-847c5140069mr7763177b3a.37.1783058101122;
        Thu, 02 Jul 2026 22:55:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:00 -0700 (PDT)
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
Subject: [PATCH v2 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:36 +0700
Message-ID: <20260703055355.244898-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

