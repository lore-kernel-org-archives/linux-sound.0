Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAA7140E5B
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268568; cv=none; b=Yfv2I2bgSg1tNF1vdqXCx2LLXeWz9hE6dXvyVdbbp+UrajSW2DeOTPzrZ3n+U4l89tZy3ez/2mszqE0ply32PNcLAYNFaPM3YyppzMEmgnqmddBd/uR9os4WcQ82WTSfQo1yG2EQlPZpgLfspttNKKhKtAc4lDbVmz58u9Yyu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268568; c=relaxed/simple;
	bh=8amXzmNwginEUr5jO1EUU1HI1/vQ21QGhNcsCKOY1LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PspMS4DtdPaHvj7idgeDDYJ1ALhnED1YU2r0CWeVrcSZBx2mSfec7XCZilIzAXanu+89dDQ15OTCpGKoLGKKu1XUjzqgR0EZgb5SYxoKXBhAeDLqR1LzQBkHCQqpn+SUNSKNS22P5eq9sW4TgjnNkenikYcfSxgv055fedUt9+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=A2ObAdmY; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="A2ObAdmY"
Received: by m.b4.vu (Postfix, from userid 1000)
	id BB31A604B628; Wed, 13 Mar 2024 05:06:04 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BB31A604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268564; bh=SAIJvPQiAJ9RaAEdzmkuiaTx1WqyXWtOoZgrbFdqCQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2ObAdmY8lrzaL+KC95pnsXBC0mkfv+KNNSGfRAsDWagmbItf/ceq1wJLPQl6WQ9N
	 vMSojWqAkoKJ1sEPS6ugRQf9O6ibPZDWkD6T9VjE5Mva0bqsdQuDQHQO1uOXBSwABi
	 9inFz1EEc/emNZzaASzd3xk7+i9H2zSn3usf7kgDn6dqByFG/dINWonyv0LJ+cgK6z
	 lW5pFbbVOrU7Ii0qYFz35djILnm+KtFowD1nACx4EyIsaUGHOHYOuMfFt/RQGPtczh
	 gzakyaXu1KKAMqc9PwFOcc4TsI1CB675p3UNWgSqzAB37vHVobgXTCDRmKFxxwnXbz
	 MTNB5xuZTkzpA==
Date: Wed, 13 Mar 2024 05:06:04 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 09/14] ALSA: scarlett2: Define autogain status texts
 per-config-set
Message-ID: <b1adcd3dc48117d4ebe16812eeb7f1dbf1ede472.1710264833.git.g@b4.vu>
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

The autogain status texts are different for Vocaster vs. Scarlett 4th
Gen, so make them configurable per-config-set.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a891e92048b2..0962277947bf 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -294,7 +294,7 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
  * If autogain_switch is set, autogain_status is set to 0 (Running).
  * The other status values are from the raw_autogain_status value + 1.
  */
-static const char *const scarlett2_autogain_status_texts[] = {
+static const char *const scarlett2_autogain_status_gen4[] = {
 	"Running",
 	"Success",
 	"SuccessDRover",
@@ -303,7 +303,8 @@ static const char *const scarlett2_autogain_status_texts[] = {
 	"FailMaxGainLimit",
 	"FailClipped",
 	"Cancelled",
-	"Invalid"
+	"Invalid",
+	NULL
 };
 
 /* Power Status Values */
@@ -460,6 +461,7 @@ struct scarlett2_config_set {
 	const struct scarlett2_notification *notifications;
 	u16 param_buf_addr;
 	const unsigned int *input_gain_tlv;
+	const char *const *autogain_status_texts;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
@@ -664,6 +666,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	.notifications = scarlett4_2i2_notifications,
 	.param_buf_addr = 0xfc,
 	.input_gain_tlv = db_scale_gen4_gain,
+	.autogain_status_texts = scarlett2_autogain_status_gen4,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x49, .size = 8, .activate = 4 },
@@ -710,6 +713,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 	.notifications = scarlett4_4i4_notifications,
 	.param_buf_addr = 0x130,
 	.input_gain_tlv = db_scale_gen4_gain,
+	.autogain_status_texts = scarlett2_autogain_status_gen4,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x5c, .size = 8, .activate = 4 },
@@ -981,6 +985,7 @@ struct scarlett2_data {
 	u8 num_mix_out;
 	u8 num_line_out;
 	u8 num_monitor_mix_ctls;
+	u8 num_autogain_status_texts;
 	u32 firmware_version;
 	u8 flash_segment_nums[SCARLETT2_SEGMENT_ID_COUNT];
 	u8 flash_segment_blocks[SCARLETT2_SEGMENT_ID_COUNT];
@@ -2931,12 +2936,12 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 		if (private->autogain_switch[i])
 			private->autogain_status[i] = 0;
 		else if (raw_autogain_status[i] <
-				ARRAY_SIZE(scarlett2_autogain_status_texts) - 1)
+				private->num_autogain_status_texts - 1)
 			private->autogain_status[i] =
 				raw_autogain_status[i] + 1;
 		else
 			private->autogain_status[i] =
-				ARRAY_SIZE(scarlett2_autogain_status_texts) - 1;
+				private->num_autogain_status_texts - 1;
 
 	return 0;
 }
@@ -3171,10 +3176,13 @@ static int scarlett2_autogain_switch_ctl_put(
 static int scarlett2_autogain_status_ctl_info(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
 {
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
 	return snd_ctl_enum_info(
 		uinfo, 1,
-		ARRAY_SIZE(scarlett2_autogain_status_texts),
-		scarlett2_autogain_status_texts);
+		private->num_autogain_status_texts,
+		private->config_set->autogain_status_texts);
 }
 
 static const struct snd_kcontrol_new scarlett2_autogain_switch_ctl = {
@@ -6839,8 +6847,9 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 static void scarlett2_count_io(struct scarlett2_data *private)
 {
 	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_config_set *config_set = info->config_set;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
-	int port_type, srcs = 0, dsts = 0;
+	int port_type, srcs = 0, dsts = 0, i;
 
 	/* Count the number of mux sources and destinations */
 	for (port_type = 0;
@@ -6872,6 +6881,15 @@ static void scarlett2_count_io(struct scarlett2_data *private)
 	/* Number of monitor mix controls */
 	private->num_monitor_mix_ctls =
 		info->direct_monitor * 2 * private->num_mix_in;
+
+	/* Number of autogain status texts */
+	if (config_set->autogain_status_texts) {
+		const char * const *texts = config_set->autogain_status_texts;
+
+		for (i = 0; texts[i]; i++)
+			;
+		private->num_autogain_status_texts = i;
+	}
 }
 
 /* Look through the interface descriptors for the Focusrite Control
-- 
2.43.0

