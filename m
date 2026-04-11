Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E0311968
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 18:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931300; cv=none; b=mgYWVHcxeRylx3eyWFEd0iUEHkvFM3vLmiTn2GGP+lnAPjJiG8x6Ch1Sx7Vjt0FvdFjRauea8cQp+QU8Cl+TXWmAi2D4kCsZGzDeBjdTRZ/2oBrYevmLFDW94b2G34Ven2ljcknqHN+Ep5HwW4vKsn1fZt0+nDNaoM9Fa+MHTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931300; c=relaxed/simple;
	bh=JFfoqwMVeT5YwC7Mj2h/2QwAUTtfU8oUhv1gKgOzqPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOJBn9lcX5vTi+2MLNiae6n3c1Wb4SFDDqe+3dRc0WJ1Tecw8L1eB36SpOk6/IAn1qsR56J56hxQY7zOjvqItc/pHMhAJ7YEc1UNwn60tR07k3TjRnHmXdD9qmsasn36rcMgxcMC+vTbm0hLkR4j5dASLkB1GJ/rPZZi7QuhucU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9K2Db7E; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9K2Db7E"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c45281a06so334890c88.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775931297; x=1776536097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyJvFj1J0DxahqFN0TQkOSw9GkLQZJBa6Fp8Qfm2mJs=;
        b=O9K2Db7EyPlEOUL/z5jvmPcQH9r0koDZUfCv5c7bjl55+83PD8+RaLW8YDPeh4KsgZ
         Cl13+Dys44d00e1Y92VE0rEC+YIfX+wMwF6dqg4a5U16eIFloHs5qouRuZQUIgGqz+QG
         7uCmx3PnOMF5GzcoACIahv6e5EnP9YKHPUTrTW7Rjkn1ZVCM8MEaNkhXQFwVfYGCJhuq
         Uxr6N6baQq7mZMRU4V/wvqIGwyI0hvTawIHzG3AVDDDcl65RdcpVFRl54QOX6wDzwd9f
         /toqljw8I4Q3tKs3DByArox33rAS0ZLyze/PQUvrSv8Kgty3LKPYgbMTTKPGitvyvLrC
         Ml7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931297; x=1776536097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YyJvFj1J0DxahqFN0TQkOSw9GkLQZJBa6Fp8Qfm2mJs=;
        b=eU078HJHsL/k+JqqdTDrvMfJxbm5489ZyOL9fKCEM2tUOQYClaHa5Ev2Qvc779Swum
         h63vY7TN1NHlA4ZRWqfVj+k9M0ahm0ZsSlEgujiiGLFCcEWg1owpdcUsfMTxUXmFdOGf
         QK/Hd/Acvcl1hnrJvLbhrHXDuelWPNBXsPZ8Vb1q3ZvOhCslxMhMu6V/MFQESOT+MVN8
         uGWqfMfj0cJuPMpVlIfvYW4X/HwCs4PMh1V/ko/cRDAcArvvA4PNAE8PNtzFBqHWFmmJ
         fduKcWqAcD6/Vs0Q23Hwmk1mn9yS1asHsFdMMZESaUcJpVioyouQaZHpM3Pe5SR2sL59
         xGTQ==
X-Gm-Message-State: AOJu0Yz8P3lrUksCXgqJzzz6ewivjK6MMMvHobvxXfniDrmTRC2uwRjY
	iz6JGvOXH/nSrmlfrDwZaF8KGrBMNLoErfHquyIsNmx8GS62xUxZRk5r
X-Gm-Gg: AeBDiet9WIeeR/11q1Lq7ky1eTtBDTVPUfp2TLTaDRifzuu4VkFxsy/3fxHVy4Whzjd
	IAmQptCJG88rD82jr8uLCcYIOQ4SEPJAymmsIH0V98b0nDA7CpufYhINyUZFQ4b1G3k7H1L94Dd
	35ZtK4s//txKM24CmpZlp/4C7xPP9FAcY/rVahsJoCm9Mr1AxJ3zNsiS+Ex5BPpipzgakibVRq+
	dizHJfSE9k12EedH9v/Nc4+suU5YAlxb+JYPj5Wwot0Lz/9y4sKRcYegngh0yxShozIgtyDt1Pg
	pJ2YB+KfT1hjeEztp7ofzWS5PIlykBCY4p3xrMgvWke2hOdfmXdoJegu0lbkfVWufbgdXFfX2vK
	ClzJRvp6K3VIYOYbUmNvnS9Hve1TJkdtangCEAxmhZZlo7CwHQPezPckk9NBmyLMKkuDuX0UtdF
	IwY8+IfXFx5r4y94NWHbQZQAwkDKyJ2l7u3JKBV01IBtp4lI+puQaDh5JHmaS/MU/V+Y+E3xz3P
	6qT
X-Received: by 2002:a05:7300:e207:b0:2c5:d833:a4fe with SMTP id 5a478bee46e88-2d5876a10f7mr4451864eec.10.1775931296585;
        Sat, 11 Apr 2026 11:14:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm9627404eec.9.2026.04.11.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:14:56 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 11 Apr 2026 15:14:41 -0300
Subject: [PATCH v2 2/2] ALSA: sscape: Add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260411-alsa-sscape-pm-v2-2-aeb5682e14b0@gmail.com>
References: <20260411-alsa-sscape-pm-v2-0-aeb5682e14b0@gmail.com>
In-Reply-To: <20260411-alsa-sscape-pm-v2-0-aeb5682e14b0@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=JFfoqwMVeT5YwC7Mj2h/2QwAUTtfU8oUhv1gKgOzqPs=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm3+qfvvnWexbbIayXnbR22ic9mxr0wknEJCv4w79Td0
 OYbNjP+dZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEHroyMpyZXvboX+DWd8ee
 9l4pb/wsE5bJcrrm4P21pnt+bxH9e2sVI8O575ciJzFmCvpVLlrwL91ptab2HZMHJ+2X/ZvDdp/
 /2lIeAA==
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
index 6e951b3c0080..553ceb92d298 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -144,6 +144,7 @@ struct soundscape {
 
 	unsigned char midi_vol;
 	bool joystick;
+	bool midi_enabled;
 	struct device *dev;
 };
 
@@ -1107,6 +1108,7 @@ static int create_sscape(struct snd_card *card)
 			}
 
 			sscape->midi_vol = 0;
+			sscape->midi_enabled = true;
 			err = sscape_restore_midi_state(sscape);
 			if (err < 0)
 				dev_warn(card->dev,
@@ -1118,6 +1120,77 @@ static int create_sscape(struct snd_card *card)
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
@@ -1174,6 +1247,10 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
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
@@ -1271,11 +1348,27 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
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

