Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041D28727D
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781728799; cv=none; b=lKumeTK1D9S/czyPXCEr804wKne0z78aVT2m4Vp24sK3wxKcrqGf/SvxxZVBit/F1j0AaVPZqFMTX7sRrcfrPTApTrSSFuNxUdjoIskZQ8wXX9CbSrvZHjImWjTWik/XLEc5cu8jYJqNEJvF3QFqoJNLpRMgv4vngGObG97RHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781728799; c=relaxed/simple;
	bh=u3D548Ek3KWqFQaAgrrBfOTLa23fMWzwWURnWVANHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VTs7UE2fG1DVz8xKbYfQyPaxlAsaij5iiwElaGn3OQAR2LlGt50WX30ehFDLYQUQXNBZJWUC36jkSGC2OR+hozX/N8IlnBbtO+DRz7L3fYpi7dkSpyxXa0qOO6fuxnR//F/Uhpjoqr9462a8lWy738mzXUgq33ztIXyuQXBTfzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTonjm5U; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTonjm5U"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ffbc4d8b8eso2683287b3.2
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781728797; x=1782333597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIEF4Fa/gkBkYZbpYeSi+UCdjsb8psDBijGh79YSssk=;
        b=CTonjm5UyKT3Fm84EYL92Tw3V2OgH6/waYW/Ce4pdiu7ydnPtckYbkgYceppKhy/LY
         0ZODno9kSJ7TYMVvvQFWJdtUJaL50je6AU8JNWm4CfTHwnbE/SRv61rZMuvdXndZIm8j
         tsQdUs+3cU5zCfv5X4Ov6CKTDWQ278RceVBULXZdybfo+LxYqB/GcwP+YA/wRuhEaVyE
         o5ChR3iFNIc4H4uTiO6pqR+w5h/GhqsBTmZNSQ+cMzS8kbSAtlfM5Vs/np7/dbheZUdR
         sLEJXK2mzKflZ4GPs1Rsnzqcl25IY8NCe+dWtYcMI6CP1Ni0z/D27Czuu5EBgma9GPwF
         5lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781728797; x=1782333597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIEF4Fa/gkBkYZbpYeSi+UCdjsb8psDBijGh79YSssk=;
        b=B+ddaRA+UHmCrbbvYCu5qAjf0AogemQQ0z2FqCe9UU6nqOTzon7Pm1ws3Vg8RUCIM1
         5HsMPD2b+p6UDnni2u3TvMlPODXPuoRtwXhg8Ub6ez6nvzIusssnMXovI82YfTpTZk5R
         JbB6yVFCgMfmTCKzNb/G3/da5vlJow3s24yOKwvE6gOgw7M5Vncu7HH2dT/Ffos+lx+d
         JJCVGuyrFQmFJZyra661Rk+a51Rv7waM1M1GrUlunGl8mmZ5ZXV1tuL+QUoRw77+x8Qe
         DMVbVzwLcGSB2VSBd4ZoypoexxjeIZtnfa5glyjS+Z2bbLlnGRQXD6YJPaG2wyggtOGC
         ORdA==
X-Forwarded-Encrypted: i=1; AFNElJ/y0jqCqa+hfpjupTSG3lP0ILCco9oGGaKtZDH/cCnuq56nD1+KREOCPu7WsIP3fFnVpfJgiglk02Q3mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlXY/jJmNVVhm9bMiYbfsOU4hEcZolrSbphLxueKec+hWX1p2
	zuamsbhZaX3PneJZS9tPE9MEwi21SkGjsVmv5junqew01uqoPf1J9X0H
X-Gm-Gg: AfdE7clAb6NhI2OjeC+kez0BDpVzoYaExtU053XXYeyJC57alHCbKJLEtcGTRT4iXou
	wfcsSGaLZIgnWK1lzL74pKTeVitIMn1jXrhj5+Trr3ec6C9jvEgXZLnd4u9oLumJGTb7Lv0irQ3
	Rr24LeYnZ1WCNQP9jpzGQC+A9GS7YxXHRBTXqo0L+YogJ3ySnxWFT891GMoHLry401AzUIS9qIA
	lxUaZkwmHhF0C1+MDBn/equc7tF0L2odF40SKKKYQsrzDcv1DyRj41+IDMufhmirIkkXGeWz1gh
	AQHRIbAEcvVnmRptc0bN3yUo4rfsg9n2veIY59kgWICMKg2FIhOpj2PT+UPzo37yLvp7THIdNw/
	ew4W7rdZY9y3xp5H4Oo3IFPTsm5YLrbRuoRLaI/8UgZg93tn0xFOT7luvLTrskIPzia7agTauWt
	v8mjyOtKqjGidoXvqm1irdpR+TX7R+dxqVP4mQ01LDRt4ZEbf4hkB4yvkYDMqsHQ8uwNRNBMuMK
	zIHdPii5/po0Aaq
X-Received: by 2002:a05:690c:4d48:b0:7ff:f42:4f99 with SMTP id 00721157ae682-7ffc783cd6fmr6177127b3.40.1781728797350;
        Wed, 17 Jun 2026 13:39:57 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7fcd00da747sm55671227b3.7.2026.06.17.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 13:39:56 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: fvdpol@gmail.com,
	ramiserifpersia@gmail.com,
	rmxpzlb@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
Date: Wed, 17 Jun 2026 16:39:36 -0400
Message-ID: <20260617203937.1273852-1-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi, Jaroslav, and the ALSA community,

After being away from active ALSA development for some 25 years or so, I am
happy to submit this patch to introduce a dedicated driver supporting the
Jockey 3 series of DJ Controllers made by Reloop (specifically covering the
Master Edition and the Remix variants).

I initially evaluated the feasibility of integrating the required logic to
handle the non-standard proprietary Ploytec framing protocol into the standard
USB-audio driver via quirks. However, doing so would require introducing
numerous hardware-specific exceptions throughout the core layout, adding
significant complexity. A clean, isolated driver subdirectory provides much
better long-term maintainability without cluttering the existing class-compliant
architecture.

Following up on the feedback received from the v1 submission last week, I have
revised the architecture to address locking consistency, lifecycle safety, and
stream verification flags highlighted during review.

Changes v1 -> v2:
 - Migrated URB lifecycle management to use standard usb_anchors.
 - Revised and hardened URB buffer memory allocation constraints.
 - Addressed locking consistency, scoping issues, and static analysis warnings
   raised by Takashi and the Sashiko automated review.
 - Implemented dynamic PCM rate constraints when a stream is active.
 - Implemented full MIDI Running Status support for the control surface.
 - Refactored several large code blocks to improve overall readability.
 - Added clarifications on hardware specific quirks and codec format.
 - Optimized struct jockey3_chip layout for padding and locality.

I have successfully validated and stress-tested this driver across three
distinct hardware architectures to ensure robustness regarding DMA, timing,
and memory alignment:
 - x86_64 (Standard PC desktop environment)
 - armhf (32-bit on a Raspberry Pi 1B -- functional, though tight at 96 kHz)
 - arm64 (64-bit modern SoC environment on a Raspberry Pi 4)

I look forward to your review and feedback, and I am more than happy to
make further architectural adjustments as required.

Best regards,
Frank van de Pol

Frank van de Pol (1):
  ALSA: usb: Add support for Reloop Jockey 3 DJ controllers

 MAINTAINERS                       |    7 +
 sound/usb/Kconfig                 |    1 +
 sound/usb/Makefile                |    1 +
 sound/usb/jockey3/Kconfig         |   19 +
 sound/usb/jockey3/Makefile        |    3 +
 sound/usb/jockey3/jockey3.c       | 1025 +++++++++++++++++++++++++++++
 sound/usb/jockey3/ploytec_proto.c |  240 +++++++
 sound/usb/jockey3/ploytec_proto.h |   53 ++
 8 files changed, 1349 insertions(+)
 create mode 100644 sound/usb/jockey3/Kconfig
 create mode 100644 sound/usb/jockey3/Makefile
 create mode 100644 sound/usb/jockey3/jockey3.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.h

-- 
2.47.3

