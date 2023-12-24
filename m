Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F7D2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="bU3G+1AH"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 11C8D604B9CB; Mon, 25 Dec 2023 05:50:52 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 11C8D604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445652; bh=7LpCnNlhXobkAVT1NO8tzjGm+lJkQJ/0tDKAfOR7RbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU3G+1AH1cHrlEIFAjAC2faBFAYkQtnSEtpYSIOgAdVHk2wLyUn7XUCHFQsRdZhgL
	 6VHJFIJ58TkzxkTVMZAfxLrHl8cjG1IAMztg1jvzlPRBareDwHv4T8y7yziQNwIRt7
	 zu3CoItj2vLgW7QMonUQUAWc4IAy7hk2Zf7nN3oKDOfw3sixTCRszlvMhXJ5aW9Yhf
	 r09M37CEKWNoNC73eEjnvPC2t8gf2qtvZj8STwjIXhcSKK1trLto4oZILTF8YrQrAr
	 nneyenyRDT9/F7GqkaQPy3BSej7RrRdWkgXtjYeUiW9bcaS1YkPfIS4in7XYpTxYOC
	 WEY15akZ6AUPA==
Date: Mon, 25 Dec 2023 05:50:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 02/23] ALSA: scarlett2: Infer has_msd_mode from config items
Message-ID: <ecbf3740e6b30a245333528ae4c504f37a9bc6bf.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

Rather than storing has_msd_mode in the per-device structure, infer
this from the presence of the SCARLETT2_CONFIG_MSD_SWITCH entry in the
device's configuration set.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6ab8b4c52357..85a93dd0f354 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -355,12 +355,6 @@ struct scarlett2_meter_entry {
 };
 
 struct scarlett2_device_info {
-	/* Gen 3 devices have an internal MSD mode switch that needs
-	 * to be disabled in order to access the full functionality of
-	 * the device.
-	 */
-	u8 has_msd_mode;
-
 	/* which set of configuration parameters the device uses */
 	u8 config_set;
 
@@ -652,7 +646,6 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 };
 
 static const struct scarlett2_device_info solo_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 1,
 	.level_input_first = 1,
@@ -663,7 +656,6 @@ static const struct scarlett2_device_info solo_gen3_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 2,
 	.air_input_count = 2,
@@ -673,7 +665,6 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -723,7 +714,6 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 };
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -782,7 +772,6 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
@@ -863,7 +852,6 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
@@ -1518,6 +1506,19 @@ static int scarlett2_usb_get(
 			     &req, sizeof(req), buf, size);
 }
 
+/* Return true if the given configuration item is present in the
+ * configuration set used by this device.
+ */
+static int scarlett2_has_config_item(
+	struct scarlett2_data *private, int config_item_num)
+{
+	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_config *config_item =
+		&scarlett2_config_items[info->config_set][config_item_num];
+
+	return !!config_item->offset;
+}
+
 /* Send a USB message to get configuration parameters; result placed in *buf */
 static int scarlett2_usb_get_config(
 	struct usb_mixer_interface *mixer,
@@ -4170,9 +4171,8 @@ static const struct snd_kcontrol_new scarlett2_msd_ctl = {
 static int scarlett2_add_msd_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 
-	if (!info->has_msd_mode)
+	if (!scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH))
 		return 0;
 
 	/* If MSD mode is off, hide the switch by default */
@@ -4488,7 +4488,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
-	if (info->has_msd_mode) {
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
 		err = scarlett2_usb_get_config(
 			mixer, SCARLETT2_CONFIG_MSD_SWITCH,
 			1, &private->msd_switch);
-- 
2.43.0

