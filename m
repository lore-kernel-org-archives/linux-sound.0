Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D13ACF16;
	Wed,  8 Apr 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673201; cv=pass; b=YaDvPgYxLL4aVh8StHySsYISxoyBylxC4uhNcVly0zp8UVX/WM2qlyBpD4NguZ1FN8VSpRKS5bBpJA7t8IgPqCbDzDCiI51vxJVJan1E3TjlML8S3Ak1bF+1HFlJLv0M4/bJ/lA28HGScBgp8wgCaNdC9s1/Huedcql4UVknAmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673201; c=relaxed/simple;
	bh=0eLKn4VKjVqJa3bffvCgZtcvSpybUes6RtKnWB7qRAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NV9pdZ8DtpoKy/GQaP/1KGiUpLGSAK2Wr3RftidAjV7Nlwihht7Rucnf94eMECTSG3dvk3jEPnyw0S2Mh++86L3JGtB/G4FZahKQH9aYIJKJMc5pMra0W/suOKAvhLUzX4aTJRHfyY1XWiSeuKZE8fUraaRbQ2AR/uyKlELqW5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=c1htgSD4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="c1htgSD4"
ARC-Seal: i=1; a=rsa-sha256; t=1775673197; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X9yv/+6t8wcAQlMNDqMhleHwt+SsrqgfUj+Wd/gUxhykLdp0Gx+8SKDByueJk4StgWrcZeRFVWRCYPQ4ago5LNVlHK6K2Ju+4J1OnhJU/cMNztTnBUL6/ktHbXPSrTbVWTTcapuHPt9RbZ/kdXiS9pj6MHaUjRi43jlHM5pFEBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775673197; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JhXql+MW/X4xezGuD2uHKNitjohF4Z9X2CnmHmkgYSY=; 
	b=aqfpu9DVT5+CDdh+dA1AW/SRAoUwxFtWyL+lX267SimxucmsffbQBgFbYwYzT868mbbswM57gHbV/CdSSSjDvH04nfbEkNYMLSG8SrPGtby9gZs8ROSjqQBcjOVXREHkkGuFf3C2icUUfeuqS+k/6+JuzVokRd5sYo2uaygWVJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775673197;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=JhXql+MW/X4xezGuD2uHKNitjohF4Z9X2CnmHmkgYSY=;
	b=c1htgSD46BOR8PgYxpyrdWzkzCVD5P89jlYfpUeNxoGU/MYRHBStqaP0NiYC4dEv
	cqhRWljtJYlsA3mgpO8mKOCVMumz/OZWb9t+BEYpAgW4mTXXrI9XX6q7CJVer2auaeT
	D08S6WgUXjo3oVXm2W0GDcPzPi1JHECsyk87UWYUDNkLhja8KpHFEqAki3UzHJupx9p
	ha8+3BH0c6nCz/YL9gDhjEHNZ8pHr7gvM0Qnkxo26i94Xrs7Vs5nCQ9tKjJZ7fJJO0d
	rDTsC3iPmwvDT17VR0cXbWnsum/QuWzmADXa+hFpPMQiopT/k6ZsTSDbF5QekJzS4gb
	vdSzDntiUA==
Received: by mx.zohomail.com with SMTPS id 1775673194856926.5417920249006;
	Wed, 8 Apr 2026 11:33:14 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/2] ALSA: usb-audio: Support for Feaulle Rainbow
Date: Thu, 09 Apr 2026 02:33:04 +0800
Message-Id: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCf1mkC/yXMSw6DIBRG4a2YOy4JorHGrZgOQH7aawwa8JUY9
 i5th9/gnIsiAiNSV1wUsHPk2WeUj4KGj/ZvCLbZpKRqZC0r4aC3aYIImr2ZD+FMA2VNWz11Tbl
 aAhyfv2P/+jtuZsSwfjeU0g2/kAWAcwAAAA==
X-Change-ID: 20260403-feaulle-rainbow-fb6e2db837a4
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

Feaulle Rainbow is a wired USB-C dynamic in-ear monitor (IEM) featuring
active noise cancellation (ANC).

The supported sample rates are 48000Hz and 96000Hz at 16bit or 24bit,
but it does not support reading the current sample rate and results in
an error message printed to kmsg. Set QUIRK_FLAG_GET_SAMPLE_RATE to skip
the sample rate check.

Its playback mixer reports val = -15360/0/128. Setting -15360 (-60dB)
mutes the playback, so QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE is needed.

Its Mic Capture Volume mixer is sticky (accepts SET_CUR but do
absolutely nothing). Registering it confuses userspace and results in
ineffective volume control.

Patch 1 adds a quirk table entry matching VID/PID=0x0e0b/0xfa01 and
applying the mentioned quirk flags, so that it can work properly.

Patch 2 checks if a volume control mixer is sticky by setting the volume
to the maximum or minimum value, and prevent the mixer from being
registered accordingly.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Feaulle Rainbow
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (2):
      ALSA: usb-audio: Add quirk flags for Feaulle Rainbow
      ALSA: usb-audio: Do not expose sticky volume control mixers

 sound/usb/mixer.c  | 37 +++++++++++++++++++++++++++++++++++--
 sound/usb/quirks.c |  2 ++
 2 files changed, 37 insertions(+), 2 deletions(-)
---
base-commit: 292286b2d229fb732421429b027d38ac3f969383
change-id: 20260403-feaulle-rainbow-fb6e2db837a4

Thanks,
Rong

