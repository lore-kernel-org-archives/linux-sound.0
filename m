Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384393;
	b=RFievr4WfAh5704tWJQewVzpD13zIGOr4RkzQlIY7SfK8OTGe4TZTyCQCv0LpbFWiGZr
	 +AGTmbgiaFdeI7fTwK3Eish7SCfNQmyWeOyo+7zUPghkk9BoShR/y3FxgAH3tos4V8I1A
	 cx/0NoATexAB4J+9/fc31tMy7ZMX6ho3OOEhj6KpaZV1IuB6jokACVvp9LVkHIMPl+hGe
	 VbcqeMUlRVkA8sdBmYDaJmpk4/fBjb0tTBsf4YZdoaah6mlJrnCCwVr4iGQg7cRHv9Eqx
	 r4S1Co4whaDN3lgda7VaA8CoWnvJTe1OauVLUQG3Qm2Zm+jhdarecZ7WnNUT2C9ATIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
	b=HeWJch3npD91mK+BmwOWgWHQ17K4Bc6mPfHU7uObuxjHaTI/blP9FTMEPTbydHTzUsWI
	 B4upRduepCLsAZl32hNSD/nCunv5nxHnliz9ryNFPt/SLGZVvdvuqFuahcbHCoI8uveA0
	 7f3O9/83GCnpBUNNTM82i+LktQ1hy04K5YEGuBU74sIPuFz0KZ+c7ynIipdc7WrbRJGN5
	 eEWbgm+3d3K5UI1HnPgUK5xGeMDu+Za3ZysP4K4sLDln4wjunaUFBo6HWrZJPO8TUtX/W
	 4fTWVfKzRs59vaL6Y1Prk+d9Bph/Zy2y6NLG468BBowNUfxMKuV5qG283Lwztvpg/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A6606A33C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957A6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2304102a12.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384392; x=1794989192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=bMMqwkz15zAsCxFpsBJFK8CPiZ34UgVDGidaLnh1/POTCZVEOPzM1KZIFlcipqjLQ4
         CVWJHKqlMv3I89aAIh+S4MIwrG2kjrztSuw2NStDAxQufH4CejuPqxndHwUSHEzJcT8t
         yPwouLN6/mCABSWxNqbEbrnZxb+kuXoazui66u4gHIP15xw61h/0GHM1jHouqRIz88Ui
         AU3YhpRHSvtnH4UA3xiP1a+FpJXRNUGyGrWgcBEpIDyn2IeWqJy9c4nlOR3h9GkGlTYU
         v1/nW+B7Gx3q5d62y2JBHL1cjf8I9aX3Yz4cBFe8e+neGeQ4ehw11rKuhdNCicF2J3OA
         TpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384392; x=1794989192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=VPa5gB0lhupQC3lErknlhB/e4fqmTLSQb3GrgZ30TvaiYi9c+u6RyqvwAo4sx1Sgqw
         cpMtgTvPhbo5pBKXOJ5VDe4Z6lj4EB+5ocnUwCTDRDwpplmocUVPOuXDA/lZtK4VJuqS
         zsYKHK6L0nJSzaXSQmkpsnezeFTshQImVKjz6EuyC8V/C9FtBXHT7ya4OMhpxSZm+88V
         hcM7txUvIGSmp9P24te2evVGXrLO0VArdblWdsrTyQYTRmKtxNWU1aB/1kFZsNzX4Dy9
         TdR/OuxzBsMeQ2ApXrFTWkerrfw1lY85x9JgATveqlzLSr5jogQVUVTlkiYUkMtNDK+y
         CMTA==
X-Forwarded-Encrypted: i=1; AL+hErFYPSBa1exzJd3ZsoGXk9mZkkfe2oypbAH5feE3CrJHPwMy4p6xPz0+0igeYGXBThYzDb0EK+rnMtJrAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XUq86XsvF3d5FbTzqXGvZgZyp2Jnff3Xg0BrrjJV+xdgTcPyk
	rdMyXbbDGOM7AiH5kyRppzhpM4CDtSBUX8Uw2cG39lnzZdJQKizhIVZvt1+bsskptA==
X-Gm-Gg: AYBFou1A1bxyXMUHcgZprM/RsHhOzlL5J65Ue5Y9u07lx/b3rTBAqXFs5AhbejIi+xd
	OaSd/Gu4rSFzLMVZkCBBXAcpMP5zjZ7xVJtc9VIL9CKQdrhKvCqkv+61cZ8SH6VZVyf2HZfsiXK
	tFhA+ChPAEU6mijmR9V0pu+I9zEXXJGsXCkP/Fui25SUYG87M2iOQ6MCG9HT3xtTkn+ub9YkUNc
	CHpuuIsdmJtYBmdqoNcXtjqolSERLjMposvcj3LIyNwWHFrwJE8RXdDSnEXku/zFVsK7dqd5L23
	CD8ptmsn6hAQ6l2jd2L5Ib8IU55co3sOq+b9+e3U8u08SsTk7tKbNF67mtPkquDb3CmMwhloKcz
	ZonWsF29MKBxMmcus1ZdVxaxBxFH1xovApDagBa1F2MJVCKrdd5EDAvIR4CRlLZ6X7OBqL9NUaI
	4W07Ww5DA/F50rzJCsPHd9MLwltwvuYfjwxTgHrqi3fGWmTuT3QlOi/Ka7BuZ5SYZJGnq4KCLaC
	h9ImGR7AN1zm4AfTiyapwZmkD1JCWRRAMFgSlVAfMnhLAw/UPVJUlsqSyeSwiBCXKVTmgSKyubO
	KV9hKdsqnNUrpbvQw+5zOgmA1l/CvGEft+0yq/tcOs73Q3Q9aWcVP2xDn81UpHY1812HY//O8Ot
	YZnxvRh6a4TMPR4mPL3FUQS93LhLJI61770pHQjX0Kr1m8A+KlP3eVWSlBXqiZ0QVsFmvfmx2c9
	qwQ20wsJ7ZBypSZg5w8Pq08EFYC79Rj7cE9OtdSnEi9md4sPI0fc5E7KMWycvfvwj/Sxgwjd/Xk
	RdXqg46/H960sEh6kN/HX5prd6qd1NT5wvjHwDzA87nHr6VuygckdAJeyPb+bM9LBfiCB8+g7RV
	tflGxyCfNmEBJHX6Pow=
X-Received: by 2002:a05:6402:440d:b0:6b5:76fb:98d6 with SMTP id 4fb4d7f45d1cf-6b7777011b3mr1253468a12.21.1794384392040;
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:31 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:24 +0100
Message-ID: <20261111080624.244291-3-julius@bairaktaris.de>
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

q6asm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6asm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6asm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: a08cd56a4524 ("ASoC: q6asm-dai: add support to copy callback")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048c368..1cd99a1d5b516 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -897,6 +897,9 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0

