Received: from mail.furst.blue (mail.furst.blue [194.164.54.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8333C18B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.164.54.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781036257; cv=none; b=fnmfJ7gZFKrmdyyERxCi9xx+cfbrTE5HDmHKylZQQSupudjofpTOiyyVoK18LRzj8lTIiLQH3oMITxyzjvY0Db23s27biAauFG6ViDEYnMHD+2wsnj+6x+08AV/OJffN1cE029IMio9YMxBNiW0JfBVUCPbyTjyZMDCccAAQlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781036257; c=relaxed/simple;
	bh=0Hg4tPCMfrugvni1af4f972jkXP4g2mgFqjoxlPaLRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HW+rnxP5iAQHCfBR6FGgw+FFVaymHXtpTuP+NHfFjp2/qYUUM+qnKAulbyS6hQtiIgBJKEa1NjfuEaUYUHIy4rLBgndPjFQCzLNStzW7eTqJvj0g/423jaD9Dks/Ku+Ipv63onKWCo9E0DnzR+1izkxtYTCS68q0JMSodrkvfWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=furst.blue; spf=pass smtp.mailfrom=furst.blue; dkim=permerror (0-bit key) header.d=furst.blue header.i=@furst.blue header.b=2QLO3d1Y; dkim=pass (2048-bit key) header.d=furst.blue header.i=@furst.blue header.b=iroyzRgJ; arc=none smtp.client-ip=194.164.54.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=furst.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furst.blue
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=furst.blue header.i=@furst.blue header.b="2QLO3d1Y";
	dkim=pass (2048-bit key) header.d=furst.blue header.i=@furst.blue header.b="iroyzRgJ"
Received: from k8s-mail.magi.furst.blue (unknown [192.168.208.120])
	by mail.furst.blue (Postfix) with ESMTPS id AA43340100;
	Tue,  9 Jun 2026 20:17:34 +0000 (UTC)
From: furstblumier <seal@furst.blue>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=furst.blue;
	s=dkim-ed25519; t=1781036254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sMIcxGQxFH2zTRQLBBx52uh5KCOcwTjhjoGXdk5q/1s=;
	b=2QLO3d1YMI9XA2zd+7VMhAOpyUcG4TdCnuuo0fxGFwO+HUVRix7G5F7AjOHQV9xDn06vu5
	kFicZSMi4lKd/3Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furst.blue; s=dkim-rsa;
	t=1781036254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sMIcxGQxFH2zTRQLBBx52uh5KCOcwTjhjoGXdk5q/1s=;
	b=iroyzRgJPLeD+wtmrqL8WPon1/vc4dbcT/ArOw+LD8xPyVeI65lQ9bhhu5GhSUuwgPyY0V
	mKFVBibYMatoobHAiYiyGBCyDkDglcHOld+EeIqJX9aC8XSOw0CEKK2nw/ucc+ZwLs4Pt3
	fSncDH560LJw1/jqJHbgqizsN7AuxZLI+yZycoYUCp4HVFLMDZokLEK/fSMPNDGCLO0p0I
	LC5IWP90e3POtxSlLnzDjLlhPRCb9KwTyey/F+j3dizUWqP43TJiKDIlr/YzTx/hL0hyna
	kMTcReT+wf9jvmEfMAuHQJfb2j3XbrMzFnHL06BjlD6M3MGOfnBVdkbo8kuCYA==
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	furstblumier <seal@furst.blue>
Subject: [PATCH RESEND] ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC
Date: Tue,  9 Jun 2026 22:17:06 +0200
Message-ID: <20260609201706.502075-1-seal@furst.blue>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 255 15.6 inch G9 Notebook PC (PCI SSID 103c:8a1b) uses the
ALC236 codec but lacks an entry in the quirk table, causing the kernel
to fall back to a null SSID match (103c:0000) and skip the necessary
fixup. Add a quirk entry using ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
matching the HP 255 G8 which uses the same codec and fixup. This fixes
the mute-button LED and fixes an issue with unplugging and replugging a
headset jack not being recognized as an audio sink.

Signed-off-by: Furst Blumier <seal@furst.blue>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed..08c8b17b7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7063,6 +7063,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a1b, "HP 255 15.6 inch G9 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.54.0

