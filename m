Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379880;
	b=zj0Y4/brMr7KExyg9DQHWZMc0QnoEWz9HXj/H45y+MRWM1gQMCSiPXxSgO5CAeVWenDm
	 WPrCJZkVCJ5q/jqsSJGeS+505T5OLnn+ctPqW2anx/uoqjn8KmdEOO/a8l+KOEL/MsJuk
	 SZ3oFrvIhzdhJLwM8s26QZhOvApgIA3cdC59DvQMUdw4Ags4hOa8Pw745hVQ91TCeSq7Q
	 dzimOZbYKy6b3FLbf4h3eQai4s7hOGbvLqcq+Egf0x1AuEx8QNPXisMQTEL7CqFAsXEdW
	 IZK40elpvtr13cO7oZVGyqjhUn9K7qEKsIsk1E9WWuvZHEu+GectNxnQocvnRsCXmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
	b=zNmm6JK7SJXnB/1SqNSqXYDeGQaznr1mAMm/BGtEvcvDTjuPAdl4g/ka7muskl4cTs74
	 n8kZIbVdKQUvo+g/PqbPXazmgq3wrfde2r1ye0VbmOxOF3OwYtBYSssFCtnFYS+4/56rn
	 MPTwMhCzI5wZ3l5kdjXuMhyS8qdg9UJHIeWBqJKgrrV930zEe0hVRMzLEnZkGFBQSHJWH
	 8dIHJB5ZdIG6s4xgMSpE+HButvW+wn/Jlkq7FiWJQS2fLaLRQDdIMhGyo9hUzsPE/46hO
	 qVjTUzHcgM6kjpDMn0Yr2QApYu7qNHUziY8AUpxBk6O3+8ngtjgqAMI69J+JSCQa5gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkayg9It;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF0606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkayg9It
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso1189333a12.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379879; x=1793984679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
        b=nkayg9ItWzxMNCzU3NeFuBygS75kj29Ch049Bs3LK6W65Dq1/Kj/fOlMadvexMreav
         Q7PyGDVJEphPEORQSXxw8QVaCKzE01zHq2ricdU2j1rNCOO+zK5udlNxRC7hg3VKhWOM
         r2ryhObNhehRbTpw8j9MpL92GsfWCFbv4YWaTyRRhMZwTlOGYR4Vsf7wRaHntUPRCtwS
         A5Yz4Qi/ZyifJhBiKHaD2+9us4doS0czfz3RRHSm4+kG3xALHzc7XGKVKaYuohWvdltI
         bV/0mNYV/4FmovEf1W9ITylR2yGmmmwWYa9xD8T3yy7mGZIhKN4gGE21aJm9DGpH+ZWz
         gZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379879; x=1793984679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5+c9AXhONOxMQgPc6CEGvMQHwLZrqKxnpe3CnRk/A4=;
        b=PLo2wpocvVAuOZkg7LY+DQl/CoI+450euw2sWqaGmb0y+6hRLfPD1IIZN+bOy+u2eu
         9VVXb4KIBfNwB8X18EnUs0eSAkXEE7fARGPVhm3UvhriAManRh1a5dDGRqV3nR4ccDw3
         vsak8iSq0MtepnaC78TaaRYDPQXmeDscXLlY2ANXzYayEQmQWvuTBFJ7+vBF0aroZiPi
         8yaPLvray6tJFlcpGTF5tU5VLYoFfn4rEBdunvt+KUxLKGE/1JXKiCNf32Z/8V+g5RFG
         Ziw50ascn8b/1P4yrd9ARbU2yIgwpOya6K83YJAnX6q1dgZ0xtPU5KUsrFZooHWVyV4Z
         WlYw==
X-Forwarded-Encrypted: i=1; AKwUvBzL3tnQlX9kRO1O0hzE6XypMNxKgfRNP+RmNsYe1v2qAhbZIBvpGD4o/npsiyqtQCH1LbiaWYU/OSAMYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ1HrP2o5quOOFuRydjB9b8rgvyRTYym2P8Cd/BWfDa5880Wk2
	KRoVLhyJmq5KCQIlDfSJ3B8+SNO2ERUBBEFgxGPU3hRrw5rMADAIL8YjaLOg
X-Gm-Gg: AYBFou3Hq0T+xZvGUeW/gWqvw0a31ZzmQmyBpDG3cmhHopHrkISYqTYcLjfQ+IE3fBu
	dpt2HYLUrUvEF2aYsfHkTuId6eJVr7bjimHTu7LSH1XYa1+eZf5mOKfQsLl7Msihj9DmZZSchYU
	on1JCgzqi7S/QFsH7R8J6USE8rFZB6POqJ/vbyRw9Gzw77tXufJyOugxRg5jkUcF+B3SHCQQ8ol
	IBPuG4kN4RLHp0ZK2pzfn1GrdYGrzpNHC3pC38hN3yoda4cKYi3vzJFGJ5ztA/qJT1mj++7jxPw
	tFNw/zJL+xlf2QWchkIKnppGm3ZA5AIBc0Ey9UeXKJCG7ph6YifGDt0jh0N5wgULAufNVuhjLbk
	lRJc3YOMAoCHCF2bRvRfxcj8pBwFOmApC9BKcpVCvCQBNiAkvoF2MaB0NA4whLgtkGKmGd/lhcY
	650Hm2+ndKaTTgmUIOsQ6tPYUZZnco0CfJ+iTHiOP2p3mM6kcnRc2MZjTM5X3UeFz55N2vS+Da1
	BQWMaWIUeRgzH9g1jJ9E3/+I6heksvMMgun10cnYcQqv20X2xHG2OAncg9A7P69EcqySNX4s9Fy
	oqm2X/cqY7U=
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ac14ec75fbmr62918775e9.1.1793379868131;
        Fri, 30 Oct 2026 10:04:28 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm75121785e9.13.2026.10.30.10.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:26 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Date: Fri, 30 Oct 2026 17:04:16 +0000
Message-ID: <20261030170416.3561618-5-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030170416.3561618-1-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
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

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Cancel mic_work before and after jackdet_bootstrap because the two can
re-arm each other: wm1811_mic_work() can re-arm jackdet_bootstrap
through the DAPM power-up chain (force-enabling MICBIAS2 triggers
clk_sys_event which queues jackdet_bootstrap), and
wm1811_jackdet_bootstrap() detects a jack and ultimately queues
mic_work.  The second mic_work cancel catches any re-arm from a
jackdet_bootstrap handler that was in flight during the first cancel.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/wm8994.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..b9e0df83b9bfe 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4551,6 +4551,13 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4592,6 +4599,13 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3

