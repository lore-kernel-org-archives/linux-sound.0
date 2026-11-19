Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108091;
	b=KlAXUTXKzje1kWJpyfXC/2TUgjvLs77Bf3kwmCRujQRjxtXJdqsFlaWyV2FSb+MHzGq8
	 P0K7LJmAj/s2xOpzWUpTyHOpDimmS7/sjc+qEnX1FiXklJUvHkvqm+xfdjMw9l/IsCnFf
	 4fifZpqyS4mCwB/qN55i1J/7Wy/nX+CJcHmeuRH2fNjJ6bG8qAPm5NvjP9Ylk2H+QhNgH
	 f77pMA76rGcvhHeUf0n2tes22Nxojc+oAB951mAm6U+W6wVtPQdgk8PhhqvH4GeXN4SWh
	 +KDelZT4ED/OCpeC+KOJ7lG3IbPmrAkwGrBR/zMN1e0k+G8Ph1JsLZi0v/PHKLfyx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
	b=Afe9ft8iRd56uter1zPolbJR3N8RFNiWJ0TDocQ8CXJjwugQ/bisZ2Tceefe5VKm+Sty
	 BfYKD7dETopfKijSZoT4ey/WB0wQQOSsFxukt4yp18L+eZ6OgZowb7+fg8jHsyjbaOJax
	 rn7GBdPUKgmzgbEg8qqh0AaqdK4lZO+k5rOt2hVKYTaQnH53Pw54cQEEok7hpkGokdnKU
	 rCkPYO5aUx4jAgG3BsN+FiqhpttckKz9Crxbj5NmXRsZVSCsnIxC9lwuR6NNe43FUlC5P
	 tRvjA11kkHLx2z6o26YNGuWDvwJ3H/repOF3uiWP+vujul14Z7Dz9B/BA0tch1CcI7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mt+Uvlc0;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B88606A338
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B88606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mt+Uvlc0
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so15600a91.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108091; x=1795712891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=mt+Uvlc0ci9UzOY5SdxKwQpbYeDDmxdZYa1g4FdQttSKyQ0M65AP7d7L/7rv539F4M
         9ElHbrhLUKguXzt6hN5sIeq749PR2K6fIU/P4v96oJWoXt7ts+z41Fzm5zU9lhVicqEf
         uqZsXo2xAQoVRVrc355YgLTCid7O4YY1JtTrlOSdbfYPkNzcjWYv5l/QHA2PtZqnOP87
         9iGjjyW2v8O/ZRGfGJPSWfsZuihQF6WXxbskpBusqgRvU9iTwrkPI6mAyBLv3BZTwvD1
         ZzG8bfjPTYUYEe+iVnv4dg0wKm29+or0/hSxWegWMgZtskHVxtL0pMbqTZkSfzu7WGAk
         FNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108091; x=1795712891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=sHz5jGqwlvbz2VZQuShHtcWoS6PF8+ZYAA8UVrR5yeIzN6NaV8IMjsj5i58ppSXuZf
         0vnp0b34/H0SOWS8LyZW8i3ybjPA+ik/BEF1pPSzpfa0O/wPZfpJ8vz49uCzWLfKTEDZ
         9dI6LncamsSDqs09mPqGRe1yFrQJqvB7TLYNM9WR2m/ct7a19XctTnXHcT4q4KooRF22
         zy/ZsxdkfFQeRB0wN2mGD2D2cL2XuPTlgJ350qYuwCwmkdRZE7bC3PIRAAHf1HFzlB8H
         01rJXapFB/y8UdPHUsMtcGjZIm5LiKcbuKo5B6s0nZLZZbcwO5gD9WB9P4CmduXgHkAS
         WCNg==
X-Gm-Message-State: APuU4Z+Qf4J16yDaFNIIytk2TfZMeAlDKlV6ZpzEpvi9s2OT5LPb/PmU
	kFmO90R7nrUU6P5jpKcYOCOf+9rxkPbXduCoOYLP8Bjin/N906UwMeh9sy4uvGyjdEBMTwZMz41
	PmZt29ney9A==
X-Received: from pjbds10.prod.google.com ([2002:a17:90b:8ca:b0:3b3:b3a3:5e41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c0a:b0:3b3:c998:6d6e
 with SMTP id 98e67ed59e1d1-3b3d07c68a0mr7206916a91.37.1795108090513; Thu, 19
 Nov 2026 09:08:10 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:58 -0800
In-Reply-To: <cover.1795106962.git.irogers@google.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106962.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <8af31a87f52c4cebc5ac7db6696a91545adb6ac4.1795106962.git.irogers@google.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Return early for non-HPH
 interpolators in HD2 control
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rx_macro_enable_interp() invokes rx_macro_hd2_control() whenever
rx->hph_hd2_mode is enabled, including for INTERP_AUX. However,
rx_macro_hd2_control() only assigns hd2_scale_reg and hd2_enable_reg for
INTERP_HPHL and INTERP_HPHR, leaving both u16 register offsets
uninitialized on the stack for INTERP_AUX before testing
'if (hd2_enable_reg && ...)' and writing to random codec register
addresses.

Return immediately in the default branch of switch (interp_idx).

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm LPASS audio hardware.

Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ab8a1c2b0489..84a3a47cf932 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2414,6 +2414,8 @@ static void rx_macro_hd2_control(struct snd_soc_component *component,
 		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 1);
 		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 		break;
+	default:
+		return;
 	}
 
 	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
-- 
2.56.1.708.g77570a6a1d-goog

