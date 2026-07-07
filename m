Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20C379C37
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401069; cv=none; b=IZU0O8vASpSROf3CNcyMlBjwLInq6WfVYu0QqwHijSDn+tPkpU+i+XWNY706Gc1lUi0MQ9PD3jjMch6ENtQQPh7tI/aE0cIMqJNQ20ILpb2nxNb1kgHZOlK0kPpGPiG6x1eXAhkOiXONTuGfEe7o8xraLouvcDim3sYSyYDflzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401069; c=relaxed/simple;
	bh=6FLcpNOV0G/lngFmbaJv0KBbbNvewbSjUbmrmr4SBjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mk+LzwUbYKlq7aottTMQdFGQ2oXRzmTn7nPliUPtiZrbRtgjft8cvVAIlXXL0d3z+bmzBC2t1TbXWYdoz3DEiZU3Zw/F0y6/Z2gunHv/BfwFZp6cDYLuMA4HxsQbYSxk+XCe0YdHcs/yl1ZQ9FXoDkue4ZjTDznBF5wT1wbsuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4rWt0b3; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4rWt0b3"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso4297083b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401067; x=1784005867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=V4rWt0b3/ptdFlqBgVd9Oi7ynTo3F9bpex5oYans1CpdDgaOThykDsrvcj0jyrHqMU
         Sk/LohdhCWnKJyhYLJrHQFTcbO8lAYISwKzW9N6/hMD5cGMDNUsxBhwfsoVlZ3h/4hSk
         kirX1Uc7UvcB0us4IgfjvUumgYnZ0MNUGcelgC2O9JunZxjT3ZosR7H8ndqn6KKNo3aL
         N+z5L2Dtae6IInuRV4SVXfbSM1AJeIgDwsnDlxjEJGC8wGem4nKOWv2L4c7ZlLIkqroE
         XxHYzoBZqOOCydDwk8IQerLaZ3+8PyP97e6KVD20kK4yTE/nUA1fWXl0Vc5i+CKxmYq0
         r7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401067; x=1784005867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=CvEB0Gauqzdh1FY4U69Tx1uvYwwUR6kh0zLw30R/PJ1csW9wvHhTj34jZfyKYxtnt1
         vruJYk26XuK/euL/Gmk5Q5LyV8s46rHjBtytLM26GF1idzwKn5/palL+VIZytRVQaOMl
         lSnAEYqpZvOMHV0KIr913W9R81Ce0vtEpSiKW9aK2glMLZMEdpAP13Gv7YSaMor557lK
         mRTjk/MfLOlQM7WLkxV8veV9Ppyr2QH0sWscQpx5j56iFbr34eMP+fg/7r5wY+32WU8t
         XkTr8D0WxfgIQl/7u3OyOJu1+OzEcaeRK6h6Uwd75lRKA+dlIXo+e+8rZxF0nzVN2JLN
         2CeA==
X-Forwarded-Encrypted: i=1; AHgh+RoGqMW6kzNEQ3ih9C9+xsSpnzbqTtp7QG0NqE7tSKrPz4IQL+B45JOQpf23TL5+MqSaT6Fpg5IzLSatHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AZ663ijvTwzSbTWEsWJzdx+BRlzW+VpvoMxI/OMjb0GrnSow
	4j0h/jkcmvAAvYt87IHR/0pzBGfppuTnVEgd4lMPplbpTVvpG9UHiTj8
X-Gm-Gg: AfdE7cm46cNaWKLgtg+WOv5XCQ3cNjd/Z0JJLsCyQmvbTghUsSZn4AxDJwwKcWgAIJu
	EnuKJ1PbHCvbrtctXb2OjWeXgYSzpZNGTfaQwIYGrHiUt4Pr56vMpyIA9JxMrC95DAFqqIvMlM0
	U/o8N/x9sUn71Qt1uhB3lLec7WbyFS2N79hvXcpXulGSrceDIx6mGUBsjU9RhyhuJdVE6wCGfxV
	qI3+OPsCNeA/f/vF6y4bGbhI0p9IosqV5Fv/bBr81GJk0o5Aoe7UhyQq/muaa4JHu/h6VlJgwUS
	IBlrjJPASgqjZ1mvxaa9/qaHFzMxTmkvb/hz1t6tuohZuQ5qHLi0kk8uPCc+aPcuxigu2pgfu5J
	o6JIBBDdfCgop4yJyvOhDv0Zgi1vCxfX6vWRM+iJn1zh8p2/MEWiJDeQrH5/ihCMCVg0ECF5Lm4
	pi7MKZPxPAo0EBkEaj5rMs4zUi6vQHksmwGfMXo2m7yfWz2fU=
X-Received: by 2002:a05:6a00:1c90:b0:845:c0db:3924 with SMTP id d2e1a72fcca58-84826bbfdf7mr3074399b3a.24.1783401067431;
        Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
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
Subject: [PATCH v3 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:46 +0700
Message-ID: <20260707051006.20058-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

