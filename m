Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB91C3C1F
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630687; cv=none; b=LICheQuZkMTvfBWE+L8CRNMDff9ughS6F6WikLmGGIHLmvbHB+KNlLwU0+wIVhszl8FBf/gylPvYE2Wg/ze1XXDGT8Z13hKZWi+skg4l97plg5wK+5BIFYBoMZuhvFm9qAMRJd/fc6YtL61ZdMKFzOIl+FZspcr3Wax2jLV/W0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630687; c=relaxed/simple;
	bh=fOysJetftFuDAfilt4YkPpmsqDf72fBKOBho/z6x7Ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=agcMM0ZMQT5Ovouth9mGAFnp77ZRSBWoFWPRQqBCiJUfqMRwXfr7yIuHHtNjwYPvNMhaqU/RYxXxw2ogdAQkfhbvlwCghijgtFU7fEGSC5wMae2Y1oKXaz8ZgRKM1vq4gYFi7WuJN/m6ebz+1rvHWzJTQ/U/eGr4Nd7qQMHzDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpy3apJh; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpy3apJh"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2e622a9da9cso739980eec.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776630686; x=1777235486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KM4l3haLMhwkG2gE+Q3bWokNzUlY9nmC6/W5mIqwYTY=;
        b=gpy3apJhW2NlLLJgqIPGUA0QQfKFcwgciVBsLQGtlH1xErD3HcJ/qU9xTuxmTr3Y55
         95rPB4Atc37uQp82y02zVUzIwtcEfsdhCnY1wTgwxoyVMudK8QFjp/QucN6TNN0fSJJb
         La6jTjvVzwpu795H1cWQIvunmoXz4X4U95xFZ9KhM1lmZ+HNnvu1DQKIYvF+2xVhp84p
         7QeYLUB24Ity1GCyPMxi34GxEr7f+2n0KuPVldDotTB/14iEPUvg2BWS+O7qTQIXtEww
         mZcerKv2Kd4ccRT6cFQo9PYBStm9c2ceME/nHRrQ3aeEZRhyEjksueEE3AbSY3MhhHGn
         liCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630686; x=1777235486;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM4l3haLMhwkG2gE+Q3bWokNzUlY9nmC6/W5mIqwYTY=;
        b=KTS/FRnkmISYe9/gxgr26UJZfgGymOithIe0BOWxw4teCCMKKHTe7RN6bK2hIRNvDo
         mEWes19GpdwPEPORvq3FpdvE7bLHGtuORNHBiKwjWcwXxRpgIFZXTG8N81o8/gGwRUzf
         9jZLcdOYRvIXhc1l3PIvrd/ocVdORB4nRJhdW8gf6hcxHMvrucFteAuCwmAuhs9YBSes
         H0ub4QcNmFOhPF+VsW39VqCWv7HngVBYOrYdwsP9DBHV6BFt+EPzjzGlEdmrVoNyjVWK
         SzBJUS0GQMqG3wvHiUMYCxRVMX2AIqHjsE1N0nRKQ9ThaNiuACvaq17i1WC2xcneMdve
         AUBQ==
X-Gm-Message-State: AOJu0YwNJCNvRkEpYS50U9ZDaCXxFcK64KPZ6mXqsghvfEV+pNOkVegl
	jZgnMem8hwyTWxXFkcynBXKOwO6Gs1KsjncLGuOouFuYmKNUldzngTMa
X-Gm-Gg: AeBDies7kpe986wzFkNG7bxkXGXKuZGnR5EGmoebYbECV8i7k4jfxyhLce4aqUFEhdI
	9nB9+G9scT8nQkdTGyFkQsbfuVMjiqon+T2Z5C3U9leh07AYqb0cA8HxvefWnfOGD8jMcdZvz8z
	1pgXvt8HbI87anRw4hoQRY8FYhrYAIWxIaLQg2k5ZxZ84++b+Vg/XqtpsI6oAqqV+z0aILCf8sd
	lwErpY9zCg8lU7eUSm0akRkZh/vkDsrGNFWtvr1Juy0xrS3MGC1MCYtcJW0AblRTbI4dqnpUzBH
	38OY6+FPyIEkt19JG5YOdMWZygqgDOSdahxYKDnDPLtb+jiXUOtr+G65qNDt1T/SUILXvf0vhCS
	HItrGccNyYbcOmcQNKXfXlCdMair2T/RbgHlSIOyykPayQA/I+3EgOv0IY6B7VwQ7GuvqQRkfqN
	nDhg0VScHYSD7Cg3EfO7SVY9g3DcN5aObqoNx8Qd8aRnQNKMpJ036+2Ursly/8b0Fk2dVZivniW
	mddQOcUMS14WPw=
X-Received: by 2002:a05:7300:f193:b0:2da:1874:f39c with SMTP id 5a478bee46e88-2e4657728eamr5493770eec.12.1776630685523;
        Sun, 19 Apr 2026 13:31:25 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm11419096eec.13.2026.04.19.13.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:31:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/4] usb-audio: fix mixer write failure handling
Date: Sun, 19 Apr 2026 17:30:28 -0300
Message-Id: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxA0atUnmspjSBSuQrqkBjTmqGJ7BSQq
 t6dAOMb/t/BWIUNLt0Oyk8xyWvD0HdAS1xnRrk1g3c+uNMQcLOEL5XKyKpZsWgucY61degdhZE
 9nSkmaIeifJf3736d/rYtPZjqdwnH8QF5hrAafwAAAA==
X-Change-ID: 20260416-usb-write-error-propagation-20c69e2c5cab
To: Takashi Iwai <tiwai@suse.com>, 
 Chris J Arges <chris.j.arges@canonical.com>, 
 Detlef Urban <onkel@paraair.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=fOysJetftFuDAfilt4YkPpmsqDf72fBKOBho/z6x7Ns=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlPraeYuLdNjrNad5+jhvPkxoMx1w55LnbQt7u1Nf6LR
 zDn9cT7HaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAnCTuRn+55i3LcyacVLB6yPr
 ln+nSuL45Bms3WutmndncvaUOm8LZ/hf+27/t4XWtVtYuT5edn6atTP+xkLZKUZ3JwV7fks42PG
 fDQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

This series fixes usb-audio mixer put() paths that currently report
success even when the underlying device write fails.

The issue exists in the generic mixer core callbacks, the Scarlett
Gen1 enum path, and several Tascam US-16x08 put() callbacks.

The US-16x08 EQ and compressor callbacks have an additional bug: they
update their software shadow state before sending the USB write, so a
failed transfer can leave later get() results out of sync with the
hardware state.

The series is split into four patches:
- propagate write failures in the generic mixer core callbacks
- fix the Scarlett Gen1 enum callback
- propagate write failures in the simple US-16x08 put() callbacks
- commit the US-16x08 EQ and compressor shadow state only after a
successful write

Successful writes are unchanged. Failed writes are now reported
correctly, and the US-16x08 shadow state remains coherent with the
hardware after write errors.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (4):
      ALSA: usb-audio: Propagate write errors in generic mixer put callbacks
      ALSA: usb-audio: Propagate errors in scarlett_ctl_enum_put()
      ALSA: usb-audio: Propagate US-16x08 write errors in route/mix EQ-switch put callbacks
      ALSA: usb-audio: Update US-16x08 EQ/comp shadow state after successful writes

 sound/usb/mixer.c          |  17 ++++--
 sound/usb/mixer_scarlett.c |   4 +-
 sound/usb/mixer_us16x08.c  | 127 +++++++++++++++++++++++++++------------------
 3 files changed, 92 insertions(+), 56 deletions(-)
---
base-commit: 99c71f13f9841f8c67fa7595bf0834d3045f5d24
change-id: 20260416-usb-write-error-propagation-20c69e2c5cab

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

