Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1120230BE9;
	Fri, 10 Apr 2026 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843369; cv=pass; b=f2xsDn/SbJ/tpRjr/T+f6vGVkTUaN8tKBUYywOW3U0kol6Vcek1k0S7FYUp/fbifJlJBZul9bXiOFK7Y2xsq/iL/S5sEAupIgs5JAUxnQ52tD1gH2JrnfL+uFnAAYJsufeIV/ngMaFfxbxzJz7b1O52NldvbB6z/HzLIfBfs5SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843369; c=relaxed/simple;
	bh=dN16AijVE9SCY3MkJs9FxwflRIVl6v1da4h1MUc4FIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bYikM8e4RzQ5xfokzUv2njaXOeJLoEt5jVArUysSvWhoXy6ntXh3RPVZ8yhHY4x+RCqjKqG7t58BOqBWKOs0uFRGG1vJLNQMExZ+kkB1Z+Urq20bKl0knAZyBVT2UIfTXHpqAVmYvxYK2JVVtbIfRzyOzf8jyURlU6guFqtcsH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HFa08GCI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HFa08GCI"
ARC-Seal: i=1; a=rsa-sha256; t=1775843361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V4P6JbZjl5kzzQY+LJ0krdAVbXRizuzS95s29mpyzBYE1yGqevPZ12JuAaB4A0ruh6PEep7cPe/cGygOpkv9uiJlq6+Z/nh2LFckBOO2wn9PtbhCu0xIpwDg4jDAtz9NV8d/FDaBOqelQKKJhIwwFe2SoHCqBgapFfZ9zaSuTcQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775843361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9cKQjHUoUnjTnc1wN5rdJgfrnWi3jyJGOH+0nJnIEUo=; 
	b=WmTqY7i+S4FiqAopWQ0pDiMnasqR9bcF4RUq8yvcHBln5YHmWujU4DMmvyJaGt5BED4lW8M/uZEDxR3vkq53zspVmd9Q064idUw8fclGGFPJ90/YXe7lPrG9Ui5GI6e4hAkB2aj4Vvyr/pIj+/UvRZU7rLLqcklcqj9uK3hq2x0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775843361;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=9cKQjHUoUnjTnc1wN5rdJgfrnWi3jyJGOH+0nJnIEUo=;
	b=HFa08GCI21xsBkw1X6+s3OQQGZWnojprWFBsCkii6ST2mTlhOhTU3D+el8o3ti0g
	DjJc/toI8IDy2AApXoWndhlzvzF5Uhqk/iiPOOZFiK03RmLUnFdu3v+ViZLCnPUAa02
	52sTIPte9/qp//h2UmXuEOIZJj/ax7GodUujad82LCeopSLIVoqM6Ve7NwUlm9q0opr
	wyaLjxgJOJUQRdSPPS7eeMmXFdxf0OyCoGyWZrxyzRgGJIM7LuscuGCxFWRrNPd8w0k
	SElbSgdV14yZ83ERVeW29e3iwjHzJHSzBnfu9WTglMjdxpHyhxGyM+hZGkPHK6GqFdl
	pcmAvMP2gA==
Received: by mx.zohomail.com with SMTPS id 1775843360004909.0719420786968;
	Fri, 10 Apr 2026 10:49:20 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/3] ALSA: usb-audio: Refactor mixer checks and add check
 for sticky mixers
Date: Sat, 11 Apr 2026 01:49:01 +0800
Message-Id: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA042WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dLEZN3ikszk7Erd3MyK1CJdMyNzUyMLS2PLFAtjJaC2gqLUNKA
 EyMjoWAi/uDQpKzW5BGSOUm0tAHZ7rHt0AAAA
X-Change-ID: 20260409-uac-sticky-mixer-627528939d83
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

All callers of get_min_max*() ignore the latter's return code
completely. This means to ignore temporary errors at the probe time.
However, it is not optimal and leads to some maintenance burdens.
Besides, get_min_max_with_quirks() is too lengthy and hard to read.

Some devices' mixers are sticky, which accept SET_CUR but do absolutely
nothing. Registering these mixers confuses userspace and results in
ineffective volume control.

Patch 1 makes get_min_max*() return -EAGAIN for temporary errors, and
check against it in the callers of get_min_max*(). If any other error
occurs, bail out of the caller early.

Patch 2 moves the volume control resolution check code into a function
as it's relatively self-contained.

Patch 3 checks if a mixer is sticky by setting the volume to the maximum
or minimum value and checking for effectiveness afterward, and prevents
the mixer from being registered if it turns out to be sticky.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Feaulle Rainbow
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926
  (Mic Capture Volume)

This series is separated from https://lore.kernel.org/r/20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (3):
      ALSA: usb-audio: Add error checks against get_min_max*()
      ALSA: usb-audio: Move volume control resolution check into a function
      ALSA: usb-audio: Do not expose sticky mixers

 sound/usb/mixer.c | 138 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 103 insertions(+), 35 deletions(-)
---
base-commit: 5a5fea9a0d663da182e04f4a4c7a35bd935a14c2
change-id: 20260409-uac-sticky-mixer-627528939d83

Thanks,
Rong

