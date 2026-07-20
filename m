Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274B418A44;
	Mon, 20 Jul 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551037; cv=none; b=n9S0Q/nIAmAWlgyUMedJhyUnqACJkb9yhxtEyT3V6LpxMedpQgmn6Pw1Xq0ISMuF2TJZ4DDN7X6uWj7kIZoL7p0XCO6MHjYyQt/PX5XVoAtu7efn07ZGyaihw+8o0xbF0I9yijC5H8u54Phuo0LzIUi8hToOTFw+6o4LW1BflEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551037; c=relaxed/simple;
	bh=CF8Alrod/xyklfeOK8IFBWRO9CjRuB7pFcSDsZ59fEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PfmiiYqteBJyqlFeH7FU3v3sMW8DHwpKBh+QMzTofQ36tSdcQtJS06USRMkm3urUTE5GWwIdhwtQf8DHEy96H5XGuuhzDaMtBVRFfgHIr1B/V0g7pM0r2HNXM0Fr6G58eOKr4ovLKvBgiAVC03/UPWJ41fR6BAPi+YQDGCtEbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b7ffc718843711f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8c36912e-e7ca-4f34-ac5a-2be59e9bb26c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:5df46ce1f595f956f2bdcfcdafafb82a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7ffc718843711f1aa26b74ffac11d73-20260720
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 476766396; Mon, 20 Jul 2026 20:37:07 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Caio Ramos <caioramos97@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Samsung 750XBE/730XBE
Date: Mon, 20 Jul 2026 20:37:02 +0800
Message-Id: <20260720123702.799474-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a codec SSID quirk for Samsung ELECTRONICS 750XBE/730XBE using
HDA_CODEC_QUIRK() instead of SND_PCI_QUIRK(), because the alsa-info
report from this device does not expose a PCI subsystem ID, only the
HDA codec subsystem ID (0x144d:0xc824) is available.

This applies ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET to fix sound
being very low and distorted on the headphone jack of this system.

Reported-by: Caio Ramos <caioramos97@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=208663
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b3562c821954..d17150d4058b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7652,6 +7652,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc1a6, "Samsung Galaxy Book Pro 360 (NP930QBD)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_AMP),
+	HDA_CODEC_QUIRK(0x144d, 0xc824, "Samsung ELECTRONICS (750XBE/730XBE)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha (NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc876, "Samsung 730QED (NP730QED-KA2US)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-- 
2.25.1

