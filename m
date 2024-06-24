Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4013A894
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238613; cv=none; b=QEOVLMu4lWy3B6tSPMt2y4DKsc2iU5IwcUkQLv+Z5HzAaO2vu9FLE4Cq78O5q8TBgQNc9/JvNR3mEiCiaMSQgpM6qm/Z+ucBiIWFqDiqPDf2rjJDy9jyvn1KRA/durkTkf0r/lgITZA0PwagoCFi8Fj+c+XMxIvf4b/bOvDVGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238613; c=relaxed/simple;
	bh=k9lkwM6IFRElCbFjGK9Pex0iGrH9xan0e3hMlmb8mAA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JHnQLFkIy4v3W5wxPd1KhhG8x5dYlXoepDmdzvNR3d8Qk/WR9n0m5JPOLaClKqslXSxeoS2a74fCK6Dx0Moxr3xigMFgBfpeRMCMB+BrPjr94lLpEMR4h1AX8fy+OhgrWfK6R0lEVsqWRGWv0MzRrXEkbxDggt32mSCICZsMeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVHOXV68; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVHOXV68"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c7dd54d3d2so3497320a91.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719238611; x=1719843411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T9Rf6JRA+mYUBwhLf0oT4ls64Rhx3F0SXz/aJ/b0SCE=;
        b=eVHOXV68zFFUsgoWH5ZLKBOC62cHpCV8vtGk22O6lvA99d8CQGjX3U/C86M0qFkfRh
         Xc8NRieezc3wJE5nZyQCkqUTUYf96+MYsp1IncRW0KuQFyywv7Isz+y4gSQuD0tnbzmf
         zlhfB5yXGPD3NtwsHOimb3Ovbnn8q1m6MjGxu7TTKzgZeNn4UM3kU/NZSB+OR7jG0Zt1
         SvnIQuyeTp4pAsEJhi7SR6gnh8n1pXCXH9NdX00cR0satkcuKjwziId/B4nS0Ie24a8L
         2R1Dn/VSZkfQGgm3qkbgVHU1rn+zJLMFt7Hvw83Pe6ahm+wOs5FC3pfuAMKpufWgxYGN
         c2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238611; x=1719843411;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9Rf6JRA+mYUBwhLf0oT4ls64Rhx3F0SXz/aJ/b0SCE=;
        b=r7bkxh+OZthPEc/qu+GbFZHDtFCsWMqpNCeouMiU7kD42BbXFPeij3gGJe8lfMcj+L
         8Cl/Nhx8j48xa6MYvGSqRkDVHc3wPcyvi/5F4X+f9wm+HB8CBfWPEG2rcJ3oq4gLRdzp
         jng7cWUIy56H/VoLrnjWnx5EnpOe2TYjztE2lsNS2FbcV1u2Qkp1bk7EIbygvy0jljiM
         fXzMyTnMnotRX7kp5ki5zGJtS2BLkHF8zZQ8IgLzA8oUuv8vyqlUJWZ5gVMh4Vg8JgSn
         67MkHHToFKUKn8uGE7NKM4TtPS6jq73edoAtHjQOP00a17wlPgk5IUx/1LO4AcLuYFSx
         xv3Q==
X-Gm-Message-State: AOJu0YwGMOKrtFDHtYXKnyIvREb+rdOtYAjD6EReEuU1I92MzFsgvvhz
	ng6rNhx0bDrc5Ilzu6gy1DOi3/O9ubYr64+uX+Cb+FXTRG7andeR/0MhxmXvv1f+E3Iht6wa0+O
	W/DQXeFTevOHXWI7wHGuNUnwrbbM=
X-Google-Smtp-Source: AGHT+IFGYdX/wRft5eXFnX5F1OlpD8iy0nS66Q6Gww3FbLL4ML44jOH/s/oPhicpZ/2+tzj5xaEyzouMMz3it2za1q8=
X-Received: by 2002:a17:90a:2dcf:b0:2c4:d00a:15cb with SMTP id
 98e67ed59e1d1-2c86126724cmr4130079a91.21.1719238610967; Mon, 24 Jun 2024
 07:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aivaz <reichaivaz@gmail.com>
Date: Mon, 24 Jun 2024 14:16:36 +0500
Message-ID: <CAGRy+7BMH-4Kwp5mqCiDcjjQKJ2Q7gMwF=ZJO02hj+DyV1gkFA@mail.gmail.com>
Subject: [PATCH v2] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, kailang@realtek.com, 
	Aivaz Latypov <pngdrift@mail.ru>
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
