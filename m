Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA482EF673
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764018379; cv=none; b=QrIrBtwa2Ok2A9qWmLCrutBsCTc4CoFAXP19fhwQgH5jsBtkeBr5UlGIIktwIDAxHFZI2X1mtonPqGf0XCT6fuus674CVyhLSbs0UJG7vxGPDRIBWZI1bE2zRL6fIYQ4ZhgyNbniHpQkv5pBFunVj5xxQUdxZUtOu5JAw5AdNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764018379; c=relaxed/simple;
	bh=mS0D7PdgsnX8XZ50IEQVjpwmazvZ1y6uWClDiVRb+1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMMSef+kq1o82cb8uzOZwNcMCqFYdUJwDPARmJEYqmOGeGJZ87iLcNCjQsOXTfiHy+qHQ0UDdhakvhY9PMZYlgkQqakCNhuhZiMZ13T8oU17AUj6D9UQbN+lq+YF4Xch0HhUytNS46vkhlNlQH9ZNGtqv4pTk1wBF8tG+tRp0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=Toy6UREl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="Toy6UREl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298039e00c2so66324395ad.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 13:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1764018377; x=1764623177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fxkpJJkBen5bfgB7rJExiVGeQH2pO2BZ9RxZ808jyY=;
        b=Toy6URElUlOmCVBxleaUNZJjZbog4j9fJraJm1to49DnjJkmaP6UFGXFxHRN+LvaoB
         18oNpxSxb+XiPFQbLnEyB6Cs3NMvjCYLkCxh25IL1N5wKBBdJyf6h//Zo0/SW41sQUXR
         WuIO6bkO6uoQi+ETKZRfpRmdcHUEPvqXHO6nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764018377; x=1764623177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fxkpJJkBen5bfgB7rJExiVGeQH2pO2BZ9RxZ808jyY=;
        b=GIF+oGvwSA2wIz207cKYe8CCoQ10OQVcJSdHnxkQq60Cw36Jwh9XdgDaUzM1jU7b7m
         94ihBcRBxE1w+bnHGfafxv2Z3QHi84lauXzCmpVg3wgH1AF3tvc7oVE8ontBNcspz82L
         w9duKm0/wPb+bALzvJAWQcIEtqfW//V1r2HhcLKdSsPLDihsDmhb7VbEXM6/ysEs2M4v
         1AO6oZy333UpHRT57GhgapUPWR+ki8+UQP9Cs+7Xwsxo+dAaGlAVCpmIr0dml1s2xsaG
         DGUQgnZlKf9Slp/qSNFfh1UiaZghGgAZJSpVvWU+dZnFVXat6OkUXdidev4by7/s5FCo
         3LjA==
X-Gm-Message-State: AOJu0YzMhA2DtNVsoX/RpvKYnByCPe5XF+AKe+T7XsA7PBlch42/PLAV
	ScbMzlHiVyP/eqm7vCOOJ5Vr6sY+aT76tZZyeTZDNL3d3Yo1fsmpATbTBTPvgLEfMpA/Yn02/nR
	Jcpi0WXARx1EOCqY20Rpu5yqrY1rWxTfiWyF6sIZopCS7gGuDNdBva03XzqUseDXuJJuaE3f3GU
	qm8tpGuk8shoAUZqw3/QTBwocf0nPq60m5YW+ENrmz4GCF0snRYyYI61k=
X-Gm-Gg: ASbGnctDUB2J4Q1SwDI1rK1rUC2VNOel5a8s3/5zX1utgr7X3K0Mp1Um8qsxYA5EuUX
	9/5qqJF8iQ/soAG9A19p5BOxQ6T207ROW9UMQL1WFJPRT+ssBrEr+axR7iIRTBY1NPFUwozsvu7
	+mF7S169lMHooHGsWcNDnfX7ZPCkefCANuOgjD3wJv3R4652lnZfGoEWeV/5TWSPOj5RspcaSPh
	LjQb9/btIreCCql6nSJ0102jdCtDvctBkhkSBDnG5yBgB21oKqmB6XeZPRH+l5Kg4CCj6OLnGj5
	PVeYnhw8fSP7GYHOUdLaLOXblv8JXb37+qioCyi0qtgqdbiZAnqm2EIZVSFvSBabHzAOwBJPHXL
	jZgX7/bsL/iKSGda3Ef6P/GSQpY3fGJ/LRWgTqNJ5i41/EVGbZscttVaK4vYkDtUVAHD8r9AM8/
	FzmDsJtsMWFl37+GKfzjPqLw==
X-Google-Smtp-Source: AGHT+IElxgXe5oft5V5kxqq0CUIAOqX2aKeCRqVqpwmcpHuBWj1cV27Ib130aQOC57hFWbbpQANMYA==
X-Received: by 2002:a17:903:1967:b0:288:e46d:b32b with SMTP id d9443c01a7336-29b6beba2dfmr155665805ad.17.1764018376626;
        Mon, 24 Nov 2025 13:06:16 -0800 (PST)
Received: from fedora.motu.com ([50.217.247.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm144616635ad.75.2025.11.24.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:06:16 -0800 (PST)
From: Dylan Robinson <dylan_robinson@motu.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	dylan_robinson@motu.com
Subject: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Date: Mon, 24 Nov 2025 16:05:18 -0500
Message-ID: <20251124210518.90054-1-dylan_robinson@motu.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maxpacksize field in struct audioformat represents the maximum number
of bytes per isochronous interval. The current implementation only
special-cases high-speed endpoints and does not account for the different
computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
result, USB audio class devices operating at these speeds may fail to
stream correctly. The issue was observed on a MOTU 16A (2025) interface,
which requires more than 1024 bytes per interval at SuperSpeed.

This patch replaces the existing logic with a helper that computes the
correct maximum bytes-per-interval for all USB speeds, borrowing the logic
used in drivers/usb/core/urb.c.

Signed-off-by: Dylan Robinson <dylan_robinson@motu.com>
---
 sound/usb/stream.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 5c235a5ba7e1..074a61215de6 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -684,6 +684,37 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
 	return NULL;
 }
 
+static unsigned int
+snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
+					struct usb_host_interface *alts)
+{
+	struct usb_host_endpoint *ep = &alts->endpoint[0];
+	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
+
+	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
+	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
+		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
+		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
+		max_bytes *= burst;
+		max_bytes *= mult;
+	}
+
+	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
+		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
+		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
+	}
+
+	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
+	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
+		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
+			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+		else
+			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
+	}
+
+	return max_bytes;
+}
+
 static struct audioformat *
 audio_format_alloc_init(struct snd_usb_audio *chip,
 		       struct usb_host_interface *alts,
@@ -703,11 +734,8 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
 	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
 	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
 	fp->protocol = protocol;
-	fp->maxpacksize = le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize);
+	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
 	fp->channels = num_channels;
-	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH)
-		fp->maxpacksize = (((fp->maxpacksize >> 11) & 3) + 1)
-				* (fp->maxpacksize & 0x7ff);
 	fp->clock = clock;
 	INIT_LIST_HEAD(&fp->list);
 
-- 
2.51.1

