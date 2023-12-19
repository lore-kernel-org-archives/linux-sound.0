Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85E37864
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="J40YY9LR"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3DAD0604B9F7; Wed, 20 Dec 2023 04:07:21 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3DAD0604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007441; bh=UPNbemMDS4lDUP7V/e0nZI2I2ad47Wkcxstixw5X+Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J40YY9LRwCJPGApJEpHdQEhpI3svsHm+iZXZ65R5cUmPvpQpsnKs5HSoh3Gi+dVc3
	 vi97nhwn/8PFD4d4dJ92ylslHyLe/mLU0Cno6DwFSRrvOmVPz0D3JajAGKihthSf19
	 d1Wd2P9YYhtHa4sHVkd04I/QFD5Q1N0O/eomZEySqzJoTBnix+/IkvwNLrn+027Puk
	 o7wXGk+2HtAuBrT8cKtMuFg3IXWmTiJMkfG0xxuXJ0+l3LKGA9h6DsTMtwhabWY2OX
	 Wc+HpHDRv3sjjvBeDsy5T4nJflAanRYDi+jpqYbVs9bNxL57MCf84h1CIGYYypIeyv
	 1X83Dfnk905Rw==
Date: Wed, 20 Dec 2023 04:07:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 03/11] ALSA: scarlett2: Add missing error check to
 scarlett2_usb_set_config()
Message-ID: <def110c5c31dbdf0a7414d258838a0a31c0fab67.1703001053.git.g@b4.vu>
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

scarlett2_usb_set_config() calls scarlett2_usb_get() but was not
checking the result. Return the error if it fails rather than
continuing with an invalid value.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e15fae6c51a ("ALSA: usb-audio: scarlett2: Allow bit-level access to config")
---
 sound/usb/mixer_scarlett2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a0ba53372f7b..22285d8038c1 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1577,7 +1577,10 @@ static int scarlett2_usb_set_config(
 		size = 1;
 		offset = config_item->offset;
 
-		scarlett2_usb_get(mixer, offset, &tmp, 1);
+		err = scarlett2_usb_get(mixer, offset, &tmp, 1);
+		if (err < 0)
+			return err;
+
 		if (value)
 			tmp |= (1 << index);
 		else
-- 
2.43.0

