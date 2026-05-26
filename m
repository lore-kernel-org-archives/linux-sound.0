Received: from mxout1bln1.prossl.de (mxout1bln1.prossl.de [91.233.87.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A43AE6E5
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.233.87.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812489; cv=none; b=hrclHcMn/OrBjyzeqT5ZTq2Ef4UEUvdZ7xSWmaUIxP230R+XXKpVOtE20ZAK3WrpqTJrJmVFhgFP0BPiZVFY0uHAnxEZN/FCgVDfO0/cV4jHqR6g1BWKbhAPyBCUX3JZTHm6WzrTzzZlVqXMPtMBnHFI3IsI87cMoF8tz4e5WgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812489; c=relaxed/simple;
	bh=nxYN/Ex761UEcrhA1rOASHsVUMHQkwUcsZ80Q1XgUKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qTBjNi+GXIMiyIbf9rHUw0Bna/voGIzWu/4XDCV14PgSheql2PWp01i9JyEPM1BF28vSuelp3tlsugQ5uee7RL7hxHfmim4J4LyrE4i1iSdGe2EA8V9RuWeey2k57WQC1GbuBc/oLxUfgjszDqdx8oXMp4o4uhEEhTCngAshDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org; spf=pass smtp.mailfrom=kuechler.org; dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b=Ns2HVxZ5; arc=none smtp.client-ip=91.233.87.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuechler.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b="Ns2HVxZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prossl.de; s=prho21;
	t=1779812482; bh=TkkbpS7eUFQW4wXvz270ZpCiBhbkP2ZB7mX2erMsg6M=;
	h=From:To:Cc:Subject:Date:From;
	b=Ns2HVxZ5uPruh+yo4Ofob+z9zezhtl9Z93lMIqQ5pONFBHlxp2kpWvilCGwIL2Pxf
	 rbEz/wNNfYbOWmcsiyEDg9IFYAYigDHH+OZk9o4IPikqZFCNdJ86DAYqYDcdVP40bD
	 5W0+rw08CUFvHwtjR4Tpai04QXiSVi6AKdqaCwv0=
Received: from uk-sirius-cachy.internal (81.60.148.243.dyn.user.ono.com [81.60.148.243])
	(authenticated bits=0)
	by mx1bln1.prossl.de (8.18.1/8.18.1) with ESMTPSA id 64QGLLC7041113
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 26 May 2026 18:21:22 +0200
From: Uwe Kuechler <uwe@kuechler.org>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, uwe@kuechler.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
Date: Tue, 26 May 2026 18:20:33 +0200
Message-ID: <20260526162033.7513-1-uwe@kuechler.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Null-Tag: 4e5988166f016de20e60cde2242ed8ca

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

