Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349D285050
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501357; cv=none; b=K2RtUlbfYi5/5PF6Mn+i/LhQTVcQNFQmp8n/hJUUVLgoDbLJa9G1OB3NaffvOXCKnBCVgGHFRtYzeuGhs5Th5upXMiyK//gqusa0gPqCuApgmXWXkQYuQxMNUl3rTLkIikIoVxMNy86ExnTPfxDa6i0a3AegYH6WLebV3zAFo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501357; c=relaxed/simple;
	bh=md6Hp/P/U+pLRSWunUDF9PTF1O3oNMGZg5cDOP7A11Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SQGer8tFh1BJ6WywVVHax9FcVVIeOR6rf0h4cnYl95gqKn2j3ZS0P7+7bN10xQgXB6PwAxkFHZZ+7IuB/szwFXPjkeO/Up5tQtwtl0i+sy0T6Dr7C5ovMnk6bU0Cf1wQx8l6exYn1jpxBXJ0pJFuJoKtEqiIidwzdre9UZY2GzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1SEgH0g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1SEgH0g"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305882so3233804f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769501353; x=1770106153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tL+NmFC3uxk3F8MXfdMah5IPiA4oj5opzuBpeVlxj4=;
        b=K1SEgH0gjGf/efnH5shAcNFiieyR86lcsQXGy2TObpgXbIPQ9XQ1i9sCkzsBlcpjPW
         avu6uiHIWt0cK1UbBjsX8sp+O5AprISIK9TEaMZOkkI/PaGffMareTTzfFybMg/nUhcQ
         UuUDFV5tJ32tcXN3eiIIe+WuhxRfSDoce7FNf3Nx0oX5s3gvUNp/HBgz/mVIKAjE1T1W
         MRK4MQPc6XYwVIYrG/Cd+TuTf0tMfNK8AEvcwAwufaABYpknHSfl5D3VwlptuPOE6eXl
         4TiyKqlkHAGjMW8pgjMJcgw1bBYzK2rzLjCr4FNeV+01uPdJoc35q2GwL52mFOTHTGuA
         TUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769501353; x=1770106153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tL+NmFC3uxk3F8MXfdMah5IPiA4oj5opzuBpeVlxj4=;
        b=TqZcUsBmxq3ia0JhGrE1B6dlJYwBrHTOEmhX0eLMDTMxEnTZBoffR80gvzV1767yp7
         tnpqK0I3VBCckjTIAcAJf2NR+DXRMqpu1YuYkEpUsp222edNjgziDgl8ATBo7R3P4j9D
         GhG6kyxegU42CE++uF/cAtDyPQHIm9kVSJmaBVQkX8Zu/hqjgvPPu+nfxmOoEEe81Vsv
         40eeEeMXx2LyFrG4j+0ctNsPQex3ySCpYXJx5MrD5gIPtYQKWPaPyirywsq7zmJYvkt4
         y2GWtyk22iiF0KdVd0dNm8IaUhX7JJSV1FinjN+u7H/VB8Vv0a8cVPz1R5CbSAKnAt2Y
         mUAA==
X-Gm-Message-State: AOJu0YydSlUm+KpR89oqy5NQERHEq2rl8kxTrOgmiXhdWBrdrR2MDFDc
	Y0JWxSJFX297neglLxnnTbKhM4zq3s1cifKFlvOjdTmDsy/bhLDbGItXupveGw==
X-Gm-Gg: AZuq6aJbaA/8p/X0mQxp/rLvoOSAXu+MEndcslLEB2OiaFYE+BbnbZsO1f71ZHiD7s1
	IKibImU3xK2GrzGicgAT9Vvc5UDjG0vebuvEvvVPPwA7eQhu8GYcuj9vXrIoqjXWqpcRoDMVWYf
	gUIdZCjlAo664XwV6cMA0nzefIuwHP3G1PQu9qQ+iF2EPM2OWC8l/2wfoItW9UIica2HvbE1XqE
	ar71cdBohbu6pkAADTWIUguww2sCQzGVeZmBQ21a/wAmFSt9Ddib3KwNw9bZUDXYzKqP9bTHHTV
	XIN6GBreGJpEcXtXRxSO9+FkiqjWOrfhRgaE3aEyaCQPquIKZNYzu1XIWJcKn4weLXHkPPWuz+M
	JVUyoBEGrsrr1sPgm3EwEh8AXWk4tnShJqkF7RnGj9ErH74nYNjykrFkeeuSvOY5+x/Hwd2D+4j
	5RsiMnn+W6blJuQIu7VytsIVr1YLX7/D48OxQ4GGrwsCwxQcso79XdbOGfUC4CEJO7dbO5zzYhR
	C6cpN5CxJDn
X-Received: by 2002:a05:6000:4023:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-435dd02d9bcmr976504f8f.3.1769501352794;
        Tue, 27 Jan 2026 00:09:12 -0800 (PST)
Received: from jopdorp-linux.tendawifi.com (238-180-99-95.ftth.glasoperator.nl. [95.99.180.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm36177612f8f.0.2026.01.27.00.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:09:12 -0800 (PST)
From: Jegor van Opdorp <jegorvanopdorp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	Jegor van Opdorp <jegorvanopdorp@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add mixer support for Focusrite Forte
Date: Tue, 27 Jan 2026 09:08:50 +0100
Message-ID: <20260127080850.211208-1-jegorvanopdorp@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mixer control support for the Focusrite Forte (USB ID 0x1235:0x8010),
an older USB audio interface that predates the Scarlett 2nd generation.

The Forte uses UAC2_CS_MEM (bRequest=0x03) for its input controls rather
than the standard UAC2_CS_CUR (0x01) used by Scarlett devices. This patch
adds Forte-specific control handlers that use the correct USB protocol.

Features implemented:
- Input source selection (Mic/Line/Inst) for both channels
- High pass filter switch
- 48V phantom power switch
- Phase invert switch
- Pad switch
- Preamp gain control (0-42 range, ~0-75dB)
- Matrix mixer controls (6 inputs x 4 outputs)
- Output volume and mute controls

The device is registered via mixer_quirks.c and uses the existing
mixer_scarlett.c infrastructure with Forte-specific additions.

Credit: This work builds on prior reverse-engineering by alastair-dm.

Link: https://github.com/alastair-dm/wiki/wiki/Focusrite-Forte
Link: https://github.com/alastair-dm/Linux-Forte/wiki
Signed-off-by: Jegor van Opdorp <jegorvanopdorp@gmail.com>
---
 sound/usb/mixer_quirks.c   |   3 +
 sound/usb/mixer_scarlett.c | 476 +++++++++++++++++++++++++++++++++++--
 sound/usb/mixer_scarlett.h |   1 +
 3 files changed, 461 insertions(+), 19 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ed6127b0389f..c12257ad34dc 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4060,6 +4060,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_create_std_mono_table(mixer, ebox44_table);
 		break;
 
+	case USB_ID(0x1235, 0x8010): /* Focusrite Forte */
+		err = snd_forte_controls_create(mixer);
+		break;
 	case USB_ID(0x1235, 0x8012): /* Focusrite Scarlett 6i6 */
 	case USB_ID(0x1235, 0x8002): /* Focusrite Scarlett 8i6 */
 	case USB_ID(0x1235, 0x8004): /* Focusrite Scarlett 18i6 */
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index ff548041679b..eef3942b5d9f 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -135,7 +135,7 @@
 /* some gui mixers can't handle negative ctl values */
 #define SND_SCARLETT_LEVEL_BIAS 128
 #define SND_SCARLETT_MATRIX_IN_MAX 18
-#define SND_SCARLETT_CONTROLS_MAX 10
+#define SND_SCARLETT_CONTROLS_MAX 14
 #define SND_SCARLETT_OFFSETS_MAX 5
 
 enum {
@@ -143,6 +143,12 @@ enum {
 	SCARLETT_SWITCH_IMPEDANCE,
 	SCARLETT_SWITCH_PAD,
 	SCARLETT_SWITCH_GAIN,
+	FORTE_INPUT_SOURCE,     /* mic/line/instrument selection */
+	FORTE_INPUT_HPF,        /* high pass filter */
+	FORTE_INPUT_PHANTOM,    /* 48V phantom power */
+	FORTE_INPUT_PHASE,      /* phase invert */
+	FORTE_INPUT_PAD,        /* pad */
+	FORTE_INPUT_GAIN,       /* preamp gain 0-42 (~0-75dB for mic) */
 };
 
 enum {
@@ -172,6 +178,8 @@ struct scarlett_device_info {
 	int input_len;
 	int output_len;
 
+	bool has_output_source_routing;
+
 	struct scarlett_mixer_elem_enum_info opt_master;
 	struct scarlett_mixer_elem_enum_info opt_matrix;
 
@@ -229,6 +237,239 @@ static const struct scarlett_mixer_elem_enum_info opt_sync = {
 	}
 };
 
+/* Forte-specific input control options */
+static const struct scarlett_mixer_elem_enum_info opt_forte_source = {
+	.start = 0,
+	.len = 3,
+	.offsets = {},
+	.names = (char const * const []){
+		"Mic", "Line", "Inst"
+	}
+};
+
+/*
+ * Forte-specific USB control functions
+ * Forte input controls use bRequest=0x03 (UAC2_CS_MEM) instead of 0x01
+ * wValue = (control_code << 8) | channel
+ * wIndex = interface | (0x3c << 8) like Scarlett meter/matrix controls
+ */
+static int forte_set_ctl_value(struct usb_mixer_elem_info *elem, int value)
+{
+	struct snd_usb_audio *chip = elem->head.mixer->chip;
+	unsigned char buf[2];
+	int wValue = elem->control;  /* Just control code, NO shift, NO channel */
+	int idx = snd_usb_ctrl_intf(elem->head.mixer->hostif) | (elem->head.id << 8);
+	int err;
+
+	/* Wiki format: "2 bytes, chan 0,1 and value"
+	 * Data order: [channel, value] - channel FIRST per wiki
+	 */
+	buf[0] = elem->idx_off;  /* Channel: 0 or 1 */
+	buf[1] = value & 0xff;   /* Value: 0-2 for source, 0-1 for switches */
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return -EIO;
+
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_sndctrlpipe(chip->dev, 0),
+			      UAC2_CS_MEM,  /* bRequest = 0x03 */
+			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			      wValue, idx, buf, 2);
+
+	snd_usb_unlock_shutdown(chip);
+
+	if (err < 0) {
+		usb_audio_err(chip, "forte_set FAILED: req=0x03 wVal=0x%04x wIdx=0x%04x buf=[%02x,%02x] err=%d\n",
+			      wValue, idx, buf[0], buf[1], err);
+		return err;
+	}
+	return 0;
+}
+
+static int forte_get_ctl_value(struct usb_mixer_elem_info *elem, int *value)
+{
+	/* Device may not support reading input controls.
+	 * Return cached value or default to avoid blocking module load.
+	 */
+	if (elem->cached)
+		*value = elem->cache_val[0];
+	else
+		*value = 0;  /* Default: first option */
+
+	return 0;
+}
+
+/*
+ * Forte Input Gain control functions
+ * Gain range is 0-42 (0x00-0x2a) which maps to approximately:
+ * - Mic: 0 to +75dB (~1.8dB per step)
+ * - Instrument: +14 to +68dB
+ * - Line: -12 to +42dB
+ * We use a TLV scale of 0 to 7500 centidB (0 to 75dB) in ~179 cB steps
+ */
+#define FORTE_INPUT_GAIN_MAX 42
+
+static int forte_input_gain_info(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = FORTE_INPUT_GAIN_MAX;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int forte_input_gain_get(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	int err, val;
+
+	/* Use Forte-specific USB command with UAC2_CS_MEM */
+	err = forte_get_ctl_value(elem, &val);
+	if (err < 0)
+		return err;
+
+	ucontrol->value.integer.value[0] = clamp(val, 0, FORTE_INPUT_GAIN_MAX);
+	return 0;
+}
+
+static int forte_input_gain_put(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	int err, oval, val;
+
+	/* Read current value */
+	err = forte_get_ctl_value(elem, &oval);
+	if (err < 0)
+		return err;
+
+	val = clamp((int)ucontrol->value.integer.value[0], 0, FORTE_INPUT_GAIN_MAX);
+	if (oval != val) {
+		/* Use Forte-specific USB command */
+		err = forte_set_ctl_value(elem, val);
+		if (err < 0)
+			return err;
+		elem->cached |= 1;
+		elem->cache_val[0] = val;
+		return 1;
+	}
+	return 0;
+}
+
+static int forte_input_gain_resume(struct usb_mixer_elem_list *list)
+{
+	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
+
+	if (elem->cached)
+		forte_set_ctl_value(elem, *elem->cache_val);
+	return 0;
+}
+
+/*
+ * Forte-specific enum control functions (for Source selection)
+ * Uses bRequest=0x03 (UAC2_CS_MEM) instead of standard 0x01
+ */
+static int forte_ctl_enum_get(struct snd_kcontrol *kctl,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett_mixer_elem_enum_info *opt = elem->private_data;
+	int err, val;
+
+	err = forte_get_ctl_value(elem, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp(val - opt->start, 0, opt->len - 1);
+	ucontrol->value.enumerated.item[0] = val;
+	return 0;
+}
+
+static int forte_ctl_enum_put(struct snd_kcontrol *kctl,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett_mixer_elem_enum_info *opt = elem->private_data;
+	int err, oval, val;
+
+	err = forte_get_ctl_value(elem, &oval);
+	if (err < 0)
+		return err;
+
+	val = ucontrol->value.integer.value[0] + opt->start;
+	if (val != oval) {
+		err = forte_set_ctl_value(elem, val);
+		if (err < 0)
+			return err;
+		elem->cached |= 1;
+		elem->cache_val[0] = val;
+		return 1;
+	}
+	return 0;
+}
+
+static int forte_ctl_enum_resume(struct usb_mixer_elem_list *list)
+{
+	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
+
+	if (elem->cached)
+		forte_set_ctl_value(elem, *elem->cache_val);
+	return 0;
+}
+
+/*
+ * Forte-specific switch control functions (for HPF, 48V, Phase, Pad)
+ * Uses bRequest=0x03 (UAC2_CS_MEM) instead of standard 0x01
+ */
+static int forte_ctl_switch_get(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	int err, val;
+
+	err = forte_get_ctl_value(elem, &val);
+	if (err < 0)
+		return err;
+
+	ucontrol->value.integer.value[0] = val ? 1 : 0;
+	return 0;
+}
+
+static int forte_ctl_switch_put(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	int err, oval, val;
+
+	err = forte_get_ctl_value(elem, &oval);
+	if (err < 0)
+		return err;
+
+	val = ucontrol->value.integer.value[0] ? 1 : 0;
+	if (val != oval) {
+		err = forte_set_ctl_value(elem, val);
+		if (err < 0)
+			return err;
+		elem->cached |= 1;
+		elem->cache_val[0] = val;
+		return 1;
+	}
+	return 0;
+}
+
+static int forte_ctl_switch_resume(struct usb_mixer_elem_list *list)
+{
+	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
+
+	if (elem->cached)
+		forte_set_ctl_value(elem, *elem->cache_val);
+	return 0;
+}
+
 static int scarlett_ctl_switch_info(struct snd_kcontrol *kctl,
 		struct snd_ctl_elem_info *uinfo)
 {
@@ -533,6 +774,37 @@ static const struct snd_kcontrol_new usb_scarlett_ctl_sync = {
 	.get =  scarlett_ctl_meter_get,
 };
 
+/* Forte-specific control structures - use bRequest=0x03 instead of 0x01 */
+static const struct snd_kcontrol_new usb_forte_ctl_enum = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett_ctl_enum_info,
+	.get =  forte_ctl_enum_get,
+	.put =  forte_ctl_enum_put,
+};
+
+static const struct snd_kcontrol_new usb_forte_ctl_switch = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get =  forte_ctl_switch_get,
+	.put =  forte_ctl_switch_put,
+};
+
+/* Forte input gain: 0-42 maps to approximately 0-75dB (~179 cB per step) */
+static const DECLARE_TLV_DB_SCALE(db_scale_forte_input_gain, 0, 179, 0);
+
+static const struct snd_kcontrol_new usb_forte_ctl_input_gain = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+	.name = "",
+	.info = forte_input_gain_info,
+	.get =  forte_input_gain_get,
+	.put =  forte_input_gain_put,
+	.tlv = { .p = db_scale_forte_input_gain }
+};
+
 static int add_new_ctl(struct usb_mixer_interface *mixer,
 		       const struct snd_kcontrol_new *ncontrol,
 		       usb_mixer_elem_resume_func_t resume,
@@ -607,37 +879,83 @@ static int add_output_ctls(struct usb_mixer_interface *mixer,
 	if (err < 0)
 		return err;
 
-	/* Add L channel source playback enumeration */
-	snprintf(mx, sizeof(mx), "Master %dL (%s) Source Playback Enum",
-		index + 1, name);
-	err = add_new_ctl(mixer, &usb_scarlett_ctl_dynamic_enum,
-			  scarlett_ctl_enum_resume, 0x33, 0x00,
-			  2*index, USB_MIXER_S16, 1, mx, &info->opt_master,
-			  &elem);
-	if (err < 0)
-		return err;
+	/* Add L/R source routing if device supports it */
+	if (info->has_output_source_routing) {
+		/* Add L channel source playback enumeration */
+		snprintf(mx, sizeof(mx), "Master %dL (%s) Source Playback Enum",
+			index + 1, name);
+		err = add_new_ctl(mixer, &usb_scarlett_ctl_dynamic_enum,
+				  scarlett_ctl_enum_resume, 0x33, 0x00,
+				  2*index, USB_MIXER_S16, 1, mx, &info->opt_master,
+				  &elem);
+		if (err < 0)
+			return err;
 
-	/* Add R channel source playback enumeration */
-	snprintf(mx, sizeof(mx), "Master %dR (%s) Source Playback Enum",
-		index + 1, name);
-	err = add_new_ctl(mixer, &usb_scarlett_ctl_dynamic_enum,
-			  scarlett_ctl_enum_resume, 0x33, 0x00,
-			  2*index+1, USB_MIXER_S16, 1, mx, &info->opt_master,
-			  &elem);
-	if (err < 0)
-		return err;
+		/* Add R channel source playback enumeration */
+		snprintf(mx, sizeof(mx), "Master %dR (%s) Source Playback Enum",
+			index + 1, name);
+		err = add_new_ctl(mixer, &usb_scarlett_ctl_dynamic_enum,
+				  scarlett_ctl_enum_resume, 0x33, 0x00,
+				  2*index+1, USB_MIXER_S16, 1, mx, &info->opt_master,
+				  &elem);
+		if (err < 0)
+			return err;
+	}
 
 	return 0;
 }
 
 /********************** device-specific config *************************/
 
+static const struct scarlett_device_info forte_info = {
+	.matrix_in = 6,
+	.matrix_out = 4,
+	.input_len = 2,
+	.output_len = 4,
+	.has_output_source_routing = false,
+
+	.opt_master = {
+		.start = -1,
+		.len = 13,
+		.offsets = {0, 4, 6, 6, 6},
+		.names = NULL
+	},
+
+	.opt_matrix = {
+		.start = -1,
+		.len = 7,
+		.offsets = {0, 4, 6, 6, 6},
+		.names = NULL
+	},
+
+	.num_controls = 14,
+	.controls = {
+		{ .num = 0, .type = SCARLETT_OUTPUTS, .name = "Line Out" },
+		{ .num = 1, .type = SCARLETT_OUTPUTS, .name = "Headphone" },
+		/* Input 1 controls */
+		{ .num = 1, .type = FORTE_INPUT_GAIN, .name = NULL},
+		{ .num = 1, .type = FORTE_INPUT_SOURCE, .name = NULL},
+		{ .num = 1, .type = FORTE_INPUT_HPF, .name = NULL},
+		{ .num = 1, .type = FORTE_INPUT_PHANTOM, .name = NULL},
+		{ .num = 1, .type = FORTE_INPUT_PHASE, .name = NULL},
+		{ .num = 1, .type = FORTE_INPUT_PAD, .name = NULL},
+		/* Input 2 controls */
+		{ .num = 2, .type = FORTE_INPUT_GAIN, .name = NULL},
+		{ .num = 2, .type = FORTE_INPUT_SOURCE, .name = NULL},
+		{ .num = 2, .type = FORTE_INPUT_HPF, .name = NULL},
+		{ .num = 2, .type = FORTE_INPUT_PHANTOM, .name = NULL},
+		{ .num = 2, .type = FORTE_INPUT_PHASE, .name = NULL},
+		{ .num = 2, .type = FORTE_INPUT_PAD, .name = NULL},
+	},
+};
+
 /*  untested...  */
 static const struct scarlett_device_info s6i6_info = {
 	.matrix_in = 18,
 	.matrix_out = 8,
 	.input_len = 6,
 	.output_len = 6,
+	.has_output_source_routing = true,
 
 	.opt_master = {
 		.start = -1,
@@ -680,6 +998,7 @@ static const struct scarlett_device_info s8i6_info = {
 	.matrix_out = 6,
 	.input_len = 8,
 	.output_len = 6,
+	.has_output_source_routing = true,
 
 	.opt_master = {
 		.start = -1,
@@ -719,6 +1038,7 @@ static const struct scarlett_device_info s18i6_info = {
 	.matrix_out = 6,
 	.input_len = 18,
 	.output_len = 6,
+	.has_output_source_routing = true,
 
 	.opt_master = {
 		.start = -1,
@@ -756,6 +1076,7 @@ static const struct scarlett_device_info s18i8_info = {
 	.matrix_out = 8,
 	.input_len = 18,
 	.output_len = 8,
+	.has_output_source_routing = true,
 
 	.opt_master = {
 		.start = -1,
@@ -798,6 +1119,7 @@ static const struct scarlett_device_info s18i20_info = {
 	.matrix_out = 8,
 	.input_len = 18,
 	.output_len = 20,
+	.has_output_source_routing = true,
 
 	.opt_master = {
 		.start = -1,
@@ -902,6 +1224,61 @@ static int scarlett_controls_create_generic(struct usb_mixer_interface *mixer,
 			if (err < 0)
 				return err;
 			break;
+		/* Forte input controls - use wIndex 0x3c per wiki docs */
+		case FORTE_INPUT_GAIN:
+			sprintf(mx, "Line In %d Gain Capture Volume", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_input_gain,
+					  forte_input_gain_resume, 0x3c,
+					  0x06, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  NULL, &elem);
+			if (err < 0)
+				return err;
+			break;
+		case FORTE_INPUT_SOURCE:
+			sprintf(mx, "Input %d Source", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_enum,
+					  forte_ctl_enum_resume, 0x3c,
+					  0x07, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  &opt_forte_source, &elem);
+			if (err < 0)
+				return err;
+			break;
+		case FORTE_INPUT_HPF:
+			sprintf(mx, "Input %d High Pass Filter Switch", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_switch,
+					  forte_ctl_switch_resume, 0x3c,
+					  0x08, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  NULL, &elem);
+			if (err < 0)
+				return err;
+			break;
+		case FORTE_INPUT_PHANTOM:
+			sprintf(mx, "Input %d 48V Phantom Power Switch", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_switch,
+					  forte_ctl_switch_resume, 0x3c,
+					  0x09, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  NULL, &elem);
+			if (err < 0)
+				return err;
+			break;
+		case FORTE_INPUT_PHASE:
+			sprintf(mx, "Input %d Phase Invert Switch", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_switch,
+					  forte_ctl_switch_resume, 0x3c,
+					  0x0a, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  NULL, &elem);
+			if (err < 0)
+				return err;
+			break;
+		case FORTE_INPUT_PAD:
+			sprintf(mx, "Input %d Pad Switch", ctl->num);
+			err = add_new_ctl(mixer, &usb_forte_ctl_switch,
+					  forte_ctl_switch_resume, 0x3c,
+					  0x0b, ctl->num - 1, USB_MIXER_S16, 1, mx,
+					  NULL, &elem);
+			if (err < 0)
+				return err;
+			break;
 		}
 	}
 
@@ -1009,3 +1386,64 @@ int snd_scarlett_controls_create(struct usb_mixer_interface *mixer)
 
 	return err;
 }
+
+/*
+ * Create and initialize a mixer for the Focusrite(R) Forte
+ */
+int snd_forte_controls_create(struct usb_mixer_interface *mixer)
+{
+	int err, i, o;
+	char mx[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	const struct scarlett_device_info *info;
+	struct usb_mixer_elem_info *elem;
+
+	/* only use UAC_VERSION_2 */
+	if (!mixer->protocol)
+		return 0;
+
+	switch (mixer->chip->usb_id) {
+	case USB_ID(0x1235, 0x8010):
+		info = &forte_info;
+		break;
+	default: /* device not (yet) supported */
+		return -EINVAL;
+	}
+
+	/* generic function to create controls */
+	err = scarlett_controls_create_generic(mixer, info);
+	if (err < 0)
+		return err;
+
+	/* setup matrix controls */
+	for (i = 0; i < info->matrix_in; i++) {
+		snprintf(mx, sizeof(mx), "Matrix %02d Input Playback Route",
+			 i+1);
+		err = add_new_ctl(mixer, &usb_scarlett_ctl_dynamic_enum,
+				  scarlett_ctl_enum_resume, 0x32,
+				  0x06, i, USB_MIXER_S16, 1, mx,
+				  &info->opt_matrix, &elem);
+		if (err < 0)
+			return err;
+
+		for (o = 0; o < info->matrix_out; o++) {
+			sprintf(mx, "Matrix %02d Mix %c Playback Volume", i+1,
+				o+'A');
+			err = add_new_ctl(mixer, &usb_scarlett_ctl,
+					  scarlett_ctl_resume, 0x3c, 0x01,
+					  (i << 2) + (o & 0x03), USB_MIXER_S16,
+					  1, mx, NULL, &elem);
+			if (err < 0)
+				return err;
+
+		}
+	}
+
+	/* val_len == 1 and UAC2_CS_MEM */
+	err = add_new_ctl(mixer, &usb_scarlett_ctl_sync, NULL, 0x3c, 0x00, 2,
+			  USB_MIXER_U8, 1, "Sample Clock Sync Status",
+			  &opt_sync, &elem);
+	if (err < 0)
+		return err;
+
+	return err;
+}
diff --git a/sound/usb/mixer_scarlett.h b/sound/usb/mixer_scarlett.h
index bbf063b79370..c44fe7d72ee3 100644
--- a/sound/usb/mixer_scarlett.h
+++ b/sound/usb/mixer_scarlett.h
@@ -3,5 +3,6 @@
 #define __USB_MIXER_SCARLETT_H
 
 int snd_scarlett_controls_create(struct usb_mixer_interface *mixer);
+int snd_forte_controls_create(struct usb_mixer_interface *mixer);
 
 #endif /* __USB_MIXER_SCARLETT_H */
-- 
2.43.0

