Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966967;
	b=c5ikUF2V/1002MiocMVAZgCtR0BftitNImhreK6CvOQa0sg9BmYGuPUDIe6yhtM3yyJj
	 hECKlDyBfCzlwWoLyEdDk/jZ5IhYUSwPW/OKVXvOZOGHVBGgfUgKceBGkgdmcp54NCFhG
	 zG98xAyBiWWQPs+ysVboe4IY0p4c4qSDyhawIb4RlCy4x7WQiospP3ma94JhLrPF5L0lT
	 ZzTGB6gzYXkRYHLJppLpBg6X8YpltIQRy9y4VmOIWI0pc97IRTr5X4g48mPcEGAzlBzdl
	 WwiP3dLtICnW4IFU0YnH1s5wXDoWp3MaMcGyeT15oGvSFVK9P36+wbuzBqRJwSUJCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966967;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GRqsW99z045zrNzeax8TqDqEq+YnJyvJPh8H3rmOg+E=;
	b=jZmhd59nSQ9YYRvLuy9Do4m0LJCsSnVSt+vU6YlfBhL+NrVMi6HVNpMdPgU1JWelBXzU
	 qIOXk0s3rhMmJ9uDgmZce8Yf9cw7eBqx6wTDuV2KJ+62hO4QtAEuGj4fa5/SGdggS7uWF
	 ErGqb0TCdsWL66i8f+fGzE4Jbms/lyMwwXWigfmEhz8tB/MsigMliMUQlDUjzzVyUUUPU
	 VApLZ8SxG6Tk6ioDEHLjsNIFv7gQDrFF8OBugh6z3vQYMcMLYELBdS1/MhyxgHmwkS96t
	 z2ylSzbAyFXdgZBTHRtppdwIHAfif4aaxxyFvtH0YKFH9n+eJHRFMRbniHgNAvhqLZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F977606A32F;
	Wed, 18 Nov 2026 01:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F977606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3403f5eae2f311f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c2bcc999-d68e-4ae8-ac9e-2e885f2befd3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:bda67716a1a53e96b25accd2ed70f929,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3403f5eae2f311f19a56ed5b684f684d-20261118
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 151739580; Wed, 18 Nov 2026 09:56:00 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2 1/4] ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
Date: Wed, 18 Nov 2026 09:55:49 +0800
Message-Id: <20261118015552.201306-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118015552.201306-1-zhangheng@kylinos.cn>
References: <20261118015552.201306-1-zhangheng@kylinos.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After S3 resume the ALC256 on this model has COEF 0x10 bit 9 set
(0x0220 instead of 0x0020) and the internal speaker stays silent.
Reuse ALC256_FIXUP_XIAOMI_PRO15_RESUME, which clears that bit on
every init, including resume.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222028
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..6d7bc33bd0d5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8367,6 +8367,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x152d, 0x1262, "Huawei NBLB-WAX9N", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x152d, 0x1577, "THUNDEROBOT Gravity16G2Pro", ALC256_FIXUP_XIAOMI_PRO15_RESUME),
 	SND_PCI_QUIRK(0x1558, 0x0353, "Clevo V35[05]SN[CDE]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1323, "Clevo N130ZU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1325, "Clevo N15[01][CW]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.25.1

