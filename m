Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DB12E5B
	for <linux-sound@vger.kernel.org>; Mon, 20 May 2024 05:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716184542; cv=none; b=FYbcfhVogfJsEgUY03+QTdP6MclF1rChNfdoiaKk0+wxzEQKBUUUPBrN3NRG6Ei2D0wvpT2L6cn364FTWQdG6YjkVwhLktzEAmjLXTa+mB+iom0l7ZkFLIcky+/wL/ph58xNLRiDrb6RQ9wF3ymf+x6A6J0+hcDbwPjCuAM6Wms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716184542; c=relaxed/simple;
	bh=D3hBfBWFAkOkXE7XZHVApE+oFgVIye9G/XBbO66INHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZerTfTEXQudTbiJyEDfYDwMiPX1q9lQl4KG+GlOa1ZmhCFA9+zbGZAVtNByo9lvgwt45lUWGXvYBCEV5RwKAGfWqq9N8/eyvIoD3LEsCasydO0gWYvpTs/hmhChQvF8dBR/p5R5m2yTtuhMwWeCBXHeuhOtZOFEWoY0/O7BZfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org; spf=pass smtp.mailfrom=endlessos.org; dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org header.b=pMNJ79Pb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endlessos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org header.b="pMNJ79Pb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f082d92864so63057165ad.1
        for <linux-sound@vger.kernel.org>; Sun, 19 May 2024 22:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google; t=1716184539; x=1716789339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36PWmDpbq81T7RKlLsRFp+nZgDNN5IQn5Hg/VxCttB0=;
        b=pMNJ79PbSjNWFnMJkG2yp0wr/FXIowZ6ogJKLjI2eY/nlHjAm6cbBpYND73/hD2rd5
         lpMVOWBrRRzoeTPiZ3kUUWBW5IsER6kEThnSpp/bjWHW4954T8MDTQ9Z9ddPoEwdIQcQ
         I33Lql84La5dXdAa20CjhlwU9tlFyBo3dHJAPkLYltY9N3S+2e0Db5em419f3ACEL82V
         OMU86IFi8dQb6cHMbpztSvssu1q3ifIfVz+cnnuMdGEAtnna7EhUuRFVRpRx25U25mW+
         e0LO5E42hh+E9bD9NUnYuGPE/JAnT8m+CIbsmXyGZI2jIMZ6UC8TkPJ4titjFlduX/mg
         s2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716184539; x=1716789339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36PWmDpbq81T7RKlLsRFp+nZgDNN5IQn5Hg/VxCttB0=;
        b=H1QMa9Cux/nC8ZEIJz+gsvMvmQqrWTDINpOC+Nmys4SNbw8xJlboDa6dvVjz9i6LCK
         dj4fiLX0HFr1WNckvm31vRTXHDKRVJZGWoZL8RSlX42BXEqYO2bziMAha0aSlmhc/SG6
         RxFhutum2Ezj/Y77eDw6oWeV6ZiZjMJIkQ/cjr6bxBocAkLfHhz4ltYuOCXAmxNdGXHF
         JxDht8VWmciPGqrk1cfOvJ3Rpngzl2X48z+6whvvCEAWwHExE4l42Mzd5w6YA12E3PX7
         HdKPJKLsQn015t4/4481tR6ENqxoO9KUNTrLwQS7sUCy5ZzlBdYIpjtxcgjk7RbavJ60
         0zSQ==
X-Gm-Message-State: AOJu0YzamkzvrlN31AR9bESHNMl37MGR8LKpmsHQQaKsK8iv17StXqta
	W1q2lD5WJIsITtKfsMAlrZ5dIVC9EjCMMYG5nZc5kk2fPAQnfq/0FeUH6jbtmj4=
X-Google-Smtp-Source: AGHT+IEJKrvBdhOshQJ3scI0Ow5iFoydXWZ+yIcn5HATjeL7uab3SAeN2LBfD9afFNy3vrvVrzi12w==
X-Received: by 2002:a17:90a:bd8d:b0:2b9:a299:918f with SMTP id 98e67ed59e1d1-2b9a29992dcmr14764641a91.6.1716184539031;
        Sun, 19 May 2024 22:55:39 -0700 (PDT)
Received: from localhost.localdomain ([123.51.167.56])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2bd5f7e6ce8sm2053507a91.0.2024.05.19.22.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 22:55:38 -0700 (PDT)
From: Jian-Hong Pan <jhp@endlessos.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@endlessos.org,
	Jian-Hong Pan <jhp@endlessos.org>
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic of JP-IK LEAP W502 with ALC897
Date: Mon, 20 May 2024 13:50:09 +0800
Message-ID: <20240520055008.7083-2-jhp@endlessos.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

JP-IK LEAP W502 laptop's headset mic is not enabled until
ALC897_FIXUP_HEADSET_MIC_PIN3 quirk is applied.

Here is the original pin node values:

0x11 0x40000000
0x12 0xb7a60130
0x14 0x90170110
0x15 0x411111f0
0x16 0x411111f0
0x17 0x411111f0
0x18 0x411111f0
0x19 0x411111f0
0x1a 0x411111f0
0x1b 0x03211020
0x1c 0x411111f0
0x1d 0x4026892d
0x1e 0x411111f0
0x1f 0x411111f0

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a696943aec0d..c3a8e601614a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -12028,6 +12028,7 @@ enum {
 	ALC897_FIXUP_LENOVO_HEADSET_MODE,
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
 	ALC897_FIXUP_UNIS_H3C_X500S,
+	ALC897_FIXUP_HEADSET_MIC_PIN3,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -12474,10 +12475,18 @@ static const struct hda_fixup alc662_fixups[] = {
 			{}
 		},
 	},
+	[ALC897_FIXUP_HEADSET_MIC_PIN3] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 }, /* use as headset mic */
+			{ }
+		},
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
+	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
 	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),
-- 
2.45.1

