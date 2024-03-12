Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADAC13D2EE
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268519; cv=none; b=X6QCjbEGemY9rvaDfYRwH+liHxpnIuzL0vY2G3g+FJdoaDhMuXRmBTRj5rZf3CBT2k2sDQQKDJ7YAyg3o36uTkArccP+7BvTWKY5Vf7q01tm14yiIA2CPsaykRvlB/Cb+RChAnqoZ5y65WfX/m2Sda4AaYqgNEpcDSskMF318rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268519; c=relaxed/simple;
	bh=4hSDiSS+3BrcrHWDKY3NeKBU18V7/UR1b9cFUOUIfFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2S2WScPx6sqpr7QBj0Fmyt610HJX2bYVUh/0cXsRiODO17kDWFunVtLGH3zS1m3oKIK70BP89qRjZ+qLyxJwv9rCuEEInvdHxyRtNo/T+q208EiyvtAlfrDUBixdjjYNxEJYZdkfp4VAir//Wjj0tVxRJZtfK8S6HD6WtMyK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=sFJxhDdj; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="sFJxhDdj"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 35782604B628; Wed, 13 Mar 2024 05:05:15 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 35782604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268515; bh=L85CNCqofFJVXSnT2JBhNyQUk+0tlGmVaoQWfotddLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFJxhDdjijVVNd1TtnzwsAbXSVtiwrq4AMr9kSUGMKnMSW8OAqrK5dSnwGGizQpXC
	 vXmx8kFGpmvCXcb+2FqwzzTi8v9afvmmFbKVmjJkYFi53293VKKa2pcXgjz1i4PLBr
	 uEwmpVFrjK8xi7NMZoY51B37BsOml40Zi4CqRMeBf2u6SPXVwxU/GDezNXAZZmJ/OH
	 dPFcr9kxue4FjLZuOvEGY0pCXenq5+9SDNQ4n1odJM2bqQC3/QitnBvgH9mq2uYORK
	 Ge9nxRRVcTmdSGjrKwjVNHnvFuuMFUZ8WV3p4bnu9lJwn+XPJX60cvDSPZHybf1Oac
	 XW3ss3POVr5/Q==
Date: Wed, 13 Mar 2024 05:05:15 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 05/14] ALSA: scarlett2: Add pbuf field to struct
 scarlett2_config
Message-ID: <50a7d85bb04f9a7f13f667c70a706826c8d3ef93.1710264833.git.g@b4.vu>
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

scarlett2_usb_set_config() was using size = 0 as a signal to use the
parameter buffer. Replace that with an explicit indication (pbuf = 1),
as the upcoming Vocaster support has a config item written via the
parameter buffer with size = 1 rather than the implicit size of 8.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 85 ++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6031bfd98137..8d08f71bd4d6 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -436,11 +436,12 @@ enum {
 };
 
 /* Location, size, and activation command number for the configuration
- * parameters. Size is in bits and may be 0, 1, 8, or 16.
+ * parameters. Size is in bits and may be 1, 8, or 16.
  *
- * A size of 0 indicates that the parameter is a byte-sized
- * configuration which is set through the parameter buffer (but still
- * read through the given offset location).
+ * Vocaster and 4th Gen devices have a parameter buffer to set certain
+ * configuration parameters. When pbuf is set, rather than writing to
+ * the given offset, the channel and value are written to the
+ * parameter buffer and the activate command is sent to the device.
  *
  * Some Gen 4 configuration parameters are written with 0x02 for a
  * desired value of 0x01, and 0x03 for 0x00. These are indicated with
@@ -452,6 +453,7 @@ struct scarlett2_config {
 	u16 offset;
 	u8 size;
 	u8 activate;
+	u8 pbuf;
 	u8 mute;
 };
 
@@ -631,19 +633,21 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
 			.offset = 0x47, .size = 8, .activate = 4 },
 
 		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
-			.offset = 0x108, .activate = 12 },
+			.offset = 0x108, .size = 8, .activate = 12, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-			.offset = 0x46, .activate = 9, .mute = 1 },
+			.offset = 0x46, .size = 8, .activate = 9, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x3d, .activate = 10, .mute = 1 },
+			.offset = 0x3d, .size = 8, .activate = 10, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x3e, .activate = 11 },
+			.offset = 0x3e, .size = 8, .activate = 11, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_PCM_INPUT_SWITCH] = {
-			.offset = 0x206, .activate = 25 },
+			.offset = 0x206, .size = 8, .activate = 25, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
 			.offset = 0x232, .size = 16, .activate = 26 }
@@ -656,37 +660,39 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	.param_buf_addr = 0xfc,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
-			.offset = 0x49, .size = 8, .activate = 4 }, // 0x41 ??
+			.offset = 0x49, .size = 8, .activate = 4 },
 
 		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
-			.offset = 0x14a, .activate = 16 },
+			.offset = 0x14a, .size = 8, .activate = 16, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
-			.offset = 0x135, .activate = 10 },
+			.offset = 0x135, .size = 8, .activate = 10, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
-			.offset = 0x137 },
+			.offset = 0x137, .size = 8 },
 
 		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-			.offset = 0x48, .activate = 11, .mute = 1 },
+			.offset = 0x48, .size = 8, .activate = 11, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_GAIN] = {
-			.offset = 0x4b, .activate = 12 },
+			.offset = 0x4b, .size = 8, .activate = 12, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x3c, .activate = 13, .mute = 1 },
+			.offset = 0x3c, .size = 8, .activate = 13, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
-			.offset = 0x147, .activate = 14 },
+			.offset = 0x147, .size = 8, .activate = 14, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x3e, .activate = 15 },
+			.offset = 0x3e, .size = 8, .activate = 15, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
-			.offset = 0x14b, .activate = 17 },
+			.offset = 0x14b, .size = 8, .activate = 17, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
-			.offset = 0x14e, .activate = 18 },
+			.offset = 0x14e, .size = 8, .activate = 18, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN] = {
 			.offset = 0x2a0, .size = 16, .activate = 36 }
@@ -702,31 +708,33 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 			.offset = 0x5c, .size = 8, .activate = 4 },
 
 		[SCARLETT2_CONFIG_AUTOGAIN_SWITCH] = {
-			.offset = 0x13e, .activate = 10 },
+			.offset = 0x13e, .size = 8, .activate = 10, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_AUTOGAIN_STATUS] = {
-			.offset = 0x140 },
+			.offset = 0x140, .size = 8 },
 
 		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-			.offset = 0x5a, .activate = 11, .mute = 1 },
+			.offset = 0x5a, .size = 8, .activate = 11, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_GAIN] = {
-			.offset = 0x5e, .activate = 12 },
+			.offset = 0x5e, .size = 8, .activate = 12, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x4e, .activate = 13, .mute = 1 },
+			.offset = 0x4e, .size = 8, .activate = 13, .pbuf = 1,
+			.mute = 1 },
 
 		[SCARLETT2_CONFIG_SAFE_SWITCH] = {
-			.offset = 0x150, .activate = 14 },
+			.offset = 0x150, .size = 8, .activate = 14, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x50, .activate = 15 },
+			.offset = 0x50, .size = 8, .activate = 15, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_SELECT_SWITCH] = {
-			.offset = 0x153, .activate = 16 },
+			.offset = 0x153, .size = 8, .activate = 16, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_INPUT_LINK_SWITCH] = {
-			.offset = 0x156, .activate = 17 },
+			.offset = 0x156, .size = 8, .activate = 17, .pbuf = 1 },
 
 		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
 			.offset = 0x32, .size = 16 },
@@ -735,10 +743,10 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 			.offset = 0x3a, .size = 16 },
 
 		[SCARLETT2_CONFIG_POWER_EXT] = {
-			.offset = 0x168 },
+			.offset = 0x168, .size = 8 },
 
 		[SCARLETT2_CONFIG_POWER_LOW] = {
-			.offset = 0x16d }
+			.offset = 0x16d, .size = 8 }
 	}
 };
 
@@ -2167,11 +2175,8 @@ static int scarlett2_usb_set_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
-	/* Writes via the parameter buffer are selected with size = 0;
-	 * these are only byte-sized values written through a shared
-	 * location, different to the read address
-	 */
-	if (!config_item->size) {
+	/* Write via the parameter buffer? */
+	if (config_item->pbuf) {
 		if (!config_set->param_buf_addr)
 			return -EFAULT;
 
@@ -2187,7 +2192,7 @@ static int scarlett2_usb_set_config(
 		if (err < 0)
 			return err;
 
-		/* Request the interface do the write */
+		/* Activate the write through the parameter buffer */
 		return scarlett2_usb_activate_config(
 			mixer, config_item->activate);
 	}
@@ -2227,7 +2232,7 @@ static int scarlett2_usb_set_config(
 		value = tmp;
 	}
 
-	/* Send the configuration parameter data */
+	/* Write the new value */
 	err = scarlett2_usb_set_data(mixer, offset, size, value);
 	if (err < 0)
 		return err;
@@ -2237,7 +2242,9 @@ static int scarlett2_usb_set_config(
 	if (err < 0)
 		return err;
 
-	/* Writes via the parameter buffer don't need a separate save step */
+	/* Interfaces with parameter buffer writes don't need a
+	 * separate save step
+	 */
 	if (config_set->param_buf_addr)
 		return 0;
 
-- 
2.43.0

