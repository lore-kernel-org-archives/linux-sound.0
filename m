Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D13DB627
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520504; cv=none; b=FKBQ8QSpkiya91OT0fWRw7pYvQRDN3XgYMk8pv4LHfmO+Kqw+nPwumzJJUKgR8NJThF4o+HEAUJPHjuN9SZhZo8VBN43ZZjvFULrgxLh8/NLIB/u8WDhaeLdHChgzmmAqReVl2mEeMROq3MwHR4TlPh3OoJUAiYQx9CNP9faygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520504; c=relaxed/simple;
	bh=kIZOK1qfAyoFT2S1ukjl5D1cpjCk2BnodCXlYDMgTZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilVnCbBV61gbLEj7GPd1R2MQbjOAdktphyCc+dHi7HbGvfhWM+J4Mr9sgVwxJXD/Q3oNmlhHFjWegl5rILYKz+NpVLJyqIdBDe1u/lPebvbdKJm81ywZx1TOFRG9yY8g4IXl6RwRAYtFF2L3t7DbUAYs0jTJ3V5t9aA9hXtbdEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noogadev.com; spf=none smtp.mailfrom=noogadev.com; dkim=pass (2048-bit key) header.d=noogadev-com.20251104.gappssmtp.com header.i=@noogadev-com.20251104.gappssmtp.com header.b=gvLPKrbe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noogadev.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=noogadev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noogadev-com.20251104.gappssmtp.com header.i=@noogadev-com.20251104.gappssmtp.com header.b="gvLPKrbe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b613a17bso3605e9.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 14:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noogadev-com.20251104.gappssmtp.com; s=20251104; t=1780520501; x=1781125301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ncuRYQ6vXO0pO1c4LkJwxxohYwSrj9gDhheUJ/MYNII=;
        b=gvLPKrbeirlXEYd3T0HJLF8h7oOi+KcHGqbhiH3+QF4M5NFGICrEa3cKDcyK8zk/YZ
         Sfpl/Oi+ewg9cec4DBm4xHz1mUQwnjuKA8m4t0NRXXwIZKP9v06dhqhpUwRYp4Bvn4J+
         ivZD0hyVPnHgjZ2ZyLsBjN8zibc3fQixOlDAXWiqjDdi6wa55r50+nlnSR4kYeRzgZh2
         dun/1qlrGfP/S4TyVdr39jySugF8gnC2aFjaxKtcXiwovlEff9W93YErfihv4tsV704B
         8K+5FdhRFljRsiPYY6DDqEGmiQYa3BKEjzI6IrvBTrm4m08DSZTkKSBgooSf8Iub2OeB
         igBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780520501; x=1781125301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncuRYQ6vXO0pO1c4LkJwxxohYwSrj9gDhheUJ/MYNII=;
        b=fhB+BU/H6FOjAPVoO6aLPedJ/ReMDeSJUeiMhrG/lEDrdWprwFPYnfjt44ubLmoAzz
         P8Dj9bvilTtFrYapf154UAkVCRHd9kDAJ+9kYCn7OUqzL2lKhtYaB7A1UciUCDC2McP9
         7lKPXW75om2wK6L7AucQI1qLC99P/gHZJbaOZh/jNwvNLjOnN+2x7kOGpQBq3ksUVXLD
         R3zp0h3iag19mRIPnnKDjoWzNLxAhRYvmhZYPgbNr6DV3AfBWZgCL3o+HSa2c/z2nwoY
         HbnLD4ku/pBN32AjK02kb2GfbU6A7JHLT9eaCJazJi6HFDjdYIQV9q+sZMIvZTEPTNdA
         aB4Q==
X-Gm-Message-State: AOJu0YzqaIbWoKgeqCi5Pdic5agHrRi+4h2wnJrNkbgch45Avwt3R/tK
	XxYVcqN9FlvvAEYesKMzjfjKesl6XLvM99w40gALiJjl3GvQTst9f+bm3bPW08NGdaECMmRog8z
	K+wgo77c=
X-Gm-Gg: Acq92OHCNo5E4Xy+2IvgyLQfkzmnGTV4WdAqpF/2SEByz44zdl8tdqROFpZzNkBOArl
	jYhTWuU54I5tmyDVcb0WC8TDztsYHuFpxn30E+ctYYtrb4nCKEOz524o+DqAwIbDogh8PNoFwI6
	yeRA4GxhPDcycAOSCwaLOgvpbL23fQ1raO+5bYnYKMNfW4LeP6aveCwa8ydWnsJU2FujVsYbUaM
	FSvCmrbDggrNxkmPPROuUcS/bOAYwpWTrQY4LgeGSOZFdZV+Ib/utw72d6s08AExEyrei/PjKNy
	pEkIqQd1JOaNPpBiN27aU6tDzRGubva0x5nyknxoe3Oo73lAkGyVBi4vJUPOwMLyWH/PzbqGmd2
	lXAPqYHsS86Gkqz1N/CGB0D5TPM3GAfNjWGG+MKY8GWpIqKe2r+fTjui++tgatx/X8lMZcPEt1C
	BibpdAYff7VkUVkQlaMsSG7AFLxBk/vR5YsRhF
X-Received: by 2002:a05:600c:c4b8:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490b60e41dbmr81178995e9.33.1780520500640;
        Wed, 03 Jun 2026 14:01:40 -0700 (PDT)
Received: from srv ([91.184.117.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm23207765e9.2.2026.06.03.14.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 14:01:38 -0700 (PDT)
From: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Faleichyk <andrei.faleichyk@noogadev.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
Date: Thu,  4 Jun 2026 01:01:18 +0400
Message-ID: <20260603210118.4240-1-andrei.faleichyk@noogadev.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dcbc66984..18dec3427 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7379,6 +7379,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x197e, "ASUS VivoBook X509DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
-- 
2.54.0

