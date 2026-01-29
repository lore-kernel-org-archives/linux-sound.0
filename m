Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F51346AF9
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708884; cv=none; b=uxEK9GB1Ehy7xahK3q9kDXZ6ckWVu7X8jLtClWNDo/d+sj7kx7+zumA8Qtc/yVQRmBf9Tc8jYm+BrnAWHDFygy1b8bf/4XXee29dlmgButhpTM2eZoGtXLM2cekwXGeFgrfGlcywPd2FAMnp3AEWypALdZDmSavi/wekdZSAVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708884; c=relaxed/simple;
	bh=qlQ4qiWvFxFcl6P62tk7w9pLsKDClHOvRdzje7SwpWA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DcTn2PgCSV98A6aNwJPPi/98PG21gtfoKMOnF2USmEQw42u5x/kuRgsSeMatHfIo9JyKrm/7HPBPVXEpWn9FidXFTSQG/Ti4XAmhUtcXW/rKAu9E0ST7mrTispYIBEuReQkhptWAXhb8HAO4pv7oxPjGXCIv7zHDqiZ1ijAEtGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyXLy6Yz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyXLy6Yz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a871c8b171so7244535ad.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769708882; x=1770313682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhy93YBh20yhz9IBIDN0+mRyQtLz040Isd7j0h6aTMQ=;
        b=UyXLy6YzeYVnER7YZVf42Q1zkRJE6OEPKXaLOVy7suhr5qEjBV9NTEWNsbatv7FBnU
         /BG8dtWSOQK3YfjFmrza6CFjVNIaSXfyEkThMfXEB4lmMMb4OdUQxfaIP0ZvfVEZ0OMR
         DST4354LvU1Xr8TQ2+uk4fpLcUQYYXFEMpFnO022hp3Y82Q+pOb9XulNmiK3cg0Orw7I
         +rOlNW/bwCZK3rvXstW3DEzaON/a0l8nZfHraHZTUo3JMHHLqybsGway6pt51jLgefqO
         QnEyjg4ju5sgD79wNgQvtaTqLaFl3O8IXFZghZQ82JVUaclgby5F4p7ijdnhHII/i7Vm
         Lcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708882; x=1770313682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhy93YBh20yhz9IBIDN0+mRyQtLz040Isd7j0h6aTMQ=;
        b=trOcm8tTc0ljL407JLbMEEnY+kNGtgWe6I9Ps9/cLCeJ0wyMD2IXSe2KcPRh8zt/sr
         R4XhtpG7SqzcDiwTz8GKK/GztMJ3MeRrdi/N/mfunPQRF8H8QFBH1ufeZ2aeyK3h/IBt
         zVvqA4IYAmG6jIHozuYJYUgdfV4+DeXu3iVMP1jVWT9fSPowQi/YBZPKR7NOX7WOv0vx
         HeGrK7M9V3oPz9Jac1j4xys3xDCcx7rGMolP7q38Qqx/reEcQ1k7GySiR9pPGjbKK+IP
         2wGAcuv7JOrpetjx5YbYmPIHlhL/lzdJ8x7p4I1tIH5RaQAsAr2IV3gTlV/J3azHJyn4
         UNUA==
X-Forwarded-Encrypted: i=1; AJvYcCWRb9GyVV8taGC0NDyzWiXgSktt3895WA/DqorpDYkhZ81fYj+konEZOomuq3x8sarsdaln90sanEeNDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywLI5Wyt/p8RmQpjEt94axQ/RvPdkJKD2PDgXoCm3gxWIXB/My
	N0Qy22TF/SLb/BanzWW43DhUBntbtDe5z13Rf1dta5xND7j1LfkeIHvS
X-Gm-Gg: AZuq6aI2ZMM4Bc3kvYJHTqSp+rzDTDVwwhaVpCN4KVdwM0QEW8nWweBqBYucfslyZRC
	+N6fMsnnt6tMTWRLhY7vd0QkYQKtpKbEI96d65/GsWE7NilL+bEmbiKndqmu4wQ5Aj7N+pwZTKl
	kbP08woqE7BGfZnrodynI8TR2vXaUbcfdL2GEh9m5wPAFSbtRKZqH+srggAriUfkz7l4FLgFvKW
	eZFswXOeVDRlJFRq3E2Da17RuLoN/bkGcR4K6hQvQYwaObuj/3HGvveeCWqxeDHlIam5aqqtHj3
	Vu3RSYui/VUVQBTjjaot6OfII49nt7t/9lHJn9clCpl2G6F1O55wpw0V7KG41Hf7R99HHDgLIMW
	boxEPknG/OtPGqIHBlVgBwNUYlxKiP1CPnFOQQ28Z/gVqcH0GEtlBVGf8p1whc+VFmvhP2Wp/w9
	w7Egn4dZ+1Mn4Y0J5JgrvVgIoVry5Hlk78+aMhWN10hrIawuG9tgJbwgYxKrHtQvzv4w==
X-Received: by 2002:a17:902:c412:b0:2a5:8e98:1b44 with SMTP id d9443c01a7336-2a8d8150429mr1523275ad.31.1769708881916;
        Thu, 29 Jan 2026 09:48:01 -0800 (PST)
Received: from localhost.localdomain (118-170-231-131.dynamic-ip.hinet.net. [118.170.231.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm53978655ad.63.2026.01.29.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:48:01 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH 0/3] ASoC: es8328: Fix deemph control and improve error handling
Date: Fri, 30 Jan 2026 01:47:30 +0800
Message-Id: <20260129174733.6660-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the ES8328 codec driver's reliability by ensuring that
register I/O operations and state transitions properly propagate error
codes.

It also fixes a DAC deemphasis control sequencing bug and adds proper
resource unwinding during system resume.

Summary of changes:
- Fix DAC deemphasis control: update cached state before hardware.
- Propagate error codes in set_bias_level().
- Add proper unwind handling in resume().
- Check return values of snd_soc_component_update_bits() in set_dai_fmt().

Hsieh Hung-En (3):
  ASoC: es8328: Fix DAC deemphasis control handling
  ASoC: es8328: Propagate errors in set_bias_level()
  ASoC: es8328: Check errors in set_dai_fmt() and resume()

 sound/soc/codecs/es8328.c | 116 ++++++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 43 deletions(-)

-- 
2.34.1

