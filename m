Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9113E7DD
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268587; cv=none; b=LqRGlMpC2kgI3uTYmptpLCdS+ZgjTVJHApukJ+LpY9FNUNk1TZ61AXahWK5bgzPZjmcGJ1bchFVncsJtEVq5PTXwthpPUpnJGQja6e2JwmZ4ag8cowEWitbiQua0x+vedPXkBe7KgXChtJjP2RHCcpIzOwBhZhcrNBAUhUjFSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268587; c=relaxed/simple;
	bh=bGrJQ+yp28q5ADIuKIQ+YcQzy6Avxt/eFDL8GXGM5Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJNvXoY691KETNntjypLFDjKntn4r5R1RwKN0YAqYTFsOV7wPZeaEl5hO4tAHB+2FOEBlsLlxdY3tVbgb/ohgPZ9G9RI2FiHllbLP82i4REL4vJwN4saAfKtvXl908xdBcU/amHZpTjO7Phc1Ja7fylZmJqY3LTTrsGZRBCC0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=LUzJ4Tzr; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="LUzJ4Tzr"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 4F264604B628; Wed, 13 Mar 2024 05:06:23 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 4F264604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268583; bh=YwNuF5GddlaNZCDZwloSIo5hvxO3qjlUg2kg6GmFf4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUzJ4TzrNFnxxRox1UI2saDlpEGzx07HIsQiTw7e2vlHuD8scegtwqxSVtjZ7JDtm
	 wxH03pkkmGwP9dZ0hpgXBpjLConzHp6Nz/izxdHNg4kKDKlJUmUfVv+gSRFQMnD8SC
	 DomKe6amYlNON6/p8NgfbgGwUXhDO3UUE75EwxtRd/KTCYmaTfgB5knZ8Dm+PrLSSs
	 AWF7kDzyjYwHCefs/CyXXpAwB8cFr/3japyjCdNwkySuZZKsYBvreTob95TMKRnwRi
	 Yb+vePl7UwtBP2Z5rKymHXaKpyCD3zusR0uRJHucPvEBQNXWoaU+s1bTmozSZYbv+l
	 XLg2U6C1v0Fkw==
Date: Wed, 13 Mar 2024 05:06:23 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 10/14] ALSA: scarlett2: Add input mute controls
Message-ID: <3b384b4e759241bd06f0c223e9f4f00467d88318.1710264833.git.g@b4.vu>
References: <cover.1710264833.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710264833.git.g@b4.vu>

Add controls for the input mute switches that the Vocaster interfaces
have. Mark scarlett2_notify_input_mute() as __always_unused until it
gets used when the Vocaster callback function array is added.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 142 +++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 0962277947bf..17fadfddc240 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -85,7 +85,7 @@
  *    controls
  *  - disable/enable MSD mode
  *  - disable/enable standalone mode
- *  - input gain, autogain, safe mode
+ *  - input mute, gain, autogain, safe mode
  *  - direct monitor mixes
  *
  * <ditaa>
@@ -214,6 +214,7 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 #define SCARLETT2_LEVEL_SWITCH_MAX 2
 #define SCARLETT2_PAD_SWITCH_MAX 8
 #define SCARLETT2_AIR_SWITCH_MAX 8
+#define SCARLETT2_INPUT_MUTE_SWITCH_MAX 2
 #define SCARLETT2_PHANTOM_SWITCH_MAX 2
 #define SCARLETT2_INPUT_GAIN_MAX 2
 
@@ -329,6 +330,7 @@ static void scarlett2_notify_volume(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_level(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_pad(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_air(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_mute(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_phantom(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_select(struct usb_mixer_interface *mixer);
@@ -415,6 +417,7 @@ enum {
 	SCARLETT2_CONFIG_PAD_SWITCH,
 	SCARLETT2_CONFIG_MSD_SWITCH,
 	SCARLETT2_CONFIG_AIR_SWITCH,
+	SCARLETT2_CONFIG_INPUT_MUTE_SWITCH,
 	SCARLETT2_CONFIG_STANDALONE_SWITCH,
 	SCARLETT2_CONFIG_PHANTOM_SWITCH,
 	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
@@ -915,6 +918,11 @@ struct scarlett2_device_info {
 	 */
 	u8 air_option;
 
+	/* the number of analogue inputs with a software switchable
+	 * mute control
+	 */
+	u8 mute_input_count;
+
 	/* the number of phantom (48V) software switchable controls */
 	u8 phantom_count;
 
@@ -996,6 +1004,7 @@ struct scarlett2_data {
 	u8 input_level_updated;
 	u8 input_pad_updated;
 	u8 input_air_updated;
+	u8 input_mute_updated;
 	u8 input_phantom_updated;
 	u8 input_select_updated;
 	u8 input_gain_updated;
@@ -1018,6 +1027,7 @@ struct scarlett2_data {
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
 	u8 air_switch[SCARLETT2_AIR_SWITCH_MAX];
+	u8 input_mute_switch[SCARLETT2_INPUT_MUTE_SWITCH_MAX];
 	u8 phantom_switch[SCARLETT2_PHANTOM_SWITCH_MAX];
 	u8 phantom_persistence;
 	u8 input_select_switch;
@@ -1045,6 +1055,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *level_ctls[SCARLETT2_LEVEL_SWITCH_MAX];
 	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
 	struct snd_kcontrol *air_ctls[SCARLETT2_AIR_SWITCH_MAX];
+	struct snd_kcontrol *input_mute_ctls[SCARLETT2_INPUT_MUTE_SWITCH_MAX];
 	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
 	struct snd_kcontrol *input_select_ctl;
 	struct snd_kcontrol *input_link_ctls[SCARLETT2_INPUT_GAIN_MAX / 2];
@@ -2970,6 +2981,8 @@ static void scarlett2_autogain_update_access(struct usb_mixer_interface *mixer)
 		scarlett2_set_ctl_access(private->level_ctls[i], val);
 	for (i = 0; i < info->air_input_count; i++)
 		scarlett2_set_ctl_access(private->air_ctls[i], val);
+	for (i = 0; i < info->mute_input_count; i++)
+		scarlett2_set_ctl_access(private->input_mute_ctls[i], val);
 	for (i = 0; i < info->phantom_count; i++)
 		scarlett2_set_ctl_access(private->phantom_ctls[i], val);
 }
@@ -3005,6 +3018,9 @@ static void scarlett2_autogain_notify_access(struct usb_mixer_interface *mixer)
 	for (i = 0; i < info->air_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->air_ctls[i]->id);
+	for (i = 0; i < info->mute_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->input_mute_ctls[i]->id);
 	for (i = 0; i < info->phantom_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->phantom_ctls[i]->id);
@@ -4619,6 +4635,100 @@ static const struct snd_kcontrol_new scarlett2_air_ctl[2] = {
 	}
 };
 
+/*** Input Mute Switch Controls ***/
+
+static int scarlett2_update_input_mute(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	private->input_mute_updated = 0;
+
+	if (!info->mute_input_count)
+		return 0;
+
+	return scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_INPUT_MUTE_SWITCH,
+		info->mute_input_count, private->input_mute_switch);
+}
+
+static int scarlett2_input_mute_ctl_get(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	if (private->input_mute_updated) {
+		err = scarlett2_update_input_mute(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+	ucontrol->value.integer.value[0] =
+		private->input_mute_switch[elem->control];
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_input_mute_ctl_put(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int index = elem->control;
+	int oval, val, err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
+	oval = private->input_mute_switch[index];
+	val = ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->input_mute_switch[index] = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_INPUT_MUTE_SWITCH,
+			index, val);
+	if (err == 0)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_input_mute_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett2_autogain_disables_ctl_info,
+	.get  = scarlett2_input_mute_ctl_get,
+	.put  = scarlett2_input_mute_ctl_put,
+};
+
 /*** Phantom Switch Controls ***/
 
 static int scarlett2_update_input_phantom(struct usb_mixer_interface *mixer)
@@ -5497,6 +5607,16 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Add input mute controls */
+	for (i = 0; i < info->mute_input_count; i++) {
+		scnprintf(s, sizeof(s), fmt, i + 1, "Mute", "Switch");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_input_mute_ctl,
+			i, 1, s, &private->input_mute_ctls[i]);
+		if (err < 0)
+			return err;
+	}
+
 	/* Add input phantom controls */
 	if (info->inputs_per_phantom == 1) {
 		for (i = 0; i < info->phantom_count; i++) {
@@ -6558,6 +6678,22 @@ static void scarlett2_notify_input_air(struct usb_mixer_interface *mixer)
 			       &private->air_ctls[i]->id);
 }
 
+/* Notify on input mute switch change */
+static __always_unused void scarlett2_notify_input_mute(
+	struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	private->input_mute_updated = 1;
+
+	for (i = 0; i < info->mute_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->input_mute_ctls[i]->id);
+}
+
 /* Notify on input phantom switch change */
 static void scarlett2_notify_input_phantom(struct usb_mixer_interface *mixer)
 {
@@ -7171,6 +7307,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = scarlett2_update_input_mute(mixer);
+	if (err < 0)
+		return err;
+
 	err = scarlett2_update_input_phantom(mixer);
 	if (err < 0)
 		return err;
-- 
2.43.0

