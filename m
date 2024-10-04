Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B0569D2B
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052135; cv=none; b=rDKgbTMU9gygc2fRtx853hXU+ENffQ7s72RQvy/Z7Xof+fczkFuu4jlCAZoTPgzgq5qg29n75N6GlCTq6iFeRmsc/n5EdEAjwunlh/r2prq2sVgD28G46a/1NMdAKt1YR0sGiWCvjBUihMt5i7lC9YDnyXlov+TLSb5BJMO074M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052135; c=relaxed/simple;
	bh=NH2VFOdUTMGJEMwD6ydxZlfdLkzzL3jtHCzUVzuwHLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJJ+PsKQm/r+pj+vPu61ee6B4fyzcNHuZrKDiDqSRePJrKZkAZ9zH/EaLe0Zf8ZJEXifxWQ1SbUR8vUlXBq4B/nYoffBQhLRBcUC1qRCQ8e88gv6h1heyTjxEs4UWRDKjKaM1rEmf0KqObhFRiZ3r12/5KetjdNinbRMUyDbv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=s03W/K9b; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="s03W/K9b"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8B3E161AD440; Fri,  4 Oct 2024 23:58:51 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8B3E161AD440
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052131; bh=IZG3USkQoGh9Z2kJwzdLlmp1Kyoo/XhaH/pSq0M8Gpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s03W/K9bqdKGV2UCjIiZeiaR7cTkIr4CknMXhpcxKzVEKixCusZLLKMQmZIqELoNY
	 TsKhAokk/vk9WJgggbWkwSM1PvwlWEaaRApNdFITKSQF9iFRrCQ4OdpYCnrxBpU2LB
	 8e4/vdyqtiaI5iSVMOu/3EkVQr/CbHdIvisbKScjzWl+XbRyFNroTjWwkNunRbOz/+
	 SaL0MWWWr2ql6fu5AsJS6xZRtbl6JNRa8wVjQWYpZ5pvHJ7ohDw58hg0QzQId/xVK8
	 PTSKoraeL8QsSNh4ygTMZ3ZT+/Pc9Lf32gI2pVdvX4hbbtz/qpFGwZAua8KQc4jwnD
	 Fwj6PKd1EvO2g==
Date: Fri, 4 Oct 2024 23:58:51 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ALSA: scarlett2: Simplify linked channel handling
Message-ID: <9bf8a2ab35f243820d066319b7d407b45a61281b.1727971672.git.g@b4.vu>
References: <cover.1727971672.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1727971672.git.g@b4.vu>

The current handling of linked channels for the 4th Gen 2i2 and 4i4
models is more complicated than necessary. The firmware has a link
control for each channel, and the channel selection can be any channel
regardless of the channel link status. The driver can therefore be
simplified by having it reflect the controls presented by the
firmware, and complexities related to trying to reflect the channel
link status in the Input Select Capture Enum control are not
necessary.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 71 ++++++++++++-------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 844e95cc965e..b0eca4785bc6 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -11,7 +11,7 @@
  *   - Clarett 2Pre/4Pre/8Pre USB
  *   - Clarett+ 2Pre/4Pre/8Pre
  *
- *   Copyright (c) 2018-2023 by Geoffrey D. Bennett <g at b4.vu>
+ *   Copyright (c) 2018-2024 by Geoffrey D. Bennett <g at b4.vu>
  *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
  *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
  *
@@ -1253,7 +1253,7 @@ struct scarlett2_data {
 	u8 phantom_switch[SCARLETT2_PHANTOM_SWITCH_MAX];
 	u8 phantom_persistence;
 	u8 input_select_switch;
-	u8 input_link_switch[SCARLETT2_INPUT_GAIN_MAX / 2];
+	u8 input_link_switch[SCARLETT2_INPUT_GAIN_MAX];
 	u8 gain[SCARLETT2_INPUT_GAIN_MAX];
 	u8 autogain_switch[SCARLETT2_INPUT_GAIN_MAX];
 	u8 autogain_status[SCARLETT2_INPUT_GAIN_MAX];
@@ -1284,7 +1284,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *input_mute_ctls[SCARLETT2_INPUT_MUTE_SWITCH_MAX];
 	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
 	struct snd_kcontrol *input_select_ctl;
-	struct snd_kcontrol *input_link_ctls[SCARLETT2_INPUT_GAIN_MAX / 2];
+	struct snd_kcontrol *input_link_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *input_gain_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *autogain_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *autogain_status_ctls[SCARLETT2_INPUT_GAIN_MAX];
@@ -3439,7 +3439,7 @@ static void scarlett2_autogain_update_access(struct usb_mixer_interface *mixer)
 		scarlett2_set_ctl_access(private->input_select_ctl, val);
 	if (scarlett2_has_config_item(private,
 				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH))
-		for (i = 0; i < info->gain_input_count / 2; i++)
+		for (i = 0; i < info->gain_input_count; i++)
 			scarlett2_set_ctl_access(private->input_link_ctls[i],
 						 val);
 	for (i = 0; i < info->gain_input_count; i++)
@@ -3480,7 +3480,7 @@ static void scarlett2_autogain_notify_access(struct usb_mixer_interface *mixer)
 			       &private->input_select_ctl->id);
 	if (scarlett2_has_config_item(private,
 				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH))
-		for (i = 0; i < info->gain_input_count / 2; i++)
+		for (i = 0; i < info->gain_input_count; i++)
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 				       &private->input_link_ctls[i]->id);
 	for (i = 0; i < info->gain_input_count; i++)
@@ -3825,7 +3825,7 @@ static int scarlett2_update_input_select(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	int link_count = info->gain_input_count / 2;
+	int link_count = info->gain_input_count;
 	int err;
 
 	private->input_select_updated = 0;
@@ -3847,10 +3847,6 @@ static int scarlett2_update_input_select(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	/* simplified because no model yet has link_count > 1 */
-	if (private->input_link_switch[0])
-		private->input_select_switch = 0;
-
 	return 0;
 }
 
@@ -3887,9 +3883,9 @@ static int scarlett2_input_select_ctl_put(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 
 	int oval, val, err;
-	int max_val = private->input_link_switch[0] ? 0 : 1;
 
 	mutex_lock(&private->data_mutex);
 
@@ -3907,19 +3903,18 @@ static int scarlett2_input_select_ctl_put(
 
 	if (val < 0)
 		val = 0;
-	else if (val > max_val)
-		val = max_val;
+	else if (val >= info->gain_input_count)
+		val = info->gain_input_count - 1;
 
 	if (oval == val)
 		goto unlock;
 
 	private->input_select_switch = val;
 
-	/* Send switch change to the device if inputs not linked */
-	if (!private->input_link_switch[0])
-		err = scarlett2_usb_set_config(
-			mixer, SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
-			1, val);
+	/* Send new value to the device */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_INPUT_SELECT_SWITCH,
+		0, val);
 	if (err == 0)
 		err = 1;
 
@@ -3936,8 +3931,7 @@ static int scarlett2_input_select_ctl_info(
 	struct scarlett2_data *private = mixer->private_data;
 
 	int inputs = private->info->gain_input_count;
-	int i, j;
-	int err;
+	int i, err;
 	char **values = kcalloc(inputs, sizeof(char *), GFP_KERNEL);
 
 	if (!values)
@@ -3954,21 +3948,11 @@ static int scarlett2_input_select_ctl_info(
 	if (err < 0)
 		goto unlock;
 
-	/* Loop through each input
-	 * Linked inputs have one value for the pair
-	 */
-	for (i = 0, j = 0; i < inputs; i++) {
-		if (private->input_link_switch[i / 2]) {
-			values[j++] = kasprintf(
-				GFP_KERNEL, "Input %d-%d", i + 1, i + 2);
-			i++;
-		} else {
-			values[j++] = kasprintf(
-				GFP_KERNEL, "Input %d", i + 1);
-		}
-	}
+	/* Loop through each input */
+	for (i = 0; i < inputs; i++)
+		values[i] = kasprintf(GFP_KERNEL, "Input %d", i + 1);
 
-	err = snd_ctl_enum_info(uinfo, 1, j,
+	err = snd_ctl_enum_info(uinfo, 1, i,
 				(const char * const *)values);
 
 unlock:
@@ -4077,18 +4061,8 @@ static int scarlett2_input_link_ctl_put(
 
 	private->input_link_switch[index] = val;
 
-	/* Notify of change in input select options available */
-	snd_ctl_notify(mixer->chip->card,
-		       SNDRV_CTL_EVENT_MASK_VALUE | SNDRV_CTL_EVENT_MASK_INFO,
-		       &private->input_select_ctl->id);
-	private->input_select_updated = 1;
-
-	/* Send switch change to the device
-	 * Link for channels 1-2 is at index 1
-	 * No device yet has more than 2 channels linked
-	 */
 	err = scarlett2_usb_set_config(
-		mixer, SCARLETT2_CONFIG_INPUT_LINK_SWITCH, index + 1, val);
+		mixer, SCARLETT2_CONFIG_INPUT_LINK_SWITCH, index, val);
 	if (err == 0)
 		err = 1;
 
@@ -6914,10 +6888,9 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	if (scarlett2_has_config_item(private,
 				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH)) {
-		for (i = 0; i < info->gain_input_count / 2; i++) {
+		for (i = 0; i < info->gain_input_count; i++) {
 			scnprintf(s, sizeof(s),
-				  "Line In %d-%d Link Capture Switch",
-				  (i * 2) + 1, (i * 2) + 2);
+				  "Line In %d Link Capture Switch", i + 1);
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_input_link_ctl,
 				i, 1, s, &private->input_link_ctls[i]);
@@ -8244,7 +8217,7 @@ static void scarlett2_notify_input_select(struct usb_mixer_interface *mixer)
 		       SNDRV_CTL_EVENT_MASK_VALUE | SNDRV_CTL_EVENT_MASK_INFO,
 		       &private->input_select_ctl->id);
 
-	for (i = 0; i < info->gain_input_count / 2; i++)
+	for (i = 0; i < info->gain_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->input_link_ctls[i]->id);
 }
-- 
2.45.0

