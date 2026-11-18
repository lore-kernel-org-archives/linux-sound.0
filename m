Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966972;
	b=n4seMaCILMRyGjw2PhSHRZ0gOXy8BwweEJPLgt3Tjfbj7nh8ad1x+y1QD7UQnNa9xzCi
	 XwunONgsMUeWmppuIZDFf9NNa395os5qH02ism11rAIXaPNISJRLl2FBEC35B+8tGci97
	 Zv+CVY9fgUUXr0OEpUCKuRFP/5euOiMn+HBce3ySisoJtcRFlF44/f+hJbCiwKv/9KJeD
	 9MsmrTIzGgy83ShrWXGkWXhQRxdTi588tFwzAS6xlKHMXWqI+LyptHIUpEIkQhCtrjjaA
	 G/LSw6jW6lpGPCWCtJPuNg36/U3NegCkQY837EA8/P24cl36oj8CHrj1IcofiykYkJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966972;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w+EvjzQ0T0T3TP4PWvSTk2ULV/48sJmmESn1RhUWmgY=;
	b=CjgtXUjMwn0Ysxq6yPuhkJOkff2zreyfIum/HVDppQXvwLxH0O9FYmgu29UfuU8HjKlS
	 eSW9PvtMn4NCY4qzqcgUo43ibhpPkbuYb7eI/bIlEbU4Le+DYhwVfcBlM2XQ5COCnQf7V
	 fkb9wKnfeVhyNqSJFxf9clHzHyFEnlfmSZIaOkOmJOvEe+rO6F6a0/9i6UOmTtqOtCQS1
	 p6Dq1ocmdO9EcYQ+4PBOFI4qN56C+u+RT8B9piKZZ+uFIxNq+JZHSCbxhaScZujIBJ4Hj
	 kH+j+p3Ft1DU8nobZ8tp3j8slH/+/26DSU/phk0aDBFB6EsTAugBP8fpS8+T5BFLbtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A51606A891;
	Wed, 18 Nov 2026 01:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A51606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3687b158e2f311f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:457e7a1c-20ef-4f61-aeeb-dd4f938ae44e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:8cd42dd51c92e8e54c57a5d1735dd4b1,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3687b158e2f311f19a56ed5b684f684d-20261118
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2042482459; Wed, 18 Nov 2026 09:56:04 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2 4/4] ALSA: hda/realtek: Enable mute LEDs on HP Laptop 15-fd1xxx
Date: Wed, 18 Nov 2026 09:55:52 +0800
Message-Id: <20261118015552.201306-5-zhangheng@kylinos.cn>
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

The HP Laptop 15-fd1xxx (ALC236, subsystem 103c:8cac) has no working
mute or mic-mute LED. Both are driven by the existing
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO quirk (COEF 0x07 bit 0 and GPIO0,
active low), as confirmed by hda-verb tests. Add the SSID entry.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=195827
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e7a49801d05e..140458b6ab00 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8033,6 +8033,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca4, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca7, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8cac, "HP Laptop 15-fd1xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8caf, "HP Elite mt645 G8 Mobile Thin Client", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8cbc, "HP Pavilion Laptop 16-ag0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8cbd, "HP Pavilion Aero Laptop 13-bg0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
-- 
2.25.1

