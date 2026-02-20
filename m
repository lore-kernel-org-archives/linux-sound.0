Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E632DC321
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603491; cv=none; b=jXtK2nMB45444gPKjBU7d72DbQzCiuGWXsprB9HvVYaUmoAEbOOuCm7DoNYjJUokYwr39ruPNk0u/sbpCe8pMYiNvpv6R5ro+NJOxVMCQ69ep0k57xQ4KKmPr3P/Z6gcsUwe0x56Re55MzVpr+OeMefIpAN1FVImXMbj0jdf4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603491; c=relaxed/simple;
	bh=fOVGa/HswoterHEuzM8is6Hdq3m/pKbkD8YQzMi0KnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHVfI9OzBgvcm+8uMI4DIgUIXf+rUaXjLsI2G0kxmfnAarr9v4s7Fa1fU1VIooTYGHEXQ8N6SPZcdEeluVNN4Nvsu0272l3eZmr1Be0T2sFXPUoNdyTczV58HFc6cBfC2vW68YM9kKTRM7FCsVrqSdTEYWv3MYwEl5/cx7SGky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=nDjOdisV; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="nDjOdisV"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2AA056756E04; Sat, 21 Feb 2026 02:34:48 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2AA056756E04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771603488; bh=BDyAMqNYsgbP/cHLV39jiuEuWAn6nAWP9BVRYz8/WBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDjOdisVlxcz/ddnAcnNiNHbMFA5bmnG0kI8bmoIizRV2IpnKzsLqVa3xNA9VB+jg
	 XH9EnLPeto439n5AvK6e3KPo7LHsYwfAl+tNjtfEvPWinVUCzhJLADd85PzrJ6uX1R
	 IiiZN+RKZfse6AYXTpDYcq296WmhUarEJfrvRjsvx3pJZ8WGf/qLXjy3ZI2KpEN9PX
	 LSWWQ7Drv1lNsaxIXq35FnTVtq/dthvpEWcaS2JCmE7UFW4ZHQX8iIqTHUmXZXiAO5
	 YOVeZvYIyVYTzYexd0OT3UKzmjI2HYpYEpWuayYG9+6ccpPKcf6UYnDEcMuXXoutqC
	 ULbvx+ql8tDog==
Date: Sat, 21 Feb 2026 02:34:48 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>, Tina Wuest <tina@wuest.me>
Subject: [PATCH 2/4] ALSA: usb-audio: Remove VALIDATE_RATES quirk for
 Focusrite devices
Message-ID: <09b9c012024c998c4ca14bd876ef0dce0d0b6101.1771594828.git.g@b4.vu>
References: <cover.1771594828.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1771594828.git.g@b4.vu>

Remove QUIRK_FLAG_VALIDATE_RATES for Focusrite. With the previous
commit, focusrite_valid_sample_rate() produces correct rate tables
without USB probing.

QUIRK_FLAG_VALIDATE_RATES sends SET_CUR requests for each rate (~25ms
each) and leaves the device at 192kHz. This is a problem because that
rate: 1) disables the internal mixer, so outputs are silent until an
application opens the PCM and sets a lower rate, and 2) the Air and
Safe modes get disabled.

Fixes: 5963e5262180 ("ALSA: usb-audio: Enable rate validation for Scarlett devices")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 17e49617218b..3e6ade7ded92 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2424,7 +2424,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
-		   QUIRK_FLAG_VALIDATE_RATES),
+		   0),
 	VENDOR_FLG(0x1511, /* AURALiC */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x152a, /* Thesycon devices */
-- 
2.53.0

