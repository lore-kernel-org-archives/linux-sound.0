Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36D1EB19B
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796421; cv=none; b=E5mo+zg0h0AME8d9JLp8GKPBsIh0rklpl7dZPz864PpUDOSdRmGGGBdvN5l7rMmXc7eRy1sYnwS7ekiRd4NfhddBDGVi+95b2WUkheJ0z9fGLoB7TzMBwX0h0O/cK72AzeC1kfXIDfO1hUfThShSqaBlSKLxqNnsqwrdGhPgKCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796421; c=relaxed/simple;
	bh=2DrgrfD0AGdOqMPfvrVdb1hOycAsx1OPRkKW7MZ5mxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmaUjNkZ9x2NTm/Fh6Gblef4IPddDD6sQgZ44+LFeLsYmJ5mpQ+37D+d3MBKUA7sgXmvvwXY9lD/TUem7LYBGa19sRYS0JpZ5dDnlKQJfUw2lwDxLP20pBXuV6Dxd+gN0ZiPE2iNcaBXcOOXjgyLWLTRjywR+TNmHONgzlXaUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=A8MK7s6s; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="A8MK7s6s"
Received: (wp-smtpd smtp.tlen.pl 13290 invoked from network); 22 Feb 2026 22:33:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1771796016; bh=aohI2FnjireY18IUuuh094V1ZC5Skltbw5Rz++Yrw0A=;
          h=From:To:Cc:Subject;
          b=A8MK7s6sJwKDmuIBzGCTgAp7/xOGggJVXyPOILjHHzWuCxpfrDGBKAByNtpTHeFWQ
           QCJ9O9pE7y60lwubekSzMprOshEWP+BWY+VwMdlFqN6VtAwNUhTgiqqXA+UVpLwtR+
           qUXZCQBNyLRSQ1QW5gqhz3Ae+PB3JKWurXrISnCHRFAQvgsG3fA8NySytQ+sm7bpmG
           UX86VKxiIDablhMWhwuQ9LTCJix4QgSI4SixiiD3vBQ+88xCCew55veUNPZEmKvXdn
           P4XChOCMluJNdFQA6AQuVNj/IlrQVuKUfuZ7POH3utofQyVFnqL1wkNwYhznUZDIRJ
           s8KugL9pWF1WQ==
Received: from unknown (HELO Zenbook) (phofman@o2.pl@[176.114.234.141])
          (envelope-sender <phofman@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <perex@perex.cz>; 22 Feb 2026 22:33:36 +0100
From: =?UTF-8?q?Pawe=C5=82=20Hofman?= <phofman@o2.pl>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Hofman?= <phofman@o2.pl>
Subject: [PATCH] ALSA: hda/realtek: use ALC285 rear speaker fixup for ASUS UX7602ZM
Date: Sun, 22 Feb 2026 22:32:24 +0100
Message-ID: <20260222213224.216805-1-phofman@o2.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 9fde89d5773aaadcfdd76b37d732a8da
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000001 [QaLw]                               

On UX7602ZM, the previous quirk (ALC245_FIXUP_CS35L41_SPI_2) left speaker volume behavior incorrect: increasing volume mainly boosted highs while overall loudness stayed nearly flat.

Use ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS because it also applies the ASUS-specific rear-speaker pin setup and chains the headset-mic fixup on top of CS35L41 SPI amp init, which matches this platform better.
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36053042ca77..3fade4f1a277 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7245,7 +7245,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x1f63, "ASUS P5405CSA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1fb3, "ASUS ROG Flow Z13 GZ302EA", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.51.0

