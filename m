Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA049CF47
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461898; cv=none; b=p2nymbwsUPbklqvuqT/JBXWDgCtc6c8LHnqdMbPpldoiKi9ebH1Eexa77ur/9Ke0oaq8wHlx+GfQ0rpaq4EiTmGq5zrRKBIYMjx1rTUjBxyR9dD8EYkWMBvcike9stOuzi4XoX2JPi/nFD87MaXPWQhPKj2Xy3+82JJbf13rejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461898; c=relaxed/simple;
	bh=/8vQTsAacrt7tq+CmZEqjCdzPBMpFxzscNzh2mve8hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/ZMppRoXRlcdIcf+J+1ruX+qKsewCMzhp3mDGgaoi9BEGkZTzLYS0HRjRJoq5Qi77T+/KJhgLm7lVilBvxyIEfw5pLy4ZNsqV3rymmgI/hZCujeWGBdjj9QBwK7E8acqC5sVaj4IE4UIbirF9DHTVYOLeSdyxnJ6qtUcfeI6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCsh4f42; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCsh4f42"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so31629275ad.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461895; x=1790066695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pv7hnek0M3kdITeC3SL2hfj05ljQFsw5RFgfNprat8g=;
        b=mCsh4f42upLYTYFuetuvTgN5Zy8beJU4mZfQ/tKctqQKtiNS60Sq36GWiQyn92sLSw
         H9CI+X5uti186YldPLVqV55Y2/j9vf8Bsbj8dtLdgm7jSeV4VwKhqr7d8JHkMi5GutxR
         Rm2NUB3Mcv7d746Mhf6NFtLSZI5VDvUMvqCBm51dbqsxHT+8HkRUrx8bgz1/Px1Qxbqi
         d+ktpYELGzxNpoxUe4fuQXm5tE+deJKOO56dhtbK1ClWywzf7pDKL8MTbaQZz/QoA0GM
         PXX/UEISj3myHa0rjLN10BwT8kNUDJQUEy6kl5um5JYWnPpNbqmkQxjFO/C1nEd/jnW3
         lo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461895; x=1790066695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pv7hnek0M3kdITeC3SL2hfj05ljQFsw5RFgfNprat8g=;
        b=hePegu/DMI9VAFnXnSei8iWjISUG3DNwn9UXCMQl4CTolpgOgf3sYCw+wQDrrFVpp+
         fGYMjfHfzpsgVD+czzp/UUnjIbjypmBM1ibPA+DvwXCp6xRM9aBeWFc8r3bKOkNq8wik
         pCqc2lM/L6ottUdJJ6BXHVavWf7iNmfatfxpPqp2bgiWe5eMx1HNPtQxqRl3y8MuLGVO
         HW10lFrsrVsUX+YfIRVo+elY30G8jH7bFGMs6dMh8rNcMVjwjUI9qpnudu3v/XG+VPs1
         /XY7+1AaYmTHpzqgTgJEasgtBqVKpEypo3FVwV9w9aqF1kE3SL8WmykEs1e0qhLgTWik
         Podw==
X-Gm-Message-State: AFuF++korHQrBeozrpCIGxdvlJkgDa8xrUF2RLWZutrcG0n6FQzFSRrc
	b6TNE85G5rYFflKYzEhXyGaUgwm59O0Wo+qQiJ80zezE8GZfgG2AkqFc
X-Gm-Gg: AYBFou1Jrv+tvOupS3bVxZSXqrNkhusptDJ9P8QBWYUJ33gnkWfD6Ae/XHTyYDCcoMA
	KQdvBWMjzuuq2L9HkfbH+WTLICZxe28kYDiv4NZ7ZFUkbhNojGGVAxGm3yhXIHPSW5wWRK16UVS
	GdeOPPIcbh/Rvvdkvp/oWcVmVdFBUHDV0R59NalggGRIYxeBi4QRvauiindOAHqC7NVgc/M9dTM
	BZBFpWgrUmlNjYF2Wc5LBZB5zflscdMGxuTqifkNpcRZT3Uq/5rK+dTcOOzbN8VRPfO0cGNwO5H
	pFw+oIB8DwGqaKndbpPlthfoq7cZXFZ8F7c0P/zp8XrGlj9AB5e0O1v0FCsXtKUQxvYTOwglXTW
	Fv2S1zb4zBmDt0w/9dHrT4cgLiyEpR/jgXujHuAUOWSf8psy+vd6P77tHUoVMgpE8BVQLjk5ZBb
	47DMUlg7lLJ8aT4gaohTol1puvXlqCd7fSFG1vr7fy1/dOiuEo922sUMg10FCyfLmgdqxHSohRI
	CS2TWwAD10Woss2Q5O/TXTO3A==
X-Received: by 2002:a17:90a:fc48:b0:39d:f5d0:88a7 with SMTP id 98e67ed59e1d1-39df5d08b93mr9931365a91.15.1789461894767;
        Tue, 15 Sep 2026 01:44:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 09/23] ALSA: hal2: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:10 +0530
Message-ID: <20260915084424.1007757-10-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/mips/hal2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 2beb6a0dc3b7..84f265335cf9 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -375,7 +375,7 @@ static void hal2_setup_dac(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECTX);
 	/* Setup the HAL2 for playback */
 	hal2_set_dac_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECTX);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
@@ -400,7 +400,7 @@ static void hal2_setup_adc(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECR);
 	/* Setup the HAL2 for record */
 	hal2_set_adc_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECR);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
-- 
2.48.1

