Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A850243
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="hEXpWMmP"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 89D44604B5C9; Wed, 27 Dec 2023 04:36:38 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 89D44604B5C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613998; bh=xrL/UYbYgK8uJYOBPgoRIyT81pQgXYqY2qxjvjiSoKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEXpWMmPvA1OWaNrPGF2LtwtAZxiG6KD7LJyZnVxFUFOcd33KhEUkvZ9t2iySh5he
	 G1BmIpkx81KnPCmpX4mvfvJTpyybOt4Fk25gJA5N3yy5FQMspkn0EYPhdYYDVIvqA/
	 8pQbdzPsAcX9I9aXNUmobbBh8lZZ4SfahiuHew383h6/nm6NpatHWB5g9GZWoM9mGL
	 J1JDw4Fvf78vg7S4M7I3ykFTDU27P5plQujCHZOgoMVzDLgfrr7gMSEMlSmq8a/hgH
	 1C0jHcMoZohCwsEU7rr14xuekfRt5paMI2wM7ljT+02if9zbO01Yf2U3FzzWA2F0je
	 l2VbbzmtJfPSA==
Date: Wed, 27 Dec 2023 04:36:38 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 05/20] ALSA: scarlett2: Allow for controls with a "mute mode"
Message-ID: <f603cd16079c97fad910087e0302828a289d1c15.1703612638.git.g@b4.vu>
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

Gen 2/3 interfaces would only use 0/1 values for input level and
phantom power switch controls. Gen 4 interfaces use the second bit to
indicate that the state should be changed (or is changing), and the
input is to be muted (or is muted) while that happens.

Add a "mute" flag to config items to enable this behaviour for the
level/phantom controls.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 09cd09799588..3098d9d38e3f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -325,11 +325,18 @@ enum {
  * A size of 0 indicates that the parameter is a byte-sized Scarlett
  * Gen 4 configuration which is written through the gen4_write_addr
  * location (but still read through the given offset location).
+ *
+ * Some Gen 4 configuration parameters are written with 0x02 for a
+ * desired value of 0x01, and 0x03 for 0x00. These are indicated with
+ * mute set to 1. 0x02 and 0x03 are temporary values while the device
+ * makes the change and the channel and/or corresponding DSP channel
+ * output is muted.
  */
 struct scarlett2_config {
 	u16 offset;
 	u8 size;
 	u8 activate;
+	u8 mute;
 };
 
 struct scarlett2_config_set {
@@ -2177,6 +2184,15 @@ static int scarlett2_usb_get_meter_levels(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+/* For config items with mute=1, xor bits 0 & 1 together to get the
+ * current/next state. This won't have any effect on values which are
+ * only ever 0/1.
+ */
+static uint8_t scarlett2_decode_muteable(uint8_t v)
+{
+	return (v ^ (v >> 1)) & 1;
+}
+
 /*** Control Functions ***/
 
 /* helper function to create a new control */
@@ -2798,7 +2814,8 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 		if (err < 0)
 			goto unlock;
 	}
-	ucontrol->value.enumerated.item[0] = private->level_switch[index];
+	ucontrol->value.enumerated.item[0] = scarlett2_decode_muteable(
+		private->level_switch[index]);
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -2831,6 +2848,10 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 
 	private->level_switch[index] = val;
 
+	/* To set the Gen 4 muteable controls, bit 1 gets set instead */
+	if (private->config_set->items[SCARLETT2_CONFIG_LEVEL_SWITCH].mute)
+		val = (!val) | 0x02;
+
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
 				       index, val);
@@ -3078,8 +3099,8 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 		if (err < 0)
 			goto unlock;
 	}
-	ucontrol->value.integer.value[0] =
-		private->phantom_switch[elem->control];
+	ucontrol->value.integer.value[0] = scarlett2_decode_muteable(
+		private->phantom_switch[elem->control]);
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -3112,6 +3133,10 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 
 	private->phantom_switch[index] = val;
 
+	/* To set the Gen 4 muteable controls, bit 1 gets set */
+	if (private->config_set->items[SCARLETT2_CONFIG_PHANTOM_SWITCH].mute)
+		val = (!val) | 0x02;
+
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
 				       index + info->phantom_first, val);
-- 
2.43.0

