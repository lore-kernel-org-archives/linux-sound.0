Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A586EC5
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742474980; cv=none; b=PwaJY9GUCNAIa+mf0twY7FCZBm3EoU83Fl1jcgJfBQBb4GbfropvSFe8WrV0GuUOAKQoa+8MRyMxNguW94aHWyxrKbHcBuoWzIhJY25DH3vfaSDxCFROIbrfytlAXH1JjhRWNKG+YtnN5ibtj2Nv1RNvVrqIURyvhrjVz992QPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742474980; c=relaxed/simple;
	bh=MRJbpzMReFBOxOrW2BCv7any1qqOc/3lriNrQn7Saow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rtd8tKoWExsYErhnnHlWDqL8JGqCj4WLq4xsAPvjrzEoMIt0+Wz3zp2VXc9lcxG5hLBcPAPMw99rlBsz1Zb0ZvKS4cvMA2c/cJ2XDDzrKbpplPqZTxFPkrzIsxAplWeFo1pb3naZjvIIgaF8QdBM0IKFrPL7UzvklW8LmXKd2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=RH2DO/XV; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="RH2DO/XV"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 877E13F59F
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742474975;
	bh=v8Q/8heYF64qru5snKMgVSU4IL0ROPu0H5zemtfSsX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=RH2DO/XVO1A84RE35+EgFl7vQyCUZHseUSE3R+E7jyhiIh6q4/8DUzNXJtxyIoqwR
	 s2307BvvZ1AoBivrozNfIOmyH9+qzPjYcRLnUZ/1joJboiEuM+EFEPtUoIuolEkY6i
	 13LZeg6LpoGU/QX/bNSP7eAdUmh4ajo+iPk/h1g1D5WhO6pbk6R93jW32D1GxsOBgH
	 bjwOwQq9RjEYLURxfpdhcWSWvRGYFbhDcesJJ2iTvXxuSaj+hO7bET/xA2osJZXcmZ
	 HoCbjemLcROsB0o4uuJP6RGDlbPGLT2V2mufAvTkovQkJ7xwdJgh9DZ2B3a+ymQ5mA
	 axNqtBXPMiAyw==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2264c423e37so14473835ad.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 05:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474973; x=1743079773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8Q/8heYF64qru5snKMgVSU4IL0ROPu0H5zemtfSsX0=;
        b=lVVig5ZWdx7Sj2Z15L5qwIiMRJeJ8gK52Lotcy+cyKD/QyuzkgdbYBQFOF+FtdQV5D
         l54gZQNy43iG9gw+9WTpsd1z9xFPFCy0wZs1sJkOZF8T9c+zER86O3xsbOUq9n8jAQCb
         jEDn/bKUVW4TrJL3ulvB1w+BEg7DbesSvyk2MgJ45OBaPBjrdTh/sEABqi6ApTlS3D66
         ae8GLVCu1320qmRMisL1u8QcnseGl7PTI3XALSa0T7xz2OQuM1Vww2wjegdPa01N2akS
         am745MJ0ecyoPsq9gKuMpNvrK5Pzvh7euO//qMEI/t/00UqUK396a3DPNVLJr0EgNSud
         94mw==
X-Forwarded-Encrypted: i=1; AJvYcCWgXKpgll3YyL2tnkJSLrGFITSKh4IDLKd6KSaKT/RuuQOsxbkXluErkrJs9qUrFT/qVTOCsZG0wCnp/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZH9ZZ62b/FfXiu+o3a66nwiV/uOu4yJw0AyNUyYTgGWfx461Q
	JK1YFUtOi+YMI/Qnb4IycV3btMJzESF0GMreoabH1J6vT7k0sHDa25WvcO5HUUjFSA54xAQcaJC
	k7ZB2xwyIgIUXfZp2ApjuY1/Onfu8T3yGeMpCc9yp+m+RFoPvtz/bgHM6BI3vBvfiO1bDb3s3Di
	HxbSezuNIr
X-Gm-Gg: ASbGncsZLwckj3d+WuiHhEAtaRtO57MlS7ZCSY7GkXQ6nEp262SweVfQYyAbS+jWgTn
	YVfODLLTPHlEAzDKjNPdmgl8MbdMwX+NUlyPvdgKTtbOPi/+VilurSM1pivGwgPOPNcBbhfIWwD
	gU2tlS/isU7EPvQMfYCyNF0nV7Tu/XpVbqTSJ7giMICD3ldKhnPEx2dWJMNLY2QvpVH5BhSRbxS
	Fr1GNmNYAFGNCncrV1PoF0vAhlbROsBYSHdzmtuajmx8y1UmxPdh2W8o6rDQKqPEF3W4rb+79A+
	NsYvdgGDNilEx4BQTkSqLiw/8MlPD2507E9Y+aOCrOyYG473L2FkUxX7eS/MMQ==
X-Received: by 2002:a17:903:2291:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22649927ca8mr97177945ad.16.1742474972957;
        Thu, 20 Mar 2025 05:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoyeYgcr58fvSndjMn85y79K0CVlqga5tgoq3Ufnsa4hK9r118Dtma+rlPl7qfamNL9i575g==
X-Received: by 2002:a17:903:2291:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22649927ca8mr97177665ad.16.1742474972646;
        Thu, 20 Mar 2025 05:49:32 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-229-113.dynamic-ip.hinet.net. [114.36.229.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d2csm134194055ad.125.2025.03.20.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:49:32 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: simont@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH 2/2] ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3247
Date: Thu, 20 Mar 2025 20:49:08 +0800
Message-Id: <20250320124908.529842-2-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320124908.529842-1-chris.chiu@canonical.com>
References: <20250320124908.529842-1-chris.chiu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP EliteBook with Realtek HDA codec ALC3247 with combined CS35L56
Amplifiers need quirk ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 30d4cd93dae1..eda406a4b52a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10734,6 +10734,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dee, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e14, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e15, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e16, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.34.1

