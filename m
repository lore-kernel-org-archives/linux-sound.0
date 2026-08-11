Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1D3C1D73;
	Tue, 11 Aug 2026 02:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416564; cv=none; b=nOtQ5CSCQtRjYPMcgUtJYYRpT8oJvwFf0hsVCsFy0p9B8pHC8qWWOB7sxKnLchNQ1W0/wB1KA08vjQ9PGK6L+EJyKAk61NuvQ+NVYVlcycze4QR3UoBDpajjVU45WytZ9NnXuCw5oy/Ki5Z6iK/731O5kWPlpe4ro9k7BuhXjhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416564; c=relaxed/simple;
	bh=fp+XM4Vz+BPlH0ySVxrjZH6vNB2/J95GK23NPgeTo48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hASMkKNrMQ3cB6uvotsQxGwvbwHB1DFEymY+kuQD/EnsD2HW/k/f8Bqp03rv6FjgMpRu0D6My8wTE+IsORgpl7jCHBx6VRxyCM6PKqS43UQgtnBS/mGbkbfMUw+Vf3MmZ2ocP35qC5BLWpgN3mXJyNRe59/89F4TCdev/jB6WtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3bc23998952f11f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:86e884b1-962c-4f6b-afab-de8b0cc754d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:1d1c0fda6f0947dfd21f5a1842990838,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3bc23998952f11f1aa26b74ffac11d73-20260811
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 457040652; Tue, 11 Aug 2026 10:49:12 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 4/4] ALSA: usb-audio: Fix popping noise on Valeton GP-200
Date: Tue, 11 Aug 2026 10:49:02 +0800
Message-Id: <20260811024902.134457-4-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811024902.134457-1-zhangheng@kylinos.cn>
References: <20260811024902.134457-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Valeton GP-200 guitar multi-effects processor exhibits a continuous
popping noise (~6Hz) during playback and recording. Force implicit
feedback to resolve the issue.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221662
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6087daee939d..00b686a6c25b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2532,6 +2532,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x84ef, 0x002a, /* Valeton GP-200 */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
 		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 
-- 
2.25.1

