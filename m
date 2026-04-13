Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11618137750;
	Mon, 13 Apr 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095904; cv=none; b=qyRzF9rWpECEceZQYRdfekw1gJjYFY+huCv2vjfYVpFI8gCBQU5aJclnrwNObiEcKNIazZAWzFThKuHqOyaNLs95NfBx+Qyd0+XoF47aMQK5L2RKYX11oQdmN1ao1aowkclYFn949nhsce5Cb4eLILnvx7iRtMgJbWh8OUUxHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095904; c=relaxed/simple;
	bh=CAcnStAUkH7ssAYOB9XOeGnOJ+//22UgwQAFbMIWDnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCAWa9IdFGJdU/LoYkn7xsYSgzijPXoWJcSkILOlKFThMBHDjxpldZTw3bWqPHGe0e3WnxCsXarSJ6DOzW6D1lVtNrZ50GV8cFKUsz6EiyXSJ98P6BO/vexRvrjYdzcf89h1A/c00i/njnuLcULcX9E72VjLFxPfw/JOvOO+6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=D0LKuiDJ; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="D0LKuiDJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F8AE285FA9;
	Mon, 13 Apr 2026 17:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1776095342; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AXbIFam313eUjm4s10Dqibfnk/5nAR5in+w11u4PpkE=;
	b=D0LKuiDJelcaOzj684pRUC9U+bTsBs/pVyLOCYipR73QjDFg9Zwwg2nBNSAL+MU6cmlWOJ
	ZNRdmECnPxZbfX9LIeVVSL/XfVCQC4BubH6BMvlvhD4RTjvfmYf2kafUDtALF/vj0SqQW5
	0KWxD3GX0SpRD/45ImJNVHWZGOfUaljIJnKtrzp+nkA7of79576Ju1JM0UXmL2KMDxq98F
	WgKD8HHC7J/sDYUs4AB18tACFFbUWZd0DLjH5BsDuZRQRVTssXQGibbvzV8j/Q7Cqb9Ls2
	YBFYjhh78Hjq3lLw1Om7SGGstQJ30oF84G1KYHEqvHh0nu2Gxd6ayNzDCCEv3A==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Legion S7 15IMH
Date: Mon, 13 Apr 2026 23:48:17 +0800
Message-ID: <20260413154818.351597-1-dnaim@cachyos.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Fix speaker output on the Lenovo Legion S7 15IMH05.

Cc: stable@vger.kernel.org
Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 45f9d6487388..ae74e1b69eb3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7605,6 +7605,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3811, "Legion S7 15IMH05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-- 
2.53.0

