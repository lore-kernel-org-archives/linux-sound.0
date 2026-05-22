Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50228314D1F;
	Fri, 22 May 2026 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430078; cv=none; b=CDUMcI/fgLMIEDvECkoip5jCQB5cGzT1OP5YbiPtsixAh7GArwngz79a3/zEi6aAh/8THPQLeA1Nig8s5cAVUcSfBHxSOfScquIiAW4gI28Yf/Ft0Y+Q2q5LXtTIoubxyYMcH64gX0R7GHmz260Gj2r6lOZ2U9mDLz6jGv0kEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430078; c=relaxed/simple;
	bh=xEdqJGPGps7JZzTiB4JeTpD27Bao283is0x4oLsBwhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lxpxBKn/UC2l4e6M5eyqQy95jePscds5xh9uU0WDBp5v1rzNWScaGIjqfiPVWA5xsrv+/oOpmRCtfj6RHq+gKdO3exy6+8vjkVefNn23OGy3jPp/0N3TEKVFHK0dcIrblM+gkT/WD4mSEvOL+CqWH6pFSLba3VGJ4+9S5G1KEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8e44276e55a411f1aa26b74ffac11d73-20260522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:03a30970-0b9b-4af5-bf90-fc532da56669,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:352b1ff443d5c568983a536a5f04cc3e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8e44276e55a411f1aa26b74ffac11d73-20260522
X-User: zhangheng@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 760036666; Fri, 22 May 2026 14:07:47 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Fix incorrect comment for ALC299_FIXUP_PREDATOR_SPK
Date: Fri, 22 May 2026 14:07:42 +0800
Message-Id: <20260522060742.1384390-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for the pin configuration 0x21 in the fixup
ALC299_FIXUP_PREDATOR_SPK states "use as headset mic, without its own
jack detect", but the fixup name and the actual usage indicate that the
pin is meant to be used as internal speaker. Correct the comment to
avoid confusion.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2b150bb5c7a8..f617084da482 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -5471,7 +5471,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC299_FIXUP_PREDATOR_SPK] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x21, 0x90170150 }, /* use as headset mic, without its own jack detect */
+			{ 0x21, 0x90170150 }, /* use as internal speaker */
 			{ }
 		}
 	},
-- 
2.34.1

