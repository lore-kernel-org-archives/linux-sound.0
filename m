Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379861;
	b=Fikyp9/biXeIzHT8Tph0gfyuygGFRDreR80rSkCsd3kEpko9DHmSrTE+/1xvUdnAQSIk
	 ovWC14Kkvil10uU3szJzoa+ypeYASBP4hpRLvDFwKgtinLUWhxW9ghu77+CWVFHKSqv6d
	 ETOF4FECkBQxwkVC4TWEzbBT/+pPqWT9j8Jpx2Glyc430+K9wKZEJ6OV9CW2nwET+A3Wd
	 Ei46chWxgFBbl8n9Ytqo8fT/d/Ctb8Be6AeBz3cgo4zP0+YQJOObECOle+jk2GoxaTI63
	 U19dvQFM59eX9dLpg0WjwhUOzUAugnF2nMGpZwcengNMzf/qh+I7lUzEAEOBC47+Ubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3klLgljL50YjSiyfASYNU3sNBhIfOofJ+tatrsMN0Lo=;
	b=mP8ICPYRIOg5aXElFmuYDek/lZrUcEK8vI7xjQqgVhfuVUkti3DDpKjXtYQdmHXHC/SW
	 aQjPQPmNJxiJVeyLaSsYSbkaCjAYnTk1EziPd2FGH/1d0IHyQifVVDCJcRoiCNPPJLcXG
	 J3QC6Q5rd9J9yxFXQwEb4Mhk8VlVurOS6U5zAIeUYxhsbc7hg+G9u6nNIOHzQUvZAnKM+
	 PUZ/qR5cAVHzSzU4Vzs3nWtm3ICPSKrk3zRoUWfoJbCHvFR7yLXX0CXM0qpyP5vGDuY5U
	 GbPIwM9q7VuujcIs0rYz2C3YBLWYAZa+2836kbe1boCdcEVLbZJaMSsJU5r7SDun4CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM3G1zL8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9D606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A9D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM3G1zL8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6994285e9.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379859; x=1793984659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3klLgljL50YjSiyfASYNU3sNBhIfOofJ+tatrsMN0Lo=;
        b=IM3G1zL8EWb/mJgRGBR4zVifUDu1FBZOzHaRZ520orOWcOeTlhICh7Jj1NzknEf5OX
         rd6Kcj16OYw3CdFnrVJ4j4J3hNUHb7GQOW/59PzqvTSsdC5U5A2UxIzsCvTsEsLgL23T
         VtrfWvcK7ld6a+r/HPcDy4LPk50B7sP+4IRobUJaZ7zvdaqis5bOigGOKOT5IN2ikXgO
         /4Bq6bm0IewU5/PrIGllj5PWa6s1LFyt8Sc9MdXOpCtrPHWUO4HuUdYXZrR+flh0R6Jq
         xuC8uiegGr227gALrq/URXlgBzXav8QtdoR89HrAiDmPZnQBXieky4lDpXz4KVyti2qR
         UyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379859; x=1793984659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3klLgljL50YjSiyfASYNU3sNBhIfOofJ+tatrsMN0Lo=;
        b=Kf5+8PqdjCDUVhIC5lA7OPtUXi62baxuKBpuEMZCai2C6Y+vXJLQpCkabJQ6zm2cNK
         Tc40Un06MFYyQbKh1J4i5/6rHxcZnNNuwgBZ/N1c29dUsb9kVkhyDNdX88P3lrp58t9K
         8piXa2aaIfIXjXXtd56Fo9QHh6vsYo5Va7/PKAbOlSzIy/JesKPE224xWNfKzQO1Yf31
         CHy86NjFeL9W+9+GhC/o5A1qHW3pQRDw3SEl4FYJaXf0tdyxhnBi6an5HGvcPtvSmtW7
         r0352aWfTXDZxxtkBEFZ4KzucG387klpboJgpYFap7Y9Z802A03f3JvkTlehkDp9Zn0p
         tV3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzH2y3jFodEOKfupq8HzQnR7qnxinC5/+LG8vyv6CtGwp19Q5NUKyaZiG7ZOcw9g0gvnPR8fw24f/CtEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKg4hHBKyNmp4txJ1G0xEeRTfQMsh5pKHblMaeKM7iYgwXulqBe
	DS560xjkfE5gW15+SCHWY1kdjyU7Vv9rcJdGx20b5LCYckg90oAu/Nw=
X-Gm-Gg: AYBFou3mYTAhpzu1GfCtjXZIpvQb9wiqmgGdqfNbO3zXX4+ByuEf5ScX8XlsowoLdyR
	fMgG4wCaAas576Z34iJHeX9K420eAmRcaF5Rh4LZo/RT+k8Tcs8x2HuEA+PY1+pl95KGrYCik1B
	7VV0kWwLQICTw9iSd9Ed/8//Bu7i6JB8f5tCxQ/5BumuBu+l5zwrY4KJ87+iYDzTbcD8eQVvSyi
	s30I5csOMNhPexgSNYqtkHQg7Ugz5pF48P7nNO7TvpgRgizF2VyN0Tcyfz1XdmKrBtjwscOSREy
	74tlBi5IMzgnVUr7py2ZqaiHzzRCGjQZ+cUgiuSvXBBI73lnblH1Hodk4Qi7ZXdDgXQ+qmC7T3Z
	MWrKBlds5QsLyU1I+hCEWzklXJvXUteGoouaCggf4Lm4v/vZIDSstSiHSjjfHeOzQO7DPoT8w3F
	gAlj65fBplnEqw7TFfolntY61F6j0H7GesMeK+bNlbOgVTHvKKpld33PUx+PUALQr5jxbNXPTwv
	1X4y19oh6OjJxcpWos6ZpJvtn62S+8jRZYs12H+HS6LJeYk8kzlOFAYdVUGx4UbM2/VI1M3dj7G
	SKlUviReGEg=
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr64239885e9.2.1793379859483;
        Fri, 30 Oct 2026 10:04:19 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm75121785e9.13.2026.10.30.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:17 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ASoC: cancel pending delayed works on codec removal
Date: Fri, 30 Oct 2026 17:04:12 +0000
Message-ID: <20261030170416.3561618-1-tristan@talencesecurity.com>
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

