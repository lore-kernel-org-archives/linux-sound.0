Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1F275B1A
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776717182; cv=none; b=J/eKrIO/f8bM+xtteCejbWhKoBIRAbzkiNYqa142DzId6M4A/ki2vnSMbo9x4BM2CiQoPjPnfY4uSxJXGZkQOiSL2+kQ88Z4uG5f6ORtMPUwnAeTrmd2UWEFtI+VEy+N0Csr3jmnYz6rzy2DTrLp3WV/Ios8EX/0yXu19AuuKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776717182; c=relaxed/simple;
	bh=7i78j0HIaFaOU5uJ90s/FZbmUPmV+PFoQ49w+9hlu54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wgt2Hy453Wxn1IGe4iVBfoKQKwkfrjYGvyTZiKze2i1akBXL2WhYpvauVRTF9S3tCiGD1675CpdXbNI8G2uqnL4qx4gTH5+BO6CFdod1mHxqWgrGObg7AMRIyRnImUHzMOTYb/AGIakRUAcpXqMIWICyIXKbtv4hFgMNJlSuMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=urqWJITv; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="urqWJITv"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c7212836bso9193353c88.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776717178; x=1777321978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8mi/dHnhOhKjn37TMzbYeLkesk0gPSMBEcSGzvI0/4=;
        b=urqWJITvIeMUYIsNRIS8uRGG/8mDpsOuMOnBS6cgu8Xjj08OobEBsfRSDqwVytDxsu
         yn0pFN+oWwRspPhGtlJXdGLTZhsWrrFd/7ZWROHwJDATR19VZ9nwaZo3xppg53jiduqe
         2zxUxGCs2fsLvjP89r7Sy+RvudGdTdJ4WUUuZ7r/cC9aC++IGADOyy9gsb+mWbEA2ymf
         4JLuZxjR4LF2PGCWDNcY+PhWqsfsn4ydxQxJuXPtYj/yIBNPJrXbUTriyuPWmF40vcTU
         VuWjbt2YJwbjOUavkCWbymVHw3u9BI6PZusKT5CA9KIb9ZuO/SYpPqHLdmksSHpQBKYA
         DEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717178; x=1777321978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8mi/dHnhOhKjn37TMzbYeLkesk0gPSMBEcSGzvI0/4=;
        b=duL4ROHrRCAHPI+hF0zpzlh5NQrPfnPdxRWYifTvrtrab5JMymDGkuWoUaBAPBsme+
         k1xLn8CKVDWH+S0+pGyrhWTrnQ8fqK+D8VhrEoCqXu2qtaYYgukmvya7j93IWn2Z2D4L
         r0xHestMIhoL0GeYWN1bpH+nTKGlcjLohIVfKyAK50g9ciQjIo5afbmGj+PqQDmKzZPQ
         /VLrx+dJTr+QMrDIv6b41YsJGzbig3wVwMSCaMurUhway61asw2uLBZj+7fgAN716Qvr
         z1HUFl38m2L+sgTEKkM9S0YJNH+IVmcvscSKsniExXv/Y9TcpRreTMPnVh2FHgzfGwew
         OzlA==
X-Forwarded-Encrypted: i=1; AFNElJ9eXfLriOJ4O8rG+k78tsYkiJQEJvsgCLDC8COQwuHGI33qOIu+IRxYuH1SKJaaxeiXoFkJ6ZcHrttoEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJRPLKzNj3FEvw2y7nbhJVE4HcbOfA2f2WZ2INmteGUTA2pzk
	4+S7Sb3fheiQhGgUTepyZCeCJLDZXFG9B0MVbB3RskvZC5UQOW+Cdt5Z3/mQOxNQ69U=
X-Gm-Gg: AeBDievXHO47Ka/hTJGOxqp/+cyC0ncrltMxWgNkg0uBIqtHEpOYgmKPob7E3fRnhT8
	JhY36j4DlE43jILS3Sg4C51fSm64ISkLwRF0VUVs/2mu8hm4E+7PubODOqwqKBjRYk3hfYQIKvf
	WNL2zOeI4X/VNW7sjQV6kXf1ua1WNMVqsZA6eztTnB+pL8MJDGTIFaowl5THabO703eu8h+8Vy8
	wBHD9WjgAJaVNCSi1QIxa/zkSWDqkR1cWLIE2c9N2mpe4LOc/FshXY7tfyFcvOYMrriKS2lD2lb
	lffAbm3rGMq+l52irr1VdqN7vI6XUwW91V/PZFuZt/d0tT8wh6e3kc2OxFHbiwVSnG1rdv3iHqD
	MOPvRvCtfdx+GghvvM8THy8dcHxEzD3ty0VqCxKAEaYugc2HUqyzJzYATQHzu+7x5d+eBpmGi9a
	si3bLdXycJ98oRdE719DmVLha81ek2PiAC
X-Received: by 2002:a05:7022:6882:b0:128:d5f1:d593 with SMTP id a92af1059eb24-12c73f6d5c2mr8565237c88.1.1776717177718;
        Mon, 20 Apr 2026 13:32:57 -0700 (PDT)
Received: from com.. ([187.114.199.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c770516f1sm14972223c88.7.2026.04.20.13.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:32:57 -0700 (PDT)
From: "Joao Marinho joao.bcc@usp.br" <joao.bcc@usp.br>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: =?UTF-8?q?Jo=C3=A3o?= <joao.bcc@usp.br>,
	Micael Vinicius <micael0208@usp.br>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction
Date: Mon, 20 Apr 2026 17:32:03 -0300
Message-ID: <20260420203218.15060-1-joao.bcc@usp.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João <joao.bcc@usp.br>

Replace manual bitfield manipulations with FIELD_GET() and
FIELD_PREP() in order to improve code readability, security
and manageability. Also correcting GENAMSK typo for GENMASK.

Signed-off-by: João Marinho <joao.bcc@usp.br>
Co-developed-by: Micael Vinicius <micael0208@usp.br>
Signed-off-by: Micael Vinicius <micael0208@usp.br>
---
 sound/soc/atmel/mchp-spdifrx.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 521bee499..2c47aabdc 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -6,6 +6,7 @@
 //
 // Author: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -41,6 +42,13 @@
 
 #define SPDIFRX_VERSION			0xFC	/* Version Register */
 
+
+/* 32-bit word byte masks */
+#define SPDIFRX_BYTE_0_MASK         GENMASK(7, 0)
+#define SPDIFRX_BYTE_1_MASK         GENMASK(15, 8)
+#define SPDIFRX_BYTE_2_MASK         GENMASK(23, 16)
+#define SPDIFRX_BYTE_3_MASK         GENMASK(31, 24)
+
 /*
  * ---- Control Register (Write-only) ----
  */
@@ -55,7 +63,7 @@
 #define SPDIFRX_MR_RXEN_ENABLE		(1 << 0)	/* SPDIF Receiver Enabled */
 
 /* Validity Bit Mode */
-#define SPDIFRX_MR_VBMODE_MASK		GENAMSK(1, 1)
+#define SPDIFRX_MR_VBMODE_MASK		GENMASK(1, 1)
 #define SPDIFRX_MR_VBMODE_ALWAYS_LOAD \
 	(0 << 1)	/* Load sample regardless of validity bit value */
 #define SPDIFRX_MR_VBMODE_DISCARD_IF_VB1 \
@@ -74,7 +82,7 @@
 /* Sample Data Width */
 #define SPDIFRX_MR_DATAWIDTH_MASK	GENMASK(5, 4)
 #define SPDIFRX_MR_DATAWIDTH(width) \
-	(((6 - (width) / 4) << 4) & SPDIFRX_MR_DATAWIDTH_MASK)
+	FIELD_PREP(SPDIFRX_MR_DATAWIDTH_MASK, 6 - ((width) / 4))
 
 /* Packed Data Mode in Receive Holding Register */
 #define SPDIFRX_MR_PACK_MASK		GENMASK(7, 7)
@@ -118,15 +126,14 @@
 #define SPDIFRX_RSR_LOWF			BIT(2)
 #define SPDIFRX_RSR_NOSIGNAL			BIT(3)
 #define SPDIFRX_RSR_IFS_MASK			GENMASK(27, 16)
-#define SPDIFRX_RSR_IFS(reg)			\
-	(((reg) & SPDIFRX_RSR_IFS_MASK) >> 16)
+#define SPDIFRX_RSR_IFS(reg)			FIELD_GET(SPDIFRX_RSR_IFS_MASK, reg)
 
 /*
  *  ---- Version Register (Read-only) ----
  */
 #define SPDIFRX_VERSION_MASK		GENMASK(11, 0)
 #define SPDIFRX_VERSION_MFN_MASK	GENMASK(18, 16)
-#define SPDIFRX_VERSION_MFN(reg)	(((reg) & SPDIFRX_VERSION_MFN_MASK) >> 16)
+#define SPDIFRX_VERSION_MFN(reg)	FIELD_GET(SPDIFRX_VERSION_MFN_MASK, reg)
 
 static bool mchp_spdifrx_readable_reg(struct device *dev, unsigned int reg)
 {
@@ -317,10 +324,10 @@ static void mchp_spdifrx_channel_status_read(struct mchp_spdifrx_dev *dev,
 
 	for (i = 0; i < ARRAY_SIZE(ctrl->ch_stat[channel].data) / 4; i++) {
 		regmap_read(dev->regmap, SPDIFRX_CHSR(channel, i), &val);
-		*ch_stat++ = val & 0xFF;
-		*ch_stat++ = (val >> 8) & 0xFF;
-		*ch_stat++ = (val >> 16) & 0xFF;
-		*ch_stat++ = (val >> 24) & 0xFF;
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_0_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_1_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_2_MASK, val);
+		*ch_stat++ = FIELD_GET(SPDIFRX_BYTE_3_MASK, val);
 	}
 }
 
@@ -334,10 +341,10 @@ static void mchp_spdifrx_channel_user_data_read(struct mchp_spdifrx_dev *dev,
 
 	for (i = 0; i < ARRAY_SIZE(ctrl->user_data[channel].data) / 4; i++) {
 		regmap_read(dev->regmap, SPDIFRX_CHUD(channel, i), &val);
-		*user_data++ = val & 0xFF;
-		*user_data++ = (val >> 8) & 0xFF;
-		*user_data++ = (val >> 16) & 0xFF;
-		*user_data++ = (val >> 24) & 0xFF;
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_0_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_1_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_2_MASK, val);
+		*user_data++ = FIELD_GET(SPDIFRX_BYTE_3_MASK, val);
 	}
 }
 
-- 
2.43.0

