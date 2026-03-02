Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5A379ECA;
	Mon,  2 Mar 2026 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477981; cv=pass; b=hZSmzCVB54cloqNyP/eA9fUijIGg5weAFDLKj7EJEjFin1GPADz0D/U4YUekr86LYskgoDSzElrUis6V0mA04yRI4+cRQCHv5wDMkqAipJ5XpKxHGnsmWcyLgZMNQRehsiiPxBXFIEU7H6ShTaxKRZp27J4wmGHs4SAelbJJNU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477981; c=relaxed/simple;
	bh=EqITlv+EbhlzAOQ3dpJsvuLTjCTSxHNxpDavAdqO8Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaHNxhtGBuVK4zgyQAw9Fhlu5P4Bb9mecQkaGyXPMkydxZEw7z5J38lQKgG6xvTp7u4of9lC5ycaNyAF6O4akmoMJueAyS0+5VD4hByDhn73Aov3xeZhx+nCKDsBTbj7v8+/l1/qsGiHJlXWn7scys2TY/bloSwUCf9Qijmeheo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BX60HLoF; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BX60HLoF"
ARC-Seal: i=1; a=rsa-sha256; t=1772477967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A6BhBzNwcEyY4Uvqaj1Ol//Ff+ZCLPcIT9fKFr8GZXBPGrh6nEJv7zv69sqO3RyfpboMptqZFfsYrdR09bxXWA6awqdzkNM0KIkwI9CFEYOwZQhrU9XiL5Yok0PmghCFYBKMQbI483/SG8rvNq8+DkkL+A7rCDSfGgrL7H2TFzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477967; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cnvKzgd+ZrIGAomDFx05CT0ALtcmXrFrh4aUidtShoE=; 
	b=Umjq6JaexnLvu7/XCz2OcRB3OV2P0EHE2Cts9q37VPHjd3uXsGBFqbuKEtyoPr6mp4cljTtRcYXavug1snlFS4ThlA1cTZh6LP6DnCPF0qlOvSB5i0i4+7HTuumtexr7UtYYO8TvvGO6jpxD3igmvz+ZSt78CwE6YNpA1hGXxjM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477967;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cnvKzgd+ZrIGAomDFx05CT0ALtcmXrFrh4aUidtShoE=;
	b=BX60HLoFZnEs4gtbkhMj+9uqiiODiOKVfn2QQFsKJqr/bPliI07wcoGXKVnqZpsB
	ag58ozrAs7mh8gdC8UwaIb4xlAHjH9AoAU6MO7m1/swzxrUkji/kU104kFy3zMgvLEA
	5+aDfr4BfJGlr1PM+Yxj+JKxLLf0MMAcW/ErUQOMr+Ds9GtD/2PouccUCywJvV8Vrxv
	xdOygAz4MPucxhibcjTJbGVWOTjg/KCUsGiM2l8SVFNyEknAKGBMNr10HP+W/Bl9N2l
	8mQuTFomzie62kk5nlo+mEJov0rI/UWPp2V62BF0TbrkJNB7sgApn3or3Qf63tITx7i
	dv34yFKf8g==
Received: by mx.zohomail.com with SMTPS id 1772477965430847.6246907547841;
	Mon, 2 Mar 2026 10:59:25 -0800 (PST)
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
Subject: [PATCH v2 6/8] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
Date: Tue,  3 Mar 2026 02:58:57 +0800
Message-ID: <20260302185900.427415-7-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
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
index 0a4eaa7d66ddd..d72ab49a783fc 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2372,6 +2372,13 @@ quirk_flags
           audible volume
         * bit 25: ``mixer_capture_min_mute``
           Similar to bit 24 but for capture streams
+        * bit 27: ``mixer_playback_linear_vol``
+          Set linear volume mapping for devices where the playback volume
+          control value is mapped to voltage (instead of dB) level linearly.
+          In short: ``x(raw) = (raw - raw_min) / (raw_max - raw_min)``;
+          ``V(x) = k * x``; ``dB(x) = 20 * log10(x)``. Overrides bit 24
+        * bit 28: ``mixer_capture_linear_vol``
+          Similar to bit 27 but for capture streams. Overrides bit 25
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 11e205da7964d..539044c0c6440 100644
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
index c5b89d7964b48..1c7ca52c92d08 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2540,6 +2540,8 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_MIN_MUTE),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_MIN_MUTE),
 	QUIRK_STRING_ENTRY(SKIP_IFACE_SETUP),
+	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
+	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 085530cf62d92..58fd07f8c3c97 100644
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
2.51.0

