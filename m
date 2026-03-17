Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8316FC5
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773775961; cv=none; b=blgY+RwpwyjSmj497SHJ2ggm8ofcw8gFcUDbNx9OoRWI772gjufF8sdPS7TTAYHv2C2evo4ODJquSq/xcIFXF+FdUtdlY/7o/y9rk97qlEAGG41e+1aGgtEmiL6lf7JtVwzFRAvhXX8Jvp5e93ECaewTks9y4FzSPP6potnGXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773775961; c=relaxed/simple;
	bh=8clZLyoAbTgTzPuHrcgaMmpvyIV+9WdGByUMkw5fAkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+SyYQF0nlUXl2FXJknh7cYTW7tpFeUgPhuYofbOqx1xJiza5GNyXifOga9C67H+5q80yuzMU9yRHbhx0sXp8cpm2x6bDlf+q3Hhr5X+2CuTuafgJ5t2MJqn/rWnTmqttCJX1xHYBNZzywFmk6yyn5Fe44sU1aoPXukA3q6wLYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=LI/uXYkz; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="LI/uXYkz"
Received: by m.b4.vu (Postfix, from userid 1000)
	id BC5F3678F6BF; Wed, 18 Mar 2026 06:02:30 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BC5F3678F6BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1773775950; bh=KXSsEhmu8TeS8ODdP2whohSDvlB+fhiBLFvdtFvZ/p8=;
	h=Date:From:To:Cc:Subject:From;
	b=LI/uXYkz4SflAwRZYo+OizFUNnoTpWmUP35e6p9XOQq0fT8FKCqrmridG277R0PX0
	 sfI1xqrz+WY6cwKRbeuShVHLQGx6DDosYN5CbJv4Md4r0F3I1wc0zpOujp7utcORIN
	 B+gZrsR09IJP3K1UpzY4BIBYFvDH/OWlLEdxh0EI/2UUjmkYAJ1g/UZwbu8/8cjWaU
	 C0a1H5v6WISgm8lvaJL0wJJNWvChSVcH4aUym+6XxNWz3NA3q+lgF9BMLZONvB0btl
	 5gD6PVUlUJFwyRbYJu4ZK4JZCvvrG4r84L56DK607cvjf+qbft316RdoeC2jTzX4xF
	 C1GmTVa9omCWA==
Date: Wed, 18 Mar 2026 06:02:30 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen from
 SKIP_IFACE_SETUP
Message-ID: <abmsTjKmQMKbhYtK@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Focusrite Scarlett 2i2 1st Gen (1235:8006) produces
distorted/silent audio when QUIRK_FLAG_SKIP_IFACE_SETUP is active, as
that flag causes the feedback format to be detected as 17.15 instead
of 16.16.

Add a DEVICE_FLG entry for this device before the Focusrite VENDOR_FLG
entry so that it gets no quirk flags, overriding the vendor-wide
SKIP_IFACE_SETUP. This device doesn't have the internal mixer, Air, or
Safe modes that the quirk was designed to protect.

Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
Reported-by: pairomaniac [https://github.com/geoffreybennett/linux-fcp/issues/54]
Tested-by: pairomaniac [https://github.com/geoffreybennett/linux-fcp/issues/54]
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ffc08ee869ae..a28be9115440 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2423,6 +2423,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
+	DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),
-- 
2.53.0

