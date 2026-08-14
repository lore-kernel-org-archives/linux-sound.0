Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3444BC87;
	Fri, 14 Aug 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696884; cv=none; b=uJGLeYhS45cIBFptsCWb3LIGvQoQsE1w7xnHvQ9dFzZ8hDweY91n15Yvxv+pcd/dtJKjm4l1uGKCXMqTyC2I3lPZT/knm8/CF5f3/JQRsccHwKulwn34O5KTCXlBR62LSrQgPxt6qREnTIvQ7ZCTs5IpE9iCpSV9Rqq2g2UODus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696884; c=relaxed/simple;
	bh=9BWI/6oQqJ4yDkrbXamppgNK88/tSvO5UVYN9wJCqn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qu+pnF5JKTSQRQakxyijZCwzJyNLoC2KfwGARk25gvyvku4raGZL3dzvEYlOG/djDGfzU9t6cyx48RkDDH61dPeL7um07TNJkSUl2RONzx+y2aBulT1od7cdtqmmlkx2XLdPvXde9nHlS7Bb+y5PoT9X7Bo0px1OjQO9rCBBF/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e3abe57697bb11f1aa26b74ffac11d73-20260814
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3e97768d-e88e-46cb-81b4-b4504a672e07,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:7b0fd99bed261d67e99f75dd2e4b9777,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e3abe57697bb11f1aa26b74ffac11d73-20260814
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2142395899; Fri, 14 Aug 2026 16:41:05 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Drop duplicate quirk for Lenovo 0x17aa:0x38df
Date: Fri, 14 Aug 2026 16:41:01 +0800
Message-Id: <20260814084101.504471-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI SSID 17aa:38df is listed twice in alc269_fixup_tbl[], both mapping
to the same fixup ALC287_FIXUP_TAS2781_I2C:

  SND_PCI_QUIRK(0x17aa, 0x38df, "Yoga Y990 Intel YC Dual", ALC287_FIXUP_TAS2781_I2C),
  ...
  SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),

The HDA quirk lookup (hda_quirk_lookup_id()) returns the first matching
entry, so the second occurrence never takes effect; it is dead code.

Drop the second entry.  The retained "Yoga Y990 Intel YC Dual" label also
follows the naming of the neighbouring 0x38e0 entry ("Yoga Y990 Intel VECO
Dual").

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index be7287ea24ec..3f0e276fc606 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8101,7 +8101,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38df, "Yoga Y990 Intel YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38e0, "Yoga Y990 Intel VECO Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38f8, "Yoga Book 9i", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	/* Legion 7 15ASH11 shares PCI SSID 17aa:38f9 with Thinkbook 16P Gen5;
 	 * use codec SSID to distinguish them
 	 */
-- 
2.25.1

