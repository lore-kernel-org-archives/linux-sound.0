Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0B18595F;
	Thu,  9 Jan 2025 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441716; cv=none; b=jK3S8XOC1pcqgGLZaev6VeZBJpRntGKTEtzqZZAl6aMr2xe4ARmhixHMa4oBT0CQNdGMkXsblMpeuXSQYNBXvVMPKuNYGO2CRoPou6EeWxJrO6HNDz68U4aBmur9nwnCmb3xP6sErFmOMWQRkkDl7qxMcj9frGF38nhj/a5ushk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441716; c=relaxed/simple;
	bh=tzO1DBoOElUU8A5ypaczXJ/AYJVVSnHVbLs/W5TMwZY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uwhv4uXHqLSP9aczVNhaL33zLmtt4dj/1U+XY6fQ3soYxmVOCgEMkqgVGODfclo4rfz48trxQPNv75j6OasaMg/36ZjrCgsFKBE8ob4aVITG4n0hHk28+AmsQV3/KAyxbI6cJdrIllAXWy8AleoqzCrHt7dX/m6gLtNkogl7JPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a3owuw+N; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a3owuw+N"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5095M0eO020035;
	Thu, 9 Jan 2025 10:55:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0svb3xAEX3NUzRN9
	B1i029gan3zvQIQ/GiAotewhGME=; b=a3owuw+N2MoK+gpsZ3L/Mr3PiGWUwYf+
	XEnU4Th2MWap+IgBsutvtbBF4vsPRfj2ceg1ZtMDBflt2Xg5TZFVliNgLMkYo+zi
	BDLhBRQ/UamGaU2lbR/Z8KYdHR0NG1XseV6v/irlRFQEVNX1iuT5rmejHfwCLBDG
	kL+hEj/VAJ/6TV2kRXAkCOl5YBANWkf1vDKBHh+7nFLyyHdSEqE8y5TLvB7xTzEO
	D4U3cLmSZhEoWfHGVxO6FygKzwL9EMeuX3k7iusdO2CGK3i9CNrLbfxtIpJGOt6t
	KkWzY+VqqD1Ev4Xtq2ZV7NtipSUea4gpzw/7yOfglC0OBgtgv57A4A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29keday-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 10:55:06 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 9 Jan
 2025 16:55:04 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 9 Jan 2025 16:55:04 +0000
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5A72F820248;
	Thu,  9 Jan 2025 16:55:04 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda/realtek: Add support for Ayaneo System using CS35L41 HDA
Date: Thu, 9 Jan 2025 16:54:48 +0000
Message-ID: <20250109165455.645810-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 44otfuz6pb8Wlni6qP_lCD34biKxE33O
X-Proofpoint-GUID: 44otfuz6pb8Wlni6qP_lCD34biKxE33O
X-Proofpoint-Spam-Reason: safe

Add support for Ayaneo Portable Game System.

System use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f578b9893a8f..00da1449b647 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10993,6 +10993,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
-- 
2.43.0

