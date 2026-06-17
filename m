Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DA1A317D;
	Wed, 17 Jun 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664766; cv=none; b=XWU632bSAJEuniTJtVPMaDSRi/vCzNQP/gfN8DBBPWARqi44bR5/eVvajCQqC/IrSpOKxF+Fxz09G+mPqIbJU0yMx2YdRR+GLHRuDEniZtj6qSe0EKbikFh+FfR75Op20DNI3GUnAdmNdTV6CksgqZoe2XZC87V5FSxCfyS+Ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664766; c=relaxed/simple;
	bh=JTII+P4A4RKwW95knSuB6+q8kM13HUjbp9rMuFS9akw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S8bmm7KS6JKQ52YJbuUjgGvQFgVc+u/g9ljX/cc8nz9FwQmtoNVXI3iY/4HzaA7drdq6frqGeLfIyPg+CuWZTO9rGIYR5xcXvDK9qH5gk9pSVX92YUxi2Ksz72SsnHt7znGFr1u9nEbNCkHQziczvg+snpDGapgUKjWE9qf8JmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 99fed40c69f711f1aa26b74ffac11d73-20260617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8f298ffb-71e7-439e-94a1-344c664ac186,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dbae2ecf8b9dc4c6123fb45d81943dc8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 99fed40c69f711f1aa26b74ffac11d73-20260617
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 787350998; Wed, 17 Jun 2026 10:52:38 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Add quirk flags for SC13A
Date: Wed, 17 Jun 2026 10:52:34 +0800
Message-Id: <20260617025234.3344935-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC13A ( VID 0x1ff7, PID 0x0f81) not support reading the current
sample rate and results in an error message printed to kmsg. Set
QUIRK_FLAG_GET_SAMPLE_RATE to skip the sample rate check.

Quirky device sample:
  usb 3-5.2.4.1: new high-speed USB device number 11 using xhci_hcd
  usb 3-5.2.4.1: New USB device found, idVendor=1ff7, idProduct=0f81
  usb 3-5.2.4.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 3-5.2.4.1: Product: SC13A
  usb 3-5.2.4.1: Manufacturer: Linux Foundation
  usb 3-5.2.4.1: SerialNumber: 000002
  usb 3-5.2.4.1: Found UVC 1.50 device SC13A (1ff7:0f81)
  usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
  usb 3-5.2.4.1: Warning! Unlikely big volume range (=4096),
    cval->res is probably wrong.
  usb 3-5.2.4.1: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
  usbcore: registered new interface driver snd-usb-audio
  usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86
  usb 3-5.2.4.1: 3:1: cannot get freq at ep 0x86

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 46718c5499df..e6c011cf8ffd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2413,6 +2413,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x1ff7, 0x0f81, /* SC13A Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
-- 
2.34.1

