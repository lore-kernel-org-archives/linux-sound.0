Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F0A1DB924
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544626; cv=none; b=LYHhpnCeQqD3ylZrnymk8i7pPguggsNeCtTWwmF3N1UnNGD6RYuxAH+W/ssre3rNZiRCiQ4oEXLzW58iJUlRJknrCEbz3vMeEd+7UldHNF1+5cSz1JO099FF4kDH+eh1az0JAFYOcEi3HoOSZYXcrFavplVVaRPcxw5uQTjF2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544626; c=relaxed/simple;
	bh=pNvTABkLCR0lYsOjt3GBVthpiN+hNn+SdX+fpJRu3k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELOJEnQZ6PeD8oIFyphIhNC/7CZLUjXcHXFmO51ddp3CiNCF/FhFc7fDNUbibu3BoUPkHV98eZVqpoeni3Oz9cgBY6JPiasg95R4J/3OMDKffSojxa8w8lUmjWILv9wO0s4Goe/5wA8myPQc49VFA+mpXl3QToD48CBAVM5+e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=borg.moe; spf=pass smtp.mailfrom=borg.moe; dkim=pass (2048-bit key) header.d=borg.moe header.i=@borg.moe header.b=VN5m6MJ4; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=borg.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=borg.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=borg.moe header.i=@borg.moe header.b="VN5m6MJ4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=borg.moe; s=key1;
	t=1748544619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A8eJPE1CVO79gD03yht+XLP0Ohvl/ZOA77hY6aBFozs=;
	b=VN5m6MJ4E9lUqstDkFLFNRWHClBqPizMKrUer5y8Ezzsd+rvo+Yz9pG8Qcq7zsnqL/oVO/
	uAbdrUhI+AaBDubAxeVHYIfvivgR9rPD+lUSON9VmBiU9+r+fLnL8BaFNs2+cAbcyX5pUq
	wZALV3KRNio4lS1gBWerahnRhj3XcFZMIKVigs9cabFjSSBMSR/TXFIjh+QYWvaegsFbM7
	pOT1hghKYjZ1L+Z9v/JMhqrRaCKYug6K56PQtF6ibWcOGwxTO0lbgXCVCN9v1lkz0dH6C5
	067AZzn+5D9RXQjpycxpQeiKrwj8uWjS+4E37Pnlu7NPdrVAtNJhLsIIRBpMmw==
From: Jonathan Lane <jon@borg.moe>
To: linux-sound@vger.kernel.org
Cc: Jonathan Lane <jon@borg.moe>
Subject: [PATCH] enable headset mic on Latitude 5420 Rugged
Date: Thu, 29 May 2025 11:50:14 -0700
Message-ID: <20250529185014.28503-1-jon@borg.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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

