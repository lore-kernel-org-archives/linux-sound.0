Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F50406804;
	Fri,  7 Aug 2026 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107571; cv=none; b=qKlFXPUJE9wqQj8yRjCRXsnrrKXMv7Ox28mYH7ETPGnzvYg/MqD4eyHj0lOdKQSkhmAHJoNp6L7u5HOPnKq/dJoaofK6/M09jUOm5zlIywW7Em2S+//tJ76prmwW/0kuaH/HD/TBDeU0upshLpCn+MqJyVeha4M6m/MdAeBP6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107571; c=relaxed/simple;
	bh=csoNgIW8VtXWSNO0Y+vncDzVE9KGVuej9DXIXP3N2tQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bKqmpvOB0mxrQxpiyc44t7AYKlmEUFAbE9WlrdHk0WQjV/E8aN56hYucOq30pNIO8AeYmmp9rz+a2iaSIN1NvfJm9Be01XZNFDK/K4yw8ATg2UcSfo9a9+lLmWMCi+O1K2yhpmonrVpKoGMLc7DuF5gr1A+cVkmm5Mtrz227oEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c46dddc4925f11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8c15ab94-f69e-4576-aaf7-72474cd6e8af,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c4439c0fa454251225b4f32f47934cb7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c46dddc4925f11f1aa26b74ffac11d73-20260807
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 324515796; Fri, 07 Aug 2026 20:59:04 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/4] ALSA: hda/realtek: Add quirk for Acer Gadget E10 ETBook left speaker
Date: Fri,  7 Aug 2026 20:58:55 +0800
Message-Id: <20260807125857.678297-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260807125857.678297-1-zhangheng@kylinos.cn>
References: <20260807125857.678297-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Gadget E10 ETBook (subsystem 0x1e50:0x7036, Realtek ALC233)
has a left speaker that does not work by default. The BIOS fails to
properly configure pin 0x1b, leaving it unconnected.

Using hdajackretask to override pin 0x1b as "Internal Speaker"
restores left speaker functionality. Add a quirk to apply this pin
configuration automatically at probe time.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221435
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ef21ac2216af..fcc4a372baf9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8176,6 +8176,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1e50, 0x7036, "Acer Gadget E10 ETBook", ALC233_FIXUP_WUJIE_SPEAKERS),
 	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
-- 
2.25.1

