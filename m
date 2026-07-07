Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD238228A
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401223; cv=none; b=kje7wJGRgoqOeI7cA7/RbI2qtY8XHhCsOGg/N3TvYQ6K6+3zINzGN4XLguBIz72EsuNrG6brW+vXroEseF8K+cJV6UQ37uUKx/0Wd1wS0dWlYA595n/557IwtL535uIUN8CtKwfjbl6hKv+TkgSCSD4saX46u2oMPxdhpdg0SLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401223; c=relaxed/simple;
	bh=vOc7TQ5vfBLJU8SHQzzz8AAZi3kNOaHPDwAxiAGdE/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUvFv+qBbNokYCOuaHn+fW01YO2LFIfZ6xSD1q45CAo7aGoI5RLBakscbg+UswxL7JFJkLqavwecOaAowgZbEhudUzE7jlM6PHkwCYxfHA8jGsrgjGb4qYVpKEry67rjMCgq4uVekpBXolocpWZlmeyfB1GSICFenQxduRxM9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3GHN5QF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3GHN5QF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8423f236418so2423750b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401221; x=1784006021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=o3GHN5QFna4qf5ybQ7bUyjqJ6HJElwLy+8xdnotmn//WOFoYl4QiZ6AqU6gdTCzKN0
         fzhWFDATc8iRzBYMM026Muw1K16Sj2GIiejgzUh5yuANyPxT6S+YNP99yTr70osd7MQv
         WxislhwRjS8JhQ989uoyIcDvf3AYwKF510WODXJvpU7RKW5UQg7xMjLjl2OpGJOBHFSW
         hDQzPf+EMH3Q5Hw/ObNCD2Uvk3OsdDuQx22QXQCo7Xj4Xol+8uS8eNN+dc119znFaVr3
         cbEiwWjiWnMUbKcFSy6LLZz2JLOX+BPB5XJbwgyNAsUhJoYMfstr8+Hql0Pcre45QNx5
         WXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401221; x=1784006021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=HMWRDvn7w+YxRpiam6mznfJs8Jxx7/hEIAAnMM7Rwr7YDt1SN/MzmBkMLReIxwsKGl
         U0b0S9aUSQgppwa7YhD74lqNf4dPheWo46mKr3Cf/z6EY0g1H8Kqt5vOYSDWJu8ul8PY
         4bIqmfRe2hMNLpnpk97N2gDen9A5z6qGzplMrsMBjG6ZBjrnGDYQWHquY1ePjxC5FVZm
         rNPE1YVtoQbtcmjxNH8YRGHVFV+f/4mfhWjDJrua+2rel/rp5A1OSnt4+me1G34rHOdw
         gmNVf2Obi2NI4vKQmGlPupl024XhomX2Mtfym+QCG/A+hIPZb4Bv+d9D++AW8r0N+jWf
         yo0A==
X-Forwarded-Encrypted: i=1; AHgh+Rre5mubaPbToGJdZK7E3A9cne/kY1yWIAF0QqoZdgk9OiN0D8XshBod6f3hfewoDGVWnnvaHjqBJIitEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu0deRpw8H7gOYybJQ2H3iY4pCFg2kB+4kmkqGJpLg1PWRBFZW
	/0Z4A/GRu2TkZIKRft8ODEbsWPYFKATzsK7XaQm5mDjOIjIXDr4I2fta
X-Gm-Gg: AfdE7cltycz4WxzZFt6VyWKz9zgQGX+d98VDWKPAsDL/y8CwOkPn/8R+JjoOvh2Mqw0
	vc2ulUpWDMUP9ooKzK1657FYbIqTxJ29Fa0FYEcUATNel3AgWBQlfMaPNhaf/65pXDTWTG8Pq8+
	OMIaTWzge8P0h/kaDEuUCkekQsXms8MeXnr5VXKURcY5Pqkt+t5BiHaNpmWPtGKb5HPDk4h7sdE
	qjA8ZnF64olGdV2LC184n3AxoRE7LvPXwvP/Pex5r4A0CxlxafYAP7M4hVcCq+sVUpR9B3kOa36
	z4IUOSqpB8KMNMzF5ASuDnHxoCxYwvVfFJws+RiMU0daPQGyZ/IkeHIPTLAdXbKnLN5LLYIdqbu
	+S2SbctWcZOHaOESO+F+8kdKkhoXtHCA7ZHhGxGHu3/lpDhI79SvcEnDkPBViKbkX6Uge+hcoV1
	j9cvso/TpMMebLsx/5VqX50eGbHtVjXpbOreiEzM/ZGvNYTKo=
X-Received: by 2002:a05:6a00:6f60:b0:848:2eac:bfb9 with SMTP id d2e1a72fcca58-8482eacc4a7mr1154620b3a.59.1783401221244;
        Mon, 06 Jul 2026 22:13:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:40 -0700 (PDT)
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
Subject: [PATCH v3 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:01 +0700
Message-ID: <20260707051006.20058-20-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

