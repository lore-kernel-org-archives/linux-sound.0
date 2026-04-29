Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D382D1F44
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487662; cv=none; b=VdaVfY546x8Ep7cXM8twU0MoulmfvqzDZUf9AYE6Pq0lXXUS2oBrgaXmMWEPQERk3MbGPN7Y1nXUOSZp4I9jQmQJl3U0h7b9MNHPTe4/IPX6upnh2yBHLvI0ko94FYZTtXMu5pHYedxiy9oFQL6Q1vGGaul/yi244/m3u+XBY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487662; c=relaxed/simple;
	bh=ggB6iqNXAUdCdmuPFrKjyW2XjK/FQ6ji9Jf6A5CZqXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ck2H+vjbxWre9j/r+J4FwYDrwCDATmwU3if7CWZIPR7AOYihwAW1cWeT+wBLWJjgyhUoYaorsK6Qop4QQxGpzTD7Ie9bQz2s50XcOSS5LSBOpo7k9uBzDNc3RKgkN8QZsby4XdsUi4WionB77AKKRUIqXLXUenI622yOf5rqs78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE/YGvp2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE/YGvp2"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba895adfeaso176208eec.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777487660; x=1778092460; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWNz7f7Eq6/FoxVuvOcnlGaVoOPITwz8TC8gscczLsw=;
        b=jE/YGvp2dMK9v0gJT3sGP5/SXyQau2J1qALs6IuPDPUd7JMkZiCpQN8TYcl6fbHFkc
         8rq0G/OvZqnga4Z0zyv/HELe1EuPpDUZKTJVkUDJ8eJB3NWNFvv6vBXphCYLZUNZAWZ8
         zqTUKu71SE0DwITpBAjq3JHSlkFg9gN/O5L1dorF0zvEnkuEpsRs6m1P3ak8iuAhEU1+
         AQ3lVtjoD2ha7duhZQvcmEH6pz059iXZrB5vibKy7WGL4NXxOZBTTPYox3D4DLBPGAEo
         3IFnPari7RURgEHZR7v1vvDHABfhy/QWWI1C2dGhLlA8LjO1AKWQTzHr0xcFbbD8+HSU
         co+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777487660; x=1778092460;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWNz7f7Eq6/FoxVuvOcnlGaVoOPITwz8TC8gscczLsw=;
        b=Fie2LIANeMLSq2syV1u7hpnG1b4pMz1/R79+2LSrnmY3tg3V9ouPrBEWYSpQ39APgw
         Jlxmw4L2GZbatM04ZEveiQBwm56H2R9kgmWWoBq6q5+7ad/gYOWK/lzvJxZvCSTBr1f/
         Arffo96iUINIvumxXZlHujLQRytVeTt97XHs76lpAs4PebwtzFHVCRjV1EFqnSQhtqBA
         xWIP9qT8Xf7/zSH22+Fw5Zvy7OuSSzbc54bqHybzbDn6Isc/mmWNq8H2kGNcazSVrXaA
         2Xu8foDZP5CTCXy2UhexU8PvEGJTNvFRmjzf3F2GvUZ0kBPWg0NEuKIZf5z4YUiVKZIX
         FgXQ==
X-Gm-Message-State: AOJu0Yw7+eQghbaLQwzLgj+tEsXDYzD7C1de/AeKtLjRRJr/wd/XF8S5
	vxF0feaqCdLWe6d8LA8305sZmpzfkA8KBGo58MZxonA8yQyoiifqi65q5E9jMBev
X-Gm-Gg: AeBDiet1517mmt0crrCgmL4g4c2UdCa0luypmW5D6dOREjCxBLhIovqDYhRt2fB1b8h
	nHWiklqGcs33S2uJ8MGfaPfKCQEiDM6l3rLnieTOl4hKhBs5ScAQT/88qboUMotz8fYvabxZTAB
	mruvpNi0WHeYGUCPIWBFZN7MVQvi/Doveewlo6OQqhE20e41KTA0qnG/0eaEERUMQdVel9d874+
	emF3nlYtaM7DPF3PzWeXXPM20/dqgA8uxVSllJNgj3lrr6ORQYucxSBDmr6dSRTrFqIgXUjkwWy
	j4d5zeqKcqgSe9fBbIboiHmp11WxzNlxz7pExCMfYmxSaSlrMQj3r0k9yd6kUvFF4VMfUHx099W
	laviPkBNh5/mRfVEPubYttBMotdhlMaytt3JKtRgMmZ/A6h22+35ANIRc3LmOdVi7vA3GIWw+dI
	SIy0ctgxSkF6lD65F6euoAlR6F4DJ1s7KD0ZeEDqMju0YSUcl8YfqycKbf/bzCVOTLg7tx9wQbw
	9IvFmwIeLJD
X-Received: by 2002:a05:7300:dc86:b0:2e2:27bb:a4a2 with SMTP id 5a478bee46e88-2ed197ac539mr2258327eec.13.1777487660066;
        Wed, 29 Apr 2026 11:34:20 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c09c6e3sm3136785eec.25.2026.04.29.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:34:19 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 29 Apr 2026 15:34:05 -0300
Subject: [PATCH] ALSA: hda/cs35l41: Fix firmware load work teardown
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-alsa-hda-cs35l41-fw-work-teardown-v1-1-ba82a429fff0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTsJrdWoVzEuhnaQKmnNDFoSw
 t2punyb/xdQlsgKl2YB4U/UmFOF2TXgB0p3xhiqwbb22DprkEYlHAKh1/1hdAb7giXLEycmCbk
 kdCcfOjKOzj5A7byE+zj/Htfb3/ruHuynbxjWdQNptUEPhQAAAA==
X-Change-ID: 20260421-alsa-hda-cs35l41-fw-work-teardown-48cdba14a9cd
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Stefan Binding <sbinding@opensource.cirrus.com>, 
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5974;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ggB6iqNXAUdCdmuPFrKjyW2XjK/FQ6ji9Jf6A5CZqXY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmf/NVFA+crG8ocvMt/dXag3s2vix42PsqU/3vjjfOc7
 0uOPPc36ihlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJpJ9nZDjd5PSpaGL62dpA
 vonZmxxeVxgyOCl1xzEvbjy5YX4adxTD//gyn+Tzsy+4phytOSfiZ3Xm437RPztOFsy64dt0hFl
 sAicA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l41_hda creates ALSA controls whose private data points at the
cs35l41_hda object. The firmware load control can also queue
fw_load_work.

Those controls are not removed on component unbind, and device remove
only cancels fw_load_work through cs35l41_remove_dsp(). That helper is
skipped when halo_initialized is false. With firmware_autostart
disabled, a firmware load can be requested before the DSP has been
initialized. If the component or device is removed before the queued
work runs, the worker can run after teardown and dereference driver
state that is no longer valid.

Track the created controls and remove them on unbind so no new control
callback can reach the driver data or queue more work. Then cancel
fw_load_work to drain any request that was already queued. Also cancel
the work unconditionally during device remove before runtime PM teardown.

Fixes: 47ceabd99a28 ("ALSA: hda: cs35l41: Support Firmware switching and reloading")
Fixes: 4c870513fbb0 ("ALSA: hda: cs35l41: Add read-only ALSA control for forced mute")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 77 +++++++++++++++++++++---------
 sound/hda/codecs/side-codecs/cs35l41_hda.h |  5 ++
 2 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index b64890006bb7..7f18be0ccf5a 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1325,6 +1325,43 @@ static int cs35l41_fw_type_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ct
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(cs35l41_hda_fw_ids), cs35l41_hda_fw_ids);
 }
 
+static void cs35l41_remove_controls(struct cs35l41_hda *cs35l41)
+{
+	if (!cs35l41->codec)
+		return;
+
+	snd_ctl_remove(cs35l41->codec->card, cs35l41->mute_override_ctl);
+	cs35l41->mute_override_ctl = NULL;
+
+	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_load_ctl);
+	cs35l41->fw_load_ctl = NULL;
+
+	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_type_ctl);
+	cs35l41->fw_type_ctl = NULL;
+}
+
+static int cs35l41_add_control(struct cs35l41_hda *cs35l41,
+			       struct snd_kcontrol_new *ctl,
+			       struct snd_kcontrol **kctl)
+{
+	int ret;
+
+	*kctl = snd_ctl_new1(ctl, cs35l41);
+	if (!*kctl)
+		return -ENOMEM;
+
+	ret = snd_ctl_add(cs35l41->codec->card, *kctl);
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to add KControl %s = %d\n", ctl->name, ret);
+		*kctl = NULL;
+		return ret;
+	}
+
+	dev_dbg(cs35l41->dev, "Added Control %s\n", ctl->name);
+
+	return 0;
+}
+
 static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 {
 	char fw_type_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
@@ -1360,32 +1397,23 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 	scnprintf(mute_override_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s Forced Mute Status",
 		  cs35l41->amp_name);
 
-	ret = snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&fw_type_ctl, cs35l41));
-	if (ret) {
-		dev_err(cs35l41->dev, "Failed to add KControl %s = %d\n", fw_type_ctl.name, ret);
-		return ret;
-	}
-
-	dev_dbg(cs35l41->dev, "Added Control %s\n", fw_type_ctl.name);
-
-	ret = snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&fw_load_ctl, cs35l41));
-	if (ret) {
-		dev_err(cs35l41->dev, "Failed to add KControl %s = %d\n", fw_load_ctl.name, ret);
-		return ret;
-	}
-
-	dev_dbg(cs35l41->dev, "Added Control %s\n", fw_load_ctl.name);
+	ret = cs35l41_add_control(cs35l41, &fw_type_ctl, &cs35l41->fw_type_ctl);
+	if (ret)
+		goto err;
 
-	ret = snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&mute_override_ctl, cs35l41));
-	if (ret) {
-		dev_err(cs35l41->dev, "Failed to add KControl %s = %d\n", mute_override_ctl.name,
-			ret);
-		return ret;
-	}
+	ret = cs35l41_add_control(cs35l41, &fw_load_ctl, &cs35l41->fw_load_ctl);
+	if (ret)
+		goto err;
 
-	dev_dbg(cs35l41->dev, "Added Control %s\n", mute_override_ctl.name);
+	ret = cs35l41_add_control(cs35l41, &mute_override_ctl, &cs35l41->mute_override_ctl);
+	if (ret)
+		goto err;
 
 	return 0;
+
+err:
+	cs35l41_remove_controls(cs35l41);
+	return ret;
 }
 
 static bool cs35l41_dsm_supported(acpi_handle handle, unsigned int commands)
@@ -1522,6 +1550,10 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 		device_link_remove(&cs35l41->codec->core.dev, cs35l41->dev);
 		unlock_system_sleep(sleep_flags);
 		memset(comp, 0, sizeof(*comp));
+
+		cs35l41_remove_controls(cs35l41);
+		cancel_work_sync(&cs35l41->fw_load_work);
+		cs35l41->codec = NULL;
 	}
 }
 
@@ -2058,6 +2090,7 @@ void cs35l41_hda_remove(struct device *dev)
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
+	cancel_work_sync(&cs35l41->fw_load_work);
 
 	pm_runtime_get_sync(cs35l41->dev);
 	pm_runtime_dont_use_autosuspend(cs35l41->dev);
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 7d003c598e93..56ec07c0bb74 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -57,6 +57,8 @@ enum control_bus {
 	SPI
 };
 
+struct snd_kcontrol;
+
 struct cs35l41_hda {
 	struct device *dev;
 	struct regmap *regmap;
@@ -75,6 +77,9 @@ struct cs35l41_hda {
 	int speaker_id;
 	struct mutex fw_mutex;
 	struct work_struct fw_load_work;
+	struct snd_kcontrol *fw_type_ctl;
+	struct snd_kcontrol *fw_load_ctl;
+	struct snd_kcontrol *mute_override_ctl;
 
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;

---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-cs35l41-fw-work-teardown-48cdba14a9cd

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

