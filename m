Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1F4FF64
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="v6tRrik9"
Received: by m.b4.vu (Postfix, from userid 1000)
	id F376C604B910; Wed, 27 Dec 2023 04:36:00 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu F376C604B910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613961; bh=YFhRmMuCfu+4qMgL34kvxnxeON91cCmUlE73zbH2pJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v6tRrik9igi6yrbY196GKE3z1cWGu3K3jRgD1JJGW7FL2mYWmTl4W85PhSIP5b2V/
	 W10WEvwD6EeoCCaEnAgCk0c1/D6G23wQuHl5fnS+qkAdmEBmMxBHTzmv1gbQ4xuOew
	 In2dKHDG4Z8kreTJOOvEyjmY3Nxe0yL2jHf+p9zV2hMxQJ430JSh8UwcL95yq41lB8
	 kaI0PwehOW7+eXUnevp3DWk2Wt9PTS3DeIw749tftjjbhvRt7KLeVx+9tWIAl7zuIX
	 ExiC0Vd66OCJSYbrTxBm/nJqo1GSxkG4kL6ZpwkwgFm1qRQBo1wwYZQwzby4L+d0v6
	 V6Cf1SvCN6I7Q==
Date: Wed, 27 Dec 2023 04:36:00 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 01/20] ALSA: scarlett2: Convert meter levels from
 little-endian
Message-ID: <754919540c274b6f7e15b3e26b6f7136bccce4a4.1703612638.git.g@b4.vu>
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

Add missing conversion from little-endian data to CPU-endian in
scarlett2_usb_get_meter_levels().

Fixes: 3473185f31df ("ALSA: scarlett2: Remap Level Meter values")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index e25f004e50e4..e5d8543f9686 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2110,7 +2110,7 @@ static int scarlett2_usb_get_meter_levels(struct usb_mixer_interface *mixer,
 		__le16 num_meters;
 		__le32 magic;
 	} __packed req;
-	u32 resp[SCARLETT2_MAX_METERS];
+	__le32 resp[SCARLETT2_MAX_METERS];
 	int i, err;
 
 	req.pad = 0;
@@ -2123,7 +2123,7 @@ static int scarlett2_usb_get_meter_levels(struct usb_mixer_interface *mixer,
 
 	/* copy, convert to u16 */
 	for (i = 0; i < num_meters; i++)
-		levels[i] = resp[i];
+		levels[i] = le32_to_cpu(resp[i]);
 
 	return 0;
 }
-- 
2.43.0

