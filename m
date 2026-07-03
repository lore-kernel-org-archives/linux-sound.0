Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF6346795
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058158; cv=none; b=als4Nx80JeUIaDJfvnoXEkzWdtd53UJVfoJ24Dbka8/jaIXl2nI+OLSBAC/jSx9GyI0aLLTSpZJDOztlVijXRgru339BTQiqCeybJIGgjZ9ehhKLqdp+4WEhv0EpLbBd3HxABNoDUxg9oDPIrE0zcsOZQDnaGyH7mPoPUlrd3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058158; c=relaxed/simple;
	bh=sVJcDLSzvxVc07PKONwqwz7bpyreaHuk9mSCphbPjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CI2Nico4IRVLMcKtIUyf9ANl9Agsaxjvogdg05Zd4i09bynGkE8JcO9sAJ3PF4rqlnMtnE4lcEMANubSwiufo7x4Wb4R5v8+fKHrJWbZs5Qe+FXu6vwYgr5YfAvHA8LSd6cpcC9XaKrkwC/zqSDnIIvuMnYQphl6ruWMf+rkMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLUfoT/5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLUfoT/5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8478cc93299so179131b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058155; x=1783662955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=fLUfoT/5IRBZSlaKqigKt5kzK6uuh+OtNe0nUjOxqILWd5mtVEKmlPoakTDnwJXBRO
         7sD+mZ36tyK8x8TxBkNRxcSUQiM7bYQALYTYJWXgOsvFIv0YNwP1VAbzkZqJz4uh1uO9
         i/LFWPG6zuK/H6irN3T9G7fPyjcDRbxHphmjh8Nuzd8hAvN22hUmgQEgqJqScBXUVB4u
         mAW7CeAkELwUldTQPmbocb0vGSuLhlLGVO1yahRVPPcjGiB8ymEpe9saFr4s1C375nKZ
         UC3xJpakZRwvusQZiFvgQQYUtU8PU++/o7wGXOxzfi2PZ6Hf4993tWmZAhNV/h7rciSS
         x9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058155; x=1783662955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=UCpy5olYNs3DxxNls712+WK+rqTGxgSOK+0f6bC7A+7RNQaYe6llC9w7/7tiqHAMrw
         wSGjB3kfIqO+EulqPSYf7Qt7Cnsh/95G2S1iL8l+Kwa1z+wuGp7YdbChmwVY38+KXpzS
         T323BATQYz4LgbNuE16u1c0odpJM9Qj30VEA71tcgSj19WfMNOoZfVkrI9YqJ/g8Rbgq
         LQ0ARThEyL39zvNIKaEv0HYlOZ9evnV1rJ0YuCE7rGXuJ5BP0bq+nR8QEbb6ojZMY8E0
         qq0BTlw90XAIqXANIr/9ybmKruooXvY+plNFOR2e+SFhtwgpjeuyZp7dtmJ4zTSuWocQ
         3D9w==
X-Forwarded-Encrypted: i=1; AHgh+RpFbgG6cAJmoc5xJnAqWcBVl4GlMRVx72DRiPIiIncORhg9nPDNuKIi+ZMh6ECnHRui/rGXsQMpTtN25A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDif8Q0QQJDtn9xhqblo7dQNFrYgK/XGkOdvq6sG3CnwwisMc
	skldJVS1oLJpQen9QDc35Y9YQ4O4CSehn4Qfw2PmR/esGfMK4pWKYE/Z
X-Gm-Gg: AfdE7cmPeqx4CS8u1qSEI5EOUOZCMzfLfskAGf3JRnUBZWyopuVE/oMXdyKf2uo7K0+
	CEBVieLWKOkUIg5WVecHIkckofqqeohrYomTEPyUzCaTNlRKTcE0YOrOve1idMFrTpmlmeSlRO5
	B7snETKwovdyQ/jCYzfSDkI5IbQVmk0dQ/GTq1LWr3Ru7iXv2fkIfBUZUtENf2yJjZktperq6y7
	sRDmfN5hGOGKGKFgfK2W6yl8+MHIaq3o5Yr3VWd/jupW2RC6POgGjUBnyIT+/1xJbtXZVMFCMBA
	XVhVr22KOuD9LLC627+IfJoXE2NsNxt92qSJ7Kc/H4PNNDhO0iCU2Krha+QpZ51nfKcsKOpjCJO
	fqzuR4vkYMU2Meu/yOZI5vPRLk3MYxiPbSqP9V+MQtyssy9Hz/wtYeNZY/cM5lGxkbZiXWa88za
	+DrKdeDPQXK4lFZRgH0i2br770D4mPSVZj1mrKJk419JkIW30=
X-Received: by 2002:a05:6a00:b53:b0:843:468d:7804 with SMTP id d2e1a72fcca58-847c0879346mr9802024b3a.34.1783058155241;
        Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:54 -0700 (PDT)
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
Subject: [PATCH v2 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:42 +0700
Message-ID: <20260703055355.244898-12-phucduc.bui@gmail.com>
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

