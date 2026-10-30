Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374927;
	b=BUiSuwoC+WKCQyIVf9d+ndNj1JFPn1wTCKOfN6tQBghz6eJrFZlQGT76MkeVfHc4KZ0f
	 ZaNnHFMyUmQsgaKHvPAhIUGoicOAchRPbw5CKO11SSK/cUMxZH4gPWBDe26sTcbAKXU7f
	 p+2Jo0NNO2Cy3FhX5oX4gWSzF6UprrYmQ/ttyrnJqbdmvJ2vw93f9/YxXBl3TUVjRlFqF
	 ROhthdREg8DPY9oeDUWmWLKfXJecpsie2o4E/BH6HLdUuKaQvbEzQbYW6SS/TSe5PoAik
	 OAFJBx98MubGY4ZoM/PCw5ZBrRABpIQ/ygLwemqc2E0C7klHe10ikVWGd5pxqFWsNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oT6zOKuMmrGX2JEsJt0a3oM6O2BasGKB2xgXzQNQ0cA=;
	b=XZkJ+OwDj/0MqCmYld2dj0qKFOlGQ69jLViU6lWrLTiSrrW9qO5DndjMhbTkHhv4D2n3
	 ccOWZrfwPxOSAzFfIugHtz3ndySVmYJmrAZKitGtuGzvrsaqdI6/ZZTfbbjb9QYx9VSsn
	 TU3AraYkARLEYOiHYbvwzhLfwx2VwwvPfvIPElzE1b6d2+jqz64h+tURyK+Urnft1jHCN
	 KZNUGFH6FL9hwtWICEGcnHh0PdQ+R/ClWtR5gTLz6NvNypLk/BkB/7WgDfVY9A6tBZVZR
	 D4qGO2sJaAMTf5GcBRk09ZMqBSzVSijlm7VN6xlsRAb0yHvUlXhgmNmhG6QLbJp2N9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAtPukdo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E45606A323
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E45606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAtPukdo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10089055e9.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374925; x=1793979725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oT6zOKuMmrGX2JEsJt0a3oM6O2BasGKB2xgXzQNQ0cA=;
        b=pAtPukdo/UiYKxal4WaukbEkirnB8ZnJjxuUIQ9b7lb5XpvR6D9hdNS4DkNfM/KdnN
         ogkuhRNg835ghSmmMJ3g5odlK5UJSEIeuAgjvtychRea9DxvLE3IFyaxaYKFMHcOs5da
         CqvcGndHhFAO9QfGOdrOjaV9Ps7zSQGYD6gZ1HLi1BeA+3qwzZG9pfHq/j6jC64xmEZv
         d3296XRVx5Gd7Jta8YIf27M2Pskpy9J0NMtY176S7+U+MzOo4o61u1bA/le8LaugyFiQ
         DJTRREcNf4/T7L/izZ+/NPqNch80PP3D5BvHTb32JkAMGioDbB7BTdsKvOOovEdTWP1L
         Dhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374925; x=1793979725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oT6zOKuMmrGX2JEsJt0a3oM6O2BasGKB2xgXzQNQ0cA=;
        b=Ik7hSrzRbsZ8mUY8oGeXIMgNZgTmDujOgJC4N7Rl/IYNy23pFbEAm6ODT/6dSecfyQ
         hiLAYTGrgliASeN5A0LXshuBp8JAJVCaOkDNFtLz6TIa+qB0mg5AQtY0w8HMCIbwxSdB
         qBcd7vW4KVpgDo7lug5FRikMYj8FTuYClrd8fOW5O+F1wc1zpCnxAPyW1PFjX+YjKz06
         X9Vx7dGRT532IqQe5Mm06gTK5n8XpWWX/RE3AqTc+szsDPIhUsLqUv7PQ3gi/E8IEIl+
         QNKeQ6XGolTaaLr08zpB1kl72VhAjJM080Tcs8j/PTT0F+a57LkIP5L4xgSWQHqaig4i
         1czQ==
X-Forwarded-Encrypted: i=1; AKwUvBy92d05sA11GvPZ+hR49vJO+/KYvA89PzvLzPGqoEE2I64s7FXaHDlZOykSagP7ChurVOu02cbGrKQTsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsrrCA0D7lZWWuSgFRYGsnZr1aVx0xv9dMlSuG3XxACL7/tRtF
	Vy1cA4AY0X1bGtv7AtXZXSnrgtGdCMMNuD1qUs/O0yD3O0Yd/GXIL9E=
X-Gm-Gg: AYBFou3+/JUyxoL1fc5eDzM9+uj8LKQsbVzd3o8vFjYO43bCZcpzE5J7InX6472SG8T
	CLwLqNDJl/Cpvaf8feAVamMdaKPV8ABMADg9t0q/fxXE5qBElxGYWv8tJLAfFv5nmevdhDZ24VM
	X1OoNxPwx87GDEC2XPZD5QyeYXteUiSsAqy7EVdnq2Hi3q3ASVnHpd5CKP2SXlTH7YgUfKU9Inf
	wiFO8jvG1Lc44OH4bI1eBrgoa4RVxvdNigR/jm7nblNn0kyQPgKxT8hUS1xPCZBsiX0cilFmZqQ
	quv8tpFL8lRTgItaUE/f+SObyAi5UqoBy7Qp9rRWylUJUWMaesGVGKTdoFSckpi9txukUABjLZe
	mSkjxIwhUJvTLKWNlt9rP59JpzdbzmuMQL6etGVEYduA1mVxrh/Uh73o6gULIaSIawzXjM1fTBq
	B6c94fVcsLMwlfCKGIGj/WPfr8jeKA088fGqeSMfrGR8r2FnIE2JEXfabbR4BPa57VgMzXAJieG
	G4RmT7VuLz9cGY4gA0LaEGz5v++WLg6cRtXEpuvaZoco8dkXGAWurKeWDtWqjxVs6kCbbIyaUtd
	lbS2wAuYNYI=
X-Received: by 2002:a05:600c:3f10:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ac1889cc2fmr54045215e9.19.1793374925337;
        Fri, 30 Oct 2026 08:42:05 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm144419935e9.3.2026.10.30.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:42:04 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 1/4] ASoC: rt5668: cancel delayed works on component removal
Date: Fri, 30 Oct 2026 15:41:59 +0000
Message-ID: <20261030154202.2989936-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030154202.2989936-1-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
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

The rt5668 codec driver initializes jack_detect_work and jd_check_work
but neither is cancelled during component removal.  If the device is
unbound while work is pending, the handler can access freed memory.

The jack_detect_work handler schedules jd_check_work, which re-arms
itself every 500 jiffies while a jack remains inserted, so both must
be cancelled.

Because the IRQ is registered via devm_request_threaded_irq(), it
remains active until after the component remove callback returns.
Disable the IRQ first to synchronize with any running handler and
prevent new work from being scheduled, then cancel both works
synchronously.

Fixes: d59fb28562232 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
  - Also cancel jd_check_work (self-rearming every 500 jiffies)
  - Disable IRQ before cancel to prevent handler re-queueing

Changes in v2:
  - Resend as part of unified series (no code changes from v1)
 sound/soc/codecs/rt5668.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..b273449fac9db 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2222,6 +2222,13 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (i2c->irq)
+		disable_irq(i2c->irq);
+
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
 
 	rt5668_reset(rt5668->regmap);
 }
-- 
2.47.3

