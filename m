Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746146;
	b=LtFJpeT8HWsNHp4DOPGKriTme+/9NfYJKKCM+2XRkRc/xUywyS07ewT89bHtvERiZyeI
	 FoSJdQh3GRI6obqXIXidubDL5sM+yGUXqwDIvAHIGqDsSDS38RPbUvbAW+D4R+IMJlyCc
	 kF7o1p/3eM67YUmAAlxDll6JRNONNOJAx7GQqUSVwddZQ5I2qIy4OtYDagOMvCFzxFYTt
	 wIhKvzJWzHuQK3j2g0vx60zysOsTNtb+Lxug6XQgJlwjEK393Jdb9mzNb5La2iAsJMgOI
	 lPQYeNW0sBM6LRqMEgDGFbbLWsxsPLhu9Qw/07TFcQeY3UEc73POAKXvARfi0SZkxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
	b=JxCviNs965sQaEsNW0Hvu8WFryd1RHmRckEGnHlJagcjFuVv5j2WA796kUjF+dr9sqJ6
	 wOfXSTeD3Bjr0dXUh1WXWxpplsSjVD9B8ELrDRJBnaj/d01C/6XJhd93r/U+suaKVoUwj
	 pps6/Moe7JnMxu04L6otD/xLU9yC8Tp4zxHtFN7Yu6GsAcEMruFFz5AKmX/g0ufiKaD5m
	 /12t1pm5QKGdGd5BiGpf80c7+X2Gh3EOrI6Jma16AgKIFl0iZ6WjXiGbmAXyuNsgBGNEo
	 vDu4vZ3En9/agPuCrr444r1SzA2jRhl4Qjh7pT6bXDFGNfueVH7qoMUlmEtkoSzfQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQN87F7M;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D76606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D76606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQN87F7M
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab98332238so391750a91.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746145; x=1793350945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
        b=aQN87F7MQXRuh3GwO/JJUv+xzm+iQmpKgKGXLKrC/XUjBwb5KuA0fQDSImDKCU/eqT
         tlfM4ZYc5GWQWz6ea+lOF8xTa5o6nXtipx0rdBo7lkkUjP18IlACKFgd2cKqCg0RTJP9
         vLla4zrzGH4bnKvdoGCzn3bY8BWL+6hmdSG72MIZXP+XoYnrQnya7UUeZEjRmrt0bbXl
         XEnJrXiREBht5TTa8AQw9UIPmU5WRMAFgLF3rqdQNmg0d9xEkYOHsvz/8Hq8hVBgXZ5/
         gyKK1NVD/jAtzhx0DCTpFEFESuW84NIipz1r4WUq8paypK1Y3A5ez9WfeMRj7nJiYfO7
         +d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746145; x=1793350945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
        b=tlgwE2bS6ry0+p5gmUTOPNWE3rNLbZJdcHwGStaEcPp7TqSW/r4YVD5cX1KeuRhdZh
         0eebBO+VJ5SPAeWCL3DJozTkovQI0ST+piLKwS8MvsQ8ERLYPb0JmsVgnpiRhopurFWV
         iyWqfELkKZJlfKgZw7/V2JdtbnWsq4A6xV+43/EOdV2WbuwT62MkMZXDRGyVCcSVrL2x
         PS2ZCyzgH/5ggPob+pURMoidgUqEYVYo+UDr2r7Yo/bP8KkaXB0mYm33N9PpSBL4EUNQ
         8aLYm2trM12GKKJhQf2FhhHB4gbkaEx9h/ymo2rOJwkS97TbQI9LNrV47s0Dc0Sl6mfw
         aP1w==
X-Forwarded-Encrypted: i=1; AKwUvBziTj+vnv6unSYCDI4UZ8/90mLqgXIV4A/ZJwZjJUDPu9FUQEPWifCJoXAk2tfd7O+D+Vh5EE049YoTtQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqw/MXL6j+MVWvVl/OCWDt8c9Yg30f4OtEEhyGQWCgbOeI5Vdr
	WlKkuUsvYgPU36REIKPh/4GLohSUOiMiolbw/8NMwb8d5wtJJqIKlM5l
X-Gm-Gg: AYBFou10A7TFVrY1dTbjQPnVZHtwoZNWKMeQBmRO+m25OGt0JIISriS3ZR7MZ2ibB5J
	rfXqCnO/B9dCLaxXn8nMVtJqLlUmJg+dXlT21Gwag8Kr4JqIhsXialbl1RINmU9q5Xxd87BtQo0
	ee/dRBwXp/XPxFQJ95n1pfxOAUeo8PnjXwCxJsQhnEitkwKWC/u3O/IefS3xJ7dqR7/QMZu+iBB
	hl9g+/1b5YZ+fBPI5jTrM2mKXxeG/s/l8Hv35Dv/rT4igE+yVeyiWewdHchz3Kc4AhGDu1sCmOQ
	3P4qJ6KLmByNB1GNeLDbH+u02NVjdsmP0qJ7b+0INPedv4Tnisb50xyXl4OlhJW2SWXSCJ9rUU5
	khfh+6aIUWRBncI6Jg1OiVLtYYUoQSjG49MCzthxRybPmQmp4E0uSClUDIh54c3yKnNZXX0d0jP
	fuU/koyzoels6qfjMY8ZhhUdEXHBRzKyYVAXb3M+rlp8IbjgpJm1AFhI3ETEn5cZkyNgmNuCpRV
	ruhbURCqNR3/x5N3qEOnyzcist2/IJjeIQyIR+kXW7RZds9yi6CcADbHdq7DAhLJ3jMFiO3XLQu
	CMi+vjhFsbN8DBscG71N8fqlF9/pVEpSYdqBYGTPI+yHThw+JV5uu2etQ3jwbRXqHKK67kw=
X-Received: by 2002:a17:90b:5185:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3adce0e0160mr1401612a91.54.1792746145402;
        Fri, 23 Oct 2026 02:02:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: codec: cs4341: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:54 +0700
Message-ID: <20261023090157.518032-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs4341.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index 74544c58a415..be0ab0b128cd 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -83,6 +83,7 @@ static int cs4341_hw_params(struct snd_pcm_substream *substream,
 	struct cs4341_priv *cs4341 = snd_soc_component_get_drvdata(component);
 	unsigned int mode = 0;
 	int b24 = 0;
+	int ret;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S24_LE:
@@ -112,8 +113,17 @@ static int cs4341_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return snd_soc_component_update_bits(component, CS4341_REG_MODE2,
-					     CS4341_MODE2_DIF, mode);
+	ret = snd_soc_component_update_bits(component, CS4341_REG_MODE2,
+					    CS4341_MODE2_DIF, mode);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static int cs4341_mute(struct snd_soc_dai *dai, int mute, int direction)
-- 
2.43.0

