Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D12040BB
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150865; cv=none; b=DG547/2/fTa1BA8QJTrEtD4wMmKG3ENYSGnUpVjNOhuDF2MQf/6mQ0HDqc+B16IfOMb/awbFs1ywFgSSfDzrG0DY/QLT3OMVFm7etPhAVmxwlDLAy3jGZnBUomT4ZLQwyaI36orPhPktR5s9UyAgy+6ov5ygQSCJxdl65ooWdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150865; c=relaxed/simple;
	bh=RL/E8p/vq14VYyGWfXE7LLz7N5+AUAggoi1gcwblUtk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PykspL+9UY01Djc53Zo0ChBNOCz0n+YE/oPDqE0WwnzYM4VK3XyFvd+b8NpB5pxhwq8LpUNJ4Zv6RxTtopWHjRKKi08GAC8CbHJEPz3ekgBD4lZoc2OYe5KOyzJnxpjyEb3eiW8vEe6ocA93RHPsn/52GE9LC4qkky6vmuIOoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XGscWNE7; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XGscWNE7"
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B76A93F233
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733150859;
	bh=6P3Fdo+///gJH/BN3CJ3yDbZwPHYCyVUVVf4gRdUcys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=XGscWNE7gMj99nuB5DEcm6QBfHRMkoBc378onht9mkN4gwo8crnXnJr9xkNNLKeKj
	 vhUJM5xo5g+Q1k+cMGihTLK4OkQ+Kknrd92Yg5wiFshiVxHBGBwDcal7v0/ZsoEuDb
	 s24ClsimPqGSNoPMGj4H8E7FVL0GdPV57xTItS3KvkTw2P4A0pCwiR1fbdhZ88al3Q
	 intHn+5EEbShReJuOEObeZtElm0BNuknig7LTZ8ZKZ5U+catlHbwj3mps+WPzvc9LO
	 SF+/G0q6M66+ofIkNYWpsgbIvtsq8Aqn8yYM1gCF9Yk59ETqDm3lHNKYz9KBo2/qFa
	 61g8/FUzX2IIA==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-724e7c48678so3605156b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Dec 2024 06:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150858; x=1733755658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P3Fdo+///gJH/BN3CJ3yDbZwPHYCyVUVVf4gRdUcys=;
        b=rGn75CfXEe7GKxlsKMAGRc9RLPH2gROIp9Cp2b7ifUmntY0JtCHVWxtbAsUgWL4Xku
         xdLEVLplyYQd+TqI1Rn8B74zAYZIBk0e4UP82jBavEc70oo7ySujtnzOGjjxl9HiJg41
         asG83d9tQRnkLeWIwMs1ctmLepSaEo/0cEisd1aerkb+UsDRJZa7mP7g5f3UpVHLXglo
         OvQ6OwusMtGNAPJA/IqTNWygvKSmsi3YiFZnsYDdvEERjL4/UbS3ZTALWtSMkuyk2MOb
         eFCYf8Rk3hcDXsIqDwJRNntebAyyQtoahq2ca57m2JLBmE9NB6hkqOtrrVpK/vulfamD
         POXg==
X-Gm-Message-State: AOJu0Yx8790gh4A1iEF1GLquFQV6KcFkcTYMXW+6lNM7qKS+tYpgRv63
	oc+6Kely0Qo/R+9i+5p61+3lQroZiVhKwXsGutoNYmQxjo14bdlrBvjzaXTXY2znPeSqzhh5kdu
	6EY4iPcmgRLfiYZQqXHGPVA8+t2Hzyrj6vmci7ZIHZGHiJWWKCq+A5ViEOB2o+YN3y0rn6gkulK
	y3
X-Gm-Gg: ASbGncv9Eyh3G+tZwvhxKMVImUHkOiPQ7wgCpKwrqCX3yZoBvWY2k/eWq2iw+EKMQUq
	naG1g5ERZbwOBMDA9b0x+Q0d7xylP79HPsC4Qj63ckO8KA/abM3xZz5Docu0od4Npgfivv0boPy
	1ctpGoQbpaY4Hh1ELUdu18IZnigDK8vu/1k+4xdfLgQkyexbTOKwUieRzXPXhs4yk6FUwssKqdm
	YLY1nILpb7XNPAC2WwiJBBolpoYM879Unk5I4TnA4U/5jA+cgsRlC2B1LjUAsZJ95xLlGyVMf0s
	tI7ViG/TtkCd6kjIifbJ
X-Received: by 2002:a05:6a00:2e0f:b0:725:4915:c10 with SMTP id d2e1a72fcca58-72549151038mr24880424b3a.10.1733150858356;
        Mon, 02 Dec 2024 06:47:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlatQFoykXyD2ayOlog4ehRSY8QHZGUqutjYhJUxA+LmQiaeuzp3+GFfSR8BBU6VE7UVtLPg==
X-Received: by 2002:a05:6a00:2e0f:b0:725:4915:c10 with SMTP id d2e1a72fcca58-72549151038mr24880391b3a.10.1733150857946;
        Mon, 02 Dec 2024 06:47:37 -0800 (PST)
Received: from u-XPS-9320.. (114-36-208-180.dynamic-ip.hinet.net. [114.36.208.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176145esm8566321b3a.8.2024.12.02.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:47:37 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: fix micmute LEDs don't work on HP Laptops
Date: Mon,  2 Dec 2024 22:46:59 +0800
Message-Id: <20241202144659.1553504-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These HP laptops use Realtek HDA codec ALC3315 combined CS35L56
Amplifiers. They need the quirk ALC285_FIXUP_HP_GPIO_LED to get
the micmute LED working.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2bf5c512ebaf..237e0c17083b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10521,7 +10521,13 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cdf, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e18, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e19, "HP ZBook Firelfy 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.34.1

