Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29BA43CEC4
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515066; cv=none; b=dqhxBWz585OJYfGOMSuF/y+lJEdspAYWObfyd6rZQp7fTUJqE+p5UsVuZeOrpND8aFIo73fWXjFS8+Fy8H71D2j+OWKECpD1/hq9ACYivskDnYonf8pGL4lTN1VfmnBOfwn9V/bMSP7SvJBNS91eTCAFiCxjw7ScroOY2oG+dzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515066; c=relaxed/simple;
	bh=6FLcpNOV0G/lngFmbaJv0KBbbNvewbSjUbmrmr4SBjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SU3+xUV4bNFw801+uYjrVXoQOOIYbprumpShLRLcFA48GQaYysKuCNSARkMpE+aFH1p5jIuW+YNZLm97ICpbH+LNjNJ/WuEyEG5AVYgHDfmM0o8IjdUWWqjei1Z1T092xf/wDD8/zHh6tfj6nXgfUPBI04QCB3+2Gd1LUgZzWjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeqotSNx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeqotSNx"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811f512167so805727a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515063; x=1784119863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=MeqotSNxzLi3c81bhe/3fjlJ3RkDVNttXsPmOJceHUPM5GgKa/wwN6LeIbREx8XDw8
         Htt3mAbCs4cwE30sMl/COtd9tgbu1e6dRlT3SEtI8GS65NiFJSlxE5lomV/bISlvwcPW
         LOX1GTrFnZMHSsM7Wl07d24GZyTXGYDkjVt5qj6C2ZqNe81YN35w2oEZ7cAH1kgvK7B6
         n+uF5eHubGCD2gTkrcSebERVPjKERmw6XIPUGTJweIXkDm+fUySIHSekSOHuMeO0LA4U
         q1+4W77yXPhcHz0dwOEz72Z6SUIKiGIF0Af8JsG5pEFySOl30pJMI7xOSBOlbKpswW/P
         wj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515063; x=1784119863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=Zm08tGwzYks6UDCmQS7BXlB7EzrsnniDDirKSh1/GMmqsZcO1JQyrLcwVQ/aLrxIaR
         /H2OuWgxg9cd3TG4U1lESrtBhl6anPmnyjtki95rqqEDbBRDpJNwonPlPFq+JJOOugDF
         +RAVYNe9zSabdWtun6fSuuM325HZieksWI6m0Ku+VL6eluBKZ1DVjcPTlEc0wCl17m3F
         uBF9v0bPHSCHVkeV5scApV/5Fk6wEZfXuKxu6VG1ZBy1ATcIugciwLzqzXRkeotQ7Pkb
         imMv5esyNG/4qnEBh4VWsKyHsCCD6O7mX3uE7g0Xg0u7SikoEFq7g/vitCanXjIz5vSZ
         I4KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+EhZ6dKLqz3q90Mn3LeJO5Bzx9HgQRciOrZchtmwpar33Chwj0VDEHVEFBi6IuprYtlmK8nObIgjIaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVplbz0yfsH2gORjaB5KVBE8+HJsomQsGrE+vrhFN35xQnwhXO
	BV10CdahWU67PTD5vh7nzg2YqsvgpjHs6batobEqyC6qzJGVIsk7GX57
X-Gm-Gg: AfdE7clFJMMLmnve5k9psGv4PZnXM1KpoY0rH5+0hjYoBNeg4q+mn/igGesBXEjk+n+
	q+dx2WTXyQ6jHHWG+DoYi0qglcq/zKLtfGoXsKtTDbSpCr/QTL8HP7ww4x1qwFWyOWTL4gElMqk
	Z7PtHVQRAoS/+qvwf9eKpn696AYRggxmf13Hda8othl1FY+jIBwT0QJxouoVmmovb/6YeCXAzbg
	ncqNmSofKy00Kv1Qe9QjE+HoQAc6u3VkRNF2RLJ/tPbFXdbSWl+8YrZxYL4ycA+LBvjZdv3oZmJ
	bcyq8Gy775VgOmvUN70DXMQiKCQKhZ4zUmL22Fe0s9L3V1sZ58BUwe/q3dJZkv1GYjDjoWE04+b
	Qj8N1ulQvahXfExU03Hc06bwhrYyd0XLpdrQyQuoCIohxfsR06y1PVaA5MKNDqPDdRh0sKhYgb1
	6yCjBI+8kVI3FFG1bm0OKHptP6PgQJo26EZ+0Do0va2hXo710=
X-Received: by 2002:a17:90b:5845:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-3893ff6309emr2450019a91.15.1783515062917;
        Wed, 08 Jul 2026 05:51:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:02 -0700 (PDT)
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
Subject: [PATCH v4 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:41 +0700
Message-ID: <20260708125002.202515-5-phucduc.bui@gmail.com>
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

