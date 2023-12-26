Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF35024C
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="OFov0hgU"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 04558604B4E1; Wed, 27 Dec 2023 04:37:19 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 04558604B4E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614039; bh=t3CmkI2+zSRKf48+Nc9cOEFrCdT4+wnmU51Dd9LF+ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFov0hgUcLcQr+zjDPbSAtGj+O9IVzpIqPyHNLjQnCF0zha/4q6CF8s0sbic7n0F8
	 KVuUPO4Sm72SQkRdQrUwR7r1Bw9xbK2Alkn+EQ7nC6HhT/t9cKvW85IAVfsob8xscN
	 IXOtvedfh6TTpmHUdKOdm6VhOVVpmpMi9e2ojVKsgMBiyw8T7OuL4qeVAf2v2kCM11
	 YZL5qW+I0mEZVqMIRZftYwX4dWH8JpK0cUhqXJRno9m5gVjN2/BPI6GSMg/aR1Tczm
	 aLHoxeWjUD85idOtxb56Ld/F6kOpbvwelKV3PQzIyskS/W1wMMJdarJ/lENl9vcKz3
	 27yU5RUWsq2dQ==
Date: Wed, 27 Dec 2023 04:37:18 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 08/20] ALSA: scarlett2: Minor refactor MSD mode check
Message-ID: <ab50939dca0fdc5fa3493fc8eee3a2fdefffa62d.1703612638.git.g@b4.vu>
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

Create local variable for storing private data pointer in
snd_scarlett2_controls_create(). It's currently only used for checking
msd_switch, but it will be used again.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a0212bda2b1a..ce2fb742dd97 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -5898,6 +5898,7 @@ static int snd_scarlett2_controls_create(
 	struct usb_mixer_interface *mixer,
 	const struct scarlett2_device_entry *entry)
 {
+	struct scarlett2_data *private;
 	int err;
 
 	/* Initialise private data */
@@ -5905,6 +5906,8 @@ static int snd_scarlett2_controls_create(
 	if (err < 0)
 		return err;
 
+	private = mixer->private_data;
+
 	/* Send proprietary USB initialisation sequence */
 	err = scarlett2_usb_init(mixer);
 	if (err < 0)
@@ -5931,7 +5934,7 @@ static int snd_scarlett2_controls_create(
 		return err;
 
 	/* If MSD mode is enabled, don't create any other controls */
-	if (((struct scarlett2_data *)mixer->private_data)->msd_switch)
+	if (private->msd_switch)
 		return 0;
 
 	/* Create the analogue output controls */
-- 
2.43.0

