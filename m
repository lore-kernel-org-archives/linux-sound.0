Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A880399CFC
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 03:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132808; cv=none; b=WWbMNcs76l2majCX9K9T77XSQZqVH7KIKqSd1WlNJ8UyxIDoFU/oOI6NzumlPWNLCT70zNsftBfXD0oR6pLgAIBaZPLssLxMt4Q9ZOnV/ITLmnRK7QEHo14zaZ5VeKuJMb87pwB8Fi2z5QwMcsUydVyX1/odAQakZ6t1OF3Iwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132808; c=relaxed/simple;
	bh=jVvp8cQvVO65iSrX6R/3lkuLS/Epjnwiwgl0VUfRVqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYf9eAL/KBjikO6myW27JXMa5D5lPpEaOZkLqr2zXhYDRhVHGGq86e6J0OdWhyMfGkip7JfOT5C27rQiAyA8075uXOYOizMsgH9b8t/7BiAuLQmsWtVgnAHZfSd6Fx3FzsD2WJzXQWlrM4LBNe9JIzvxuddISwJ9VC/M9g+5BHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD4H96qe; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD4H96qe"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-912431d946cso3994166d6.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790132806; x=1790737606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7YLiQV6UnwJ/cVPDydZtFxL4FrkjERPwfQTRvlN7uM=;
        b=ZD4H96qecdmlMrFPp/OGFE2bW8xf4Mmit6+vqUiPMiRa5ZAsyWqwxe2S0r0GSruQWJ
         7L79cuw65lOSfmJ2uJQLAIwkf/NKXrxa4dmV6DTqKL7htAbA6akrKCndkiOAvj0olM0d
         cCvKjAyiI7eHKF3gLg+Ov8L2ftQtq7/Bew1KM/nNdam+E3x0IWS6ygPk1yXfF95ZLT+4
         buBZpK9GH7hk7wtW2Tk29lwHowXZLDaPPO0hUQFSZxOcZOOhFvqITHizspc4TLZYfNFv
         SmBH5iHsjPXlXN1DibPL9Tj863uZKSacOe1onZmz8Wg81dKkCWCT2LHIdIYIoh27XWC7
         HI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132806; x=1790737606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7YLiQV6UnwJ/cVPDydZtFxL4FrkjERPwfQTRvlN7uM=;
        b=nHkmMAMIQW7zdVorqsOJjkR5EqESLIAM0nCGz42dUah0c8UQBZBfoB4yVV7RmrLmKs
         28Tb/M7h72od8N+VmlVwjl/fljqWnbzd1lMvfbIiBw8f4aLcNwX2PMd+uoNkB+Grc/Zt
         p1nOdinedr0B3Z37I4wqL9vH0EG4P+p8dYa2c8ds6U8Ay2Eh+owgyvTZS7CXF+GXkaie
         YP0p69/ldQAxKYY5BNof/TJSn3cEtXMuLeSTkOIoYdGiPJU5Ygktu8opc6PjMzm/lF+Q
         LD7gOCtggMZQZqXsg2VNTcmjc1N937iSL0da4N+HXuD2Mee/6NuPEyJ06c/cruMqyJKE
         Xkdw==
X-Forwarded-Encrypted: i=1; AKwUvBznc8HjBhVZymw7VhJq7LfdT+uVrWrcRPexC57o4AYA3NdqNvqjmNbbRQDb4w6mXALnphKQa0Izxx2Tag==@vger.kernel.org
X-Gm-Message-State: AFuF++n052DC1cKQFVssd+wfIJIUbIVr9XIJ5ZwiOqtbXX918z/k5q+W
	FEUgLSO2QHmsMPhPerc86AAydzcNQ2r9cT5IBJoNeacJALVa8/HoCxs=
X-Gm-Gg: AYBFou2iUqSBoQbxlWuRI8qypmwVrjNoiNH6V13bnfQcitIuXvv1VDvBUaTYjAbm34v
	0XsnRn4B/hd4dRKGFLk6qTVR6c0NhVJjgBH3nnki+i+ABIfsNmi9HBNo3MaibBzXODGfixgf3TW
	tVE9jZxaV+PUTCKIF/EOnH+GZOf8B55c8R2JlxitpSbgU+7WNRsBqSsz+kn58NRyyv0OA4+C47n
	2cBNYiQob9gD+lkjhGjxClAZ9Km9aDlDnFl5oLhFtW+bXjPEh+Sp63Tx08P+Agun7pv/PZrGEY+
	TLS1nkzdMlED44OL1lMy2jbVY1d30R1M/lJwu6hZG+GEyNAaS3qhUQoCZ+brwqBfqbBDWwX9A77
	45dU3BDmV4IKaaDrPu25v3iKaNRzv/Ctp82KYu7hrgK5mRLYQLZJxaffSb+8xaguclahSnxQgAP
	Rud2+EsvozmacQhz6Z4li2dlYyYwA/6R51MfoeNUXk0bOfYymZKgFJanoxmmpZs61Xphj6yXij0
	1UgHjJFEiZ7ivBLTDvFAMniCwj3reIk5vONCGqTt6WzsOHHYE3DNz+1NXOYmsnkRp2VRKDDGG89
	Y1Z3Mrq/8dkpDWqOWs4Ic331Qr/0
X-Received: by 2002:a05:6214:8091:b0:914:5f6:a76d with SMTP id 6a1803df08f44-91405f6ab9bmr40042526d6.3.1790132805554;
        Tue, 22 Sep 2026 20:06:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c46acdasm11486826d6.42.2026.09.22.20.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:06:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
Date: Tue, 22 Sep 2026 23:06:41 -0400
Message-ID: <20260923030641.992569-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wm8962_remove() cancels mic_work, but the IRQ that queues it stays
registered for the I2C device.  Devres frees the IRQ only after that
cancel, and card unbind never unbinds the I2C client.  A later MICD
or MICSCD event queues the work again.  The work calls
snd_soc_component_read() and snd_soc_jack_report().

FLL, FIFO, and thermal handling do not use the jack, so leave the IRQ
registered.  Queue mic_work only while the jack pointer is set.  On
remove, clear that reference, synchronize_irq(), then cancel the
work.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to direct regmap usage")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Do not disable the IRQ from wm8962_i2c_remove().  Card unbind calls
  wm8962_remove() while the I2C client stays bound, so that disable
  never runs there (Charles Keepax).
- Keep the devm IRQ on the I2C device.  FLL, FIFO, and thermal
  handling do not use the jack.  Clear the jack, synchronize_irq(),
  then cancel mic_work so the handler cannot queue it again.

Found by inspection; I do not have the hardware, so this is not runtime
tested.

 sound/soc/codecs/wm8962.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..d97289461e02 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3115,7 +3115,7 @@ static void wm8962_mic_work(struct work_struct *work)
 
 	wm8962->mic_status = status;
 
-	snd_soc_jack_report(wm8962->jack, status,
+	snd_soc_jack_report(READ_ONCE(wm8962->jack), status,
 			    SND_JACK_MICROPHONE | SND_JACK_BTN_0);
 
 	snd_soc_component_update_bits(component, WM8962_MICINT_SOURCE_POL,
@@ -3203,9 +3203,14 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 
 		pm_wakeup_event(dev, 300);
 
-		queue_delayed_work(system_power_efficient_wq,
-				   &wm8962->mic_work,
-				   msecs_to_jiffies(250));
+		/*
+		 * mic_work reports this jack.  Removal clears it before
+		 * synchronize_irq(), so do not queue once it is gone.
+		 */
+		if (READ_ONCE(wm8962->jack))
+			queue_delayed_work(system_power_efficient_wq,
+					   &wm8962->mic_work,
+					   msecs_to_jiffies(250));
 	}
 
 	pm_runtime_put(dev);
@@ -3232,7 +3237,7 @@ int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int irq_mask, enable;
 
-	wm8962->jack = jack;
+	WRITE_ONCE(wm8962->jack, jack);
 	if (jack) {
 		irq_mask = 0;
 		enable = WM8962_MICDET_ENA;
@@ -3247,7 +3252,7 @@ int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 			    WM8962_MICDET_ENA, enable);
 
 	/* Send an initial empty report */
-	snd_soc_jack_report(wm8962->jack, 0,
+	snd_soc_jack_report(jack, 0,
 			    SND_JACK_MICROPHONE | SND_JACK_BTN_0);
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -3594,6 +3599,15 @@ static void wm8962_remove(struct snd_soc_component *component)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 
+	/*
+	 * The IRQ stays registered for the I2C device, including across
+	 * card unbind.  It is the only producer of mic_work.  Clear the
+	 * jack first so a new handler does not queue, wait out a handler
+	 * that already loaded the old pointer, then drain the work.
+	 */
+	WRITE_ONCE(wm8962->jack, NULL);
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
 	cancel_delayed_work_sync(&wm8962->mic_work);
 
 	wm8962_free_gpio(component);
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
