Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7826296BCB
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751131; cv=none; b=SwlxLBM4V7g+htawOLnOweOPva1Zt/XY0d5xhaU9CIPCKtxh1Vbg6EOaQpLktFXrqv+jRz5BtoYMl61SHEw/WNSDotq6RRYVTaqvudEIZu2sw2lI2GRnLUhHZpUzG5GuesOo23DCQOhkO5gy2RDJZId3runTjqppTzcyqA50LDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751131; c=relaxed/simple;
	bh=I/EkW5rU5GRe7RQ6GLAJkxj4pOhlLop3c5dxiLpmdTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtWY+MeD5mysXGezooEyBtINsqWGe/34IZBgZaaP26qexw+3YSEq47wRg7iqbiKLiSpFzDVkzVZFMXMafSU5uJHlm2/cK6Re1iK4sYur5rQP1N/BlkLn0w2WI3IbpCcXHQbFSzSfj3uGbhQhUza5fxNCCFygnfogksbiHn1agnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwaRosbZ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwaRosbZ"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8dc544dda2fso4041446d6.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781751128; x=1782355928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pns95xyZYc/RzAvwMu3MvI7erqJsU+5jcWUfTmCGr/4=;
        b=jwaRosbZ5i/DDEbjAJT7cPpnJ9XRLzUWi/015tqfaidUTeK6VV9VzI23OIdNDRsg5m
         8peRfBdJvUV2f76VMn3d1FnojEn7LzEbPj0FZhP3MZ4omhuCMe57KQFeYrpswGsdn/ED
         uxvIDFJg6KaQjLvkU38MQjEawbXFpA3h44efazB8Mgoy004AzbJuexzbTk9gAgFPCxq/
         w1HbqKp04dwoBhtX0DQJ396Z0I8c/p5trmQZJaC2tlME4tIpbx9i3Lb1OMJ7iCW5pUZ3
         ygcJAjSIkPzc/lbdcqMxHOjVl4Ohbji5qY8wTaY5FELv9e+SkwJG2fyhiztPvJqKsDOC
         Dr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781751128; x=1782355928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pns95xyZYc/RzAvwMu3MvI7erqJsU+5jcWUfTmCGr/4=;
        b=SqkyER11JI1Y9bkUsnNnNPKBvF+yJRsqxCYz+j8ussAIlBCBNcQLQNL9Va4/rQCslI
         PMbR4bSHFU2D7Y/JvbV7L0EPEtIB657e4N2xRIpm6fN017GHj75/6bqq1GafjT183jxf
         snMg0xWfUImfYiQJlYEz7fGP1YOLFnNtpeXUq+Hje41xdnbQC64pGL1odffIHYiCzyHR
         OcCyeUmLlTmcmyjc5WwLdGFaxGeOEHgG1CWMcZWmWL9WEnXnQXJUpBc1hamMv6ogvnZg
         PFs0LIEHFqhzKBnSSL98ZIcQChdyShJeeqj40XtU3Td8WMJoYV1hRJaezKuuVJJtRuvi
         28/A==
X-Forwarded-Encrypted: i=1; AFNElJ9qP+V0D29c5eTras5+sIespu0h7Vb4KbWso8fwoL7Iw/2z15cU7bZ5v4sq0hwI/MkqEmcMTdHAK7p1zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTqa+YD70prbffLZxyGYYXLtAsbp1pV7vRroGeWhtcpZrBFes
	nSd4D24+zaYWRRfTnu3qAVACvyEb5+YjiM+53q5a1j3pC+qaBfdSZiBM
X-Gm-Gg: AfdE7clyk48XhmLUWvwvMOM7Zc3yQnW7Y1KWjrduIZIzOdNXy+asNff74Av1CP3HJLj
	Exe38pP//gCbshpnookved24zpJsca2LRVf6FyXrJ2Zvz45bHjcSQDD/M54ElTcSJncLlRR+Iib
	H9RwlYf2u9kLNI6n8IXFPKLqtsIrNrD4cMkh8ZIy+u4ZpdSO+hevP8wUbCB24DXXlhgPH40Q7Pd
	LB9uj+LcdKXkvQmiNa+7iL/sEev9bojtN3Ed7Ns0Ro/M22yubEyk9iULSnLNR0+y+/tVyrZgmkn
	ENbsJ9CPraMsBcgx+g/oPKue+HnD50Xcy71oUxjKHnxhgZQY3O9k8+iZON4ZVQ4H1vYz9ypEp68
	MpC2tU3L6TLUi8LiBz1MxE4y+3C5miWf24HP9HIXP9FcENHDGf8qP7I/OkDC1WCgu/vIGmaTV8P
	zM1CBhv0V6ZaxGO557RhkWLlKy8rggiTYgFvRVPPKCpiQbpcHSGdXdjcMIUA0+SDejX20C/bR3i
	QLylWHxllEg8D3rI19bsQcKqgAXno6i
X-Received: by 2002:a05:6214:1c4e:b0:8cc:defa:eae0 with SMTP id 6a1803df08f44-8dd56ae869fmr4271676d6.30.1781751128565;
        Wed, 17 Jun 2026 19:52:08 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8dc7f9b4b3fsm25333386d6.31.2026.06.17.19.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:52:07 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: usb-audio: qcom: fix QMI stream-request handling
Date: Wed, 17 Jun 2026 22:51:24 -0400
Message-ID: <20260618025126.1862954-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Two fixes in handle_uaudio_stream_req(), the QMI handler for the Qualcomm
USB audio offload stream enable/disable requests (reachable from
unprivileged local userspace over AF_QIPCRTR):

Patch 1: the disable path dereferences uadev[card].info[info_idx] without
the info_idx >= 0 guard the enable path and the cleanup label have.
info_idx is -EINVAL on a non-match and .info is allocated only on enable,
so this is not only a NULL deref: when .info is allocated (card enabled
once) and the disable names a non-matching interface, &info[-EINVAL]
points before the allocation and the pipe fields are an out-of-bounds slab
read plus a conditional out-of-bounds 4-byte zero-write. A never-enabled
card instead faults on a wild pointer (oops).

Patch 2: on enable, subs->opened is set before the service_interval is
validated; an invalid interval jumps out without clearing it, wedging the
substream at -EBUSY until disable/disconnect.

Impact: on an affected Qualcomm platform, a local unprivileged process that
can drive the QMI disable path for a card with no active interface would
oops the kernel (patch 1); patch 2 leaves a substream wedged at -EBUSY.
See the
confidence note below: this is a static finding, not yet reproduced.

Confidence and testing: this series is from static analysis of current
mainline; I have NOT reproduced it. CONFIG_SND_USB_AUDIO_QMI builds only on
Qualcomm SoCs with an audio DSP (no x86 build and no Qualcomm hardware
here), so there is no splat to show. What I did verify by reading current
torvalds/master (the offload driver was mainlined in 6.16):

 * Patch 1: in handle_uaudio_stream_req() the enable branch checks
   "info_idx < 0" before use and the response: cleanup label checks
   "info_idx >= 0", but the disable branch between them dereferences
   uadev[pcm_card_num].info[info_idx] with no such check. info_idx is the
   negative return of info_idx_from_ifnum() when no interface matches, and
   .info is a pointer allocated only on enable, so for a
   connected-but-never-enabled card the disable branch forms and then
   dereferences a wild pointer.

 * Patch 2: subs->opened is set in the enable branch before the
   service_interval validation; that validation can "goto response" without
   clearing it, and the response label only clears opened on the disable
   side, so the substream stays wedged.

What I am NOT certain of, and would ask you to confirm on a Qualcomm build:
whether the QMI flow actually lets a disable request reach the disable
branch with info_idx < 0 (a disable for a card with no matching interface).
If the userspace client cannot produce that ordering, patch 1 is hardening
rather than a live oops; patch 2 stands either way. Both patches only add
guards that already exist elsewhere in the same function, so they are low
risk to apply. Please also confirm the Fixes: tag against your tree.

Michael Bommarito (2):
  ALSA: usb-audio: qcom: reject stream disable with no active interface
  ALSA: usb-audio: qcom: clear opened when stream enable fails

 sound/usb/qcom/qc_audio_offload.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.53.0

