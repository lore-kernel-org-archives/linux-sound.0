Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88E3FADFC
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145525; cv=none; b=gcA49YI989L4nTtqyu0drttfSu1NlNn9LcO/8525O+sz3LD69y2saGJRGI3vAnevQc6SEdNME84gyYCvV3l0ZqPkYxdkiOFqwiHQUUG0+xWOspw6DtAIdJGfA96r1Iarf0Bz4N+xgnEdGqv4/nzwic3D6WiNMhuIYXCsYLqb5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145525; c=relaxed/simple;
	bh=chor1/9GogowF9EJgZy2hFJZE1uubwSj8Yvkq6IYPwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mB9QkmlK39Ei/v4zjLSzVe8IzZpHENx6s2LVG20ozw1x6emJPQ+BotdC9ubErL8p7awFMMn9K0yO2aKxUZ4TcpfY8H0wQv/9XfWUO32n7UpJXcNO1foUMCR3cxNAKZ8s2l44Jp5Rzx7yBQiSyrKJHSoB9NK7u2NqO9QWLjmio7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCL9E72c; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCL9E72c"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1904100a12.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145523; x=1785750323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=WCL9E72cAQsIRNjlwUlJIEP9X1S6xFcHpli4ftCIUr0WsrcAc8EmvQeFOeotlqDDBK
         vshNWHBRQSGQHfiT318wOdodjByrg2T9+CzJDYjWhJK+9HGlkTcprcO2AfsETkVV0xpN
         +BJeU0zcQbKKyaQe5JaSfY5Z7waWEpIcUyc8FrEI3yF/sMpG/a2O8cq7LEJP0NHU/W4+
         tbJLWQzPeYdi0X19AfBEGrflqpss7l/VNxSbZ6kqcv7d5wj72M6yD3AoclE3JjL2soJZ
         4IDn8eS+ZFXKq/w+CB/rzKjkrwEmadyB3qvMnZPAGop5m5SXzaWW6asYOQJRFOIjmruH
         jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145523; x=1785750323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=NeeBpfEPlDElLOyeopfO/xwhhVD/xuNMHmF2dXGOY3atcVgfmKjKDLafiXE/tWH0fT
         ocnCsRUCAZUKZDabEUR1IMGPmsMQ7KuQMQDzSRAHOUPTLn2i+29EHz0Nyv0eCjV1lc12
         rfcka7qdeQ7RNB6hAJ/Icleu23PGC4NoA9O07LIMmF2oTtdtu70TnQVizSQAplBrjbHn
         NuRLB8WxrT8jTBTFElqbN4S1tJhzjypgAsGLWASl//8czi27pIaacxIZFX8IbC9nlYI6
         LEgOKTw2wBrbfeXx2bU27TbmSpvyRpy1pDQGKf4YV0b5gtPxZJdZ4B+uYPx+wnbX4fYQ
         cLuw==
X-Forwarded-Encrypted: i=1; AHgh+Rrze1hDu7+9/mgu5U96HJF5p8H29A3VKQP8TLKrcZu8AjD+FxWQaUCEiQUXDd1tdNaVsIKCQbXvyI2nVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMLLPKGGxUvcWZbADAlbYU0fOdOJuvYhUD1KO+qTvAUGV0N9x
	z/Sipe07uLOgXkvMOaGEyiWfLfy+zXs6U02IN5ZJ4MQ8/V5EwN2ukF8W
X-Gm-Gg: AR+sD13IpPjI6aUOkOHoUe9lM88CbK3u0ccQ+xCHjaij9lRFlafKBidjsD5AdmnB+1G
	pTEyL64RcUoBNw4MRaOLL9LW48qhuxEYx5BJUIH5yHMMzfCO00XkP2ONBWk7qBg7H8sMOfNaX90
	VaoLaOsZXakNq2x798h4AD9wQoHPQPjAXF8NhtmPbsWgd9UGmRfEDFNo0I76Z8v0RcViofv1QDR
	LlAFuSkVga3N7EvC80o2oC0wURRXXPy2OzMWkq3+Pb71ze9h5jh48a2mJny3HuA0dFcrq9MNGR/
	OuWwGNE/DNCw6o2tDG2+lsPdTmY5R9e6+eFs97AjFXGT5hl9cEpNjkjduNw5AQ1A7oKTxU4myQe
	G3nJos5fyVw7JbO+Bli8Jjv0k5vArDAFSkXbVw24EFtNjlF+stVi+je6JK82qzzRTvr2arnyj3p
	tAmUJNgwtcFVeXI+ou8ClDNm9UE0qmisr5p45WfZ0fyNfDzBbiYthskpA2Np+DOiWeKl+SPwh5v
	GjwfCTGDt/N98/vfkVPwg==
X-Received: by 2002:a05:6a21:6b05:b0:3c3:96a8:6878 with SMTP id adf61e73a8af0-3c67df06402mr7686162637.47.1785145522508;
        Mon, 27 Jul 2026 02:45:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:45:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 26/26] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:46 +0700
Message-ID: <20260727094046.23001-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 11 +++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 24a5904d8e6c..442cf9f3eaac 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hwmon.h>
@@ -1237,9 +1238,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1290,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 567861dd42ad..a367c94bfb4d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

