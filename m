Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25D3812EA
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781235845; cv=none; b=a6OVvNI8fzdvWvmWVNisPxL2vYdsJJrQkShYUf/cLaeuf6ztRY0PGD0/2pEamjo7zVk3Kf/ObybP5ESkhAE3z9uZSbNI+VIwj1/BFdOdmc2eJto8Mbi0FXQJv6qYOr+80PhToi6EXWaUGpGPl4AdBPl0ysmoe5qx7a5kW/9h+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781235845; c=relaxed/simple;
	bh=19YJZHEKgec4AeWlnKI0fOltwLaU/HdtOwyb93tjdA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jxN7uHcnMm++tbUnwn0+WldxTSZRNoxYYCH6/kxWWILV714JAw5QXMfXwVDwGXjpw6QYGqWJ6NxaQ3XvApBXuI2baZ7M9+klxy1haOSfM/jQIG9gfWlmeTypxNul94la3VD8MUVLL2K5QOeyp9l7+kbYHafgpujuwJfwa3TCRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBvx6ZIG; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBvx6ZIG"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137335bc3caso686110c88.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 20:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781235843; x=1781840643; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFo/5ESaKnayXwmaVHEihXSbRWQOgmVZlQFPdUU++Ik=;
        b=jBvx6ZIGVQiX51LQ/+M9vYM3LGkdYbTuS52KVXb+2RU+RbvC/rogL1t/vEM1DZD0a3
         VDO0WkUNz9ZxRLpRfA56sl3fe6WBiOVgY4l7LQUcZWyfCblnIa+jLR50bf+lYkJFC6cL
         t4ZsGkbtLIfJhkwb5IJY6w2wCKBQ2sghjMQuaQXygFcFNMzPbWF28Srlvnip8clFcCDO
         vrL/LGKAtHjm+ZYJ84N660eHAXn1lzFeUez/aYTB98tSMWh9lHmeMYdBK+++hfpaaFJc
         ZpjkMIx1VAB+lhWit4iYhA2c+/z94/ALbuR35jhwvBiLqgoK8nT+8nG0273lDtAddvLQ
         CaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781235843; x=1781840643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFo/5ESaKnayXwmaVHEihXSbRWQOgmVZlQFPdUU++Ik=;
        b=rpUGg47UmDZ1kXgohPdQA+x2M8SfyfsnnWKgv8w3W2ih01VUN3g8PF+7IGWZXBs6/i
         sBRaFsEvfeQIR4I5m273GCZ3U63vY7Amw/d24/eFtlXCiueViML/OEV7KJ8j98HKIYI4
         ZGBtNUhGUAgGI7YuJy0lvlL4zM7tT8pZs4Dg2cEhVUeJGVpRZX7Pe1t8LQeFjo0bnIlY
         0iwDL/buEkpYWWd3y0c4USRLZOLR28tnfS8sWuUveJ8mAVJyKCjfactVjjcctPJdGoi5
         1JxzyReZwRBjHJqDCoZFwirbWwJ5Ui5whikkON13O2fAAw2mDI1xku7D/yDpPaT85vSi
         q7yg==
X-Gm-Message-State: AOJu0YzAtZXtMACZQ8ZVs9cH8D9Ny76Lply//5NDV5NwVYrtO7F0xmdk
	FIe9Y5I3t09wQe/BYm8PvBVV7J1iuBLNj2G8O4FDoKoWa9BeR8EW46dZ
X-Gm-Gg: Acq92OGoU/6ydmGq3ZP+I08BsEQ/oYX3j2PLoJFQULwd6EEQcqsVnVV4n2G7KugF/64
	c0oZwEOoq4H3CPL5DAxDJ6QHiUeiEKpcFbfMXqDjjZGQquj7fdnR3G3vRBZVvmHy76Bdfo52iV1
	2ar6fe7DZKbbS24UQd5BuWVYNIw1/HvehDtGe/CsLNOm89QBdXqq5ev3g3S9vgxdvqA95cZEp1W
	6w3Kg5uaQVxWtBmIxSmlJ2FxcqMBKs9WPNd7JRCxJ3aRb0Olf7At0QCi1MzKXBe1pZz72pNiKTv
	9ucxYtJih7esMJAf4sK0LZ6Y130Yb6UZrwCv09G9C6ExHyzJrK7THYHUA1vT9UDv3wM38rMhcI0
	K0zOL/zWAuGBofI3CSfv80N6Fzu0XET/gLRC8xqYKZQ3or1NHllepWEuxyEx4+bFzuWYBYS+9Ql
	ND9AJRK9thSf8mmYIJF/WNdrQhYlXWULdNoYKxmX6NOk4K46vl0O2e0eP8z2GAoDHhZElgPj2dy
	Q==
X-Received: by 2002:a05:7300:5790:b0:304:cf6c:4d01 with SMTP id 5a478bee46e88-3081ff6f092mr711628eec.12.1781235843368;
        Thu, 11 Jun 2026 20:44:03 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm1626248eec.5.2026.06.11.20.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:44:03 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 12 Jun 2026 00:43:55 -0300
Subject: [PATCH] ALSA: pcxhr: Share PLL frequency register calculation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-alsa-pcxhr-pll-helper-v1-1-c84ae2bd2e9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQg6nFq4iLmP6akVDDTJVC6
 d2NuvwW761kUIHRqVtJ8RaT59Sw33WUcpzuYBmbyTvfu94FjsUi17Rk5VoKZ5QK5aM/pDEMIfg
 B1NqquMny+54vf9vr+kCavzPatg+VI7cOeQAAAA==
X-Change-ID: 20260605-alsa-pcxhr-pll-helper-724cd585528e
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4174;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=19YJZHEKgec4AeWlnKI0fOltwLaU/HdtOwyb93tjdA4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaDQ3v5xafWPBbZrvxPO2HXZ9fRKct+mrbveSqV/4U9
 ZsNiYslOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiP4sYGW605Nitu3hZ8e3V
 7Lijc83F4ouZT25wMuYVZ39f3LAnOZ+RYcenGRuXPNBQ4edfKr5nxZ314e81FO0OXVy/xWW18uH
 /6UwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The PCXHR and HR222 clock paths duplicate the PLL divider calculation and
register encoding. The HR222 variant extends the same format with an
additional range for rates above those supported by the older boards.

Move the complete encoding into pcxhr_pll_freq_register() and pass each
hardware path its existing maximum frequency. The additional encoding
branch is unreachable with the older 110 kHz limit, so this preserves both
paths' accepted ranges and generated register values while removing the
duplicate implementation and its long-standing TODO.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
base-commit: 0f6f60115bfc536c1935d3d0da66cf1d5c7d6055
---
 sound/pci/pcxhr/pcxhr.c       | 13 ++++++++-----
 sound/pci/pcxhr/pcxhr.h       |  2 ++
 sound/pci/pcxhr/pcxhr_mix22.c | 33 ++-------------------------------
 3 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 1eea40e94c43..25a640304430 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -180,16 +180,18 @@ static const struct board_parameters pcxhr_board_params[] = {
 				      (x->fw_file_set == 0)   || \
 				      (x->fw_file_set == 2))
 
-static int pcxhr_pll_freq_register(unsigned int freq, unsigned int* pllreg,
-				   unsigned int* realfreq)
+int pcxhr_pll_freq_register(unsigned int freq, unsigned int max_freq,
+			    unsigned int *pllreg, unsigned int *realfreq)
 {
 	unsigned int reg;
 
-	if (freq < 6900 || freq > 110000)
+	if (freq < 6900 || freq > max_freq)
 		return -EINVAL;
 	reg = (28224000 * 2) / freq;
 	reg = (reg - 1) / 2;
-	if (reg < 0x200)
+	if (reg < 0x100)
+		*pllreg = reg + 0xc00;
+	else if (reg < 0x200)
 		*pllreg = reg + 0x800;
 	else if (reg < 0x400)
 		*pllreg = reg & 0x1ff;
@@ -260,7 +262,8 @@ static int pcxhr_get_clock_reg(struct pcxhr_mgr *mgr, unsigned int rate,
 		default :
 			val = PCXHR_FREQ_PLL;
 			/* get the value for the pll register */
-			err = pcxhr_pll_freq_register(rate, &pllreg, &realfreq);
+			err = pcxhr_pll_freq_register(rate, 110000, &pllreg,
+						      &realfreq);
 			if (err)
 				return err;
 			pcxhr_init_rmh(&rmh, CMD_ACCESS_IO_WRITE);
diff --git a/sound/pci/pcxhr/pcxhr.h b/sound/pci/pcxhr/pcxhr.h
index 1b85200d00dd..011227b1fe79 100644
--- a/sound/pci/pcxhr/pcxhr.h
+++ b/sound/pci/pcxhr/pcxhr.h
@@ -190,6 +190,8 @@ struct pcxhr_hostport
 };
 
 /* exported */
+int pcxhr_pll_freq_register(unsigned int freq, unsigned int max_freq,
+			    unsigned int *pllreg, unsigned int *realfreq);
 int pcxhr_create_pcm(struct snd_pcxhr *chip);
 int pcxhr_set_clock(struct pcxhr_mgr *mgr, unsigned int rate);
 int pcxhr_get_external_clock(struct pcxhr_mgr *mgr,
diff --git a/sound/pci/pcxhr/pcxhr_mix22.c b/sound/pci/pcxhr/pcxhr_mix22.c
index 80d22e22ea30..76beb443d983 100644
--- a/sound/pci/pcxhr/pcxhr_mix22.c
+++ b/sound/pci/pcxhr/pcxhr_mix22.c
@@ -305,36 +305,6 @@ int hr222_sub_init(struct pcxhr_mgr *mgr)
 }
 
 
-/* calc PLL register */
-/* TODO : there is a very similar fct in pcxhr.c */
-static int hr222_pll_freq_register(unsigned int freq,
-				   unsigned int *pllreg,
-				   unsigned int *realfreq)
-{
-	unsigned int reg;
-
-	if (freq < 6900 || freq > 219000)
-		return -EINVAL;
-	reg = (28224000 * 2) / freq;
-	reg = (reg - 1) / 2;
-	if (reg < 0x100)
-		*pllreg = reg + 0xC00;
-	else if (reg < 0x200)
-		*pllreg = reg + 0x800;
-	else if (reg < 0x400)
-		*pllreg = reg & 0x1ff;
-	else if (reg < 0x800) {
-		*pllreg = ((reg >> 1) & 0x1ff) + 0x200;
-		reg &= ~1;
-	} else {
-		*pllreg = ((reg >> 2) & 0x1ff) + 0x400;
-		reg &= ~3;
-	}
-	if (realfreq)
-		*realfreq = (28224000 / (reg + 1));
-	return 0;
-}
-
 int hr222_sub_set_clock(struct pcxhr_mgr *mgr,
 			unsigned int rate,
 			int *changed)
@@ -345,7 +315,8 @@ int hr222_sub_set_clock(struct pcxhr_mgr *mgr,
 
 	switch (mgr->use_clock_type) {
 	case HR22_CLOCK_TYPE_INTERNAL:
-		err = hr222_pll_freq_register(rate, &pllreg, &realfreq);
+		err = pcxhr_pll_freq_register(rate, 219000,
+					      &pllreg, &realfreq);
 		if (err)
 			return err;
 



