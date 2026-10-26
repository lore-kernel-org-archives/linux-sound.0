Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978717;
	b=IlD5vDzFhYWIvVkFORKFLyqcvyg3Zldmn2rZR2fM3AIdEun6WTtUMakmAf+EgbzH86nX
	 aFvMsX2gOEQ3UbzlbFFkBAS4j8V7XsnjQQwQDcj6mInb+2TS3oGUCCB0Liknxm2cahKol
	 3oRlxkELOeA8wYTP0BRCpphAmYWLZ1iXfFlqCEIuuSIuD0dPkj23NNgwx/pNIaZ0d9seM
	 ZH/00r+rY7FLUOS6gFQwM7i+zbwe3mcf1+1DYxvKSuC0UDnsyyRSRVhL7fd4/aVQhTORJ
	 tCubOgdBD7cLtNyyPcBt6XdZlFIIPAcTzIFLZLDreNGExyiPcVUwMkxtkIIFq4bYn0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
	b=yoGXYJYZV2N8MtCHYsvfzjhTh0Ukjg91SQFMbqVJYBQzQ/cgVqy2GTGNdDHZpB9bsUgl
	 P14lmlfjqjbzGFSRy+G1MCqLVn53AQXLLbCkBdYbrS0gc2qy8CZqshOuaxs5NQnqP3eX0
	 HJ2QID6tfNi5QY+M//FPsTQiDKb+c8Wkifm5Tovhlh9EaNi80buWOTX/Cq/8IRUxOH+iF
	 G3yu0lx1RH0mUNJAxpC/o+TSh0tYA3ZMOwvPasKyvhEs9BXTpRiJMhfRch+/8+YPOODC2
	 8IdSweMgxWHQnoT4eXP+NFj7+royynYeVHVXxUV8nwFqNXp55/5Xjc7zc/cXT8ApBsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkWh3yVl;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F35606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkWh3yVl
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so21015315ad.3
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 18:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978717; x=1793583517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
        b=pkWh3yVlSIg8kBOCK8qMWpKxm5KaW6c3xbpuw5l6ILeZZbVRq9JNMdQ9H6vp81/69L
         4Q0wztD5iYf9XoMsJ+8PF00untJcyqkx2HqCGpjxTR7baF5ke9qKUwf2jDaq9QBsb3zz
         rYsH6gbDc8MjLfFFfwo+RDEf1YZ+RF8XAKMi3kYrw1S5qv5UFUfGmJDmw9Jj5zWAGG3G
         bauIH0yhPcp00L8zT5l6VaEEA8QHXie23/RaKJpDEjt2oZJHKdPj2yREejMhowQypiSk
         4B0OGvBOje6jr3liQxry6vJPJb7xzFq8/THVMI0by2GFAinPQnO0bmS0izOTpP+CRnqn
         PvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978717; x=1793583517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
        b=C5E1faURWSKu+Fe0n6rsR9jKPxsjQVRb3vJH3NfHgASwRmepdl/2ugWEzSgcqZmfMk
         K5YuupeOWEWCciMakkpTSisAkqGsMCo4fEZqVCq4tyeamMtO5xWDbQ3+OjKhWhlrjsH9
         X6D1u4aFzChUg8SvzEyR7JOZDYQLa6uve5APZo5wA+C7UU2PD7hn43P2oPJRk2J7+nJI
         n4eSLxDm9/4cITrqsHwq4C41TkoGZnjLzSOEmbZ+ob/mBnp4Pptf4CRr+Qqy8vlh4Xn2
         MuZ86REabj8LL6m5ISad7xbdux5jmq4Dc6yhj4jBU1vbetps37wrsTqLxUz5v5ptv7kK
         PkNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYBZhGhtkDKLKgnFco8MXbPnLGhfNsVnI4fdSkTXCgUKdCLHi3dMRMKw/J4GTauoq4JyeCMx4TKABUYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIlYJ2xBiJv4yKdZDVztG4qxG8za7bfVdo/8BVZzsmEIxpuCGQs
	eo+ZhxVVqGVFmoSTFwqy1BDqksLfXnigmk8aoZBV+VK3WTgvD8Qw+i14
X-Gm-Gg: AYBFou16cO/Fr7gKQGj3sX3QDAUaNW3z0/Y32trnQ7zo1XTGzdXZceDq+KJHQzL2xrB
	Vic+t6VxgRD7rwUNwtUn6O3AMlz6BmjRjwbTnf4P5AO7EeRB/QpAikd9K7f6FwJ/IQ1r3/LtATy
	uPtIG92u5UeWfkr7yiiuQTlEWC8vkCQ5v+e34+70eBHD3DPZQhwYi9ZsEkd/83/r2HPGThhgBOm
	2ZTl4xxuhWO8Toa0qrLfx0zTLjMCRA/NkFGLucwcdO+EH5i8VtbqPYDqXyDoRiYs5upZ9oVBZ3Z
	GYZvzobxZ8UG5Y0AfOA38Oc/PMrISMCPGtjIch1rNM+4LoroyUK4u8ZYlVWNOsxyk9Avb3fIHKV
	nVhsqbYLT4fYTjIYCtXjJ5tyJUd9W1cZ7RJLE3iRm+g3E3sz5V6QZOtSvvknz9BEkzhji3jR2ry
	bwzWqRKnTHJ30PPzkZD7HytXIxwD4U4F6mv+4P0M9TpBi9QIDaLfccqVrvLMc/wdWfPf4izTF/V
	z4C/0HlujZs2RbipFV/CXLjMytxOdO6nd4dJHBmLiAZgHAa4Gi5a+WUsq3XkJleg9tT89hNThQX
	QoBdSVE=
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr42720475ad.27.1792978716682;
        Sun, 25 Oct 2026 18:38:36 -0700 (PDT)
Received: from yogi.shaguar.org ([2601:600:8282:f152:c1c3:8958:100:6fc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm10567635ad.44.2026.10.25.18.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:38:36 -0700 (PDT)
From: Michael <jagerkin@gmail.com>
To: arunr@valvesoftware.com
Cc: tiwai@suse.de,
	tiwai@suse.com,
	perex@perex.cz,
	alexander.deucher@amd.com,
	arun@arunraghavan.net,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Date: Sun, 25 Oct 2026 18:38:35 -0700
Message-ID: <20261026013835.98210-1-jagerkin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
References: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
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

On Wed Aug 19, 2026 at 11:53 AM PDT, Arun Raghavan wrote:
> On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
>> So what's the best option for users if this happens?
>> That is, what happens if we don't restart the stream?  Is it a
>> temporary fail-out and the hardware recovers / resync by itself while
>> streaming further?  If so and it's short, it might be better to leave
>> it as is.
>
> Unfortunately, there doesn't appear to be much users can do in this
> state. The warnings we have introduced should at least point to a cause,
> but the issues seem to be around GPU clocks and power management

A data point from Intel hardware, where there are no obvious issues
with playback quality.

7.3.0 logs this continuously as soon as PipeWire opens the analog
playback stream:

  snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28

Per include/sound/hda_register.h, 0x28 is FIFO_READY | FIFO_ERR, the
same bits you reported.

The only open PCM is pcm0p (2ch, 48 kHz, period 1024, buffer 32768
frames), so I'm assuming that's stream 7.

Counting the callbacks suppressed, it's something like 7-8/second.

ThinkPad X1 Yoga 3rd gen:
* i7-8650U, Sunrise Point-LP HDA 8086:9d71 subsystem 17aa:2259
* Realtek ALC285
* snd_hda_intel
* no dGPU

If there's some data I can collect let me know.

-- Mike
