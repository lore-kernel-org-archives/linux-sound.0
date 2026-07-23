Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870633D6688;
	Thu, 23 Jul 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803825; cv=none; b=csHoKO3SIPI/LJTxZz0b+wt3gVsksJfbvFfQwGYzXX9P3UhsNzp6UHGgPjAED/+NXJ6R9aaYCDe5QSGQAspNpbdKpKtMZX7a4fANU1w+IlMw8VeXR9fpiXYErMCsEDGwGtUNtrIVrHn7d5jX/712gnmFUqcGo/gBbWXn44bZAXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803825; c=relaxed/simple;
	bh=D0a8s/NQ4Aao9oBgwpAdjKsbBI6x6F+hPt/2rH6En4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJziUTng+MyqwelL/svxn4DciyRGv602kB/Buz7IH3hMlzItbwZoxvS/x6F4XDtaav5aHa5M/f6UEI802T17k2ByJzA0gG9ocJrkz6YPDVJaigNMnWRi8y9r8baKDL3gh2ItQtnjduEUTlBZWgZiqk1QMA6psug9inGI179SLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bg0veIzW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bg0veIzW"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D27D383F7A;
	Thu, 23 Jul 2026 12:50:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN0eZR0YPdSt; Thu, 23 Jul 2026 12:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784803821; bh=D0a8s/NQ4Aao9oBgwpAdjKsbBI6x6F+hPt/2rH6En4Q=;
	h=From:To:Cc:Subject:Date;
	b=bg0veIzW/rGvKvYfZb3MA5puWhfMXVyhd1ddL5fcFk9SG/9ytrTpNwu6rqsMkNIz8
	 F5m1D9GHTkS3K7T7Gugvjmec184+Qpcy5qNENtRaDRJBvdnjMRPSj61GWN1xdgQZVl
	 TN+T0BJUY9h8bqhE0AxGU/+FK8YkVGl7FwYIJkVg8NNpdTvyZ30Qlc8Gek9AidmrMu
	 hOOS7P3n3SntBOBt+TH7pSCWEaXBuo1gSRtyqVZHPgiQBQhNCYsYKetlKsChO4u40r
	 BueLj7aMTiXdK3CtAUmZbm+3vYENCNULCACDFQf8SNatO4Mkp4cQFvKkfR1bHFlWko
	 OWDWKr8LlXUYA==
From: Madhavender Singh <madhav@disroot.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Madhavender Singh <madhav@disroot.org>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 14s-dr1xxx
Date: Thu, 23 Jul 2026 16:17:36 +0530
Message-ID: <20260723104736.23386-1-madhav@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This laptop with an ALC236 codec requires the
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2
fixup for its mute LED to function correctly.

Add the subsystem ID 0x103c:0x86c8 to the quirk table to apply this
fixup.

Signed-off-by: Madhavender Singh <madhav@disroot.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..cc273e5f782c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7108,6 +7108,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x86c8, "HP Laptop 14s-dr1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x863e, "HP Spectre x360 15-df1xxx", ALC285_FIXUP_HP_SPECTRE_X360_DF1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
-- 
2.47.3

