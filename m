Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE9D37FF70
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401044; cv=none; b=lfDS2DLDsQGJJfz1T6VF+TAhmTwFjcK8q/TNPqBabkQEkNTRJgaZzsEWoSy0gViSbswMEYZcxN4H9XHZ1lVgw8vZt4XyOyEcoATxR7/BSVS4RU6A/JJeHgjuFL71yeVFetc/D0UamsxUkZx7IlmK+K+/3bCms5Gr2NIZKN8q86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401044; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocZLmcaj85Nz9v8pmPR+lP5q1gL2Z7x9o6tv/htng0YgnwjOxWSbKfsUsT2Ssk273PsSIbbm1OAJ+jJKCJLOve6xxz1auXZCpDN8OR8kMQvldwFVroP8tlT57wKj5iBrXYwF/HhwZyxHYRLpvbQM7pczTsp8UKzeTxUNpxuf86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl/j1QAh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl/j1QAh"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3498742b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401042; x=1784005842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=Yl/j1QAhv+0yKETm6dGwivRuhF3RquNL9XIlQvCquB65ie9p6sn7D7RNdm59JT3v6c
         71hSibtQYRWrw81hxQc0Gup6CiEf16TyASExE6IGlQUHVkpp1Ps3jEFgDj3h1KX4HJt6
         Y1tkQGRMuZGjvKA6R3wPpXKiU+N5QM+QvFZgwCCeCJYInTn4Igh0HKyAbwXS6NDVE+t/
         vnfUDY07gOYf1PCShVu7BPBauvfD2uLdSx5sJaU1oOWE2Hi8o9/NFi6a3G6yWT4kzAyr
         AGL9QtaHRRyw1t0VVaGk1i1FoHXhNVB/VURF2vL8pabn7OGk+wRnGrLEpk7RaFQM4wbH
         K89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401042; x=1784005842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=UxX4uISkyPAi3mpDrhygCisF6xKajeoH3lxaHzgXoUyNmQBbH4sEhkRR74Mkhs/OHG
         9B6OyfNmiBGcw5d8213WiJVlgou4cqjl81hp1f0BdGUrXQh2aaSQeZ4IgrJZQsAUUuFC
         FWqRwU8iqlq65yCd25xHHSIB1lRIvmuLfFGDqOwIJ/o2N8H1Sx1wLxYRHWjuQvg9jPgA
         J9s6+g52KDSx6uAgDBnbrlExe3F2jtb3EPwc+4o6qzujpIzB6RAeO3UX9xI4ZwtnAWNG
         jM8hrs1gGBbszhwcDRehTqEryF7bJKdqyF+542ZxaEkvlHjEZJ3GYV6eYZucKTGkBqKx
         HMWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq//zx9lvPvtybLSJcqEJaaXV2I+T6ALgES82NXeFreT9mdlHuJk3wjq/qGVgjYWX3gKTQcWympWdAWmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpQYMZnCJBZauomjJ/VNWXW/tjTQKvCXq6j+3OVIA5LxrQUEg
	Dj2BDwNYLjuYBY6zWmrfH/yTEVa1WW0e3X0pcGqpmyXgmgB34GqNWNm8
X-Gm-Gg: AfdE7ck6AxcJPaYVfk7aTAgPoWQP8ZnKFXCmbL9pNmqLCAPx52RJ19tVw+QpFQ/B91E
	YM8kcRNGP75ZoXqzZDudovc5W+kNanjBvNIim5ubM6IbUQEKo8ghwsLd36YBpp5n4kqU2Axk+FT
	XlnqYLOQc9749vMBIrVOLJU7qu5c6qJFX2jJhVFqj0slul2ZxjEBNk7OveYrSCwrl3zkjziMrLK
	drPdbKf0Q3DOKkjUd2W3n8EvOG130QwIuflPjEqoNVxgJU2VB+M++OJClIQ4z/JQ5J10REZA9iC
	Zt98hOYSUP0TlusQSGe9LP77kUrGriUa1VX1a0+gCUkhYr2G0iSl/AZSssSNifsPAB1dURzvdTE
	/FN5yMIYOhHzsjYr5MSGz4ADo55mh1VOBhnTMY5htyQCa1zsgPjiMfV08LRGKR8WEJlAiTsRCy0
	BDG3lqwOWxeAAu6R5yaTjhOP5B6a/rdlS55CblYon3SGoMOaY=
X-Received: by 2002:a05:6a00:3409:b0:845:d284:9dfd with SMTP id d2e1a72fcca58-84826dfe4a6mr3637636b3a.55.1783401041829;
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:43 +0700
Message-ID: <20260707051006.20058-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

