Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4522E3E9
	for <linux-sound@vger.kernel.org>; Thu, 17 Jul 2025 21:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752788560; cv=none; b=E99soHNHiia1zj8E4ecJB0fCbaZi1fI2mOVpbb3bLL/6KqRzzPHBNj3m2tzFGSLBH4UXGbK4UkpFpIJOTw5xa9m/n1BB7caL6iTs4f4eB6jy7qD42gd9bgUrXifnQyObR//i3/ng588Ld9+pLcPUmk9DwICIB+jHzSbEKsWWzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752788560; c=relaxed/simple;
	bh=mrddjCmvTYA6t5LbBy2FRPclddGvQ0AOTV6IHAyiYqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcQ927ptDJlJ1RVuEktZKRPgVRvt/AeluT//DseZ1IccKmjHfvFlboUwTzVpvdEh2FN3Bqct0jJ17GVA6rLpPGkKbOmLpR5L9DGGnEmHP407++anWAtiZUFVPghd9P/6jXZVltONP4B3vZutSn3NY+4ze+SzwyMVla+w4tPzi6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=DnCpy550; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=W6A8NT4C; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="DnCpy550";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="W6A8NT4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1752787645; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=Gfv0VoGpjGNOQhpz6loWxFeC3SOK7lyMb9kShZPEDbc=;
 b=DnCpy550e91Qdl7jGSgWhNvjfogWWCM0XnYhWOeGVREatjVriRQnx05BSOQdsHsOFFOF2
 ubDcA/CyvGI867AqZ0fbpx9zLRgl45bDatyXbqOx0/d6R/ZxfGeTmpPxQo8JEB4f5XBi+3+
 gNVt0XmBUlAL+rgKiUE/MLnB6q2any0bL7n8tXKvd+QIhgzoCAHMecnwG/iQh+Ft/ThQFyh
 l0lm6QrgfJYorUzpQ4wjQXUiYUfiTWeFD455afAyxZAZJlIKzeaRijfrDaYRGbq5P1rkt5D
 JsCrDKoDokjVQzjEamCDYU/7OiKaJwm3rRLIguqn9rK5qRHll25SRcJKC15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1752787645; h=from : subject :
 to : message-id : date;
 bh=Gfv0VoGpjGNOQhpz6loWxFeC3SOK7lyMb9kShZPEDbc=;
 b=W6A8NT4C3tpJJUBwQo6252wLrzotJc3m0Jt06zcU7bfsFz0vSi8n+7KMjosX2NV0mT60D
 48UGoJ0RfZT3m1Wq+iFaoncUnRZRwbyXG1uNu5JwcUpu3Z77vvO768vY8bcY9j+EsqsoDxM
 ojGEGOGjzy8csy6bKQyDWZ0HmXESWSci6VBmjB6iZ8NZTzPfMSDHkUXeva968oJtIRHAu5U
 Xokp+lteK59u4MiO9TdsgDy4hr8ON0sQ8tm/TP1K69ED+KmzqcCjdsdyatguE2NALHgRDCZ
 7YFsnNw/LNU8sHOQBfKVfk+2Mxj8r/z9YidrQ3FBdTii2uguLJ1CmYuwc3uw==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ucW8O-FnQW0hPoI3G-gXXB;
	Thu, 17 Jul 2025 21:27:20 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa0xxx
Date: Fri, 18 Jul 2025 00:26:26 +0300
Message-ID: <20250717212625.366026-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854supEO3aMoK
X-smtpcorp-track: Q1CGiLferKJO.kuc1Jrig6Saa.WohU4Akk2Bv

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on my Victus 15-fa0xxx Laptop. The LED behaviour works
as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 060db37ea..5cac18cff 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10769,6 +10769,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a2e, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
-- 
2.50.1

