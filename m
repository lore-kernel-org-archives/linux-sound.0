Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8BF364925
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058273; cv=none; b=uwSX7cP+52b5cjQQXkeSuVCMbg1rzo4Qwhqp3kcpMJpi0QCE5GKONK9jWGW0tLv3SRgdBOizAup6QknKrSXqhJHl2Vys4E+LjRKa3OuwtFQ6ezzlhwDgEaKrrgKLlKjKOLQCCZQcLqeextmkVNkAFaJ/jaNVfe87q1Bmfm0fpXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058273; c=relaxed/simple;
	bh=MHB+vjFfWlUHNNfYgxS6YYgiZANX31/DVhBYct0rLOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+mlB1zHI7uZ4pwfYjv7tvPwX8Ue8x1Npo+ScwJLALHuaPADP8ACbFsUS9cb3Psm76WXsSnN/Hi4mtdCLmP8ot5/hE5KCtsZNqWKFY71BHRJi3ukoA6tbHbpZeRk3dHNVi2rkeoyBpkdz9P8HNpcxYIuDeGG11Vlk2261Ue3wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qup/mrF/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qup/mrF/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8471013fac2so166510b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058272; x=1783663072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=qup/mrF/HXUtS6Z0QU+2fBiNTsuGBaRBLM+D1DbTFrxlNntEc146kVJDg5/xqfqb09
         +9W9nLzJL7nr1A+36Es5UhyNO+ij5JfQ0iGjmIYAV6SX+SVGYcv4lM0tn6VGDnwhZiz7
         hgKkY6dFV5mZSMTBZXZCGkGLD6Sn/cd7f6loSRKStyw4AVRWE+ZkZXNOWuuTD3kr039l
         rxOtA+J89BD3F8k9Jb1GLfZjiWjCvjGsG+kz3A6mMU+xFbLNanBD+O3zptx3pC9EEIVe
         J0rQpuxW6UOyofFeX6/XAIjOqPHq4so03iYm+FdEdaTcVFZSU7cEhTmgB/ukZKqVgYa8
         IUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058272; x=1783663072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=oJI3hgP9VLfdDlL8kyWsomc6S//MQ0ZHlSH9G0YafkjKovi2ERfJGoRwSvCVDhPa19
         3/WeCg7njBt4lAdZgq99RZ1l3ZfoCISZN+oi2CumDqpkbHJnb1oAvErD0xSXon9yZil2
         0tGUZEtcto3u3zrcrPYxZupeIvTWHCfs2OSzUjQpxHbflj9EJBGVzmoPaTnmrr/GMxtB
         aoJjouWgn0WLJE2pFN0+LpFuDdORneCv6j2RxnzJGeQmES2y3Q11+46e2Q6ZDZUzUuBa
         ZrXExU7rMnRJDZ5Tbu9I3bguKV22/ss2z43n78whSfGhwHpqsClJZNMztfuc5GMhjBNR
         ypyg==
X-Forwarded-Encrypted: i=1; AFNElJ/uJoC3r3OriSbh0J5ZU0eQ+DjgCHfS7jby/mA4CL7iVn4qoENDbbZ8PmqkchyHQhELE5b0ELiUNnxJoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCJLp+3TOo3Sur9USaIwR1tSWxj9OzlYKIqBnut4mTBTdeTL3
	FgZM0MaN5MzhJVx5eS5Z3Yy28mos4wNrhZ2dL4RId105Fy5646KQUMYv
X-Gm-Gg: AfdE7ckmUutwDLqiIQiIvZvOcOUiD4huFpLFYhGKX2szMLqZbR0INAOSub8mxbvD8sx
	oUFUzXV+3GIJ4BTzZq+pwWorQYhtOHtw6esCWp8mnRVBhCZ+oA5WFVIv3Avr21HJqSYUMKcy7SZ
	+ky+TycJZZoW+aIlKweORjvLcc+4kKy98aYVJAD0Icb/z9ijYDM+YhxsVipfgvZriQG4yK+MpkB
	RQg7uV7ix1lS3IZnrix6dYYWlVBd8CvHo50BXsewpOERkAac+cSLQb7vjflnIhpZg0ptGmgN0Dl
	4IhJIJRA6TbO3eFrng7IkOOFbnqZlqV4AATCYAz5zZt6eDX1axffjc5TkAeGDuL/OvTXUjrpX+A
	JwxnMHFkLS7HR6itL5sQUJQfvOicjmcopYe8AjbUp4xf5CkOZK/rmLJb+31Agt2BIr5Yct2JKr4
	jlSW6f8PCHLXqLfnJtjhSkUpm+f9Wf7ThQNu+4PBepzmP0n8I=
X-Received: by 2002:a05:6a00:944d:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-847c068623bmr7752438b3a.2.1783058271534;
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
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
Subject: [PATCH v2 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:54 +0700
Message-ID: <20260703055355.244898-24-phucduc.bui@gmail.com>
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

Changes in v2:
  Removed the unnecessary else block so update_bits() 
  is not called when no changes are needed. 

 sound/soc/codecs/cs48l32.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..a9967771124e 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/cs48l32.h>
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -236,15 +237,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2241,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2282,15 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
 		}
 	}
 
-- 
2.43.0

