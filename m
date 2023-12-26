Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D34FF64
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="V7tJabgZ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 00CCC604B91E; Wed, 27 Dec 2023 04:36:13 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 00CCC604B91E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613974; bh=Kn0IOVuTt5Mu54Isu5It4H+0HpxpwDHS0VehW1SSnAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7tJabgZyXTAA8tvMZLHn+uUz61HwAgvJaI6eTOWGeVDfkTVy0jgBgcbTgFwHmgJK
	 ZPvGUIrRXYrBCX4cQ5SMoFH9+rmxdccuvGcUuXvhXojD3J7FVrMm50CgoyXYxAZDS1
	 y2OWhCcfJS+w/zeyzKaACQ9Xu2jXkZ778SMl23QfpqAk8NbY5B6pQJIu18NM/c+uZN
	 qRiZGPzZ7YmpGgHusrl6ay5bNBp2Zx6av2XSx2+qsgUPP10Z4NgZQHRXsRoc3jjyFd
	 dsaYTYKrhHpJhoTtLx8sSquOdovFM7dBi1ogMSRJLMMQLhGdQt8OcK7Hye6h+ZIsWS
	 NvC48kxb/N+9g==
Date: Wed, 27 Dec 2023 04:36:13 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 02/20] ALSA: scarlett2: Remove repeated elem->head.mixer
 references
Message-ID: <b21bacf4056366e10e01077e224d2b4970fdfe31.1703612638.git.g@b4.vu>
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

Use a local variable *mixer rather than repeating elem->header.mixer
in scarlett2_direct_monitor_ctl_get() and scarlett2_meter_ctl_get().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index e5d8543f9686..10260666811f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3927,7 +3927,7 @@ static int scarlett2_direct_monitor_ctl_get(
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct scarlett2_data *private = mixer->private_data;
 	int err = 0;
 
 	mutex_lock(&private->data_mutex);
@@ -4191,7 +4191,8 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
 	u8 *meter_level_map = private->meter_level_map;
 	u16 meter_levels[SCARLETT2_MAX_METERS];
 	int i, err;
@@ -4203,7 +4204,7 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	err = scarlett2_usb_get_meter_levels(elem->head.mixer, elem->channels,
+	err = scarlett2_usb_get_meter_levels(mixer, elem->channels,
 					     meter_levels);
 	if (err < 0)
 		goto unlock;
-- 
2.43.0

