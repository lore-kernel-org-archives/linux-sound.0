Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573093314C2
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 04:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521737; cv=none; b=nXl9QdYh384aWBrAwc/X9p2nGe8SvMEPr9aerhLDWKDjoi9VTvfoBh6Nfg63SdRJveXStH+eutDQYAcg4fnOOxCDbpCdEMowq2+1A5k135Fs4d7r6VRfDatOKLaSsbvof7RnSlPT5sDb2Wnnr/bS2++55sgZS7RbBHHM63MxP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521737; c=relaxed/simple;
	bh=ynqLYw8zk5KVx4jE+LlDKr4h++AttPRWRYWvwQ2HY20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WHt0q8c7+0fyqbal/s11r6fL1XCo4agdtzJMCjJIvEWSn/P8HW3To1jjHrp8FgTnPacXMHOwmpD55TREnTb9uuRYDCE05YWoAPvRnd0D4X6dOwJw3/klbzVVYTYsvTgoDpP/ifuc0eDRWDck8g7oH0UFrD8zmfUxivDIx3hi00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj8anph9; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj8anph9"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c8f9846c8so732841c88.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 21:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777521733; x=1778126533; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnqG32j2rEC21fiuSfzK8wXn5oGN92hklM3twulbezM=;
        b=Hj8anph9CkPJzQ+ZIvRxOZck67G37ca4Is3T4IPA1jfXTWFUdZKPPtivum39aOi+Z8
         r2eduEDwxNkM569d7B0pFBsSHfl9M6YnVOUYCAOScZcEb2/URiMlUwCfPlb8soWiS8g3
         CUz+sPnrHGG+3IDN9OQ4yYxWqUQlRtBL1t7E+oiNa+R1jEdLY5Ik+kC5Erl/3gC33MM8
         D10WWWML4uH5wu13zIsmtGGbX/pu0qiFJKEpDA54+RbAqyZD/Q9kOBZ+jV8eu7qh3hfg
         j7G+wqOsuyOrpDuFUAKrz8leesdP2gd1ChRxQ+nKjKaVmZdj48FPaZhnAC7OMiyMAtO1
         ejjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777521733; x=1778126533;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnqG32j2rEC21fiuSfzK8wXn5oGN92hklM3twulbezM=;
        b=hvEQRPGlcRUOTUYVWXfzPmXVXzOST8SBg0pfaSZapZiF8CWuTFl9d0E0t1MjPjszF/
         KMfFjfuqWDWywitRhHup+KfCPhc8r+DoCBhXLd1+mVeKVsJikPfwhdyVs5fQhhX65z1E
         cknz/8C4AKXjbDb0ze6seBEI9/zoDv5Yqezg7dPJFyo4f33FTFf1vBspFVyMTS7k4auN
         NPlGS8Tajqwdu2EfmdNyt/6hLQm18jRMH9x7WFxBQkPXMKYqQv0+yGkYTQAUMVGd0Il5
         z+o0bix8L4VdJ88AUb336ZKdTx5TucDlFtssxzRJSIT544JtJDp2DsoOMjoBk8/Ypp0k
         eClQ==
X-Gm-Message-State: AOJu0YywuJcc/dZ1z/jfFRgTU69Qn6LsV9e4BBuUT4AYMLK4Y8H/reDS
	fotOutwwHMm5KQw4OPVup0gn7BNhL8qb/I3BjSypAGZBHUgrKH02HX/1
X-Gm-Gg: AeBDiesDPm1yHgLg4YIlU2sfjBsZlTvuIQApBY4koIdYWV8hEb4OgUkvP6kPF2WrIMA
	WEVI77FkyccfbC89mmp53BMMszmkJOVdSpWTXM7TP7B8Y1vfCTZoHYtRaWc2fwm7VIlbBHFdiSZ
	zXPT5BtvdUXQ+saIi4LD/it5+8adANNnMOhF1ZCJjwqt6DtYproAAgA70XQHwuhc7ZEa94eO1I8
	B1wgMIVdwG7NQ/9R24bEd+blIjIYsKH9xvkKXo5gZKxxU/Vzac54a7J2yvyoHdj3jJnLr9k8a5o
	pCfe0xMtGqNOQ4vCBxWuCJYN/VHbUPhw/wzc0oH5Gln+jcWs26wYsmi4tmaC67KvIU09s+6Y3c2
	hSWeZvIzDEwWrZTfCjKztF6tX1bmQBJ9cPxSrkqtbg0BXPvUhtW2gY1qz0VIVr7pyeTuW6ezfVk
	YUdX+Bge5VZXaykO4hKZkrp3QGO1PzJQfU/LyoYDWIO2U/j9rBwKsA3Bl7mnNvxEzmmTEmCIONs
	7thpnE3CLXK
X-Received: by 2002:a05:7022:6289:b0:12d:ea6a:1d33 with SMTP id a92af1059eb24-12dead1c08bmr611167c88.33.1777521733086;
        Wed, 29 Apr 2026 21:02:13 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de31ab65fsm5636481c88.0.2026.04.29.21.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:02:12 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 30 Apr 2026 01:02:02 -0300
Subject: [PATCH] ALSA: hda/tas2781: Wait for async firmware callback at
 unbind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBA0as0s3YSQNJWr2K6GGBqUdIaBq1J0
 7uLunyb/zcQzpEFzs0GmV9R4jJX6EMDfqL5yhhDNRhlWmWNRkpCOAXCQmK6XuO4oqeUHPk7FqY
 clnXGo+taq6xzJ9NDbT0yj/H9+1yGv+XpbuzLNw77/gFHqrTJiQAAAA==
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11790;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ynqLYw8zk5KVx4jE+LlDKr4h++AttPRWRYWvwQ2HY20=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfrti2NOleTX+Z8IX3Uv/KBWvsbfcd656g9P9c9/krR
 noruqIPdpSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEtkUxMty1zpfatE+Oh7Fw
 qtubaM9faoKlzmpvP3hoc4ctzfjdG8nIcIZf+88D9mV7DEPW6Vg3qSftnRacvujf9z1CF3bYrY2
 o5QAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The TAS2781 HDA I2C and SPI side-codec drivers queue the RCA
firmware load with request_firmware_nowait() from component bind. The
firmware loader keeps a device reference and pins the callback module,
but it does not protect the driver's HDA private state from component
unbind.

The callback dereferences tas_hda/tas_priv, takes codec_lock,
creates ALSA controls, updates RCA/DSP state, runs runtime PM, and may
load DSP and calibration data. Component unbind currently removes
controls and DSP state immediately, and the later device remove destroys
codec_lock through tasdevice_remove(). A delayed callback can therefore
run after the HDA component state has been torn down.

Track the pending HDA RCA request with a completion. Mark it cancelled
at unbind, let a callback that observes cancellation exit before parsing
firmware or creating controls, and wait for any already-running callback
before tearing down HDA controls and DSP state.

Clear cached kcontrol pointers as controls are removed, and when
snd_ctl_add() rejects them, so a later cancelled or failed bind cannot
remove stale controls from an earlier bind.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda.c     | 39 ++++++++++++++++++++++++++
 sound/hda/codecs/side-codecs/tas2781_hda.h     |  8 ++++++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 18 +++++++++++-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 26 +++++++++++++++--
 4 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index b22f93424c62..52674f675461 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -241,6 +241,45 @@ int tas2781_save_calibration(struct tas2781_hda *hda)
 }
 EXPORT_SYMBOL_NS_GPL(tas2781_save_calibration, "SND_HDA_SCODEC_TAS2781");
 
+void tas2781_hda_fw_request_init(struct tas2781_hda *tas_hda)
+{
+	WRITE_ONCE(tas_hda->fw_cancel, false);
+	init_completion(&tas_hda->fw_done);
+	complete_all(&tas_hda->fw_done);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_fw_request_init,
+		     "SND_HDA_SCODEC_TAS2781");
+
+void tas2781_hda_fw_request_start(struct tas2781_hda *tas_hda)
+{
+	WRITE_ONCE(tas_hda->fw_cancel, false);
+	reinit_completion(&tas_hda->fw_done);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_fw_request_start,
+		     "SND_HDA_SCODEC_TAS2781");
+
+void tas2781_hda_fw_request_done(struct tas2781_hda *tas_hda)
+{
+	complete_all(&tas_hda->fw_done);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_fw_request_done,
+		     "SND_HDA_SCODEC_TAS2781");
+
+void tas2781_hda_fw_request_cancel(struct tas2781_hda *tas_hda)
+{
+	WRITE_ONCE(tas_hda->fw_cancel, true);
+	wait_for_completion(&tas_hda->fw_done);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_fw_request_cancel,
+		     "SND_HDA_SCODEC_TAS2781");
+
+bool tas2781_hda_fw_request_cancelled(struct tas2781_hda *tas_hda)
+{
+	return READ_ONCE(tas_hda->fw_cancel);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_fw_request_cancelled,
+		     "SND_HDA_SCODEC_TAS2781");
+
 void tas2781_hda_remove(struct device *dev,
 	const struct component_ops *ops)
 {
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.h b/sound/hda/codecs/side-codecs/tas2781_hda.h
index 66188909a0bb..d536108e4559 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.h
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.h
@@ -7,6 +7,7 @@
 #ifndef __TAS2781_HDA_H__
 #define __TAS2781_HDA_H__
 
+#include <linux/completion.h>
 #include <sound/asound.h>
 
 /* Flag of calibration registers address. */
@@ -59,13 +60,20 @@ struct tas2781_hda {
 	struct snd_kcontrol *dsp_prog_ctl;
 	struct snd_kcontrol *dsp_conf_ctl;
 	struct snd_kcontrol *prof_ctl;
+	struct completion fw_done;
 	enum device_catlog_id catlog_id;
 	void *hda_priv;
+	bool fw_cancel;
 };
 
 extern const efi_guid_t tasdev_fct_efi_guid[];
 
 int tas2781_save_calibration(struct tas2781_hda *p);
+void tas2781_hda_fw_request_init(struct tas2781_hda *tas_hda);
+void tas2781_hda_fw_request_start(struct tas2781_hda *tas_hda);
+void tas2781_hda_fw_request_done(struct tas2781_hda *tas_hda);
+void tas2781_hda_fw_request_cancel(struct tas2781_hda *tas_hda);
+bool tas2781_hda_fw_request_cancelled(struct tas2781_hda *tas_hda);
 void tas2781_hda_remove(struct device *dev,
 	const struct component_ops *ops);
 int tasdevice_info_profile(struct snd_kcontrol *kctl,
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..6693f4aa29fa 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -401,12 +401,17 @@ static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 	struct hda_codec *codec = tas_hda->priv->codec;
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+	tas_hda->dsp_prog_ctl = NULL;
 	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+	tas_hda->dsp_conf_ctl = NULL;
 
-	for (int i = ARRAY_SIZE(hda_priv->snd_ctls) - 1; i >= 0; i--)
+	for (int i = ARRAY_SIZE(hda_priv->snd_ctls) - 1; i >= 0; i--) {
 		snd_ctl_remove(codec->card, hda_priv->snd_ctls[i]);
+		hda_priv->snd_ctls[i] = NULL;
+	}
 
 	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+	tas_hda->prof_ctl = NULL;
 }
 
 static void tasdev_add_kcontrols(struct tasdevice_priv *tas_priv,
@@ -423,6 +428,7 @@ static void tasdev_add_kcontrols(struct tasdevice_priv *tas_priv,
 			dev_err(tas_priv->dev,
 				"Failed to add KControl %s = %d\n",
 				tas_snd_ctrls[i].name, ret);
+			ctls[i] = NULL;
 			break;
 		}
 	}
@@ -492,6 +498,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	guard(pm_runtime_active_auto)(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
 
+	if (tas2781_hda_fw_request_cancelled(tas_hda))
+		goto out;
+
 	ret = tasdevice_rca_parser(tas_priv, fmw);
 	if (ret)
 		goto out;
@@ -527,6 +536,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 
 out:
 	release_firmware(fmw);
+	tas2781_hda_fw_request_done(tas_hda);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
@@ -567,9 +577,12 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
+	tas2781_hda_fw_request_start(tas_hda);
 	ret = tascodec_init(tas_hda->priv, codec, THIS_MODULE, tasdev_fw_ready);
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
+	else
+		tas2781_hda_fw_request_done(tas_hda);
 
 	return ret;
 }
@@ -588,6 +601,8 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	tas2781_hda_fw_request_cancel(tas_hda);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
@@ -617,6 +632,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		return -ENOMEM;
 
 	tas_hda->hda_priv = hda_priv;
+	tas2781_hda_fw_request_init(tas_hda);
 
 	dev_set_drvdata(&clt->dev, tas_hda);
 	tas_hda->dev = &clt->dev;
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..a716a4fc644a 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -538,13 +538,18 @@ static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 	struct tas2781_hda_spi_priv *h_priv = tas_hda->hda_priv;
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+	tas_hda->dsp_prog_ctl = NULL;
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+	tas_hda->dsp_conf_ctl = NULL;
 
-	for (int i = ARRAY_SIZE(h_priv->snd_ctls) - 1; i >= 0; i--)
+	for (int i = ARRAY_SIZE(h_priv->snd_ctls) - 1; i >= 0; i--) {
 		snd_ctl_remove(codec->card, h_priv->snd_ctls[i]);
+		h_priv->snd_ctls[i] = NULL;
+	}
 
 	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+	tas_hda->prof_ctl = NULL;
 }
 
 static int tas2781_hda_spi_prf_ctl(struct tas2781_hda *h)
@@ -558,9 +563,11 @@ static int tas2781_hda_spi_prf_ctl(struct tas2781_hda *h)
 	tas2781_prof_ctl.name = name;
 	h->prof_ctl = snd_ctl_new1(&tas2781_prof_ctl, p);
 	rc = snd_ctl_add(c->card, h->prof_ctl);
-	if (rc)
+	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_prof_ctl.name, rc);
+		h->prof_ctl = NULL;
+	}
 	return rc;
 }
 
@@ -580,6 +587,7 @@ static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
 	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_snd_ctls[i].name, rc);
+		h_priv->snd_ctls[i] = NULL;
 		return rc;
 	}
 	i++;
@@ -590,6 +598,7 @@ static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
 	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_snd_ctls[i].name, rc);
+		h_priv->snd_ctls[i] = NULL;
 		return rc;
 	}
 	i++;
@@ -600,6 +609,7 @@ static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
 	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_snd_ctls[i].name, rc);
+		h_priv->snd_ctls[i] = NULL;
 	}
 	return rc;
 }
@@ -619,6 +629,7 @@ static int tas2781_hda_spi_dsp_ctls(struct tas2781_hda *h)
 	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_dsp_ctls[i].name, rc);
+		h->dsp_prog_ctl = NULL;
 		return rc;
 	}
 	i++;
@@ -629,6 +640,7 @@ static int tas2781_hda_spi_dsp_ctls(struct tas2781_hda *h)
 	if (rc) {
 		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
 			tas2781_dsp_ctls[i].name, rc);
+		h->dsp_conf_ctl = NULL;
 	}
 
 	return rc;
@@ -644,6 +656,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	guard(pm_runtime_active_auto)(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
 
+	if (tas2781_hda_fw_request_cancelled(tas_hda))
+		goto out;
+
 	ret = tasdevice_rca_parser(tas_priv, fmw);
 	if (ret)
 		goto out;
@@ -698,6 +713,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas2781_save_calibration(tas_hda);
 out:
 	release_firmware(fmw);
+	tas2781_hda_fw_request_done(tas_hda);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
@@ -724,10 +740,13 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
+	tas2781_hda_fw_request_start(tas_hda);
 	ret = tascodec_spi_init(tas_hda->priv, codec, THIS_MODULE,
 		tasdev_fw_ready);
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
+	else
+		tas2781_hda_fw_request_done(tas_hda);
 
 	/* Only HP Laptop support SPI-based TAS2781 */
 	tas_hda->catlog_id = HP;
@@ -750,6 +769,8 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	tas2781_hda_fw_request_cancel(tas_hda);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);
@@ -780,6 +801,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	tas_hda->hda_priv = hda_priv;
+	tas2781_hda_fw_request_init(tas_hda);
 	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
 
 	tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);

---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

