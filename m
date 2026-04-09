Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB012F49F6
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711278; cv=none; b=PajCbpdKyQrqcvfeQ+JT18Ma3tAGi8A767tww4/DVnIEXmcEx75g09CqJ10wKAIEckDSba9RM/AvClV3EZQ5GrBWx3gf38RMkAffI1ukF0vXwxJd4C8rQM9xth2WDN7/cPBRCx14HnwHH7rTksDDjbG5rHhW0RyvkEt8FWfVBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711278; c=relaxed/simple;
	bh=pfwOpdAdZI4xY8r5fACVHo0rsIzCJKOkeJwOMfBKiBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgnskSp+Zvqi3PmJqMuQjkKquKyT4X1H1oPd7kzVQZmAshuqCrZa94XwCXXaA9a0tB2KeCMlwrXJ7Xm5oRpAMv01wQOhUJlWyCkdmiXa5MwW02L8CXweLtYsqh1Eg3n31SNwxDUz4RRwffcQxGqCWLaP2iC4+C3sKjsHoDaQu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDtQlUUq; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDtQlUUq"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ce22328930so513567eec.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 22:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711276; x=1776316076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQRrl7XoC33ZfAgtXK6CjQZg1231c3QiHaTyzrwZJ7k=;
        b=RDtQlUUqyDuTsyF1h0kxp2NnY3I42ViEKu3Q4NDC5NAogfmBLhaBm+Ct6gBJNH94t0
         GHVsn6qRGzCyzflj7YEX0cIR9sdHvlbMH3hafkgt8z18DDlgc0TIHi+4vmNpMXnDsnVs
         sMg8zUWquVYtsf2C58h7kA5jjuMs6bii/Pek5W5JHL7ckEwgjqXoO3QEN4Ryiv/XQAzV
         O1uEKcmhoFzaoKoUb+uxJJ5KmrFJm10hJaL11n1q6jKReBLxofEKQsro1ZzCAhTatd9m
         R2/fGpxBWFMmkRhaQw81iS32RJ3sXOxPoXdhFLApl+u0o+I0/0TaKaZ+klN4OvCkM2qm
         jCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711276; x=1776316076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZQRrl7XoC33ZfAgtXK6CjQZg1231c3QiHaTyzrwZJ7k=;
        b=V8h1awRoaxLkH5sc6G8TuZkNkEVxS8GjLKauVazDjDqK2Cq0GDOFELu7tcLBhhcGPM
         OI9yGBU1BlOMfLp3asiInwbRSl4bcCUgKVR/X1OLrESWeruI7iuEXRIzN15uUBYAOFLB
         nDAB2UaTK/uHayTCxUNiyVcLDj4XGfyKJV6E5ITbQKc9J+lvg1xKYe3fTR0Kfj0H/hyl
         WSDvOqhiW507wihBO5FJg7NVWuZesXZ9Ugmwj4+HWiq+d798WnaSCLrmSspaWvQLcmp4
         hSDgMq4LVmL3FhvpgTHOjq8JpyjXLjFOinSdxUmLVWqJRW4u/QTJLCLYjxZLDgIfjMsW
         uUjA==
X-Gm-Message-State: AOJu0YyMjk5as2/pJvQIUdv8aeOQ8pmZFnd8SpJFlwu1JhxSOnBkGaxz
	86+PrZST5eYwLd0KIuaM+NjYynif9m5C09irvILbWPYJCeRdyUd4ETaY
X-Gm-Gg: AeBDievlHqwJxM7VTE/7VBxEqNSJHQ0VkxOAmXHjmqSz/94GVyyBIzKUKGAr1EHsJlD
	A+p74+LqtMykd937Fpwh5iaNGTZawOwT7HemCW7Jb0yXQ3Sus/TrsMpDJaUBpNGgAeE2mJUQW+O
	WtKxTvpLDJBSJ8yenb2dcRbfWXwgPT0Glhi/Scj9rmMpLr1x3Ii/yJCvjbTtaBqTJYUIDa5SDEb
	y6Yga4PU8emD06lg+hCmHw6WkqEOCVxgFpztPqw4YBUwLaT9ogmh3ygxyiFStNkPSfR+aNgbzUb
	DRJQkstR2GTLSXs/EZR5Tr+f4PmVrydxL2kPl9HnyEMO8Cay8RYCKX0aarnm2piVveJ5+dhwxUL
	bZZC5a3GvwYVYT5pdri+FWd3FizRGk02jcwMvk+pQIYK3hOC+6RRxp11X+2OpmvEu+hC3YhQBFN
	s8cDhd35aaSQZuF4zOjRYuhgosZPklACmqQSvkgt+emXeNg8MVqK7nYoBr1mMquopjFZaseVcU/
	A/R
X-Received: by 2002:a05:693c:3005:b0:2c5:60d0:7031 with SMTP id 5a478bee46e88-2cbf97f57d8mr13277716eec.4.1775711276357;
        Wed, 08 Apr 2026 22:07:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm29975641eec.14.2026.04.08.22.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 22:07:56 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 09 Apr 2026 02:07:46 -0300
Subject: [PATCH 2/2] ALSA: msnd: add ISA and PnP system sleep callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-msnd-pm-support-v1-2-2abef720d0e7@gmail.com>
References: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
In-Reply-To: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=pfwOpdAdZI4xY8r5fACVHo0rsIzCJKOkeJwOMfBKiBI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnXTVTOTtpW9Povj9/T72xF0/Rk2p5YP1+xu732WjKHY
 La9dmJgRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk6XZGhvvuppWXa7Y85TUV
 f33+LzvfRa/vGnc2OugeSmK6WXL/83WG/2lBwS9LbotcTp7ycPIqrf0+bZ/3qz5mTjgZqa4QE7p
 ckREA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The msnd drivers do not implement system sleep callbacks today, so
they have no defined way to recover DSP state after suspend.

Add common card suspend/resume helpers, rerun the DSP
initialization path on resume, restore the cached capture-source
state, and rearm the shared IRQ for already-open users.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/msnd/msnd.h          |  2 +
 sound/isa/msnd/msnd_pinnacle.c | 95 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/sound/isa/msnd/msnd.h b/sound/isa/msnd/msnd.h
index b25beca25c0d..56a700e6a5cb 100644
--- a/sound/isa/msnd/msnd.h
+++ b/sound/isa/msnd/msnd.h
@@ -253,6 +253,8 @@ struct snd_msnd {
 	spinlock_t mixer_lock;
 	int nresets;
 	unsigned recsrc;
+	u8 pm_recsrc;
+	bool pm_mpu_input;
 #define LEVEL_ENTRIES 32
 	int left_levels[LEVEL_ENTRIES];
 	int right_levels[LEVEL_ENTRIES];
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index c4eec391cd29..5b729bb02ef6 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -513,6 +513,19 @@ static void snd_msnd_mpu401_close(struct snd_mpu401 *mpu)
 	snd_msnd_disable_irq(mpu->private_data);
 }
 
+#ifdef CONFIG_PM
+static u8 snd_msnd_pm_recsrc(struct snd_msnd *chip)
+{
+	/* Convert recsrc to the Capture Source selector: 0=Analog, 1=MASS, 2=SPDIF. */
+	if (chip->recsrc & BIT(4))
+		return 1;
+	if ((chip->recsrc & BIT(17)) &&
+	    test_bit(F_HAVEDIGITAL, &chip->flags))
+		return 2;
+	return 0;
+}
+#endif
+
 static long mpu_io[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
 static int mpu_irq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;
 
@@ -1001,10 +1014,73 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_msnd_card_suspend(struct snd_card *card)
+{
+	struct snd_msnd *chip = card->private_data;
+	struct snd_mpu401 *mpu;
+	int err;
+
+	mpu = chip->rmidi ? chip->rmidi->private_data : NULL;
+	chip->pm_recsrc = snd_msnd_pm_recsrc(chip);
+	chip->pm_mpu_input = mpu && test_bit(MPU401_MODE_BIT_INPUT, &mpu->mode);
+	if (chip->pm_mpu_input)
+		snd_msnd_send_dsp_cmd(chip, HDEX_MIDI_IN_STOP);
+
+	err = snd_msnd_force_irq(chip, false);
+	if (err < 0) {
+		if (chip->pm_mpu_input)
+			snd_msnd_send_dsp_cmd(chip, HDEX_MIDI_IN_START);
+		return err;
+	}
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	return 0;
+}
+
+static int snd_msnd_card_resume(struct snd_card *card)
+{
+	struct snd_msnd *chip = card->private_data;
+	int err;
+
+	err = snd_msnd_initialize(card);
+	if (err < 0)
+		return err;
+
+	snd_msnd_calibrate_adc(chip, chip->play_sample_rate);
+	snd_msndmix_force_recsrc(chip, chip->pm_recsrc);
+
+	err = snd_msnd_force_irq(chip, true);
+	if (err < 0)
+		return err;
+
+	if (chip->pm_mpu_input)
+		snd_msnd_send_dsp_cmd(chip, HDEX_MIDI_IN_START);
+
+	chip->nresets = 0;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+
+static int snd_msnd_isa_suspend(struct device *dev, unsigned int idx,
+				pm_message_t state)
+{
+	return snd_msnd_card_suspend(dev_get_drvdata(dev));
+}
+
+static int snd_msnd_isa_resume(struct device *dev, unsigned int idx)
+{
+	return snd_msnd_card_resume(dev_get_drvdata(dev));
+}
+#endif
+
 static struct isa_driver snd_msnd_driver = {
 	.match		= snd_msnd_isa_match,
 	.probe		= snd_msnd_isa_probe,
-	/* FIXME: suspend, resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_msnd_isa_suspend,
+	.resume		= snd_msnd_isa_resume,
+#endif
 	.driver		= {
 		.name	= DEV_NAME
 	},
@@ -1111,6 +1187,18 @@ static int snd_msnd_pnp_detect(struct pnp_card_link *pcard,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_msnd_pnp_suspend(struct pnp_card_link *pcard, pm_message_t state)
+{
+	return snd_msnd_card_suspend(pnp_get_card_drvdata(pcard));
+}
+
+static int snd_msnd_pnp_resume(struct pnp_card_link *pcard)
+{
+	return snd_msnd_card_resume(pnp_get_card_drvdata(pcard));
+}
+#endif
+
 static int isa_registered;
 static int pnp_registered;
 
@@ -1127,6 +1215,10 @@ static struct pnp_card_driver msnd_pnpc_driver = {
 	.name = "msnd_pinnacle",
 	.id_table = msnd_pnpids,
 	.probe = snd_msnd_pnp_detect,
+#ifdef CONFIG_PM
+	.suspend = snd_msnd_pnp_suspend,
+	.resume = snd_msnd_pnp_resume,
+#endif
 };
 #endif /* CONFIG_PNP */
 
@@ -1161,4 +1253,3 @@ static void __exit snd_msnd_exit(void)
 
 module_init(snd_msnd_init);
 module_exit(snd_msnd_exit);
-

-- 
2.53.0

