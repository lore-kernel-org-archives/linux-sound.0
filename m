Received: from mxout1bln1.prossl.de (mxout1bln1.prossl.de [91.233.87.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9CB33F585
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.233.87.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810985; cv=none; b=TMXoRo40/GMKXy9LNEvVPl6cADrbvt6V2fXAsvfMNQwsGhj9TEdi13clX5H1BZZqeaCaK+jZRefeUF/ZQzsiYCbvEg4Jgoj9RAMW8pS9jf1hWvb0dG/7SO0Fy6evWYOIo1EI4uGTWstTPoy8fJJ61dStFhX/gAH7+DxwLbyaJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810985; c=relaxed/simple;
	bh=nxYN/Ex761UEcrhA1rOASHsVUMHQkwUcsZ80Q1XgUKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rlZuY+mqFZsX1V4tKKlDT4RHC0MqfeGkTM5wev+FZyTGrkIrKizZ39X+vMf5Rp+/Mc6us2N6v13hRED8CR1YHRoDQiBATvuDHMKt5AJWeXhnDB3CnhjVclGIZJBV91haG9lBW/EE7egyAYZq9X6o36DuVkk/8aKAdb565t50AgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org; spf=pass smtp.mailfrom=kuechler.org; dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b=W4c7uXlJ; arc=none smtp.client-ip=91.233.87.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuechler.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b="W4c7uXlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prossl.de; s=prho21;
	t=1779810969; bh=TkkbpS7eUFQW4wXvz270ZpCiBhbkP2ZB7mX2erMsg6M=;
	h=From:To:Cc:Subject:Date:From;
	b=W4c7uXlJO7WRshZGnRmFvMbwreWWQEy8tOrHFnh1cFg0YSkqQqKvXmb4uF/Ud5HIB
	 FaIiACSKTcpAWnfZWyY1RRgzYWBEA+fx+Psfgab/Ft8V0Idfnm4ChR9ETULUZkFhM1
	 e1gAX8BQSqqpFCjlCGaFn31DD6aunuRBWdT+9UF0=
Received: from uk-sirius-cachy.internal (81.60.148.243.dyn.user.ono.com [81.60.148.243])
	(authenticated bits=0)
	by mx1bln1.prossl.de (8.18.1/8.18.1) with ESMTPSA id 64QFu8Q6086527
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 26 May 2026 17:56:08 +0200
From: Uwe Kuechler <uwe@kuechler.org>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, uwe@kuechler.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
Date: Tue, 26 May 2026 17:56:06 +0200
Message-ID: <20260526155606.6294-1-uwe@kuechler.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Null-Tag: 9d74181e457e6ecbab0448bd53c35327

Add a device-specific quirk for the Novation Mininova synthesizer
(USB ID 1235:001e) to enable proper recognition and functionality
as a MIDI device.

Signed-off-by: Uwe Küchler <uwe@kuechler.org>
---
 sound/usb/quirks-table.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4e9cfff4047f..97f28c53d201 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2131,6 +2131,14 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	USB_DEVICE(0x1235, 0x001e),
+	QUIRK_DRIVER_INFO {
+		/* .vendor_name = "Novation", */
+		/* .product_name = "Mininova", */
+		QUIRK_DATA_RAW_BYTES(0)
+	}
+},
 {
 	USB_DEVICE_VENDOR_SPEC(0x1235, 0x4661),
 	QUIRK_DRIVER_INFO {
-- 
2.54.0

