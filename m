Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1C2F0673
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775883285; cv=none; b=e07BGQ/rll+7h7KKbjxgIIW/NrLZ68IiDmJiiC0kc7m8i64+cSVo4KHiJCVORNvvKgDt1iuSX5FEI4nU2n05/qUOrVc41tjMKMLmUceo1a3xPRDFQSx+n+aJ6F7Zh4HwkiGNtq5id610ak5lYCJWjlKYcH/Ar38hGhTaFVLxADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775883285; c=relaxed/simple;
	bh=44VU8sEg3pSU05phaWthjAuCttLZNp5eU+EubpFEzns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTyZQKPe5teOgCuSAx1SNA8IIvA+GACnm99dae+FKxdbjNX7NNXnwUTu2VQ6C1rZjvIS1McUZjQllG12rgpZCHofqCb6toncoqIO0QfAwnZNWZSFoDfvwPn/MAmnrJIrh4+Gqogl0rTGRAHaCbBngt12xaCgBZH7E+pEjjYadVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkdwY5Xd; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkdwY5Xd"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128e4d0cc48so10361737c88.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 21:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775883283; x=1776488083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byGIJZB003iIrAl7vLNw6wWjasi/2CrJc6DHYo+7Dlo=;
        b=EkdwY5XdCYtsPGWfSbFeY+lDiXoZvz5HjVPqrcutr5vB9xpA2j9m1mim0sRMERm1xJ
         T5p+kon8NVKNZddCUrzuGb2T6/VLHGsSdkI6R8kV9mq2202aGY5Gz11eECsrnNjQauIc
         75F1HSDr1CbMM+BnhIKc40Jpvm76Yl9BXTmW8Z8V2J5dbruEnC7tkZxD7xmCYBfgirzE
         PfWcEkf/pem8xsKW35Yx8953m5vztkME2xF5hruSF901/SPzDxfUjRnyehW+SQdmPao9
         UOXF1PZNPHFlD06UybiuIBn+k/tZN7WfGGhnfFYogMIk8EBkBP8HhwH1cOzkeu4EykC3
         TQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775883283; x=1776488083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byGIJZB003iIrAl7vLNw6wWjasi/2CrJc6DHYo+7Dlo=;
        b=UEmkVLEeYYMCgdqwmHh0QlsObSH1PADyEVvdrR/pUcKgFHJYxHPa8nSQbosXARZBw2
         GOjXfQqebjC+Sy5HaLramKB76nE3loaTSQOEJsCXAZ78bPKb057ejFLU+bvOHy3mZBcQ
         Ud9C0nU8PKKIvIibqOoMs4LG2D+CHenTNNXZ2v6cNTkfL28tBl8m5p0CRs3onUOPxD/v
         fRfLBXQQKTmGxh2+P/SrtAMTkYHg9IqPmWcs5ILOeHsolKZddDRaU2BnOfZcjslG6xff
         f+ylm5H+2zuQMATggyqJl4zbXC7Xj0lAqCJG5E5bKkMxSEPn66pfJiYgH54rj3OeFMu5
         xY9A==
X-Gm-Message-State: AOJu0YwdF4MEUw44gMgfHjh5UB/4Heku5dCTdriNp51+Cve0dZVDZonE
	fnZgqDlyuDihU9ElAQ+hkPb1K0X0HkhytrAlDfDlY7dFp9aYrgRDRZ3W
X-Gm-Gg: AeBDiesIqphnM6Up5VepnFBvuJVDgCwfOQAEIYjDI0Lg3cC71WRVmklygvvlXQbkj5c
	/aq8zXi2UYur/d8LlQ/67WWEf19pNcNNgGDqpNdtJPPEppUNWj5+Ar+9IgKv1LJHeMjPhOsF5KO
	XMDBZWfT7sGBalClPRAZhOHUE5iJ0pqC4tKyEmdCLfoL9D2bdeXQkEtmpBswVW+S93FGfOaaB5/
	fe71kwbEguzwL8LiK7MmNu67WqGmXhnC40XEO/zReDqWwe3A+x9yI6VjSrECn3bkBHORhR8UUrd
	49MNt3+lPD/i7TGVeur3RUySfQgYyJoecST5SungYCg4BS0PZokPwYu202hmiw4+14BMKbba/ZK
	ER3qMX0tkBqViR7kT7OB0gTvM3mQLLBjGaep8m0wGlrkNgx+aX8X548sb2n3taeMbvaDGp+xP/q
	4raqzXqF3FPNxrsb1C/tRDCiT/kIgl6BQdoGEPGgjWhbehWl09+7+vc43DHzOzukJT0Y+kDJdbJ
	Pe3
X-Received: by 2002:a05:7022:3d12:b0:128:d967:4678 with SMTP id a92af1059eb24-12c34eea0f0mr3260109c88.23.1775883283133;
        Fri, 10 Apr 2026 21:54:43 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm7378754eec.17.2026.04.10.21.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 21:54:42 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 11 Apr 2026 01:54:30 -0300
Subject: [PATCH 2/2] ALSA: sscape: Add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260411-alsa-sscape-pm-v1-2-3058d988783a@gmail.com>
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
In-Reply-To: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=44VU8sEg3pSU05phaWthjAuCttLZNp5eU+EubpFEzns=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3r3CtmPVEK8f723vb+GX7Phz//XOPb0TCl7t6E9T+J
 hqVTny4vqOUhUGMi0FWTJFlddIiyz1dD67Wx63wgJnDygQyhIGLUwAmcpmD4X/kckPmqXtnpdbw
 dDY89nndclav65Bh54tfLn/Ysxpuym5n+M3S/u55vGXG/0CWZzKr/ApcWk6s+cg5edprC/7y2Yf
 EU9kB
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The SoundScape ISA driver has lacked suspend and resume callbacks since
commit 277e926c9b27 ("[ALSA] sscape - Use platform_device").

A plain snd_wss resume is not sufficient for SoundScape. Resume also
needs to restore the board-specific gate-array routing, and non-VIVO
boards need to reinitialize the probe-time MIDI firmware and MIDI
control state when the MPU-401 side was enabled during probe.

That firmware reload can be handled in-kernel because
commit acd47100914b ("ALSA: sscape: convert to firmware loader framework")
moved the driver to request_firmware().

Add ISA and ISA-PnP PM callbacks, reconfigure the board on resume,
reload the non-VIVO MIDI firmware, restore the MIDI state, and then
resume the WSS codec. If MIDI firmware reload fails, keep the WSS resume
path alive and leave MIDI unavailable instead of failing the whole
device resume.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/sscape.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 3e9465bc64ed..ff3d9e2498d9 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -144,6 +144,7 @@ struct soundscape {
 
 	unsigned char midi_vol;
 	bool joystick;
+	bool midi_enabled;
 	struct device *dev;
 };
 
@@ -1103,6 +1104,7 @@ static int create_sscape(struct snd_card *card)
 			}
 
 			sscape->midi_vol = 0;
+			sscape->midi_enabled = true;
 			err = sscape_restore_midi_state(sscape);
 			if (err < 0)
 				dev_warn(card->dev,
@@ -1114,6 +1116,77 @@ static int create_sscape(struct snd_card *card)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+/*
+ * Reload the MIDI firmware and restore the saved MIDI state for
+ * boards whose MPU-401 side was enabled during probe.
+ */
+static int sscape_resume_midi(struct snd_card *card)
+{
+	struct soundscape *sscape = get_card_soundscape(card);
+	int err, version;
+
+	if (!sscape->midi_enabled)
+		return 0;
+
+	version = sscape_upload_bootblock(card);
+	if (version < 0)
+		return version;
+
+	err = sscape_upload_microcode(card, version);
+	if (err < 0)
+		return err;
+
+	outb(0, sscape->io_base);
+
+	return sscape_restore_midi_state(sscape);
+}
+
+/*
+ * Save the WSS codec state before the SoundScape is suspended.
+ */
+static int snd_sscape_suspend_card(struct snd_card *card)
+{
+	struct soundscape *sscape = get_card_soundscape(card);
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	sscape->chip->suspend(sscape->chip);
+	return 0;
+}
+
+/*
+ * Restore the board-specific state before resuming the WSS codec.
+ */
+static int snd_sscape_resume_card(struct snd_card *card)
+{
+	struct soundscape *sscape = get_card_soundscape(card);
+	int err;
+
+	err = sscape_configure_board(sscape);
+	if (err < 0)
+		return err;
+
+	err = sscape_resume_midi(card);
+	if (err < 0)
+		dev_warn(card->dev, "sscape: MIDI restore failed: %d\n", err);
+
+	sscape->chip->resume(sscape->chip);
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+
+static int snd_sscape_suspend(struct device *dev, unsigned int n,
+			      pm_message_t state)
+{
+	return snd_sscape_suspend_card(dev_get_drvdata(dev));
+}
+
+static int snd_sscape_resume(struct device *dev, unsigned int n)
+{
+	return snd_sscape_resume_card(dev_get_drvdata(dev));
+}
+#endif
+
 
 static int snd_sscape_match(struct device *pdev, unsigned int i)
 {
@@ -1170,6 +1243,10 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 static struct isa_driver snd_sscape_driver = {
 	.match		= snd_sscape_match,
 	.probe		= snd_sscape_probe,
+#ifdef CONFIG_PM
+	.suspend	= snd_sscape_suspend,
+	.resume		= snd_sscape_resume,
+#endif
 	.driver		= {
 		.name	= DEV_NAME
 	},
@@ -1267,11 +1344,27 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int sscape_pnp_suspend(struct pnp_card_link *pcard, pm_message_t state)
+{
+	return snd_sscape_suspend_card(pnp_get_card_drvdata(pcard));
+}
+
+static int sscape_pnp_resume(struct pnp_card_link *pcard)
+{
+	return snd_sscape_resume_card(pnp_get_card_drvdata(pcard));
+}
+#endif
+
 static struct pnp_card_driver sscape_pnpc_driver = {
 	.flags = PNP_DRIVER_RES_DO_NOT_CHANGE,
 	.name = "sscape",
 	.id_table = sscape_pnpids,
 	.probe = sscape_pnp_detect,
+#ifdef CONFIG_PM
+	.suspend = sscape_pnp_suspend,
+	.resume = sscape_pnp_resume,
+#endif
 };
 
 #endif /* CONFIG_PNP */

-- 
2.53.0

