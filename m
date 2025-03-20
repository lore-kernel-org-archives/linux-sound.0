Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A80EC5
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742474965; cv=none; b=aeZUIVFkK/FmWu5AZ2HJEQUkFoPHLSZRCRuoUFpxxHNmhdeeCIJc0pK/aDMFCEIz+nKcfEZNPJ+C7fenBuQp++k83cH6u2sq5WOEz14siWbXubx5XlsAMcHgmlfARb3I4uXah9XQr3AYQ3EEyNT7fw24VaXTWDHBBnibOmRkHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742474965; c=relaxed/simple;
	bh=aStHTjdtJrpDKacYsLyzO+frL12AwKU5p8uNGZysYew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fg7wdBFC01+fIvvkiTNR910nzeamZI/Fq8ddYvVUqksyocZoEryFFxYCQiPu4TFM7DH/nz8J4N9qcQJkcN2LkKy7w4BYGfZQ5H29IO738cJBP6nWZ98U9rLClpazMLS/zw7+D1L3L1tbV1W0dChRuz12S+KZqd6ZM2zDx+O/Krs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=uEOZUREL; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="uEOZUREL"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2E0433F467
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742474959;
	bh=z9wosfMTvKly19CGRaWf+kiQFrol15FV6ibGh+/i9lo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=uEOZUREL3+idYWcVT9b1UiXQESmT4q9WkMMVVaf5aYjmSUG1RC+wiRaO6XlhyvyQF
	 aDxRkeUrdAKHVYD9p4f6wM5ce1fWNlj8IlW9gjPvy+CGKRaJ7obcnxFJwUz7zrwWbh
	 s7AW8Im0pNj7Xo1JXLWin43btCacsqNx/fqnXcA2tNC7eJYo1OeEGczwP3LOU5tdIR
	 OGx3uNWObogtosUY8CdagN6qPgtzyinkjVB9k78NR7VIUS6gkcWpzQ3WB//ExNHCyX
	 DPchAxYUkAhSaq5AGIL95LafoVSkNMZP1XDBkQX6x6hx6nhISkZ7I1DNxZHvaB2vaD
	 LstaUso5xkjww==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2254bdd4982so15233845ad.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 05:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474956; x=1743079756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9wosfMTvKly19CGRaWf+kiQFrol15FV6ibGh+/i9lo=;
        b=mkcETL3FO31CmYXZbbCZQG9iJFz2Na/t/8LXkfXinW6DN5OZaCkd2jpjRwxLUJUZxT
         2qvG3/BHiGaWJPrfiFkshdF6fEZ13ru3miyXdHWPid/n+/egsDsA5SxGgN6E8tS2qkjS
         GzARZW8xLcdzhhAxuLVcnpqjkVOzpxECaJsU5nOvIEIfoF0nz0zUqtiAOyTDdhNTc3vZ
         VqouUaDPT1Ls2EU+VMAsVbJ9NyQoIhjM7jCKMlJaouQ3pmba2msomsBNbMShz8R19MQL
         JHW/T5n/95/QzGEJdKVGL00MbWH4hy3O3pablFnJBcgto5qjzCD3BWYH/v3rJfKpd16l
         /S9g==
X-Forwarded-Encrypted: i=1; AJvYcCUPN8w/xNfTThMtwnVj29u1cB4l6OFVraDt/6oWUphLSUAZAWK1PNcCHBFEq7KFQC4QhipSc113PAP8dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5xbZaGTyTu6nP0S4QMRE2T8Pc3MCCwBqPTunFGZUWM1ocrzvM
	RtC6ik+xG1MoBdo0/x2p6ZX/pPX/4i+lE3JT3S5AsIxJlF2sFci9u7M2JYUfymiIJQI84BsSDdb
	vfnRTPvWF5B1oPBmpre1zgWymyjvttpoxLSuiI2uT8yvXWQPMJbzwdhWqjG13xmjL0XYwbO0O72
	ER
X-Gm-Gg: ASbGncsAzMJ4pwMHn80J6BUaUzU5EWWcqY4wNMUp/KV8qNV4wq9U5WZwf5AjS375wBk
	6f30dBthpJbdAJGhkXBnlcryA1hM6oNmbgTiYbkyZl/caVXjbNmGs/mqKbZL3BwqNK5t9OXKv7u
	7C1Uxw2VYaxR9DhsBwCrDqIsvD/r6+YrgYhrraci+E7yGDuf4Px9I1itjofS3ewT395LN1zuufZ
	G5er9rRVo83lZRxNwdkpmHIKVPzcu2zsNSrD2jGgJQtu57HQrkF/gtNSe/kFBTlzu2J5fBxJkJQ
	ueUnI2GlSU46xyzTXdw+74mhF7Br+1CXhuNPbkHNuA06O4UOtCw2iARyEAMszA==
X-Received: by 2002:a17:902:ccc7:b0:224:ff0:4360 with SMTP id d9443c01a7336-22649cb6a06mr113139225ad.53.1742474956693;
        Thu, 20 Mar 2025 05:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkAIUG73MYvFMvy4ljvO26jN+wzckVfdN6iVioSHGSBxuYYkhKK4/wmd9nZ+AQsMUZfxvlQA==
X-Received: by 2002:a17:902:ccc7:b0:224:ff0:4360 with SMTP id d9443c01a7336-22649cb6a06mr113138785ad.53.1742474956214;
        Thu, 20 Mar 2025 05:49:16 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-229-113.dynamic-ip.hinet.net. [114.36.229.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d2csm134194055ad.125.2025.03.20.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:49:15 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: simont@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH 1/2] ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3315
Date: Thu, 20 Mar 2025 20:49:07 +0800
Message-Id: <20250320124908.529842-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP laptops with Realtek HDA codec ALC3315 with combined CS35L56
Amplifiers need quirk ALC285_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1d8caf791dbc..30d4cd93dae1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10723,13 +10723,27 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d86, "HP Elite X360 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8c, "HP EliteBook 13 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8d, "HP Elite X360 13 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8e, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8f, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d90, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8e14, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e15, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e16, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e17, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e18, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e19, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e1b, "HP EliteBook G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e1c, "HP EliteBook G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e2c, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

