Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77D373BE0;
	Mon, 13 Apr 2026 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102150; cv=none; b=QlWKblRywyx1t3q+8Gh7BVxOqRhpi3otB1xNhOA1lzAjr/IJDUVpDARZqQ82JXkDJFmC1W+8cAOUNQISgvI4D1jswjhZi8pVDJrvqvjcZwnOWOF7MG1t6XOTWqyOzm9c8qVfhL7alDZ5LQc/w73NUkkYcZ3ohgXBGKcIZRXYr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102150; c=relaxed/simple;
	bh=aCtOSkxARDCtNUapZwaecA0l1s+EKJcRjjseK4SIRtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YU650LIchVPNeQJcRfXO1JO16bBxdvdeGRcS9YPlGAL9A/r4E/i5r/HITDbImn0T0AIG5BzwxWcWCnYlQ7xIXxf/yWfO0Su072zS71M/gDoX8R0HkK2CEnBMYd3J3+BcAm4ep8FPvFcIGsUysbi1u/WyWUSjiYJSrF9rnVdfucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=pD9R7D8c; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="pD9R7D8c"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8DA8A67B708B; Tue, 14 Apr 2026 03:03:00 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8DA8A67B708B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1776101580; bh=JIjvOD8KaZ6aHoSxHrdJ9YhtKxty0QYOcAAQqheHJwc=;
	h=Date:From:To:Cc:Subject:From;
	b=pD9R7D8cTDfIEn4iGv62wfMyfNteEMlT5E8sAfXtu722r8CnT2W9lWcADYzCP+/XC
	 f9Lu01CO4rfaYPtA5SrZ/twh7Y2jXKy8iTB4vwwR0ws2pWLAysGj99BhnSz9qaku7a
	 /IDPZ40xXNfsp/PeivDSldaC3ya+PAXtoNITooQ7VYy5iJi2+FccGqjDZQl33PwRjl
	 J6VoI07B6dRDNWxWalvOTyUTMjscZBvgqAyqp1VMct+z7ajumeI+NXbsQIjbIzyae8
	 6cRhfzCBuj3ZUslStpSU84qBO+YNqSNxLx15ij3zfAQJpBNbd3vNApMNwMvVynSCoo
	 GUysuUSK/7b8g==
Date: Tue, 14 Apr 2026 03:03:00 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Exclude Scarlett 18i20 1st Gen from
 SKIP_IFACE_SETUP
Message-ID: <ad0ozNnkcFrcjVQz@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Same issue as the other 1st Gen Scarletts: QUIRK_FLAG_SKIP_IFACE_SETUP
causes distorted audio on the Scarlett 18i20 1st Gen (1235:800c).

Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
Reported-by: tucktuckg00se [https://github.com/geoffreybennett/linux-fcp/issues/54]
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9ff9b6e306c1..6f8963b5374b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2425,6 +2425,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_VALIDATE_RATES),
 	DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
+	DEVICE_FLG(0x1235, 0x800c, 0), /* Focusrite Scarlett 18i20 1st Gen */
 	DEVICE_FLG(0x1235, 0x8016, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
-- 
2.53.0

