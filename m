Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB437A847;
	Wed, 12 Aug 2026 03:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505420; cv=none; b=Q/mcL5LV4cZr9EqCDLy9BkR2WLxbsCP9HJ9s9rhoAVTI72wW6WS76grdBxFUGiC07r94m1MLagZd5RFh4i6/LFzGZSqFQMQ/ajCIyU428dYgrbJfYGxw+1U8fZUMXRcEYRRvRzCq1XqyYURIX/4vjs3+pz9Y4tcm8es2x/jic3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505420; c=relaxed/simple;
	bh=5MSq9BTS+93aC9fjY+BJBzTc5sQEtZdarKpG5OUzeHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U23QT9KAjfUSzLHiIVpVCeatcd+kfba5cn014v2nccqx1saGkZzVc0Gwk62TInkpxH5jWzwDJtrDBEarqnIwtZ6tXoRos2rlfd4MMQs4+imHShWwqahUmtA/ZqDYUDex0pvPCG1CHh/KWDTjZUgLwPThcDSYHU5ACcDliOmBxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1feef67895fe11f1aa26b74ffac11d73-20260812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:346bd870-f881-42ab-a0ff-e4a27d517b1b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:cfec7c53279e1cdad8bd240294c4eb58,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1feef67895fe11f1aa26b74ffac11d73-20260812
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 414850369; Wed, 12 Aug 2026 11:30:11 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH] ALSA: hda: simplify match functions and remove unreachable return
Date: Wed, 12 Aug 2026 11:30:07 +0800
Message-Id: <20260812033007.633564-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

hda_bus_match() has an unreachable 'return 1' after an if/else that
covers both branches.  Remove the superfluous return and simplify the
control flow by dropping the else branch.

hdac_codec_match() uses a redundant if/else to return 1 or 0.
Simplify to a single return statement.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/core/hda_bus_type.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/hda/core/hda_bus_type.c b/sound/hda/core/hda_bus_type.c
index a4afd41b6f84..e1e986a8b5b5 100644
--- a/sound/hda/core/hda_bus_type.c
+++ b/sound/hda/core/hda_bus_type.c
@@ -39,10 +39,7 @@ EXPORT_SYMBOL_GPL(hdac_get_device_id);
 
 static int hdac_codec_match(struct hdac_device *dev, const struct hdac_driver *drv)
 {
-	if (hdac_get_device_id(dev, drv))
-		return 1;
-	else
-		return 0;
+	return !!hdac_get_device_id(dev, drv);
 }
 
 static int hda_bus_match(struct device *dev, const struct device_driver *drv)
@@ -59,9 +56,7 @@ static int hda_bus_match(struct device *dev, const struct device_driver *drv)
 	 */
 	if (hdrv->match)
 		return hdrv->match(hdev, hdrv);
-	else
-		return hdac_codec_match(hdev, hdrv);
-	return 1;
+	return hdac_codec_match(hdev, hdrv);
 }
 
 static int hda_uevent(const struct device *dev, struct kobj_uevent_env *env)
-- 
2.25.1

