Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518243B6F8
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515119; cv=none; b=BoVNHXpOY2NdhX6O9EKjJbRNxg9vbMQAD1rCC3ja7j4MkGwELHf/5JVG/XsCyZJY/afTXwEoKdWmIlaff90C8VfrI3ZbgwkT/wojaFUyaN+pjw3z0G9o4vxDcBZxQXqFkIldRu5hgEGx/zyN4hq4VOuU92VvZKF13BBRrS7frFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515119; c=relaxed/simple;
	bh=l+jE/ICW3VwCjHs5/VwCJgnhBYlTFKeilmi/IdexrH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXEA9bwhCGi7ljuaVvJL5RZpSgsH+en7c63Sk5osK5N5xJl7PLV8cGvlDGWzaBMXbdR60Ba9ugn/Xijy++G7Zk50fQWVo8q3EfiB+PKnBMNSSZfD2gKa8ykHQrw8vAPFZiIx9VhEsoeH94d7XATOhPmTQ794DZjbSmRg7jzp818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpBA/JKP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpBA/JKP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381065a7a03so463457a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515117; x=1784119917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=QpBA/JKPgpOp/k5TF00Y+VVd5cRYhMcorf3gvW+URwKXKcSeVgJy2wIys/faIPDlnb
         xZmxM+TuTvYpFFUFYmEC09tuCs44cypYDGHsoj7aaUDcIFre2bTlXk42/PM30jc8Vq3b
         3qVYYoIQZFa16njmzz+9jRAeX8H0QMQarIexCrEtmMQAKJ7yvVzf1qwbJdfz852JdWEY
         bNvuvsWpYow91bZTGrwJUcXwwZJkrXpE428o1ZhLG4RWeCHfBi2/VA1GrxuijNFrrwGG
         UGPcNqa5b1ARBHr3GbNLF5riiKFyE3h+6I6zmaqwId6We2zXEVLzG97pUeywJkEQcv2v
         wZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515117; x=1784119917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=KFLF+7HmwooNQGL+P1Woe1cKfH+CPGUVAlELDqrdM4VBWyiOkGxfGs12LRgKu2Pvsh
         FKCyIb+kkyvPtPdvA4CqGmG8lxDEhHtGHiKB0iHLETMcYWqqkln3dB+nE+O6ElGSl2le
         tj+ee+HKi/tqghnVa9MPAnzNJu7CoXji4AGU3UogWDKiFPDbxE5VYK/FqFeCmtBYqy6j
         Ezu7CPwGjxn6efZtEKIJcrakLwh9Cg15M5eJxUGQ/Z6Shyzi4TaT1wu1zIbCp5kwoSnL
         WiIf+DQsmtWQW+HM+OvQXuWN3rGm0iwEQb/wrGW9i8Uk1kILCUDLtTYOUkt0UDcwO/fd
         JD2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXcMmYsfb5i/D7GqMMqvYAJXrUyaaDw6WzsOt4GQXH4DC31vizspxY5z7QGCsNcaHySlSlTX1LftIp2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0v19sjW9e9xsaBCc1Nm8cuzs5jFrUjpn2m8UhRd6iaK0Hd5vf
	2Ll13Doh3phvH/mM1loPknlidySu2HAdmu3NsSjDxHguPeKjXkTBLp4P
X-Gm-Gg: AfdE7cm8ipeE34/cX9qukP34h9kwNxvitXMormGUxCnZs1v2gm7ZR+G/yGq+zWskbTB
	Wus8GAIsYsUx3PV5wmQ9eaTJbu1ZYXkFll3wm9YZAKNrYOFF74e3ZTwUH92G9+b9T2mCfPW7Hzv
	9O5Aj0Obn9bDaWrrEQHwyV0ftXE+6zgll971E0xVzfUQ36lv5Nod+aUdEWYQMYUKtPiAIgSo+MB
	4656a7L0/Sgzc9DqJoq81RxLT8dDEVAtoO0ULIErTSSGcLlW2mmvCWd+5IJDf0+Rg3XnZhfEJjQ
	pY28MMBSBwBqxjuv4ZMEDt4thnJcU8tC1at8R7LU8NgYabYzp0Olzq23+HvE/muAQBTJyxAI2ED
	KKKvh6WlMCH8O4oo+1CqHuykL69NyAGziYX777vS83WYxD4rLL+mM8HRWwlaAJPyo2IUZ1l6E7W
	/t4fOp24ffFVQjl9rz6aqE5b+0Of8133h7/cg6oHcjhxRjtWI=
X-Received: by 2002:a17:90a:dfc7:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38941acc3aamr2520904a91.21.1783515117105;
        Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:56 -0700 (PDT)
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
Subject: [PATCH v4 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:48 +0700
Message-ID: <20260708125002.202515-12-phucduc.bui@gmail.com>
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
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cros_ec_codec.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..fd2d5d7f9276 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
@@ -608,10 +609,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +625,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +894,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +909,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0

