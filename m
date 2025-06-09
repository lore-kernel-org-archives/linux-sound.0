Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1642459D1
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456251; cv=none; b=RG0Yo85TC71YEvl2QLuZMtDd3bxQOwnbjGsonmWbAhVDNhxEIvOmi+FS7aWtPfX0PwH9QSujN78Pxf1H4drrEW+dh9j+5NlAQQqWPUoCNl46mKih95cvs4fjicb7RIS6Dlg0piUytSUzMoR7rj4M203fcVtg2ei4Y9834oEL8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456251; c=relaxed/simple;
	bh=7VIXiVnLp6xUMZfeU9BYhxVdq25YMhx1Vl2EPXeFzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYAhLkkQA4CSX8+cWRGcrkRDG7aluO4J4mdF1JewM0AK7S4cuHNMK0wdSwuBVlRzK91BCq7NFO3haAMiAY/obAhlWPwpM2sYlhvsXZZyT6xqpYOrDcM9ugxsJoaU8Ou3GzdZg87/nPX2DcOzr+LVJb50zR6T31ygI4MAMD6ccsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=YMZRFFX5; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=mU60Z7Fh; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="YMZRFFX5";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="mU60Z7Fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1749456241; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=OAD1I4lKD9GurTiefje3GPSgP3drA15uqZbSTFtnYlY=;
 b=YMZRFFX5YW323plcVIGPCDZcl1nQ8/KQRnU0oWifT/ep8imYDttrM1CfLJmwxxvOY7NAx
 5xemnmJgbaeJbHvOmn2/u7kEr78KwXhoCMnNpIBrwtDHi1UHK/1melxYMz9dcmbn+Mnndzm
 cMLxE6/aAlNuLj769Q8czzDB0jXqymld6taAvEKX8vr1h8pDDCTManSBrQ5t9PtCXnVhhkY
 CUgwfT9dQjw84u5/xYjVvYZPPMFKg9fAt5IKiJXHtKTxsccc3wu7BgdnuQFHyNrcoYOgI+S
 56N06rYC5GVzgYr9Z1gTVpX0GkmayyFyiPPuxmOiLnKDR3kPVVMHihLOAxnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1749456241; h=from : subject :
 to : message-id : date;
 bh=OAD1I4lKD9GurTiefje3GPSgP3drA15uqZbSTFtnYlY=;
 b=mU60Z7FhFiYg1gnObiC9lxQRlh9lXpUc/ZCfEOu8IppUMAwjZjssqc9YVlLGB/P91qfa9
 DOpMq6bXdwGiK08n9LQRX0PgSfJfm6DUnw1CFkt0Zbf+ns+XtPPQwlXb67AwfwUIsvAXEms
 d0K/7ymtJ0hpEWflHkNnSHnJQMa7AodQyjC4yOLtZsCuhNVx8KHXb4tKaMrUgDlM6YEZ6gj
 7meawRXIlghadS3JvTuPvVqcSDtqQcC7gdpeTN+TiHkjgkW90o+8nRmRMnrzc5Czevox5ZE
 j5Y8775D+VCZI5hAVoRTAsdszzAmV7o01NRDP8F6wuxNQujuaKtuL/4uxsmA==
Received: from [10.152.250.198] (helo=localhost.localdomain)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uOXU0-FnQW0hPmmyb-hAwU;
	Mon, 09 Jun 2025 08:03:52 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx and HP Victus 15-fa1xxx
Date: Mon,  9 Jun 2025 10:59:44 +0300
Message-ID: <20250609075943.13934-2-edip@medip.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sVoHSOn4rB
X-smtpcorp-track: LzJ8puFTQq8Q.S39vPUXB9bLL.fOw0jQdROiu

From: Edip Hazuri <edip@medip.dev>

The mute led on those laptops is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the devices.

Tested on my Victus 16-s1011nt Laptop and my friend's Victus 15-fa1xxx. The LED behaviour works as intended.

v2:
- add new entries according to (PCI) SSID order
- link to v1: https://lore.kernel.org/linux-sound/20250607105051.41162-1-edip@medip.dev/#R


Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba73..c70bee626 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10787,6 +10787,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bde, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10840,6 +10841,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8c97, "HP ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca4, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.49.0

