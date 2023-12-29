Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1512B66
	for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAZULYCk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso3968549a12.0
        for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 09:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703869507; x=1704474307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVq6K1sivNWffK1+EDGP+nw/EVVoxmj0q7djAv4OiO8=;
        b=dAZULYCkuvTYoBV9jQsGW4rfrfli0tYJSFWrvyFqRaFnNWbA/5+NjlQ0Pl5bhOPmwD
         aUpjiijn76a2fYbkgyYEDzLAMYxwW395EbPR0cI94oK2Jl9A/7NxnIpCnzR2MuzRdMcH
         RGjAj4mpvaMmH0rZU2iXPUkqDaBfZXaRrssONCU4FqJo1EGuk2fcS7JeZucOk2a09uW6
         gC3uOapg4gldOHg4cv8Bqp6qpKpvbnApgfbmML22moOJkgNiOmIGW/Aa7nWFXjh9emZX
         wbCdlhEI7fQS6Fduu3DoSJWrCOXZBA6qcbZrqzRTE7mC1yxQrRIOtihpJaloiOVEdIjH
         /hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869507; x=1704474307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVq6K1sivNWffK1+EDGP+nw/EVVoxmj0q7djAv4OiO8=;
        b=JMKHEXc6jx2mdbJViEdt3W90tc/koANdUIaih89cVVa7IQ2vHphwXXbHQzZRpaQvx0
         2WViq4oPLmHb8TfqY3RWFUBHJpPxT/aRF1yV9IZWkshynPH25LdNyhioCnT1ndI0jdsD
         dk6i7gZX7l9Nwvb4q0oiqAkm1N0kElIthFJV2g7EWr3vE521S4Elo34Ys5jZcdoxsf8a
         fZ//SG0POieWJyhsX7zzI91aYUMXeH//uCzey2IYY6AQuDK83a0nOftoxg6ZI5iGp63Y
         l+Bn+OxuIc0PZ/OSySz9twlCWrTaivjAlOEjJrYXpcHZ9s8s6dnEr6kp3czlDjAw/JaG
         EWMg==
X-Gm-Message-State: AOJu0YxOQ0LhMbTl8urgsyXTjPu/VTInHFuLPspmdvZHh+2Wa2EZszWu
	WkBs+YZYG53Cza5usUulLPmQ1f3vLm8fHg==
X-Google-Smtp-Source: AGHT+IH5tcg5YTuhd7HBfqy9K+fjH9g03Tum5z3OgZ7vrifOGoToRuMPsn3jmV95HsxGkB2p8+lFNQ==
X-Received: by 2002:a05:6a21:612:b0:194:f17b:f877 with SMTP id ll18-20020a056a21061200b00194f17bf877mr11391143pzb.61.1703869507438;
        Fri, 29 Dec 2023 09:05:07 -0800 (PST)
Received: from localhost.localdomain ([2409:4054:2082:5520:36b8:e959:4a3a:a2de])
        by smtp.gmail.com with ESMTPSA id e17-20020a630f11000000b005c6007a13b5sm14729688pgl.25.2023.12.29.09.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:05:06 -0800 (PST)
From: Aabish Malik <aabishmalik3337@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	Aabish Malik <aabishmalik3337@gmail.com>
Subject: [PATCH v2] ALSA:hda/realtek enable SND_PCI_QUIRK for hp pavilion 14-ec1xxx series
Date: Fri, 29 Dec 2023 22:33:54 +0530
Message-ID: <20231229170352.742261-3-aabishmalik3337@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 14 ec1xxx series uses the HP mainboard 8A0F with the ALC287 codec.
The mute led can be enabled using the already existing ALC287_FIXUP_HP_GPIO_LED quirk.
Tested on an HP Pavilion ec1003AU


Signed-off-by: Aabish Malik <aabishmalik3337@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c3a756528..e2f68e502 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9881,6 +9881,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
-- 
2.43.0

