Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B213DBBD
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268550; cv=none; b=bCyCEPkyxRMc+PRSUQ1M/V8FmQUHMZ/fLO9Q0QizM7UrLc/NrPn/Jvb7cBTAigEzsh4FgrL9I9Q9Z/hHBhQWKLL8RBrVrK7enF40xAZFE04qXi6XVPWNl2t2ijGO2kQwCUXQ4I6h+OBsrDjzy3BEWxspQkThHFDRmRG7+FkJVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268550; c=relaxed/simple;
	bh=b0QsYWZAC02GtaXuLu1YtRXRyTnLmhhuFJLdfocaB1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptrl77YbAFyNIvxoWOi8lKGXAD7+hsSQujbkoGup5rhYWLSYHy384hMNsBgUPJoYMO0QuLJ5GO4f7rNk6QnzALZDuWXInLrdywzAQauVR2NGsXgJc4oO9K0zor4Kx30bptJbMzvZn72I58tJeqJhRiav5vuiSD5rbYsxqyxDARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=rpkTL9mI; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="rpkTL9mI"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 0E631604B628; Wed, 13 Mar 2024 05:05:47 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 0E631604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268547; bh=plriR9+9j1YGErDemRDvG9gbxvOPpc+kjkkJb3Qipzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpkTL9mIge9gXz1o9o1w1h+ZmIDUNnCj/2h5jc1Cwey4wbhfZ7F+x2yxrXe6Y3M8+
	 cituQ2BDaD+nWhhL2t1RINBvLqEnmqv6BOr4/6v3ZTNlkdGyVm7SfoJyZb7UqxS5oC
	 innuz6gOMI6yRvM15M6hpJsqw+HOvYvlXXAxzLUHoABko5iv3mXg1+x4q6XACZa10F
	 mcGwLrECHBaBljb0vctzwYlVqmUg40DqmBRZmoaqO/cXAZTHN0ep0A+bwNzJgllaHq
	 uvw9GLobWLQz6Umg/NAcxKAgqZRZoVUBV3ZDoSna8fmcyyODqib14av/OVXByNl5W1
	 rdbF/lxB0mFIQ==
Date: Wed, 13 Mar 2024 05:05:47 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 07/14] ALSA: scarlett2: Add additional input configuration
 parameters
Message-ID: <167f04a37d0fb23f3077705df835adbc4f2b6a8e.1710264833.git.g@b4.vu>
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

The 4th Gen Scarlett interfaces added software-controllable input gain
along with channel select, channel link, auto-gain, and "safe" mode.
Vocaster has software-controllable input gain and auto-gain but not
channel select, channel link, or safe mode.

Add a device info field safe_input_count to indicate how many channels
have a safe mode control, and use the presence of the input select and
input link switch configuration parameters to determine if those
controls should be created.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 140 +++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 58 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f2bbf90680f8..4289661b453f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -916,6 +916,9 @@ struct scarlett2_device_info {
 	/* the number of inputs with software-controllable gain */
 	u8 gain_input_count;
 
+	/* the number of inputs with safe mode */
+	u8 safe_input_count;
+
 	/* the number of direct monitor options
 	 * (0 = none, 1 = mono only, 2 = mono/stereo)
 	 */
@@ -1550,6 +1553,7 @@ static const struct scarlett2_device_info s2i2_gen4_info = {
 	.phantom_count = 1,
 	.inputs_per_phantom = 2,
 	.gain_input_count = 2,
+	.safe_input_count = 2,
 	.direct_monitor = 2,
 	.dsp_count = 2,
 
@@ -1603,6 +1607,7 @@ static const struct scarlett2_device_info s4i4_gen4_info = {
 	.phantom_count = 2,
 	.inputs_per_phantom = 1,
 	.gain_input_count = 2,
+	.safe_input_count = 2,
 	.dsp_count = 2,
 
 	.port_count = {
@@ -2937,13 +2942,18 @@ static void scarlett2_autogain_update_access(struct usb_mixer_interface *mixer)
 	int val = !scarlett2_autogain_is_running(private);
 	int i;
 
-	scarlett2_set_ctl_access(private->input_select_ctl, val);
-	for (i = 0; i < info->gain_input_count / 2; i++)
-		scarlett2_set_ctl_access(private->input_link_ctls[i], val);
-	for (i = 0; i < info->gain_input_count; i++) {
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_SELECT_SWITCH))
+		scarlett2_set_ctl_access(private->input_select_ctl, val);
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH))
+		for (i = 0; i < info->gain_input_count / 2; i++)
+			scarlett2_set_ctl_access(private->input_link_ctls[i],
+						 val);
+	for (i = 0; i < info->gain_input_count; i++)
 		scarlett2_set_ctl_access(private->input_gain_ctls[i], val);
+	for (i = 0; i < info->safe_input_count; i++)
 		scarlett2_set_ctl_access(private->safe_ctls[i], val);
-	}
 	for (i = 0; i < info->level_input_count; i++)
 		scarlett2_set_ctl_access(private->level_ctls[i], val);
 	for (i = 0; i < info->air_input_count; i++)
@@ -2962,17 +2972,21 @@ static void scarlett2_autogain_notify_access(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
-		       &private->input_select_ctl->id);
-	for (i = 0; i < info->gain_input_count / 2; i++)
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_SELECT_SWITCH))
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
-			       &private->input_link_ctls[i]->id);
-	for (i = 0; i < info->gain_input_count; i++) {
+			       &private->input_select_ctl->id);
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH))
+		for (i = 0; i < info->gain_input_count / 2; i++)
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+				       &private->input_link_ctls[i]->id);
+	for (i = 0; i < info->gain_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->input_gain_ctls[i]->id);
+	for (i = 0; i < info->safe_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->safe_ctls[i]->id);
-	}
 	for (i = 0; i < info->level_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 			       &private->level_ctls[i]->id);
@@ -3183,7 +3197,9 @@ static int scarlett2_update_input_select(struct usb_mixer_interface *mixer)
 
 	private->input_select_updated = 0;
 
-	if (!link_count)
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_INPUT_SELECT_SWITCH) ||
+	    !link_count)
 		return 0;
 
 	err = scarlett2_usb_get_config(
@@ -3596,12 +3612,12 @@ static int scarlett2_update_input_safe(struct usb_mixer_interface *mixer)
 
 	private->input_safe_updated = 0;
 
-	if (!info->gain_input_count)
+	if (!info->safe_input_count)
 		return 0;
 
 	return scarlett2_usb_get_config(
 		mixer, SCARLETT2_CONFIG_SAFE_SWITCH,
-		info->gain_input_count, private->safe_switch);
+		info->safe_input_count, private->safe_switch);
 }
 
 static int scarlett2_safe_ctl_get(struct snd_kcontrol *kctl,
@@ -5507,60 +5523,67 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
-	/* Add software-controllable input gain controls */
-	if (info->gain_input_count) {
+	/* Add input select/link controls */
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_SELECT_SWITCH)) {
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_input_select_ctl, 0, 1,
 			"Input Select Capture Enum",
 			&private->input_select_ctl);
 		if (err < 0)
 			return err;
+	}
 
-		for (i = 0; i < info->gain_input_count; i++) {
-			if (i % 2) {
-				scnprintf(s, sizeof(s),
-					  "Line In %d-%d Link Capture Switch",
-					  i, i + 1);
-				err = scarlett2_add_new_ctl(
-					mixer, &scarlett2_input_link_ctl,
-					i / 2, 1, s,
-					&private->input_link_ctls[i / 2]);
-				if (err < 0)
-					return err;
-			}
-
-			scnprintf(s, sizeof(s), fmt, i + 1,
-				  "Gain", "Volume");
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_INPUT_LINK_SWITCH)) {
+		for (i = 0; i < info->gain_input_count / 2; i++) {
+			scnprintf(s, sizeof(s),
+				  "Line In %d-%d Link Capture Switch",
+				  (i * 2) + 1, (i * 2) + 2);
 			err = scarlett2_add_new_ctl(
-				mixer, &scarlett2_input_gain_ctl,
-				i, 1, s, &private->input_gain_ctls[i]);
-			if (err < 0)
-				return err;
-
-			scnprintf(s, sizeof(s), fmt, i + 1,
-				  "Autogain", "Switch");
-			err = scarlett2_add_new_ctl(
-				mixer, &scarlett2_autogain_switch_ctl,
-				i, 1, s, &private->autogain_ctls[i]);
-			if (err < 0)
-				return err;
-
-			scnprintf(s, sizeof(s), fmt, i + 1,
-				  "Autogain Status", "Enum");
-			err = scarlett2_add_new_ctl(
-				mixer, &scarlett2_autogain_status_ctl,
-				i, 1, s, &private->autogain_status_ctls[i]);
-
-			scnprintf(s, sizeof(s), fmt, i + 1,
-				  "Safe", "Switch");
-			err = scarlett2_add_new_ctl(
-				mixer, &scarlett2_safe_ctl,
-				i, 1, s, &private->safe_ctls[i]);
+				mixer, &scarlett2_input_link_ctl,
+				i, 1, s, &private->input_link_ctls[i]);
 			if (err < 0)
 				return err;
 		}
 	}
 
+	/* Add software-controllable input gain controls */
+	for (i = 0; i < info->gain_input_count; i++) {
+		scnprintf(s, sizeof(s), fmt, i + 1,
+			  "Gain", "Volume");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_input_gain_ctl,
+			i, 1, s, &private->input_gain_ctls[i]);
+		if (err < 0)
+			return err;
+
+		scnprintf(s, sizeof(s), fmt, i + 1,
+			  "Autogain", "Switch");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_autogain_switch_ctl,
+			i, 1, s, &private->autogain_ctls[i]);
+		if (err < 0)
+			return err;
+
+		scnprintf(s, sizeof(s), fmt, i + 1,
+			  "Autogain Status", "Enum");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_autogain_status_ctl,
+			i, 1, s, &private->autogain_status_ctls[i]);
+	}
+
+	/* Add safe-mode input switch controls */
+	for (i = 0; i < info->safe_input_count; i++) {
+		scnprintf(s, sizeof(s), fmt, i + 1,
+			  "Safe", "Switch");
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_safe_ctl,
+			i, 1, s, &private->safe_ctls[i]);
+		if (err < 0)
+			return err;
+	}
+
 	/* Add PCM Input Switch control */
 	if (scarlett2_has_config_item(private,
 				      SCARLETT2_CONFIG_PCM_INPUT_SWITCH)) {
@@ -6557,7 +6580,8 @@ static void scarlett2_notify_input_select(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	if (!info->gain_input_count)
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_INPUT_SELECT_SWITCH))
 		return;
 
 	private->input_select_updated = 1;
@@ -6620,12 +6644,12 @@ static void scarlett2_notify_input_safe(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	if (!info->gain_input_count)
+	if (!info->safe_input_count)
 		return;
 
 	private->input_safe_updated = 1;
 
-	for (i = 0; i < info->gain_input_count; i++)
+	for (i = 0; i < info->safe_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->safe_ctls[i]->id);
 }
-- 
2.43.0

