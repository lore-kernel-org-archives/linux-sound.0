Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17D364038
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058256; cv=none; b=rnLOaQORdrE570G5GjGLATXuB56E6fethNExTU/IQTi2DH2vXdAPDLSrcKSV5PIZCHbZ90KswfCdiEc23biV6MspXQWE/H28J4cVo87QGHuyclG+iNGklqFwnnF0YxBAesVUuGPfRpLFbRkk0fw3JulYTHfaPzNMenLKosClxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058256; c=relaxed/simple;
	bh=KYo49UuYbgBO1m14OgkhHkjaRTQZTWjIzrum4/tkycM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr2T2BYzbp2Ex/GFUmgPsr99ZwzF8vS7uF/ORw8l111smE0B07yAbZXt6F7ekedboeEgF3rU5uvBoqBbk3frSUz/CPfCC1aFvJfKbV9CWrEkMfejFLu1Z10xdp8rbQ7dTWQo3n30r9iP6gBQSy+FGUWdK5dutfLA/BPzGAGMLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBNi6GMx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBNi6GMx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847d1e9db22so215698b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058255; x=1783663055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=JBNi6GMxLBKeUB7NDFMnOFO1M+PSFBDz02rwgMHZrk7cW3TS+Px/kaGKLPAMIxt5sr
         s9oq/deCRzcYPrms9i345650qeUZl6ba55h8lWvwQc+JRFVLyX2iyqHjAkDGwkHGjbgH
         fyN85cEli0OdWtXCqYkf3PrXXrLXxU+14mRMzRgnpgvEY7H9IOZIhFgCi18/wkQjPTBA
         0mMfv2/d1DInhm7njDR8btWwHJKliU/mqkhzJaLFvcGT1utHRdfFwu6FI31ND8Aq0MWN
         QdDblHoYDv3XYe0WgAYbn2oKG49qnKyN7mv0NPFzE0LQIDhmpAiSI3kP7BVxCYOZt4oO
         /gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058255; x=1783663055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=RKVZjD3n2y9HVXplWuV1/uCjrmsTwf9gKJo3hC+TQg0VUZKtcWxiZ8I4sVD+9l2Ejs
         iv8uaDPEDSSDk49YLCbqeDtEQjsI7u/61a8mK6UJYNj4btnkr67/eyBX05k+zntIZN0/
         lYcQrW9ytxd4OC0ofSM56xLiMyMtkZAAY0Ji5qoK6qgbv0iYTHvD5YMEXNL1gOWE6z/u
         X/svUie0+sez12dOz/KTF6KZApFHtVkf0aBsQHaycUKp6kXVbNvFIoMIPENfglL0IAQE
         WwxMs2CX0q1R1TVwbVbYXk/fuUt+WDtR71OXQAoC/kGOxbyr7wYiMwNxcnQYrCUVbS3d
         fm4A==
X-Forwarded-Encrypted: i=1; AFNElJ/rrD4p/U0fvBZMMfovw8KxeGYclVed49iYCNrsFOsAMnWF53nY89LANfdQWZV5+a8fo7Neh1Gq6niNIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIFHXK1unlkJy4EouPMc6mbvK1PI5Jomfj4rjqFwHdACli5hM1
	y7xT0WbbUizeo1KHgcH2lSapusSG6qZFfuWGKfVc8oZ25Z7ZaEj1o6FY
X-Gm-Gg: AfdE7clTrwd0JPTqUJ1ObEfYogXbEo+ij3GxLsO4+Oa+GDYHwqyKjkIdZcOOF2+iaq2
	d5Nx6OKBvWJl0MpUi14j5DuqnpQ4tthiLf7dLiyBihMgfvKYlfvhPve6YvUA0wtnUwMlZSMBS8P
	jA1bITOYCpY6wsYlKHn2TZm09TW6aDf1HBk0ZzkWjzIOwoNv9R1NwvhubVvhvURUd2zoap3Sbdd
	u0ClMZ69X0BUrKPxWNuhEGp2gDXymu/3Uyvo5Y2mB6YWMIpiDpADkHr3+ZShDIyeXuSjCB0ithh
	fT5Xyaqkly3xr3SoP/oPkwG/Fqn6GExdE11710dFRPLAz+wED6WlX1zeNztJI4710Yi5/ZGhIYR
	9m3+bpKZnXoLInEMFCv7Ii3hO8lm2Vx1Ts82GFLPZdoKWDQfC/T3PhahNSnXYXjxokS04PWpT9i
	M+Z3EDmWwagKW3jlvpCkrT8XsDspcf96WzrOwaQl/GzECKUhReTXszm+j6Gg==
X-Received: by 2002:a05:6a00:3c94:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-847c074e0d5mr8733259b3a.11.1783058254709;
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
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
Subject: [PATCH v2 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:52 +0700
Message-ID: <20260703055355.244898-22-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
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

