Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B6DD2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="mLPoZoBA"
Received: by m.b4.vu (Postfix, from userid 1000)
	id B77AA604B9CB; Mon, 25 Dec 2023 05:52:24 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu B77AA604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445744; bh=KFeyHjN/zFYsWRr2wsyVrOFGrr3uGhR5lIrXSVGsT/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLPoZoBAR/erzqoHkg5gJwMBfSEMWv03D1MqBilFvp4YQuIrReS0JPoIeCP1RYWYG
	 mZM5Pl9AXCaj5RCxWi2gc4dVKlMbmU2IaKQ2Bge+srhg2bAkLD/SGsCYOQwWu6CWRX
	 IjT1EjrQKT49bgw8MsbZJlE/Ming4PO1Wu9XCZ4RAlyE35VCi+Jb928e7vO3pJg8b1
	 WkMqz2ku8kQOoVc+sSySEH+X+8zr5s17fx2cwm1wQ4yfSnVtG+lVaPfZl/D67z32qI
	 zEmIxwCm8ElQSi/yIcW/LIen6HnceJRdsELAPIqWQZRDgur9tNE0lkzkucnSG/U8m7
	 +pF7Zks5ACxJA==
Date: Mon, 25 Dec 2023 05:52:24 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 05/23] ALSA: scarlett2: Check presence of mixer using
 mux_assignment
Message-ID: <ef6f4d360c2fe682ab65f83cccbe5be66ccc6296.1703444932.git.g@b4.vu>
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

Currently the presence of a mixer is determined by checking if the
device uses the GEN_3A config set. Add scarlett2_has_mixer() function
which checks for the presence of mux_assignment entries instead.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 95a9b5c41b3d..fc9f360d0e1e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1680,6 +1680,12 @@ static int scarlett2_usb_get_volume_status(
 				 buf, sizeof(*buf));
 }
 
+/* Return true if the device has a mixer that we can control */
+static int scarlett2_has_mixer(struct scarlett2_data *private)
+{
+	return !!private->info->mux_assignment[0][0].count;
+}
+
 /* Send a USB message to get the volumes for all inputs of one mix
  * and put the values into private->mix[]
  */
@@ -2175,7 +2181,7 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting sync status */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
@@ -4111,7 +4117,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting levels */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_meter_ctl,
@@ -4516,7 +4522,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* the rest of the configuration is for devices with a mixer */
-	if (info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	if (scarlett2_has_config_item(private,
-- 
2.43.0

