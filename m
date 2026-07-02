Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A024E4C3
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011845; cv=none; b=uWOq15hqrDq0cMnxbkGb0f0Hb8BfKCYO4F9w+hGCKKkin+hjg+q+q/OKYRUaZ+dAEgA4CwLQsoUpVXxNihUPKv2vnR+B/JoYwcZgFb+BS2ZaFHMt5Dip5O+LbZRBgr072BKWuuVFJBNLUXe2/9dvrOyiSazEpm4r6G58gYl7434=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011845; c=relaxed/simple;
	bh=PsWFbF7lcU6rHjHzmjR+BC28POHHscFYbUN7hXQAxKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLY0C/8iqVQOGFtFreUxZA2elA3Sxbjq8vWfmz9f62Ui4QtOOW76/zizImsw0unlHwqulHzkEsma5KsY/E8IpS+qtR6wlY3J9vfGuA+r8CzovUYS2FOQSSPcQE+eEoiuQweFN71otp40xw9Y1bJaxasmOLHT8+HZwjzjGKrGb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JwTN6EPb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JwTN6EPb"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8454160043aso1749254b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783011843; x=1783616643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSPVrVC1VsbE9rN9yZNSgzSl/s9NouB60tZGU31qh5s=;
        b=JwTN6EPbMA9k/lIgyTwQouHzLc83ml3cduw6aQF1Di2Ji76xdlez7l9sYm4vJK0jAC
         RtSm/b8IGSGt3qDIIWw+ezo9oYalPTsevBKz8+0Bh6c2cPI2Cw9iUmzGDk+mHRjng65I
         2Luwyu1vcm7kjMiYl47pQqaoj6tHexLXmXjjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011843; x=1783616643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSPVrVC1VsbE9rN9yZNSgzSl/s9NouB60tZGU31qh5s=;
        b=W4aZ/gJicwGBtolY+u0jeIuuwQqfdxXr84D25LoUCy6WRTF5IgrK++axj11pFpXouC
         o0FdlvkC5IiHopopIjko2727dEMn9mkluITi9rie5Bzfy0SoeVDPxEdIVjj46xSssXka
         W1vcYfZGAphtSWueGOxpvwfgv9f/2HYDtkJP/lCu4ldrXdbzZ8h1DQCkcIcSlFrTz+BI
         KEsvW4SK0d75BaX97N8sxgq52Ql3obLwFn6Vdp15FFc/d+/yDJZTQGY8vYKUKWBLsRgr
         OZkxpVuiLqWxRlq9vicYUIY4B4ha1VkQauRueb7fFis4blfKeNd6LuhqnAsj7k2ey50a
         57Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9hP50QxDilwtcEItq2p64drVt8M2WIZ/GuyJ4ywfyFI5uXdOWxk54r0Wj1U5f8kHfLWHh7XCztkH6YYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8VwQYKM1rRGB6U2F03P1AaEYHQHmc4Xr12d36HeUUdwgRgmy
	jsH5EW6CDcyz5/VOymCpXc4vtKMq8Hd3mmOHvyYAonjMAhWdbMSsw/m8MIBkkLITjA==
X-Gm-Gg: AfdE7cmqq3rj/2R3zvi2zcKKLNrrFXdSk7BnRRCp76MaxXk3KA21MMRqHU2zUswVAuj
	8vBdAPHeYDc8iJkJnbz6qAoz1FqI6UBYRzTHowpvQ3n5zXVRQuf0xjQH0ekQB6cIuH7CG5pwTBz
	2rkY4qdAE+sIaVb1b9jsCD8mFkTVhzUvyMhm/tVpe337fslRehKsHHc89PP3AHiSKVECwQX7hFQ
	GDUztRGehutpPZ8K2PZhN9tvoRogGpRDmrvcj5rB4GoUjL81vRyuWSFYLnNYph8/gvDdwa1Wl2m
	IolNel4o0hduZ+IksGnoVzZIstnNlmt3GC8qHS3t2nVQHhaIecmXRrpoPvn2ZcTb73H/qtMBUWA
	OWRDWAgsvcA4XsD/sbz+Bo0asYiWoKJhAQEk1WGdRHKLMJpppZdfwlc2gCyWx0CunwCU7Kawp7T
	tQuSZZ7V4eWlUuLmzWOSieySZLieTChjJtb17wy3XqIbxuSihb18c=
X-Received: by 2002:a05:6a00:1745:b0:847:9518:a6fc with SMTP id d2e1a72fcca58-847c096d066mr6658578b3a.33.1783011842925;
        Thu, 02 Jul 2026 10:04:02 -0700 (PDT)
Received: from localhost (140.152.81.34.bc.googleusercontent.com. [34.81.152.140])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c9e8f1ddd7fsm1554093a12.8.2026.07.02.10.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 10:04:02 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yu-Hsuan Hsu <yuhsuan@chromium.org>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: aloop: Add 'hrtimer' option to timer_source
Date: Thu,  2 Jul 2026 17:03:48 +0000
Message-ID: <20260702170356.3418432-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
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
 sound/drivers/aloop.c | 101 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 06bfe09eae1a..35018c33a92b 100644
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
 
@@ -161,8 +162,9 @@ struct loopback_pcm {
 	unsigned int period_size_frac;	/* period size in jiffies ticks */
 	unsigned int last_drift;
 	unsigned long last_jiffies;
-	/* If jiffies timer is used */
+	/* If jiffies / hrtimer is used */
 	struct timer_list timer;
+	struct hrtimer hrtimer;
 
 	/* size of per channel buffer in case of non-interleaved access */
 	unsigned int channel_buf_n;
@@ -232,6 +234,29 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 	return 0;
 }
 
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
+
 /* call in cable->lock */
 static int loopback_snd_timer_start(struct loopback_pcm *dpcm)
 {
@@ -270,6 +295,14 @@ static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+/* call in cable->lock */
+static inline int loopback_hrtimer_stop(struct loopback_pcm *dpcm)
+{
+	hrtimer_cancel(&dpcm->hrtimer);
+
+	return 0;
+}
+
 /* call in cable->lock */
 static int loopback_snd_timer_stop(struct loopback_pcm *dpcm)
 {
@@ -300,6 +333,13 @@ static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 	return 0;
 }
 
+static inline int loopback_hrtimer_stop_sync(struct loopback_pcm *dpcm)
+{
+	hrtimer_cancel(&dpcm->hrtimer);
+
+	return 0;
+}
+
 /* call in loopback->cable_lock */
 static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 {
@@ -734,6 +774,28 @@ static void loopback_jiffies_timer_function(struct timer_list *t)
 		snd_pcm_period_elapsed(dpcm->substream);
 }
 
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
+
 /* call in cable->lock */
 static int loopback_snd_timer_check_resolution(struct snd_pcm_runtime *runtime,
 					       unsigned long resolution)
@@ -907,6 +969,19 @@ static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
 	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
 }
 
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
+
 static void loopback_snd_timer_dpcm_info(struct loopback_pcm *dpcm,
 					 struct snd_info_buffer *buffer)
 {
@@ -1097,6 +1172,24 @@ static const struct loopback_ops loopback_jiffies_timer_ops = {
 	.dpcm_info = loopback_jiffies_timer_dpcm_info,
 };
 
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
+
 static int loopback_parse_timer_id(const char *str,
 				   struct snd_timer_id *tid)
 {
@@ -1274,7 +1367,9 @@ static int loopback_open(struct snd_pcm_substream *substream)
 		spin_lock_init(&cable->lock);
 		snd_refcount_init(&cable->stop_count);
 		cable->hw = loopback_pcm_hardware;
-		if (loopback->timer_source)
+		if (loopback->timer_source && !strcmp(loopback->timer_source, "hrtimer"))
+			cable->ops = &loopback_hrtimer_ops;
+		else if (loopback->timer_source && loopback->timer_source[0])
 			cable->ops = &loopback_snd_timer_ops;
 		else
 			cable->ops = &loopback_jiffies_timer_ops;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

