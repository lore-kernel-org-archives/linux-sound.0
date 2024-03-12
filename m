Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C81DDC9
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268486; cv=none; b=Ct/QOnSqFJSybNnnZkSO3NT0qMAi85lKg57sbnnCRstREaf+8xKCRg1tucakTn7l1VyaqPyHa7s/1HpFNetHNs2uLpP/1jpVMDPmbSJMMy3fvR5W3oyv6Dgx4vhik/SM790LtYsXe05DwpRFGAaTcpPJlsWJxgD7SDV2yNXcWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268486; c=relaxed/simple;
	bh=CCvyYoEU8wZyGiZAtNhCxEfZZvQ2LuSQpSdCLGy3Z8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GceOQGFYHZxee9KSPDbR8kxpPb3XzCE/ggUlu0T20jk2OIki3HkslTr1WKGwmiMiTdMEJCJbRuJxKiuUVFONTx8McPv1rscFlsEUmXxai/zzcGR0xj//8xafr1YhiVG7hF/r7yC4TnFw81OeQM4Pt7H+Vg05xYUu1KeJFDJFvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=iW0zg+lF; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="iW0zg+lF"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 71714604B628; Wed, 13 Mar 2024 05:04:42 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 71714604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268482; bh=KnVh0m8I1ekoRCiw14HYKydIS3Shi+7aQ7HzZ+BBaFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iW0zg+lF4U2M1pSS0EBQqf02YR/DBAFywFZVirTtOxnlOHxG5H7a2+z0OK6onli3g
	 V4Ejdwv+wX7KU791NUXri0Nj1PP2qHG+aBLMnGfBf3bnFg7PM1IcCejm2FTw8TcWsh
	 WkQVpzn1wTn1ksdIKDaZVzZCratxuv+6/q/H6TMxPD0G8SXw8ocm0LjdOGTIg7Q2ew
	 8WvQ1JjVeZDD/HW7h4iYdPN+XyhRE9QdojSLrck963vBLM3qdlcdnZAD5BQDp4abWX
	 HQHg7Zhkk9ifZogPhu+X7h4g/vYllO8tiX+WAUwdotn/TiRrMh/kSImroFHoSKaPuV
	 6b/WwxjY66z2Q==
Date: Wed, 13 Mar 2024 05:04:42 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 03/14] ALSA: scarlett2: Add support for reading from flash
Message-ID: <800d20a801e8c59c2905c82ecae5676cd4f31429.1710264833.git.g@b4.vu>
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

Add hwdep read op so flash segments can be read.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 88 +++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 02c488c80b7e..981ec48a811a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1859,6 +1859,7 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_ERASE_SEGMENT 0x00004002
 #define SCARLETT2_USB_GET_ERASE     0x00004003
 #define SCARLETT2_USB_WRITE_SEGMENT 0x00004004
+#define SCARLETT2_USB_READ_SEGMENT  0x00004005
 #define SCARLETT2_USB_GET_SYNC      0x00006004
 #define SCARLETT2_USB_GET_DATA      0x00800000
 #define SCARLETT2_USB_SET_DATA      0x00800001
@@ -1869,7 +1870,7 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
 #define SCARLETT2_FLASH_BLOCK_SIZE 4096
-#define SCARLETT2_FLASH_WRITE_MAX 1024
+#define SCARLETT2_FLASH_RW_MAX 1024
 #define SCARLETT2_SEGMENT_NUM_MIN 1
 #define SCARLETT2_SEGMENT_NUM_MAX 4
 
@@ -7452,7 +7453,7 @@ static int scarlett2_reboot(struct usb_mixer_interface *mixer)
 	return scarlett2_usb(mixer, SCARLETT2_USB_REBOOT, NULL, 0, NULL, 0);
 }
 
-/* Select a flash segment for erasing (and possibly writing to) */
+/* Select a flash segment for reading/erasing/writing */
 static int scarlett2_ioctl_select_flash_segment(
 	struct usb_mixer_interface *mixer,
 	unsigned long arg)
@@ -7633,6 +7634,84 @@ static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	}
 }
 
+static long scarlett2_hwdep_read(struct snd_hwdep *hw,
+				 char __user *buf,
+				 long count, loff_t *offset)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num, err;
+	int flash_size;
+
+	/* SCARLETT2_USB_READ_SEGMENT request data */
+	struct {
+		__le32 segment_num;
+		__le32 offset;
+		__le32 len;
+	} __packed req;
+
+	u8 *resp;
+
+	/* Flash segment must first be selected */
+	if (private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_SELECTED)
+		return -EINVAL;
+
+	/* Get the selected flash segment number */
+	segment_id = private->selected_flash_segment_id;
+	if (segment_id < 0 || segment_id >= SCARLETT2_SEGMENT_ID_COUNT)
+		return -EINVAL;
+
+	segment_num = private->flash_segment_nums[segment_id];
+	if (segment_num < 0 ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Validate the offset and count */
+	if (count < 0 || *offset < 0)
+		return -EINVAL;
+
+	/* Reached EOF? */
+	flash_size = private->flash_segment_blocks[segment_id] *
+		     SCARLETT2_FLASH_BLOCK_SIZE;
+	if (!count || *offset >= flash_size)
+		return 0;
+
+	/* Limit the numbers of bytes read to SCARLETT2_FLASH_RW_MAX */
+	if (count > SCARLETT2_FLASH_RW_MAX)
+		count = SCARLETT2_FLASH_RW_MAX;
+
+	/* Limit read to EOF */
+	if (*offset + count >= flash_size)
+		count = flash_size - *offset;
+
+	/* Create and send the request */
+	req.segment_num = cpu_to_le32(segment_num);
+	req.offset = cpu_to_le32(*offset);
+	req.len = cpu_to_le32(count);
+
+	resp = kzalloc(count, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_READ_SEGMENT,
+			    &req, sizeof(req), resp, count);
+	if (err < 0)
+		goto error;
+
+	/* Copy the response to userspace */
+	if (copy_to_user(buf, resp, count)) {
+		err = -EFAULT;
+		goto error;
+	}
+
+	*offset += count;
+	err = count;
+
+error:
+	kfree(resp);
+	return err;
+}
+
 static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 				  const char __user *buf,
 				  long count, loff_t *offset)
@@ -7651,7 +7730,7 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 	} __packed *req;
 
 	/* Calculate the maximum permitted in data[] */
-	const size_t max_data_size = SCARLETT2_FLASH_WRITE_MAX -
+	const size_t max_data_size = SCARLETT2_FLASH_RW_MAX -
 				     offsetof(typeof(*req), data);
 
 	/* If erasing, wait for it to complete */
@@ -7688,7 +7767,7 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 	if (!count)
 		return 0;
 
-	/* Limit the *req size to SCARLETT2_FLASH_WRITE_MAX */
+	/* Limit the *req size to SCARLETT2_FLASH_RW_MAX */
 	if (count > max_data_size)
 		count = max_data_size;
 
@@ -7749,6 +7828,7 @@ static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 	hw->exclusive = 1;
 	hw->ops.open = scarlett2_hwdep_open;
 	hw->ops.ioctl = scarlett2_hwdep_ioctl;
+	hw->ops.read = scarlett2_hwdep_read;
 	hw->ops.write = scarlett2_hwdep_write;
 	hw->ops.release = scarlett2_hwdep_release;
 
-- 
2.43.0

