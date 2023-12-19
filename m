Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE307374F8
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="dndQ2jbx"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C4771604B9F7; Wed, 20 Dec 2023 04:07:52 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C4771604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007472; bh=MhoIaixpik1iUNQTcsUyfLxvHJVzpPig+kV+sgoyrFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dndQ2jbxuzrpogsvzNNG1rKGRTJVLQ+bk1KG4wUT0CwmXAhvvOHsrJ1o2fbr/jp/H
	 xFqv2k/7SMQQ7St6iunL7OyEvOzTP5K918cV1e47/RHs8cVb/6BrFl65qs/DhXsDTz
	 mm9qZhZyxAWpaWizhkM/A7lrPqwawQifWfi1Cu1s6I706rB4nAn57vtLT/el+5GvBC
	 OmlcrJhq8wcNU2gwER6r6Js6Rn/ISWNKVeXz6vuUdW1H8F/ejD2KH+W7+zBeOKfEMY
	 6cF76oOA6X91eouHojc186I5vHnKAGh9VD6O+g30TZ5XHBhJnqEPwucSe5OF69CI3L
	 NwCtgr0sS4gLw==
Date: Wed, 20 Dec 2023 04:07:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 05/11] ALSA: scarlett2: Add clamp() in
 scarlett2_mixer_ctl_put()
Message-ID: <3b19fb3da641b587749b85fe1daa1b4e696c0c1b.1703001053.git.g@b4.vu>
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

Ensure the value passed to scarlett2_mixer_ctl_put() is between 0 and
SCARLETT2_MIXER_MAX_VALUE so we don't attempt to access outside
scarlett2_mixer_values[].

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
---
 sound/usb/mixer_scarlett2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 373911937487..f1636a1614da 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3663,7 +3663,8 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	mutex_lock(&private->data_mutex);
 
 	oval = private->mix[index];
-	val = ucontrol->value.integer.value[0];
+	val = clamp(ucontrol->value.integer.value[0],
+		    0L, (long)SCARLETT2_MIXER_MAX_VALUE);
 	num_mixer_in = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
 	mix_num = index / num_mixer_in;
 
-- 
2.43.0

