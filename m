Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE211CAE
	for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0HMZIOW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3fc184b6dso28081005ad.2
        for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703861895; x=1704466695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9W3jYTjJd0z/UsKtBDL/Ioe6JmwDU/Fh9wkb8YvyI8Q=;
        b=V0HMZIOWItK/SIbHq19LIMfptP/kjJLYDL5y0Ilgvet1jwZK1sCgauV4zgBZ0cW5iD
         w5mcOxt3yjNYdXuxP1yB1IDt/K7yHWj467tpMz5HS+38AJJVxr/Tnpb06NfMJr69hwYO
         mv2yK0e6IBnSLCmwso/o1nCG5U/WbiZXcPh8pgURmA6fmwzsiKwNhbgOQsE+PuNsW2hm
         L28Lv077ta6GqQt3RVRn4g0DghWSwE2Pa6eaItfbxhnAmZj4JjPJ3I7AepB9DAmco9gm
         tz4fWzmp62knmnX+PQV7VpOhtzTf/XsIKeI6Ih3VqNyA5zGSVh7epEU5zH+uAXtZDMR3
         gmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703861895; x=1704466695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9W3jYTjJd0z/UsKtBDL/Ioe6JmwDU/Fh9wkb8YvyI8Q=;
        b=cHP/uyhVnpHtuAJjzdouvHKpACU2F+19hGrZf5mQIim+8n0C01xpj3zTG9mAmOidpA
         npLtQ9xCylwOFDUSlXtHnIijWUohJs9FQUCxfvadc8locuC/+wtZzOOj9jcajv45IYQW
         xQLgPoeqk+J5ZqsuF7ao0CA/eyAu2d9qc4zLnsE6YCnzlOQgDDxudarPWUL37XozRuvq
         k0bbsyaZdaUuEYhiQ+7o0X6KALfF3bEWNA2X34HlsYBRFfMLOITkyRB2BREeRF0YG2Z4
         lUVGW+lcVBJLUwuCFVtyZeU5J4y8JGLFSXfK0p4BxtJvHauho/XIWe6tf/VFzp2hcl3d
         jqwA==
X-Gm-Message-State: AOJu0YzJ6p7rKeTOPUFOtcGLY6jkIzHBWZD+FrviiQKg/xVaTWDApbjY
	Fb8NJanB25qXqZ8RcizYKIzFLjklrJuJew==
X-Google-Smtp-Source: AGHT+IFBMvE2oq0U2rBYO5xE9eQE4r/rW53bC2JCdT85ZfEw9ZDHoYaa9WhQatyiXBC4Njr+MauU9g==
X-Received: by 2002:a17:903:451:b0:1d3:ee66:6a93 with SMTP id iw17-20020a170903045100b001d3ee666a93mr5245622plb.91.1703861894986;
        Fri, 29 Dec 2023 06:58:14 -0800 (PST)
Received: from localhost.localdomain ([2409:4054:2082:5520:36b8:e959:4a3a:a2de])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902860200b001d33c85ce1bsm15776266plo.2.2023.12.29.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:58:14 -0800 (PST)
From: Aabish Malik <aabishmalik3337@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	Aabish Malik <aabishmalik3337@gmail.com>
Subject: [PATCH] enable SND_PCI_QUIRK for hp pavilion 14-ec1xxx series
Date: Fri, 29 Dec 2023 20:25:33 +0530
Message-ID: <20231229145532.46629-2-aabishmalik3337@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 14 ec1xxx series uses the HP mainboard 8A0F with the ALC287 codec.
The mute led can be enabled using the already existing
ALC287_FIXUP_HP_GPIO_LED quirk.
Tested on an HP Pavilion ec1003AU

Signed-off-by: Aabish Malik <aabishmalik3337@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c3a756528..961555dfc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9881,6 +9881,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx" ALC287_FIXUP_HP_GPIO_LED)
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
-- 
2.43.0

