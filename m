Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13337D05
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="SwQYEH/r"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 9E3C6604B9F7; Wed, 20 Dec 2023 04:08:58 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 9E3C6604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007538; bh=i2UBZbVX9JemXjLTX5TBcZIY/bD71bJlRplkQc6myNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwQYEH/r64tuYyekgUqn6HmGTxbZ1Ur+jtB5tLCTWIGBbAVFXBw3dFf1QcQvahJ6J
	 iLBoe0FgybnuffxK4MTqG+/uWXDpfWj8z0MVwv/6CXYPPQH3mtu2wig5asCwEUrGaJ
	 8oOoD9kITWi4btYA5hRubJIF6l/6UmEdlk+IiZCkrx2zsjmemqcy0DU6+RagIBPns/
	 KoZtxPfHdWtwsAEB/6xuJ/xLMOs6F9pN0B3JZuRD0GymlSYv9Phz1CQAwQvg5a6GXa
	 oQbT8TVnkkOe+H3NXVxbBqpmErbcrwEGENX/lBS3VbNENPpW2eYrkVBArTsroelGI0
	 PFuP10NQQ8YQg==
Date: Wed, 20 Dec 2023 04:08:58 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 08/11] ALSA: scarlett2: Retrieve useful flash segment numbers
Message-ID: <70f0108a9cf99b69f7aa920c4bcdb0cf4bf3da98.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>

Call SCARLETT2_USB_INFO_FLASH and SCARLETT2_USB_INFO_SEGMENT to find
the App_Settings and App_Upgrade flash segment numbers, and store them
in the scarlett2_data struct. These will be used later to implement
reset to factory defaults and firmware upgrade functions.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 129b9c97871a..34878f9f9a55 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -190,6 +190,11 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 	16345
 };
 
+/* Flash segments that we may manipulate */
+#define SCARLETT2_SEGMENT_ID_SETTINGS 0
+#define SCARLETT2_SEGMENT_ID_FIRMWARE 1
+#define SCARLETT2_SEGMENT_ID_COUNT 2
+
 /* Maximum number of analogue outputs */
 #define SCARLETT2_ANALOGUE_MAX 10
 
@@ -429,6 +434,8 @@ struct scarlett2_data {
 	int num_mux_srcs;
 	int num_mux_dsts;
 	u32 firmware_version;
+	u8 flash_segment_nums[SCARLETT2_SEGMENT_ID_COUNT];
+	u8 flash_segment_blocks[SCARLETT2_SEGMENT_ID_COUNT];
 	u16 scarlett2_seq;
 	u8 sync_updated;
 	u8 vol_updated;
@@ -1160,6 +1167,13 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_VOLUME_STATUS_OFFSET 0x31
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
+#define SCARLETT2_FLASH_BLOCK_SIZE 4096
+#define SCARLETT2_SEGMENT_NUM_MIN 1
+#define SCARLETT2_SEGMENT_NUM_MAX 4
+
+#define SCARLETT2_SEGMENT_SETTINGS_NAME "App_Settings"
+#define SCARLETT2_SEGMENT_FIRMWARE_NAME "App_Upgrade"
+
 /* volume status is read together (matches scarlett2_config_items[1]) */
 struct scarlett2_usb_volume_status {
 	/* dim/mute buttons */
@@ -4202,6 +4216,90 @@ static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/* Get the flash segment numbers for the App_Settings and App_Upgrade
+ * segments and put them in the private data
+ */
+static int scarlett2_get_flash_segment_nums(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int err, count, i;
+
+	struct {
+		__le32 size;
+		__le32 count;
+		u8 unknown[8];
+	} __packed flash_info;
+
+	struct {
+		__le32 size;
+		__le32 flags;
+		char name[16];
+	} __packed segment_info;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_INFO_FLASH,
+			    NULL, 0,
+			    &flash_info, sizeof(flash_info));
+	if (err < 0)
+		return err;
+
+	count = le32_to_cpu(flash_info.count);
+
+	/* sanity check count */
+	if (count < SCARLETT2_SEGMENT_NUM_MIN ||
+	    count > SCARLETT2_SEGMENT_NUM_MAX + 1) {
+		usb_audio_err(mixer->chip,
+			      "invalid flash segment count: %d\n", count);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < count; i++) {
+		__le32 segment_num_req = cpu_to_le32(i);
+		int flash_segment_id;
+
+		err = scarlett2_usb(mixer, SCARLETT2_USB_INFO_SEGMENT,
+				    &segment_num_req, sizeof(segment_num_req),
+				    &segment_info, sizeof(segment_info));
+		if (err < 0) {
+			usb_audio_err(mixer->chip,
+				"failed to get flash segment info %d: %d\n",
+				i, err);
+			return err;
+		}
+
+		if (!strncmp(segment_info.name,
+			     SCARLETT2_SEGMENT_SETTINGS_NAME, 16))
+			flash_segment_id = SCARLETT2_SEGMENT_ID_SETTINGS;
+		else if (!strncmp(segment_info.name,
+				  SCARLETT2_SEGMENT_FIRMWARE_NAME, 16))
+			flash_segment_id = SCARLETT2_SEGMENT_ID_FIRMWARE;
+		else
+			continue;
+
+		private->flash_segment_nums[flash_segment_id] = i;
+		private->flash_segment_blocks[flash_segment_id] =
+			le32_to_cpu(segment_info.size) /
+				SCARLETT2_FLASH_BLOCK_SIZE;
+	}
+
+	/* segment 0 is App_Gold and we never want to touch that, so
+	 * use 0 as the "not-found" value
+	 */
+	if (!private->flash_segment_nums[SCARLETT2_SEGMENT_ID_SETTINGS]) {
+		usb_audio_err(mixer->chip,
+			      "failed to find flash segment %s\n",
+			      SCARLETT2_SEGMENT_SETTINGS_NAME);
+		return -EINVAL;
+	}
+	if (!private->flash_segment_nums[SCARLETT2_SEGMENT_ID_FIRMWARE]) {
+		usb_audio_err(mixer->chip,
+			      "failed to find flash segment %s\n",
+			      SCARLETT2_SEGMENT_FIRMWARE_NAME);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* Read configuration from the interface on start */
 static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
@@ -4517,6 +4615,11 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	/* Get the upgrade & settings flash segment numbers */
+	err = scarlett2_get_flash_segment_nums(mixer);
+	if (err < 0)
+		return err;
+
 	/* Add firmware version control */
 	err = scarlett2_add_firmware_version_ctl(mixer);
 	if (err < 0)
-- 
2.43.0

