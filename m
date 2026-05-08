Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07783FFABC
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252626; cv=none; b=cj2AR35XNmtM5Q5LVaIiTefuYKwg7aTim3au58Ht8Joi6fjgpt6OAlosuYjLY35yey9R7Bf7gjw+Stm4yAiNceWLf3pTM8FfPKq7TqORXZXcJDfHTRlDq2GReXsd9n/pVdzEVxs7JPKxK1IaCEW1O2dupgaYkdrQWS47T2c/xX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252626; c=relaxed/simple;
	bh=TH9dczhTjQEhar2KYDg+eYkeLByvqUVPgRCcViqkALc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3FrNq00T7vHof0c7rQ513U1iFh0JTrU+UDsdxS84b52S3RHLJ1F68JMUaO6VRTHLWhOa/LCwQR3Jgovu7DN9bQVtKZjhnYGsbgAgFhuW9r0K8Q0ejXAMbDSMdWkjg+ruXCsGfLPrJmWL8ekdI91QxNw3XIhMsW/q0DWOoVgZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DYEJr3xh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DYEJr3xh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1300190f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778252623; x=1778857423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2MMTl7quIO4DRgo4Wy71sfQT6nifE8diEZsX0WUHk8=;
        b=DYEJr3xhtUsumG8YhZCKjV6Jq5o8wwqsXuXoaje4cx26f4s/UiREaDcsrRoaH7Fyls
         k1f5XPbAJwblGtGUHNX/wjqr2i/ywHe5uBSd9RYPHwewp/IdJJ8tXGidrnKYiYrk4hRp
         kSEWlmxtRymftfpMoyWFQ3F4bvKowMZF4DXsgNx2veA2sKUjm4fLsPMBjruw+5JVwdQx
         QWmjgY3e1EBf2lmLetk26PqBZWvyabozCVxqlYnjqIm/Hq6FOUqzov4zgzm6SsI8IuPF
         SuQHeFHaWa4s/tfHIQ+cDEQfEEgUdgY6EcXqg5TYEyraQ3VOdWdr8Hc890PIfJcnu518
         teJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252623; x=1778857423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2MMTl7quIO4DRgo4Wy71sfQT6nifE8diEZsX0WUHk8=;
        b=SVTmRc3D7cxnCaAOmxkVNwQGiSZSWmg7v+C/D6uwa3+veoWt22zvU2FbwRikpcWcam
         4oKJN2ZKuOepfXtmMIZzR5LpkYjfwL53Z/XIeQbkTvr9tiUo2s/bRrd18Yyx1xou32wF
         gXd2RMdGCD600tnGx1QA/wX3+XlVrQIb1eGcUS3lpAh1DD1EBTVTgaQuORqxgVY3zxYk
         dk4jFLNulGK8YXKAFl5yIMqkTO1P7puSLPUBkM2uRDOO92VmVP+isNwShZ34nFdt4a3q
         6ETXdcuvKRdnISBRDLWXiJbICnjpbfVfsDyLozjRJPnewjyaFGQfKm0eYs7M4UOt+7fv
         dKqw==
X-Forwarded-Encrypted: i=1; AFNElJ9hUQIkHhgwMruB36rfrsvEdjA7hrHMpAl16w9IcPoILkjf8Jt9YybucfHbDHx9g72oNtlWZPpGlXztIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LnORhplY3bVSglaDZA2WT485fvQk/8kKbM8G7qN+X9qIeXtO
	3RKhEK4V7ib/Xhxh16r98EvFsmPDmzFYOuS34S/pu7MZykRKV/foSjI/iDMPM+PqewQ=
X-Gm-Gg: Acq92OFz4GGmxYyYAyVWss8xcnt0NZhSK4+8gM7JodvrzIlHBSqJESV9X4AiofYFjkZ
	y2UQ76ZRbKavCSZeczQsRAFYB0QfSykWGRhhcoyiWscbGvbALN97v5BdZSUvEOuTlwBJVwzOOST
	ST5/Ogwr4CCIwX3RXG6KHlga6+uwhx1Sk06+fOXFovEF4rCqbwA43LgzJJ1TjDPMG84F+NAR/lY
	Fq8kW5WduMrSZX9PyKuwBqDVzUxjl+Xh2I3idtv1XEjeKK1aJrwBriFf1lEv1tRHEoKAwygubJ5
	795dpfDfsV5NnOE30mEsh0rs3cwnz5WG5iqjt95GB+0SdigbjH1OS/kiuHW5PLOWe24kNMK5h56
	FmAagsXO2URwZAv7tz6UtYNH82saUAqV2rrN3n01CL8jYrtcV0hovdd7cPvF+alIZwebMLvWoDd
	wWwdEfNuNIP3t8FP82XmNo3shMWpC/XyAl/0HHnQZKjCBbpps82YFgYh+WUg==
X-Received: by 2002:a5d:5d02:0:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-4515d4d1107mr20288394f8f.30.1778252622785;
        Fri, 08 May 2026 08:03:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm5262918f8f.30.2026.05.08.08.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:03:42 -0700 (PDT)
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
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [RFC PATCH 2/2] ASoC: codecs: rt5640: Move long delayed work on system_dfl_long_wq
Date: Fri,  8 May 2026 17:03:19 +0200
Message-ID: <20260508150327.351779-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508150327.351779-1-marco.crivellari@suse.com>
References: <20260508150327.351779-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 sound/soc/codecs/rt5640.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index f6c6294e1588..1a5bb72b7d03 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2397,7 +2397,7 @@ static void rt5640_jack_work(struct work_struct *work)
 		 * disabled the OVCD IRQ, the IRQ pin will stay high and as
 		 * we react to edges, we miss the unplug event -> recheck.
 		 */
-		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+		queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 	}
 }
 
@@ -2410,7 +2410,8 @@ static irqreturn_t rt5640_irq(int irq, void *data)
 		delay = 100;
 
 	if (rt5640->jack)
-		mod_delayed_work(system_long_wq, &rt5640->jack_work, delay);
+		mod_delayed_work(system_dfl_long_wq, &rt5640->jack_work,
+				 delay);
 
 	return IRQ_HANDLED;
 }
@@ -2419,7 +2420,7 @@ static irqreturn_t rt5640_jd_gpio_irq(int irq, void *data)
 {
 	struct rt5640_priv *rt5640 = data;
 
-	queue_delayed_work(system_long_wq, &rt5640->jack_work,
+	queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work,
 			   msecs_to_jiffies(JACK_SETTLE_TIME));
 
 	return IRQ_HANDLED;
@@ -2579,7 +2580,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	rt5640->irq_requested = true;
 
 	/* sync initial jack state */
-	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 }
 
 static const struct snd_soc_dapm_route rt5640_hda_jack_dapm_routes[] = {
@@ -2632,7 +2633,7 @@ static void rt5640_enable_hda_jack_detect(
 	rt5640->irq_requested = true;
 
 	/* sync initial jack state */
-	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 
 	snd_soc_dapm_add_routes(dapm, rt5640_hda_jack_dapm_routes,
 		ARRAY_SIZE(rt5640_hda_jack_dapm_routes));
@@ -2860,7 +2861,7 @@ static int rt5640_resume(struct snd_soc_component *component)
 		}
 
 		enable_irq(rt5640->irq);
-		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+		queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 	}
 
 	return 0;
-- 
2.53.0

