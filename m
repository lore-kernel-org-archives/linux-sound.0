Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4ED50252
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="J1lPHZOm"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8648B604B1CF; Wed, 27 Dec 2023 04:38:20 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8648B604B1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614100; bh=/nCYWdi1vvF1IIWfuaJ62MNbSMcO4Sx2CAt6oLGyJ9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1lPHZOmkheMTys8trPG8VA22lqZ/twmF3VAOw81P2Rui0Tj/3xnc/kZ5YOLr39lQ
	 n2eIblxRd7jKJYPtMiH6bWE+zdU7gSgLfMuEOgeLZRzOrv0AasF/A97FZAZip0E7Sc
	 /8n9fP60PWAhZYvWPP/5OQ/EmZjZQ+5aVyNIcG2IorObEBZ/uVt9/iAza6eLk9SlnO
	 Mxsl2kWmkoRBqwjv26UpwICp88UoJr5Q4d3WcPdlKYYD0tOgUxvFyyNj568YwSbF4a
	 9dX/4Pnc99DB2yUbgm0mgcPoEj/mE24SWSyWUTMYgJThGrMeVRm43sDbakesUZaUgE
	 vkkbk+lStZzng==
Date: Wed, 27 Dec 2023 04:38:20 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/20] ALSA: scarlett2: Handle Gen 4 Direct Monitor mix
 updates
Message-ID: <713d032e343e0547212368919bef17d6fa1c9d29.1703612638.git.g@b4.vu>
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

When the Direct Monitor feature on the Scarlett 4th Gen Solo and 2i2
interfaces is used, the Mix A and B gains are updated by the
interface. This patch calls snd_ctl_notify() for the ALSA mix controls
when a Direct Monitor notification is received.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 391ecacbc768..50899e81e00e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -6285,11 +6285,23 @@ static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
+	int count = private->num_mix_in * private->num_mix_out;
+	int i;
 
 	private->direct_monitor_updated = 1;
 
 	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 		       &private->direct_monitor_ctl->id);
+
+	if (!scarlett2_has_mixer(private))
+		return;
+
+	private->mix_updated = 1;
+
+	/* Notify of change to the mix controls */
+	for (i = 0; i < count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->mix_ctls[i]->id);
 }
 
 /* Notify on power change */
-- 
2.43.0

