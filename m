Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC83B7B66
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783368; cv=none; b=dqf4TXtYUs/WX8/VMf0rnMUhJt61UBUqC0rZ+sHxSXfvCyrQ4cA97u8T0JXWT7B+zSgHS1a1EjH6ObxPONOgHGTO6TlYrOdyHTTAtVts3IB2Xl9dDakO/2G/B8P+x8BjMJJ4qCLk1jkXc//mNAPQp+2LawhV3xr6OC29F8OXGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783368; c=relaxed/simple;
	bh=odvSwbtTQnAXEjtWJKARAeNkURKvEgQfIfjp4lZx0a4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lwLfFqH1+tsYuL0gfCsXHtbXuAw9vgNFRicA7aRzHlkSAqz1X4iTaiYxH6YTnzayKxyZyrn0urWqmXuf5FzJqzk4xI14wEuHm4kkUEil0GdZRjRch1GTRaTtPBf9QhS1/BPcd1hQKoH3iWh5hwyPB+F8dtxQ4+XTzhrCbXqTaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiTzSyHB; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiTzSyHB"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so442790b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781783366; x=1782388166; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=myHtXATsL0gzLq7rbAOB3XWead1qGlRenokjaLXcPr4=;
        b=UiTzSyHBhVBrzrN6g+cwtnSWB7QRUA1byEzT5w6+dWvIBGkgOFmhQCMP0MlgmCPMAa
         Lj15dwrrLHDHi3af3bxISAZ7zfeOvSsCnpMOhQjkM5epNQgKDpfAu6m8FNqIfzcA9qxd
         FKj6TqTIfpGBWvT4BnokEYY98KShM3bO0d8r9PYDcu6DUTXirfxVYHQjZVPYdYJdbWS0
         XWUGu1Bynb4CAozXCelv0gzqY0r1kzt2O+pBpLMBR9dOUHHggINI1mjb9VL1kKvYyGE/
         LWbEB+XhiLO1i1WMixfw+IMVIS/XxIs41wS4W9RbzUkVWnfLT0h/YukV7l5VSBCAUiYd
         nRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783366; x=1782388166;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myHtXATsL0gzLq7rbAOB3XWead1qGlRenokjaLXcPr4=;
        b=CNzNi9UVgEnC0QqL68fye1f/SfENcIrDNLKvvZqTMAqyiiBquFsiqaf/Sjam6qcydu
         IZJ0ZLBHghmcQP7hxe8vF38bxAzW1TDsWVHxyUwnDp5ZtqqdMemUxhm+qpheqlD5WQMJ
         UJ0WrS9bUNiGiXcBdEeXEB8ssDzXEmYVRBYSrnS7UwyD1Bx8aceJwbEyr/Bu5LEdWKQh
         OlDBSFcO0qG43/JJ4NIjAQLnYPWAii+DmlBmcJ+FtSGpvDBS/e2BBTxZIp+Q+65iJ741
         zPWx2MeJNsgPqeCzLKXf+OpriOA85bfr2xryhADb8gdFZpzrYJ6VbC6qXaoQ7gWUntZl
         SomQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vSBejZ0NkMcvfgcuatQRwnnmRdzhyCcd3Ub1idtbeVG6ztVHak5asWzm6AxB2PPqFbiLyn6i8HwVsJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMgkvoxMxPAqDNLO34ZIe7SDFEStdSKv7v9OgDee7zTnYY0oHI
	Wt78srdm1wCP169wGcBHoMZSNnLWrgtvve5nq53y27rfkx0EMIi5UYdd
X-Gm-Gg: AfdE7ckS1Q8sl+6jLOdF50iB4DggVl0uafJEA70+Xfu9e8mW6BuIHiWjt1rbFCaCa7I
	wGF5DhWNM3GqmfBR2lugwvzfEofs71iYrA0ilLyfqTiCAmyphdqhD9fSyYixUduBrPp2GeETqLV
	Uh69C/cHIPVew0rlMnRTJSb4veRS/YlR+Mfz37HIWSDHAZyf1QJq8+pRwR2+gUbFreOF4tYEzF0
	U+XkIXZEJcVoGwNTgr9gGzMhEdO8lunf8FJG+914zbz5QTXGnIJhzknD0Csnjivcmc+iy2jU07l
	6wxfrSeIWDwm+zUsOs8Yt0b9S0kJXOWk9WeVNLHV5R3xNrrexAn5x2RE5SNi/8I1h3PGKTSnlbQ
	b5fbZO2NgjjH0dXVl9bmLRp4UuFuzghvw4xR1UmhP8GrXPkrBUv081KE3ZS5Wt29gij4vZsF5DR
	GT4zOgzfwyNW8XXKICDI5th3PEdJ2ci1a9ii6ZMQ==
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-8453af3a5f6mr3574699b3a.4.1781783366078;
        Thu, 18 Jun 2026 04:49:26 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453a8c9770sm2568802b3a.40.2026.06.18.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:49:25 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: ALSA: firewire: isight: possible out of bounds write from a device
 sample count
Date: Thu, 18 Jun 2026 19:49:22 +0800
Message-ID: <178178336260.3522027.4315665976901311151@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

I think isight_samples() in sound/firewire/isight.c can write past the PCM
DMA buffer when an iSight reports a large sample count. I would appreciate
it if you could take a look.

isight_packet() reads two values straight from the device iso packet.

	length = be32_to_cpup(header) >> 16;
	...
	count = be32_to_cpu(payload->sample_count);
	if (likely(count <= (length - 16) / 4))
		isight_samples(isight, payload->samples, count);

length is the iso header data_length and count is the payload sample_count,
both from the device. The only check on count is against the device-claimed
length, not against the PCM buffer. With length up to 0xffff the gate allows
count up to about 16379 frames.

isight_samples() then copies count frames into runtime->dma_area. It never
clamps count to runtime->buffer_size. isight_open() sets period_bytes_min
to 1900 and periods_min to 2, so the smallest buffer is 950 frames, about
3800 bytes. A device that reports a count near 16379 makes the copy run far
past the buffer, tens of kilobytes out of bounds.

The sibling drop path isight_dropped_samples() does clamp the count against
runtime->buffer_size before it advances the pointer. The sample copy path
is missing the same bound.

The controller does not catch this either. The iso header data_length is
DMA written from the device packet and is never compared against the queued
payload_length, so a device can over report the length.

The attacker here is a malicious or faulty Apple iSight on the FireWire
bus. The host only needs the capture stream open and running, which is
normal use of the microphone.

I reproduced it under KASAN on 7.1-rc7. A count of 16379 makes KASAN report
a slab out of bounds write past the PCM DMA buffer. A count that fits the
buffer stays clean.

The fix I tried clamps count to runtime->buffer_size in isight_samples
before the copy, mirroring isight_dropped_samples.

Does this look like a real bug to you? If it does I am happy to send a
proper patch with a Fixes tag pointing at 3a691b28a0ca ("ALSA: add Apple
iSight microphone driver").

Thanks,
Maoyi
https://maoyixie.com/
