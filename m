Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720A11D53C
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244432; cv=none; b=kHXqk4Jt/8Ge8+lt/Vrk1WLRaAwwofUQSfDmCuk13aZYwwSmVq5A2QwVn1nTc5no4rIiC9nHiGSL3LkVSbvouJsafZjgOpGxCMNDa1kw+Gy9Shd1uBEpuPkxcS4QYIXCATwdU/wKmaXKAih4Hn2r4XQJ4mIF44b5ZVa9rXSYTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244432; c=relaxed/simple;
	bh=Q2ZEqfCZeyeaYZ35GdINfN1/QJFDBJa3yIH4Pg5RnPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGEVdA1u16QQFeDYUu7FuwfVqX8pFqIButdlyTMc9YCk4vBds8aOMuqkh2/qvCSAtTnmnNLZ3Oh3Sv15urfqVd2bEfbnbATbaePbm8+cMzu9xeRAQaJT6DotAryE289nStOlbKmTZEXmOt0NLCnQwdX0p+VJ6KuO+JkDeD6qRig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6TGmgrw; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6TGmgrw"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so51189331fa.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719244428; x=1719849228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8bKQRwiGkvRl9KgoZwzzq6N/cXk71fU0igZFR/F4E0=;
        b=T6TGmgrw53s9+V5J4puSBjPpaXvY7aKHE5gSzbvsX12J0JymBtCMWuh6mBSpRdfhly
         YXzSarsLPzrvK/TZf+99ej0vC7LhOjhc8n1+qo83sZsLdVJejcwHulLCuCaO41vkp8Zs
         Nem1s1ZRtlbSCFDMXvf0xDfoQx6o5aKlNKIVcWxpvrfjzSDBgtp91+eNu8JrzggAimon
         7BZOqV3trRnc2Wtbsaotm40XrWKlclS9IpJKJTYNliD7n0C2VRwJgyMN2foz3zdQ2qKZ
         4xC0neSy0XJnC1NepwIqOOYmTTCRSDMZ1TfRg1nmdqyyLNQt9Tbb86iww97rL9sI53fx
         ekVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244428; x=1719849228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8bKQRwiGkvRl9KgoZwzzq6N/cXk71fU0igZFR/F4E0=;
        b=oR1AbNYHJMdaNaEemC1oAtRKd6wNQm+sQ5MaWCnF7pFLnejvZlJaUVUIDBEWUrWpSD
         S/dmO6lNbW2B+pXtDBTH0V3dLGFBkMfAqU2W0HlZDSoSzIBSjxn8v8Iz7qz9stnDAiUi
         EWpR3vuigXV7Wro1s3M/SwNsxmWgPdEJxVxYt7qarigwFmCVSQ4gquaMBPPJFyZ4mbGA
         68rfnz/rJGNmpVVcDL542rjiOeBQH6R1VC0W9PvS9p+DIDJmPm758vcXEl2M22feTqVn
         9vIJ2y7Wfy/wOPF/FOKsn/gKceLRKwERCyRG704yq4AO0ooJ/19Vxa08fmwpWTyLQwGc
         biFw==
X-Forwarded-Encrypted: i=1; AJvYcCV6uoiGIzhCB1FxgfIzXNcTR/tTDpRvXFlCzr78V2r17iAhuZIL04X2qJOrj+gi84VkRD+3IIIGgTMxreuX3YPLxF6AJooGqiaf7jk=
X-Gm-Message-State: AOJu0YxmcCCiM69RQv07tPp2d+SFY11bUntda4MHqUGhMXiUCISdDZ+q
	iNEpAkFLhfXbH2ySU0Py36MESimMPbpDNe6m76iGfXaAZUDHNB7a
X-Google-Smtp-Source: AGHT+IGJxy7Z7WwouJd1zuKqfSxTafMM8PWoVq+EjUPgXvfC8CcbmS0MMGGDCuwjVAlAFlLLo3aBDw==
X-Received: by 2002:a2e:9818:0:b0:2ec:2508:f370 with SMTP id 38308e7fff4ca-2ec5b3e368dmr27082451fa.51.1719244428262;
        Mon, 24 Jun 2024 08:53:48 -0700 (PDT)
Received: from localhost.localdomain ([176.59.215.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5e2a4c42sm4495041fa.126.2024.06.24.08.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:53:47 -0700 (PDT)
From: Aivaz Latypov <reichaivaz@gmail.com>
To: tiwai@suse.com
Cc: Aivaz Latypov <reichaivaz@gmail.com>,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
Date: Mon, 24 Jun 2024 15:52:16 +0500
Message-ID: <20240624105225.169-1-reichaivaz@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This HP Laptop uses ALC236 codec with COEF 0x07 controlling
the mute LED. Enable existing quirk for this device.

Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f4454abadc8d..51225c5770ea 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.45.2

