Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23C41A4F18
	for <linux-sound@vger.kernel.org>; Tue,  3 Sep 2024 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725395074; cv=none; b=ufk29C+nV4rXTIcButvohArfcAzy03mD/sxNiNbpDR3RC3Sn567R+YUH5lk16OPSM4A3CpQZOqsk4exrHpLLkt4hh78yqtiVGgsWt/dF1qucVmxUazrceLGCtmIdO/G5soHgcT/akB0JvLD61CiM6RCG/MlMoCTpZExvPMTajjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725395074; c=relaxed/simple;
	bh=mY1IzrmbrEuzoy4Cn9EqiccwTJqXH/6DZbOis4YRYcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AS7VceZgNRn66qjlX891A5pwuku0aOlzcv+Tdawr4py+GdbRX6jKSkNc+JNUWYPH/mtvMaR+eniw/7Fm+2aizBGGuSbONJVCT3pW1cyk3qA8EssUJhqERzxVdUwFBtpYQwCw8iuDXrqlfUkBkbt9SrdHKzKPwAh5u4519771bC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9NRXwIT; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9NRXwIT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4567dd6f77fso369291cf.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Sep 2024 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725395070; x=1725999870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FcTDBOupoiPHziDUI9w5AVCLpD0rmMTefLPChszInhg=;
        b=b9NRXwITL2hfP2YZaAD8+oKHl74icyULudihxx/Nv0gdnQNVEI88nyboV8tDe4IeKB
         OLgiGGB5D+v9U2z8ZnemprrQTzo4oYy9xCpLkhUVoKIU0YImUd3wKkrGSrNRVX2x3HBO
         78GTKSv+z6qX/1xTRbVHxPcT6g5DPZZ9O8bPmho9IlYIooSGISws7b24oqZvSAsWD+C6
         uaj2JdKeCDitNrUFA8MOEt7pBeCl8LBLK+RQZdggdsuCeEicWRtq8w3q+Z6PqiYUnQz6
         t4D0xrvDoEtFBGpbD8AWNGlVxcy2dbSMLM14aPAU80ErhvQNgsci/9f64h29v2zaapAV
         YQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725395070; x=1725999870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcTDBOupoiPHziDUI9w5AVCLpD0rmMTefLPChszInhg=;
        b=Nolq9K34H1WSEDU2g1FRd5vegJiIolz9y6AhQw8pLaztlANCe7JY4OP66dmFL+eZBP
         UmHsNMVQWCX7v4renCWYH6rPOg8W9w0/Yehx7StFMMDj6spe3v9HQIQflOcP5qr1hilO
         qJz1LGB23se7eHSyDPJ2TqgScwhDKHyehW7KTxDXb02BucFCBuZv1BFFuih5lx2Az8bs
         gApbTtFg91GQAIf548U6DSgmp2LftmTNj4za/YM9YTagOgsCnGeLWiLFvULvhnAWCkQn
         4AsHiO35D21/6CXxpniV8nAUvEQsqVXKUfsnqEK5XlBmypKwHfXQ02g7pB1JP2uhLUE1
         8x8Q==
X-Gm-Message-State: AOJu0Yyt/38vCrQEPS57758n1ax3+wRiun8ffUBan5f0KHYzXb5KaaQu
	FPyffRRs0JrDMqcdlmI1QhuJY7LJ+2Ch3Bje3NMn+KwhZDS716GEottEBg==
X-Google-Smtp-Source: AGHT+IFma7k8S0MGBYmozAkU+m+vAYZUewsewxXbDMdbw4pc9WVJz3wVeRbPIyTxc6/MSehDYgBhbA==
X-Received: by 2002:a05:6214:4b0c:b0:6c3:629b:9e6a with SMTP id 6a1803df08f44-6c3629ba120mr174559026d6.14.1725395070161;
        Tue, 03 Sep 2024 13:24:30 -0700 (PDT)
Received: from victus.mynetworksettings.com (pool-173-73-96-112.washdc.fios.verizon.net. [173.73.96.112])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6c363cab124sm27949696d6.23.2024.09.03.13.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 13:24:29 -0700 (PDT)
From: Adam Queler <queler@gmail.com>
X-Google-Original-From: Adam Queler <queler+k@gmail.com>
To: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: Adam Queler <queler+k@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Enable Mute Led for HP Victus 15-fb1xxx
Date: Tue,  3 Sep 2024 16:24:19 -0400
Message-ID: <20240903202419.31433-1-queler+k@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute led is controlled by ALC245. This patch enables the already
existing quirk for this device.

Signed-off-by: Adam Queler <queler+k@gmail.com>
---

Notes:
    Changes in v2
    - added prefix to subject
    - add signed-off-by tag
    Thanks for your patience.

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f67190a8cd93..feb07c4d63d2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10307,6 +10307,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.43.0

