Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5330E0D6
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 05:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021817; cv=none; b=mbQLgkThdqpAMTC+GtzrieWxvK753ndtryANvPEcq1XAjGeX8qSxepv7VQbAsLY/ohQOpMWi81tFHv6OhKHR2Uic9KaF17KJgnu15PfJv2F9Y6eSDluKcqz1VsS/5J4DbrtbrRHLMib1poWbRwjLDZ5EFq9xiip2HhgAR5UvuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021817; c=relaxed/simple;
	bh=bM4WDRvFFZO+gIepU6CVhz2HM3v0G786oa+tC1LnSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXushGfxMKKji24Oq7uK0169qfgn8aVD45tIizksRSWXlYhIyjJ4DWsUNqTWk/nxk3bYoZsYB6Zo6LTg5dehknHU2c95iJP6lgqpkWENrkeJ+AT2LNDhtqaaVB0E+bC7yUgwWiJBilFd521k4pAqYvaxXRSTRtylofMjJHjbDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=oWpO/ytn; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="oWpO/ytn"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6DAD8679939B; Wed,  1 Apr 2026 16:01:27 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6DAD8679939B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1775021487; bh=VKMXMZQ+c4RrE0PRdpS/FY31x0cluJurwwuQ7myi0h4=;
	h=Date:From:To:Cc:Subject:From;
	b=oWpO/ytnbZkDkF/9jPSBCJiLnR5V42pMvJGKoL2VEnb/8snUo/4q7BWXjRquIM1eC
	 R8XnZIkOzC9OUJUn5VETfOZgbuaXOWjqLorThuFIDndw3Pjh9FdahcOgA3ni75S/Ij
	 rqdnlqQyEfaf/WuupsxMrJKkhretv3U0KhO8YyDqhtIF2xpd/JcgV5ze/gs0DVL+lO
	 aws0ty1asBvpusdqoho9I++U1HJSGgLF/cxP2pMTK8bplvraH7sdfGLp5tFWPlp1hr
	 /P9rpLFw2SpKFaAeJhVW4F2k1UInn1C91huMcs20hDvMp0G9rVYJZgdWfrXrDyl5ud
	 lnwTzWVONjBqw==
Date: Wed, 1 Apr 2026 16:01:27 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen (8016) from
 SKIP_IFACE_SETUP
Message-ID: <acytr8aEUba4VXmZ@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Same issue as the other 1st Gen Scarletts: QUIRK_FLAG_SKIP_IFACE_SETUP
causes distorted audio on this revision of the Scarlett 2i2 1st Gen
(1235:8016).

Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
Reported-by: lukas-reineke [https://github.com/geoffreybennett/linux-fcp/issues/54]
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4bed7d877d93..9ff9b6e306c1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2425,6 +2425,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_VALIDATE_RATES),
 	DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
+	DEVICE_FLG(0x1235, 0x8016, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),
-- 
2.53.0

