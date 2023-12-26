Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6614F1FC
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="SVNtt5gl"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 54E12604B9CB; Wed, 27 Dec 2023 03:06:48 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 54E12604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703608608; bh=lw38JxEpwQ6BWXqQ1OvJjzUMSN6WzrpHhgBSO0P5B3s=;
	h=Date:From:To:Cc:Subject:From;
	b=SVNtt5gl5XQqK060dXq3yjU0Q5poL8GDTkjvOyE11CGmJBs4pkjVhMAtZbZffdK9/
	 MtsEDZqSGZw+NGigUpt8Dx8D5hRaEkjGtoUB2hKU3OLLcyQnnIvgcN+jHSDeGQ4ZKt
	 LsUkZZYwHUG5VjiXPuiXrXJuK5Ihvk7egbD5BNifA5CB0jw+ZuI3qDtSjQOBa+rDHR
	 4ublx4134kGoRJ4r9tLQAQUc4pv2QPkwRHnJ22wA4DQN0JI3Cb0Pmi7PoAdxpxipkn
	 KEJmgV9/OBbvmhr249Q772UtRnGRI68u0cGMYzsDi9RtyM4aEENPYA/o4iB60wZGo2
	 lNooF6RT2Djnw==
Date: Wed, 27 Dec 2023 03:06:48 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Convert meter levels from little-endian
Message-ID: <ZYsBIE3DSKdi4YC/@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add missing conversion from little-endian data to CPU-endian in
scarlett2_usb_get_meter_levels().

Fixes: 3473185f31df ("ALSA: scarlett2: Remap Level Meter values")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---

Hi Takashi,

Can you add this to 6.7-rc8 please.

Thanks,
Geoffrey.

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

