Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0537D13D2EE
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268503; cv=none; b=H7zc125QPyq1yH3bn2/CyKP1QXnhdQB7EwrNCzlIL6qMDC1sxnIqv+66AWJrwFoxPPUEWzZuPiocLfC5lOw5QrZLPimcO4zZxToP1/GLCmonaMCf/+6c4VVepEi2nqlOwrOgjno+7y2B27MNfeGLO/dK9lih8zhNZWlb14wuA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268503; c=relaxed/simple;
	bh=cv3TPtoV3bfZ9nPkpVe+DduRxZQvdpZAPvw+7ylJoXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHfqws1fDCjwt2gncm7Q2MQ2V1rAf1G8jQSSgQTcZ3ke3PW/PJOLiKymlehBoIAnxlw7+4aQI4y1VIr7HL2oBFgom4HyNOteb1bA2z4e3p/xHVPNMazQl3yGuaoVHrd56PZ5XTUfLpRAHctr9nCcUrdxrFJU9z8FjQcwN3Phwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=DSau9G8H; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="DSau9G8H"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6C2A3604B628; Wed, 13 Mar 2024 05:04:59 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6C2A3604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268499; bh=IljRXDStgn3sJTAC25X6vS2KJ5D2gSKRo/lwEU9b69U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSau9G8HejxtRs+IeAxw+nAOs4XccQX8ETivG5Qyt+nEf55JhAlwSQ2b+iLShggRA
	 co1QuGTlOx3EENdVIuHWByv5EzBtfLwpsaWUrpFjCG2CncQJQSrQWyL69cSLRRuvNk
	 6xTjtwtqUQJ/Jcfk8p6/PiD6bCEt3fvbPNz+jlNeVzbGLZ7aZxVYApecDzR7Ckvh50
	 WfZ0C4HCUNRsdSf5n/ZrnSbFwSHBfjnkjmf/Escxt5rJxnT2XoDYKxw80vUWT7oDwm
	 HGUUcdwBkc1eA9Esqphq3fRsQl7bqc542tHQnszu2ZYfxGQnbGuGfJcvERRqLsXy4U
	 PqYF2RfjyCQGw==
Date: Wed, 13 Mar 2024 05:04:59 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 04/14] ALSA: scarlett2: Rename gen4_write_addr to
 param_buf_addr
Message-ID: <aa36ecb8d3ce67387b5edf6c900f0b8a509241ce.1710264833.git.g@b4.vu>
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

The location pointed to by gen4_write_addr and gen4_write_addr + 1 is
officially known as the parameter buffer. Update the code to match.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 981ec48a811a..6031bfd98137 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -438,9 +438,9 @@ enum {
 /* Location, size, and activation command number for the configuration
  * parameters. Size is in bits and may be 0, 1, 8, or 16.
  *
- * A size of 0 indicates that the parameter is a byte-sized Scarlett
- * Gen 4 configuration which is written through the gen4_write_addr
- * location (but still read through the given offset location).
+ * A size of 0 indicates that the parameter is a byte-sized
+ * configuration which is set through the parameter buffer (but still
+ * read through the given offset location).
  *
  * Some Gen 4 configuration parameters are written with 0x02 for a
  * desired value of 0x01, and 0x03 for 0x00. These are indicated with
@@ -457,7 +457,7 @@ struct scarlett2_config {
 
 struct scarlett2_config_set {
 	const struct scarlett2_notification *notifications;
-	u16 gen4_write_addr;
+	u16 param_buf_addr;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
@@ -625,7 +625,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3c = {
 /* Solo Gen 4 */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
 	.notifications = scarlett4_solo_notifications,
-	.gen4_write_addr = 0xd8,
+	.param_buf_addr = 0xd8,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x47, .size = 8, .activate = 4 },
@@ -653,7 +653,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_solo = {
 /* 2i2 Gen 4 */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 	.notifications = scarlett4_2i2_notifications,
-	.gen4_write_addr = 0xfc,
+	.param_buf_addr = 0xfc,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x49, .size = 8, .activate = 4 }, // 0x41 ??
@@ -696,7 +696,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen4_2i2 = {
 /* 4i4 Gen 4 */
 static const struct scarlett2_config_set scarlett2_config_set_gen4_4i4 = {
 	.notifications = scarlett4_4i4_notifications,
-	.gen4_write_addr = 0x130,
+	.param_buf_addr = 0x130,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x5c, .size = 8, .activate = 4 },
@@ -2080,7 +2080,7 @@ static int scarlett2_usb_get_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
-	/* Gen 4 style parameters are always 1 byte */
+	/* Writes to the parameter buffer are always 1 byte */
 	size = config_item->size ? config_item->size : 8;
 
 	/* For byte-sized parameters, retrieve directly into buf */
@@ -2167,23 +2167,23 @@ static int scarlett2_usb_set_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
-	/* Gen 4 style writes are selected with size = 0;
+	/* Writes via the parameter buffer are selected with size = 0;
 	 * these are only byte-sized values written through a shared
 	 * location, different to the read address
 	 */
 	if (!config_item->size) {
-		if (!config_set->gen4_write_addr)
+		if (!config_set->param_buf_addr)
 			return -EFAULT;
 
-		/* Place index in gen4_write_addr + 1 */
+		/* Place index in param_buf_addr + 1 */
 		err = scarlett2_usb_set_data(
-			mixer, config_set->gen4_write_addr + 1, 1, index);
+			mixer, config_set->param_buf_addr + 1, 1, index);
 		if (err < 0)
 			return err;
 
-		/* Place value in gen4_write_addr */
+		/* Place value in param_buf_addr */
 		err = scarlett2_usb_set_data(
-			mixer, config_set->gen4_write_addr, 1, value);
+			mixer, config_set->param_buf_addr, 1, value);
 		if (err < 0)
 			return err;
 
@@ -2192,9 +2192,8 @@ static int scarlett2_usb_set_config(
 			mixer, config_item->activate);
 	}
 
-	/* Not-Gen 4 style needs NVRAM save, supports
-	 * bit-modification, and writing is done to the same place
-	 * that the value can be read from
+	/* Direct writes (not via the parameter buffer) need NVRAM
+	 * save and support bit-modification
 	 */
 
 	/* Cancel any pending NVRAM save */
@@ -2238,8 +2237,8 @@ static int scarlett2_usb_set_config(
 	if (err < 0)
 		return err;
 
-	/* Gen 2 style writes to Gen 4 devices don't need saving */
-	if (config_set->gen4_write_addr)
+	/* Writes via the parameter buffer don't need a separate save step */
+	if (config_set->param_buf_addr)
 		return 0;
 
 	/* Schedule the change to be written to NVRAM */
-- 
2.43.0

