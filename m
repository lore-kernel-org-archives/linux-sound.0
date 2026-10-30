Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382522;
	b=pfMj9Wu33zZr5tAiFEvHvEAMfm4klitPBTGThmwCldOJlupC6bbthnJ84G9pUEt4Amm+
	 VePe3UCRpi9zPV9p4jq/NKpbRJNlSvCJwgGj8AAeBYGfFyzzHSqgB3WcKsVSzHXYh5lDq
	 LKNdXl+TjNRlAKTi8PQqnUj1px50rfPk2S8/kOiBPdp5dBVGOkYodb5raidcjiuw9Iinq
	 NCJ/5eFCPkr1ki5peuGAkRKmFWYSuUAwMVkj4P6/Oppcy1aG52ZyrHqQvHgRLG889opQw
	 M6HS9mtTiI3ip3+cQVJhUoaYfa8USbDzvx3IEmY34WmsWp/KAsWk83HZwlYFZ5YXYGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tCjjKUaujfaLQmslqeozg0SLDvgknvluRFAYaG2v0rY=;
	b=LpKQCi3XHao4P1HXarThKS/vG9UVa/7OVB2BE89shGfbweoFQGCfnGl2oq+fx/H6jJB3
	 IWYKJlI7npxiy1TTJc8DpDFbsF6dQWnpguJNlzAbwBa851rHnlo8NxBinXbs9W9wziw78
	 Kvz38UB5+JpBmVrZuJD0igxGOmUNLn80LeYPqTi+cu6gMvjzpNhzs03npvWT0oA7jHLkB
	 K5YfawbsM0l/y7Vmq3J6J0B4nob26h27gI3k9SVdgxTJZFdMwFYD3FbX2+IYmgXY+En9W
	 bvgB3Zk3qK0gmxH1fgW88IdIeMC5kReDxsl8aDerebyxtCpcgvLFux71guCu2H2IkRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eG9YMGAR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C43F60A2602
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C43F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eG9YMGAR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so663676f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382520; x=1793987320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCjjKUaujfaLQmslqeozg0SLDvgknvluRFAYaG2v0rY=;
        b=eG9YMGARFvw5RWZ9FOha9w1hmFX4WF2/xGDopuZwL/tK4dlTLz6ZpSjxLSuIXe4XcP
         GrC788d6VDuzwLPPYzcsB6nejTW20+VOGxtjYcMiuDDOxJC/z3G4CLtgHMrwyVyx2lM8
         2fWLPpBTmlI63HSKy2oZuHcICBFpTfZd1MrOOwMm2jB40T3hrrulwmZMB5DHkcNdhjCg
         ytuoYZ6SRlgu6BD1bos23QrTjIC43wYuZISNZVBzM7OZ/sBf3xQioOO759Mjb8NahFzc
         pvywIu6SODN8TQntMLg7DXwhRNQi8GgiSSsng8ijZaQZ1TwnZGpr5DBIgt1UWcVZPkwO
         la/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382520; x=1793987320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCjjKUaujfaLQmslqeozg0SLDvgknvluRFAYaG2v0rY=;
        b=hDedOhhmn1OleC6nAoDgQrXP80RCA2Eu8QNuJO6aAVwRavhHq7D0mdoPPOS3Eu0KM5
         6llQMKQIM7yWPM9r3SGbcRgkCEwJGApzugp56K+j7M3+79nQ+hKzcinSLGHEE+8WSV2i
         X0I5U9YQir8UHOBJD0FL2DM0E80H2UdZb+tKfZAAreY07MGcAZS0O5DE6c3z4xymc30n
         qNGqgDJKsm+mL+fGNhU3axghpyE20DaPPVoPhwSZ6wugdLcLy1bmxOWOcIdbPYGhWi+O
         VsxT1mVL8Ye5QgC5rFC4VpOovrthCQA/ji3pBTfn3D5yPG9BkEl5ZNxv7hIqqrmCMCzR
         f6BA==
X-Forwarded-Encrypted: i=1; AKwUvBxNkxdmwKP0o5w+sUgOy/EAPZXVUh+ZVBY6wfYRjmwTCPG9dRbcxI7XVqjDWBNPh3RJoDRxNbpHBBI5CQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7oq/VWBPl1BNeaNx/UXDXWH9jsNhKWgSoHzqikSYO3lcIY4LK
	xuwaovE2up3BsvBG0B2bXLgKE2Qs1uRjKiC7e1xdrBKCiEyoTxkURGw=
X-Gm-Gg: AYBFou20/dMUAQ3j2KdnTHiDKXI7nDvMYwW0+KDmUrNPHA8EvCGzNuS9tzoz5gTuZ5I
	BSldm2mHkjHJeTVyDvWKX1+xfRNSH4ZzL8R8WAiGF2Eyy4pvyQxRe6fugwrlJoXhIWHTc22nWU/
	/vhBvgQWm6/uRhgcXc+Od5xSEo6t/28Kn2fpXwx8pS88RmHIB9HlSzRy6JeJZwp//QUclyUQfSQ
	QGACe82AqyvRo18EZczmjthLnUFKPyh+9qSnIOoiPNEcwsYpUb8x/vC5O8xJJ9865cbt7ro3pbw
	Z34HaIyjrRDOm3kEhdn0GZo9IiazIYCKz1PwgL8WGL9wqKz7jKVMqpz6/85oSPcQETE1ZXszL9V
	EKCGjqmWPsgtE5QVE9tT2iII9+YJ5I2QE4pnb3uFCXBr9CohMzgZ7i7GviLXDM3F1OIST9ZTnGB
	RSk/r/agFdZRrKsKzU3VTE8LdUgafukgn3XmE8YJBmEmwanmD7JiDOG9ZWIb6t4qYkQBSWza0Z1
	AhsOEDbz+O9Uhnqc13oyCT8LYS/vhZha90h9nwChn7fWaYqXIbVNWS4ktoNIr7jaxFPuJqaLwYS
	dbLyzCRoqOBcTB9Ij88YPuxVV4ySkx5S5g==
X-Received: by 2002:a05:6000:310f:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48e6e2c33admr6901151f8f.4.1793382519367;
        Fri, 30 Oct 2026 10:48:39 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm4492926f8f.40.2026.10.30.10.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:38 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5 0/4] ASoC: cancel pending delayed works on codec removal
Date: Fri, 30 Oct 2026 17:48:33 +0000
Message-ID: <20261030174837.1839402-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several ASoC codec drivers schedule delayed works for jack detection
and microphone polling but do not cancel them on component removal,
leaving handlers that can run against freed memory.

This series adds proper teardown ordering in four codec drivers:
rt5668, rt5659, twl6040, and wm8994.

Changes since v4:
  - Patch 1/4 (rt5668): correct Fixes tag from nonexistent
    e13da14e8543 to d59fb2856223 ("ASoC: rt5668: add rt5668B codec
    driver").  No code changes.
  - Patches 2-4/4: no changes.

Changes since v3:
  - rt5668 (1/4): track IRQ acquisition with irq_acquired flag to
    avoid calling disable_irq() when devm_request_threaded_irq()
    failed.  Re-enable IRQ in rt5668_probe() when a sound card
    rebinds after rt5668_remove() disabled it, preventing permanent
    IRQ silencing across unbind/rebind cycles.
  - Patches 2-4/4: no code changes.

Changes since v2:
  - rt5668 (1/4): also cancel jd_check_work (re-arms itself every
    500 jiffies while jack inserted). Disable IRQ before cancelling
    to prevent the handler from scheduling new work in the window
    between cancel and devm IRQ release.
  - rt5659 (2/4): no code change from v2.
  - twl6040 (3/4): swap ordering -- free_irq() first, then cancel
    residual work. Fixes the race where the handler fires between
    cancel and free_irq and re-arms the work.
  - wm8994 (4/4): no code change from v2.

Changes since v1:
  - Unified series per Mark Brown request.
  - rt5659: guard cancel with jack_detect_work_inited flag since
    INIT_DELAYED_WORK is conditional on jd_src, per Mark Brown.
  - wm8994: cancel mic_work before and after jackdet_bootstrap for
    cyclic re-arming through DAPM power-up chain.

Tristan Madani (4):
  ASoC: rt5668: cancel delayed works on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

 sound/soc/codecs/rt5659.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  3 +++
 sound/soc/codecs/rt5668.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  | 14 ++++++++++++++
 5 files changed, 56 insertions(+), 2 deletions(-)

-- 
2.47.3

