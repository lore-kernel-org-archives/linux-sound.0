Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C142D287
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="l1ROG/z+"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 1A785604B9CB; Mon, 25 Dec 2023 06:00:15 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 1A785604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446215; bh=8xi2vPYExE3qOuwPyc1YBuFNPQDSs+8oaJipBpVD3Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1ROG/z+/GdCf4PcKYtSh7FMaZHDBqZKTYcHfyMCMfoyi9V5BHR0+2qTAp4KbcbEG
	 2s5VwCVpaTKDDT053NkRSD1m6nrTWc9iQ0N8bAgt8M8iCAY8d290kMbX0A4FyKOoVY
	 tI31ALB30r+djq4Z8EJDb5++DEmIo7/rU/2Snl6Bz/NqmVU8NtvTahfDVDRrhEwgXW
	 ueDJ7XCDlLqEtKdLYkqHxz4YG+VVvgdJaAdA7CMooh5BAi5ta0G202/BmSeRogFgRn
	 YawIK6pDWbm6l9OxqALADaQ7yXK9bFyIIF346CO274dIUg3+O7oLj8gANg3SUik7gy
	 z/fxZuxrTRNqg==
Date: Mon, 25 Dec 2023 06:00:15 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 19/23] ALSA: scarlett2: Add scarlett2_mixer_value_to_db()
Message-ID: <7adf869852aba2819fddb850b0ea8df5f7d73931.1703444932.git.g@b4.vu>
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

Refactor scarlett2_usb_get_mix(), moving the scarlett2_mixer_values[]
lookup into scarlett2_mixer_value_to_db().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 24d7cc85cf04..efe95a25998b 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1763,6 +1763,19 @@ static int scarlett2_has_mixer(struct scarlett2_data *private)
 	return !!private->info->mux_assignment[0][0].count;
 }
 
+/* Map from mixer value to (db + 80) * 2
+ * (reverse of scarlett2_mixer_values[])
+ */
+static int scarlett2_mixer_value_to_db(int value)
+{
+	int i;
+
+	for (i = 0; i < SCARLETT2_MIXER_VALUE_COUNT; i++)
+		if (scarlett2_mixer_values[i] >= value)
+			return i;
+	return SCARLETT2_MIXER_MAX_VALUE;
+}
+
 /* Send a USB message to get the volumes for all inputs of one mix
  * and put the values into private->mix[]
  */
@@ -1772,7 +1785,7 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 	struct scarlett2_data *private = mixer->private_data;
 
 	int num_mixer_in = private->num_mix_in;
-	int err, i, j, k;
+	int err, i, j;
 
 	struct {
 		__le16 mix_num;
@@ -1790,16 +1803,9 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 	if (err < 0)
 		return err;
 
-	for (i = 0, j = mix_num * num_mixer_in; i < num_mixer_in; i++, j++) {
-		u16 mixer_value = le16_to_cpu(data[i]);
-
-		for (k = 0; k < SCARLETT2_MIXER_VALUE_COUNT; k++)
-			if (scarlett2_mixer_values[k] >= mixer_value)
-				break;
-		if (k == SCARLETT2_MIXER_VALUE_COUNT)
-			k = SCARLETT2_MIXER_MAX_VALUE;
-		private->mix[j] = k;
-	}
+	for (i = 0, j = mix_num * num_mixer_in; i < num_mixer_in; i++, j++)
+		private->mix[j] = scarlett2_mixer_value_to_db(
+			le16_to_cpu(data[i]));
 
 	return 0;
 }
-- 
2.43.0

