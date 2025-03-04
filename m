Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B51FCFE7
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085873; cv=none; b=EzEsSzg8dFLSZui0hAlONGNJ6OVpq72p4Vq6dS7dDbny0nHG0gm8rV1EvEauw+o0KduYPsbEimO9itorrUZ+p75Wga2qcbPI15Tkbq97++smEhgaPU2BNSmhIuhf2y8ml5iVkHpNVegnp3Y6l6g8a8oTd2sYpK1AMM6QcI0ftPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085873; c=relaxed/simple;
	bh=n2UkKVPrXqYPJwFRJJ5cSjNwsrOJN1CW2qj0tohsSrw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UilxCxw3pvP5Q0bqNEq5EqsgnB+7allz4uosZZc7Mjo7i2u/Hkp5/SNgKyPlJPtYqtr1Z0IpmkdbeoYt1stDc0TzT3f9a/gy+vnGRKvt65+83f8bs44Kwy7uHtvY09YgdbpDXaUz0+DEjnvl1QhgBCRAfR+PgaVfai0Y8VrF7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlhqEZon; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlhqEZon"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so8449301a12.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085870; x=1741690670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDU4rmBFIHbrSxk1aZkGu1FGzrjcXWe5kWg/s6z9WeE=;
        b=ZlhqEZonxpc9u+Y7JA7Zz1Z3mWFgciPJsGf6mustvAIKdwwc+baJwD+JZCa5HaAiPQ
         CLKsCWE9KHf8JgHVZ9CsAu6IbVVvDh1iB8PoVsZlXBo1dNzbjuL/2VM7QzWqXpSTTOvs
         wPFCf05GmfrKOnKRGpWA21C3Qi0uda5TRY1kid7cd/akh5iCI+vndkXW/FDdJuraK/2W
         /U6imfLO1DPF4iz5n4NsA8gNdP7YoJKY13HIvwe4Nnf+Xb/XMVWx7Jvj2pxQHwlnr1Sd
         jRfpEELSQpstFpTVi+TzWQsflkliLw9cJKvGZWWtyo5FIHGkhHyJyLM8gjAfstlsngZb
         nSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085870; x=1741690670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDU4rmBFIHbrSxk1aZkGu1FGzrjcXWe5kWg/s6z9WeE=;
        b=BBV8L8fp3LYwIJ1FTCgeWBZ4Ch1cJT1mtFcArNFxXtnLE4JIJ27lizth/Rzuc53/vb
         vfJpkyfhDv3kZMbv/j/1B8Q9Nwp6hz3eRDMKhWrbe1bzi+3DaaR7ga8mYWgVOY9YW/Uo
         J3P7ZhmZ1iAT6s6J0MsQ5cBp1p/wDusZBOtGDPnxKUntIv2cmNILcM3j1XvMOWeLBSbY
         +MROcO1OSDjF8oYP7BBoG9erLcETmFdclUkdcBpjhWws5cb4rQMuGrPJvQUw3qcfk2nH
         A90DghKuDJeSlF46lodzXwJTXudxPXAl7QnBPAa9nouBjVRMkK/vuvDhamL2cKah5I1w
         Qmtg==
X-Forwarded-Encrypted: i=1; AJvYcCW6M3tWU3UeV3ASqy3B+PYqyNlnuf/Bs5RlQ3pzruCAPUsB9r3Tf7LmVI49fF21YaI+kPJf95VpLxSJVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBe7P84riNMAyscoH0Ex8MB3XyBj3fh6bR9A6OnJAFcWRxwJL
	i8vFq25MAEughRJWiQ+wF/xUrGkE2DDMekrytjFU2GS6j+3dtT5j+N/Iu1H5LRI=
X-Gm-Gg: ASbGnct/iG/C0V2Bcib30QkT6iClSpHgF+QoT23Xn7C9fTq+8JVljd3uXspBHDmq+Fj
	OdSShtg/isLEwC85c5/dAavtQDm5o8WEawlIaT3NWBQZMgqixRp82//uS1FBvNhZr/DNsBdFm0k
	4uzxZJW5BWsrXkQLQXwM+ml6KtryPBD/u2+Bwq6gqRmoZRom92iNUcmttGrB/CQ+ohCsqNC2YDc
	49Beq2nYSpC7RMvrF9Wn/hnMCGeFxoZ+H3/f21SWRKl/hNCo6s1jMCDJIO3W3Uz2bIkDlTKND8v
	SAsfwK0dw9oEoxGYsR17+HC+uSoU72xmfW9unla2skjj8gGLBSXWUb0/KM+/fm5x2nNB0Q==
X-Google-Smtp-Source: AGHT+IEb0GcLCgpBn4DBHJjLz9lM9L+RwrbPgXxAPm7l8NYpXStBAnU1h8ujrhg4rzG0gewdQBsjcQ==
X-Received: by 2002:a17:906:6a25:b0:abf:5eeb:6af0 with SMTP id a640c23a62f3a-abf5eeb989emr1170917366b.18.1741085870210;
        Tue, 04 Mar 2025 02:57:50 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:49 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Date: Tue,  4 Mar 2025 10:57:17 +0000
Message-Id: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see Audio quality improvements.

Any testing would be appreciated.

thanks,
Srini

Changes since v2:
	- dropped patch which is causing regression with pluseaudio.
	- setup period sizes only for capture path
	- fix underruns/overruns in dsp pipelines.
	- add fixes tag
	- add patch to fix buffer alignment

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.

Srinivas Kandagatla (6):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
  ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
  ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns

 sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 3 files changed, 53 insertions(+), 31 deletions(-)

-- 
2.39.5

