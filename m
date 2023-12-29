Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256161118F
	for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="SexFa7bw"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C93AE604B1D5; Fri, 29 Dec 2023 22:49:23 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C93AE604B1D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703852363; bh=IIDtS5l87RhlwRGtBY+MgB8DAuPPeQdYVYvLBSsHLQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SexFa7bwY2CSr7mStLVjqshxFa/gxAC0bPEYZ99n3LIS3azs0ziUTM9Eqlzofti+C
	 4bnQzDt7/AkOMAd3Iwp3JV6d+s3uVSPPJzaKfZJqasCc92GHzb+bZQHT6/ZqGCCLrh
	 vbuhItZLD0thPwO3bHbT8zSW2zSV+os7tBu7e8pgymk6zmNT/IKvpY0S5oaTJj6QQ5
	 jsyk6/2kHPSm2JRR/B5kHogPuMWDbhHCdgxw9zA07wRlGgBG3wLchRZkjmLNUCqSvN
	 Wf4QEXSfsJHk+zDaKghusSZBj3HaNB8z+n+3c2ZeADrUSa7GU9he/u8BlPfukUOZRk
	 CfexN4WRtqtpw==
Date: Fri, 29 Dec 2023 22:49:23 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 11/11] ALSA: scarlett2: Add support for uploading new
 firmware
Message-ID: <ZY65S0ojShSNSeRQ@m.b4.vu>
References: <e295050a79057ee8b7bc555a65e295691abd1ede.1703001053.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e295050a79057ee8b7bc555a65e295691abd1ede.1703001053.git.g@b4.vu>

Add ops.write to the hwdep interface. Once the upgrade firmware flash
segment has been erased, writes to the hwdep fd are permitted, and
translated to SCARLETT2_USB_WRITE_SEGMENT commands to the device.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---

Hi Takashi,

I noticed that scarlett2_hwdep_write() was returning the wrong value
for errors encountered after the kzalloc(). Since I don't think you've
taken this set of patches yet, can you replace the previous patch 11
with this version two? Sorry, I don't know if you'd prefer I resend
all 11 patches but I erred on the side of fewer emails. Let me know if
you would like me to do different this time or next time.

Thanks,
Geoffrey.

 sound/usb/mixer_scarlett2.c | 96 +++++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ca09d0cd0cae..1f3b07bd7b3f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -266,7 +266,8 @@ enum {
 enum {
 	SCARLETT2_FLASH_WRITE_STATE_IDLE = 0,
 	SCARLETT2_FLASH_WRITE_STATE_SELECTED = 1,
-	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2
+	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2,
+	SCARLETT2_FLASH_WRITE_STATE_WRITE = 3
 };
 
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
@@ -1176,6 +1177,7 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
 #define SCARLETT2_FLASH_BLOCK_SIZE 4096
+#define SCARLETT2_FLASH_WRITE_MAX 1024
 #define SCARLETT2_SEGMENT_NUM_MIN 1
 #define SCARLETT2_SEGMENT_NUM_MAX 4
 
@@ -5079,10 +5081,10 @@ static int scarlett2_ioctl_get_erase_progress(
 		return -EFAULT;
 
 	/* If the erase is complete, change the state from ERASING to
-	 * IDLE.
+	 * WRITE.
 	 */
 	if (progress.progress == 0xff)
-		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_IDLE;
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_WRITE;
 
 	return 0;
 }
@@ -5135,6 +5137,93 @@ static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	}
 }
 
+static long scarlett2_hwdep_write(struct snd_hwdep *hw,
+				  const char __user *buf,
+				  long count, loff_t *offset)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num, err, len;
+	int flash_size;
+
+	/* SCARLETT2_USB_WRITE_SEGMENT request data */
+	struct {
+		__le32 segment_num;
+		__le32 offset;
+		__le32 pad;
+		u8 data[];
+	} __packed *req;
+
+	/* Calculate the maximum permitted in data[] */
+	const size_t max_data_size = SCARLETT2_FLASH_WRITE_MAX -
+				     offsetof(typeof(*req), data);
+
+	/* If erasing, wait for it to complete */
+	if (private->flash_write_state ==
+	      SCARLETT2_FLASH_WRITE_STATE_ERASING) {
+		err = scarlett2_wait_for_erase(mixer);
+		if (err < 0)
+			return err;
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_WRITE;
+
+	/* Check that an erase has been done & completed */
+	} else if (private->flash_write_state !=
+		     SCARLETT2_FLASH_WRITE_STATE_WRITE) {
+		return -EINVAL;
+	}
+
+	/* Check that we're writing to the upgrade firmware */
+	segment_id = private->selected_flash_segment_id;
+	if (segment_id != SCARLETT2_SEGMENT_ID_FIRMWARE)
+		return -EINVAL;
+
+	segment_num = private->flash_segment_nums[segment_id];
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Validate the offset and count */
+	flash_size = private->flash_segment_blocks[segment_id] *
+		     SCARLETT2_FLASH_BLOCK_SIZE;
+
+	if (count < 0 || *offset < 0 || *offset + count >= flash_size)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	/* Limit the *req size to SCARLETT2_FLASH_WRITE_MAX */
+	if (count > max_data_size)
+		count = max_data_size;
+
+	/* Create and send the request */
+	len = struct_size(req, data, count);
+	req = kzalloc(len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->segment_num = cpu_to_le32(segment_num);
+	req->offset = cpu_to_le32(*offset);
+	req->pad = 0;
+
+	if (copy_from_user(req->data, buf, count)) {
+		err = -EFAULT;
+		goto error;
+	}
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_WRITE_SEGMENT,
+			    req, len, NULL, 0);
+	if (err < 0)
+		goto error;
+
+	*offset += count;
+	err = count;
+
+error:
+	kfree(req);
+	return err;
+}
+
 static int scarlett2_hwdep_release(struct snd_hwdep *hw, struct file *file)
 {
 	struct usb_mixer_interface *mixer = hw->private_data;
@@ -5164,6 +5253,7 @@ static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 	hw->exclusive = 1;
 	hw->ops.open = scarlett2_hwdep_open;
 	hw->ops.ioctl = scarlett2_hwdep_ioctl;
+	hw->ops.write = scarlett2_hwdep_write;
 	hw->ops.release = scarlett2_hwdep_release;
 
 	return 0;
-- 
2.43.0

