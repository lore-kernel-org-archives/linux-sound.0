Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAD3D5C2A
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454525; cv=none; b=FSFpTHSp3TpZXtqLKRjzvipHaW9Gugw9vbe9NTK9Jh3ttJ8H0gph5pwUWgMDQh03bpkBJqXDHef3FcaZRo7xep9h1wdvsMygIxsS4ffMbs9d2psye43ya2iHlEqn4CSqVlI+wLJ3XOsUY0JpfK6lekVy1NzSeVQEkdpORNwjJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454525; c=relaxed/simple;
	bh=sVJcDLSzvxVc07PKONwqwz7bpyreaHuk9mSCphbPjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHOIgleoQRauomVsM4d7fwxRmU3w3V45FVKjBXxn27Nk7I1yVLZhOxod27z8EeZquDZ866Wxh0lPv0djbYFYPi6X5IiPzn5+iaLhoolRIX4fVAvca7EOWMO5hEdzZSJlcG+9/bfZZyPm+LcE8pAC4kZWsFyWmsvpXJsPuG3b46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbEl4CdQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbEl4CdQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37e00ef16ccso501326a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454523; x=1783059323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=pbEl4CdQa/lN7fWHpoNlnXlMYrZZM2r3/BAEfNu3r2I1UKCZmJSoQFIbByeQENiPZv
         MCstnJ9Jr0LzDGfZBXEXsBMR1ufBeRfUNwgfL1nq+hDHfKztCfJhrOJnBVLvJjiYlKpy
         XFETng81RgOK7DI6NTvgeLrrqs+SiTgSNTUIKfOOO1wwJNVeZP/5+7ZiOCL7P0fZoS8M
         FGIkaXoJK6ikNtXuryhjbuRlcwofN6vQh7hhyOt9etOxYjXrjl5vECHiva0xSUSb27HP
         gTXCsRivuAq6i56u1/S4ZlfeRrSt1EDk8LgaAlAukWUwvIQKkRclIgYyO7MAa50S+IrA
         pesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454523; x=1783059323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=pabUCMyJ8Y2ZeT9NMLDFNA3iamzOnmVAq44dFUwrH6q6HQ6hdpNAI4xKGBN0W44yiW
         hxWNahSmsptPSH8VJ+A9n1vHwaJU1Bd+kDOQWn8i/p4X5Wb2VcGu8xc2PFfWgfi4Q+xj
         wReVlMP1/Ob3r+Wkm1lnQvrGwews0aL6WnV8vgpe7gKady96BmEpwYmqfaJR/u/LRd9D
         su4/FHHGBxhdc4YMoobap7JxiSNeNyIbGJsPRHjPHZs7DjtJHDnLQaWgKAjz1qaKgy5h
         OW1X3PA5w6UoPDhYAee3obSR5o5jUWQVeiaXQDIZMFFeoYppTAWOa+ATqBCBfEGyBjcC
         uAJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6fZ6K2V7PoA0+/K7wKUK2LoepfeScGgFLRt8deVkJMJOc3tU1uZoBAI1wZjTBvWBvyT9bhCSJ+fPZ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSv5qUFX6S3rjcdWVoXJOV6lK0K07bRL4X6q+K5oiYS0yPFUF
	yHregp7wUSOneX62CHsS8UoIWClbcmEiyp5QK3IAe23rjzMB87G5U0Ir
X-Gm-Gg: AfdE7ckmDl9h/B44NWNOv2+tp0zy3NgmO3zPxxiFeofdJ6lg2KwyQIuLrOwB2vSAPU2
	pH9VCd3aOxmlvO1tqPRkc9sEITnci3WU82/syR+kJEqQtovvAMlDWRD4YbumSvqhnUOQRwxvaQY
	kYn/YfWc7NFMScEs03foYxEER8m3xXofV7//Kf2uAaBlj6drbbr9EDkjdfEnk8r5GmBICexlGwU
	d19+jLm2hboIk8h7gTSmlTxx4xpIhGNC92OF2Tfo6G4MXaXgDSSIzDmt3hShz1eSQ04HfavLLaK
	8vFepFa0EpCal90XMRz81KYW60igNhFzATlm0JiE917eTuq01EjSg2yx4QXRWXeoKKW+89YnVM2
	aDb2YKK97NPDQuHcIVEctVAIXuORv4cbNhJb0jWymqW5t62iZOkgWV+UxYy49AQ/eJP210i2Pah
	zPfgbSlo9AefaFR9DZ99kEQBycDkyNCYsbIZjR5M+PJnV1Tlytg9BgSHKNqg==
X-Received: by 2002:a17:90b:4ac2:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-37dfa1c3bb8mr5342482a91.11.1782454523127;
        Thu, 25 Jun 2026 23:15:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:22 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:16 +0700
Message-ID: <20260626061329.23264-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

