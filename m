Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GOwZQPMW"
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A39BB6
	for <linux-sound@vger.kernel.org>; Sun,  3 Dec 2023 19:36:23 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d075359c8dso8908735ad.1
        for <linux-sound@vger.kernel.org>; Sun, 03 Dec 2023 19:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701660983; x=1702265783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5ibrbomcT4ATNS9nyIlTVVNkugyqaWArhiAt2NcI7E=;
        b=GOwZQPMWolQUDwI+RNcYTupF1MEBx3oijYcofmTpymLia4uirxdvBZlGcug6fxYDjI
         FbgkxF7pSykD9aHj6kDdZIotwilI9pRaeGfDwUGy8s6bzsS2e8vwPz5zV7+yHikFxp5j
         /vAVt4G9l5xoN1L8FXH1RMzjlTk7pMwmE0occ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701660983; x=1702265783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5ibrbomcT4ATNS9nyIlTVVNkugyqaWArhiAt2NcI7E=;
        b=jnC4UtbDinSTDypDpFITkU4c0mgwOKunH0iUp0x+FXO1N4EBvmjcfN6HxoI+zEspwc
         QOJgtSeV66kQdyCw39zboDXRzxpgGr2WNQk63cMM6Oml4dUubr3363thaAJ7A2sRHZSm
         yEgba49PTqS3L1YqdNpoQYEcwfwI1N0Ue3GTgtY8gDd+uUpIj3lON7qv+L8VJfk+LiS0
         PTlPhOfXP1/g7T/qPTr2lGxPyfVZsrrEtvbC8b8pSpnd5wEiuZd8d606bijCEiIoaqG0
         9NDChPPKu+cdLp+LJsq3S9T7s2gziVjOS5z/4VWwB4kXkuPgvbWiEBy5A/scnov7ZZ17
         QI+Q==
X-Gm-Message-State: AOJu0Ywe5rNKwHce1Weib4wv5Srb8MtwnuQav+ew88joLb9cTLHUqXjW
	5smo4x4HwgMzr9ZHgoYIfvNYtw==
X-Google-Smtp-Source: AGHT+IFZTY4dVLtssG9DSiQOUbrB/mzi7KeJYm1iIYwTC7L32KetX2MXXsk2TMWkTQqjGPuu867XrA==
X-Received: by 2002:a17:902:d50f:b0:1d0:68a:4a12 with SMTP id b15-20020a170902d50f00b001d0068a4a12mr3795878plg.15.1701660983115;
        Sun, 03 Dec 2023 19:36:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f7c600b001d0447e7fdasm6512178plw.269.2023.12.03.19.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 19:36:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Move sof_of_machine_select() to core.c from sof-of-dev.c
Date: Mon,  4 Dec 2023 11:35:47 +0800
Message-ID: <20231204033549.2020289-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 014fdeb0d747304111cfecf93df4407c1a0c80db.

Commit 014fdeb0d747 ("ASoC: SOF: Move sof_of_machine_select() to
sof-of-dev.c from sof-audio.c") caused a circular dependency between
the snd_sof and snd_sof_of modules:

	depmod: ERROR: Cycle detected: snd_sof -> snd_sof_of -> snd_sof
	depmod: ERROR: Found 2 modules in dependency cycles!

Move the function back with sof_machine_select().

Fixes: 014fdeb0d747 ("ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from sof-audio.c")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Not sure what the proper arrangement would be, but this gets my builds
going again.

 sound/soc/sof/core.c       | 22 ++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.c | 23 -----------------------
 sound/soc/sof/sof-of-dev.h |  9 ---------
 3 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index a2afec8f5879..425b023b03b4 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -144,6 +144,28 @@ void sof_set_fw_state(struct snd_sof_dev *sdev, enum sof_fw_state new_state)
 }
 EXPORT_SYMBOL(sof_set_fw_state);
 
+static struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+
 /* SOF Driver enumeration */
 static int sof_machine_check(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index fa92da5ee9b3..b9a499e92b9a 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -41,29 +41,6 @@ static void sof_of_probe_complete(struct device *dev)
 	pm_runtime_enable(dev);
 }
 
-struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pdata *sof_pdata = sdev->pdata;
-	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_sof_of_mach *mach = desc->of_machines;
-
-	if (!mach)
-		return NULL;
-
-	for (; mach->compatible; mach++) {
-		if (of_machine_is_compatible(mach->compatible)) {
-			sof_pdata->tplg_filename = mach->sof_tplg_filename;
-			if (mach->fw_filename)
-				sof_pdata->fw_filename = mach->fw_filename;
-
-			return mach;
-		}
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL(sof_of_machine_select);
-
 int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index 547e358a37e3..b6cc70595f3b 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -16,15 +16,6 @@ struct snd_sof_of_mach {
 	const char *sof_tplg_filename;
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_OF_DEV)
-struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev);
-#else
-static inline struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
-{
-	return NULL;
-}
-#endif
-
 extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
-- 
2.43.0.rc2.451.g8631bc7472-goog

