Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238F283FF8
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001738; cv=none; b=GYIYBsq8LRWuEua0Ka4jZ7T1qif3eg4NJCzEPzGq6jwtStbYoZ1wBpYi9dFCNs+qby5au84cEV+wOZxhULi9J/kwfG714I68Dp2qXf0qc9w+L3MLVQhN9/et9Gzxr17mmtoKNyX0BBZVD6NuP/Ry5VF7aK21az3/kcPS0cpi1/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001738; c=relaxed/simple;
	bh=v/afXdRXEcBJWQYQPz/lgutNLoVveFTWzztlQ8mbr00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCf5kI8UR/ppNwbC4QqVBypyouNVfhkT5ynFfv8TRrhoM8d7RU6bGjik/gW1teA/ZqbOik/z8z9DannuIc1mrkuKsKnCTx7GlloxTxgCMlUCHKE3WM6N14VKJ6UbzeHSgWTRpGTer3vOxPvLm0hQukGNnp4aBhmIPoppkNfnYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=tbkxcUnp; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="tbkxcUnp"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6383366ECDCC; Fri,  5 Sep 2025 01:23:51 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6383366ECDCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1757001231; bh=IcOpEZOwqd47JKz0TytBpXfptqY/gWInx0YS1Obb/XA=;
	h=Date:From:To:Cc:Subject:From;
	b=tbkxcUnp17rmfUw7D0mA0gd+2BZBCxuxtdtJGfMwOEqIwS5l9zXLQuRRtCMj2QfgQ
	 ZoEx2nv/eEdRkx2gsq2oHd+wq51Y3HHXR35EmW8yPYRh4zpXfrGuVTnEGnl3AyDlls
	 uGz2GBIpugSziMqdUTLtxJ8XYYDM+1+LfzvfmcQAHmVPw0eAhvY9TP5sNISzcIKlx/
	 6zdzTmxv8z7hsXJYsuSvGaRElKuHH3GgeVd46aHfkoT4wDX4G+5jSGalKu8ftzwkMU
	 nrUt8zZJWX+8Hl3uTT3RlX8Myf+K1PI1/yb8lJTjhKFNUdJrwgsZkuBvkfrofHD9j7
	 zXHa20tesjN8Q==
Date: Fri, 5 Sep 2025 01:23:51 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Add Vocaster speaker/headphone mute controls
Message-ID: <aLm2Dy6+O/eLTGVn@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add support for the speaker and headphone mute controls on Focusrite
Vocaster interfaces. Unlike other Focusrite interfaces, these mute
controls are per-output, not per-channel.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 97 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index e762d6110b1a..f2446bf3982c 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -10,8 +10,9 @@
  *   - Solo/2i2/4i4 Gen 4
  *   - Clarett 2Pre/4Pre/8Pre USB
  *   - Clarett+ 2Pre/4Pre/8Pre
+ *   - Vocaster One/Two
  *
- *   Copyright (c) 2018-2024 by Geoffrey D. Bennett <g at b4.vu>
+ *   Copyright (c) 2018-2025 by Geoffrey D. Bennett <g at b4.vu>
  *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
  *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
  *
@@ -75,6 +76,9 @@
  * to many LinuxMusicians people and to Focusrite for hardware
  * donations).
  *
+ * Support for Vocaster One and Two added in Mar 2024 (thanks to many
+ * LinuxMusicians people and to Focusrite for hardware donations).
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -364,6 +368,21 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
 
+/* Vocaster One speaker/headphone mute names */
+static const char *const vocaster_one_sp_hp_mute_names[] = {
+	"Speaker Mute Playback Switch",
+	"Headphones Mute Playback Switch",
+	NULL
+};
+
+/* Vocaster Two speaker/headphone mute names */
+static const char *const vocaster_two_sp_hp_mute_names[] = {
+	"Speaker Mute Playback Switch",
+	"Headphones 1 Mute Playback Switch",
+	"Headphones 2 Mute Playback Switch",
+	NULL
+};
+
 /* The autogain_status is set based on the autogain_switch and
  * raw_autogain_status values.
  *
@@ -547,6 +566,7 @@ enum {
 	SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN,
 	SCARLETT2_CONFIG_BLUETOOTH_VOLUME,
 	SCARLETT2_CONFIG_SPDIF_MODE,
+	SCARLETT2_CONFIG_SP_HP_MUTE,
 	SCARLETT2_CONFIG_COUNT
 };
 
@@ -814,6 +834,9 @@ static const struct scarlett2_config_set scarlett2_config_set_vocaster = {
 
 		[SCARLETT2_CONFIG_BLUETOOTH_VOLUME] = {
 			.offset = 0xbf, .size = 8, .activate = 28 },
+
+		[SCARLETT2_CONFIG_SP_HP_MUTE] = {
+			.offset = 0xab, .size = 8, .activate = 10 },
 	}
 };
 
@@ -1177,6 +1200,9 @@ struct scarlett2_device_info {
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
+	/* Vocaster speaker/headphone mute control names */
+	const char * const *sp_hp_mute_names;
+
 	/* number of sources/destinations of each port type */
 	const int port_count[SCARLETT2_PORT_TYPE_COUNT][SCARLETT2_PORT_DIRNS];
 
@@ -1249,6 +1275,7 @@ struct scarlett2_data {
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
+	u8 sp_hp_mute;
 	u8 air_switch[SCARLETT2_AIR_SWITCH_MAX];
 	u8 dsp_switch[SCARLETT2_DSP_SWITCH_MAX];
 	s32 compressor_values[SCARLETT2_COMPRESSOR_CTLS_MAX];
@@ -1791,6 +1818,7 @@ static const struct scarlett2_device_info vocaster_one_info = {
 	.peq_flt_total_count = 4,
 	.mute_input_count = 1,
 	.gain_input_count = 1,
+	.sp_hp_mute_names = vocaster_one_sp_hp_mute_names,
 
 	.port_count = {
 		[SCARLETT2_PORT_TYPE_NONE]     = { 1,  0 },
@@ -1835,6 +1863,7 @@ static const struct scarlett2_device_info vocaster_two_info = {
 	.mute_input_count = 2,
 	.gain_input_count = 2,
 	.has_bluetooth = 1,
+	.sp_hp_mute_names = vocaster_two_sp_hp_mute_names,
 
 	.port_count = {
 		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
@@ -6293,6 +6322,61 @@ static const struct snd_kcontrol_new scarlett2_dim_mute_ctl = {
 	.put  = scarlett2_dim_mute_ctl_put
 };
 
+/*** Vocaster Speaker/Headphone Mute Controls ***/
+
+static int scarlett2_sp_hp_mute_ctl_get(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] =
+		!!(private->sp_hp_mute & (1 << elem->control));
+
+	return 0;
+}
+
+static int scarlett2_sp_hp_mute_ctl_put(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int index = elem->control;
+	int val, err;
+
+	guard(mutex)(&private->data_mutex);
+
+	if (private->hwdep_in_use)
+		return -EBUSY;
+
+	val = private->sp_hp_mute;
+
+	if (ucontrol->value.integer.value[0])
+		val |= (1 << index);
+	else
+		val &= ~(1 << index);
+
+	if (val == private->sp_hp_mute)
+		return 0;
+
+	private->sp_hp_mute = val;
+
+	/* Send change to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SP_HP_MUTE,
+				       0, val);
+
+	return err < 0 ? err : 1;
+}
+
+static const struct snd_kcontrol_new scarlett2_sp_hp_mute_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_sp_hp_mute_ctl_get,
+	.put  = scarlett2_sp_hp_mute_ctl_put
+};
+
 /*** Create the analogue output controls ***/
 
 static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
@@ -6325,6 +6409,17 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Add Vocaster speaker/headphone mute controls */
+	if (private->info->sp_hp_mute_names)
+		for (i = 0; private->info->sp_hp_mute_names[i]; i++) {
+			err = scarlett2_add_new_ctl(
+				mixer, &scarlett2_sp_hp_mute_ctl,
+				i, 1, private->info->sp_hp_mute_names[i],
+				NULL);
+			if (err < 0)
+				return err;
+		}
+
 	/* Remaining controls are only applicable if the device
 	 * has per-channel line-out volume controls.
 	 */
-- 
2.45.0

