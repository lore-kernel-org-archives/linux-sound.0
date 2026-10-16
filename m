Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE42F0C48
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135899; cv=none; b=kQQomrkb84000/RlDxfaqhtNhpsY8Vdh1t5RarYoAIy9ZZjTAb9mA83CRECzwLIWw1tq7VrboZwWrc+wZLZyI6lkr9nkN0qhsqP4M4jzRSCDnZAZSdp9mcAlbjBa+eFF8sb/t8C3lvC+FI2jsRT+qspHDaxs/t5n2yRTPskxynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135899; c=relaxed/simple;
	bh=xd0kHW2wKv1bTxBiEr51rhIZr9/PO+bTSCtf7rMq+AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lb4bqHa2ttDnrO9N6T/1WTIHoFyc+sxEy4LFYdqlATuE27W440W0yLKdA8zDk0CyNWPqiCc6sR6xE7oGardqOgEICL7bQFuyQrqjEz1ZFfK65Af6p/Dc2BrNIbsUWzH1y45EDcroFKZuKV9YmokeHqALhWgUo4iPVkcD8GmTMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoR7vAj3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoR7vAj3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c350db5a761so36850766b.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135896; x=1792740696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3uoaulQf4S54/KJl+1X3n/7IeNT8lvIHaLneLyKQ6E=;
        b=PoR7vAj3jIsQVJYWRo/tziDimFRhL79XValGb7lEY8oDoVzuy5K8piwiMwUgpnDBhC
         0y1xlxwZ7geso8CA76xIFQewMmOR1FCl0vvrhyr4BcyInmZfimWHcWunygiPtWYKDSMH
         cJpPapDDz1P25NY1RPk9LO6Q0PLern2J3LxW2eUfxnTLYuL1gO6IxHsk/Q3hdG1ojriX
         PKqDWw4dM/sv+Idn8UBCLUSiiK5mIwcfabnqY+enKBJ1xCSzaLo6DRoLL0A9zig6atnK
         yT3M2EW/tZUEk/wx5BAOf6SJWtdwYK3wBajkVlokwjubzmRYms/RiokUoXsbjlzKRaAZ
         Lchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135896; x=1792740696;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3uoaulQf4S54/KJl+1X3n/7IeNT8lvIHaLneLyKQ6E=;
        b=LbWr15jjHWnXQ64jJgHEJQY14mgsGWJTDFkPOLIsXPfehiSW75Oc2S8pkg2umiFQbt
         EsOFShmUeFnDwYAiFmEss1yLzxHm3TCEaKkRQr04TXnS2rUpyfGgeLE6iZAunxd/Areo
         h3enMOitDeukjq9N/I6MjSERumqDUJnd3q9KFQ/rojgBzAhv4pBG7nJuuaNPELWIFstK
         9r3nUVxHmrU5Ddtx9c6ATKmTLByQzyWfEJRcA6SdsmppLuCkiTiDjwbWfP26xpS4RGBy
         4GCmcEkcVVYUT91IHtNe0ftkjdW3LZvzxYDNUNlxSi90XxNltkLHTdArgzYXWv5tbdBy
         Y8jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwen0zHeAYfL4PC0OqFI66WkcBaLtetjymDeos3RvMBravydr9AlnPTRDgsYQ1RF6Z7tpPe3oDnmk9F8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYItZTi2d8jX6YznOTQLl0VmaEmatUySvNCE9pyL0gXTvOYZ4SbP
	SWybzHX0ATp0t48CBznxw/J51c3JrQYdg0hQF6uvXIGXjv4xOT/WTU+L
X-Gm-Gg: AYBFou19w/gwornnmsKxTeVH71uYwEPQYa5NSB03O6j9wK9ytJ2WERLpqG2lGjb684j
	L2XKO9SBjTSXjrcokWifzWh6kQE3YFr6BvZPs73LrRjTTFKIDvQSiK82bSuZaJZdG1d53o9eODJ
	XwcOjyT3l38tLjhIjRTpi2YiWDiAVXsm3ezA2Eipo4IVk68AXPryFPvmmsi5qUSninWWbyQjxKE
	Y/sWYBlcq2OwKu+S6an8/i3OUyEEJJQN/ekZYL3cKaIzFFenhwgoytzYcVr8sNlh617HqAJIxkN
	BaJ3lHYXlR3qFou6pgbi6nOZMFgp9bOKL/TbkECluOJqgOItpy5gLo94GPZYrxVahrtl86G1va0
	coPqi0YL7dm5bAEUFkK76iv9t6fT9crcEFz8yUx/H0D/fFCivKShyDGUDvPmXGwC9de/QLe+l8J
	I/aqtxMb/sjUyd6wk2UAa7u5pdD/zosHP2ZJBFN35nbEju5fAHqLRT+Mg9NJJfFp8DZOpV
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c31aa017261mr2123865766b.24.1792135896227;
        Fri, 16 Oct 2026 00:31:36 -0700 (PDT)
Received: from keen.lan ([212.75.99.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd125csm44471366b.26.2026.10.16.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:35 -0700 (PDT)
From: =?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
Subject: [PATCH 0/3] ALSA: 6fire: S/PDIF output
Date: Fri, 16 Oct 2026 09:31:29 +0200
Message-ID: <20261016073132.109288-1-p.glizniewicz@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DMX 6Fire USB has a coaxial S/PDIF output, which the driver keeps
disabled. This series enables it as playback channels 7 and 8 of the
existing PCM device, the layout chosen in the RFC thread [1].

Patch 1 takes stream_mutex in the "Digital Thru Playback Route" put.
It fixes a race with prepare that exists in mainline, and patch 3
depends on the lock.

Patch 2 adds a playback channel map in the order of the manual of the
card, FL FR FC LFE RL RR on Line Out 1 to 6.

Patch 3 adds the output with the "IEC958 Playback Default", "IEC958
Playback Con Mask" and "IEC958 Playback Switch" controls. With 8
channels the card runs at 96 kHz at most. The Pro Audio profile of
PipeWire 1.6.9 opened the device with 8 channels, so with this series
it gets 8 channels at up to 96 kHz instead of 6 channels at up to
192 kHz. A client that asks for 6 channels still gets 176.4 and
192 kHz.

A UCM profile for alsa-ucm-conf will describe the channels: the default
variant with analog 5.1 and S/PDIF as two sinks at up to 96 kHz, and a
"HiFi Analog" variant with analog 5.1 only at up to 192 kHz, which
turns the switch off while in use. I tested a draft with
PipeWire 1.6.9 and this series; I will send it after the kernel
patches are accepted.

[1] https://lore.kernel.org/linux-sound/30dcedc7-3b56-4396-af3d-6c2701ef1cb7@perex.cz/

Piotr Gliźniewicz (3):
  ALSA: 6fire: take stream_mutex in the Digital Thru control
  ALSA: 6fire: add a playback channel map
  ALSA: 6fire: add S/PDIF output

 sound/usb/6fire/control.c |  32 +++-
 sound/usb/6fire/pcm.c     | 334 ++++++++++++++++++++++++++++++++++++--
 sound/usb/6fire/pcm.h     |   7 +-
 3 files changed, 351 insertions(+), 22 deletions(-)

-- 
2.56.0

