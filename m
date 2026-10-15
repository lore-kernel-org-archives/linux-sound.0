Received: from mail-108-mta134.mxroute.com (mail-108-mta134.mxroute.com [136.175.108.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49BB43DA20
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095823; cv=none; b=C0ucL41ca+Pj9q3S4PYz5bwYd+F+zOulD79NZCtQtpx/5pIlnrYRznmnJ2XkP0wY+UHqA3KWaWRniYI/9HeagSPgIu9arbRTuyQOh9FxkqZmANo/U4wwFnsfKHJKNuF/YyGLVPSqubEsLuXOpHRA4RnCqNSkXYANtPpVOXN/R7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095823; c=relaxed/simple;
	bh=aEnsJYS99tGmMJcZvSB7cI00Pf1+fvnzUHIoJDYTBDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcLurMDIxjqMW5GL9xgBqqQ5g4kmhM4dSW5g1JTM2V7hj4K1ASGTk5T24INujg7Y89JkR8HwOSqnT9qkiLd7DsvCIvH5r//sSbGQA6NrzjMVuUuejtVQV9W7QvT0lBxZ3ftj0/j4u3vHoeUK3D2RjadtXbincqwVDvrr+OmbBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vukad.in; spf=pass smtp.mailfrom=vukad.in; dkim=pass (2048-bit key) header.d=vukad.in header.i=@vukad.in header.b=jzbPCSj2; arc=none smtp.client-ip=136.175.108.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vukad.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vukad.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vukad.in header.i=@vukad.in header.b="jzbPCSj2"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta134.mxroute.com (ZoneMTA) with ESMTPSA id 1a141375cbe00028b2.002
 for <linux-sound@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 20:18:29 +0000
X-Zone-Loop: d22df7bb142146479b651301e7c80027215a117bf15d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=vukad.in;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=F1dmRt8pGiscETmH5TtupJIEzcvZwecEVqCuMzyvmMI=; b=jzbPCSj2NyX9gNCObJ91q8li5e
	dovMrbPJNg/96YD6zVVteoxUneQuvbRCLKHl4CWw0olBd+PMecLcuNH47BKBNo2mCjZW9wiJg5CVh
	trOqbbtjl8xBpD094Lc9Q4Cl3Nd2snCX5i/TPSXPfvd5HEG0jI0wqxCAT2di/CGkcG21JGujQ48Xh
	Q2kmRbdoRQ8ZG0OBiHOMUXUYKyP9MYWda/ff/KDWkKIVSmZIJdVl4tmWl/4sUYjOG9mRkLCwAZYbu
	d2kLQoVHzaYTSoieUp0fOJzrwi1Cs8kVtTayWYaDeTRm3tdjULtLrYYYFN+ziWUhlzT1P7T3oTG25
	8SIY/gpA==;
From: Jurica Vukadin <jura@vukad.in>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add mic volume quirk for Logitech Brio 100
Date: Thu, 15 Oct 2026 22:18:20 +0200
Message-ID: <20261015201820.10278-1-jura@vukad.in>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: jura@vukad.in

Like several other Logitech webcams, Brio 100 reports a 6144 step
volume resolution:

usb 5-3: new high-speed USB device number 4 using xhci_hcd
usb 5-3: New USB device found, idVendor=046d, idProduct=094c, bcdDevice=99.14
usb 5-3: New USB device strings: Mfr=0, Product=2, SerialNumber=1
usb 5-3: Product: Brio 100
usb 5-3: SerialNumber: 2349LZ51Y668
usb 5-3: Warning! Unlikely big volume step count (=6144), linear volume or wrong cval->res?
usb 5-3: [5] FU [Mic Capture Volume] ch = 1, val = 1536/7680/1

Signed-off-by: Jurica Vukadin <jura@vukad.in>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9ab79172fd4a..355be3230ccd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2271,6 +2271,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x046d, 0x08ca, /* Logitech Quickcam Fusion */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
+	DEVICE_FLG(0x046d, 0x094c, /* Logitech Brio 100 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR |
 		   QUIRK_FLAG_MIC_RES_384),
-- 
2.56.0

