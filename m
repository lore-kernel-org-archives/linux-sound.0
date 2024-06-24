Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C320330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238130; cv=none; b=L5kmCzNQBaza2/d79jGEfZmh9+Dlw4LahBSeFgia3zHDxAB8B9cvXSjHIz8A5mGozdFJdlNiGhSBTijVAuno/qLj/iBz/8mOvaKypkB8DnKwmPyiUOlNrEglfVkPUs3MBTC1/5661VAsfnXY0HA3LSkg6v7Bgl60TPk7k32EScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238130; c=relaxed/simple;
	bh=jqiiFeAOn7/znksPaKs4R8VuFBdjvk5ORDb4gPfh7ek=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P7nG04cPvzYnRiqTa7b3Ek8piUBS52/2nyWoZljygMI8aj1H4p0eRbWAIl7jeS75yVgHV3XNk0pEuOaqgEQesXlv1e5azgzXSnvfn6dzatqCSaKLD0Qhw9zs9sVSzgwWO425Ek4u++GILHZ/pP8fCLXh97GKLO8IOYbk8JhkXQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIkeHYZP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIkeHYZP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-711b1512aeaso3458955a12.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719238128; x=1719842928; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T9Rf6JRA+mYUBwhLf0oT4ls64Rhx3F0SXz/aJ/b0SCE=;
        b=jIkeHYZP9pPZBAS1cOh/jmEkDujOEriRRzcBjg3qCGamYy3rtxPrxu2Q/T51GOpBbz
         9rTMOgK8+BeSA6A732xMFWGFMQcXNzR2zYqvoOjuYIuE45zom5xJmV8TxxSYZWkYPkZ1
         zXp9e7dgYXWYflDRvCWzE597WBr9uC69Ep4XIOoRYVM6sWcNurKFLObQX7KPmcW1ie34
         ewy/WlG0OoV9cL5UsymeOzdMI6XJTr30GhsQJO3jEwu6zbZEKyikl3KrHzHHytTEooKE
         WLpSIoTk+GJJ++GLmX8d27CrasYpO4llDdb8ohD1uUfW79/LqlUH1NdGz1YiC7zO5dnb
         Ok9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238128; x=1719842928;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9Rf6JRA+mYUBwhLf0oT4ls64Rhx3F0SXz/aJ/b0SCE=;
        b=eZiQ26xTlBIjWBlRbSGILm+Gs/FGY1UNmZy1Gk5CNvpTPKSSNUP0Dp103gicl75QLJ
         FJRL7EfzaAuvR/HEMAjuEAK7NqPHAiiRGRjYxXtAAG+RPiNeG/nSmcNkTRp26V0fPHan
         BskNlLgMOlVtC3S9ZFtPCoSD0nNbS3Ip4cvhhF45kwzd2aEH2eMpy5lj1HowhQo2YhPn
         dnMgZYiegIg47UxMUYpuiJg1k471sgIG8ZyhdL98dhTizzpUcx9b0AGG6anNzPaOTL2o
         lwu9vErlGRR8vkT5yn2J5w2D/GftrS45HVxa134qI7dxXFlAxEwkWeJ7+X3+SeUp6fot
         q8GQ==
X-Gm-Message-State: AOJu0Yw0naxhrj72IfhkeIY2mQdRvMFV7c9jFUHwhioCoDXzE9V9YGZd
	9rUZ/Gu0bnc1ZVuTzPxGu0i5U2cXmDLW9mZHVin4nR7bVmp2lzr11NDEp8S93ywIDvrPhbMXvA/
	BQAjAvbFsVCRU3qYTJXd1fotJ/e5Lzfqp
X-Google-Smtp-Source: AGHT+IE3DmCAqry5avzIZShe5gudtGmNBU2Lu4B9+1efLdmgMpyG5pmMn/g1f9KngsYVPEgyUxTktETd+BFzvrvR2Ho=
X-Received: by 2002:a17:90a:4bce:b0:2c8:893:2c1b with SMTP id
 98e67ed59e1d1-2c8581e7053mr4501192a91.21.1719238127876; Mon, 24 Jun 2024
 07:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aivaz <reichaivaz@gmail.com>
Date: Mon, 24 Jun 2024 14:08:33 +0500
Message-ID: <CAGRy+7B8XNXNzFsb762e8d-qP+Uy5SGE8RaEm9Amm-dca-Z7hw@mail.gmail.com>
Subject: ALSA: hda/realtek: Fix mute led of HP Laptop 15-gw0xxx
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, kailang@realtek.com
Content-Type: text/plain; charset="UTF-8"

This HP Laptop uses ALC236 codec with COEF 0x07
controlling the mute LED. Enable existing quirk for this device.

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
+ SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
  SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
  SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
  SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
-- 
2.45.2
