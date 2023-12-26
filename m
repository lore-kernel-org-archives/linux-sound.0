Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA850243
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="JaTOMP/V"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 60A9E604B6AC; Wed, 27 Dec 2023 04:36:29 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 60A9E604B6AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613989; bh=2n4PkT4R2tqEkDzTK9RSQIELqe+5LZML+5kl5+FYu/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JaTOMP/VRurhmjAyd3N8ZOeRr9Jkm+U4YLDSaOGsrqKTK9DcW/grcHKKnzIX7kwE7
	 C7ME1d9XBgyCxXsSzH3GybdhPDn1InaMI8QJ2rvNYdKGfBmPcyDH1NHBxdkUfrIx5J
	 pSitor7KxqFpWNCmJJNpxBc0CxZjrzh7EgoDcDCLvKjM7lH0wb9dfDnnq3atpUcIlT
	 mzDRPW5ugVIg08pJbRtRPNaatJAOus5D+M8leZ9CGqJaNQ8Ip+GQhSjLo6l7+UnmL5
	 NxESBNhcp2n6smJ7MyLwIkSQbnFGYJyLdk72FCH7YIuepfrM0sJ7ndpzXHOKq1TTY0
	 PS58QAUcR1Kjw==
Date: Wed, 27 Dec 2023 04:36:29 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 04/20] ALSA: scarlett2: Add support for Gen 4 style parameters
Message-ID: <1624e6d8a0c629c3bdfe53825b16e8b589724fc4.1703612638.git.g@b4.vu>
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

Writing Scarlett Gen 4 parameters differs from Gen 2 and Gen 3:
- the values are written into a shared write location
- the values are only byte-sized
- the read locations now extend beyond 0xFF
- a separate NVRAM save step is no longer required

This patch implements that alternate write style, triggered by setting
the config item size field to zero.

The write address is specified through a new config set field
gen4_write_addr.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 53 +++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 5c5198bb224a..09cd09799588 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -320,16 +320,21 @@ enum {
 };
 
 /* Location, size, and activation command number for the configuration
- * parameters. Size is in bits and may be 1, 8, or 16.
+ * parameters. Size is in bits and may be 0, 1, 8, or 16.
+ *
+ * A size of 0 indicates that the parameter is a byte-sized Scarlett
+ * Gen 4 configuration which is written through the gen4_write_addr
+ * location (but still read through the given offset location).
  */
 struct scarlett2_config {
-	u8 offset;
+	u16 offset;
 	u8 size;
 	u8 activate;
 };
 
 struct scarlett2_config_set {
 	const struct scarlett2_notification *notifications;
+	u16 gen4_write_addr;
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
@@ -1612,9 +1617,12 @@ static int scarlett2_usb_get_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
+	/* Gen 4 style parameters are always 1 byte */
+	size = config_item->size ? config_item->size : 8;
+
 	/* For byte-sized parameters, retrieve directly into buf */
-	if (config_item->size >= 8) {
-		size = config_item->size / 8 * count;
+	if (size >= 8) {
+		size = size / 8 * count;
 		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
 		if (err < 0)
 			return err;
@@ -1684,8 +1692,9 @@ static int scarlett2_usb_set_config(
 	int config_item_num, int index, int value)
 {
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_config_set *config_set = private->config_set;
 	const struct scarlett2_config *config_item =
-		&private->config_set->items[config_item_num];
+		&config_set->items[config_item_num];
 	int offset, size;
 	int err;
 
@@ -1695,6 +1704,36 @@ static int scarlett2_usb_set_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
+	/* Gen 4 style writes are selected with size = 0;
+	 * these are only byte-sized values written through a shared
+	 * location, different to the read address
+	 */
+	if (!config_item->size) {
+		if (!config_set->gen4_write_addr)
+			return -EFAULT;
+
+		/* Place index in gen4_write_addr + 1 */
+		err = scarlett2_usb_set_data(
+			mixer, config_set->gen4_write_addr + 1, 1, index);
+		if (err < 0)
+			return err;
+
+		/* Place value in gen4_write_addr */
+		err = scarlett2_usb_set_data(
+			mixer, config_set->gen4_write_addr, 1, value);
+		if (err < 0)
+			return err;
+
+		/* Request the interface do the write */
+		return scarlett2_usb_activate_config(
+			mixer, config_item->activate);
+	}
+
+	/* Not-Gen 4 style needs NVRAM save, supports
+	 * bit-modification, and writing is done to the same place
+	 * that the value can be read from
+	 */
+
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
 
@@ -1736,6 +1775,10 @@ static int scarlett2_usb_set_config(
 	if (err < 0)
 		return err;
 
+	/* Gen 2 style writes to Gen 4 devices don't need saving */
+	if (config_set->gen4_write_addr)
+		return 0;
+
 	/* Schedule the change to be written to NVRAM */
 	if (config_item->activate != SCARLETT2_USB_CONFIG_SAVE)
 		schedule_delayed_work(&private->work, msecs_to_jiffies(2000));
-- 
2.43.0

