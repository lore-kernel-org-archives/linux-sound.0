Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F218C31
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735512207; cv=none; b=UpJ90jqNuL642E5eo+M10b0kK6WzyzhMi1wGTDlHnGZn1zuf1sh8xuikRBtHoFhrhu4MN3xOZsmQCGFZzOAYT3woaxntxvlp1FPcaPOiqgsZl0QRHf+F8eAShtVBMjc26vxidlLmiLS0BEZJlEJKRbckSmBZ/5th23dQIPEh9gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735512207; c=relaxed/simple;
	bh=g9Y4M4s0GQu3ILho+7yEbrkac3+uwhE+ELeQ84R+Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/xPdyoMr8wvjqP/lkv1SfUCIupOLJS48ErxMghG9rHf8o6k9YpsNCqLMg706X7mo9cgT93mU3SFfqZVeEuTBsrmBwMhsMeY96slTXJwjEpMUA5/RUY0Su2j5VOcRRWcqv2T20pSiD7QRZ9kdrvzeY5eD+YN72VmsR0vkIHkX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Fiil2SxH; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Fiil2SxH"
Received: by m.b4.vu (Postfix, from userid 1000)
	id A6D336474951; Mon, 30 Dec 2024 09:13:23 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu A6D336474951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735512203; bh=I1c8cQW2h3IyL5mebxUFKL+d9rNVnhw0SGdH19EqGzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fiil2SxH5uh1Ojj45uKJg1sjH+9WXy5UByd6ia3rwKysHESoBC3Rgk0a3czQYbGD6
	 rXf4DgztLkZv6QStecLeJnvU0PFXt2H6YmnNj48LTcuhDi4iEloEMxB2Ulpc1TkvlG
	 G0EvfIuGwmK1VoPi23pfvph7TrWOX2HFKfnA5TCdn3WXzYwAWq+RuPWqXP4KUnAWJH
	 9PJrcaPcc1Tw8YFrcBAHEAtnQJGKgk7kXP9T4R+kZqvWtUHxc5bdIhO+cnQ84P6Mt2
	 zW/dARiCAJUDSiz8i29JMbFFRuefkfTsMumhndqE1zYcoaI0+xkkzUMnP8fpF2cN3h
	 lmwMY0kmw/MrA==
Date: Mon, 30 Dec 2024 09:13:23 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC PATCH v2 2/2] ALSA: scarlett2: Add device_setup option to use
 FCP driver
Message-ID: <a9a548d22a755e7c0d9df0a3e3b423a83857ab48.1735495639.git.g@b4.vu>
References: <cover.1735495639.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1735495639.git.g@b4.vu>

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

