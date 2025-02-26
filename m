Received: from mx1.trustlab.cz (mx1.trustlab.cz [171.25.222.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2419CD0B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=171.25.222.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580897; cv=none; b=o4zDCRkQawuWPiVDMr2jEERMKnCUY+g1Dau1wbzWFkdhBnG/bU4yiTAMCydsHD2srXR6NE2GD5jym1iOLJHCPgE2wosjxVeG971PQgO7rvHq9NziRWo48rbIHicfVzyKLIfj8zPs5vFic5ruCmjm98IVKgsAktJ96cZV0rpJb7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580897; c=relaxed/simple;
	bh=CoUTWvf8ksdA1IBfBS8UonSQrzaKqGE8yaVyn5W2Y/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N729iMx2gs8LIIuJg576GiC6AcXW+/2NLh0sVlAQVZX7015qiPTZqR9qUXaiGYDi/JGHNnDFh+vPtPqlvWcE3Zgi/Pnq4jRmi4ACZqLgQ2LO9u43esvGG2FPW1bG/EbNkIhddzIZatDj7aLPVQ6tU6EDqiAB1dHUcYZYxALehTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustlab.cz; spf=pass smtp.mailfrom=trustlab.cz; dkim=pass (1024-bit key) header.d=trustlab.cz header.i=@trustlab.cz header.b=gAXyz9Zx; arc=none smtp.client-ip=171.25.222.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustlab.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustlab.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=trustlab.cz header.i=@trustlab.cz header.b="gAXyz9Zx"
Received: from localhost (localhost [127.0.0.1])
	by mx1.trustlab.cz (Postfix) with ESMTP id 03D7A52C63;
	Wed, 26 Feb 2025 15:36:01 +0100 (CET)
X-Virus-Scanned: amavis at trustlab.cz
Received: from mx1.trustlab.cz ([127.0.0.1])
 by localhost (mx1.trustlab.cz [127.0.0.1]) (amavis, port 10024) with LMTP
 id LlALfVvdGGDK; Wed, 26 Feb 2025 15:35:59 +0100 (CET)
Received: from IO.chodovska.trustlab.local (unknown [82.117.137.78])
	by mx1.trustlab.cz (Postfix) with ESMTPSA id 363B052C51;
	Wed, 26 Feb 2025 15:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.trustlab.cz 363B052C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trustlab.cz;
	s=default; t=1740580559;
	bh=CoUTWvf8ksdA1IBfBS8UonSQrzaKqGE8yaVyn5W2Y/E=;
	h=From:To:Cc:Subject:Date:From;
	b=gAXyz9ZxSlNdtKz0tQ9fAI7MiWvfv8a5psMb02DKK+DP4P5QNSiDV/RFOcKclDpk+
	 YPgxPHWak3ErvFcX/t9bjrKl4TMAA9KfV4Vwo/bywr9nFj89bi2Pkdl+Xjr5HioOHt
	 ozQg2n07HNn3zewRH8+eNuwImTWSUrK9SNiIyyUA=
From: =?UTF-8?q?Daniel=20B=C3=A1rta?= <daniel.barta@trustlab.cz>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Daniel=20B=C3=A1rta?= <daniel.barta@trustlab.cz>
Subject: [PATCH] In order to get speakers working on ASUS P5405CSA laptop (ID 0x1043, 0x1f63), which are dependent on Cirrus CS3551 smart speaker amplifiers located on SPI bus, I had to add line that applies fixup ALC245_FIXUP_CS35L41_SPI_2 for this system. Fixup enables correct detection of aplifiers and asks for firmware files (which are available in official sound card drivers for Windows from Cirrus).
Date: Wed, 26 Feb 2025 15:33:49 +0100
Message-ID: <20250226143348.137808-2-daniel.barta@trustlab.cz>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Bárta <daniel.barta@trustlab.cz>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 224616fbec4f..360131dd2d06 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10699,6 +10699,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1f63, "ASUS P5405CSA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x31d0, "ASUS Zen AIO 27 Z272SD_A272SD", ALC274_FIXUP_ASUS_ZEN_AIO_27),
-- 
2.47.2

