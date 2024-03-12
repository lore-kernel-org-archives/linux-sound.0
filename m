Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B313DBBD
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268560; cv=none; b=iIPMeQJHHTs96O3SkJWwQvfFG99IF3ESEpc6TusbBSgyw1qpPhoNrc9T7FMyXOJ67PJL9G0RSohRiLCHAMtcxLB7p1MTMczP3+IpTCcq77XIKsmcjuO252IvPFtfCcyLhG7JMVcAExTrzxDr3ED8WagbWjFAB3bLtm+P5mvdtHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268560; c=relaxed/simple;
	bh=NpYcMdxeWEGeB9RImnZIoPiZTVL4XjVQF4zI/Q1bQOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpnof1Kb4MXyXPtCbDAlAc7MFUTZIXW5RWtVgzi9yBXZtfheWVe3RfKvrPNyxZ2nf/mxneVHlhChFSAk/nbTSmoHqKnsL9T9UFZbVmgBbaO9zBbRgp85KIu24iIeMRuO0WdNganSPCZMcsH2ivUe1KCJJeZVOgUjUOci0H8XoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=haK4j6Fz; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="haK4j6Fz"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 16AB3604B628; Wed, 13 Mar 2024 05:05:57 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 16AB3604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268557; bh=rzhkE2N3RVEVOHihvgvzg1imkqoct9EeUgbCkz2z6U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haK4j6FzukN92kVkXgW19R7aSPh3gXJ0UfS+I86tgpgboSFcoG3/mYqfj9ORrsxXh
	 21vuhuEMX//jYaxd6qGJ7eYmtDtp2B4H6eILcT/FaePbDPxZgx1fwZOPuy/CepiHOq
	 /YnPqOa5rwdomB2U0nF2/xV4OeCJIpCYMADv5dbf+7ZyjN9S77AwCsGwYUGt1t15EQ
	 I+VtrjfMOAENE78Flfjwkc58FindFgt0E/0bvOuuMFiddnqFKtaQVLbVPkAUDwUwAN
	 93wuiDG3NDivfFO4sv/XUdo/qK6kXHxGrF+CgM9W4BpXcw5z293ve3iYjmKNYUqAQy
	 6vQKiS8lUzrng==
Date: Wed, 13 Mar 2024 05:05:57 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 08/14] ALSA: scarlett2: Define the maximum preamp input gain
 per-config-set
Message-ID: <ade8e18ce38927ea0224946ec7cfea23ad3793d8.1710264833.git.g@b4.vu>
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

Remove the #define SCARLETT2_MAX_GAIN_DB and replace with a
per-config-set TLV as the Vocaster has a maximum gain of 70dB vs the
4th Gen 69dB.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 4289661b453f..a891e92048b2 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -174,11 +174,10 @@
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
 
-/* maximum preamp input gain and value
- * values are from 0 to 70, preamp gain is from 0 to 69 dB
+/* maximum preamp input gain value
+ * (the corresponding value in dB is per-device)
  */
 #define SCARLETT2_MAX_GAIN_VALUE 70
-#define SCARLETT2_MAX_GAIN_DB 69
 
 /* mixer range from -80dB to +6dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
@@ -460,9 +459,15 @@ struct scarlett2_config {
 struct scarlett2_config_set {
 	const struct scarlett2_notification *notifications;
 	u16 param_buf_addr;
+	const unsigned int *input_gain_tlv;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
+/* Input gain TLV dB ranges */
+static const DECLARE_TLV_DB_MINMAX(
+	db_scale_gen4_gain, 0, 69 * 100
+);
+
 /* Gen 2 devices without SW/HW volume switch: 6i6, 18i8 */
 
 static const struct scarlett2_config_set scarlett2_config_set_gen2a = {
@@ -658,6 +663,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
 static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	.notifications = scarlett4_2i2_notifications,
 	.param_buf_addr = 0xfc,
+	.input_gain_tlv = db_scale_gen4_gain,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x49, .size = 8, .activate = 4 },
@@ -703,6 +709,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 	.notifications = scarlett4_4i4_notifications,
 	.param_buf_addr = 0x130,
+	.input_gain_tlv = db_scale_gen4_gain,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x5c, .size = 8, .activate = 4 },
@@ -3587,10 +3594,6 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 	return err;
 }
 
-static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, 0, SCARLETT2_MAX_GAIN_DB * 100
-);
-
 static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
@@ -3600,7 +3603,6 @@ static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
 	.get  = scarlett2_input_gain_ctl_get,
 	.put  = scarlett2_input_gain_ctl_put,
 	.private_value = 0, /* max value */
-	.tlv = { .p = db_scale_scarlett2_gain }
 };
 
 /*** Safe Controls ***/
@@ -5557,6 +5559,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			i, 1, s, &private->input_gain_ctls[i]);
 		if (err < 0)
 			return err;
+		private->input_gain_ctls[i]->tlv.p =
+			private->config_set->input_gain_tlv;
 
 		scnprintf(s, sizeof(s), fmt, i + 1,
 			  "Autogain", "Switch");
-- 
2.43.0

