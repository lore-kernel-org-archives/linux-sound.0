Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BB36CE02
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265373; cv=none; b=iruZ3J9N7PDlrhbPiCART3RwuVIlnjDoDbweBcomuDQOxUsm0iYnxtMsmSmBYZHczES10GdCS5g/KJ5DhvKaHxGZwsA7EatAc7Kmi00adXvqQqP4clZ21z9Gxx9eB49Wej+8AXL8/Rkt8Vp4rOiNP26MlPIAnuYiw0ZZDIvN2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265373; c=relaxed/simple;
	bh=+8bDajk/HxSAnqwl8gG0znv5l8fs+dgn2aO/AFxkaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+BFqEndu3XkPIwEVvAViIJM9OTMhKcohe93vlXXf8MF1DDXagol6deBDgxEqwZi7hD7+kuRsJeOmGU1FO+XQ2FOuTCuuOF5gwpPiYnCICYk9K2y6r+X/HUtjdZAh1P4CsUlfV8OBC/HdYDjsaSViDqgCrEWhofwBHJe9sSZPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=BsNnQTcg; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="BsNnQTcg"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 8997C67A1212; Mon, 23 Mar 2026 21:59:21 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 8997C67A1212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1774265361; bh=rRuYIeDTyo5A0p5bbURJHZVuWVHNk9SDE1fl4qIW0UU=;
	h=Date:From:To:Cc:Subject:From;
	b=BsNnQTcgqQSiDxrdah8gMKcbvJRc9AC/XSNq5/bIBpcTqX2HkLhY8tS+BNcNnp1po
	 YW/llKy9+0Omn9NAihaUKKSFO1HsmDJhe97gTq7PaXpzzQKTYlLsx+F4BARAQmm9rJ
	 9k7ugsdjbeyQQszmuoCgAdcqrhSoiJje2FV0o/8M/S7NQO9vayFiAMnW3KG0N8mypt
	 agqm46RGRrieszWrG3g5+6ztVa6J0lSpX5vMABm1OfpQralTP5rWBYuiP/fo8gCpHk
	 XrAgu7veMTCBxHhk4jUkNCf3nhjryqBCKOJhOMIZPaSllATk4vNEhOtZgYoC0yngUL
	 oE9nzle/ojBbg==
Date: Mon, 23 Mar 2026 21:59:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i4 1st Gen from
 SKIP_IFACE_SETUP
Message-ID: <acEkEbftzyNe8W7C@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Same issue that the Scarlett 2i2 1st Gen had:
QUIRK_FLAG_SKIP_IFACE_SETUP causes distorted/flanging audio on the
Scarlett 2i4 1st Gen (1235:800a).

Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
Reported-by: dcferreira [https://github.com/geoffreybennett/linux-fcp/issues/54]
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a28be9115440..4bed7d877d93 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2424,6 +2424,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
 	DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
+	DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),
-- 
2.53.0

