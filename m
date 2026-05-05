Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF523CBE93;
	Tue,  5 May 2026 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012700; cv=none; b=sHFu4Fdb+DpggD53SkGGbHMq7qxCLxjH8qBrOXGfpGb2sdVPVJGWc5IhViQ96GdBs6+d6LCvuBtJJOqDQPlH90reueOsNXeWxDv52yyoHT0zJAH4h+DtsAU/qV3ISfI9oGzfIgpZQmzu9PjFVo72Tn00ITfHRrUc79yTVWdNspQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012700; c=relaxed/simple;
	bh=RPLbGSaE9fK6W+hLR2tVvhlPdS/IRjZSLnCkOBHVBE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ERhmngDBAJT0XnwDPCPDBhHobdJ/AiJ7bUAH3zCIZLD6XSyq41QVbhIb9t/72IQxplvGbb2hNbtzygoFMDDmlb3XSmBhWkQ6IM2SigR9C0aAME9R8LkzXMVdG/pQm5CGGebqpmFxrIaiYydfmSAI5lNGhOUPbDJoQBWN0U/lXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRxh79Rq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRxh79Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC596C2BCB4;
	Tue,  5 May 2026 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778012700;
	bh=RPLbGSaE9fK6W+hLR2tVvhlPdS/IRjZSLnCkOBHVBE4=;
	h=From:To:Cc:Subject:Date:From;
	b=VRxh79RqvDUMWVTE4B7/c/eAi7o9E5k1WDOypwV2Ud0rVXDbbQ8sgxsMVaXjPNNU3
	 M8pTE5pPX/CfmRhnYfDv9VPZ33two7TrV0siW3zl+wF2aXdqplvn6D8HtSsw8sPUqe
	 r+/TUIfp7YTwxjKn7y+ibKOyyvTgysyFGUtiN6sD9ogR65GOcmd9ddklny2tjMVngd
	 6nv07yyJD8/VqE21OisD1piMYQkTF5GY1RmPH1J8luGm0uwF4sDEc8V8oBlqKqUP+U
	 OWtTORqBkp1iFsCVhwBYlAxd5Icuuo6zK7DWAMX7vMKnKY1WdGU4SjHKyedGs2SFJG
	 98Exx4ydMdwcQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/3] ASoC: arm: pxa2xx: remove platform_data processing
Date: Tue,  5 May 2026 22:24:24 +0200
Message-Id: <20260505202426.3605262-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Nothing ever sets pxa2xx_audio_ops_t since the last users were removed
in ce79f3a1ad5f ("ARM: pxa: prune unused device support") , so stop
passing it around through the sound, ac97 code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/platform_data/asoc-pxa.h | 21 ---------------------
 include/sound/ac97/codec.h             |  5 ++++-
 include/sound/ac97/controller.h        |  5 ++---
 sound/ac97/bus.c                       | 26 ++------------------------
 sound/soc/pxa/pxa2xx-ac97.c            |  3 +--
 5 files changed, 9 insertions(+), 51 deletions(-)

diff --git a/include/linux/platform_data/asoc-pxa.h b/include/linux/platform_data/asoc-pxa.h
index 7b5b9e20fbf5..7df78867db49 100644
--- a/include/linux/platform_data/asoc-pxa.h
+++ b/include/linux/platform_data/asoc-pxa.h
@@ -6,27 +6,6 @@
 #include <sound/pcm.h>
 #include <sound/ac97_codec.h>
 
-/*
- * @reset_gpio: AC97 reset gpio (normally gpio113 or gpio95)
- *              a -1 value means no gpio will be used for reset
- * @codec_pdata: AC97 codec platform_data
-
- * reset_gpio should only be specified for pxa27x CPUs where a silicon
- * bug prevents correct operation of the reset line. If not specified,
- * the default behaviour on these CPUs is to consider gpio 113 as the
- * AC97 reset line, which is the default on most boards.
- */
-typedef struct {
-	int (*startup)(struct snd_pcm_substream *, void *);
-	void (*shutdown)(struct snd_pcm_substream *, void *);
-	void (*suspend)(void *);
-	void (*resume)(void *);
-	void *priv;
-	int reset_gpio;
-	void *codec_pdata[AC97_BUS_MAX_DEVICES];
-} pxa2xx_audio_ops_t;
-
-extern void pxa_set_ac97_info(pxa2xx_audio_ops_t *ops);
 extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 
 #endif
diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
index 882b849b9255..69b404c354f5 100644
--- a/include/sound/ac97/codec.h
+++ b/include/sound/ac97/codec.h
@@ -108,6 +108,9 @@ static inline void ac97_set_drvdata(struct ac97_codec_device *adev,
 	dev_set_drvdata(ac97_codec_dev2dev(adev), data);
 }
 
-void *snd_ac97_codec_get_platdata(const struct ac97_codec_device *adev);
+static inline void *snd_ac97_codec_get_platdata(const struct ac97_codec_device *adev)
+{
+	return NULL;
+}
 
 #endif
diff --git a/include/sound/ac97/controller.h b/include/sound/ac97/controller.h
index 06b5afb7fa6b..d5895ea3922b 100644
--- a/include/sound/ac97/controller.h
+++ b/include/sound/ac97/controller.h
@@ -62,14 +62,13 @@ struct ac97_controller_ops {
 #if IS_ENABLED(CONFIG_AC97_BUS_NEW)
 struct ac97_controller *snd_ac97_controller_register(
 	const struct ac97_controller_ops *ops, struct device *dev,
-	unsigned short slots_available, void **codecs_pdata);
+	unsigned short slots_available);
 void snd_ac97_controller_unregister(struct ac97_controller *ac97_ctrl);
 #else
 static inline struct ac97_controller *
 snd_ac97_controller_register(const struct ac97_controller_ops *ops,
 			     struct device *dev,
-			     unsigned short slots_available,
-			     void **codecs_pdata)
+			     unsigned short slots_available)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 15487837e894..a4d230a19c56 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -206,24 +206,6 @@ void snd_ac97_codec_driver_unregister(struct ac97_codec_driver *drv)
 }
 EXPORT_SYMBOL_GPL(snd_ac97_codec_driver_unregister);
 
-/**
- * snd_ac97_codec_get_platdata - get platform_data
- * @adev: the ac97 codec device
- *
- * For legacy platforms, in order to have platform_data in codec drivers
- * available, while ac97 device are auto-created upon probe, this retrieves the
- * platdata which was setup on ac97 controller registration.
- *
- * Returns the platform data pointer
- */
-void *snd_ac97_codec_get_platdata(const struct ac97_codec_device *adev)
-{
-	struct ac97_controller *ac97_ctrl = adev->ac97_ctrl;
-
-	return ac97_ctrl->codecs_pdata[adev->num];
-}
-EXPORT_SYMBOL_GPL(snd_ac97_codec_get_platdata);
-
 static void ac97_ctrl_codecs_unregister(struct ac97_controller *ac97_ctrl)
 {
 	int i;
@@ -337,7 +319,6 @@ static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
  * @dev: the device providing the ac97 DC function
  * @slots_available: mask of the ac97 codecs that can be scanned and probed
  *                   bit0 => codec 0, bit1 => codec 1 ... bit 3 => codec 3
- * @codecs_pdata: codec platform data
  *
  * Register a digital controller which can control up to 4 ac97 codecs. This is
  * the controller side of the AC97 AC-link, while the slave side are the codecs.
@@ -346,18 +327,15 @@ static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
  */
 struct ac97_controller *snd_ac97_controller_register(
 	const struct ac97_controller_ops *ops, struct device *dev,
-	unsigned short slots_available, void **codecs_pdata)
+	unsigned short slots_available)
 {
 	struct ac97_controller *ac97_ctrl;
-	int ret, i;
+	int ret;
 
 	ac97_ctrl = kzalloc_obj(*ac97_ctrl);
 	if (!ac97_ctrl)
 		return ERR_PTR(-ENOMEM);
 
-	for (i = 0; i < AC97_BUS_MAX_CODECS && codecs_pdata; i++)
-		ac97_ctrl->codecs_pdata[i] = codecs_pdata[i];
-
 	ac97_ctrl->ops = ops;
 	ac97_ctrl->slots_available = slots_available;
 	ac97_ctrl->parent = dev;
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index a0c672602918..b0b1293bc849 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -246,8 +246,7 @@ static int pxa2xx_ac97_dev_probe(struct platform_device *pdev)
 	}
 
 	ctrl = snd_ac97_controller_register(&pxa2xx_ac97_ops, &pdev->dev,
-					    AC97_SLOTS_AVAILABLE_ALL,
-					    NULL);
+					    AC97_SLOTS_AVAILABLE_ALL);
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
-- 
2.39.5

