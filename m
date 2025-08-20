Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF562C11D6
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724575; cv=none; b=BE0bP35uxtF5AS0/Cns36nxt8bX7R43lWFacuWc1iQnWe7Oa693XiyKVmyK8mnHV3YoVJsL/ujQjIoPPJs90pFzQ6Kplge3g/UZUbAdTK5PxUBFcVqG2i5gHWJ6/VVbu9nK7/mjaIFoCvhGf2LVQWsX2dpd57X0+EVolbuUKxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724575; c=relaxed/simple;
	bh=+PRTzfNNIvKL6e++6M7NvDK0aJyyzVKFHkecFLwW9Xg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gn0sETGGl5mcyMjJpPukBhObIfvO6En4jcE9SYkwmb0H2vaMpP+5J89jMyzhqh5fbSJRvI+kQloroW/Esu+a1h33w5BMWoLqohcP0QVcoBVOV4QBy1/ZzFRx0wn2shGWGJoDcdd/3OIvfFYS2tmbodnDTLYWxhZWd+mkB7rmwA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkP+I3k3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkP+I3k3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so300896f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755724571; x=1756329371; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBBvkxhekDJYu1ta91SINgdOpf53PrlBWNzBxoGqaxI=;
        b=kkP+I3k3FUSfZ5q9/2YPjdnVBgIWWaQIhiCrMnwqU/bVno4ratIe8XRFAymhH9U3fq
         k3JWS3V1rp/Mf187p91dO3ZqOdWX62kvDqMKKMMaqy9AV2drRhdGflhJ77UBWTroELcg
         iHCVXHAdxpscQ1zVgNhRpR5P9Ko0wa/gjUHeAIQbygEVH3Zci+Uaw8tgTlp26XQdQM3t
         X+gFV1rDUEfUg1ocULjpl3l+ykew5IDolNIOdxJvRd1NqbD6g0cyTXpBiTvwjU/30tNB
         yh5Yy7+/SCKV0HXDz+fAQgPEVfPjXJGnWidNQoWKLrj0KHk2CCa2K2hrnQrRWpSIa815
         V5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755724571; x=1756329371;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBBvkxhekDJYu1ta91SINgdOpf53PrlBWNzBxoGqaxI=;
        b=fjjrvIbo63RlPVPnwV/stl5612gBn7AYiM3T2JW0mOQEx/xTffVPAMZyK1NwSYh+Jp
         7M33LLgOFRaxZqXKIK2ddIo5IMVQ4wi5x7nwcWRBpv7qqjBiWnreE8t4PDLmdbjvVqM7
         iJ5YZjcONj+r6pawlVPQqjzaAJPD3ps9ZLhZayGFpAEacwbf7vQUJrXXpNdpnU7RMbFa
         ztchWcDKXjVnf2Da3ADKtdW03tLtTvtwK5r6EXHwEociPC9+anQu2m5YldTvf5QV3rzZ
         MvXuVdpLbyUpO92GFrfzN4MQOAhJKD9xmlMbGvYHnGYN8ujHUFhpVQ9PDBkrnQtCphJy
         k/tA==
X-Forwarded-Encrypted: i=1; AJvYcCW6b8+QMpQvWiXNwhwP2WsyrVyHFqi9Srqb234UW4dbsgll0DyYMaY8FnRaMt6jGSKNL0LJd+yI6U//pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYEL5Nnd9xKKsVCcgSydBvSCddP/xNtIjomK2U8rhvGvSbUZkZ
	Y04hJVfCKqsiWHpRGgjGyWKntPamYH3it8gs/GK7EnONioSnZq1fw2RWOi3tJZO62F0=
X-Gm-Gg: ASbGncv0Vg61CjRi6QUtCwJRUhAbHo/ACqHGen5ZP5pCavRASqq2p6hA8w3RFDC8EoG
	gZ6eyR7qanIfkcpnlQJqupXp3nCKO3WwEJX11knDg/5Ws0M/bWSKs4Ab+/CcMrEjtxmgyX05Qba
	1GXe6Pcpd/Jxr/IkGcNIpPMsA1mysU60o60DEDxyBTZVvXynq5QOAWpM+W1lJhfNcmC4LjFU/E4
	SMC8noJ/cGYRxFNBfLu9jfHI4ePgW5y2y5o9XjqiC7VfFqDNypiA1kDEmufiWX5I7QPDxRthMmh
	Mn15M0NBUMguyqXzKNwjLCH5pbwkmEEDJTOLJoYXceVvc4NtAlBjyhZDSsnT+0QrflSJkTlh/ru
	iVkWDpaxIIeXrhi+O7p+nFZYtzCk3UCuXGsuyd+M=
X-Google-Smtp-Source: AGHT+IGSz0r8TSH88aPMH1bxFbynfRL/v7euJ/dUaZezLflt1bN9iwq2BCWh1nK7cdl57YdF5i30aA==
X-Received: by 2002:a05:6000:2dc2:b0:3b9:7bea:149e with SMTP id ffacd0b85a97d-3c49405d7c8mr168242f8f.8.1755724570942;
        Wed, 20 Aug 2025 14:16:10 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:41e2:cc8d:197b:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4d7b2948sm162105e9.0.2025.08.20.14.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:16:10 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Add raw OPUS codec support for compress offload
Date: Wed, 20 Aug 2025 22:15:58 +0100
Message-Id: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA47pmgC/32NUQqDMBBEryL73ZSNtmr71XsUCUmMulBc2bTSI
 rl7Uw9QmJ83MG82iEEoRLgWG0hYKRLPGfShAD/ZeQyK+sxQYnnGWteKl1c0nvvgjQzerFq5Gl1
 fYdteKgd5t0gY6L07713mieKT5bNfrPrX/rPloNJDgw7tSdsGbw+arfCRZYQupfQFbmHVNrMAA
 AA=
X-Change-ID: 20250616-opus_codec_rfc_v1-b60bd308893b
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

This series adds support in kernel to recognise raw (or plain) OPUS
codec playback for compress offloading. At this point this series
doesn't deal with OPUS packets packed in any kind of containers (OGG or
others) and focuses on adding missing bits for pure OPUS packets.

The second patch adds its usage in Qualcomm Audio DSP code. To correctly
recognise raw OPUS packets by qdsp6, each packets needs to be prepended
with 4-bytes field that contains length of a raw OPUS packet.
It is expected to be useful for usecases when OPUS packets are streamed
over network and they are not encapsulated in a container. Userspace
application that will use the compress API has to manually add such
4-bytes long field to each OPUS packet.

This is tested on sm8750-mtp. It is expected that next hardware revisions
will also support raw OPUS codec offloading.

Dependencies are:
-- hardware with DSP that supports decoding OPUS packets (>=sm8750);
-- adsp fastrpc;
-- explicitly setting format in sm8750 soundcard driver;
-- running adsprpcd tool with support for Audio PD and DSP libraries
loading support (or its alternative);
-- tinycompress fcplay tool that will prepare raw opus packets and
do the required addition of length field;
-- mfc module in topology compress-playback path, that module is
expected to parse channel mapping and do the required things to
map streams/channels to physically-present output channels on backend.

The userspace tinycompress tool with support for raw OPUS compress
playback is located here:
https://github.com/laklimov/tinycompress_opus
branch: opus_v3_workinprogress

The userspace tool is not expected that it is ready and still needs
some work, for instance recognition that it runs on Qualcomm hardware.
More like working PoC.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes since RFC (mostly as suggetsed by Srini):
- added struct snd_dec_opus_ch_map to struct snd_dec_opus;
- changed tags;
- reworked comments for struct snd_dec_opus;
In qcom audioreach patch:
- corrected how {stream_count,coupled_count} is ejected from mcfg->codec;
- stopped dealing with channel mapping parsing (this is internal struct for
  decoder on audio DSP side);
- used sizeof(*opus_cfg) for payload size;
Tinycompress/fcplay:
- small updates to match kernel structs.
- Link to RFC: https://lore.kernel.org/r/20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org

---
Alexey Klimov (2):
      ALSA: compress: add raw opus codec define and opus decoder structs
      ASoC: qcom: qdsp6/audioreach: add support for offloading raw opus playback

 include/uapi/sound/compress_params.h | 43 +++++++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.c    | 27 ++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h    | 17 ++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c     |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c         |  3 +++
 5 files changed, 91 insertions(+), 2 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250616-opus_codec_rfc_v1-b60bd308893b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

