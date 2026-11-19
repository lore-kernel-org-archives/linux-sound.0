Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108085;
	b=cEoioTlaJ/m3JXJG0oTeoIGo/7JSQ/yX6M0BPaCoaqKtx7qPF7PMjPkb0z8HnrLnYGGK
	 KXPLGLrAQiT/grvM9ko9WGfbUuQ/CFZDmBkl56uVyGspYHZMNz3/cd6DtQf5Xr1D1NiFb
	 BnIwymJPYaqDxeD4XWB0YDM8c566ndkXOVMucqgnB4c9l1A4fbUar1RdYNtxPsbFj9Op7
	 5pvA7p93ZQObZeThGfGBL6FNQsdj5ADvG9N2h1uHVedpGikb4aXsk9rc+JABWxcdGNerD
	 eolQlBjslVf20zSn8GQtRMFmZBlAgGpQeOY5ElZmyOz5Bp7/sSD/4CAP8jW8U0X8JMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
	b=VC2GEL853a3791WK/QCL5k3JSs/qIOtWbEZINMEblQfhyPwlSx945Lh7P5AYGQfM4jtZ
	 GE5nJYD9hXrBn2RghtezrSPy9bqYU+I7QYquZ2COqNFDuuSA3UN2amC2lCY5CA3rOnSWR
	 Sqcu2zL4W+Ck7vNNCxevPPKl+aDuxyirRH47ZjJel+2TuJiA+z+d8jj2EiZZEttyGq7Hs
	 DgdDmza1FjtEE//5uFDseDJwKMSH/wf2oJK7xNjFHPGFKDhJuOZKJDv/Sj7uZWemA2xJD
	 6H56VoxFpIBYVMAos/hVrlFBs0U8/spHGxZZS+2yVMygW9yffFs58lnAweP1AMPGBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D080606A32C
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D080606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1573109c88.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108084; x=1795712884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=LxGOfYTIQUdp4BvstsQzdRlDDDBEeN7//lrx+SIeNyZozXK5Z2dXYiejZYGuw1gKfE
         W94z6v2dDqiJWdyFH8Ug38FwPUmCqgWPb4FJBLNqo2yOnzGrnlwkKtk5vKsU3QhcTi5/
         fzZiQt2imtcRqKFqiwNTJ6qwYnIkdTvFp5xr0T6VvYFd8l59VmYkfBRJQw2PTLllorLR
         liJi7C42MCIzYBHbqKjVSr3iu2OZDGmumZtyatjMrIUEnYaMz42nUT7UJHrkmb8ozBYc
         wNRbc/FBGWl2fp16kuo55OCsaahfOPc4+r8BAz+qH8SiOjc8Anc/bAH07t7o1XFqQpOU
         taxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108084; x=1795712884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=h9J0IneW3YLClAc5uFbAb89S1lR2oHJ9cbZLKXx8D+2r1e3/KjJUfR8ediLM+dAqWr
         NktIZByYpOOPaMIf+nUA8MuoKG1b56nQEGoP6wdniRfEeRv105do63oRUTvlfjoh2ZOr
         QVwfLQTYDxGxEcXNDSWLHqlXoKikpaFB8wM5J0CweBWQ1m0X0BQYbn3/GdumsAgr+7sX
         AOhiDB6u/k4YUPMZuGeD+NvVgIsw1x+zJyZC57sMITjL0cxCHsitbvAP64Of+kMCk0hE
         xJDhQLhvIfdJPMhvrrlgzp/xKvy2LrDt8reAxxvSndPgt+MLqyoIFITd2YP6SC12ChqG
         djbA==
X-Gm-Message-State: APuU4Z/jUi3i1EbPEo4+qjhmXWzorZxYfPYLRxrZ89151MnJIhpGtXnf
	nRt0xc7cYP+iQOVlJYQCbg7raNpYQCe4PYHzY8OXPT30VHhEpRdGcfceKGKou68tenYXgmgyPoC
	Ry2Wl5L/ItQ==
X-Received: from dlar19-n1.prod.google.com ([2002:a05:701b:21d3:10b0:1b2:48db:23f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2215:b0:1b2:42db:8a54
 with SMTP id a92af1059eb24-1b5568b3154mr212363c88.23.1795108083489; Thu, 19
 Nov 2026 09:08:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:57 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106962.git.irogers@google.com>
Subject: [PATCH 0/2] ASoC: qcom: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in Qualcomm ASoC drivers found while auditing Clang
warnings (-Wconditional-uninitialized and -Wassign-enum) on an
x86_64 allyesconfig build:

1. Return early for non-HPH interpolators in rx_macro_hd2_control().
2. Return IRQ_NONE instead of -EINVAL on an invalid DAI ID in
   lpass_dma_interrupt_handler().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Qualcomm audio hardware.

Ian Rogers (2):
  ASoC: codecs: lpass-rx-macro: Return early for non-HPH interpolators
    in HD2 control
  ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid DAI ID in DMA
    ISR

 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/qcom/lpass-platform.c   | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

