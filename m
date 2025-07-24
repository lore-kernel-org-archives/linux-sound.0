Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF21D63DF
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391491; cv=none; b=ucCb/dX6zmBCvx1SSHje2yviwzWPuLc14ddbA/CGyeg5qTXYAI9OeS6BS6fV90KXqD5i2RsTPnIixz0EWj2/kY3R55b9zS2jvvaXudgvhFV/FUN83iAk077Xj3mFJrDlfrGGwjc9BER9dlWYbweUL519Lqb7rff28WHCsz7aYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391491; c=relaxed/simple;
	bh=kPLRNSydlzHC9QbqM2fGWTepgluqgtSVkRAiz/qpfvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUhQaCPxnUXDXcWW20Sz1rdpwOcFhzPUrARx4d5v+AoCy2uU8fELBQOGyjypon3nUbrKgvh9C4jeANN/xulV+8vjoYvrFzFDhcvJE1k88LagdzvhHXQuAWCRyucMJJiJ0hw7YnV2TDLY9kKDWOwl56Vh85Iawa7ZMjPFhbRe/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=W+wNH4xS; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=nWZfL2Sf; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="W+wNH4xS";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="nWZfL2Sf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753391481; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=2JsRL/sU7gjCVQskAJOyJPP7Hoszso9kA5c3YVUXfRQ=;
 b=W+wNH4xS12nx9yH2zRQ1xEolTP8tLOOqrRs/1UfkxxvULq657c2k9yDCPTH5y7SbCpgCY
 i9cAcfIm8V5BI4NRufekOAA91UMqEz2rq+Z/z9ob3viLgz12IickFpTRYKSehTIGYv/G3Ad
 l5teomNCZjnU+dVK90pAxxMJ0vgFrZZORgvPa73j/i41cayOq6zVjcXajB8EB5+7GVD4K9D
 p4nE7IGQj+uWRwHZTC6vHc/0IgvnJSFBo4hz/OnKuUeojL2d1VC3xJWy3S32p4zWrOEjlyh
 v8mdJt1fGJEtaVZGXeOkdAPyh0aOu6xMGljk/P3moHSDzYC7BrkSqDVomZSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753391481; h=from : subject :
 to : message-id : date;
 bh=2JsRL/sU7gjCVQskAJOyJPP7Hoszso9kA5c3YVUXfRQ=;
 b=nWZfL2SfgllXfbtezSvSyO0Ul6XEwWG5Q7hwOvgXH8uI9E6h1GnWIBI2TX7mwXA/x5BgQ
 cWxtElyIJMdCnRPcG/LQQ5Xv/BliOtS5IUneLE4//VDvr/sZ2BniHGJT4XZZygTWJGrRG+I
 maDdeX2Z9eI4jozCMFBBHARGjTeNSiuMmj8cM0/mp73vXHJ5k++rm3/LM6W1kQZZLwgntQU
 ktq6FizSiDgvud7OAyjf0iZetTfqXoeq0X49k+/RnWB6pArF6NqY9DilmEACKDByDsq3h0J
 Au8Nwg5KGJ8oKRHrDZJDholtcet2XHk1ozpJUzO+h59z46Mvf2OvAVzVUS4A==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uf3De-FnQW0hPlgfz-iQGq;
	Thu, 24 Jul 2025 21:11:14 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
Date: Fri, 25 Jul 2025 00:07:56 +0300
Message-ID: <20250724210756.61453-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854s1IhQhYw_2
X-smtpcorp-track: l4PljnITNUZ9.ntG1zrPfMkrJ.Oh2gRwvyho5

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on Victus 16-r1xxx Laptop. The LED behaviour works
as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2627e2f49..9656e6ebb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10874,6 +10874,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8c97, "HP ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8c99, "HP Victus 16-r1xxx (MB 8C99)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.50.1

