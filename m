Received: from mxout1bln1.prossl.de (mxout1bln1.prossl.de [91.233.87.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016132147E6
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.233.87.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802532; cv=none; b=unCHEf7gpzZy6CNKUEGFJc8m5GoN6MYiVxXJdfw5ACVzpCyyaWhAfiIp+1V2yHKwCLru56/dUQidxpyMcbEkhbahLQF2Y6+rTDGLO8ZTZleLZf3ES43qUEV2HVlQJdg5LnnNSQKPB/Ai1VMo4Qh0jo1TiSXTkfntY2U5qVFCGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802532; c=relaxed/simple;
	bh=7eKXagXbPZQY3an9lPRtiyoRbAL9fb9aews5wuK36JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mZFlNEz408BnUn57snVmseLd155Y9kXm9GxxKIhQdSf2dJbFryP/8mdjUmOGfjNtl0I+7NJxiIerbDLM7PM1exMZd5cvHnmPTzY/5L8DBVYthH5JpY2II3xFT2intl58RCi7nO+hqfwIbioYu1+XORPm0x6L7KPrk0dHon6DRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org; spf=pass smtp.mailfrom=kuechler.org; dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b=b4oIv2LA; arc=none smtp.client-ip=91.233.87.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuechler.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b="b4oIv2LA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prossl.de; s=prho21;
	t=1779802520; bh=H3NZCe1TcvjHrXv7KRgT2wIle/IEImFjJQxYXhcgs0U=;
	h=From:To:Cc:Subject:Date:From;
	b=b4oIv2LABKMTEgxCTOFNVFOYh9O/6VboH5q+/b1RCbI6rZZiOK+xm3aHAWF/4M0E1
	 DJj4Ca0vkx+smWzRIW36arSQjKK4v5HqK4SDTZdQKzMY7sZGNjmSTFvPI3I+J3NlyQ
	 2kkopiWQYPzkp2k5pqo6ONuAOrkWd0MddeKvdeWs=
Received: from uk-sirius-cachy.internal (81.60.148.243.dyn.user.ono.com [81.60.148.243])
	(authenticated bits=0)
	by mx1bln1.prossl.de (8.18.1/8.18.1) with ESMTPSA id 64QDZJL2077305
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 26 May 2026 15:35:19 +0200
From: Uwe Kuechler <uwe@kuechler.org>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, uwe@kuechler.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
Date: Tue, 26 May 2026 15:35:17 +0200
Message-ID: <20260526133517.17485-1-uwe@kuechler.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Null-Tag: 7d04ecf01c6d633c4679c067163f6446

Add a device-specific quirk for the Novation Mininova synthesizer
(USB ID 1235:001e) to enable proper recognition and functionality
as a MIDI device.

Signed-off-by: Uwe Küchler <uwe@kuechler.org>
---
 sound/usb/quirks-table.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4e9cfff4047f..7ee7c7fc60ac 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2131,6 +2131,15 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	USB_DEVICE(0x1235, 0x001e),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "Novation",
+		.product_name = "Mininova",
+		.ifnum = 0,
+		.type = QUIRK_MIDI_RAW_BYTES
+	}
+},
 {
 	USB_DEVICE_VENDOR_SPEC(0x1235, 0x4661),
 	QUIRK_DRIVER_INFO {
-- 
2.54.0

