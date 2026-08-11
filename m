Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755CA3C199C;
	Tue, 11 Aug 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416564; cv=none; b=TMbdnQqoN8pUgeIVDgjAmC0jTi+DDliCFZER7SybYIvYqmuel91CB6k+z1m87kUVaxSGFLkzviNzUTex3GK+VA920dUQ263M9jmLfW1cbqGFPk3mvlIc8H5OJYot++G/75fA6JvmSebBv/3GyWj+3om8EByRX+oqoM1pd2LAuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416564; c=relaxed/simple;
	bh=eDiLxfak/M5oewyD3pFJ9J8UqREpaI/09u5JwT27Je4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfu1sGZTdrTxb/OTrE5tPr7rKt20tSIB+fIUvTNq5G3JN2G0iqIoId5u1IRDRhPt0jXeK7LAi1wcbJqBySXsFMi3A9gBNhbgKJiPNAk05N11pNAr/snmubcxQ91/CItWqw28HqMjvV3uMHO4dnNBHr/CDlCfUQAZ5Ckj+kQmaGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3ab7808a952f11f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5e43b0a3-ae77-4c82-b767-2ead35d82bec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:14b7678de31a98e3ebc448e62ebf9e85,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ab7808a952f11f1aa26b74ffac11d73-20260811
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1030912656; Tue, 11 Aug 2026 10:49:10 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	=?UTF-8?q?Efe=20Y=C4=B1lmaz?= <efe.tcyilmaz@gmail.com>
Subject: [PATCH 3/4] ALSA: hda/realtek: Add quirk for Lenovo Legion Pro 5 16ADR10
Date: Tue, 11 Aug 2026 10:49:01 +0800
Message-Id: <20260811024902.134457-3-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811024902.134457-1-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Lenovo Legion Pro 5 16ADR10 (codec SSID 0x17aa:0x3926) suffers from
distorted/crackling speaker output, as only one speaker pin is driven
without proper COEF/amp initialization.

Add HDA_CODEC_QUIRK applying ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN
to enable both speaker pins and proper amp initialization, restoring
clean audio output at all volume levels.

Tested: Both internal speaker pairs are now driven correctly and
distortion is gone; headphone output remains unaffected.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221595
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
Tested-by: Efe Yılmaz <efe.tcyilmaz@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 445b0ed4ca43..c1c70be8fb8f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8075,6 +8075,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38b8, "Yoga S780-14.5 proX AMD YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38b9, "Yoga S780-14.5 proX AMD LX Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC", ALC287_FIXUP_TAS2781_I2C),
+	HDA_CODEC_QUIRK(0x17aa, 0x3926, "Legion Pro 5 16ADR10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	/* Legion R9000P ADR10 shares PCI SSID 17aa:38bb with Yoga S780-14.5 Air AMD quad AAC;
 	 * use codec SSID to distinguish them
 	 */
-- 
2.25.1

