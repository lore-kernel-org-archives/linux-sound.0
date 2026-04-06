Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51D78F4A
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 03:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445616; cv=none; b=Bl8/vrR0OacxANFSgbxne0dBmiqsHdGzLHhx9/o+zP+sTc/N/JLjl9damenYZRwsmrcISMBQfFvf7K2Pc7JNVcJnqd7TMcAoCPujS6kHvQDk1qCsDqbcgknbm60nyKlGK1STn9S/w4gPUxWfumKWUTBJ4oBcNUCixzkMIv6EoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445616; c=relaxed/simple;
	bh=RNngBn+u1v4wi7HVnSs3dMvSdbjVkBEghGGSTVw7Tv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dr6W7orf34jWEW4xVdqGjmTR7MPGlzPMgGYyNLQbqE1kBS0TlC5Ua+Xo092arGj7cpww5jO51VRz/mAJUDxVX1JnWVd4B3/COnWqHejTDAprN+Y4L5EOxP0UeWOWcwhPf+cGNnLW2XVKx8GEsXMrnT8WQjsM2Q/el2pP9XxMlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S597Evk+; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S597Evk+"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-953a44f8404so805384241.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 20:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775445614; x=1776050414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6psNeer3BHofY3GlOoHu2Ri+C83zsZWWLwN4vY50dg=;
        b=S597Evk+YYu1RKJscWhwuowluZbWe9QwSIPK5V44kwi3gRrxQo3nWSWOGLPbzdaVfu
         iozPWURkrW7BhXLwcvWPLFJIUCtmEH/Ngp1XKAZkhdtE06wN7nldftPQ9VsAM5w0//tK
         H2Tqk5YtuICELA+PjvvzrEMheo4SsV8v8sNuYhj90OmcXV/bR9KLlVt024yuvqWuqSsk
         2nPEI4raqyS3tQ2ku8OWOXEPLKU9EnHmLTo95VyxOlb09/hq9wFAKkEZwLnJD3jg/Dif
         EYTVW0URuOoY7uLgcNFG/2z9eDffJ3xeml6skx2TZ3pguyixBbbnNIFVQ0arvRnSSBcj
         y2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775445614; x=1776050414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6psNeer3BHofY3GlOoHu2Ri+C83zsZWWLwN4vY50dg=;
        b=JDlUwC0Yn0QJzNviroMHDmEihXiUXMomKaXhaRbzkcGith/aD1mXOT6n0qT4FeWfHx
         GColIKJN24WSq+vw4DNoCPAFHLwRUbdxc53X4EH5cvBwv02Bi0pddqKb+OJ/1JWmu7pb
         Halc0YU/EHjPesobNdDPAgLSJzpbMLbDtcfuisM8SIVbnifwvNL45S2wz1YLuNjR/LEw
         E2JNXj6BHY796neBmruIC75wJabdxF6qCCLBRCYljU4GQQoH5d2TdwuSWzKCMHyO9ICY
         G0kTBZ+jf9u8YUxCAa5McXy3NCwjcrZa2kDJfnQefU0lQ8tRPbet4mkvNLH2E6le9egJ
         UsjA==
X-Gm-Message-State: AOJu0YzXvWnv/ymjHz4Ep0ItrPvf8NgY6/c2p0Ton4Vq353MapXGNXvl
	i0xgV/viMyKA1hsJ7O1OsFcZ2QRwNI8AI8nV4pVCHejYvjzEOVBd4mNv
X-Gm-Gg: AeBDieuj58xVgi1t438SUUOnBY/bgQU2/fql5/lKNGdfaIbbq0goz/r8zFFTsu1rvUk
	QT1YukV5PiS4V2Xb53w0AaWYVVoCV865lkZZWhWheOiqMMBh2spfnQI3R03rYrjC0jsCBdCe7mE
	CHFBfCDAKaSdkGC7mn6K71jV6fRl4tC2JAXQgGmZiipG+5A7rjjHhiH10N5M2/T+KFruH60zxCz
	S/0FjcKyqaU9cPkb0pH8LJKZilkiI5CUibCPNOH6UIwxPyruGn8SWaYNqW4gTAvbd7fLqsNIFrI
	OP2Y2/ePJYZFWIWdDB3WKjrfCi4looh6GXljv6QQyUA9TfSfPkLKs7qwlvIAUvM//epQ/ec2E47
	WQ1GrIUm9i6iQt68yDsytJp1SyOtSvvnEN/2QZFz8s9SJ8sTnylgLmbP3LkQZvTa34jNB8B/MWw
	toHlCl5+mTfbyHuRnD6oi2DqxJHu0Zxkjh4sWsceUhJhGCmab+i0hQWfHZiGRaIERDqshdmQSSZ
	TpZ
X-Received: by 2002:a67:e718:0:b0:605:2df4:c5f7 with SMTP id ada2fe7eead31-605a4ed577emr3797243137.11.1775445613734;
        Sun, 05 Apr 2026 20:20:13 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm9162146137.5.2026.04.05.20.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:20:13 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/4] ALSA: isa/gus: add ISA PM support for GUS Classic, GUS
 Extreme and GUS MAX
Date: Mon, 06 Apr 2026 00:20:02 -0300
Message-Id: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNT3SQT3cSc4kTd9NJi3UwgXZCra2ySZmJkYWYBJFKVgBoLilLTMiv
 AhkbHQvjFpUlZqcklIJOUamsBllQ+bHYAAAA=
X-Change-ID: 20260405-b4-alsa-gus-isa-pm-34f42868428e
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2920;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=RNngBn+u1v4wi7HVnSs3dMvSdbjVkBEghGGSTVw7Tv8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmX1bIVypcxacb9tPl23W1++NNPu5iddT4fuL16qqj0u
 ek7fpTrdZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEZNYwMvzOtJ2t8Eh06xd2
 QW7+t/c3nmUpsT35r25beUHVk+gZO6cx/OE+6NkQd7Hwu8ar6mf+87LVZbRShPaJHJsYWMr9+lq
 /GhcA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

gusclassic, gusextreme and gusmax still leave their ISA PM callbacks
disabled, so a suspend/resume cycle does not restore usable GF1 operation
on these cards.

A simple wrapper around the existing GF1 start/stop paths is not enough.
Those helpers are probe and shutdown paths: they reset software handlers
and tear down runtime state such as the DRAM allocator, timer state, DMA
queues, PCM state and UART setup. Resume instead needs a narrower recovery
path that rebuilds the GF1 hardware state without rerunning probe-only
detection or discarding the bookkeeping kept by the card instance.

gusextreme and gusmax also need board-specific resume glue around that
shared GF1 recovery path. GUS Extreme has to restore the ES1688-side GF1
routing before the GF1 is touched again. GUS MAX has to rewrite the MAX
control register and restore the attached WSS codec state before the full
card is brought back.

This series does that in four steps:

- add shared GF1 suspend/resume helpers that quiesce PCM, DMA and UART
  activity and restart the GF1 hardware without rerunning memory detection
  or allocator initialization
- wire gusclassic up to the shared helpers
- wire gusextreme up as well, restoring the ES1688-side GF1 routing
  before the shared resume path runs
- wire gusmax up too, restoring the MAX control register and the WSS codec
  state around the shared GF1 resume path

The scope is limited to restoring post-resume usability for these ISA
cards. It does not attempt transparent continuation of active GF1 PCM or
synth state across suspend, and userspace may still need to reprepare
streams or reload onboard sample data after resume. Open rawmidi
substreams are restored only to a usable post-resume state.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (4):
      ALSA: gus: add shared GF1 suspend and resume helpers
      ALSA: gusclassic: add ISA suspend and resume callbacks
      ALSA: gusextreme: add ISA suspend and resume callbacks
      ALSA: gusmax: add ISA suspend and resume callbacks

 include/sound/gus.h        |  8 ++++++
 sound/isa/gus/gus_dma.c    | 33 ++++++++++++++++++++++++
 sound/isa/gus/gus_main.c   | 36 +++++++++++++++++++++++++++
 sound/isa/gus/gus_pcm.c    |  7 +++---
 sound/isa/gus/gus_reset.c  | 62 ++++++++++++++++++++++++++++++++++++++--------
 sound/isa/gus/gus_timer.c  | 14 +++++++++++
 sound/isa/gus/gus_uart.c   | 47 +++++++++++++++++++++++++++++++++++
 sound/isa/gus/gusclassic.c | 21 +++++++++++++++-
 sound/isa/gus/gusextreme.c | 57 +++++++++++++++++++++++++++++++++++-------
 sound/isa/gus/gusmax.c     | 28 ++++++++++++++++++++-
 10 files changed, 289 insertions(+), 24 deletions(-)
---
base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
change-id: 20260405-b4-alsa-gus-isa-pm-34f42868428e

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

