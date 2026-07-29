Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F345486635;
	Wed, 29 Jul 2026 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329786; cv=none; b=LGMlTFoMQY7NEy3uLKBPQDXuA5kEs1bF8Lfy5/5dbP7YTN5OWLWDPQfUWvU5UtafX+9R8R0wDwP65ELWDh1GHixbveGtOwKEH3RapUuijpWcrXGwLFXJpMU6NunBIAptAQIUArKom1/pJq7N4BpdLTl5m1hLbh6HHEVshWcp7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329786; c=relaxed/simple;
	bh=vGdndHEKasRyu8kdeU8G+4iiiCMd5EUmJPlmAgQC5wI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XtMGRM9nRVDrw/7c3NsbINtPdPZP68GxbyFhu32g0T81arAtvBkbK00+AXD7R/n7rgZG232tHyB/auTNrkZOZozL6bLc+/U+NkpQ4kAAbTju7NaSgEYErMxX/1ZL7AwTf8rfMB/TfXWfuAug3h/nP0AwD7Q2/48DiNkV4mSTUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d270a7408b4c11f1aa26b74ffac11d73-20260729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:75b52762-e647-4e7e-b98c-115de0932f2d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:d936f81d92329106bfa8603e43914e90,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d270a7408b4c11f1aa26b74ffac11d73-20260729
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1728483183; Wed, 29 Jul 2026 20:55:48 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/intel: Add Star Lite Mk II/III to power_save_denylist
Date: Wed, 29 Jul 2026 20:55:44 +0800
Message-Id: <20260729125544.539067-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Star Lite Mk II (0x10ec, 0x111e) exhibits a pop sound
when the speakers are used after a period of inactivity.

This can be resolved by disabling the HDA power save feature
via "options snd-hda-intel power_save=0". Add the device to
the power_save_denylist to apply this workaround automatically.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206623
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/controllers/intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 9a5c61f43011..eda89ac83262 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2316,6 +2316,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x17aa, 0x5079, "Lenovo Thinkpad E15", 0),
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=220694 */
 	SND_PCI_QUIRK(0x103c, 0x8a6b, "HP 89E9", 0),
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=206623 */
+	SND_PCI_QUIRK(0x10ec, 0x111e, "Star Lite Mk II/III", 0),
 	{}
 };
 
-- 
2.25.1

