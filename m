Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F912206BB
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759181622; cv=none; b=ByNK0KA5tWT9N4cBb9R1o6hhJxSWcRZJmQddvl32Aoi7Vm2OnGtVawQWyTyeJUTpQgnNlzQ9PcUsYEXKX/6c90/lf8ZaTwVgj8/1IGtV30qfWrNO4LaRDsC6Sqyw3HqNeceQtnLqB2JLmxNs8hl/sQP9eqOudQBHK7NbWmoda28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759181622; c=relaxed/simple;
	bh=dfXKvQ91TOlkjdrPXceY7rW+DXPRQb4lDShzbaTpGOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BDEwTlcaYdmL1B+XmQtpXA799i1sHC5nduLyCzo8B+31u9liinG1BuFY4xSO0vpqaZvPlsxnl+7XDtPTRsDufpMC2cBhqY73kHUP2mY9oVCtA7TONICQBXB49cg5RxPgQIVzXiDdIitmXwbv2Nasqdi4ni8mIjr6xqIsAD+rXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oS6+xOE0; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oS6+xOE0"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-923f46f6c59so1249385241.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759181619; x=1759786419; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DndpbGnaGr647nqjLPsyXZsnXaydKUcV/c1eXt3NA0=;
        b=oS6+xOE0IsOGn5UIFJp8S0+wwW44uHm2Rh96CKwanCWDX/Z1D8vat81V+owytOtard
         6oxuyML2mg2hCi0wanyodcmOaKKCywYfNwsqkO7+6HIF+1AdgMH0o9TU1stvcWm4/G35
         NBmo9nyrHh7um5LzumsVqK7TC//7ZYgFE2G8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759181619; x=1759786419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DndpbGnaGr647nqjLPsyXZsnXaydKUcV/c1eXt3NA0=;
        b=EkHXd+ocIiLvb1CkkoIPSyj3xprVv4oX195gXHMprvfj4W9ALnk6zlyn7+xwiZExhK
         7WZfo/Wc+RvTwWAzAz3bNxFYdXU1dzFLsljC2m7/qO4XB1hk01cW6mx1jZxi6gZN8QMs
         UbHKG580hP9NwnNSJVBVMxu+CEzrLtGKANTrMtXnpiz+djXyGmucY0yBq1885IRMez6n
         M9lS5oZphj919bA+/gHEBWNA/P4zUT513R43a/FxmHlaEL1HlqechA6T5jf4AIlYEzqd
         uVFdPHNXeZZJOmpInn5pzZ6U5qFnxUeMtU3y6KLwnz+ORpKPcAYKJJdCM3K02de00ler
         l60Q==
X-Gm-Message-State: AOJu0Ywq9pzunwd5KmyJ6I29tzRp0SYSLptlETFjgrOQ4kgc+t4n+Ult
	0wVtwAQ6eDGrhMdF4gKulJeAJ9n9kQWA1EH1U+hnSOiQbBnYL5d7SAy5W7JAsCg44Q==
X-Gm-Gg: ASbGnctu0Bxe3FX9G6No5mu0Put9JR98Ik60wQ+mTAmVwMhqq3wU6fomgA+ffg6HaiS
	Ep0Gby7MKyUSe/CsIPhLOPBsGoUYUV6T9d1DvIiHNb60GPlkyM32eb6YxMGDq+uIu5Z4e5Xwuh2
	JepVDm6/ZkZWAGGND6rKhPDBR+OOyIIukRAOuXbNE+yknFrXKJuexQF7Ik5THJ0IU/vm0Yo19l1
	BflgBXNm5VYdDzjApHp6WEWGNwIbfPAxjF4nLevS0gs3GogQvB0rfSfc2TPwlgAPsb2zGL6PdkY
	Sd72sakOrWFrDszmJYGma3cBUu1AGatdDrL806hf5EhIecug2fXqgB5+gZVvX06ntcxw7Ty37Rv
	tCXKwUH7Yj+qifAlrz2wKCOaWH/xR7aweBIa94lVWei+7tK/z5nmsZ4aIvfijjpuBeZoXT6qOZa
	VlE9G+c9jvx/O4
X-Google-Smtp-Source: AGHT+IGBcKDX6t5iDAMqyGpZDqjCIaqn4UqgrhOWcA2rKa6QvdAjhZ5diuFuPMe6votfx/4yDSiOLg==
X-Received: by 2002:a05:6102:304d:b0:52a:1104:3029 with SMTP id ada2fe7eead31-5ced60fd25bmr1445401137.17.1759181619470;
        Mon, 29 Sep 2025 14:33:39 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (62.37.48.34.bc.googleusercontent.com. [34.48.37.62])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3b232a01sm3687131137.16.2025.09.29.14.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 14:33:39 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Mon, 29 Sep 2025 21:33:34 +0000
Subject: [PATCH] ALSA: hda/hdmi: Add pin fix for HP ProDesk model
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-fix-hdmi-hpprodesk-v1-1-f4a7e714ef11@chromium.org>
X-B4-Tracking: v=1; b=H4sIAC372mgC/x2MQQqAIBAAvyJ7bkGNAvtKdEhdc4lKFCKQ/p50H
 JiZCoUyU4FJVMh0c+HrbKA6AS6u50bIvjFoqQdptMHAD0Z/MMaU8uWp7OhG1/ugrNXOQgtTpmb
 903l53w8HZqtmZAAAAA==
X-Change-ID: 20250929-fix-hdmi-hpprodesk-c6c3df1bb2cb
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.14.2

The HP ProDesk 400 (SSID 103c:83f3) also needs a quirk for
enabling HDMI outputs.  This patch adds the required quirk
entry.

---
Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
 sound/hda/codecs/hdmi/hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index 44576b30f699511c79a298af5d79be81ec1fc0cc..774969dbfde4573894d87d603d64a7854a786fdf 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1583,6 +1583,7 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x83e2, "HP EliteDesk 800 G4", 1),
 	SND_PCI_QUIRK(0x103c, 0x83ef, "HP MP9 G4 Retail System AMS", 1),
 	SND_PCI_QUIRK(0x103c, 0x845a, "HP EliteDesk 800 G4 DM 65W", 1),
+	SND_PCI_QUIRK(0x103c, 0x83f3, "HP ProDesk 400", 1),
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250929-fix-hdmi-hpprodesk-c6c3df1bb2cb

Best regards,
-- 
Steven 'Steve' Kendall <skend@chromium.org>

