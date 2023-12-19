Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9E37D03
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="faHNPnoB"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 59CC3604B9F7; Wed, 20 Dec 2023 04:07:00 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 59CC3604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007420; bh=8ETulCIE9Z69wcqSdAOg8PPnM13gfiYjvR7IHw2Ie3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faHNPnoB6i6kSJXkV/pAFKVpIboUm0LoeTJRYsqr9OXWofxsLJn1SHa22hFq0tnnT
	 MrjzCx86UGM5/zjM7oTE+a6pdP7oRRUsOuGfeEncgBHQ5bc0LPGKujdVlNcJW4Eoel
	 +GyLuofT5vv/WukZdH+JhqMn9lINj80ByvrCVEgla5lQBnoahUZiI0PmbcLm2gqpCa
	 y6k0soNGslDdXgXMECZhzHat/rgA7vOPnFktH9sRzowChN2Fvbce9QgRuTHz9U179t
	 5a4dHApBLaXQDlL75ITrz7TxlKWYK2Ol+lqVbEhV3sIo7GtW9k8jaMmoOIfSjd4ZwM
	 V8/RuV0TH+ZWQ==
Date: Wed, 20 Dec 2023 04:07:00 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 02/11] ALSA: scarlett2: Add missing error check to
 scarlett2_config_save()
Message-ID: <bf0a15332d852d7825fa6da87d2a0d9c0b702053.1703001053.git.g@b4.vu>
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

scarlett2_config_save() was ignoring the return value from
scarlett2_usb(). As this function is not called from user-space we
can't return the error, so call usb_audio_err() instead.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
---
 sound/usb/mixer_scarlett2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a0dbdf921745..a0ba53372f7b 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1524,9 +1524,11 @@ static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 {
 	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
 
-	scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
-		      &req, sizeof(u32),
-		      NULL, 0);
+	int err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
+				&req, sizeof(u32),
+				NULL, 0);
+	if (err < 0)
+		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
 }
 
 /* Delayed work to save config */
-- 
2.43.0

