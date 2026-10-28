Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182098;
	b=wXAkHfiFFr2noKGJywZOsdtRu7geTyVJMSD2l4Yr7Tt6S0aVpNqvgeD0n+Ri69aapqTt
	 +YK9kvdqlZ3R1afXHenCcO6OHZt92pj85ExmSqmFTvSsp8LgOJ2bgkxycnokN+48K46Eo
	 Vn6ePwR2HyA0a63juf8zXOspOfrWajJ2ewIBzG8L077Ai5R0Jsvinuz04tPGzo6IRpAkI
	 rT/cq8Xh/ReAwi+mHeAlGqOWvMhYvC6VkJ9yzEsMqUhulHMC5hflkEOWiipoSSYN2Yneb
	 hQ89r6s9vfopW5riQ60FmiXgKhRez9ZmLmnqY6MWt02VUrCNVIRWkaLScVRMS4cS26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
	b=KDW/NFrxjQMyHMaEqCeAa8N2XIBpcOnU9AN2+ZYaFxLbsCt1+b/ZNS4/HGD88TbGzBen
	 JkOYZVuEvJY/XKZcAWr8Gf3Fj4sES/iUB4vtjheOREDwQBwnlA9eNflM3SfRacX9CFwOT
	 Q/KBYxpo4wnlwqTi5YW5m9Gn7GoiZPaJo8goQunmQ78X2cBR5WBEoL/pDqN5VdZVtsaab
	 9GIEsMzaYP0Ah7xfTk5aYHIuTwutOyuAtZdl6Jr2N8GfNvaVYGZTb8j3iyc47Odih5Ft/
	 5q9tJVfgFFeYZ4mZ71GBgqTAY8Dk6GzCYc45yBh84ZD7YzGGMnopWslDIpm5ENx8s7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001F606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F001F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c43fbcb4393so114111566b.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793182096; x=1793786896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=fm5lcbI6HWmtkh9Xqi1j3jnaaS6voph8kCnlEwBe1SCnkbabeBPmMuJpSo1VegBOtw
         BhQ8Da6SN/mWaauLGWaxGNpLJLFplEsrWJjxMdrNhkYlQb6JWgKpDDf8DdTeEjy2bywq
         HHoqdJIwr7vWjLSjeAKLCMfolPdmnDmZQyvCrKWJ/Qg/pOdbcf3/qODTdfDy4+Y0Rdd7
         xCNTRvfZvjSIhUYx92qhPIaZ2uBX78rYlGPKxuDZGJWn7nM2HSzx8SUVQPzY9Yptcz2h
         qzYmmR0+WR11CtD3JKwY1NnBZqi8TJdacgNZqh8yeEhz+6uMHlZGMkEuX3WYCq6ItJmF
         OUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182096; x=1793786896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=bbcr6CmfOOU5w0X05VNcW0i547f+zjpwTLqIS/R2AELbLWvAQ0AGW2EjwphSgK4PyV
         9m0RFoVuAZdMhiAKO1pq5qR1jUPuHkIKiFqNj89gDcAyU3TOUtpn9SxtNeGx1ks6l3g6
         Y3TVnYaRr8yVQQDlk7NLJggPwWHOLThplovdHALo14q4YdVGomPXQIjNkDDzlgw8vpsR
         dZtiB+d6bk/+NRODWZqrG3DbxZXLqVjqq9CqGUn33R2/RCgwBd8zW83fkI3EyNBRJ+Qn
         WVoqKokKGjIby+Jip9gYIZOKaUkJVUHJWdkN2mtyfZW01R+ZcC8pqdt9HI5N04i0r1WK
         lKOw==
X-Forwarded-Encrypted: i=1; AKwUvBy07hH++RNftgyu5f6X8M9p8d8lb24ink9Sj9FMVSEyJRbTIth6k95s6zSmiWhVTyh505hmC4txIf5/8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUilQUlqVTX8yZIb+pr2AHhSXg6dIcstsjMXnF6XDCmBUKRbAP
	I1TzD4U8TrmGu3Kn4SatvvefOYaf1YcK7zLwKnB1dNFAA0hLcHdgwlGx1YeqoOva6p4=
X-Gm-Gg: AYBFou34YJnbLL9jMAf/7yM+tbfaZ+pXPw5ur1V3MmNG1Xn95eBC93Fc0xywGxXsfMl
	f2DgmeuzegF1GZ3kNk2Ny2zWz/HETgi6eylR8neaIoUTwuh9kg4hU3uWvglgOKqR4noW1iW4uf5
	O5RYIXTWTcKF0sJBYBfalpxivvJrasJm6cZFvc0y4mYs9gI5ji5u29jvyV38N9plqXs600IwQIu
	UyqB1vM5fqorrqa9UhZZ3E+ZmpnD6nI1CDL4NLLTG8PUp8/v/PPgaOCL0X4+0Tzed2CAVfQvu7D
	p3MTyDUs3sUIm4ock+C+SB5XjNtoZ/m6SL/6aaJBXJA8zbslINdaUHCYixNPRweqBctcsrkK5DS
	0x/LxY8AH09UUwBCQupBXHlf9GgFBlv0kQpTjsdEVqx/fMv9MrijXqf10jXjk726GDNSRSGKZPK
	RsfOD+AjpCZJ+KByZMtPixKXNRLHXCLSb+ZNaPkm7a1+t28DdZk9NiwAi5oqpG+Aowhn/XbnF6t
	ukqooptEJ709srHKbwPySMMJsTG8XgA9+EizWdbRO62BPYafC8zZ+RLVhNf//NWCJfnYX6oYAQ9
	y8VjKIRiknSMS4QRsfjBVn07rLE4HSWs9ja8q3zxthBli9Hl4+kHnI0PaWVJRgvo6YsCTcSOFgz
	Kr5v6uCXTUFpU4Y0ZBt9hyyAn1zV78ot9Csq46tg+8xuBvBvd
X-Received: by 2002:a17:907:3f11:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c49bdf2b6ddmr158720666b.9.1793182095755;
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm588434366b.73.2026.10.28.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabian Renn-Giles <fabian@fielding.dev>
Subject: [PATCH] ASoC: qcom: qdsp6: clear stale channel_map entries
Date: Wed, 28 Oct 2026 11:07:08 +0100
Message-ID: <20261028100708.6808-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
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

Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
channel maps from channel_map"), the codec DMA active_channels_mask is
built from the non-zero entries of the channel_map instead of from
num_channels.

audioreach_set_default_channel_mapping() only writes the first
num_channels entries, and q6dma_set_channel_map() only the first
tx_num/rx_num entries. The per-DAI module_config in q6apm-lpass-dais is
persistent, so entries written by an earlier, wider configuration
survive a later narrower one. E.g. after a 4 channel setup, a 2 channel
capture on VA_CODEC_DMA_TX_0 keeps the map 01 02 04 05 and sends
active_channels_mask = 0xf with num_channels = 2. The DSP rejects the
graph start:

  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais ...: Failed to start APM port 110
  MultiMedia4 Capture: ASoC error (-22): at dpcm_be_dai_trigger()

which breaks the built-in DMIC capture on the Lenovo Yoga Slim 7x
(X1E80100).

Clear the whole channel_map before filling it in both places.

Note: this is my very first contribution to the linux kernel so I
may be new to some of the processes. I apologize in advance.

Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps from channel_map")
Signed-off-by: Fabian Renn-Giles <fabian@fielding.dev>
Assisted-by: Claude:claude-sonnet-5-5
---
Tested on a Lenovo Yoga Slim 7x (X1E80100): built-in DMIC capture on
VA_CODEC_DMA_TX_0 (MultiMedia4 Capture) failed with the DSP error above;
with this patch repeated arecord runs work. Based on broonie/sound.git
for-next (d34a818a331f).

 sound/soc/qcom/qdsp6/audioreach.c       | 6 ++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..4ac65d9b5543 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,6 +308,12 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
+	/*
+	 * The active channel mask is derived from the non-zero entries, so
+	 * stale entries from a previous, wider configuration must not survive.
+	 */
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 83f2711bceea..12f139af8ca0 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -99,6 +99,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < tx_num; i++)
 			cfg->channel_map[i] = tx_ch_mask[i];
 
@@ -123,6 +124,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < rx_num; i++)
 			cfg->channel_map[i] = rx_ch_mask[i];
 

base-commit: d34a818a331f7e270fa9dc3db3d96f6a0d4fa7ab
-- 
2.55.0

