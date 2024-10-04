Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D169D2B
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052147; cv=none; b=m0QWIsR2mCePTbtex3N5tL2zLDLElGP3UPTMSugvzrEU25q8rjV2FaPft8fvU67kKr+6xibrbvXVpUkBXVnzuNg72piZc3D3PRwl3VX9YP6aLVoEbWqlm1Z+n0Ec/FpeVXVtjVSATVFY27eI79PhrKJ+hk3K9Rqw1CANZnx9j7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052147; c=relaxed/simple;
	bh=0laVtbVpbafhMqABkALz9StUX//CbqWBeufGAYughUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aqe+sFnmgXH3u4P46Sd+mSG6h3+N34HcBSSLHJs9Wv7Ep4mokxnMZhRVNq+GM1flGjLhnXEvQjV45Ksm3dF1nTp8kKhj/ErR4gMh/uyCM8LvylvZ9iBhK/8w+RAeRoLcHWjaEISNZVsDowCpFtjhIh8Pzr6Dbl+bH4qc0PyWJNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=FD8EPII+; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="FD8EPII+"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 471B761AD441; Fri,  4 Oct 2024 23:59:04 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 471B761AD441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1728052144; bh=zrXl6Lbowz6qw6c0UeQY6heqill2klFlnQuaTfCRImk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FD8EPII+1bO4t3P8lPcAKLbcZFEujYYE7KuwjEzY2Kz0FX/WTbv5OI9MQDhwIe9Y7
	 +80iJtic7UyRrRhwZwdn2sEAAvampLhOt3ZbR0S5Kl8ktvLvC+SgwncLIseqYDXunO
	 iSyoTCkRSLdeA59k+QRC6bnw+ru1nE0l4+Hq/ManB7NSafNrlbckiwLPLH6rQMBsme
	 +Nl7yj/1Mt8X0nfm9LsjME4wdJFfSYfsvnorwV9PWDtVPuwoESPPMGN2YkwqM3wm+C
	 JbGDkWFr/TSeV+JNcuK+Ot3KHS2uHKj0dWMmiRsUHbRmVhXF6NK1fGkiGZh3tg044b
	 SM6rTxa6sGFmA==
Date: Fri, 4 Oct 2024 23:59:04 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ALSA: scarlett2: Add support for device map retrieval
Message-ID: <e86380c6792460d8d05a8ecc37c9ebd072be25a5.1727971672.git.g@b4.vu>
References: <cover.1727971672.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1727971672.git.g@b4.vu>

Add support for retrieving the device map from Focusrite Scarlett 4th
Gen and Vocaster devices. The device map is a base64-encoded,
zlib-compressed JSON description of the device's capabilities and
configuration.

This patch adds:
- a has_devmap field to the scarlett2_device_info struct
- a /proc/asound/cardX/device-map.json.zz.b64 file when supported

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 139 +++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index b0eca4785bc6..69fa80b9d5bf 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1079,6 +1079,9 @@ struct scarlett2_device_info {
 	/* minimum firmware version required */
 	u16 min_firmware_version;
 
+	/* has a downloadable device map */
+	u8 has_devmap;
+
 	/* support for main/alt speaker switching */
 	u8 has_speaker_switching;
 
@@ -1773,6 +1776,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 static const struct scarlett2_device_info vocaster_one_info = {
 	.config_set = &scarlett2_config_set_vocaster,
 	.min_firmware_version = 1769,
+	.has_devmap = 1,
 
 	.phantom_count = 1,
 	.inputs_per_phantom = 1,
@@ -1815,6 +1819,7 @@ static const struct scarlett2_device_info vocaster_one_info = {
 static const struct scarlett2_device_info vocaster_two_info = {
 	.config_set = &scarlett2_config_set_vocaster,
 	.min_firmware_version = 1769,
+	.has_devmap = 1,
 
 	.phantom_count = 2,
 	.inputs_per_phantom = 1,
@@ -1858,6 +1863,7 @@ static const struct scarlett2_device_info vocaster_two_info = {
 static const struct scarlett2_device_info solo_gen4_info = {
 	.config_set = &scarlett2_config_set_gen4_solo,
 	.min_firmware_version = 2115,
+	.has_devmap = 1,
 
 	.level_input_count = 1,
 	.air_input_count = 1,
@@ -1912,6 +1918,7 @@ static const struct scarlett2_device_info solo_gen4_info = {
 static const struct scarlett2_device_info s2i2_gen4_info = {
 	.config_set = &scarlett2_config_set_gen4_2i2,
 	.min_firmware_version = 2115,
+	.has_devmap = 1,
 
 	.level_input_count = 2,
 	.air_input_count = 2,
@@ -1966,6 +1973,7 @@ static const struct scarlett2_device_info s2i2_gen4_info = {
 static const struct scarlett2_device_info s4i4_gen4_info = {
 	.config_set = &scarlett2_config_set_gen4_4i4,
 	.min_firmware_version = 2089,
+	.has_devmap = 1,
 
 	.level_input_count = 2,
 	.air_input_count = 2,
@@ -2264,6 +2272,8 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_GET_DATA      0x00800000
 #define SCARLETT2_USB_SET_DATA      0x00800001
 #define SCARLETT2_USB_DATA_CMD      0x00800002
+#define SCARLETT2_USB_INFO_DEVMAP   0x0080000c
+#define SCARLETT2_USB_GET_DEVMAP    0x0080000d
 
 #define SCARLETT2_USB_CONFIG_SAVE 6
 
@@ -2277,6 +2287,14 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_SEGMENT_SETTINGS_NAME "App_Settings"
 #define SCARLETT2_SEGMENT_FIRMWARE_NAME "App_Upgrade"
 
+/* Gen 4 device firmware provides access to a base64-encoded
+ * zlib-compressed JSON description of the device's capabilities and
+ * configuration. This device map is made available in
+ * /proc/asound/cardX/device-map.json.zz.b64
+ */
+#define SCARLETT2_DEVMAP_BLOCK_SIZE 1024
+#define SCARLETT2_DEVMAP_FILENAME "device-map.json.zz.b64"
+
 /* proprietary request/response format */
 struct scarlett2_usb_packet {
 	__le32 cmd;
@@ -9562,6 +9580,116 @@ static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*** device-map file ***/
+
+static ssize_t scarlett2_devmap_read(
+	struct snd_info_entry *entry,
+	void                  *file_private_data,
+	struct file           *file,
+	char __user           *buf,
+	size_t                 count,
+	loff_t                 pos)
+{
+	struct usb_mixer_interface *mixer = entry->private_data;
+	u8           *resp_buf;
+	const size_t  block_size = SCARLETT2_DEVMAP_BLOCK_SIZE;
+	size_t        copied = 0;
+
+	if (pos >= entry->size)
+		return 0;
+
+	if (pos + count > entry->size)
+		count = entry->size - pos;
+
+	resp_buf = kmalloc(block_size, GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	while (count > 0) {
+		/* SCARLETT2_USB_GET_DEVMAP reads only on block boundaries,
+		 * so we need to read a whole block and copy the requested
+		 * chunk to userspace.
+		 */
+
+		__le32 req;
+		int    err;
+
+		/* offset within the block that we're reading */
+		size_t offset = pos % block_size;
+
+		/* read_size is block_size except for the last block */
+		size_t block_start = pos - offset;
+		size_t read_size = min_t(size_t,
+					 block_size,
+					 entry->size - block_start);
+
+		/* size of the chunk to copy to userspace */
+		size_t copy_size = min_t(size_t, count, read_size - offset);
+
+		/* request the block */
+		req = cpu_to_le32(pos / block_size);
+		err = scarlett2_usb(mixer, SCARLETT2_USB_GET_DEVMAP,
+				    &req, sizeof(req), resp_buf, read_size);
+		if (err < 0) {
+			kfree(resp_buf);
+			return copied ? copied : err;
+		}
+
+		if (copy_to_user(buf, resp_buf + offset, copy_size)) {
+			kfree(resp_buf);
+			return -EFAULT;
+		}
+
+		buf += copy_size;
+		pos += copy_size;
+		copied += copy_size;
+		count -= copy_size;
+	}
+
+	kfree(resp_buf);
+	return copied;
+}
+
+static const struct snd_info_entry_ops scarlett2_devmap_ops = {
+	.read = scarlett2_devmap_read,
+};
+
+static int scarlett2_devmap_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	__le16 config_len_buf[2];
+	int config_len;
+	struct snd_info_entry *entry;
+	int err;
+
+	/* If the device doesn't support the DEVMAP commands, don't
+	 * create the /proc/asound/cardX/scarlett.json.zlib entry
+	 */
+	if (!info->has_devmap)
+		return 0;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_INFO_DEVMAP,
+			    NULL, 0, &config_len_buf, sizeof(config_len_buf));
+	if (err < 0)
+		return err;
+
+	config_len = le16_to_cpu(config_len_buf[1]);
+
+	err = snd_card_proc_new(card, SCARLETT2_DEVMAP_FILENAME, &entry);
+	if (err < 0)
+		return err;
+
+	entry->content = SNDRV_INFO_CONTENT_DATA;
+	entry->private_data = mixer;
+	entry->c.ops = &scarlett2_devmap_ops;
+	entry->size = config_len;
+	entry->mode = S_IFREG | 0444;
+
+	return 0;
+}
+
 int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
@@ -9612,11 +9740,20 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 	}
 
 	err = scarlett2_hwdep_init(mixer);
-	if (err < 0)
+	if (err < 0) {
 		usb_audio_err(mixer->chip,
 			      "Error creating %s hwdep device: %d",
 			      entry->series_name,
 			      err);
+		return err;
+	}
+
+	err = scarlett2_devmap_init(mixer);
+	if (err < 0)
+		usb_audio_err(mixer->chip,
+			      "Error creating %s devmap entry: %d",
+			      entry->series_name,
+			      err);
 
 	return err;
 }
-- 
2.45.0

