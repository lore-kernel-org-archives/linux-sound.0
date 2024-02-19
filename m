Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A425579
	for <linux-sound@vger.kernel.org>; Mon, 19 Feb 2024 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708337059; cv=none; b=t6MkaAIB1ZGy7HVr97REmGLpCeVG+msrBdSgqkotD7BCCWCryOrYNG0FSZOQQStKpPkXR5yXtIonyIibS6Hu6KX/W67v3mANCQrrGUtU0to7g/BBQZGD8ivg9OS0abAa/GIYugiXtuGnudyVQOO9w+rjya/DxY/8vqMA06HxOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708337059; c=relaxed/simple;
	bh=ByCocMPom3eki87dGrgKJ1ZadjcI0CS9+IZNeFHBNfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WGq+gDTAGniTNpVlgIBbagx1z1fCaps+RP8nWnh28y2Th1ujZXklm0dq0qBt5x0eMU2PktWCaJANUByjhnyh8ubyBALeH4fem3V0loD8JOjSzLp6D15K20CzWyU35nicc0TTVMi67NC4Z18ChPjws/o4IteMRzG1dj6LjWTN9uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExoO4kK7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExoO4kK7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3158314a12.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Feb 2024 02:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708337057; x=1708941857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XasFvXswEmZDyUHnsVT+b54+a2fdPVFVT+IQcq1cIOU=;
        b=ExoO4kK7FUX221zi8CTxQUonFiz26A4OpGowUYU736jh5gMJAgaETCxeKQOTZDczO1
         9EqMEWu5eyaFA8yasq90bvlvnI38hgRyD+UaZ1pBPNRglvJNu2kJKJouKVbfK7l9/pcn
         b4WhwN1bquUUbEC73xyixu5ejCjL6zIC677gvCnptQfXwKRgsACIyMl9Hobz3Lxd/TzB
         0rDKUDy3adqUpn2YAR0I3/jzS5yax5fqyC3ve4CNDr6le8AaNRkHVieMLTEar5eeZakc
         NPlecgusdZxZH6zihGp22tRIdhZ1t3i4zChk3JpmPH9KQeeOzGJ+ZbfaGSKLDQFfkGAA
         jsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708337057; x=1708941857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XasFvXswEmZDyUHnsVT+b54+a2fdPVFVT+IQcq1cIOU=;
        b=f2ZLS/csS3it/sDII0/9r/q1LNIqF+1PE+S1lcYqJ8IJrhxqQka1ZeiDlsqUxW6GJq
         UFpZF+u8thyRqcRYS08Kyvl4NpGSsl2ox7141XZ862rQIToU9YS6TMGv+YQzs1qrFiVw
         BCmjDYvy3O1yaL3vT8dxm6uKNWA/MEct5DGmIn8bl21hde9XOMAj4/9l0Qhj1Dxj+G9L
         qf2ajFNy9QvaP2b+W87CO4y+7DODHJk6B2Z0hnVzbCAMPIKy/fqNToa+FYtQw3rHO/zY
         wL+LGzhyxHg//yKucWpngD+iY+eVlbKdN54FuDkI7QvVPHmwXgibBj/AIH+ez+tA44g6
         BspQ==
X-Gm-Message-State: AOJu0Yxw+Qix5EW0bnXwhjT/VYY1OMafVeB5vMMb49iAvC78DTrG+muY
	eci1dZos5tv69phzYw2pepuMUqo9nrbPz7mm96QuoHLk/4ye/T07B0ldGKhNYI6EGg==
X-Google-Smtp-Source: AGHT+IF8EaoCnvF0+J5NmnCVVbu78W/tXEEpzd6/l8aG6cvnF/rWf2iVGGUwNcHjVOgMGJ0XbMohrg==
X-Received: by 2002:a05:6a21:2d06:b0:19e:67b0:9ac6 with SMTP id tw6-20020a056a212d0600b0019e67b09ac6mr18246739pzb.1.1708337056911;
        Mon, 19 Feb 2024 02:04:16 -0800 (PST)
Received: from localhost.localdomain ([49.205.34.216])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902c61400b001db83d42322sm3186711plr.185.2024.02.19.02.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:04:16 -0800 (PST)
From: Jay Ajit Mate <jay.mate15@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	Jay Ajit Mate <jay.mate15@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix top speaker connection on Dell Inspiron 16 Plus 7630
Date: Mon, 19 Feb 2024 15:34:04 +0530
Message-ID: <20240219100404.9573-1-jay.mate15@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Inspiron 16 Plus 7630, similar to its predecessors (7620 models),
experiences an issue with unconnected top speakers. Since the controller
remains unchanged, this commit addresses the problem by correctly
connecting the speakers on NID 0X17 to the DAC on NIC 0x03.

Signed-off-by: Jay Ajit Mate <jay.mate15@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ec1312bffd5..aaf83ecac90f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9746,6 +9746,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0c1c, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1d, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c28, "Dell Inspiron 16 Plus 7630", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0c4d, "Dell", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x1028, 0x0cbd, "Dell Oasis 13 CS MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0cbe, "Dell Oasis 13 2-IN-1 MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
-- 
2.43.2

