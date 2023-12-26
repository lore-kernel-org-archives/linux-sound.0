Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357750250
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="tX6jv8oZ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 4A2FB604B1CB; Wed, 27 Dec 2023 04:38:13 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 4A2FB604B1CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614093; bh=HcWcSia0FzSOhF8ynmrBT8sOObpt9ImVvBE3r2KvBW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tX6jv8oZ8yS2aNHKsH3M+R0WvO/hH9/aLiMgN9M8x4V/ZWiVXZ6YnrLcLATeErZRD
	 1AcwBhkPJtvz6mwBW4YqkcPkls5BQLPXKZ5h8pvfmMvWboIXC3m7CEjbRQc0IvtsYT
	 CqQsM/UvxF6GqXhtxicYxj6EJroz3KPB2ttATNwyx6XELDZU4VIaTanOgJXhnfjWyq
	 GBpbbQTCNJE4UYl7EH8Zk0AUd3WX7rgsh5DlqZniYEpEV4rTK0zRc3ITimSEXgjVGx
	 gOcvUoBcUQd7MDysDANUJK0wPrQAL0c+tuCcBXLO7tP3wB5Yh2wgv/XEFK9ha7S1xW
	 ypoayU4ch4acw==
Date: Wed, 27 Dec 2023 04:38:13 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 12/20] ALSA: scarlett2: Store mix_ctls for Gen 4 Direct
 Monitor
Message-ID: <3ba27c60230511b80b0fa75727551ea70f17d829.1703612638.git.g@b4.vu>
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

The Scarlett 4th Gen small interfaces have a software-controllable
mixer like the large 2nd and 3rd Gen interfaces do. Pressing the
"Direct" button on the interface updates the mixer controls, which
this driver hasn't needed to deal with previously.

This commit stores the ALSA mixer controls, and adds a mix_updated
flag so that the controls can be updated when a notification is
received.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 50 +++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f5f57c86cec8..391ecacbc768 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -760,6 +760,7 @@ struct scarlett2_data {
 	u8 monitor_other_updated;
 	u8 direct_monitor_updated;
 	u8 mux_updated;
+	u8 mix_updated;
 	u8 speaker_switching_switched;
 	u8 power_status_updated;
 	u8 sync;
@@ -804,6 +805,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *autogain_status_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *safe_ctls[SCARLETT2_INPUT_GAIN_MAX];
 	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
+	struct snd_kcontrol *mix_ctls[SCARLETT2_MIX_MAX];
 	struct snd_kcontrol *direct_monitor_ctl;
 	struct snd_kcontrol *speaker_switching_ctl;
 	struct snd_kcontrol *talkback_ctl;
@@ -4960,6 +4962,22 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 /*** Mixer Volume Controls ***/
 
+static int scarlett2_update_mix(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int i, err;
+
+	private->mix_updated = 0;
+
+	for (i = 0; i < private->num_mix_out; i++) {
+		err = scarlett2_usb_get_mix(mixer, i);
+		if (err < 0)
+			return err;
+	}
+
+	return 1;
+}
+
 static int scarlett2_mixer_ctl_info(struct snd_kcontrol *kctl,
 				    struct snd_ctl_elem_info *uinfo)
 {
@@ -4977,10 +4995,27 @@ static int scarlett2_mixer_ctl_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int err = 0;
 
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	if (private->mix_updated) {
+		err = scarlett2_update_mix(mixer);
+		if (err < 0)
+			goto unlock;
+	}
 	ucontrol->value.integer.value[0] = private->mix[elem->control];
-	return 0;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
 }
 
 static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
@@ -5048,7 +5083,8 @@ static int scarlett2_add_mixer_ctls(struct usb_mixer_interface *mixer)
 				 "Mix %c Input %02d Playback Volume",
 				 'A' + i, j + 1);
 			err = scarlett2_add_new_ctl(mixer, &scarlett2_mixer_ctl,
-						    index, 1, s, NULL);
+						    index, 1, s,
+						    &private->mix_ctls[index]);
 			if (err < 0)
 				return err;
 		}
@@ -5993,11 +6029,9 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < private->num_mix_out; i++) {
-		err = scarlett2_usb_get_mix(mixer, i);
-		if (err < 0)
-			return err;
-	}
+	err = scarlett2_update_mix(mixer);
+	if (err < 0)
+		return err;
 
 	return scarlett2_usb_get_mux(mixer);
 }
-- 
2.43.0

