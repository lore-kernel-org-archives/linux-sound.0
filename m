Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C65024C
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Ij7hQnBD"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 36371604B4AC; Wed, 27 Dec 2023 04:37:36 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 36371604B4AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614056; bh=8NJQf1915TN+0iGVecbd6yaQpk4rW4i3IjXzcfMmkmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij7hQnBDhmp1RJQesZnOBnRDQkeI+1RXjglmF5GSlECpNY8Zzj+W8BYbupCSs1L7f
	 3VmPrvjgmDi1vmaJsJOu1ec4liWOo/IelNTKc3GhuNZBI042R7hGMV9y1qLnppFk1d
	 thx99var62Zn61ScjN0AHGWwKzi2sL7tfl6dulJW2uD2AbX2Res7A8aTg/aydIHnxT
	 V8hXviu4ynO6/uant6Ip7SgK5HWleUlI6y6HvgoBTyDLvtFmbAmY/hmUYlBvtFVn1W
	 c9M59fqkOFR5f6BnH0xRd6vsu22iYgumJQbtDzAAOvEXJ7riQUW92Vs4cuASZCGyHS
	 k6tBCL9z94bYQ==
Date: Wed, 27 Dec 2023 04:37:36 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 09/20] ALSA: scarlett2: Disable input controls while autogain
 is running
Message-ID: <ad13bacae77860de8c2d7c89f6ec2a1ee104e65f.1703612638.git.g@b4.vu>
References: <cover.1703612638.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703612638.git.g@b4.vu>

While the autogain function is running, the other input controls
(select, link, gain, safe, level, air, and phantom) can't be modified.
Update those controls to be read-only during this time.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 298 +++++++++++++++++++++++++++++++++---
 1 file changed, 273 insertions(+), 25 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ce2fb742dd97..6c8398aa103f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2391,6 +2391,30 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 
 /*** Autogain Switch and Status Controls ***/
 
+/* Set the access mode of a control to read-only (val = 0) or
+ * read-write (val = 1).
+ */
+static void scarlett2_set_ctl_access(struct snd_kcontrol *kctl, int val)
+{
+	if (val)
+		kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
+	else
+		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_WRITE;
+}
+
+/* Check if autogain is running on any input */
+static int scarlett2_autogain_is_running(struct scarlett2_data *private)
+{
+	int i;
+
+	for (i = 0; i < private->info->gain_input_count; i++)
+		if (private->autogain_status[i] ==
+		    SCARLETT2_AUTOGAIN_STATUS_RUNNING)
+			return 1;
+
+	return 0;
+}
+
 static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
@@ -2438,13 +2462,108 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/* Update access mode for controls affected by autogain */
+static void scarlett2_autogain_update_access(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int val = !scarlett2_autogain_is_running(private);
+	int i;
+
+	scarlett2_set_ctl_access(private->input_select_ctl, val);
+	for (i = 0; i < info->gain_input_count / 2; i++)
+		scarlett2_set_ctl_access(private->input_link_ctls[i], val);
+	for (i = 0; i < info->gain_input_count; i++) {
+		scarlett2_set_ctl_access(private->input_gain_ctls[i], val);
+		scarlett2_set_ctl_access(private->safe_ctls[i], val);
+	}
+	for (i = 0; i < info->level_input_count; i++)
+		scarlett2_set_ctl_access(private->level_ctls[i], val);
+	for (i = 0; i < info->air_input_count; i++)
+		scarlett2_set_ctl_access(private->air_ctls[i], val);
+	for (i = 0; i < info->phantom_count; i++)
+		scarlett2_set_ctl_access(private->phantom_ctls[i], val);
+}
+
+/* Notify of access mode change for all controls read-only while
+ * autogain runs.
+ */
+static void scarlett2_autogain_notify_access(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+		       &private->input_select_ctl->id);
+	for (i = 0; i < info->gain_input_count / 2; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->input_link_ctls[i]->id);
+	for (i = 0; i < info->gain_input_count; i++) {
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->input_gain_ctls[i]->id);
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->safe_ctls[i]->id);
+	}
+	for (i = 0; i < info->level_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->level_ctls[i]->id);
+	for (i = 0; i < info->air_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->air_ctls[i]->id);
+	for (i = 0; i < info->phantom_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->phantom_ctls[i]->id);
+}
+
+/* Call scarlett2_update_autogain() and
+ * scarlett2_autogain_update_access() if autogain_updated is set.
+ */
+static int scarlett2_check_autogain_updated(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	if (!private->autogain_updated)
+		return 0;
+
+	err = scarlett2_update_autogain(mixer);
+	if (err < 0)
+		return err;
+
+	scarlett2_autogain_update_access(mixer);
+
+	return 0;
+}
+
+/* If autogain_updated is set when a *_ctl_put() function for a
+ * control that is meant to be read-only while autogain is running,
+ * update the autogain status and access mode of affected controls.
+ * Return -EPERM if autogain is running.
+ */
+static int scarlett2_check_put_during_autogain(
+	struct usb_mixer_interface *mixer)
+{
+	int err = scarlett2_check_autogain_updated(mixer);
+
+	if (err < 0)
+		return err;
+
+	if (scarlett2_autogain_is_running(mixer->private_data))
+		return -EPERM;
+
+	return 0;
+}
+
 static int scarlett2_autogain_switch_ctl_get(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2453,11 +2572,10 @@ static int scarlett2_autogain_switch_ctl_get(
 		goto unlock;
 	}
 
-	if (private->autogain_updated) {
-		err = scarlett2_update_autogain(mixer);
-		if (err < 0)
-			goto unlock;
-	}
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
 	ucontrol->value.enumerated.item[0] =
 		private->autogain_switch[elem->control];
 
@@ -2472,7 +2590,7 @@ static int scarlett2_autogain_status_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2481,11 +2599,10 @@ static int scarlett2_autogain_status_ctl_get(
 		goto unlock;
 	}
 
-	if (private->autogain_updated) {
-		err = scarlett2_update_autogain(mixer);
-		if (err < 0)
-			goto unlock;
-	}
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
 	ucontrol->value.enumerated.item[0] =
 		private->autogain_status[elem->control];
 
@@ -2525,6 +2642,9 @@ static int scarlett2_autogain_switch_ctl_put(
 	if (err == 0)
 		err = 1;
 
+	scarlett2_autogain_update_access(mixer);
+	scarlett2_autogain_notify_access(mixer);
+
 unlock:
 	mutex_unlock(&private->data_mutex);
 	return err;
@@ -2624,7 +2744,7 @@ static int scarlett2_input_select_ctl_put(
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 
-	int oval, val, err = 0;
+	int oval, val, err;
 	int max_val = private->input_link_switch[0] ? 0 : 1;
 
 	mutex_lock(&private->data_mutex);
@@ -2634,6 +2754,10 @@ static int scarlett2_input_select_ctl_put(
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->input_select_switch;
 	val = ucontrol->value.integer.value[0];
 
@@ -2677,6 +2801,15 @@ static int scarlett2_input_select_ctl_info(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
 	/* Loop through each input
 	 * Linked inputs have one value for the pair
 	 */
@@ -2694,6 +2827,7 @@ static int scarlett2_input_select_ctl_info(
 	err = snd_ctl_enum_info(uinfo, 1, j,
 				(const char * const *)values);
 
+unlock:
 	mutex_unlock(&private->data_mutex);
 
 	for (i = 0; i < inputs; i++)
@@ -2713,6 +2847,35 @@ static const struct snd_kcontrol_new scarlett2_input_select_ctl = {
 
 /*** Input Link Switch Controls ***/
 
+/* snd_ctl_boolean_mono_info() with autogain-updated check
+ * (for controls that are read-only while autogain is running)
+ */
+static int scarlett2_autogain_disables_ctl_info(struct snd_kcontrol *kctl,
+						struct snd_ctl_elem_info *uinfo)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_ctl_boolean_mono_info(kctl, uinfo);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
 static int scarlett2_input_link_ctl_get(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
 {
@@ -2749,7 +2912,7 @@ static int scarlett2_input_link_ctl_put(
 	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2758,6 +2921,10 @@ static int scarlett2_input_link_ctl_put(
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->input_link_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2789,7 +2956,7 @@ static int scarlett2_input_link_ctl_put(
 static const struct snd_kcontrol_new scarlett2_input_link_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "",
-	.info = snd_ctl_boolean_mono_info,
+	.info = scarlett2_autogain_disables_ctl_info,
 	.get  = scarlett2_input_link_ctl_get,
 	.put  = scarlett2_input_link_ctl_put
 };
@@ -2815,13 +2982,30 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 					 struct snd_ctl_elem_info *uinfo)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = elem->channels;
 	uinfo->value.integer.min = 0;
 	uinfo->value.integer.max = SCARLETT2_GAIN_BIAS;
 	uinfo->value.integer.step = 1;
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_input_gain_ctl_get(struct snd_kcontrol *kctl,
@@ -2860,7 +3044,7 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2869,6 +3053,10 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->gain[index];
 	val = ucontrol->value.integer.value[0];
 
@@ -2957,7 +3145,7 @@ static int scarlett2_safe_ctl_put(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2966,6 +3154,10 @@ static int scarlett2_safe_ctl_put(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->safe_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2988,7 +3180,7 @@ static int scarlett2_safe_ctl_put(struct snd_kcontrol *kctl,
 static const struct snd_kcontrol_new scarlett2_safe_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "",
-	.info = snd_ctl_boolean_mono_info,
+	.info = scarlett2_autogain_disables_ctl_info,
 	.get  = scarlett2_safe_ctl_get,
 	.put  = scarlett2_safe_ctl_put,
 };
@@ -3434,8 +3626,27 @@ static int scarlett2_level_enum_ctl_info(struct snd_kcontrol *kctl,
 	static const char *const values[2] = {
 		"Line", "Inst"
 	};
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
 
-	return snd_ctl_enum_info(uinfo, 1, 2, values);
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_ctl_enum_info(uinfo, 1, 2, values);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
@@ -3478,7 +3689,7 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	const struct scarlett2_device_info *info = private->info;
 
 	int index = elem->control + info->level_input_first;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -3487,6 +3698,10 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->level_switch[index];
 	val = !!ucontrol->value.enumerated.item[0];
 
@@ -3659,7 +3874,7 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -3668,6 +3883,10 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->air_switch[index];
 	val = ucontrol->value.integer.value[0];
 
@@ -3693,8 +3912,27 @@ static int scarlett2_air_with_drive_ctl_info(
 	static const char *const values[3] = {
 		"Off", "Presence", "Presence + Drive"
 	};
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
 
-	return snd_ctl_enum_info(uinfo, 1, 3, values);
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = scarlett2_check_autogain_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_ctl_enum_info(uinfo, 1, 3, values);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static const struct snd_kcontrol_new scarlett2_air_ctl[2] = {
@@ -3782,7 +4020,7 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	const struct scarlett2_device_info *info = private->info;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -3791,6 +4029,10 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
+	err = scarlett2_check_put_during_autogain(mixer);
+	if (err < 0)
+		goto unlock;
+
 	oval = private->phantom_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -3817,7 +4059,7 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 static const struct snd_kcontrol_new scarlett2_phantom_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "",
-	.info = snd_ctl_boolean_mono_info,
+	.info = scarlett2_autogain_disables_ctl_info,
 	.get  = scarlett2_phantom_ctl_get,
 	.put  = scarlett2_phantom_ctl_put,
 };
@@ -5743,6 +5985,8 @@ static __always_unused void scarlett2_notify_autogain(
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->autogain_status_ctls[i]->id);
 	}
+
+	scarlett2_autogain_notify_access(mixer);
 }
 
 /* Notify on input safe switch change */
@@ -5987,6 +6231,10 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Set the access mode of controls disabled during autogain */
+	if (private->info->gain_input_count)
+		scarlett2_autogain_update_access(mixer);
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.43.0

