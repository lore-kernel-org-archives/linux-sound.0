Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6882899
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154428; cv=none; b=oGi4Sk4XLf8pQy2El6QJ09smmPNh9qA5o5Eumh4qk7lLTlo4VJV4iPtXLJtJtsJSgQ7+jUBeaE88zj/2iwFZt8/hjezI/D/ulX09IIUvQjVnueS3m7cix/FFFDqEoW8eXdeFOeJ2w/maJKy3aA15RNzPgMHqQpXqdwrstYFiNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154428; c=relaxed/simple;
	bh=M7l6/QLIPUoglGrfdye4yiQdtH9sXmYpR0Yv55tKrto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0DJ7mrtv4IJoNUPDJe/gqhfHaoPuzUBeDRICbuDe22LJiKghSDaVE13oVzgOIi4tei+tgKUwZ37XU19c3kS318OuMnvn7x2KDnypJO8aEwRUTHw+1LuhvHHRl3d0RiUMLe6Rydc81yqMTk2ep8Y2nzwz88jFIAf6ROnOJZIKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=vX9zkgm3; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=EKPqW4IA; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="vX9zkgm3";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="EKPqW4IA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1752153513; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=vsPjCCPZRDftl844wyMwpzELOqTezWUQYA1LB69ZyMk=;
 b=vX9zkgm3nSRYKFX2DkmbqR+4D5VC0hdnK32WjwMKmsLNdS0vZG3mo+4JvN4P+61UBPujT
 zk6G5Kw8nJiQLDP/XRg0i7rIXUtesuaTbe0w/IKajwozklENQp9gDgsXgI5UtrW/6IH0aPX
 QxfWzBvHice9e6SiLDTvtg/IyBDVLyy3/Vuegn7TXQJj924Vad3FobyqegeslTvKDRXNKmk
 +xK9PxaYiAdn1x8KED3VZtBnGWuzdtVFN9BqgwZdooLd/C8j6JPDPJEIlK+I7FNmbW4nqus
 XzLeCjpZUEErrAbvZJEUBAaGGqNq1Xzk2X1iWFOzzlP4xIFK/MCg1/7FcZoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1752153513; h=from : subject :
 to : message-id : date;
 bh=vsPjCCPZRDftl844wyMwpzELOqTezWUQYA1LB69ZyMk=;
 b=EKPqW4IA8Nk4qh/caKqUAeOgDMZ6mJXa0uRxLFWB3TaDTfqhZrE/aGaNkt/mhzOgfR2aq
 hRF2OYvXaaPRtDQsvz9IIJBUvd/Rr3JvqjK/R1A8oKfMcRNaZqtYuespoxBhp6hzjqcpSJP
 gVzzkgMksBAWr9kJ45Mo/QqTfY0u+Z/1ofbh3bj6Cjj1g1p74RavDZymH6Kin1SddQD6L6d
 ETcTQuqQ03Uemx36dTARxM543fpb6G6Z86NXGbKuOxp2AgJpneowJwfzI3SxMIL5bgNNfeB
 lPGmnQbhrZDUuVhCsEreiwINtZlUAL1CpaoxMhkwBXGxdPiyRXSyXpfyEpXg==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uZrAQ-4o5NDgrsm8D-h6lg;
	Thu, 10 Jul 2025 13:18:26 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r0xxx
Date: Thu, 10 Jul 2025 16:18:12 +0300
Message-ID: <20250710131812.27509-1-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sasdnPZ66u
X-smtpcorp-track: 18seFyqgR4bu.FNCTlmgIFF-B.13gS-Q0bpgh

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on Victus 16-r0xxx Laptop. The LED behaviour works
as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 060db37ea..132cef8fa 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10814,6 +10814,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.50.1

