Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038A61674
	for <linux-sound@vger.kernel.org>; Sun, 25 Aug 2024 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724577926; cv=none; b=nodxpLdedS4ltGgGu2uM7UdrndxztPm9KZg7VpqSnCgqXjUub7V3nUebZZLczq7Ln95wnmCaBGeSBaXG+mGN63ghWnsbcxQyOmM4XxxDgFtRSf8oebt932t3Enr2R8zPYlZAmdxmkjjKTNvI4mJn5Pods2scH3/oEatAXJQ0Xr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724577926; c=relaxed/simple;
	bh=KjRyh8oJrPjFO0e6jcZLKCtnNQEFvHTFYFbjZmTG9Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KLTpkBVMAY//DjkVwZe4t7pvm2NToju+S9cLTGZsD7Uy7NqkEi+0slv0SyQefDOwCdYYstI5zWjwjUeP8xN3ekWu4QBLNKCfjkIbRwpI1vzQm0DAK7h416p/OG7wxht28fyzLD3GFgrIlqzn59EIGHUMDrx/DhOZPJs3iv+bu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAebyteb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAebyteb"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7c3ebba7fbbso2405962a12.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Aug 2024 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724577924; x=1725182724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1D5yQvb+YC4vZD6uaOU5mXekcCcKWTKd6PfbwxOD/Rs=;
        b=VAebytebj0LZ58Ne+F19hugtKfFB1efZKTRqH4tuMCQ9rMJhV1ppvei+gR4wrl1tr0
         Gafp2c1e9uBw2aw3+55RnyZFwqsqPMCodZipad7xw/lZGx0xl6uJcEM8slia9gt/M1GS
         Z3Hzl22Bi5irKiPRj2kB+xV9aojL9De7To98/Mt6NnxCSCYIW1JI0dJhux6Z8MDpQyWN
         tO2wtod0tI7aXQ8i68R26d754Z9nJXMR7dtxaw3v7cCeNNdxPew1W7ZYf2Jnlgp+YxF1
         4tg2D0AWGIQU+2zvxpbJUlt60OSYKiGLwepercJbJ2PANPa7SCvDGXASByE8vp0rULuo
         ezoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724577924; x=1725182724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D5yQvb+YC4vZD6uaOU5mXekcCcKWTKd6PfbwxOD/Rs=;
        b=XqCRkHDoxAircZgxVLr8ivOUv8iMe0Bir1U/llXGxN41rDMghLJU/UhGu6bK9DfydT
         2iN8i9vWDXTqniXpS1OBbOWqTNzWLPlYzGlpTSLDQaVn3WSDg+O12XfpB69clL4m8/nJ
         0hR6I015GQPJ7vHbIA9K7lBnlcD+ENF4WrXleggDid6gX51QG8Iom0NtOU4uTVJ66sZZ
         +9NewV5xjan5eCa5T5Al9jcnNN4p03reLMKbC53sMBBrrCSuMSJW7o7jK+f4dDSJ8K7E
         7RMiH8zmVISag0Gzgr25VSWMmmS9ey19KaBOSQi5bsrMF5KL6Wbpz3Zt1jZJP45suy/y
         zLlg==
X-Gm-Message-State: AOJu0YxDvA2GN4zQbvcNIrh5ZCHGuDHQOiJc1cEe1mmd9y/X0J8lOGPd
	q9nYs9+g2yIDR2PVctqWWzTR94izuBk081fJ5fJCVbvn6/RERmgIpp82uS9M
X-Google-Smtp-Source: AGHT+IGVu9XbzCa8dve/n3r/O8xNEEzURVDKJ3K8RMpKTAYIWvDSpszBNr8rlobTHgrLTdrJOyOLZg==
X-Received: by 2002:a05:6a20:c793:b0:1bd:feed:c031 with SMTP id adf61e73a8af0-1cc89d80195mr7721337637.28.1724577924502;
        Sun, 25 Aug 2024 02:25:24 -0700 (PDT)
Received: from localhost.localdomain ([14.52.29.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0e18sm5415068b3a.104.2024.08.25.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 02:25:24 -0700 (PDT)
From: YOUNGJIN JOO <neoelec@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	YOUNGJIN JOO <neoelec@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book3 Ultra
Date: Sun, 25 Aug 2024 18:25:15 +0900
Message-Id: <20240825092515.28728-1-neoelec@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

144d:c1cc requires the same workaround to enable the speaker amp
as other Samsung models with the ALC298 codec.

Signed-off-by: YOUNGJIN JOO <neoelec@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d022a25635f9..83cc718314d0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10513,6 +10513,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xca03, "Samsung Galaxy Book2 Pro 360 (NP930QED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG-KB1US)", ALC298_FIXUP_SAMSUNG_AMP2),
+	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH-XD92G))", ALC298_FIXUP_SAMSUNG_AMP2),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
-- 
2.39.2

