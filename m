Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CE231830
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782090706; cv=none; b=cu7T6fVi3egjlN9uUu+yifZ0b7h/vNM+OrAtgIkvkqtcpE35Y6Pm8f8HizfMjVhnjOfaaIPEwvMhrtZZrx8ye3m28KBPYp9shZvYm3J20KhiK5Q+HSNgTheEJpyhwPPCDITP/pHvzITXSCSEQi72SNBgvksBO74bjU+NMQSDgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782090706; c=relaxed/simple;
	bh=bhYa3oR1eQtfKri0GB4VMSTZ6Wd5Xx1VCPx3GKfb/f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=quWgntP79VSwi5g7j4s5qQaIYPFo0doCqYUASADPqyPZtsrS8f+uf/OIuigC6NQNQiNvVkYb5zVLtMk9IcbTA3zLVxgltmvirvisiA1jgUi5RYvNqHxhBTIlq+FBBoNn428nOaXz0G4ErkLpaKbyePEKFzyqgD+eNv46u7QvdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSWTAPdr; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSWTAPdr"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59ebcbfb2b0so1245820e0c.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782090704; x=1782695504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9F8+t8tVMzZNVqkJ15N14A2UHZfVIaONdOq77ZMmdPk=;
        b=FSWTAPdrCjqCMPf1fKun+xTZXpX9ays8yKXWKFPnYwGbel9huHmmAw5ADE+8Tk7rgG
         sB/STx8t8ke89eQDk5rwlEgcSvXBXaF8AEAVSeUDOZCiQg3qqvmoSk0DL+dviXQv8fld
         XTRHfDNxmNC8GIueDlpzri71R3Zw4frRjULZkxDf6G4R7YK3osGptQIHVVKejwqLpjnj
         JwXhbTVCh5/QdF0paWjRdDE8hoJlv1wiit0PnKFf/BpJyJEJc0tV1ouDpw2RyCiqqQNR
         G2xwjBefjHxruo2tMauzLBto8POB4ZWCalP2VTR2+MVBlEZWiWLmEWt4h+b06M6Hc7uD
         uf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782090704; x=1782695504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F8+t8tVMzZNVqkJ15N14A2UHZfVIaONdOq77ZMmdPk=;
        b=MuimW6W+pV4R7REuyF55sjqt+IqqVSGq0nLOzNmnZlK1itR3h5BLIO3y4P9uG7FPRd
         zFGiLs3aFDydaS+ME3UU1d5w6UzF9HZ4LrYa2ZB8eQVcv29eitjO0D+CqxpSr8y7Ispd
         ms43HvtKZhdQWv4QYgmtjiQ9wZBUzwi+qp1N0F0NiJHKCsl0a5roIT8VCDkJXGcawNna
         eLimyfu2szYHgBjd4NHoNptgZ3Cj9qrqPLB023xKqJXnzUwROMwOHwJlnt+pp4v5DSJt
         CPdw8kFYqZtp/jRk0KuzO1+Cdwc4JKR9vqg+Tqr5FOW8gHOoqLB1gKLWrmJl8scFh8Pr
         4rkA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qqm5sBt7WLnrIcywtLpP3y4SKio3CReXgdcC9fCkcezVc46mltScAItQI2s2SnJxpGpjQTtLpoLNQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRSfql82+mlHVri/Y+AA8T68gcfYnQroktz2LJ309pCvey8an
	PQhLiFqunJjXge49vCIQmN16ZlDodS+5GX5Q32vgPVwNSbNofLRB2pstr2BWefj7S0I=
X-Gm-Gg: AfdE7cnFrmylechFASytCCVFJpShRLMQ5dSmAYSBtUcjE5B15Rli/iOlBrYdyeuHa98
	XSiGvAEl8faxDRRMpDFo8EsTOAQTtZ0cu58bvdvI/qyTo1CCShdxtDAmYk2iejtxbCg2z3PDynL
	+g9gkYN8Ec+fUBnnJiDmAOl1g+ZYkQbApGYlAlo3HPdDHdUcNh8X1ktVpZbC0yF1z2CDliyb5Cl
	7CgKyPVF15iD6p1PP2BxTcFo1N1vgNyTipw2fV6jxs0o1P/3LhURgvPwIaGIkwcBpkoJgV/V5Pm
	C56vdRWl5YANfxoCYnsrbVfIuKvcIejU3WVwgpjwhlqKSHExtXo2vEnlVEapnf4FGO4b4CsSaJi
	oAfeeFsecBJqaFkrKjbPqUG1Q5JzhRJiYcyVKuuYYLXzDp/mnc3Bo3zqPZk59wdyXBL4soXrR0e
	7cQcv2DTb3Acg7+iUbggF5s9KUkl4SeHL2V8qlaWS6muJ8dqljBgCGdC6Ac9b9NnZggB/mJWmoD
	gIfkIr0NTEXxuKj
X-Received: by 2002:a05:6122:d22:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5bbebb8debcmr5880380e0c.7.1782090704010;
        Sun, 21 Jun 2026 18:11:44 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba48c1bsm5595977e0c.12.2026.06.21.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:11:43 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: fvdpol@gmail.com,
	ramiserifpersia@gmail.com,
	rmxpzlb@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
Date: Sun, 21 Jun 2026 21:11:29 -0400
Message-ID: <20260622011131.1748298-1-fvdpol@gmail.com>
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

Following up on the feedback received from the v1 and v2 submissions of my
driver, I have made several updates to the code to improve locking consistency,
lifecycle safety, and the general readability and maintainability of the code.

Changes v1 -> v2:
 - Migrated URB lifecycle management to use standard usb_anchors.
 - Revised and hardened URB buffer memory allocation constraints.
 - Addressed locking consistency, scoping issues, and static analysis warnings
   raised by Takashi and the Sashiko automated review.
 - Implemented dynamic PCM rate constraints when a stream is active.
 - Implemented full MIDI Running Status support for the control surface.
 - Refactored several large code blocks to improve overall readability.
 - Added clarifications on hardware-specific quirks and codec format.
 - Optimized struct jockey3_chip layout for padding and locality.

Changes v2 -> v3:
 - Removed redundant dependencies and defaults from Kconfig.
 - Fixed an AB-BA deadlock condition highlighted by Sashiko review.
 - Corrected an URB resubmission race condition.
 - Implemented explicit USB endpoint validation during initialization.
 - Added Sample Rate verification and post-reset recovery handling.
 - Abstracted disconnect and stopping status checks out into helper functions.
 - Moved substream registration safely under the chip spinlock.
 - Implemented native suspend/resume power management triggers and callbacks.
 - Refactored jockey3_probe() and jockey3_pcm_trigger() for cleaner state tracking.
 - Further refined the internal MIDI Running Status state parser logic.

I have successfully validated and stress-tested this driver across three
distinct hardware architectures to ensure robustness regarding DMA, timing,
and memory alignment:

 - x86_64 (Standard PC desktop environment)
 - armhf (32-bit on a Raspberry Pi 1B -- functional, though tight at 96 kHz)
 - arm64 (64-bit modern SoC environment on a Raspberry Pi 4)

I look forward to your review and feedback, and I am more than happy to
make further architectural adjustments as required.

Best regards,
Frank

Frank van de Pol (1):
  ALSA: usb: Add support for Reloop Jockey 3 DJ controllers

 MAINTAINERS                       |    7 +
 sound/usb/Kconfig                 |    1 +
 sound/usb/Makefile                |    1 +
 sound/usb/jockey3/Kconfig         |   17 +
 sound/usb/jockey3/Makefile        |    3 +
 sound/usb/jockey3/jockey3.c       | 1188 +++++++++++++++++++++++++++++
 sound/usb/jockey3/ploytec_proto.c |  330 ++++++++
 sound/usb/jockey3/ploytec_proto.h |   66 ++
 8 files changed, 1613 insertions(+)
 create mode 100644 sound/usb/jockey3/Kconfig
 create mode 100644 sound/usb/jockey3/Makefile
 create mode 100644 sound/usb/jockey3/jockey3.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.h

-- 
2.47.3

