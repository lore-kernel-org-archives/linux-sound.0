Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9F21FF53
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087595; cv=none; b=qiPeh7IuY3FZB96MvZbXog1gkCYgiUC9QDUVBDVKKJeP0e4rkeZEdF/CwgqyBMLvV9/6C4dyBs1T+e692Jd9Fl/poRcoOzLjLZwn6Cil3X8ukk8RjUTzLZILetzxoiJtBFwnL6A+a7Mg0QUR6uhLrbnuEoXJWCYlC9ueHa6jl5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087595; c=relaxed/simple;
	bh=DU2I2YbMvZtzDPQCuipbYRsqprvK763THV4LfyAtDjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cd+oMZHI9tNNJlFWus0xFnszO9VUESiTfqQewzVdmff4thEhAI7x3w9Ly1AzWAAaeRVJoJ1aNnt0p6q9Fj/myWrbOnGjTGwDdhaSDCq30Qe4/5xGUWOGdCbsMiRad7NbWPgPHkXV0IyJlM0RypbBpg9bn3p+u1obF/Irt2njyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DegWTKJk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DegWTKJk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso15141085e9.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750087592; x=1750692392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeO1+HLlWyoSeTEwNQ32JwkuMNWbwruSJUY5nQLUj1Q=;
        b=DegWTKJk+1H8SZDrCFzedm4dXK6uo2K/zFCG0Y130Z4ryoWPwAux2bBEU0h9IGj3BK
         VmjN96wNGA0K11SObvL7SOvEOJ0Ky2FxOhTz6spYrVDqiYxKWUPjm0dSCi00pQfBiUyL
         /C4x+T1h5WsDvJMU6TA1tcjsnCLG30AH/D0lKZMdz9qvBNriWYgi3PIWdlZTQenXkE1e
         ZCkDfxVdQYEv2h0Zodn5gILcGAlWgo6RnKt8LFPTpRDPBQCtZh54FY8NOCD6tOCmoGhP
         kOezQQpvMFA6gQ/Pu9RydOC1q2V1E2zfvHltO/EgLIVGEnXyidoDe1bLXTOrkTPEHdZW
         WRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087592; x=1750692392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeO1+HLlWyoSeTEwNQ32JwkuMNWbwruSJUY5nQLUj1Q=;
        b=uK/hYTImRIRf3rvrkjJNjXgjCMaD0+WCNI/+2oDBP4Yr5DcYM8WsIZfkg8AEu5vbnd
         Jyu6fWgFfaEcQ1ztdziTBXfm8Zafe5y6iNQLa/p7xOdWhSajgcCDXHx1Zjzl89VYLdEX
         RbA7oyw784j3zWZxauyV5K8neJf3YlAVqaa8WUjRA+qEiKY3+X4ggFrvdQMaTJiKE4m7
         STLkC4TdvzhdFWh/zKfebbgJ7twh0y1jre96nuLGD1qyE2NotDAWYyn7Cds2xZW85K48
         SdCC7/JFEQW/hrnKG5vFyxyP/Va52e39jmXJokN+9DfPXCr7jGM62lxQxpKZ9TeS1C9m
         X8ow==
X-Forwarded-Encrypted: i=1; AJvYcCUq5w7cnzy9cZwpu/oUqd5FfBZ8QxyEtU0ORZwH3lfzCjOURk49QHivJ0OrQBpTxWGBbPlx5szXO8gWPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDHvXiuk6lw9KtchrMJGY3vX2S9bMxSce73eOon1hmLD+5+Bg
	VCSuTYJ2QlXyImplxpynqRnL5shuZMbZMa1PqaDV0OQm3Yl5s5mch9AO7ZjfdAEIuRk=
X-Gm-Gg: ASbGncsuVBaLLRw+zXMIY/yY0vU40+Nwn7M3FhrCuGZ4eKbqUc0t8I8VTOs78d8B/Az
	QjLD7Py76BOdMQRW5kvzTXlNAFIa3Q4mhoUykmbDrqhCyvPR/USBrM3PUOxtvDw4lj0BptTEWBZ
	n/RjvPD2cLVD6c0vvma/FFc/79h2Bqlh6jKuPzKQd6h44aMb+KTfeuNXXwh4XC3mpx91fElVvpu
	EnS5pOPCw9yxN4Pt/CMLTTlzl8S3j0FJ86Qn1kKA5ORzMnAxboPmvs7OtJdpirxDTknIwcg5euG
	sDrF0P6uxHUfqndf847sX8EyI2/CFj1Zc3ORufZg+2pwJ+x7ERgFb9HstC47VhyxSye0eA==
X-Google-Smtp-Source: AGHT+IGCDcDVHp+o6asZzybXhwzPm/BQNSKXNqJmSsNHhGWVr+34NkY95WUCvxFa5Q9CAR0B90qFDA==
X-Received: by 2002:a05:600c:3153:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-45350e7c275mr9182005e9.19.1750087592090;
        Mon, 16 Jun 2025 08:26:32 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:32d0:eaf7:ac68:3701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm151687525e9.12.2025.06.16.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:26:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH RFC 0/2] Add raw OPUS codec support for compress offload
Date: Mon, 16 Jun 2025 16:26:21 +0100
Message-Id: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ03UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3fyC0uL45PyU1OT4orTk+DJD3SQzg6QUYwMLC0vjJCWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AE1K65ZoAAAA
X-Change-ID: 20250616-opus_codec_rfc_v1-b60bd308893b
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org, 
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
-- adsp fastrpc for sm8750;
-- explicitly setting format in sm8750 soundcard driver;
-- running adsprpcd tool with support for Audio PD and DSP libraries
loading support (or its alternative);
-- tinycompress fcplay tool that will prepare raw opus packets and
do the required addition of length field.

The userspace tinycompress tool with support for raw OPUS compress
playback is located here:
https://github.com/laklimov/tinycompress_opus
branch: opus_v3_workinprogress

It is not expected that it is ready and still needs some work. More like PoC.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      ALSA: compress: add raw opus codec define and struct snd_dec_opus
      ASoC: qcom: qdsp6/audioreach: add support for offloading raw opus playback

 include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.c    | 33 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h    | 17 +++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c     |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c         |  3 +++
 5 files changed, 75 insertions(+), 2 deletions(-)
---
base-commit: 050f8ad7b58d9079455af171ac279c4b9b828c11
change-id: 20250616-opus_codec_rfc_v1-b60bd308893b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

