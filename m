Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70231481FA1
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205207; cv=none; b=GXYr8DmSKaYCDzxaYTf+XH+vlPVSSMJIt//gDZXQvEdPipZtR1Tb5e97GRe8ZHRppzxtYsycN+H6O8VGxDBs+Dq70LMqwnCbzqwFLP2+deDxwkFRWYGDMSmrb2y4FhvnobsapmbDWVeVyGUpIDC8rvVLVHYBVhjz4WP1x4wePzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205207; c=relaxed/simple;
	bh=52W+fOrxFe+bWCt36p6yYQj0qH1ttnoRmzw3hNEfN88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULTmRoce7FxRCJoDVZDr57acvScyXlvb4ip4/DLdmtyoZj3xVcrarcBL4I212H6OcPCCHmsabbpSEltEiHz6N183fM6evmxX1j9Evvzp1h073UN0htAxAm+oD63i8WOVEbvzjw0ZUt9ltIBVcELB7Q//v3a2RZwt+4xnPvNG08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8G24kIw; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8G24kIw"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1520201f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205203; x=1791810003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0CcfcxT6I+LHTdTT495JsxLGQlnitiQmatnCu4G5pU=;
        b=D8G24kIwm9ZgtO49T2uYrQ2GpZ6hozfeZ9xEOq+8Qo+UY6H7ZTpgoSmgpxIeSApBHN
         eGjFr/XVfD0dNMYdZTZEzvbO2R2PEXdxTtocusA5kWC0edE9N7rgseqeUBAJ7Fe+5NKg
         P8LFtW0e9UIAFKlQ4z95MtJzxHJKdIQ1Kyoz0p5oqdRbDVBgBsbWRPmnA0mFxx7TPj2n
         dziCqwlUkdoY+Waq5l71kqqbeZtsLtI42IuzDzbVZSsfBWInaJCtNVtKJyERVmNVbh7O
         sooKaRvGYDEC+v0CDJ8ko02lHXG++g7imKmzfF62iuirnEfP+x68lbu8KZm2DxekChNw
         yzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205203; x=1791810003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0CcfcxT6I+LHTdTT495JsxLGQlnitiQmatnCu4G5pU=;
        b=O4drKqg0u0qeGBn02xgU+PiaadyPIC1TXREfM/RKR3mlcX/VZkW/czAhucq6Fo97pU
         +vSvyk6xisx7pYiVPLizsWrT6WsmOvA8a06bn3eCnZj6ht9KX3hRID4gUwCmV2W3OW1O
         ZlyyY8l/pXvyNzHcMFuDbAvW4hnx88ut7Fao8v0H11ypaLc0s0+iNaxXhQ1caCbZynMg
         5y1esTk6DclUJMSqt5PM58nmxhafqtK2lYY6F6GvvfcQZATDYJSKDOL6wkIPyyrhfRQz
         wEphMdixneP/rilxxzIKCPUDBP0zgclqB+/80K/tjxaFqIcE6+yh/BgW9UU+UKlimOrM
         6skA==
X-Forwarded-Encrypted: i=1; AKwUvBzCKydA1MxmpSngDhdK2ORaHHph666xSxQpakYxcF9VkMxkMVuULRtZV5tQ4nhCkMJlAlywgC5UYlEuIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQUyPB398bJlUf45QsdBsJZar+Ysd6ro7eZ2/hPCrhHoVcAbLr
	LUj+Uw59P8pMXHyWMRzH8VCnVelvnRQ/pRvNvIqZfZqeVEJPZuMTdWNA
X-Gm-Gg: AYBFou2p/+OevHLLqvmW/TKXliv3fGh706nfTU/8yA/u4MPskixnd3NUGVS4Un6/oK/
	x8FQ1YYzlMd7SUtfOZMLeS8kMpewVIyLpTmXWHKI+5R6qfLEI5x8e+9XHBtTve9iDuR7cWQh3AC
	fLPomnQFA+1cHj1dR6GDMhYwt10qyTGFJ0H9V42PMndPc4fYL0GrFxK3BtuC551QSO1fIUvtKdt
	Lz/W/oOZXLw4lFsHzPPO87v0DTzCjoKg62rwMf+pZ4BbJTT0USWHqtcecYoyoewraz+a1VtYG+K
	rjQyVwSCMI2oHtImY5fR64iRoCa/vvsQA39iw9J2wkEuC1lYEoUQh/xrjgJkN0BH8Jo5XmaJWA3
	Sk3ERHHQsRb7jOzbr/i2XwEXRsyLvKE/Sn21p7J7dVNt0szP/j2ljoSHib48JMwFlYYLwBT5Y56
	vsg9refbuyS6nwTZ/6/2WrnQ+qCxyCUr0p8vzvjAicUHfij8LNWCByQKki+MFO9FjCurdLqKiGY
	51mgAFSa0GW22MAduZl
X-Received: by 2002:a5d:64e7:0:b0:48b:efb:4a64 with SMTP id ffacd0b85a97d-48b127357bfmr22034130f8f.37.1791205203361;
        Mon, 05 Oct 2026 06:00:03 -0700 (PDT)
Received: from vadym-MACH-WX9.taild8603c.ts.net ([45.84.184.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704c1sm2910724f8f.10.2026.10.05.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:00:02 -0700 (PDT)
From: Vadym Shevchuk <0xsheff@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Vadym Shevchuk <0xsheff@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for Shanling UP4
Date: Mon,  5 Oct 2026 15:59:53 +0300
Message-ID: <20261005125953.190316-1-0xsheff@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005094433.32960-1-0xsheff@gmail.com>
References: <20261005094433.32960-1-0xsheff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Shanling UP4 (0a12:1244, CSR-based, UAC1, full speed) sets the
MaxPacketsOnly bit in its AS isochronous endpoint descriptor. With
UAC_EP_CS_ATTR_FILL_MAX set, the driver fills every 1 ms packet up to
wMaxPacketSize, i.e. 48 frames, regardless of the sample rate. At
44.1 kHz the device expects 44/45 frames per packet and outputs only
silence. 48 kHz works because both packet sizes are the same there.

Measured with aplay on hw:UP4,0, 4 s of S16_LE stereo:

  before: 44.1 kHz consumed at ~48030 frames/s, done in 3.68 s, silent
  after:  44.1 kHz consumed at ~44220 frames/s, done in 4.00 s, audible

48 kHz plays fine both before and after the change. Regular music
playback at 44.1 kHz through PipeWire sounds fine as well.

Clear the attribute for this device, as is already done for the MOTU
MicroBook IIc. Since the packet sizes are equal at 48 kHz, this does
not change anything for other devices that may share this CSR USB ID
and only use 48 kHz.

Link: https://lore.kernel.org/all/CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com/
Signed-off-by: Vadym Shevchuk <0xsheff@gmail.com>
---
v2: use the full name in From and Signed-off-by
v1: https://lore.kernel.org/all/20261005094433.32960-1-0xsheff@gmail.com/

 sound/usb/quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 38d78b834..3fdf03ce9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2366,6 +2366,14 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
+	case USB_ID(0x0a12, 0x1244):  /* Shanling UP4 */
+		/*
+		 * MaxPacketsOnly is set, but the device expects nominal-size
+		 * packets. Filling 48 frames per packet at 44.1 kHz results
+		 * in silence. No effect at 48 kHz, where both sizes match.
+		 */
+		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
+		break;
 	case USB_ID(0x1224, 0x2a25):  /* Jieli Technology USB PHY 2.0 */
 		/* mic works only when ep packet size is set to wMaxPacketSize */
 		fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
-- 
2.53.0

