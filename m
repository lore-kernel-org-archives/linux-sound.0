Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B226AF4
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783256393; cv=none; b=Z2CuB0JGKKQqGIYIPcPEniNL6FuPdnKZOpOjr+GOMcoxjwNBd8fEvYetd2sQITgC3gXYGah+DS1NPsd+JNEd7tsNSckeI0gBImdI8PzJ6rcqv4O+JtgWjoPk1nnz7EeU9TGnr+5/y+u6HGaaLw21KngqAi4Zx/Vr0jbZAv+jn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783256393; c=relaxed/simple;
	bh=btuAe51ssZMypCkWf70hNQKm4YWcH1l6i/9Oa6p8PJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQu3ynv02sRqD4+tt7Fu8X/C5XmxDxEq3/b18AiB//teTgRoeYcwj5St88m9ZvnLKYVn1ZAEfw3ROeLFEM0DU3QxMR1VXWdotB6K88uR0ZOPehhzrJYMjMEUzvmfw5e/P3WVUS6QzlBzsUQAvtV/bmtjpsNLu2H8AiHjwikyfhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=npbK8z8p; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="npbK8z8p"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so1584423a12.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783256391; x=1783861191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tQPjzYHBREcpdP6ynDA5wqQTZ86YnNQD8jkEpmXqgs=;
        b=npbK8z8pN3H8bUAb1UT25AvkGTFwnKhpBR0h1W/h8KTkrYTlJeDY7J3IMlEhsHOJio
         zUKJa81KMwEYyrpuJDXnlOaKnjKLSxco4YC3yMTHFYiS7pfJOKpwpDHTi1AHub4B7La/
         vv2BMAtqRAjc8UiMXpBo2AsgqAJKdGz2U8xkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783256391; x=1783861191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tQPjzYHBREcpdP6ynDA5wqQTZ86YnNQD8jkEpmXqgs=;
        b=CpkwRZS/4jGNnIGBlF4N0fhqla0IjVAFWewxsECKNwZh9I71xhFaRxtQv/YNXp3tgC
         Ms0mEjsoAw0nYlpT7N4fnj0bFFyDOeEcveNlgiWNidQDTPKunVyrJZSeAsJgIBCIbwQR
         KycYwzSNcujYvFgyV+hi2IzLdbqmvDl/oUka1lbhixGXDxezfgmx/KwU3g3aCwiDQ7JM
         g4niNmbk5lw36ehfAUogplDCUJV9wLj9yVvuQJJ2jKkO33MHz94ZrZYUBirQviTDEdLb
         ZM1Qd0qYsTzGkQShtNuk/Ng9ciN9dgRlawiIbjMBm44SCrResDRAakuiCOmR6ogQoEcr
         Rnsw==
X-Forwarded-Encrypted: i=1; AFNElJ92ckKwhiG7XL7LS0rft3AzQQavgioaPrT2Cj1kIWQ0D2nNBGAKOqK030E0anfTS2EOetiOS2JqTyzefQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysfa+qwffnc0mvbjvybsIyYVLFWekVmZ+gPpnHK13ydmTz4VcD
	ewPYOhvMPK2NlRTfuHr/tPGkuGe204hdJcKQDniVPOw70Ictaz3T8ykKKJLrMM47Mg==
X-Gm-Gg: AfdE7cnc0YwBR3Bi1PpJF1cVqISh60V9Q3M15U99MBYVau1mfn82Df+aaqX9vAQsUnw
	JSwSFHjbFGDlnsMvdXHZk7TmO57Qk7hRKleHFBlR6b1LYmmqro4MdPZ6jxwbvX9EtSdD5myW+Ro
	1K6u56Pv30bMHCxh4+cusAUNmSku4pCQwKXjpc5PeNCjlg1BZQVTONyB6AMBsZBnrnbuk+I4gop
	n5Y68wf/ZbzhLwdvA1TofkB4LFAbs6c6PNZI130df6/3E9/Pt8rGoLtecBB3MVxe2tCo5BU3AJ7
	msy9OoqNWWnpTSK5kUxfNKcdJ3V4m/Jd4aVKWsssEQTrt/Z1a9ebKCD05rI6FldKcPaQjoFIc1t
	gk3Aui9dLghNQWtPgQhbSWKiPgP8VNDwAUYbOlYt4PDqcYu9ooYiWiViOBNT7R2u8mZnQo77t1S
	GKsdEBPwEsFkVjTyQbcK7nHnyKL1ZIo1sZqmCtL5h67lpWWvSGqKJTUBHr
X-Received: by 2002:a05:6a20:748f:b0:3bf:e66f:2656 with SMTP id adf61e73a8af0-3c03e585b37mr6716164637.55.1783256391113;
        Sun, 05 Jul 2026 05:59:51 -0700 (PDT)
Received: from localhost (144.242.199.104.bc.googleusercontent.com. [104.199.242.144])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-30f0b813c4dsm39895524eec.7.2026.07.05.05.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 05:59:50 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yu-Hsuan Hsu <yuhsuan@chromium.org>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: aloop: Add 'hrtimer' option to timer_source
Date: Sun,  5 Jul 2026 12:59:30 +0000
Message-ID: <20260705125941.1203871-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260702170356.3418432-1-yuhsuan@chromium.org>
References: <20260702170356.3418432-1-yuhsuan@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd-aloop driver currently defaults to using the system jiffies
timer (struct timer_list). On systems configured with a low timer
interrupt frequency (e.g., CONFIG_HZ=250), the jiffies resolution
(4ms per tick) is insufficient for precise audio timing. For
example, a 10ms audio period requires 2.5 jiffies ticks, causing
timing jitter that leads to capture underruns.

Introduce "hrtimer" as a supported timer_source option. When
timer_source="hrtimer" is set, aloop uses high-resolution timers
(hrtimer) to drive period updates. This provides nanosecond-level
accuracy regardless of CONFIG_HZ and operates independently of other
hardware audio cards.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
v1 -> v2:
 - Guard hrtimer implementation with #ifdef CONFIG_HIGH_RES_TIMERS
   to handle kernels built without CONFIG_HIGH_RES_TIMERS.

 sound/drivers/aloop.c | 118 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 115 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 06bfe09eae1a..236f49a7fb8b 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -23,6 +23,7 @@
 #include <linux/wait.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/hrtimer.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/pcm.h>
@@ -55,7 +56,7 @@ MODULE_PARM_DESC(pcm_substreams, "PCM substreams # (1-8) for loopback driver.");
 module_param_array(pcm_notify, int, NULL, 0444);
 MODULE_PARM_DESC(pcm_notify, "Break capture when PCM format/rate/channels changes.");
 module_param_array(timer_source, charp, NULL, 0444);
-MODULE_PARM_DESC(timer_source, "Sound card name or number and device/subdevice number of timer to be used. Empty string for jiffies timer [default].");
+MODULE_PARM_DESC(timer_source, "Sound card name or number and device/subdevice number of timer to be used. Empty string for jiffies timer [default], 'hrtimer' for high-resolution timer.");
 
 #define NO_PITCH 100000
 
@@ -161,8 +162,11 @@ struct loopback_pcm {
 	unsigned int period_size_frac;	/* period size in jiffies ticks */
 	unsigned int last_drift;
 	unsigned long last_jiffies;
-	/* If jiffies timer is used */
+	/* If jiffies / hrtimer is used */
 	struct timer_list timer;
+#ifdef CONFIG_HIGH_RES_TIMERS
+	struct hrtimer hrtimer;
+#endif
 
 	/* size of per channel buffer in case of non-interleaved access */
 	unsigned int channel_buf_n;
@@ -232,6 +236,31 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+/* call in cable->lock */
+static int loopback_hrtimer_start(struct loopback_pcm *dpcm)
+{
+	unsigned long tick;
+	unsigned int rate_shift = get_rate_shift(dpcm);
+
+	if (rate_shift != dpcm->pcm_rate_shift) {
+		dpcm->pcm_rate_shift = rate_shift;
+		dpcm->period_size_frac = frac_pos(dpcm, dpcm->pcm_period_size);
+	}
+	if (dpcm->period_size_frac <= dpcm->irq_pos) {
+		dpcm->irq_pos %= dpcm->period_size_frac;
+		dpcm->period_update_pending = 1;
+	}
+	tick = dpcm->period_size_frac - dpcm->irq_pos;
+	tick = DIV_ROUND_UP(tick, dpcm->pcm_bps);
+	hrtimer_start(&dpcm->hrtimer,
+		      ns_to_ktime(div_u64((u64)tick * NSEC_PER_SEC, HZ)),
+		      HRTIMER_MODE_REL_SOFT);
+
+	return 0;
+}
+#endif
+
 /* call in cable->lock */
 static int loopback_snd_timer_start(struct loopback_pcm *dpcm)
 {
@@ -270,6 +299,16 @@ static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+/* call in cable->lock */
+static inline int loopback_hrtimer_stop(struct loopback_pcm *dpcm)
+{
+	hrtimer_cancel(&dpcm->hrtimer);
+
+	return 0;
+}
+#endif
+
 /* call in cable->lock */
 static int loopback_snd_timer_stop(struct loopback_pcm *dpcm)
 {
@@ -300,6 +339,15 @@ static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+static inline int loopback_hrtimer_stop_sync(struct loopback_pcm *dpcm)
+{
+	hrtimer_cancel(&dpcm->hrtimer);
+
+	return 0;
+}
+#endif
+
 /* call in loopback->cable_lock */
 static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 {
@@ -734,6 +782,30 @@ static void loopback_jiffies_timer_function(struct timer_list *t)
 		snd_pcm_period_elapsed(dpcm->substream);
 }
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+static enum hrtimer_restart loopback_hrtimer_function(struct hrtimer *t)
+{
+	struct loopback_pcm *dpcm = container_of(t, struct loopback_pcm, hrtimer);
+	bool period_elapsed = false;
+
+	scoped_guard(spinlock_irqsave, &dpcm->cable->lock) {
+		if (loopback_jiffies_timer_pos_update(dpcm->cable) &
+		    (1 << dpcm->substream->stream)) {
+			loopback_hrtimer_start(dpcm);
+			if (dpcm->period_update_pending) {
+				dpcm->period_update_pending = 0;
+				period_elapsed = true;
+			}
+		}
+	}
+
+	if (period_elapsed)
+		snd_pcm_period_elapsed(dpcm->substream);
+
+	return HRTIMER_NORESTART;
+}
+#endif
+
 /* call in cable->lock */
 static int loopback_snd_timer_check_resolution(struct snd_pcm_runtime *runtime,
 					       unsigned long resolution)
@@ -907,6 +979,21 @@ static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
 	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
 }
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+static void loopback_hrtimer_dpcm_info(struct loopback_pcm *dpcm,
+				       struct snd_info_buffer *buffer)
+{
+	snd_iprintf(buffer, "    update_pending:\t%u\n",
+		    dpcm->period_update_pending);
+	snd_iprintf(buffer, "    irq_pos:\t\t%u\n", dpcm->irq_pos);
+	snd_iprintf(buffer, "    period_frac:\t%u\n", dpcm->period_size_frac);
+	snd_iprintf(buffer, "    last_jiffies:\t%lu (%lu)\n",
+		    dpcm->last_jiffies, jiffies);
+	snd_iprintf(buffer, "    timer_expires:\t%llu\n",
+		    ktime_to_ns(hrtimer_get_expires(&dpcm->hrtimer)));
+}
+#endif
+
 static void loopback_snd_timer_dpcm_info(struct loopback_pcm *dpcm,
 					 struct snd_info_buffer *buffer)
 {
@@ -1097,6 +1184,26 @@ static const struct loopback_ops loopback_jiffies_timer_ops = {
 	.dpcm_info = loopback_jiffies_timer_dpcm_info,
 };
 
+#ifdef CONFIG_HIGH_RES_TIMERS
+static int loopback_hrtimer_open(struct loopback_pcm *dpcm)
+{
+	hrtimer_setup(&dpcm->hrtimer, loopback_hrtimer_function,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
+
+	return 0;
+}
+
+static const struct loopback_ops loopback_hrtimer_ops = {
+	.open = loopback_hrtimer_open,
+	.start = loopback_hrtimer_start,
+	.stop = loopback_hrtimer_stop,
+	.stop_sync = loopback_hrtimer_stop_sync,
+	.close_substream = loopback_hrtimer_stop_sync,
+	.pos_update = loopback_jiffies_timer_pos_update,
+	.dpcm_info = loopback_hrtimer_dpcm_info,
+};
+#endif
+
 static int loopback_parse_timer_id(const char *str,
 				   struct snd_timer_id *tid)
 {
@@ -1274,7 +1381,12 @@ static int loopback_open(struct snd_pcm_substream *substream)
 		spin_lock_init(&cable->lock);
 		snd_refcount_init(&cable->stop_count);
 		cable->hw = loopback_pcm_hardware;
-		if (loopback->timer_source)
+#ifdef CONFIG_HIGH_RES_TIMERS
+		if (loopback->timer_source && !strcmp(loopback->timer_source, "hrtimer"))
+			cable->ops = &loopback_hrtimer_ops;
+		else
+#endif
+		if (loopback->timer_source && loopback->timer_source[0])
 			cable->ops = &loopback_snd_timer_ops;
 		else
 			cable->ops = &loopback_jiffies_timer_ops;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

