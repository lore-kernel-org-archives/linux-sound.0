Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3437310768
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063433; cv=none; b=ZwTnuIYadkTrAphAQN+VWSubhnD3UwDXI0eKcTXsh7kepyzgPDgBJxu488gdEWxJQPq+Q8Kh3WTIn2PwViFdjnmkoAAQItsyNrrpqZsexsd9mxAdaP4c5MMGYFJ9kSdAyB8Lp7BLX45bIUlNtnI3UVLKZ7EIlNSseocCE2wJw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063433; c=relaxed/simple;
	bh=5RkNtJkVoCkHKfEYrA6MXCl2MVFvhfJGr8dOveoTRGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdkJiTSG8KAKTNEr5b32Y3I/oUG55VnhUkJaFOSb3S9SCmMJ9OZe5jIxq0tS6LnmCkLmpOLQzg37BtZwlpeTsFSy4x8oIwhHl+tLPRaE7U5Wo/Bl+XpGmNlfPrFDK3YFpLjvvNnkYa3FfFmKDo03Zg4Uw8STUhsGEDzSbVCOW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DtaahZ3Q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DtaahZ3Q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3db9641b725so1806860f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757063429; x=1757668229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm4pe/hBRwVMLzZHjbo9408+9mRS/P1/CN95bOU2KWk=;
        b=DtaahZ3Q9CWdiIIAALeIi49ETn0CGswcYVGWMYsJqTygRWR044AnL4EJtjnU+htbDQ
         y7rHUFqsKN29PZORDgtRwopGq+0JnCSgdRPF26Tix6B1z4i9yL+NkGDeCEfehq1xyQ6z
         fvWbx5KqCJABVQLuBl3zcovsGCYQ8mjd5eYc5mQHcRRuLOgOIdF6L/gQaqxau12mDtQV
         Nnc17MBRsEzt/8R9F0Lh1KeYzY9BE+vd0BDJ/2ktWJoQQfNtp1xzXFtQjQkoaE3L3YT/
         NrIvxbhV5ndG4Mw8RiJWyLplnlnteIHmT6tou2jkEUFXmzOkvwdzapld4GRm3TGftRPQ
         mA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063429; x=1757668229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm4pe/hBRwVMLzZHjbo9408+9mRS/P1/CN95bOU2KWk=;
        b=xOFqIM/mDVV1NZg/Vm09H4XlcI1cyPNoOc2xWLL3PHM0rmlnbN/IOiKueK6L2UrLbs
         CbzqoepbZ+pX28XwikAjR4YttY9nWA/q2YqykdMN08SgmxSVvvGfhRF4mMK1vnvnyvg6
         XxwwavB6YMu1NLTFqCeeJOFzK9+8Af5lJLxVUQMx9nqO2r2iLQUxHIV1LVXj32IrEWY7
         8tZGxdlOyiVU0FkUI8iQBUVQjQG+3olVOn7baQPlKrLHuhvUlYblKnCBciNXLoFRuS5R
         2ATrggdPR53SrbMPuMBRzuOqnQn8QsXddrho/gtUIOTRfFDC3OA64iWLVjXO6a4w5yar
         h43w==
X-Forwarded-Encrypted: i=1; AJvYcCXRXvkrEfJFa7xDB4NuVOu+TY+lnSbg8rWnmIhdEg5bhXEsHWMky9DI4OVV76dEI3waPZMjEJh6YT1oEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGDAzXApv2BBvxibSpgi/eMUlwf7cSOX0J4nk/gXuctDrlJ7K
	MNMnd3CBqJeDApsKiHFY2kO321cVBzQ4hjQhfOdEFBXE1KkkMu29OT5h5xHNjLUa7ug=
X-Gm-Gg: ASbGncs+gP9AaKM2mNJpqXrDcRN4PqwjadvKKV2JkhVIWcXV+iPZkaAH0bSGTcTLEWf
	MsrcElUlzaNxe2tMbzyjS1BtJigKqXNXCot6Dpky2pbkUxGKBlexVH0knrHG6xJBVKTucX8rNg6
	6lZSEnwATIIRzV0pkydi9WrA2lEgkr5ip99pEpivLXuvMhFJGWOAo0bAgv7qsj7xEMpKxGAJN6c
	KbiRmzvD16WHTtz0WoMpxSV+hEO8LKnv2n3Frypenj55pATxh1Pk0sWjMBjlQOuDCvEPoqxxVry
	I2HPxWveG13DQu6q+In8SwhETlYPLGYxoguGdbElgCjUOZhgSp2eV+Qk5cGS3Kd+9ZLtKqThTwX
	Kl58H4935svKV6vbNKVlMz3JsabdHbpuIivOaVBtt9ATEE+aSGjLP5bvggQ==
X-Google-Smtp-Source: AGHT+IHXZjRfNNN1VASUYYcP6J0MVd6RmogJZXjUNszPLnsyh/h8mAG1e0M5wD4yMRAWOYI+bFu/Yw==
X-Received: by 2002:a05:6000:40ce:b0:3e4:bb5f:ee95 with SMTP id ffacd0b85a97d-3e4bb5ff303mr417291f8f.38.1757063429026;
        Fri, 05 Sep 2025 02:10:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd4affb6bsm39726915e9.1.2025.09.05.02.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:10:28 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: replace use of system_wq with system_percpu_wq
Date: Fri,  5 Sep 2025 11:10:16 +0200
Message-ID: <20250905091016.109428-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905091016.109428-1-marco.crivellari@suse.com>
References: <20250905091016.109428-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users. Make
it clear by adding a system_percpu_wq.

queue_work() / queue_delayed_work() mod_delayed_work() will now use the
new per-cpu wq: whether the user still stick on the old name a warn will
be printed along a wq redirect to the new one.

This patch add the new system_percpu_wq except for mm, fs and net
subsystem, whom are handled in separated patches.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 sound/soc/codecs/aw88081.c          |  2 +-
 sound/soc/codecs/aw88166.c          |  2 +-
 sound/soc/codecs/aw88261.c          |  2 +-
 sound/soc/codecs/aw88395/aw88395.c  |  2 +-
 sound/soc/codecs/aw88399.c          |  2 +-
 sound/soc/codecs/cs42l43-jack.c     |  6 +++---
 sound/soc/codecs/cs42l43.c          |  4 ++--
 sound/soc/codecs/es8326.c           | 12 ++++++------
 sound/soc/codecs/rt5663.c           |  6 +++---
 sound/soc/intel/boards/sof_es8336.c |  2 +-
 sound/soc/sof/intel/cnl.c           |  2 +-
 sound/soc/sof/intel/hda-ipc.c       |  2 +-
 12 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index ad16ab6812cd..e61c58dcd606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -779,7 +779,7 @@ static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
 	if (sync_start == AW88081_SYNC_START)
 		aw88081_start_pa(aw88081);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88081->start_work,
 			AW88081_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 6c50c4a18b6a..c9c3ebb9a739 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1313,7 +1313,7 @@ static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
 	if (sync_start == AW88166_SYNC_START)
 		aw88166_start_pa(aw88166);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88166->start_work,
 			AW88166_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index fb99871578c5..c8e62af8949e 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -705,7 +705,7 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
 	if (sync_start == AW88261_SYNC_START)
 		aw88261_start_pa(aw88261);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88261->start_work,
 			AW88261_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index aea44a199b98..c6fe69cc5e73 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -75,7 +75,7 @@ static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
 	if (sync_start == AW88395_SYNC_START)
 		aw88395_start_pa(aw88395);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88395->start_work,
 			AW88395_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index ee3cc2a95f85..dfa8ce355e3c 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1281,7 +1281,7 @@ static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
 	if (sync_start == AW88399_SYNC_START)
 		aw88399_start_pa(aw88399);
 	else
-		queue_delayed_work(system_wq,
+		queue_delayed_work(system_percpu_wq,
 			&aw88399->start_work,
 			AW88399_START_WORK_DELAY_MS);
 }
diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index ac19a572fe70..38c73c8dcc45 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -301,7 +301,7 @@ irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
 
-	queue_delayed_work(system_wq, &priv->bias_sense_timeout,
+	queue_delayed_work(system_percpu_wq, &priv->bias_sense_timeout,
 			   msecs_to_jiffies(1000));
 
 	return IRQ_HANDLED;
@@ -432,7 +432,7 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	struct cs42l43_codec *priv = data;
 
 	// Wait for 2 full cycles of comb filter to ensure good reading
-	queue_delayed_work(system_wq, &priv->button_press_work,
+	queue_delayed_work(system_percpu_wq, &priv->button_press_work,
 			   msecs_to_jiffies(20));
 
 	return IRQ_HANDLED;
@@ -470,7 +470,7 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
 
-	queue_work(system_wq, &priv->button_release_work);
+	queue_work(system_percpu_wq, &priv->button_release_work);
 
 	return IRQ_HANDLED;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index ea84ac64c775..105ad53bae0c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -161,7 +161,7 @@ static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 	priv->hp_ilimit_count--;
 
 	if (priv->hp_ilimit_count)
-		queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+		queue_delayed_work(system_percpu_wq, &priv->hp_ilimit_clear_work,
 				   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
 
 	snd_soc_dapm_mutex_unlock(dapm);
@@ -178,7 +178,7 @@ static void cs42l43_hp_ilimit_work(struct work_struct *work)
 
 	if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
 		if (!priv->hp_ilimit_count)
-			queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+			queue_delayed_work(system_percpu_wq, &priv->hp_ilimit_clear_work,
 					   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
 
 		priv->hp_ilimit_count++;
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 066d92b54312..4ba4de184d2c 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -812,12 +812,12 @@ static void es8326_jack_button_handler(struct work_struct *work)
 			press_count = 0;
 		}
 		button_to_report = cur_button;
-		queue_delayed_work(system_wq, &es8326->button_press_work,
+		queue_delayed_work(system_percpu_wq, &es8326->button_press_work,
 				   msecs_to_jiffies(35));
 	} else if (prev_button != cur_button) {
 		/* mismatch, detect again */
 		prev_button = cur_button;
-		queue_delayed_work(system_wq, &es8326->button_press_work,
+		queue_delayed_work(system_percpu_wq, &es8326->button_press_work,
 				   msecs_to_jiffies(35));
 	} else {
 		/* released or no pressed */
@@ -912,7 +912,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
 			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x0d);
-			queue_delayed_work(system_wq, &es8326->jack_detect_work,
+			queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
 			goto exit;
@@ -923,7 +923,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
-			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
+			queue_delayed_work(system_percpu_wq, &es8326->button_press_work, 10);
 			goto exit;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
@@ -958,10 +958,10 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 		goto out;
 
 	if (es8326->jack->status & SND_JACK_HEADSET)
-		queue_delayed_work(system_wq, &es8326->jack_detect_work,
+		queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 				   msecs_to_jiffies(10));
 	else
-		queue_delayed_work(system_wq, &es8326->jack_detect_work,
+		queue_delayed_work(system_percpu_wq, &es8326->jack_detect_work,
 				   msecs_to_jiffies(300));
 
 out:
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 45057562c0c8..44cfec76ad96 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -1859,7 +1859,7 @@ static irqreturn_t rt5663_irq(int irq, void *data)
 	dev_dbg(regmap_get_device(rt5663->regmap), "%s IRQ queue work\n",
 		__func__);
 
-	queue_delayed_work(system_wq, &rt5663->jack_detect_work,
+	queue_delayed_work(system_percpu_wq, &rt5663->jack_detect_work,
 		msecs_to_jiffies(250));
 
 	return IRQ_HANDLED;
@@ -1974,7 +1974,7 @@ static void rt5663_jack_detect_work(struct work_struct *work)
 				cancel_delayed_work_sync(
 					&rt5663->jd_unplug_work);
 			} else {
-				queue_delayed_work(system_wq,
+				queue_delayed_work(system_percpu_wq,
 					&rt5663->jd_unplug_work,
 					msecs_to_jiffies(500));
 			}
@@ -2024,7 +2024,7 @@ static void rt5663_jd_unplug_work(struct work_struct *work)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 	} else {
-		queue_delayed_work(system_wq, &rt5663->jd_unplug_work,
+		queue_delayed_work(system_percpu_wq, &rt5663->jd_unplug_work,
 			msecs_to_jiffies(500));
 	}
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index a0b3679b17b4..e60dd85f5552 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -163,7 +163,7 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 
 	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
 
-	queue_delayed_work(system_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
+	queue_delayed_work(system_percpu_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 385e5339f0a4..207eb18560dd 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -329,7 +329,7 @@ int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	 * CTX_SAVE IPC, which is sent before the DSP enters D3.
 	 */
 	if (hdr->cmd != (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE))
-		mod_delayed_work(system_wq, &hdev->d0i3_work,
+		mod_delayed_work(system_percpu_wq, &hdev->d0i3_work,
 				 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index f3fbf43a70c2..d8fde18145b4 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -96,7 +96,7 @@ void hda_dsp_ipc4_schedule_d0i3_work(struct sof_intel_hda_dev *hdev,
 	if (hda_dsp_ipc4_pm_msg(msg_data->primary))
 		return;
 
-	mod_delayed_work(system_wq, &hdev->d0i3_work,
+	mod_delayed_work(system_percpu_wq, &hdev->d0i3_work,
 			 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
 }
 EXPORT_SYMBOL_NS(hda_dsp_ipc4_schedule_d0i3_work, "SND_SOC_SOF_INTEL_HDA_COMMON");
-- 
2.51.0

