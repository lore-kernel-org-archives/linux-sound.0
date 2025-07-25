Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713423504D
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455088; cv=none; b=P0y3RTGUrWupKFefG4UNMs10r4hEX3EH0sQf5IUFLGKdiug6Ux1Xh4vps4wDeVfCygA+/cu6XzQ2ZtebqAB24IX58RmNXfFujlcNbfiWS7XGVXRJRCBdD1Dlo+LHSxGsxJ/U5x16tjdNGrjuJl2mUrav++8KrHyI4rM6zPtIuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455088; c=relaxed/simple;
	bh=woIP6dtlEzDY0l3M0VQ4FGnewBR2yOUwHMm735zXzLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z87W2FjSWPT20C+0CjGj9OlhvVnCy0DqTDuVS1ArqQfCVeMNCp1qra78sIr7NN9zfVTLO1V5kEwrYGenUWmMxHtF54/Th+A5shzsHzyeVBAZtA1NiwJF0OvYZaE+r4mDcMThybV78XDEobT2Q+0uaTDX7D7CFJfkJWkVAPodfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=bORYrHwf; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=C3a19cs5; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="bORYrHwf";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="C3a19cs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753455085; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=1GYi97gw+l8m43s+LjoRWyK8qB47vHIEsv3nJylYdBM=;
 b=bORYrHwf6HGAcHG8Zli2B8DtlppRGEH9Dm9Z1HUoHF0V6yps+XScYhmae4AnrnvYFRWTC
 rzzsrQsHF9/R+xjweENtP1/81UbYO9XTHaqYg2ZjhcRFUAIz1M2mbkmB8b9Y6KUtBWtfnoq
 sx1kvrLqLt1T19UugbjNiF/yhrVOP1y4wDPZO8LjnfMtaX4+MQladUKZ8H8iofo5X6UQUjo
 aVacHKXTSd4iTK7yjHHsDJlE8V3HTYiD1FNjlPjgkAeWY8EBYdxmV4w+bcXC/tuzLNX2rwZ
 QPHzUzuWh2D8vjyPZhBUPgj5wguFCwhiCcBmt+yI/8vmsqAXfzVNIpxVtJzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753455085; h=from : subject :
 to : message-id : date;
 bh=1GYi97gw+l8m43s+LjoRWyK8qB47vHIEsv3nJylYdBM=;
 b=C3a19cs5uUOjrUvHFP1uMRY82BrE5Fm88fkgxGRFVEoH3lx4PjhZQvqRV+353cbmsQf49
 s/dZcBBSE2T3n6qUVKV3nXovG+gE2NpPQGPWU4EWVRYH0EiVTq6riyrKxLCh7R1xwb6utAp
 flefRRn1oEMc/AFmthXptEF1EZArdPimDlohRTV2EFgHd1yZ9kGYZRfKHyYrnDrgIasGLY+
 bvEXzk2kt38xfEGjQ6QV6UFvH2d37Y+bYvUBRJBrm8r5zY5/bWlVSnAf1yP7J73YUteXBXI
 fWdp/qAnEYyRwSPx1A6e1JyhGsUF9Z/J2tZRRT+Fv7yeZ2j994gNLRySN1tA==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ufJlS-4o5NDgrj2KV-jQC2;
	Fri, 25 Jul 2025 14:51:15 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
Date: Fri, 25 Jul 2025 17:49:12 +0300
Message-ID: <20250725144911.49708-2-edip@medip.dev>
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
X-smtpcorp-track: M4MQAy-jft76.1dMQCYbZVhw-.96ykVQ-B4wc

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on Victus 16-r1xxx Laptop. The LED behaviour works
as intended.

v2:
- adapt the HD-audio code changes and rebase on for-next branch of tiwai/sound.git
- link to v1: https://lore.kernel.org/linux-sound/20250724210756.61453-2-edip@medip.dev/

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 05019fa73..33ef08d25 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6580,6 +6580,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8c97, "HP ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8c99, "HP Victus 16-r1xxx (MB 8C99)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.50.1

