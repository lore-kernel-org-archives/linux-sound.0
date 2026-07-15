Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8F1624D5;
	Wed, 15 Jul 2026 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098834; cv=none; b=Oz6ac/4UpsVUZwc6bHsqrUI3RrGjjYMN7EopyRU/E8I5kjn7AbsRZnqFTt7MUvwHGovAq4HM2Ty8zUTtBBW/Au5MivjQB5uxQuyeOjkDAiAhdRiDphE4c1S0xbIYY5kNl/yAl8V6sw0PTADewIvA/xJ8AWW+64Ui3Mb0j9wFUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098834; c=relaxed/simple;
	bh=om2ESfsAjTu2Sz0NXOSzo4TXVIuheuRMnWyJKVAKMZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DewQQ0wbr687XMABfhfm/21OvBZeNvsHlW6TKHh8nY2ALZcmTSWCauuqHRmywTXtMADsrYRoOLCo8JFzqHJmlo+g6m3v3ruIaAXfgkKUJ8F2XqLdAFLMfDkGoRyW2FwZIOQrPdV7IMmBziUcrF+fOAhSzt1WR7phxzAc6z6gChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d5045e30801a11f1aa26b74ffac11d73-20260715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:097e66b7-e77a-472c-8f53-2ff4853398c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:bce62230ec04e6bcf58dc8ed5a785b69,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5045e30801a11f1aa26b74ffac11d73-20260715
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2025106102; Wed, 15 Jul 2026 15:00:15 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] ALSA:emu10k1 : Use vmalloc_array() instead of array_size in snd_emu10k1_efx_alloc_pm_buffer()
Date: Wed, 15 Jul 2026 14:59:53 +0800
Message-ID: <20260715065953.441-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change array_size() to vmalloc_array(), due to vmalloc_array()
being optimized better, using fewer instructions, and handles
overflow more concisely

Fixes: 09668b441dac ("[ALSA] emu10k1 - Add PM support")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 sound/pci/emu10k1/emufx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 08e0556bf161..70b73b0439d7 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2625,7 +2625,7 @@ int snd_emu10k1_efx_alloc_pm_buffer(struct snd_emu10k1 *emu)
 	if (! emu->tram_val_saved || ! emu->tram_addr_saved)
 		return -ENOMEM;
 	len = emu->audigy ? 2 * 1024 : 2 * 512;
-	emu->saved_icode = vmalloc(array_size(len, 4));
+	emu->saved_icode = vmalloc_array(len, 4);
 	if (! emu->saved_icode)
 		return -ENOMEM;
 	return 0;
-- 
2.43.0

