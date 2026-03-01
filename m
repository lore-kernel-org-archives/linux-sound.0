Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B79330D36;
	Sun,  1 Mar 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401096; cv=pass; b=bbWZhFIR2JOc1opu83K1Y+aGwvgBhyHMM5PSfttrqsL0to2BkgpROIb2trHWN+zU+B5/tcvV1kO43B5Gbgb4CywX93qejnUOww2NJWBxeKbz48fUt2iD9JxxSD+ByK3O5dwpzdpmo+34sP+waFuhQB5UGEDwfTxzitxUk48i6X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401096; c=relaxed/simple;
	bh=NV6B+vR93yzbfYx0xgNbx6LdRSzbyo7jtpb1exSRwlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVeNJ7Xd1VVUHQzc40OgdgxMPE87CSpKc9MxaWVlxJdvfa5PslaZbc2YsES8B55ciSGgUx8HdnWNzbyXd6pCfOab8UZ4rvLtzd7zTGa+5g21EKlACtyZFWInFj/qO9nC3TxpoIx8JyWZrjKRyTCPFtIK8QOcY/75+Jzi3NciV44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qs4z5pAi; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qs4z5pAi"
ARC-Seal: i=1; a=rsa-sha256; t=1772401078; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O2v8R5F0Ie3QIFrS5RKPBl/bgBOQzjc3MmCq47lfAty13KckoL+633ESIPmG4CNpJXLL0TzqjlCUSlJGjPEBtP0llv4IR37mgKAc3Ysi1km3hFHUTi9tr5V56Tbdb3EMqa2siKhtYXSxaTjD/PENC/wb6voFp0mVWhCDR+kxdao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401078; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nk/d40ubXKnyIOAqI0bxPfrDmDq/xH6w6w+exU5IJVA=; 
	b=hgR/dCg2ZFhXFtpCGBhpFgDlJ/tXp8U96NQlVCD8jwAc9YpdmMkf27Um6zmPKSN+EQSOmUwIXuCVP+7kcz6jZYyJYaUA5NY463Xs+jndWNuuiuJdFzRCANIuh2xbGMGnEw+2AZgWCxi2XU2ALylQMA6MQsEjJ+QjcdkJnaoAfgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401078;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Nk/d40ubXKnyIOAqI0bxPfrDmDq/xH6w6w+exU5IJVA=;
	b=qs4z5pAidKhacmG3T7AZFexjReNUi5CS4f5CQzxNoqRPD2iU7FI9WgJPFEJczcVc
	Zz0a4ZEEZRBt3J6RBgpLY6UYsFgPxeixD5NOCEa2pkK4w7lzcznK0JT8nO+CJEARK94
	HTLcjbfVBIAeOHWw189pzDhAQbiDhzRgmSqhoZGHm0kqIGJojVNIt4VKCRv86uIljnQ
	5WaWEOQW7iOAMZVsQuS1PrL7/gIZVtccP/PR0i4tE94orFZH+NFFMEqzarWcmfr5CVG
	JRISrtmDRvXFg+stc5bz8zo2CevnswxXlO+ncwtBY7z34pQ0kEJHT3ssE8Of2h/Vc0r
	y5QEAWL5wQ==
Received: by mx.zohomail.com with SMTPS id 1772401077137449.52785599032256;
	Sun, 1 Mar 2026 13:37:57 -0800 (PST)
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
Subject: [PATCH 7/9] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
Date: Mon,  2 Mar 2026 05:37:23 +0800
Message-ID: <20260301213726.428505-8-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
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
index 55b845d382368..f75f087639415 100644
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
index 5370bcd99e9d0..2327288e2b20f 100644
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

