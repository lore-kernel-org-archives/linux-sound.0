Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3384D515
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="mPBTOMBs"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 1ADD8604B9CB; Mon, 25 Dec 2023 06:00:05 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 1ADD8604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446205; bh=MPdWXYyjeLUiVdcoIXauoPNBZqkN1SEaphNqdSEFlV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPBTOMBsnHMCJvUvn932UJoaWds0ITzC6Rrildl1kWpB4IVAQb7rg+hUHGlCkm9Av
	 w8AqQwfqOHBZpDVUOftzq7f7hMQhwk6XSQwM/sE6dnZWitwyF1knce1cHqXcqCkPst
	 HH5jj6mNntqCXEMi9kGoq97AuCO95xh/kRQEbvrTMqXqe5uykm8AOGCdpOBWhNvC7j
	 iYl44xovsm3e/k3NmDro5Q9fS+Cqq3kB7bhYPLO9r5NI19Czb63WIVb7AHbn1aOOj2
	 qr2zOG5j4+0gXzItd4VV2SI7eyICOvOTJpUop5RId4TViTU7pCp623fdslgLZKWxuD
	 d25ZrpF3E4cQg==
Date: Mon, 25 Dec 2023 06:00:05 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 18/23] ALSA: scarlett2: Allow for interfaces without
 per-channel volume
Message-ID: <30f68cb311e27f2cc1351cb846218f7248a90263.1703444932.git.g@b4.vu>
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

Currently-supported interfaces with a mixer have per-channel volume
controls, but this changes in Gen 4. Add a check so that the Playback
Volume and associated controls don't get created unless the
SCARLETT2_CONFIG_LINE_OUT_VOLUME config item is present.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 68 ++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index e8a93fd339f7..24d7cc85cf04 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3726,6 +3726,13 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Remaining controls are only applicable if the device
+	 * has per-channel line-out volume controls.
+	 */
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_LINE_OUT_VOLUME))
+		return 0;
+
 	/* Add volume controls */
 	for (i = 0; i < private->num_line_out; i++) {
 		int index = line_out_remap(private, i);
@@ -4569,7 +4576,6 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	int err, i;
-	s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
 	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
 		err = scarlett2_usb_get_config(
@@ -4608,41 +4614,47 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	/* read SW line out volume */
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
-		private->num_line_out, &sw_vol);
-	if (err < 0)
-		return err;
-
-	for (i = 0; i < private->num_line_out; i++)
-		private->vol[i] = clamp(
-			sw_vol[i] + SCARLETT2_VOLUME_BIAS,
-			0, SCARLETT2_VOLUME_BIAS);
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_LINE_OUT_VOLUME)) {
+		s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
-	/* read SW mute */
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
-		private->num_line_out, &private->mute_switch);
-	if (err < 0)
-		return err;
+		/* read SW line out volume */
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+			private->num_line_out, &sw_vol);
+		if (err < 0)
+			return err;
 
-	for (i = 0; i < private->num_line_out; i++)
-		private->mute_switch[i] =
-			!!private->mute_switch[i];
+		for (i = 0; i < private->num_line_out; i++)
+			private->vol[i] = clamp(
+				sw_vol[i] + SCARLETT2_VOLUME_BIAS,
+				0, SCARLETT2_VOLUME_BIAS);
 
-	/* read SW/HW switches */
-	if (scarlett2_has_config_item(private,
-				      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
+		/* read SW mute */
 		err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
-			private->num_line_out, &private->vol_sw_hw_switch);
+			mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
+			private->num_line_out, &private->mute_switch);
 		if (err < 0)
 			return err;
 
 		for (i = 0; i < private->num_line_out; i++)
-			private->vol_sw_hw_switch[i] =
-				!!private->vol_sw_hw_switch[i];
+			private->mute_switch[i] =
+				!!private->mute_switch[i];
+
+		/* read SW/HW switches */
+		if (scarlett2_has_config_item(private,
+					      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
+			err = scarlett2_usb_get_config(
+				mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
+				private->num_line_out,
+				&private->vol_sw_hw_switch);
+			if (err < 0)
+				return err;
+
+			for (i = 0; i < private->num_line_out; i++)
+				private->vol_sw_hw_switch[i] =
+					!!private->vol_sw_hw_switch[i];
+		}
 	}
 
 	err = scarlett2_update_volumes(mixer);
-- 
2.43.0

