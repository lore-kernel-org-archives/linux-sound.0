Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552441D7E41;
	Mon, 23 Mar 2026 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230083; cv=none; b=qQ75w3Ba2iWMSRzCafK2fCVCgYq41vU1GYe2bTb+bhl6UTvJqjnAB9Rm4fzVLSFT7bXPDM0tc8c+UmyjdO7NaCnAZioEIsJb7ZPPWFtnocJVI1EseGwD3W+NDk9YMQrqpwseBVeXupgN2Sc+/EyoiyOazfmJZQbBPQRn2+DMRNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230083; c=relaxed/simple;
	bh=ogRcyRaeE7Uv9+y2WSVXPD88p7WmwiHFfut5/C7bKVI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PHlISvi7MM5IdZ3AtGQjurJyOyYhhIIMGhz0iAJBGLnJ2dIFgca93GXXwihNYDs+B6xcyDRkjhXTrkJmUJi9K0lzsN6t+qzlX+AMifhr2Trtyc8flA7eyrDJwIkssaqY26ITpNXkI6Gw1EV4J+wkig6PFUurk9JzLJgZIzQuAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 603688c8265911f1a21c59e7364eecb8-20260323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:53c2fe51-b3fc-4bf6-a38a-b7d2616ee248,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:f5faecb29304ae6f81f80a3483c110f1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|16|50,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 603688c8265911f1a21c59e7364eecb8-20260323
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 912554415; Mon, 23 Mar 2026 09:41:13 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASOC: sh7760: Fix silence sparse warnings caused by the cam_pcm_data
Date: Mon, 23 Mar 2026 09:41:08 +0800
Message-Id: <20260323014108.118094-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using global variables in a .c file only,it is necessary to add
the keyword "static", so here fix the warning.

sparse warnings: (new ones prefixed by >>)
>> sound/soc/renesas/dma-sh7760.c:62:3: sparse: sparse: symbol
'cam_pcm_data' was not declared. Should it be static?

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412171210.7a4vH3Ew-lkp@intel.com/
---
 sound/soc/renesas/dma-sh7760.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/dma-sh7760.c b/sound/soc/renesas/dma-sh7760.c
index c53539482c20..c96907e708ee 100644
--- a/sound/soc/renesas/dma-sh7760.c
+++ b/sound/soc/renesas/dma-sh7760.c
@@ -58,8 +58,9 @@ struct camelot_pcm {
 	struct snd_pcm_substream *rx_ss;
 	unsigned long rx_period_size;
 	unsigned int  rx_period;
+};
 
-} cam_pcm_data[2] = {
+static struct camelot_pcm cam_pcm_data[2] = {
 	{
 		.mmio	=	0xFE3C0040,
 		.txid	=	DMABRGIRQ_A0TXF,
-- 
2.25.1

