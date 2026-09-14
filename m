Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530F249EB
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345474; cv=none; b=BEc7QTgMldgzRAV0Ck+z14LtL1Waln5kWFhur2zT9QSFS575a6Mr9XMMC01DWoLDV7LEst3W6pUFh1NPdzeLts2L0BzFsj3sfV/IB5FnFoEB/OK7w16CHI+Vx8wWKlBDtvoGXLPQB98xvUGIx3L09P5qfWEw5GM03KPJ+tTKuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345474; c=relaxed/simple;
	bh=0QJN9VkbPJBQjrlzcUQo3zW92AHhyZbHGehoe9C9lYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BisjJ8GEpQEH9ugMMqY+B3wgy5ZrtDWW3rgd+ofocppd/NM0zDf6Oe4gaDYV8zV/0LvviadV4HmssfsKoxw7W7cxJU9MXhG22PjE0SnZmYxnFJMt/uRnvAcdw/+VNf16wXmUmEAcURuI8DwtdAhRXlic4f8WidlaJ/USADaq3JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=hMm9bhog; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="hMm9bhog"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 42F15240103
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 02:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789345464;
	bh=XTrnvnLi6eOVO6BmFj8cCJwghr2DpOwoBKEk9I4NjNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=hMm9bhog+Z6T2RvH0JWPN72MIIRNUThI3lk0KhhtWVmVZOlCZAWZ2hEJmQ/yTo5NZ
	 Zxy20nxytvguXNlgLI+M6lIs1CAS+hTGqzUT0jOgeVN2v8SPV8kIIVBpgdiNXmm1gf
	 /VnF5DhXi2wcFd802XwOYc672i+5JfVVxGiInS4PbSXAoFunOjM/c5D2RI6HHsVOdH
	 TDj8Zss8CoGFadAcaVT5vw3w588kUPDqaO955fblwKwzkcJfyRSBg6DcmL+4CY1oI6
	 W9yFI9pXpbmwaG1zBs8TWkoHn2Tj8ehSvpa5k2i/TOCtFsA47tJwqEsfOucFsMDzLi
	 mL6C07HeyNXPQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hjm9g45lDz9rxD;
	Mon, 14 Sep 2026 02:24:23 +0200 (CEST)
From: Kitty Makin <autumnull@posteo.net>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	Kitty Makin <autumnull@posteo.net>
Subject: [PATCH] ALSA: usb-audio: Add capture quirk for Behringer FCA1616
Date: Mon, 14 Sep 2026 00:24:24 +0000
Message-ID: <20260914002334.12691-1-autumnull@posteo.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Behringer FCA1616 (1397:0004) returns silent capture samples unless its
playback endpoint is active.

Use the existing fixed implicit-feedback mechanism to keep playback endpoint
0x01 on interface 1 active during capture.

Tested with 16-channel S32_LE capture at 44.1 and 48 kHz.

Signed-off-by: Kitty Makin <autumnull@posteo.net>
---
 sound/usb/implicit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 77f06da93..bd4d569a8 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -76,6 +76,7 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 
 /* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
+	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0004, 0x01, 1), /* Behringer FCA1616 */
 	{} /* terminator */
 };
 
-- 
2.55.0
