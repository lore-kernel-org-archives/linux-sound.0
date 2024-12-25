Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34513B2A5
	for <linux-sound@vger.kernel.org>; Wed, 25 Dec 2024 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735161818; cv=none; b=NnJf+oDUbrbmrBqehneHI39nrc2ZjjMAOAlMAQOcrNTwTRcS5trn/tTToX//NSuCiaq3VU6qYkXbvYBAhNMyqnTCI6R3UrYU3ro53bO3d8CgVGa6LGWFdwtCBQQqCff+6sRY0o8nx66q+WQyIfQYgfn5/wG+syWlDa6YDfloJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735161818; c=relaxed/simple;
	bh=g9Y4M4s0GQu3ILho+7yEbrkac3+uwhE+ELeQ84R+Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5eA7Mfj+/u4H1a2NfQPj1AkUC+o1fCMbE80wNNdVhLUgo3cxXi5LGTWj8GBgMOlzYcQAyMzqATVwnYh4EVm4NEEDjb5tRk487kEaiiYdgH66LusACoYJb5VTBKg7YT9qMdgDCGF0J8NaY/+ubmmLL8SzpyTJc16zJaBMqK6qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=w4C11gbp; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="w4C11gbp"
Received: by m.b4.vu (Postfix, from userid 1000)
	id A5964646FC0A; Thu, 26 Dec 2024 07:53:33 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu A5964646FC0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735161813; bh=I1c8cQW2h3IyL5mebxUFKL+d9rNVnhw0SGdH19EqGzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w4C11gbpxJvN75AdZwULHWIThP+XVHu7tzHOmZzH+aQXpl9Vq29CRZca49O6Ojc7+
	 IIF6S/TSep9KIv4fr5oDxPhzmG4wpEgrBo7KKCkTpeJxI4yrh+oC1ncrby5CGQipNb
	 INZSwt8eMblPdEtwWM0vwJaYpu+gzQookzfCj3tby+B6Cp52GeF8s/wr+O+wpt2TUv
	 67uw8ekE/2vXRNhF6fgdlr9D+zCpb4924yFfcO7p+l2w6u1WJQY9XcJHJyIcCUfL95
	 bQFzkjf8OZ9RraohnjbGZzaUXWT6rPYcboR6HreXAySz3X29JhSkQQhDdDIMNI2bta
	 PKts+fFkkHC7w==
Date: Thu, 26 Dec 2024 07:53:33 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: scarlett2: Add device_setup option to use FCP
 driver
Message-ID: <e4367eb7ba84dd12612d8133752787c2bcf224be.1735159288.git.g@b4.vu>
References: <cover.1735159288.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1735159288.git.g@b4.vu>

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

