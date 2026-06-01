Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177520C461;
	Mon,  1 Jun 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303405; cv=none; b=ewguRYSQVl4LO8NVPaIYd3lNXVYS7xiIaopZLWMZZ11J5NYZNvaDnnPcWBZIwq1OJLHh89Ty3v7j3KcWJlNump7aRShlbgrvRXIGCQSRL4m7l43dc0UJXurm7IcMGEenNTc4Pss8tS1iMlB+wqJH7cm0oLersrIwLLNm3JHin7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303405; c=relaxed/simple;
	bh=TBe5Pir96l7pYPlRdWgRdfX2iEg9X8AH0jeUTlTxGsw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=gyj4LXO6ZWxhi4Gas+ev+ejv3baL9XghidRsErTuAPUxDZf5twZU62aOQJjmlAqKHmquvDwXJlFCkEQj3wtmvJlHhXDwxd/sIk5e1xgko9+sMV/e0EBKfomjOjaeL4bqr/5HwSjpOTZuxpvdZ4HPDwxXuwUPVf04EwZ7QUcMDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: edb642a65d9511f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:20b9f414-7764-4e77-983d-c01c7108a1b7,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:d3174f1b0702c0121a08bfa135dae56a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: edb642a65d9511f1aa26b74ffac11d73-20260601
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2053703978; Mon, 01 Jun 2026 16:43:14 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: loongson: Fix invalid position error in ls_pcm_pointer
Date: Mon,  1 Jun 2026 16:43:09 +0800
Message-Id: <20260601084309.845322-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "invalid position" error occurred when the DMA position descriptor
returned an invalid address value (e.g., pos = -1048838144). This happened
because the `bytes_to_frames()` function returns a signed value, but when
`addr < runtime->dma_addr`, the subtraction produces a negative result that
gets interpreted as a large unsigned integer in comparisons.
when the addr is abnormal, for example,the DMA controller is abnormal in
hardware,x=0 should not be a point(x == runtime->buffer_size),but a range,
which includes the addr address being less than runtime ->dma1-adr, and
the addr exceeding the DMA address range.

[   32.834431][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   32.845019][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   32.855588][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   32.866145][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   32.995394][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   33.006025][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
[   33.016748][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 sound/soc/loongson/loongson_dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index a149b643175c..f0a7065ddae7 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -207,9 +207,15 @@ loongson_pcm_pointer(struct snd_soc_component *component,
 	desc = dma_desc_save(prtd);
 	addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
 
-	x = bytes_to_frames(runtime, addr - runtime->dma_addr);
-	if (x == runtime->buffer_size)
+	if (addr < runtime->dma_addr ||
+	    addr >= runtime->dma_addr + runtime->dma_bytes) {
 		x = 0;
+	} else {
+		x = bytes_to_frames(runtime, addr - runtime->dma_addr);
+		if (x >= runtime->buffer_size)
+			x = 0;
+	}
+
 	return x;
 }
 
-- 
2.25.1

