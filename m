Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDA389116;
	Tue,  3 Mar 2026 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567328; cv=pass; b=rtcHlWfzihpHAqYkbkXdCG4cG3+x64YrONWH5oUMR+1Tg/ev62saCayY5ygcyewSm9JqSRgJJDp5+8U/yF5CelmFVgsRD/eEkQWvVKBfDqt2JwzFRAvvw0v85EPILJRb5qB5rvcuwGdOhW+AyeuNSucDQPHtDHjweR6BWp6NLh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567328; c=relaxed/simple;
	bh=cwrPFFLfgEd/BbZv/7+Er7fk1mrkKj/RUMlA/CKVpiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJONzQa+UtOj6nu+CJwaO+LQurnT4Ik6W1gBw8oNTVBfAYpqtqg0ObrMwhLZPuUJMfLFKWUewRiE+c/sGjhuQiqUdaTgQfQA43ceLtWUFeXAgYmthRoytaIeWVDIjfG7qvvrsBPIiODnaoy5E47fXbtOiIDHunCvtKhLOfnFSeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jl2RKlSw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jl2RKlSw"
ARC-Seal: i=1; a=rsa-sha256; t=1772567313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H3vQrkHVqJZSHsAhP37TpfTT2wFzGES1kzAEcNFRseKcXQhFKr5AcasUp/k2RfPWnCKMwdliciFUsyHo/yElp1NjpVejLFLgUOntn6N2tOQLNKF2tL0i8BB33A5nw+z+85CHc9sjusSKuqnNAFULGZ0YuOVK2iqadR3UjZZKa8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567313; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vAa44iPTvGsMU0au10ZpUPQiARs0Sq3EUeZdJvl8agE=; 
	b=cnLGBBtOngtyTldWPvzaMpV09IH0KcYgWDQnHgT8chJsTJAjNl5rfKCNR6uZjK8zhMdKsgY16j8jdCRD4Yk/oE3VGBzWG8Z5IzZwPmmn0S6qTGHKzHEPesrPWOd5PXbfp6JdVSomfj6Vd0lWN2ORL2sD507Fa9+pqX4InsxuOF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567313;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vAa44iPTvGsMU0au10ZpUPQiARs0Sq3EUeZdJvl8agE=;
	b=jl2RKlSwOWcwJPbYrLfUSHvLEPUjF+Rmptor3gtLUVdMi5MqF+ieMtmFuLGil7Or
	Rwd/zp+KIoyVcBkkZhyBpOlkTLsvrYQcjFop6Z5uydJBIJFFt+XBVvtLVIiEnBKf5va
	j0wlhtyhrZej6bbpt1WKhv3y0JN1+OdjaeamhHYavd4xmKRbQz0dxePdJPiE79kt/Ec
	M9rAgkJeBAQAVUR3SEGdl5Gj1Z9/qqQBsOvNerXyaM/w2WglJmup4USOR8cs/XsJXdd
	6XGqbqi8pY1i76TquIdwR+hdKtgUbn7UTEdnqDd/iJTyXFywDzWom+TeoRZpKBh7Dkz
	FHkV7orPxQ==
Received: by mx.zohomail.com with SMTPS id 1772567311871121.75501291221087;
	Tue, 3 Mar 2026 11:48:31 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 6/8] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
Date: Wed,  4 Mar 2026 03:48:01 +0800
Message-ID: <20260303194805.266158-7-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some quirky devices tune their volume by linearly tuning the voltage
level (linear volume). In other words, such devices has a linear TLV
mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).

Add quirk flags MIXER_PLAYBACK_LINEAR_VOL and MIXER_CAPTURE_LINEAR_VOL
to represent this case respectively for playback and capture mixers.

No functional change intended.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst |  7 +++++
 sound/usb/mixer_quirks.c                   | 34 ++++++++++++++++++++++
 sound/usb/quirks.c                         |  2 ++
 sound/usb/usbaudio.h                       | 12 ++++++++
 4 files changed, 55 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 55b845d38236..f75f08763941 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2376,6 +2376,13 @@ quirk_flags
           Skip the probe-time interface setup (usb_set_interface,
           init_pitch, init_sample_rate); redundant with
           snd_usb_endpoint_prepare() at stream-open time
+        * bit 27: ``mixer_playback_linear_vol``
+          Set linear volume mapping for devices where the playback volume
+          control value is mapped to voltage (instead of dB) level linearly.
+          In short: ``x(raw) = (raw - raw_min) / (raw_max - raw_min)``;
+          ``V(x) = k * x``; ``dB(x) = 20 * log10(x)``. Overrides bit 24
+        * bit 28: ``mixer_capture_linear_vol``
+          Similar to bit 27 but for capture streams. Overrides bit 25
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 11e205da7964..539044c0c644 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4634,6 +4634,25 @@ static void snd_fix_plt_name(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "something wrong in kctl name %s\n", id->name);
 }
 
+static void snd_usb_mixer_fu_quirk_linear_scale(struct usb_mixer_interface *mixer,
+						struct usb_mixer_elem_info *cval,
+						struct snd_kcontrol *kctl)
+{
+	static const DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0);
+
+	if (cval->min_mute) {
+		/*
+		 * We are clearing SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		 * resulting in min_mute being a no-op.
+		 */
+		usb_audio_warn(mixer->chip, "LINEAR_VOL overrides MIN_MUTE\n");
+	}
+
+	kctl->tlv.p = scale;
+	kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+	kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+}
+
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl)
@@ -4660,6 +4679,21 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				       "applying capture min mute quirk\n");
 			cval->min_mute = 1;
 		}
+
+	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL)
+		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Playback")) {
+			usb_audio_info(mixer->chip,
+				       "applying playback linear volume quirk\n");
+			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
+		}
+
+	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL)
+		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Capture")) {
+			usb_audio_info(mixer->chip,
+				       "applying capture linear volume quirk\n");
+			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
+		}
+
 	/* ALSA-ify some Plantronics headset control names */
 	if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f &&
 	    (cval->control == UAC_FU_MUTE || cval->control == UAC_FU_VOLUME))
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 00d1a7c2260e..7a5cec9cc4bd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2543,6 +2543,8 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_MIN_MUTE),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_MIN_MUTE),
 	QUIRK_STRING_ENTRY(SKIP_IFACE_SETUP),
+	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
+	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 085530cf62d9..58fd07f8c3c9 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -228,6 +228,14 @@ extern bool snd_usb_skip_validation;
  *  Skip the probe-time interface setup (usb_set_interface,
  *  init_pitch, init_sample_rate); redundant with
  *  snd_usb_endpoint_prepare() at stream-open time
+ * QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL
+ *  Set linear volume mapping for devices where the playback volume control
+ *  value is mapped to voltage (instead of dB) level linearly. In short:
+ *  x(raw) = (raw - raw_min) / (raw_max - raw_min); V(x) = k * x;
+ *  dB(x) = 20 * log10(x). Overrides QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE
+ * QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL
+ *  Similar to QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL, but for capture streams.
+ *  Overrides QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE
  */
 
 enum {
@@ -258,6 +266,8 @@ enum {
 	QUIRK_TYPE_MIXER_PLAYBACK_MIN_MUTE	= 24,
 	QUIRK_TYPE_MIXER_CAPTURE_MIN_MUTE	= 25,
 	QUIRK_TYPE_SKIP_IFACE_SETUP		= 26,
+	QUIRK_TYPE_MIXER_PLAYBACK_LINEAR_VOL	= 27,
+	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
@@ -290,5 +300,7 @@ enum {
 #define QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE	QUIRK_FLAG(MIXER_PLAYBACK_MIN_MUTE)
 #define QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE	QUIRK_FLAG(MIXER_CAPTURE_MIN_MUTE)
 #define QUIRK_FLAG_SKIP_IFACE_SETUP		QUIRK_FLAG(SKIP_IFACE_SETUP)
+#define QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL	QUIRK_FLAG(MIXER_PLAYBACK_LINEAR_VOL)
+#define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
 
 #endif /* __USBAUDIO_H */
-- 
2.53.0

