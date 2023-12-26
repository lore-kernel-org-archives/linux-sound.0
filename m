Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECB4F88B
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="e0kWFnsl"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 784AE604B414; Wed, 27 Dec 2023 04:37:56 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 784AE604B414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614076; bh=mXe3fmuxi2Ese6J9so7/NZDB/q2dxpB/nCEjIWf0QkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0kWFnsliHHDqKc5UtpkqVjm9YXWZUc2WyzfhaD9nAdnV5RikDOMpiYq9FESHL0Jo
	 MpzIosqGITyvdX7oN53lNrrSgjkMXQzf/mRKYSN+QWCOWTzlOy+KuEVS4rD4Ls5erp
	 JWei2QdmiKyuO0dcFr1pshYpPCCbsDY2ho9Zob2xULbWbEy9bHRjkXIa1D+6l3J9JS
	 dU3tNiNupZXMhvTSj+D6o5DWIYlQvTjrKXG70gE6BuOGCIP2Aq6yShr4psq7+OhDaW
	 xeGn/Er62O9hlAnra52SMBnEZ/Sd7CsqUJbUknv10/gHt4pcH390hM4ax5PglYpkls
	 zV47ExawRZzAg==
Date: Wed, 27 Dec 2023 04:37:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 10/20] ALSA: scarlett2: Disable autogain during phantom power
 state change
Message-ID: <f49f7bf9358e1f20713d95d407d8d6a436859877.1703612638.git.g@b4.vu>
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

When phantom power is enabled or disabled, the autogain control cannot
be enabled until the interface has signalled that the change is
complete and the input is unmuted. Update those controls to be
read-only during this time.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 123 +++++++++++++++++++++++++++++++++---
 1 file changed, 113 insertions(+), 10 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6c8398aa103f..2d6fd9faed31 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2391,6 +2391,10 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 
 /*** Autogain Switch and Status Controls ***/
 
+/* Forward declarations as phantom power and autogain can disable each other */
+static int scarlett2_check_input_phantom_updated(struct usb_mixer_interface *);
+static int scarlett2_phantom_is_switching(struct scarlett2_data *, int);
+
 /* Set the access mode of a control to read-only (val = 0) or
  * read-write (val = 1).
  */
@@ -2557,6 +2561,27 @@ static int scarlett2_check_put_during_autogain(
 	return 0;
 }
 
+static int scarlett2_autogain_switch_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	mutex_lock(&private->data_mutex);
+
+	err = scarlett2_check_input_phantom_updated(mixer);
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
 static int scarlett2_autogain_switch_ctl_get(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
 {
@@ -2619,7 +2644,7 @@ static int scarlett2_autogain_switch_ctl_put(
 	struct scarlett2_data *private = mixer->private_data;
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -2628,6 +2653,15 @@ static int scarlett2_autogain_switch_ctl_put(
 		goto unlock;
 	}
 
+	err = scarlett2_check_input_phantom_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
+	if (scarlett2_phantom_is_switching(private, index)) {
+		err = -EPERM;
+		goto unlock;
+	}
+
 	oval = private->autogain_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2664,7 +2698,7 @@ static int scarlett2_autogain_status_ctl_info(
 static const struct snd_kcontrol_new scarlett2_autogain_switch_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "",
-	.info = snd_ctl_boolean_mono_info,
+	.info = scarlett2_autogain_switch_ctl_info,
 	.get  = scarlett2_autogain_switch_ctl_get,
 	.put  = scarlett2_autogain_switch_ctl_put
 };
@@ -3983,13 +4017,74 @@ static int scarlett2_update_input_phantom(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/* Check if phantom power on the given input is currently changing state */
+static int scarlett2_phantom_is_switching(
+	struct scarlett2_data *private, int line_num)
+{
+	const struct scarlett2_device_info *info = private->info;
+	int index = line_num / info->inputs_per_phantom;
+
+	return !!(private->phantom_switch[index] & 0x02);
+}
+
+/* Update autogain controls' access mode when phantom power changes state */
+static void scarlett2_phantom_update_access(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	/* Disable autogain controls if phantom power is changing state */
+	for (i = 0; i < info->gain_input_count; i++) {
+		int val = !scarlett2_phantom_is_switching(private, i);
+
+		scarlett2_set_ctl_access(private->autogain_ctls[i], val);
+	}
+}
+
+/* Notify of access mode change for autogain which can't be enabled
+ * while phantom power is changing.
+ */
+static void scarlett2_phantom_notify_access(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int i;
+
+	for (i = 0; i < info->gain_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->autogain_ctls[i]->id);
+}
+
+/* Call scarlett2_update_input_phantom() and
+ * scarlett2_phantom_update_access() if input_phantom_updated is set.
+ */
+static int scarlett2_check_input_phantom_updated(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err;
+
+	if (!private->input_phantom_updated)
+		return 0;
+
+	err = scarlett2_update_input_phantom(mixer);
+	if (err < 0)
+		return err;
+
+	scarlett2_phantom_update_access(mixer);
+
+	return 0;
+}
+
 static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err = 0;
+	int err;
 
 	mutex_lock(&private->data_mutex);
 
@@ -3998,11 +4093,10 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->input_phantom_updated) {
-		err = scarlett2_update_input_phantom(mixer);
-		if (err < 0)
-			goto unlock;
-	}
+	err = scarlett2_check_input_phantom_updated(mixer);
+	if (err < 0)
+		goto unlock;
+
 	ucontrol->value.integer.value[0] = scarlett2_decode_muteable(
 		private->phantom_switch[elem->control]);
 
@@ -4051,6 +4145,9 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 	if (err == 0)
 		err = 1;
 
+	scarlett2_phantom_update_access(mixer);
+	scarlett2_phantom_notify_access(mixer);
+
 unlock:
 	mutex_unlock(&private->data_mutex);
 	return err;
@@ -5912,6 +6009,8 @@ static void scarlett2_notify_input_phantom(struct usb_mixer_interface *mixer)
 	for (i = 0; i < info->phantom_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->phantom_ctls[i]->id);
+
+	scarlett2_phantom_notify_access(mixer);
 }
 
 /* Notify on "input other" change (level/pad/air/phantom) */
@@ -6231,9 +6330,13 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
-	/* Set the access mode of controls disabled during autogain */
-	if (private->info->gain_input_count)
+	/* Set the access mode of controls disabled during
+	 * autogain/phantom power switching.
+	 */
+	if (private->info->gain_input_count) {
 		scarlett2_autogain_update_access(mixer);
+		scarlett2_phantom_update_access(mixer);
+	}
 
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
-- 
2.43.0

