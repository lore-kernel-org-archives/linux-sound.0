Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50223EAA3;
	Mon,  2 Mar 2026 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439196; cv=none; b=RDNQ9Bq8Fb60+mEQ+c5CfMe2Sh4qIl/50X9ZfhLqtuOPvT3Q5sb2XYCh/U+QYR6U/XMS11OtTt/PRrSxt7bMudR96iiORCyHLV7OKYA23U/wIun9HgFHViCTvg432wwZd5zor0xqkIOCkBhXJJm6itCzEOT4QT1vgCi13RS8PXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439196; c=relaxed/simple;
	bh=Qhd9YzgMTJ5QO2bAlMOa5KAgkWhyPwhhkAra8nf7850=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nJ5zPSGUsgX0U20uGnCw5bjTzjnHNVaAYT0k1wGI5s3x08lp3TEg4eiyi5jjvRcZ967r72lNFRDPsNtuggLA8f7G/Shzbq5PWRXotGt0+hdvevnVJqldALDvqj/OSWFKU7z16StVw6/n0wNCIvvpMeYQM/Tegp3I3Do1cx36Afo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a0639382160f11f1a21c59e7364eecb8-20260302
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:84c2ed59-6583-494d-b279-9c0e447e15b3,IP:10,
	URL:0,TC:0,Content:16,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:46
X-CID-INFO: VERSION:1.3.11,REQID:84c2ed59-6583-494d-b279-9c0e447e15b3,IP:10,UR
	L:0,TC:0,Content:16,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:46
X-CID-META: VersionHash:89c9d04,CLOUDID:91b26667360b049e7470f5975cf4239f,BulkI
	D:260302161301WHQONR5C,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|850
	|898,TC:nil,Content:4|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0639382160f11f1a21c59e7364eecb8-20260302
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1599617191; Mon, 02 Mar 2026 16:12:59 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Synchronize the module parameter values of the power_save
Date: Mon,  2 Mar 2026 16:12:18 +0800
Message-Id: <20260302081218.771520-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In set_default_power_save, if val is 0 and is not assigned to
power_save, it leads to incorrect reading of the sys node, resulting in
misjudgment, so modify it here.

Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
 sound/hda/controllers/intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 3f434994c18d..6c6564396637 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2306,6 +2306,7 @@ static void set_default_power_save(struct azx *chip)
 		dev_info(chip->card->dev, "Forcing power_save to 0 via option\n");
 		val = 0;
 	}
+	power_save = val;
 	snd_hda_set_power_save(&chip->bus, val * 1000);
 }
 
-- 
2.25.1

