Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458542628D;
	Mon, 20 Apr 2026 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663245; cv=none; b=Zzg9+kR+SI0O+dJ3iV9Et9ojc5m9fq4rqKscgxCwCcIlCMbTGgrXpSZAidw3Qh1eilywZFtbpaz7wYO1rsa1Ap1QxfQevpoUSPzETacWFcNF10VmjrxTzWJbNZHs971Sea5tXAu8E4fARXDrPovImXNIs1JjAXzbqEEveYjD3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663245; c=relaxed/simple;
	bh=NgktcuZ9I5Uirl/AOxzFzyQufdp5UrkU33fJ1HPZt5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aGkFqDg+MlVrMO+liJ0L2fW72/GCpfhBaaiGc4+D9pNtNNhXAP/GoCLZoMZjFVw5SsYemTHqTvqodPZ2D6ZpvQBlroicHNpk8kPLBmnJO1HaN5hzBrJaG5JpBWkaSP/I0t5Za2ZklJwzyOZh7mu2TeeSvNB7F+XWds8YsKrpW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 859bb5663c7a11f1aa26b74ffac11d73-20260420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b89e90f7-b310-4480-9a6a-6a67ac2b21d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5f67bda717d5a8f48f497c71bd416cd1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 859bb5663c7a11f1aa26b74ffac11d73-20260420
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 209601551; Mon, 20 Apr 2026 13:33:55 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	Yenilmez99 <mehmetcanosma77@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add quirk for Acer Nitro 16 AN16-41
Date: Mon, 20 Apr 2026 13:33:51 +0800
Message-Id: <20260420053351.547352-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

The combo jack microphone is not detected/working on the laptop featuring
the Realtek ALC245 codec, and mic pincfg is the default value.

So here, add quirk for it and test good.

Reported-by: Yenilmez99 <mehmetcanosma77@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221344
Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 37241a72b5af..3cd7310aee9c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6703,6 +6703,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.25.1

