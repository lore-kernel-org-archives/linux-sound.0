Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281944A730
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515206; cv=none; b=Msb1lBltuO5SG/S1rk7mQyEjraVjyy9m48nfTS9VAqyCGhgJycenwh0Lf9C2bGKZcP1OAPk01HOAu0snhmiB9lPko0gkic+Hmj2SYSBdbexVcLtVMj/v4pN0D8FFD3aRPE8T7q2+cPHUcajE+Lwun725y15JDknYQtmcaHrK4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515206; c=relaxed/simple;
	bh=7j86E9nXxZplFGdBXN+J5/NJOmhWhrCy33LKfn8VhNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6tUjf1AREB5rPNdLd1W0i6ALMClrHZcce5DVJNo9l+ui9MEHKI/BejX8zmv7XmYhFvZf11hwTF6pIf7DY/Va/HQ5dlCfrU2Md77YZmnueJpGF1qFZIUh7SjbbgpftxI5Da4DuW+o+KVcwQORJ8rVjZI4UVqdUv3WvLDexzoZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYA8hG9W; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYA8hG9W"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso732234a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515204; x=1784120004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=YYA8hG9WXuyoUCbw1x3GEYnMFMk+NQSiHfhrUj1OS5sFtLr3EklJy49A2isACarTIQ
         caNB/81jKk9atEakxi7ZF5qJcUtr9ZV9P/vwxwd68v82DD6prAJruXwcmFqTfzEV8cGa
         vQaMsuf9qk1B10P2wuqgyyAGDNqgvDSnu1X8PQP4F54NE8eyMX3yykFKbOLI0A0IzY95
         nZ9xKgn7+fm2/zLZsp2D+5sxmsjjM44qZLZAGbVS9Ayauo+6ZmnzmhjHyX4kOFE9wVV6
         wAsRe5m+q//VJcWAeSU8Plv611Cy2/Or+E7GMjmiGqzc8+3Rm+X/8EaiJ2jIVoOyd4HV
         UzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515204; x=1784120004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=FNs+h4s7mEh9G/Pwjh2wy2DH7v2L64niDLxroMJbM17jhUwiOaB7EC4+3SLCZcRsye
         Dchnl0qS3hQMC5z493KeR0crEiYKfws65KsZ1/89IAj7PKAPqSMY8hbjt2pr1nlDWxzY
         lFYwnuDF4k2npps21o39lp8xHng5MICNFZQPNT+TvE1yZnlgAWBG5LfBJFA/fbM83iiI
         v2QzdAhYhVHBUvyXmEKsQutjiQdz88lgsE28CDorcyxw6L6ypjYAljtFd6eglqMhmaN6
         bFEI/wJZNJdgAMN+O/0dverIIgDbB04x6xSEQ8OLSgnIxFRkMIdBgr8bdG2mUpChwwsx
         tzOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/PVvQJwn7pWyZUYPHW2ZZ+GOZtcmEhaCXxFnz0N443wNbAia/JU9IpoR/mre1vWa8alwRdcTB4Hki/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwSxJrEK1zFbWmNRGNUeHoamHomH9A+Go6AXt87LxAeX8GiK3
	XnDNl88pJoB1jDCV9JWqv6Al0Bx3SF9/TlMid51OylhJI5XS8MlKhmCJ
X-Gm-Gg: AfdE7ckX2kskJbBKxMhjV7vh1vrPZFlzI5MHi/xZECOb25dJe+gWSjef33Ibfj+4zGi
	P9r0jwnIyGmgF3fN9rXJx1HKjUV0kIjs7/hXkeaMVbOKNTCGsRKKkmD9cSUvVq1KMiJ4kJ0isDw
	brMPbvuL2wYA7UrWkg2kKphksjSCaaOUf8BCT+bKmL43Okn0YHDmlEKByG6s1XAPzi/+w49ZVh5
	SKiGoskJvl/ZLvaq5tYbRcj4JoolbW+mqJrIZvkggcyonZK/Tds5uF0yWieN4AscdIb8Y0b2C2t
	oMrS4rzZ+oUIfW/2TeeXJdUoUQTwayR8gPfb6e5EBpjK1j7DgrzXVXfqzkFeWZC1kGYvtRGXiEf
	dEE6BPR+3jOV4m7tqxFuiY2u6VBW5kNI64xa8HLEx4DK0ij9k8KRzyFNkeix91IzoNcp+7Uiof3
	W5r6p4MhaEsASw7KT+BoLK0NbaS/qvHPU6F16EdLB9joycKNI=
X-Received: by 2002:a17:90b:3d4d:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-3893f694c2bmr2441929a91.3.1783515204398;
        Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
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
Subject: [PATCH v4 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:50:00 +0700
Message-ID: <20260708125002.202515-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

