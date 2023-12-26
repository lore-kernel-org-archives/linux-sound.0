Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8FB51009
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Y+yqufER"
Received: by m.b4.vu (Postfix, from userid 1000)
	id BA62B604B093; Wed, 27 Dec 2023 04:38:58 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BA62B604B093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614138; bh=baibqTw0pZ8/OAKDWbRg2H2HR2gGC/LPr6nJDl46+/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+yqufER4qoAwNIaBgPqGVrGm7mRbN7BM/m4GfwFQZOQGQsUnkIfp1H40ctgYzsWU
	 3l4htEMgYnE6HYVR9iU7Lg9C5uaW8cXRjO0MoAMx8p58HU+o8MbnfwuWCQ5G40qkYp
	 FIU0CiEKkAsRViKuG+rPwNj53n4BF7hVv6b7hdIvNCqW49jzylWAAWNwmlKPWAFlkO
	 l8EPrl5ZxvHtrHBQJNnYQWtCL587U5AQXSToXHgy9Qg1/vIwsktHtKr7KQAWTyNIaK
	 IowIGUJyUcRiHOmzv5BK64t3FJ2uF22LgNBjopZFu5ECl/hRHu8KbWnADa2Chv1R/1
	 ZEutLZKpAbzwg==
Date: Wed, 27 Dec 2023 04:38:58 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 19/20] ALSA: scarlett2: Add support for Solo, 2i2, and 4i4
 Gen 4
Message-ID: <b33526d3b7a56bb2c86aa4eb2137a415bd23f1ce.1703612638.git.g@b4.vu>
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

Add new Focusrite Scarlett Gen 4 USB IDs, notification arrays, config
sets, and device info data.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 include/uapi/sound/scarlett2.h |   4 +-
 sound/usb/mixer_quirks.c       |   3 +
 sound/usb/mixer_scarlett2.c    | 361 +++++++++++++++++++++++++++++++--
 3 files changed, 351 insertions(+), 17 deletions(-)

diff --git a/include/uapi/sound/scarlett2.h b/include/uapi/sound/scarlett2.h
index d0ff38ffa154..91467ab0ed70 100644
--- a/include/uapi/sound/scarlett2.h
+++ b/include/uapi/sound/scarlett2.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  *   Focusrite Scarlett 2 Protocol Driver for ALSA
- *   (including Scarlett 2nd Gen, 3rd Gen, Clarett USB, and Clarett+
- *   series products)
+ *   (including Scarlett 2nd Gen, 3rd Gen, 4th Gen, Clarett USB, and
+ *   Clarett+ series products)
  *
  *   Copyright (c) 2023 by Geoffrey D. Bennett <g at b4.vu>
  */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 898bc3baca7b..6ba431d60890 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3420,6 +3420,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8213): /* Focusrite Scarlett 8i6 3rd Gen */
 	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
 	case USB_ID(0x1235, 0x8215): /* Focusrite Scarlett 18i20 3rd Gen */
+	case USB_ID(0x1235, 0x8218): /* Focusrite Scarlett Solo 4th Gen */
+	case USB_ID(0x1235, 0x8219): /* Focusrite Scarlett 2i2 4th Gen */
+	case USB_ID(0x1235, 0x821a): /* Focusrite Scarlett 4i4 4th Gen */
 	case USB_ID(0x1235, 0x8206): /* Focusrite Clarett 2Pre USB */
 	case USB_ID(0x1235, 0x8207): /* Focusrite Clarett 4Pre USB */
 	case USB_ID(0x1235, 0x8208): /* Focusrite Clarett 8Pre USB */
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index fea22ae9b0ba..89848204ad42 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  *   Focusrite Scarlett 2 Protocol Driver for ALSA
- *   (including Scarlett 2nd Gen, 3rd Gen, Clarett USB, and Clarett+
- *   series products)
+ *   (including Scarlett 2nd Gen, 3rd Gen, 4th Gen, Clarett USB, and
+ *   Clarett+ series products)
  *
  *   Supported models:
  *   - 6i6/18i8/18i20 Gen 2
  *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
+ *   - Solo/2i2/4i4 Gen 4
  *   - Clarett 2Pre/4Pre/8Pre USB
  *   - Clarett+ 2Pre/4Pre/8Pre
  *
@@ -68,6 +69,12 @@
  *
  * Support for Clarett 2Pre and 4Pre USB added in Oct 2023.
  *
+ * Support for firmware updates added in Dec 2023.
+ *
+ * Support for Scarlett Solo/2i2/4i4 Gen 4 added in Dec 2023 (thanks
+ * to many LinuxMusicians people and to Focusrite for hardware
+ * donations).
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -78,6 +85,8 @@
  *    controls
  *  - disable/enable MSD mode
  *  - disable/enable standalone mode
+ *  - input gain, autogain, safe mode
+ *  - direct monitor mixes
  *
  * <ditaa>
  *    /--------------\    18chn            20chn     /--------------\
@@ -130,7 +139,7 @@
  *  \--------------/
  * </ditaa>
  *
- * Gen 3 devices have a Mass Storage Device (MSD) mode where a small
+ * Gen 3/4 devices have a Mass Storage Device (MSD) mode where a small
  * disk with registration and driver download information is presented
  * to the host. To access the full functionality of the device without
  * proprietary software, MSD mode can be disabled by:
@@ -302,9 +311,19 @@ struct scarlett2_notification {
 static void scarlett2_notify_sync(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_volume(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_level(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_pad(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_air(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_phantom(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_select(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_gain(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_autogain(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_input_safe(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_power_status(struct usb_mixer_interface *mixer);
 
 /* Arrays of notification callback functions */
 
@@ -325,6 +344,48 @@ static const struct scarlett2_notification scarlett3a_notifications[] = {
 	{ 0, NULL }
 };
 
+static const struct scarlett2_notification scarlett4_solo_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000008, scarlett2_notify_sync },
+	{ 0x00400000, scarlett2_notify_input_air },
+	{ 0x00800000, scarlett2_notify_direct_monitor },
+	{ 0x01000000, scarlett2_notify_input_level },
+	{ 0x02000000, scarlett2_notify_input_phantom },
+	{ 0, NULL }
+};
+
+static const struct scarlett2_notification scarlett4_2i2_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000008, scarlett2_notify_sync },
+	{ 0x00200000, scarlett2_notify_input_safe },
+	{ 0x00400000, scarlett2_notify_autogain },
+	{ 0x00800000, scarlett2_notify_input_air },
+	{ 0x01000000, scarlett2_notify_direct_monitor },
+	{ 0x02000000, scarlett2_notify_input_select },
+	{ 0x04000000, scarlett2_notify_input_level },
+	{ 0x08000000, scarlett2_notify_input_phantom },
+	{ 0x10000000, NULL }, /* power status, ignored */
+	{ 0x40000000, scarlett2_notify_input_gain },
+	{ 0x80000000, NULL }, /* power status, ignored */
+	{ 0, NULL }
+};
+
+static const struct scarlett2_notification scarlett4_4i4_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00000008, scarlett2_notify_sync },
+	{ 0x00200000, scarlett2_notify_input_safe },
+	{ 0x00400000, scarlett2_notify_autogain },
+	{ 0x00800000, scarlett2_notify_input_air },
+	{ 0x01000000, scarlett2_notify_input_select },
+	{ 0x02000000, scarlett2_notify_input_level },
+	{ 0x04000000, scarlett2_notify_input_phantom },
+	{ 0x08000000, scarlett2_notify_power_status }, /* power external */
+	{ 0x20000000, scarlett2_notify_input_gain },
+	{ 0x40000000, scarlett2_notify_power_status }, /* power status */
+	{ 0x80000000, scarlett2_notify_volume },
+	{ 0, NULL }
+};
+
 /* Configuration parameters that can be read and written */
 enum {
 	SCARLETT2_CONFIG_DIM_MUTE,
@@ -543,6 +604,123 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3c = {
 	}
 };
 
+/* Solo Gen 4 */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
+	.notifications = scarlett4_solo_notifications,
+	.gen4_write_addr = 0xd8,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x47, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x108, .activate = 12 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x46, .activate = 9, .mute = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x3d, .activate = 10, .mute = 1 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x3e, .activate = 11 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
+			.offset = 0x232, .size = 16, .activate = 26 }
+	}
+};
+
+/* 2i2 Gen 4 */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
+	.notifications = scarlett4_2i2_notifications,
+	.gen4_write_addr = 0xfc,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x49, .size = 8, .activate = 4 }, // 0x41 ??
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x14a, .activate = 16 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
+			.offset = 0x135, .activate = 10 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
+			.offset = 0x137 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x48, .activate = 11, .mute = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_GAIN] = {
+			.offset = 0x4b, .activate = 12 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x3c, .activate = 13, .mute = 1 },
+
+		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
+			.offset = 0x147, .activate = 14 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x3e, .activate = 15 },
+
+		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
+			.offset = 0x14b, .activate = 17 },
+
+		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
+			.offset = 0x14e, .activate = 18 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
+			.offset = 0x2a0, .size = 16, .activate = 36 }
+	}
+};
+
+/* 4i4 Gen 4 */
+static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
+	.notifications = scarlett4_4i4_notifications,
+	.gen4_write_addr = 0x130,
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
+			.offset = 0x13e, .activate = 10 },
+
+		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
+			.offset = 0x140 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x5a, .activate = 11, .mute = 1 },
+
+		[SCARLETT2_CONFIG_INPUT_GAIN] = {
+			.offset = 0x5e, .activate = 12 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x4e, .activate = 13, .mute = 1 },
+
+		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
+			.offset = 0x150, .activate = 14 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x50, .activate = 15 },
+
+		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
+			.offset = 0x153, .activate = 16 },
+
+		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
+			.offset = 0x156, .activate = 17 },
+
+		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
+			.offset = 0x32, .size = 16 },
+
+		[SCARLETT2_CONFIG_HEADPHONE_VOLUME] = {
+			.offset = 0x3a, .size = 16 },
+
+		[SCARLETT2_CONFIG_POWER_EXT] = {
+			.offset = 0x168 },
+
+		[SCARLETT2_CONFIG_POWER_STATUS] = {
+			.offset = 0x66 }
+	}
+};
+
 /* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
 static const struct scarlett2_config_set scarlett2_config_set_clarett = {
 	.notifications = scarlett2_notifications,
@@ -1274,6 +1452,160 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	}
 };
 
+static const struct scarlett2_device_info solo_gen4_info = {
+	.config_set = &scarlett2_config_set_gen4_solo,
+	.min_firmware_version = 2115,
+
+	.level_input_count = 1,
+	.air_input_count = 1,
+	.air_input_first = 1,
+	.air_option = 1,
+	.phantom_count = 1,
+	.phantom_first = 1,
+	.inputs_per_phantom = 1,
+	.direct_monitor = 1,
+	.dsp_count = 2,
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = { 1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = { 2,  2 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 8,  6 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 2,  4 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	} },
+
+	.meter_map = {
+		{  6,  2 },
+		{  4,  2 },
+		{  8,  4 },
+		{  2,  2 },
+		{  0,  2 },
+		{  0,  0 }
+	}
+};
+
+static const struct scarlett2_device_info s2i2_gen4_info = {
+	.config_set = &scarlett2_config_set_gen4_2i2,
+	.min_firmware_version = 2115,
+
+	.level_input_count = 2,
+	.air_input_count = 2,
+	.air_option = 1,
+	.phantom_count = 1,
+	.inputs_per_phantom = 2,
+	.gain_input_count = 2,
+	.direct_monitor = 2,
+	.dsp_count = 2,
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = { 1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = { 2,  2 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 6,  6 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 2,  4 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,       4,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       2,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ 0,                             0,  0 },
+	} },
+
+	.meter_map = {
+		{  6,  2 },
+		{  4,  2 },
+		{  8,  4 },
+		{  2,  2 },
+		{  0,  2 },
+		{  0,  0 }
+	}
+};
+
+static const struct scarlett2_device_info s4i4_gen4_info = {
+	.config_set = &scarlett2_config_set_gen4_4i4,
+	.min_firmware_version = 2089,
+
+	.level_input_count = 2,
+	.air_input_count = 2,
+	.air_option = 1,
+	.phantom_count = 2,
+	.inputs_per_phantom = 1,
+	.gain_input_count = 2,
+	.dsp_count = 2,
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = { 1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = { 4,  6 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 8, 12 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 6,  6 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_MIX,      10,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  6 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  6 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,      10,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  6 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  6 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_MIX,      10,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  6 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  6 },
+		{ 0,                             0,  0 },
+	} },
+
+	.meter_map = {
+		{ 16,  8 },
+		{  6, 10 },
+		{  0,  6 },
+		{  0,  0 }
+	}
+};
+
 static const struct scarlett2_device_info clarett_2pre_info = {
 	.config_set = &scarlett2_config_set_clarett,
 	.level_input_count = 2,
@@ -1451,6 +1783,11 @@ static const struct scarlett2_device_entry scarlett2_devices[] = {
 	{ USB_ID(0x1235, 0x8214), &s18i8_gen3_info, "Scarlett Gen 3" },
 	{ USB_ID(0x1235, 0x8215), &s18i20_gen3_info, "Scarlett Gen 3" },
 
+	/* Supported Gen 4 devices */
+	{ USB_ID(0x1235, 0x8218), &solo_gen4_info, "Scarlett Gen 4" },
+	{ USB_ID(0x1235, 0x8219), &s2i2_gen4_info, "Scarlett Gen 4" },
+	{ USB_ID(0x1235, 0x821a), &s4i4_gen4_info, "Scarlett Gen 4" },
+
 	/* Supported Clarett USB/Clarett+ devices */
 	{ USB_ID(0x1235, 0x8206), &clarett_2pre_info, "Clarett USB" },
 	{ USB_ID(0x1235, 0x8207), &clarett_4pre_info, "Clarett USB" },
@@ -6353,8 +6690,7 @@ static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 }
 
 /* Notify on volume change (Gen 4) */
-static __always_unused void scarlett2_notify_volume(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_volume(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
@@ -6460,8 +6796,7 @@ static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
 }
 
 /* Notify on input select change */
-static __always_unused void scarlett2_notify_input_select(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_input_select(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -6483,8 +6818,7 @@ static __always_unused void scarlett2_notify_input_select(
 }
 
 /* Notify on input gain change */
-static __always_unused void scarlett2_notify_input_gain(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_input_gain(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -6502,8 +6836,7 @@ static __always_unused void scarlett2_notify_input_gain(
 }
 
 /* Notify on autogain change */
-static __always_unused void scarlett2_notify_autogain(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_autogain(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -6526,8 +6859,7 @@ static __always_unused void scarlett2_notify_autogain(
 }
 
 /* Notify on input safe switch change */
-static __always_unused void scarlett2_notify_input_safe(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_input_safe(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -6603,8 +6935,7 @@ static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer)
 }
 
 /* Notify on power change */
-static __always_unused void scarlett2_notify_power_status(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_power_status(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-- 
2.43.0

