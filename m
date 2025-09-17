Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B02F7467
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094376; cv=none; b=CWD0Iz4CMtWaKQAXQMso9EG+0T87WaTvy0nOcSHVpAsqmPI6HfHbJIFBZ1mD0TIDeWiLNUYMTiRugDFKd97TPW8Yf9sXyuNB87M+C1BDOf7eQr1d46ALiQWalDsa6z+W+aUUBg2PSmIgJ430KSU8TAKDSHukS7AKK+/s6hFySHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094376; c=relaxed/simple;
	bh=4UuqKX3OB4C4vFgEAnd56vVvZ8U0LkURnxJegy0E2fU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Txrw3Ex01QjxjiOWvZfJyQIZ1dFX+0IhMP+jHEDcyd1E+0054gKJZ/Yj9nNJ5vQUsZE6j5GseIeTwREF1y0MS6YpjyC668t4ydpph0BUfjCozMKq4MVpDh20y8MTz59iZhp0Rv7kjPMeGGqq/RC0uKNBUsxtgt8/yOJCZTt+NRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9DwWrGg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9DwWrGg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45ed646b656so54429745e9.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094372; x=1758699172; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NssRIOM+Nk5TpF2zDpkYc0MvhVsky+7OBhV3Anr+sDk=;
        b=Z9DwWrGgHKvonHOxR6rUMqawcDYv4n3gRUJtKpWVLxRenj6qh2XvNYPFKOKPS04JS/
         7EL+IEL0qPmy1doiq89qtiUq+BMCwxGXIRJPWBpbkifaABG8C8EmN1ImBxOzfjvAFnS5
         DBW5sheVhmatjb/Lk0dSSpIikQaDWEBh8Zh56iyvvR49y4b3ChXT03OxdFzalhHTZkqL
         tM4h3QXpkjyUrNqS2wiTaFBfHKOFoWKksQ9VhnzTxnxxAqVGMJQsFuTPJaaG7G664wsQ
         G6EhXlJJc7xmIXFGMVNa3wWKf1fXM7dJV0SLWgn+W3tacyQ1uX/X8MpshsZSGWpz3fIh
         IgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094372; x=1758699172;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NssRIOM+Nk5TpF2zDpkYc0MvhVsky+7OBhV3Anr+sDk=;
        b=DkrIqZevJAO9ykKzBe+QIFrq3gH39SP+LP+BAebdRV7TpS68wYfA2u4dBXZRQ9Dmly
         72WTMibln6d1zzh/dQbhsm6VR3v17UykNf4jU5MdH5BMqGh7MaR/oyuvJ9OBKqxE+bZV
         jf4R+vwPEoZYWLZ95W1R1U5lTkVfoCOqQB8jjbZlxjqedX+iFcEmoqfXTHvw5MsChhBb
         WxLZGMSPkIdKX7CmVoSOyXC83T5qiKvZ8zqpab9r/Vg/qgbQjr3u74q4iHyQeoVv42/P
         zhpuzwmUkUz2Q98SrGZUa2Cj/z2lbukXZQaNyXSEYgmsS6BVrrj8qJmoxSQ8cs9yoI/3
         hItA==
X-Forwarded-Encrypted: i=1; AJvYcCX4HzHkeKswjdx/AthZmlfeSmB950dQLEoIWPqw9b/tJ3FgKq6PCWattPOgUtRCe+Yd2aUdaxaIIN6qeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRh4iRYcwgJ6DnO2P2CjEmDHLDMjj5ARwypMYbiCauxky0BlDZ
	e06L/vgCWxr8l6dTCetnXyC0aUdFFJl750EyNtdKERWrp0V6LwAm6YBB7K0r6/ZQBDOWpoKzpx4
	/AQWf
X-Gm-Gg: ASbGnctFuHlut08u0zYYLXD4nfu/wE877TfhRGrRWM4RK+BpJaYb5B/mZW6251jJAe1
	s9521s5vMkyDodFBo3Ca8Vxvl3pA2SpeIyyh6wkcov9IuSiU7o8dy7D6GmEpF2sgKd4iZKrRa6Z
	R+CIYyqi8jS9ZqyVYzB7XnaRac4WCy/x5khQEg5VzQ/Gai8rmAfycIfoea/8Am/b+wgLNYPPhxn
	h2Zh8fc5rMQyC+4YurkP8am93LqPWdv7i6mNyhRcvG5RKMzjn1KtJlwwCGc62+giFzRTVJ4xm29
	v5LYkTZ6+K/Dx52y9tIbHsBr/P2ShFOCn8RrkDIrUwt6wQywPHcnsN2gT3hKkBF+702eXYm3Gsm
	xqWhwXu6imeHHfoYOxjsRHtSu8RMM
X-Google-Smtp-Source: AGHT+IGE3KGGsL03Vf5Ls5zNFSXdigUvJnu+gvn1xbZ1dzKAezrUvG4htWCcEVpLa4a+HvmsvGC2Kw==
X-Received: by 2002:a05:600c:5248:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-46206099ddamr9334455e9.21.1758094372096;
        Wed, 17 Sep 2025 00:32:52 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm25442035e9.23.2025.09.17.00.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:32:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/3] Add raw OPUS codec support for compress offload
Date: Wed, 17 Sep 2025 08:32:49 +0100
Message-Id: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFkymgC/32OywrCMBBFf6VkbWWSNGnqyv8QKXm2AWlKokUp/
 XfTblRQYTb3wjl3ZpRs9DahQzGjaCeffBhyoLsC6V4OnS29yRkRIAw45mUYb6nVwVjdRqfbCZe
 KgzIUhGioQpkbo3X+vjlP55x7n64hPraJCa/tP1s+KLGrQYGssKzhePGDjGEfYrfaN1QQ+IWyy
 jBdMw6C8Xd0/WQir/UGf1WQrKDMKc4oN46rD8WyLE9PUH3sMQEAAA==
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
-- hardware with DSP that supports decoding OPUS packets (>= Qualcomm sm8750);
-- adsp fastrpc;
-- explicitly setting format in sm8750 soundcard driver
https://lore.kernel.org/linux-sound/20250911154340.2798304-1-alexey.klimov@linaro.org/
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
Changes in v3:
- back to define version member as __u8 in snd_dec_opus and reading it in audioreach_set_compr_media_format()
as suggested by Takashi;
- new patch, bumping compress API minor version as suggested by Vinod and Takashi;
- Link to v2: https://lore.kernel.org/r/20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org

Changes in v2 (as suggested by Vinod):
- opus decoder struct: switch version memeber to be union to allow reading it
 as a byte or two 4-bits fields;
- audioreach_set_compr_media_format: read version byte.
- Link to v1: https://lore.kernel.org/r/20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org

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
Alexey Klimov (3):
      ALSA: compress: add raw opus codec define and opus decoder structs
      ALSA: compress_offload: increase SNDRV_COMPRESS_VERSION minor version by 1
      ASoC: qcom: qdsp6/audioreach: add support for offloading raw opus playback

 include/uapi/sound/compress_offload.h |  2 +-
 include/uapi/sound/compress_params.h  | 43 ++++++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.c     | 27 ++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h     | 17 ++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c      |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c          |  3 +++
 6 files changed, 92 insertions(+), 3 deletions(-)
---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250616-opus_codec_rfc_v1-b60bd308893b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

