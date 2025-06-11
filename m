Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400926FBF
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749670416; cv=none; b=GWtqEaWnSEyOJbCTR7zA8bPuBqLHh2dGeJKgCUNgBZygaGBWcqN0988Ups9rHjvbuUpxbu/SiH06qywNZ8b5UFSepdOs0nT152CT648ZVu6WqeR3m94AGvGFZHek2zcfuwzqOaIvVmkFGorG/vDe0x6s+VZGm3EZwyIoAJsc6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749670416; c=relaxed/simple;
	bh=5Eo1M1ACVnCVpYOFz2/HGPuuvPTIrhBfghO4SaYEFyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sA+kW3eRfmbb5NHgo5yO8tWVJ7yyENUwoYNg8lH5e72TyNfCLxnUgkzfVNuMiC3q756wzWd9XNdk/dRB20h5fpq7/jVEBUCl2W9lgSFJ6HDOybw8D0slh8xylo0/Mmrv59r5z9QSTE1hiBk2uMasRLFbHVcm5KE00+0hKCj6XXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=borg.moe; spf=pass smtp.mailfrom=borg.moe; dkim=pass (2048-bit key) header.d=borg.moe header.i=@borg.moe header.b=GzuU2NN3; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=borg.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=borg.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=borg.moe header.i=@borg.moe header.b="GzuU2NN3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=borg.moe; s=key1;
	t=1749670402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NoDOThWdF3HB4tbFad98SZJwB7CRrxvrcALT+ydztO4=;
	b=GzuU2NN3y6xhVPn1HDBwxVk9by+PCXj5ehMjEVSyJD0aRc0fUm6HLAan+5CoDKSxvC12TV
	lDm5UEOn+Mxj0qMZb7ob/eKuyKD3mBda/RH0uPBHInEqbX18t9xdqIxOCzsXqXHe4F+deI
	6XQwAeANf2OSQxlpwA3CpMD8AnbtqXryucV4nBM2U8L/3k9+I27eAUZm0PaT4PrJv9noqp
	v1lKD29FzGA4yotOGwSD7arWT/EanYIQ+MC8tQM/2BnHCh63CTmLVpY880sRTyY/clA+rK
	F+2zsj4N+cJsMTQtfgvQlMyvb2j/KScbt4e82e7cLE8aMAYR7GCT2oWj8ziSyA==
From: Jonathan Lane <jon@borg.moe>
To: linux-sound@vger.kernel.org
Cc: Jonathan Lane <jon@borg.moe>
Subject: [PATCH] ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged
Date: Wed, 11 Jun 2025 12:31:25 -0700
Message-ID: <20250611193124.26141-2-jon@borg.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Like many Dell laptops, the 3.5mm port by default can not detect a
combined headphones+mic headset or even a pure microphone.  This
change enables the port's functionality.

Signed-off-by: Jonathan Lane <jon@borg.moe>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..261ba1a60015 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10509,6 +10509,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0872, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0873, "Dell Precision 3930", ALC255_FIXUP_DUMMY_LINEOUT_VERB),
+	SND_PCI_QUIRK(0x1028, 0x0879, "Dell Latitude 5420 Rugged", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE)
 	SND_PCI_QUIRK(0x1028, 0x08ad, "Dell WYSE AIO", ALC225_FIXUP_DELL_WYSE_AIO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x08ae, "Dell WYSE NB", ALC225_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0935, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
-- 
2.49.0

