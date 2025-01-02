Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D291957FF
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 22:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735857527; cv=none; b=IbqqL+u9PEvcvCszE4OyxBdKzhn2ZCbxb3a3GHDekOkkjNrLy5CAl/VjAgryBbs4Pq8YbSzAZ2yAkDfiy2/J0eiOxoH/ykyrVvNRXHHtotYVn9/9Yco0F/WOkbc6xq9GdozHU8mMxY/bVwVKuMVfIWvZq2eK//lmWkxT67gqWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735857527; c=relaxed/simple;
	bh=g9Y4M4s0GQu3ILho+7yEbrkac3+uwhE+ELeQ84R+Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c722L8oOFc6O7lsn2pXjykcaaFw4Tvs/50ffTAuTDjHvABbbeB1utzJvEpF6ivAPBzemr51tBSeW9ODNJ77ztskDptO4HAYkicUW7RxsolOKcp6OLPUqo+9D0+V71n7V/VEMCGOgJyzyXc5USFHe9ZwnShJI6Ky0u9ReGYJAwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=prcaJYZz; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="prcaJYZz"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 649CF646FC16; Fri,  3 Jan 2025 09:08:43 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 649CF646FC16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735857523; bh=I1c8cQW2h3IyL5mebxUFKL+d9rNVnhw0SGdH19EqGzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prcaJYZz6ZXCKrrV+r4Ft/7wvWBrl81c1KFQrAzjuLTKULiVE3AMbmaLTe0uTVyEz
	 we8z/MM9A7DVEu7kalb7uB6nLVy6fGfzuLG+7Bf83c9wIEvvpk1QYduZ/FA02eIFt2
	 mCRheSJgsk1nRe9sUeexB7KErsolZlxobKdEdbC3n9W/GojmjVRo3aNmQoU3zveWNO
	 loRaOtmECQm5wNzlpQZOk+y842kh1JWWSmcyXwXVQJJDSjKAEKS6w0mthfDYdCD6Uw
	 MZOn5Dp6RUNGy1X/hVr8htwdMolAZ1R3h+RHs1qWpn9SQWAzXAa9eQIfW9pqM/ngS5
	 0jUJvO41LSWDQ==
Date: Fri, 3 Jan 2025 09:08:43 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v3 2/2] ALSA: scarlett2: Add device_setup option to use FCP
 driver
Message-ID: <459bee7309fa2784d1f6d9f77f60b4bf64a6c6f7.1735855597.git.g@b4.vu>
References: <cover.1735855597.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1735855597.git.g@b4.vu>

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

