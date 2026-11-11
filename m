Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384390;
	b=wvSvLFctS+LVdxXG5sLtbDhz63x6GfhO1f2GRdUsaAWMF23B7874LUbQIDTUozNmtHSg
	 9dMjOEX3lBtxcAE13dU1pDhHpkPVoVVhm2iRxSUCyhiPRDRG9yxwPHHz1/VbW1afbLOrf
	 IxxwctkOuKBoj8DoXeuKFrm921vvfJeElmaf00VSQmwbzP1hjI0Ok8yQiWk+OvHidoiQb
	 xnQkAUUfMlnK276NUM+VvEX5eb07NwYxEv7ysGRedhatsnh7CKZi1Rfwhci2J/cFct2N6
	 Hdcp68c+QvesrofVgoSSX3hhXYwtiIw3HAEdAUJU10lFGjwCaI2OhZ/b00uVLiZ7cTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
	b=i+QrD+dFM94iS0H6FNOPnr06XITxcxQaVKkSKJbZLWz/uLEvcOs/fyhOfCrvOFcRNfWw
	 194AB+4NuKSdKeK7DnGb2oz4jWR0qtwr+WxEcxdB8T2vmV6/OUPaDyU54KH1hpM62nlhm
	 dy2pHa86jGzTmEHJ2Y9Nc+rwyrUa/jghMX5e2mNjk0D/ZjgZKYFiC+tVQZIA8x8KQwboM
	 jlJo0wxqMZwKEY2Iu9KRFyr3HZYNOIs8YDiIEcMA27RaR7Tk1x4CMpMWday1F18SKvJUj
	 mFyvLtVX6G/vUvc7jkKZZPKSbdCMmb7ytupiL+Qois937N8SxLhIAtEz+5bOzo63PuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE760A263A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 08:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AE760A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso3589753a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384388; x=1794989188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=b2ri6zZLq3enGxYL08H8xb/TtOdSWDeVZMx4/rE2VCBd4WTVa3wcVPgS/v4aGiZnQk
         +mM8g76WGQl+uZWm1oNQj8NQ82MIsYZmwB05aik8TWMl2eLTuOCEVoY9lvhNy8LGp3RM
         oohwhC9bspeoCfvbLQxFtk8cdyJb0o8+WDxalC69Tkf4YCheOx/Rhumow4Fdl2ENJa5H
         m/NbPYnlWmtUwfc7zKJxYcaTOP4VugExQjHrbaxbvdG6JlFqD2AMtWpRySWr4XEuWiac
         wXFCaMGqRvL3WacMtZX3XcCYZ2HX+F19B2ZAOoTftBANgUK3wbYwGooVcF0/ETOsKnFB
         y3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384388; x=1794989188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=jTTz6f0Xq+Lv+DAmp2EGWRyr+fDIjacUSEBsIotbBaokQyazx2h3aq/E4ez7PLqtgs
         K85heOZacZVRfCCEyIS/3soo5jfQNsoV4t87sXUDHOQENWY8agGoEFE4M6EnrTiOUif5
         MpOyjsPWXqHlRQe1pYlQqfgp+CV089+GsGXl+OAO6Gj9Y6wR8fh+9HvWpf4+vdlHX8bj
         YiMFPokpsvCaRMdkvEWp1/oGyzbucVg0oijlE5SWJ8TlM5QMzNQJQrN0fUouw8ajy1mL
         QIDRpK5H/wcU9LfD5QuXaKWbSyYjr1ZrUsMUQp3lUoEKEq7XP7MFRA+zMsz2Q4GR3d7I
         GXWA==
X-Forwarded-Encrypted: i=1; AL+hErF2OKL/1yf9wUWv8ve2wY7FRm78WcpL6P9/5qSM/PsGhJIqVOS3B1ERycgc/PL1XgGp0Vjmob3fj+KeYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MWakaPtHev/7coG7L+suoHQJmwcjFzQ5o6gYuSoIOY16w+xT4
	3g8h5ADju1aJY01rir3QoqiSIeS+C63P/l1FRX63AinuqkmwfjHX0j71V2hBZ+kXug==
X-Gm-Gg: AYBFou0iVLRtfwpZQU3kbrSCPBACyg+1KHi+jDoMpT4YvZrxbzLfAEF8A8wris60Z2o
	85zVviAge/wGHPsrXk2i+AHMfE+GiaMkyL6UPdVkkBN42ozG1VquHz/T9WYENcQyJ1PgwEsre2b
	vmOKEvOYYOu9Vmk2YtpjyU0RD5GTJl7BVTJJHAQ79Q7HBbBTGh8TOnq58VPJkAog0n/bSMLbzjO
	mgpklXJQ/0RF7Hk0L5E9bsxwY6YXiWvxwX/WRLkzqKQxhH5V7dEncFmaY7KR1wOkl9h/Mj+U+SP
	jAak5VY9n+QKQYwwv27FzypWWIIMb61jJJo9qDGsyvuh86t3zDleNMAVaOuMaQt9K92fl5DXORo
	lHByKg0jCTowiGk0XzH32qcWizKeh+bCrP2Fgk6BCDfzWNo07qKT8+IKPjfXl/fa7qTAh+mEo1y
	DEOWXQkxJMebr9DDMYd6wBTV/5vpFh9iy1m+NzOESquUZOJpUabcPH3v1qzEN/CLrKesrk1rGq0
	cb1xrB9evqMHns501IbRwuBzdgkZ7NePhfhwZvytw2FtzHejw7BnKUkTOb5LX7DaAU/oC+qlGwN
	phgkN6BKqnXTb88rsaRUFoE65xN8DEYgrjJPM7ALd53vJPAPPG6m3nPh6Ce2/82belx201jixeH
	ZqKvtFK4DPe7bXmtie0/tyRujPK44B2754jS8mhbJcO37uQoHzjhdS0lzfXkt7W1elxTk4ym7fJ
	4YGmHAQ4ih0bhkRRCFyLJeVa2L7TJhVTHIGrm7W9nFGjoPGmGrm9S8QEMJJn2/jHta0xVJUf6UP
	VjMsyCjGUa7lRTfSzkekPgF9fvuImdf5bfMPzIgRtP1ry8yfIPr3qwgSI9sAJ3LUT3MEmpEHy58
	nJ3Hg1RocX3OdwU18Cw=
X-Received: by 2002:a05:6402:1ecf:b0:6b3:c0f2:eccc with SMTP id 4fb4d7f45d1cf-6b77780edc7mr1263629a12.27.1794384388193;
        Wed, 11 Nov 2026 00:06:28 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:27 -0800 (PST)
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
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: bound the compress ring by the DMA buffer
Date: Wed, 11 Nov 2026 09:06:22 +0100
Message-ID: <20261111080624.244291-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

q6apm-dai and q6asm-dai allocate a fixed 8 MiB DMA buffer when a
compress stream opens and take the ring geometry from
SNDRV_COMPRESS_SET_PARAMS without comparing it to that buffer. Their
copy callbacks place each write() at the stream position modulo the
ring size, so a user who can open the compress node and asks for a
larger ring makes write() copy data of their choice past the buffer.
Each patch rejects such a ring in set_params.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA
    buffer
  ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA
    buffer

 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 2 files changed, 6 insertions(+)


base-commit: 20f1752b9241d300b42cd45a07e22d063bccba45
-- 
2.53.0

