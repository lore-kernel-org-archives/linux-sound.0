Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF7153808
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049681; cv=none; b=o2Sg56RyM5J5eyIWxbcRqePz7HDRkh/hvnQlM51734/6ZiTj/osLt8pcu8C0utbof5chijD2VV/JxWJJxn/JEBLg8cgdAwUcfXKPzokpIHCpIm8ScolHyHuEdoRR2Lpk0/p8o5M4i0GKIcxKjziyosLFe7SnIDN0J0boCQHwPHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049681; c=relaxed/simple;
	bh=g9Y4M4s0GQu3ILho+7yEbrkac3+uwhE+ELeQ84R+Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA184ySOzXxqfK+A5gVAiubwGOJXLLOvd8zhdTJyVlIWNHN4i3hB9F6YnWc5BtENaU0+0GEqM0oMS5AE/zqyRXrtBVI/oFzuTtstkQ4ZAMhPK/UlSaobbk9kyx5XO4RG7YXqFPgTsIGZlkSx5hrFxHWBQkStOaq23I2qLLBYcXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=GFV88ERf; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="GFV88ERf"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 20E8164A5801; Fri, 17 Jan 2025 04:17:58 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 20E8164A5801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1737049678; bh=I1c8cQW2h3IyL5mebxUFKL+d9rNVnhw0SGdH19EqGzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFV88ERf8hJsuaI5Lhw7w8DGAAdosJmaM7xbUulFNIKEHc8CeirDPbAl1GxyQwhIM
	 5OjQh866wQSwURFaB7w0QbAgAeOZ+I75KNUKUHeqnosOF3myu6/oeClbmaBn4xevht
	 yripOog8yru49iMeNq5drNwkZInTQPX877VNuWXnsBf0vABAwD/EnR2XMKl+gYrSqe
	 LRypg0gdMfGqrUp9h2bZ+eoGWUAFvr2mJoqAETgQhROGASVZlJIKiRwTGrWnHid14W
	 Qx8YQ1MsfSox3nl9UDid7HFma2PnJP5RRD3wqOZ8iQITRtu7x9WWgsZFeIaZErBXv5
	 gUzrE9srofIrg==
Date: Fri, 17 Jan 2025 04:17:58 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v8 2/2] ALSA: scarlett2: Add device_setup option to use FCP
 driver
Message-ID: <94ffd7971d73cb0cbea6933b28f7528ce5b9edde.1737048528.git.g@b4.vu>
References: <cover.1737048528.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737048528.git.g@b4.vu>

Add a new device_setup option (SCARLETT2_USE_FCP_DRIVER = 0x08) that
allows users to opt in to using the new FCP driver instead of the
existing scarlett2 driver for their device. This provides a way to
test the new FCP driver on existing supported hardware while keeping
the Scarlett2 driver as the default.

When the SCARLETT2_USE_FCP_DRIVER bit is set in device_setup, the
scarlett2 driver initialisation will hand off to the FCP driver
instead of proceeding with its own initialisation. The FCP driver then
provides access to the device via its hwdep interface.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 7f595c1752a5..288d22e6a0b2 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -166,6 +166,7 @@
 #include "helper.h"
 
 #include "mixer_scarlett2.h"
+#include "fcp.h"
 
 /* device_setup value to allow turning MSD mode back on */
 #define SCARLETT2_MSD_ENABLE 0x02
@@ -173,6 +174,9 @@
 /* device_setup value to disable this mixer driver */
 #define SCARLETT2_DISABLE 0x04
 
+/* device_setup value to use the FCP driver instead */
+#define SCARLETT2_USE_FCP_DRIVER 0x08
+
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
 
@@ -9702,6 +9706,10 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 	if (!mixer->protocol)
 		return 0;
 
+	/* check if the user wants to use the FCP driver instead */
+	if (chip->setup & SCARLETT2_USE_FCP_DRIVER)
+		return snd_fcp_init(mixer);
+
 	/* find entry in scarlett2_devices */
 	entry = get_scarlett2_device_entry(mixer);
 	if (!entry) {
-- 
2.45.0

