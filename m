Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888823;
	b=XV+PfuMwge+pFatKZQWof0rnv4fxz8oZVlQ39M9qaRDyCtmcMMSJMlCzleqHj3Dd8Aen
	 baFQHvycd/ww7gP06bhJ9nKLBpAmawNnMi1LkewI+zEp7w1tscYgRU5gS7UPqxWErzKUt
	 ByuDB3RWyNv9l1Tt6sTJ2P/vggtZC4kZIRnzsWeMUepF30AwJWPV5KXO28wipdB07+a38
	 zvTffWplRmGUEebgQ2I5z/7tTn4WBhb4ZFwy6Q1z6Ugspi4sszEibuzE+yTHfD50wTZhF
	 HUVOzwK6tBPswmKutSIMMMvhNESR1Ew5rKXGl204fOIwbQn0aXZHz1iXT0uynutMwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
	b=2Ku3EseGDcmynNoKd80la2PNQUs64JU4gSuZGCK++tHFyxrgWE2JRSW8IyTwISu2CvkC
	 BYKf3WCidUVfvmiFZDyKarIjr/mebp2ZE0RAJXGqQwJCyn+5sH2oBEWSnbA/YOyH84uUF
	 e33v440mQG4XZqsE25AjrC9V2iBS3Kp1qjZPaxVOLINJMIl0R0CIaNG8wK7d9dgj8tQOu
	 jybWUjDdC2WPJhd8xioxlEIftdJl3/N5zqfZabMnS4jaHRHaOuBshvqnEuGzZK+B1giP3
	 FPMaUnxIhA6ZjHq90tipr7Y695QwOqfckV8Q2YAcOSWtwqiZTOwV1Cadcdn1Q4ZEodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5WJtfav;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78B606A32A
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 04:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA78B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5WJtfav
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3732570b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888822; x=1795493622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
        b=Y5WJtfavvBWy2qQK4qGinld1CQXCcnizLC8Ol+wdzNSIAXRTjLhfoKsSVo6VLeHF2J
         oYZMZ4/rppx4f4f9wejyW1XuxF+dR/jsWhcsTJLK43JFLm+598AkTnf1cYXD23FQbBxh
         biaGh21t+9UMVkbUVk0tvtNPNxre46U4PpHA8IiCPeSX/tZWs1SbXGOHPbFS81Ww1iRf
         CKonqQx5GgNjf9ptU92erf28LyPuF5BFxJMyHC42dOYtB/3vnIujRigsLHVBNbrMhooz
         eArJdQ4rAQSpICE03hrYGofc//+YvJjc02zBSOHVs8/2USfwJRhvcAXF7A4KTezbIswt
         /APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888822; x=1795493622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaBQcyvWhB0cz+X9HCEzHnyDC+TDtuFefgVmaYYwRlA=;
        b=uT2JQmYi/HfwM+fbixJ74++7HgxrZKyR1Sl21MQFKeNQPCf4MukkryDnsuAS34h/sd
         lxYGgPO4p8M7guGVpAsBQ644Vh7Kva3ov9pm9ISyg2kk9bVBxulHqeaUu3JRNHBDypY1
         XdJCwVlOg3qpiooDOqrc1psMbtZopos/srwFQofgnZGzHOvDikgbOfK/gYWM9x8yr8c4
         y0iBvHl7Wlj8+gZKmVmrgiCRcLu6bGRtYvsB+v+3z96OIwoLGFfo5VwEWPgoc7b6CqAx
         YFlsYsPOULkHh/ZjtXCZ5uoNZd0DiCSOOmbLDOI+rcSBe/k3pz2Q9dpsw8Qweb9VhVvR
         1+tg==
X-Forwarded-Encrypted: i=1; AL+hErFjaLYL/lFfwzcVtlJQ0ZnuojlDrxyjfrgruzvZLGoTjUSRFMfzLNzq9JbAKOO4ZtnKxpPA+iO8wExYww==@vger.kernel.org
X-Gm-Message-State: APuU4Z9usNy9e0+JcCfEOAA/L4sGzO4Jsy40YlLppzn9VrMfQpoefvFI
	X/vWoDibRsFfE1pTHhaWoNy45I9nDZPNjWNyIl8Yuifio/uMg2qG6gpb
X-Gm-Gg: AYBFou0zQbwVBo3XCzaGQQZv4SwRCNoNslEemkWgUxm9te3WrGdRFg8cXzJ4WelRuwz
	KR0a4Ey8F3Rdcdd6LgYBrz6j50HhqaJIFYotG1ryYivFIyAsarAmV3Rd7idu1Iw34g01dQXcisj
	ElVc29CGPoGIRmNf7iuJ8GpL6lkt9iTpceNarlUda/t8xkWky/rRdP0BVYkX3RTMJJ65tMKGaR3
	DdEGf6g/tlMC/PUJ0zwNY+Jgu3RcZi/K6IBzRJJ/PSY411Z80ZxtK9DFBbI2IyherzkQLJxKOMB
	cTMocceervF/5IwW5IS+0pmKxA6Fpv5Al2aEDrsuFodckrHZ7kaK3GcChOMiu7mMUqMEVYW3mIA
	CibIuUxmHZLbH2LmSYrC35AYrahgZojsGHlUQcecYDuNsQL+h0VZepomjNlM94xE9SJXBx7BN8G
	lGVc8JeXHfq9CAPpo4hpki93xpsKdAiaNLtKEj7XP9PxBimql7C5Cba1z6679QYAXexmlwDebzK
	d+SP71xLLQfhJf6KqsCdMzyjtH9wQBuhN0yMPtyVu3jVxnPojIJuui0FowQhtYqEv+UW9eDthb8
	rvqoRx4+0PZlsLuQV4AsHTMQDxUk8+NI9T9mmpzA8qhQRyMC
X-Received: by 2002:a05:6a00:908e:b0:880:78ca:8400 with SMTP id d2e1a72fcca58-8beb58bcc22mr12493288b3a.12.1794888821899;
        Mon, 16 Nov 2026 20:13:41 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm4414882b3a.16.2026.11.16.20.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:13:41 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5665: do not block workqueue if card is unbound
Date: Tue, 17 Nov 2026 13:13:23 +0900
Message-ID: <20261117041323.4010546-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4561d07d897f ("ASoC: rt5665: cancel jack detect work on removal
to avoid use-after-free") added cancel_delayed_work_sync() for
jack_detect_work and jd_check_work on shutdown and remove. However
rt5665_jack_detect_handler() and rt5665_calibrate_handler() busy-wait
inside the work callback until the component is bound, the card is
instantiated and calibration has finished. If such a work item is queued
and the device is then unbound before the card is instantiated, those
loops never make progress and cancel_delayed_work_sync() blocks forever.

calibrate_work is scheduled from rt5665_probe() but is never canceled, so
on unbind its handler can also run against the devm-freed rt5665_priv.

Reschedule the work with mod_delayed_work() when the card is not ready
yet instead of looping, and cancel calibrate_work on teardown too, as the
sibling rt5682 and rt5668 drivers already do:

commit 4c33de0673ce ("ASoC: rt5682: do not block workqueue if card is unbound")
commit a6d78661dc90 ("ASoC: rt5668: do not block workqueue if card is unbound")

Found by static analysis and code review; not runtime-reproduced (needs
RT5665 hardware).

Fixes: 4561d07d897f ("ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5665.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 4f7b13571369..27744497033a 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1194,19 +1194,13 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5665_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	while (!rt5665->component) {
-		pr_debug("%s codec = null\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
-		pr_debug("%s\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!rt5665->calibration_done) {
-		pr_debug("%s calibration not ready\n", __func__);
-		usleep_range(10000, 15000);
+	if (!rt5665->component ||
+	    !snd_soc_card_is_instantiated(rt5665->component->card) ||
+	    !rt5665->calibration_done) {
+		/* card not instantiated or calibration pending, try later */
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5665->jack_detect_work, msecs_to_jiffies(15));
+		return;
 	}
 
 	guard(mutex)(&rt5665->calibrate_mutex);
@@ -4652,9 +4646,12 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	struct rt5665_priv *rt5665 = container_of(work, struct rt5665_priv,
 		calibrate_work.work);
 
-	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
-		pr_debug("%s\n", __func__);
-		usleep_range(10000, 15000);
+	if (!rt5665->component ||
+	    !snd_soc_card_is_instantiated(rt5665->component->card)) {
+		/* card not instantiated yet, try later */
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5665->calibrate_work, msecs_to_jiffies(15));
+		return;
 	}
 
 	rt5665_calibrate(rt5665);
@@ -4840,6 +4837,7 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 		disable_irq(client->irq);
 	cancel_delayed_work_sync(&rt5665->jack_detect_work);
 	cancel_delayed_work_sync(&rt5665->jd_check_work);
+	cancel_delayed_work_sync(&rt5665->calibrate_work);
 
 	regmap_write(rt5665->regmap, RT5665_RESET, 0);
 }
-- 
2.43.0

