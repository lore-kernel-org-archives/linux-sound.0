Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44752D2F0
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="lcY1Seh/"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5B978604B9CB; Mon, 25 Dec 2023 05:51:56 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5B978604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445716; bh=OY/9fOdaQOzNy9mF7EvxrQBR6hsz3YCcaEvGqBUeKN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcY1Seh/OVvZKqbGGV2vt2H3Oz0RKbiNax2CmWnhgV1DVDQdvTvcVAixHKA86OTUC
	 JGbcxlh/aYJ/O101wgfG7voj9zF3pbx3XHy2K/WZwCR/q4JiEAOP+rPBFQGAvI8TgC
	 I7h6arSRHuYZai/31z5H0xiNYRIYxfFCbN7cYTZsqZOW/+i0TdcnYNLMV2veNTfCxt
	 mEizapYzI3CXv2Xkr7Axc//s7Xstv4VMGajX5GbZGpmUN+Ieq2MBTEjgTPL9kkbmST
	 Pa3g8L1WAtQZ+BV4eKYCitDmZBhDtZVp1irgUk8UzQbGRv9XP/2ZFVOwG9QsBAYmFy
	 HmaKLwT5MXxDA==
Date: Mon, 25 Dec 2023 05:51:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 04/23] ALSA: scarlett2: Check for phantom persistence config
 item
Message-ID: <3ccaf8069280827bd6c44f103fcb770bd50b7e2e.1703444932.git.g@b4.vu>
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

Allow for the phantom persistence config item to not exist. This is
needed for the Scarlett Gen 4 series.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 88571abd4a8d..95a9b5c41b3d 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2621,11 +2621,15 @@ static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 
-		err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
-			1, &private->phantom_persistence);
-		if (err < 0)
-			return err;
+		if (scarlett2_has_config_item(
+				private,
+				SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
+			err = scarlett2_usb_get_config(
+				mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+				1, &private->phantom_persistence);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	return 0;
@@ -3779,7 +3783,9 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 				return err;
 		}
 	}
-	if (info->phantom_count) {
+	if (info->phantom_count &&
+	    scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_phantom_persistence_ctl, 0, 1,
 			"Phantom Power Persistence Capture Switch", NULL);
-- 
2.43.0

