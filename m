Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E97239E6E
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753813181; cv=none; b=ZzDtAA107O9JbyNPfpptNpQOzQcK5hEp8oqtDwTSZMr3pZkFWTsfoDzToNuUvdOU0pHheCngSE3K7321mbDGAQ+gr1UHf0L5wYtwLO/hUCO/8wCYzo0Cv87B9sg/sISvbcGnzmTyYaeXqU2kojvh5pRIyvHfBFJ2ml73slHdCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753813181; c=relaxed/simple;
	bh=sA4RPjAxM05RQekn/x6/fjnGX99Zklg8NEEyvJ7D9tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MzCkGWb2UjECWQUMX9PANu6NSoBOw8A1ejNWvOPiK0e0TWLwItwtgh8Xz3gQT7e/CWAPE7B2XUmVAcCcCqsl+IU9Gy5WjKtB/kVv+jovCnjpMkciXhCKkOA774igbFSL2vJEDam2m3sU3XOoQpY54bdq87V81+p4xpf+fvO/fJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=cvfpYPXj; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=Y6+9hpF/; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="cvfpYPXj";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="Y6+9hpF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753813170; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=Qjq7ANPEafKeVIOcRRoL6S8s3iv7vnOx3qEiXVCnF9A=;
 b=cvfpYPXjAPJqdWLDLhvP+zNzak9aw6cCnyBvbgVcBEsq3t4rJ5dMMMtesPfSU/bNHVsTe
 WDWld+eyfcf1svJaWKf8hgXX7Nuvv13Ifxt/IMx9TO0UbNxGNy47Krtov1/zjdt/qUYpO4a
 RX0geNnMJ2RavLG3vJYLS8HQntAVrH19UyzYvpzTD6eytR0Sc1TX10+nuNH5RCS6rnHbQX5
 ICSWHoqrc3Tfn1GeXcn/UuvPDM3nrjbG2aVWRllKbcBkj0kOCoyKzCvcrQOMqxafDEO1CkS
 pSSHf7VYMxiyLEVv/XCdO0VhAOc/XRFNVeypMyEGdkLnjjWUePojF9rZeFPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753813170; h=from : subject :
 to : message-id : date;
 bh=Qjq7ANPEafKeVIOcRRoL6S8s3iv7vnOx3qEiXVCnF9A=;
 b=Y6+9hpF/f39DZI5jMI4stC2sVtXSzsRLkZSVdGAN9C/KitUsJU5Vvbx8FSZgkyRlWqtsK
 IKAiCZC4BdtxSY7pr9AsNT3OwYSpiqX9s84Jl+w9DagryywvBbNl9JsF31pVGsV4hs5JvCL
 IT0Ac+HxATFr/4QPRNq6dxlC/p1JIXE357kk2uSoQonTiHBgPUaQrXUYI4RSw2kmBVECodG
 dqHoV5OJh26A8uj4r8Aho7C44+goseixC0Pd6gONPWZg5t4NaXfw+FaGyujBPPGDf8jrefM
 BSN0bd6RR+lUliaifADGxtIxvUmXyj7RzrIzIaLryd1IQrZo2HFFumMezEmw==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ugov1-FnQW0hPr2KU-NS42;
	Tue, 29 Jul 2025 18:19:22 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/realtek - Fix mute LED for HP Victus 16-s0xxx
Date: Tue, 29 Jul 2025 21:18:48 +0300
Message-ID: <20250729181848.24432-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854s11F8cfyv-
X-smtpcorp-track: MubwMoFkXbpQ.kw0rHaetnnwa.0kkz3QPHOTi

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on Victus 16-S0063NT Laptop. The LED behaviour works
as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 05019fa732..77322ff8a6 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6528,6 +6528,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bde, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bdf, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.50.1

