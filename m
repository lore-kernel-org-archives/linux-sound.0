Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384392;
	b=K1CGcVO+HSq/TXnjllUJD1WoHMt0Mm3ppwUSX3nCLze32nzGmZe3hmPo61ZYp9LlaVAv
	 I6uuDKIqfhbNELVwYFOM2B32+kCscsP31CikqvSbtScJMpiVA07Q0Rwbd36NwDA+kZzXq
	 FCydG7pPWekoURE+lOP2FJDanthR57Wq1WJsmeqs8Yju0e4BrRn0OPOPkmyPgk+fP+8GX
	 MzKji1MXRKs7jpesTzRM4YVb9GL5iFNWraUIFJJbfgIU7V4EdJAVQOlRN8XJ9TjMP2VF8
	 Jb6mV5YONYFTfV2c3e+t4JJJ2xC8pzC2t+G4/F2mlNUp40AKaSyy3In+WCl/Oyt64Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
	b=ZmDLmVcF2lubF4AG0QmhRxuHw5s2KJynH9oPlMgcA8WNhz5vJXLGCah0v6z3dmM2iS83
	 eb2DNQVufL97Yc02WVKLVMciJB73+dzuNZt5bBC+a3MoAyXeJ++BAFfW2Kqe4rtJaOusU
	 wMu0NadjQ4Up9wfwTzlaY7h0PUBm42umsTcWkBguAANoLs5pDhxOApkOpBA7LBkRCpAM2
	 +uwC5A+coFvb1uM42xL+4fZ4n+jgRBPHGcQCpO7PAfoBEYVPzwDTtmdJoCQFJRvu4L4Zh
	 nSgRWI9BpHZF1ENgtpe9k3cdLgBw6nh4D6emsmHp2Aq/fhspKepsFgPvRLb0y9pMJIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1E60A3813
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 08:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B1E60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so4186958a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384390; x=1794989190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=mCt2JvyhLbIgpcDDRzYJMS/AVmNFEiu4KU+zCdVMvmuuRbKRK9epQhkcBsuUpfxDku
         Jl2L/qrw8crgiZXeHafeJ5vX+QL6NhB/HdVNPVl/HKAqBtQjQcisV9PtXjjPwzs+6l46
         pTTPCwYWrmThkGPUqw0iD/F+Hxmncx1huTBboJhQGIrVCKPn/H6lD1NbnWV2CnOx/DOp
         GYnIAF6ZszzfgUiMPIR9qgbsH6E+VlmQFixUIWgIeDFYra9fPHC4yqK9I8UXp+jQzK+U
         UTcqxm5jaAR+EY/PspK+eyYnhc3tRPSFzxZC3NXOCRb+w/9vCvBvfTu1i21fBHDouQ5o
         kS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384390; x=1794989190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=pKxpAquxYny/cqCKExsCxg1zN+LUdkkeFIiyc9u0G1BWkz+u1BdVC+JvHBhkClDFAu
         myNskm5nulRaiuQJ7PEP8ZiNDz4CMnUkjkI94lxg5sBg18PjGicXOVRmwjyxVHQtGijH
         EId5rnjMkDw/m26rB0/FW2W9a9ygyclWb0nqbFo/1Vy/4f3fwjWNrj9LDFLvEFAQhRpU
         oJEogj8eJfwifRJMm3+KdVGusoZr+rBpMFxDgzpEq5n4c+Pq0JqMh46ENvv2qZOcmA61
         eaGGrWG9U636G3v8GccEghX5N+jQcySU+LKcmfXLMxYTBZukMKIcjpc7DoszhaprXvTk
         peig==
X-Forwarded-Encrypted: i=1; AL+hErHsAt0KDrb/izF+ENC0zqm2WxP3Bmz6oYl3Vza94+KpUPeQ/Yytwmk2XG3zHZ7skpnjw71L3/cm2HBiWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CDx+fv4hd7z9UCo8LNp08QgJprBaEWx9/iKkgdcgq5Gx5zF41
	5+CdoqPof1Lia3oQ4efS4FMd6Awid1EnkM11RUW2h+4HHr+eSUVrjEBeN3qAhCVLPQ==
X-Gm-Gg: AYBFou1REW0TE2NQXad4WVx1qfIuVeVnm9UnFL2GRzs/6FELF+qsQ8T+rzROQ/u79h4
	xk6yfS5hpGxr0JzgI0VSX6Y9ykscyBcncEAsTy0zO7wYKvhuPP2Vdag2Gs2uII5EK/aacfhQyAJ
	l6tHm91sN56i+LAhKY+M1UEgpvTVv1cQvCdYy8gSGNA2eBnXOe1+kGPVWRUPrCQOabkTaOBHOcC
	EFmoweHm+awSHUjl5lV1gOPnmbfaA30TqlIBIoSzFZneMwWFsdiv0Q7E2JQhQrYb0EdL47yOkD5
	JQX/WikWYbbp4lXloHXmCaC46tk2mvB59Rts4ENcRe6jStTZmhIHo1t0+qSIeQ3QajbaUMeGhMF
	3St+T2LRE0sE8ox2JTDsKYFBS+X9mfhYLTk/rlucjeWTzd1MyA/fU3CTrAgMlIGNVi3EFQ6EJGb
	kNYVq5Bf8YSLP6wtIGcs2hobf71/Nb1HLhrsFckkJ2ZjmV5raA/QIKS1sMkj+i5t1JWpi7tsY7s
	Lc584Mb7QQv5YhHGSaeneKKx08Pu/PBTo1SAGpzCoGy4CFYI4GZR9WrtGD6Jo0YiJlR1eu93uFg
	RSNnGfN1zDcKqZe1GGlIIcBDr7bfKGZOCtN4MQTqJza96hP09zbLM0z7L5LNrc7oCIqiGJeETRF
	2F70zhUAohT65d9kj1xQi+J+S41bx7IQEvjsaxiu3pfSHR8JnvY29bya37nPjR8C7FXOhXyJHjV
	iDsMhCOXn1VAYNkRRHNqyYpuZ0kXOXu558y6SuWmwhsF45F79+AkwR5mLc31A0ptlvYjXSZ2F0T
	uKDcQI/NkBcre/gOVWB39MVPsCvrC2cpkJ5on2iPYyp1xx+PqnMz4TIXFmCiAr+al4CoqN4PyEA
	rWruThMmhivEGDclPQ8=
X-Received: by 2002:aa7:c0d5:0:b0:6b3:d0a0:39c9 with SMTP id 4fb4d7f45d1cf-6b7773e790fmr851218a12.6.1794384390543;
        Wed, 11 Nov 2026 00:06:30 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:23 +0100
Message-ID: <20261111080624.244291-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080624.244291-1-julius@bairaktaris.de>
References: <20261111080624.244291-1-julius@bairaktaris.de>
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

q6apm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6apm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6apm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: c317d148a2b0 ("ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9ff..80b837992b429 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -990,6 +990,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	if (!pdata)
 		return -EINVAL;
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0

