Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A45D2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="rrEDg5uC"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 76BD5604B9CB; Mon, 25 Dec 2023 05:51:40 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 76BD5604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445700; bh=yUrs2QYAjQLNJwKFAZmVirh9QQKRH6ig6PgoW1Liv7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrEDg5uCVecyaszp92hBu0lr9XuBEhlv2tMFqPYTQhfzLkCTLNTlYadP0Rqf61PYM
	 Up/GAt3QwnZtFeSnnbxyMOfkSf8pO5d5TGl+HyYHuXQtzhfj4TQGCz/79/JnAAcyql
	 VtFM6t2dNOKodq3rmSJRfI+LF8rBPAWh5k4OYDyOdQlYUQtyAA55x3+hdSx7qH60+E
	 X1okV8Sg2pUnwK+RN/RIeZ5e/ijUMyhhRWzo93sSsGSFQ2nBh+M4jaVbiK5zzsEhvE
	 vGgrVStzk1sjoRbJ7A3B7WocKu4ygCErhgJnZDO5hrBCIC/WtQ8r/4fccf3nPn8vNM
	 mqZTYiqnGb5xA==
Date: Mon, 25 Dec 2023 05:51:40 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 03/23] ALSA: scarlett2: Infer standalone switch from config
 items
Message-ID: <59c30885b02d65feaab2c338cf46889d72d01813.1703444932.git.g@b4.vu>
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

Rather than assuming the standalone switch is present for all devices
with a mixer, instead check for the presence of the
SCARLETT2_CONFIG_STANDALONE_SWITCH config item.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 85a93dd0f354..88571abd4a8d 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -4244,7 +4244,8 @@ static int scarlett2_add_standalone_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_STANDALONE_SWITCH))
 		return 0;
 
 	/* Add standalone control */
@@ -4512,11 +4513,14 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_STANDALONE_SWITCH,
-		1, &private->standalone_switch);
-	if (err < 0)
-		return err;
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_STANDALONE_SWITCH)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_STANDALONE_SWITCH,
+			1, &private->standalone_switch);
+		if (err < 0)
+			return err;
+	}
 
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
-- 
2.43.0

