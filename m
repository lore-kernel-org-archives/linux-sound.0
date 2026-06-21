Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02BA25B0A0
	for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048682; cv=none; b=YkYUpAdBBzioM8wHMH0cWShSm9ACamxs0KkHjLbN1Qxgz6EYUwS24ya63XnwAoyWtgC5FR4M5bUQJxh45q9Ic4fx9XioA5Cb8Bd35LvAdks4ycxorDo2/+I++F3XEKePSgCZm0wn3IO5hGFzT0x+2zKSxRa2cdZJV4/X0VIkNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048682; c=relaxed/simple;
	bh=D5UHjzFsclIUdNvHH+8HZSouchLWRNF3xV69jz5WiRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azIQp5lGZUcA+VU9mBs55u1sa3yjINANDEY7n3fBSb+SZVJGjcuIizObwJHvqpwthee514/YVQHIzjPTqm7jGkUooMTnJBGcvvFvf5clVFuV/FmOSRQa+jt9lczMXDVU3YJ4TanmpkkQPeuKrWoWigIqo1WpZHRN1T+7PnTL3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=APUhaGr9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jgK5Zk5c; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="APUhaGr9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jgK5Zk5c"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id C343C1D0007C;
	Sun, 21 Jun 2026 09:31:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 21 Jun 2026 09:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1782048678; x=
	1782135078; bh=nVNTIA8goxYWszep+hbHoW9HkOaK3Al0/hcb+u3/FFo=; b=A
	PUhaGr9o60ozK51SJDAmgSMG5YcdgudVj80GwEgJYbPzBVmI3T8Ii+1vVwMzNGRi
	KNa/WUGAFk+ZHzR28/h7a/It2/e3/lwTdplj/ECl++R691TOpKdxQJWWGRCQbRGN
	78tjOPIubvPJtNag6VuSPrcR7OxLVEXIPYO30b1gIJm2Ldn5OVAeVn7Cnz79wrYA
	okHw28Wf5NcW9OP63LJsuQrGIIJq0Vk0iCf/YjHmi6g3JRSXFzFBSy5x8x1F7cG0
	0tQq3ak4WU8sV00gpM4eyh67C0dafchg72n3C226fIzdb/+hSfdWLyVk/l5mXBiE
	oNjUVzWxwcMCJcHeP8thw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782048678; x=1782135078; bh=nVNTIA8goxYWszep+hbHoW9HkOaK3Al0/hc
	b+u3/FFo=; b=jgK5Zk5cExPjNKzjWT37OmBTpXOOCyRsKTfU4QIOZ8VMSNak/n7
	aKoJyxv1X+owAD7U37olyGab62CNHu3GGBdvXiZATMV9emBY4opXPRGGShIint07
	Mmlyk7DIbxWkz1JSJfz0p/P8n1dhfI3n9IN03GucOjK3idVT2EyEfxPUizfgPj59
	VIbcge5/iZk1QQcc4CIWYRhzC8RfT0/6MqwpEFZ9mXlkjsX9TvhN3Xf/sET9HiZW
	wDnWmucntsIuRyheSkl5ZB6FWNGPpIEMR2rJqaN/1HJQPTjkMgcoYNlhf/xb3BoM
	l0cd3+t1qvJ4FnbcnN/tMIkqwTygTHh6dcQ==
X-ME-Sender: <xms:puc3ajTiK7H8nhR6jFUMlRi1SEmQcH71emhwH5nUVa5gU0mt2xP-5w>
    <xme:puc3aqynbVXbzNNzWCxIisdo5esW455XoRLBOLqghJzGKuvXMjGpMiEsWut4iaSpu
    eAd9inhf4MOmXGFAJBy-dxlvGBBwJQHFhF_laFAUbCZxnPjN6Tf-dIK>
X-ME-Received: <xmr:puc3amfiLdOngpT37wrEmmBAdTJ6W2R49OyZDPB3ZKBUBZMJYUv-c7EehEeYs9b1a-NAlFdipZ7vgo9d_hulxbtTvSc8liI>
X-ME-Proxy-Cause: dmFkZTF2Tq+nSOdhxOKx1ihMJtgOa29pJG/bQw/cH8rdb4jzpBdQu01K4QYzqTt/thvFRT
    rT3Sso6BQtsK2oUvitBtVJLasOXTnyzGQ66Ob79rVwDYFQQbEiSkLUxOeJ8ncno3VUc78F
    c+S62+dwpXR1C3y42hlnoGIsOTfV2x5wDeqXWIlk2foq9jzRemPlU1tzvdAqE41NJ/zYZ7
    pXa7b2wI3KoMTH61RfDSUNk09tUf4QtnWVtvh8PldoeYSccq0qMtrhmBMnYjyst7X9zQvi
    unN4loGBv5GmX1UPMR5WbcQH62gCifwwUQ8ixiTzsypQfCAEJyAKV5vQrZcYLWHwvyM0tZ
    ONdy4x7U4J1QcwQzOuvsnRjXT2vnKELHTLRjTUNTeJO0lgi7A1KYpBekV592QWgv5j713g
    uEOGdIumIAODHVHuvoINzBfwSemSoCw9Bwp57sNLf6f1uOxVsU83I5Ma0nVu9RQtuqiKEZ
    TGtoR8Uy3Wk8ZKHR+G7+5Z0AFy12qeHl6/ASGGNW1SVTQfj7ReeT8bguJeyQ7arQDWJvLy
    sYme9Z/4Z1hoqDVDowQZx5OSRu0ltWm04KiJz6Lx5qEX5PBKRA04GA63jzAN29FQsLk5wd
    vhS1fNbuI5Ba1pZ4us3DCIR7cCkQ62oGcS142MH5oePg+zuDvsFcsaP8VqpQ
X-ME-Proxy: <xmx:puc3auI4wFR6MZdIJfbW34q0SnsSHxUh2IKMID3US9ZZftMoT8m3Jg>
    <xmx:puc3avHBER_MgmYyxj8s63RV4u5FGCMBrWh4Vs-JfAgJjwTJu5KayA>
    <xmx:puc3agoFkpQOOxS8kUIcnYsFhLgXZ2_T3mRN4gX_AQhWQp3DpiSfgA>
    <xmx:puc3agTUf5-wfIpnNvFogtBeQTwFy8nOY6nqQhXECYOJhDRz4QklGg>
    <xmx:puc3anDgYhBaF3HRoTyBXEMALVRDy-KXGt5Tt7MdB6bB0R-YVFbRkweH>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jun 2026 09:31:17 -0400 (EDT)
Date: Sun, 21 Jun 2026 22:31:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: ALSA: firewire: isight: possible out of bounds write from a
 device sample count
Message-ID: <20260621133114.GA321857@sakamocchi.jp>
References: <178178336260.3522027.4315665976901311151@maoyixie.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178178336260.3522027.4315665976901311151@maoyixie.com>

Hi,

Thanks for the report.

On Thu, Jun 18, 2026 at 07:49:22PM +0800, Maoyi Xie wrote:
> Hi all,
> 
> I think isight_samples() in sound/firewire/isight.c can write past the PCM
> DMA buffer when an iSight reports a large sample count. I would appreciate
> it if you could take a look.
> 
> isight_packet() reads two values straight from the device iso packet.
> 
> 	length = be32_to_cpup(header) >> 16;
> 	...
> 	count = be32_to_cpu(payload->sample_count);
> 	if (likely(count <= (length - 16) / 4))
> 		isight_samples(isight, payload->samples, count);
> 
> length is the iso header data_length and count is the payload sample_count,
> both from the device. The only check on count is against the device-claimed
> length, not against the PCM buffer. With length up to 0xffff the gate allows
> count up to about 16379 frames.
> 
> isight_samples() then copies count frames into runtime->dma_area. It never
> clamps count to runtime->buffer_size. isight_open() sets period_bytes_min
> to 1900 and periods_min to 2, so the smallest buffer is 950 frames, about
> 3800 bytes. A device that reports a count near 16379 makes the copy run far
> past the buffer, tens of kilobytes out of bounds.
> 
> The sibling drop path isight_dropped_samples() does clamp the count against
> runtime->buffer_size before it advances the pointer. The sample copy path
> is missing the same bound.
> 
> The controller does not catch this either. The iso header data_length is
> DMA written from the device packet and is never compared against the queued
> payload_length, so a device can over report the length.
> 
> The attacker here is a malicious or faulty Apple iSight on the FireWire
> bus. The host only needs the capture stream open and running, which is
> normal use of the microphone.
> 
> I reproduced it under KASAN on 7.1-rc7. A count of 16379 makes KASAN report
> a slab out of bounds write past the PCM DMA buffer. A count that fits the
> buffer stays clean.
> 
> The fix I tried clamps count to runtime->buffer_size in isight_samples
> before the copy, mirroring isight_dropped_samples.
> 
> Does this look like a real bug to you? If it does I am happy to send a
> proper patch with a Fixes tag pointing at 3a691b28a0ca ("ALSA: add Apple
> iSight microphone driver").
> 
> Thanks,
> Maoyi
> https://maoyixie.com/

As a quick glance, there seems to be a kind of agreement between the driver
developers and the device specification that the payload of an isochronous
packet includes audio frames up to 475[1].

```
$ git show v7.1:sound/firewire/isight.c | nl -ba
    ...
45  #define MAX_FRAMES_PER_PACKET   475
    ...
70  struct audio_payload {
        ...
75      __be16 samples[2 * MAX_FRAMES_PER_PACKET];
76  };
    ...
```

Keep it in mind that the device multiplexes 2 audio samples into the
packet. I think you can fix the issue by using it. Please post your
patch.

I just maintain the driver, and rarely use Apple iSight. So I have no
interests in the bug reality itself.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/isight.c?h=v7.1#n45


Thanks

Takashi Sakamoto
