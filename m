Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E625D204
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527780; cv=none; b=cbJY/UnPz/dZNY00ImV5UaCdrdCctgnNefEdug9t15lq1KJvZaQ9LEE/bIHyZGbF5ywn26ZkipKflmDPASVI45e6ZOShDeUxwSoSaPBoXnt66gln1TlH5+xvRfXVyWzitfLnlETwLbGRtlmgcJTLYl7L/KYp41CBdUnblmEFo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527780; c=relaxed/simple;
	bh=mk//4e0lexN75t3KGWtP4llZR5wKNTTSc4upny09zi0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nCCPyTN3omFgWLtE/zXCmrCxAgdbOF3KoXKzpvthVBu+sAriKmLgWuxEqQVqi+fa5cSpz+GAZPO5VD2xUWYZbdOrXpXNYBBHKVG2VglAN31xCk76ureWnKRipmtE7eyIFMNmOrjbqy02XxGUcBbV6EdFL+Lu55UFLALIB2U4QaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kszqWf3q; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kszqWf3q"
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0BD53F285
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749527773;
	bh=6f8UfXSCXcF/uODMP4YgdLJixKlcv1NebpTVVogDgYY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=kszqWf3qZsKY1DZVCJIQbSLqjuNFKCUiV4ahY+miOLBOx1icEnHDlTUmJWnWdQvF/
	 xkTApAAYac8cD17LvxQRpGQDE0hVfN5DaFLJF2NW4hxWLcEwHJ2aoBYj+I+dX47LlR
	 Nq1xjtw+kqCwq+mM9c9Wmn9aWkZN0ZU/E4+MhdkvVvEUh640LegwfJbQBMEiKdC/OO
	 1+s2rBibRKyZ6sC1p9ALnjhZFOhFymtKsWbsUMm6IinoBe0+ho3tgAGOE+q9MxjgPS
	 zQM9CBpxwyqufcKmhhduDEbdnZwg9bXL0HUI+kNjjJBd6mpOpmlj7bbJ+wT7azx7oZ
	 XUAcN3kemi5nQ==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740774348f6so4296039b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527772; x=1750132572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f8UfXSCXcF/uODMP4YgdLJixKlcv1NebpTVVogDgYY=;
        b=gfLfcBx12NknZDu7FcvoMO+z8qJKCC/ftXY3MO7gy+wH+51thxGThvNCDq6iA1BgYu
         IezarfYUERLKilLnu60o/P7x0u69B7uj6BfYvOAaMztVGN5tuYGaFSo+wUusFFt/lXnY
         1KdIQIrZoIldawJ9g1datQUxmmt27lpHBa2DSiSAmmZrXUvKw8dsFmfCs1ptMFeMbAdW
         U9Yb375kKtu6Tn+iX/YoQr/O/SU7JRWe33RhshSiIFA7YvY6IOpO0odml0eJR7d+ncfj
         v9NWNFjGd2AuKe2I7XafDNkMU2DKMuZZMOby9CpQGnvJDzz35epVaw4EDsAqYKQtxAds
         ENSA==
X-Gm-Message-State: AOJu0Yx3L7UL6l1ft79Lc71ccWLwwhDFnqhNvPuMVjy/k4TMS5hVuxLH
	9Ujb8rjh59FKki4+6TviKZzac9hRq5Q2CFmGdYncsmUzc90Eu7SWa77SHuwwmOnrn+chqr1YBPv
	a6gXjBJ/govFFCjEYqV9g8Upc3F6dxuNjqlWWe0iAgVNHiMK6AB7HDJ1KtI9zx3mUqvXktrxDIa
	dkutcC
X-Gm-Gg: ASbGncs2IfCa/3rRQdDgfNKX4cbFrz378nz+5Z45myeQ4W4GGTts2hPbW/X6+CFkbGa
	Z+cMINAwPyZnEOCXdoKrgIVRjcsbFlleDq3FYTdWTs32p0el4sQY5dmxD77IC2NNeIMuzu/M7vN
	qLkRgvadudJ8U8KhOqJa29tYHx3dpNJoF5vYBKQJfVy+mYNy/tfqSJ+gYgRFp9tC2PWwz7qSKML
	P9GEyoSwdRelqUin00xQK85C7exwJ8kFfQ1lpnJ/rvaYX3J1IEBHckBfjCf9a6TQv7BtTbunYRb
	LRrjMpxUVRf7rCqPy9ZC0oEtBg0J2eB4IQIiE02AaYn79n9DvpJoCFkQFjKrS3vUUA==
X-Received: by 2002:a05:6a20:6a1c:b0:20d:df67:4921 with SMTP id adf61e73a8af0-21ee250ce37mr22867000637.4.1749527772377;
        Mon, 09 Jun 2025 20:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbdZpn/RR12NhB5LgcOMPREv1z+WRxpq5szK6Ofm1MM4coyBQSPQd9Wv8KNZFI5ZUjhjd4AQ==
X-Received: by 2002:a05:6a20:6a1c:b0:20d:df67:4921 with SMTP id adf61e73a8af0-21ee250ce37mr22866980637.4.1749527772030;
        Mon, 09 Jun 2025 20:56:12 -0700 (PDT)
Received: from u-XPS-9320.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c23f6sm6468279b3a.119.2025.06.09.20.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:56:11 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA
Date: Tue, 10 Jun 2025 11:56:07 +0800
Message-Id: <20250610035607.690771-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The built-in mic of ASUS VivoBook X513EA is broken recently by the
fix of the pin sort. The fixup ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
is working for addressing the regression, too.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 20ab1fb2195f..055fddb93982 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10894,6 +10894,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

