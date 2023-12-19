Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC737D00
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="oT6NOiH7"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5CB6D604B9F7; Wed, 20 Dec 2023 04:08:09 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5CB6D604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007489; bh=7GVO3MNMTMsgTji6rIpd6tjr7bcMr8xM2wntNzv+XCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oT6NOiH7qkCP5Ea27LIagVg1gtBMTTHvX0ojS716+ZvMAlTdvHCoWdmNoB/W06Ksx
	 uqb3TYrYmkSNgd3dnCFlbMNYTA2ujK3FVrUpxqWwTccbPapdYovQMbfui+zOs9do+Q
	 u+1URU3/Su+fctIP3uy4rVqV7qxWmhnvXjwHoqg9leZ2FkTZzwPtcqw0iU8EiIuJ2j
	 Uh0UBl1mE7ji5b0dxNiUQW4yDNk97ZS+v8XcfaTJxbXrWii2YpTflPG8ksgXGM5zwS
	 vA83ZSWRAbrfBtDyTlH9dASS8tY2e0WKhxpqqXqal9muo5b36slVjCLvEUermz6QWE
	 R95dXIHBdYnjw==
Date: Wed, 20 Dec 2023 04:08:09 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 06/11] ALSA: scarlett2: Add missing mutex lock around get
 meter levels
Message-ID: <77e093c27402c83d0730681448fa4f57583349dd.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>

As scarlett2_meter_ctl_get() uses meter_level_map[], the data_mutex
should be locked while accessing it.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 2b17abb0dec4 ("ALSA: scarlett2: Remap Level Meter values")
---
 sound/usb/mixer_scarlett2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f1636a1614da..73f5badceb19 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3880,10 +3880,12 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 	u16 meter_levels[SCARLETT2_MAX_METERS];
 	int i, err;
 
+	mutex_lock(&private->data_mutex);
+
 	err = scarlett2_usb_get_meter_levels(elem->head.mixer, elem->channels,
 					     meter_levels);
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	/* copy & translate from meter_levels[] using meter_level_map[] */
 	for (i = 0; i < elem->channels; i++) {
@@ -3898,7 +3900,10 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 		ucontrol->value.integer.value[i] = value;
 	}
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+
+	return err;
 }
 
 static const struct snd_kcontrol_new scarlett2_meter_ctl = {
-- 
2.43.0

