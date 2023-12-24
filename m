Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A3D2F0
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="abQeqhau"
Received: by m.b4.vu (Postfix, from userid 1000)
	id BA1CE604B9CB; Mon, 25 Dec 2023 05:55:10 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BA1CE604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445910; bh=JL3Yhdp+Mo0nGsHZInIZZCviTwQbkSM8K/eLO2zXfEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abQeqhauIlHTkQkxg53MLv0sHGlVVepSmkaF77QUuTrpHYpbJmNTUl701AbRlf24g
	 71OaHnMFJr/Vipe7Wtf4aWiMgIvMvg6BvaeU13MXOxK4+Lga3TquSUk87xUxMNUrQk
	 yQjWXuSWVDT3YnUQVCm5ODJE4wxig7Sngr416vjs/wq/NUopnbRW6nciXsBQxbrpmv
	 Xn5KEtGUZiNIsIXqL/5KaOUjrbqfObRiK0wHENCJ3Yaf4HgwBZHPRlcRrNBwS01LST
	 2nM/v1VttLrW+QBKFqWBHmRHXvF6t+tEhsVl8T3fuvq/Gp646koeW5V/KjvvAh/Sv8
	 4q1n4hP5nnnNw==
Date: Mon, 25 Dec 2023 05:55:10 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 08/23] ALSA: scarlett2: Add check for config_item presence
Message-ID: <b0572b23291ffd1b208f21d298adaf4d9f1fe4bc.1703444932.git.g@b4.vu>
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

Update scarlett2_usb_get_config() and scarlett2_usb_set_config() to
make sure that the config_item_num is valid for the device.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bff777a93d65..4849dfeea429 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1528,6 +1528,12 @@ static int scarlett2_usb_get_config(
 	u8 *buf_8;
 	u8 value;
 
+	/* Check that the configuration item is present in the
+	 * configuration set used by this device
+	 */
+	if (!config_item->offset)
+		return -EFAULT;
+
 	/* For byte-sized parameters, retrieve directly into buf */
 	if (config_item->size >= 8) {
 		size = config_item->size / 8 * count;
@@ -1594,6 +1600,12 @@ static int scarlett2_usb_set_config(
 	int offset, size;
 	int err;
 
+	/* Check that the configuration item is present in the
+	 * configuration set used by this device
+	 */
+	if (!config_item->offset)
+		return -EFAULT;
+
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
 
-- 
2.43.0

