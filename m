Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99C1B4224
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149721; cv=none; b=Ox6629iyzgyHW0wz46gVQbBefTHpySS7MZlFdkX5TqauwuIdrpZM5WE9FMZiAkhOTkxVvqIv/VaJwS3gN4aULJNcUo+3vVSKL01EH0yKwc3j8SngijCsq0YLsvt+YPQd+eEJTTB4XlMr//v3IktY1WyQJEIYhDLKpC47e+ou4xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149721; c=relaxed/simple;
	bh=wJhONnd1gthRh1vSV2WrodydiEmu0lO5DNHg5YLGXBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7lhITe/4RDl7GfBZUXNUFH1OofXyA6whVJTCF7l7OfpDt9mm80Zm36Tz7dhGVdp4FKVDsUzai/JelHjZMdI+0zwMjicE3Of2rUqDUU2MG33UR4wyi4i73dBNs8fFCIe/aYceom7QUpASeIFiT00jKYktSBBEeQOU3fixps6Wn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=LoiYc5dd; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="LoiYc5dd"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 32362604B9C3; Tue, 23 Jun 2026 02:59:04 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 32362604B9C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1782149344; bh=F19CF410ItpmxbQ6kWMCNPznDOKbf7aO1/s6LdTVfUQ=;
	h=Date:From:To:Cc:Subject:From;
	b=LoiYc5ddKe1MzoHBRQfjZmLnOnLRuPdsP6wlvaPLL4c6eX5kGe/mLs7vhSErPb9lF
	 rzMR/87XVKD3FXD/fJkgSkeUjIQMTbyYL44Cg67cN8qqGxj+P67MeGeSrMNHIBq/j9
	 +/6zMsUtJfcHlscqQx4QKkhNYs4HHGNLloeGUfoX92iwUoIPhgTJPVp/0BO3kVTq8l
	 1ShK7wTDLIy4J5ypxhQ47j+E2gU7NpO4NxeQMLKB/r28nUlTQjmT3V9f/4ME8B/6o7
	 mefn6NtBeABlgiHEmo+L+gBQM4BD4S/RVqD6N+xxdCQsvidWbYTPlBziIRSkF4e/s2
	 6RNYwM7rcBDgg==
Date: Tue, 23 Jun 2026 02:59:04 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: FCP: Add Focusrite ISA C8X support
Message-ID: <ajlw4HK+2RSW3nUl@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add USB PID 0x821e to the list of devices handled by the Focusrite
Control Protocol (FCP) driver.

Cc: stable@vger.kernel.org
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
Trivial new-device enablement: the ISA C8X uses the same FCP control
interface as the Scarlett 16i16/18i16/18i20 4th Gen, so only the USB
PID needs adding. Device attach and device-map retrieval confirmed on
a pre-production unit.

 sound/usb/mixer_quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ec65e8a71919..c89087321173 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4449,6 +4449,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x821b): /* Focusrite Scarlett 16i16 4th Gen */
 	case USB_ID(0x1235, 0x821c): /* Focusrite Scarlett 18i16 4th Gen */
 	case USB_ID(0x1235, 0x821d): /* Focusrite Scarlett 18i20 4th Gen */
+	case USB_ID(0x1235, 0x821e): /* Focusrite ISA C8X */
 		err = snd_fcp_init(mixer);
 		break;
 
-- 
2.54.0

