Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964616;
	b=wbnyJ2YH46ZqEbsP29S6LA29oltIR91HIxT55pd6PD2VU1TRsdh7MWHOFLUwYKy4/W+j
	 m7JkiYawKNHk4SgnAVM4Nk6xYdG5HZrVe+DhhbiN+Tk3ya6fRupjP6JBU9fY67f2xp8ES
	 eed3MXvldla7/VodHAVT50DfV/+LlKqDB3gEtSYgKwp3Bu811/hTdiLYTHtONeOxkkzQc
	 yhILJoD83ho9UNyV5Bth4k5XMwjrfFpPgcp035W8LMvkDjch5xnqCcOnK9zqw0mxm/A/q
	 ufepwLg5e6UyXlGs7u9dazmuR69MMvqgcBNgu7G7PXs8cV4W0pkOL84JlI4Rn55Fubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
	b=P19BfDvql6057npUOaG1Tvu3Xtk+1g29J3xldmri6HIFBIBIn6cXBgdd51C6X31xBnd9
	 ZcKbgPnrtksHOhCzc9Gea2H6rKub/QO0TEQlVZD04nWsV8r7CwibOXHnu36Tcnf4dOiPi
	 SjwM6ysMWoMJOgjP5IGT6hxvw71hrIkhx89AI1w149nYDGYlo96L4/cxqSLQeSXQVm/9T
	 qoCA040XF8kPqPWoPKzEMQIKW64IKy4g/YW+6XBUCafbpw4CTYB6ZfrTtR/JJHRn7UeA6
	 DE8jAHS9BnMhtOB7Tp3AWJG1eceUZ/vnNFWAkUq/6aN7Rh48aXQlMWGktaonN11hF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8OZB6VU;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D5606D81F
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17D5606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8OZB6VU
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so254842b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964615; x=1794569415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
        b=g8OZB6VUAn8mhaaN/mvT96SCEyqMkupXV3YRV14g1vx3YBx4I5tA5nRsP07Vhzy5Up
         VPYSF80TT9LI1gG4D4NF9s9jZM1+zvvbmPdEXZuJwWdzl6tv/XUIskEIYdDhzRXb30li
         6mG6m9uF9m9KypErwqGZgYOK86cSMavJEGKtmjdqmnBN9wxmrF3ptr5xrscJKqPb/R4W
         87uV+SHcI/VF3K6DMzoIy/7tTVkU3cw+5en9gvBY9cm2Y07QjV1zGZdBE3hctRWwgszN
         e0PO7C4zqWmiA3t/keBmknlIphMRoPKWbB2XW+E5cVJ5gyFlUuGRYSo+2ZJxBahgqYVJ
         bYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964615; x=1794569415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
        b=ILlpB24p0kyiOJPSI1IWYbF/801xo6VPPgpcnj3a/FR3zplcgL+B5PdguDSDFr2HmW
         jUsW/kRMEkEKKbz7r8/70XXi14GWhRzovc2GHk9p8+X9yHmw58U8RCMieqJ1+v+apl/K
         xqn1aZQ3xfaxOeytjvSCNU5ENHDdeSIQPaagWy322DaRk2e5d2qTu0IqOVpy340bX1RZ
         R+DmW5Cuow+Z+qDTDU4eZZApfF3lY1MCO2AZG6Nscuv6G9EzGf6vq+pslN2EbMThfYF8
         gF84qncm7hh1jl84iUMewLvkBAurjbG9Yh8dZr96Vp+JCUjgYTN8NS9KNbn9b42wB3zB
         p6Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxc5lXve45z4kb/cicxdreH9oMufJWr4qToFsJTKf5WVDjHoEL316dgp5bR27ovTEHLkxzFFQHpKyxU8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZxsOjUQLvzy1NhjPzwTqbTES8xhEndXQiBN/zPOdjY2/wGqbq
	99AzXAGcYEFxr6hBSIWQezcKoc0Kg1u1Q57g06BhG3OxcKnc/RGx1h+d
X-Gm-Gg: AYBFou0Er09AKhyGfwK78XhRI4Q4xZuOVUDVTcL+G3AfrQ5ZnY5rZFZ9tdiLXfi+qZz
	8xVajI5pg6ax4Xjf2RIp0yg14/hIm+jD8D9Bd/z6FRp4UvkC0PCjD3YCp5PNEhr/eq0S66oP3zA
	s+72gDq0+OGn+nZKT+rfKH2b6q4w0MWt0wYLCj52ar1jQv7/wAW/k2Dbw5OAR2iz4jXjD4np2zw
	twzKMkhoYtqpUH9ttnfmwxCpZBLcOBeS5zxupjVsIQKURvmPyWKJNXZIBiHueF5yXwldjxRbiNC
	dj2bwrwUeIFAXPziBulUFjRM9NbH69LI8c3vXTfsSgd5Rkk5pwlrSxVlCbVo/xYLTo6Zf8Bizib
	EEwG1iCaYev0apdgJynLyHnWZG5psew/YaDAcTM76cSRsX0rPa2IU2atZJP0KOhyyk920mU8R6R
	UMHFh6NWgDHQ9d37+1UGLFnsvlUMI5sBoH4prScORy9gCp2TRfpK4s/msT7yIrgKcimw/rt8Fny
	0PAJoNxcgCYPe7abPz67urNigswf82DJxfGw/MNUtxgK+nxm1rjJX9m0M3TXSl9qfTeu6vES6fY
	mFTpUSPBb/SXFnmDw6tVh7uEPMCL3RC/CAnIBBECv2779281hWScSJYB2wKgAnoew/9NskDn1oH
	YeEB0se7mnke8StR9iUjodv7ZntQEhyCxJcsKtBqRyTFKaWZ+ybEXtJJ+yQXFHOvfaA==
X-Received: by 2002:a05:6a21:47c1:b0:3de:570:12a7 with SMTP id adf61e73a8af0-3ebb274ebadmr2230545637.8.1793964615221;
        Fri, 06 Nov 2026 03:30:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] Fix several issues in the DesignWare I2S driver
Date: Fri,  6 Nov 2026 18:29:35 +0700
Message-ID: <20261106112940.53550-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi all,

I've continued reviewing the DesignWare I2S driver and referred to
the DesignWare APB I2S databook when looking into its clock
configuration, channel limits, and FIFO handling.

I couldn't access the document through the manufacturer's website
due to regional restrictions, so I've found an externally hosted
copy for convenience. The Synopsys product page is also included
for reference.

Databook: 
https://www.scribd.com/document/891940768/Designware-apb-i2s
Manufacturer's website: 
https://www.synopsys.com/dw/ipdir.php?c=DW_apb_i2s

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 53 ++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

-- 
2.43.0

