Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836255;
	b=OxDX4YFupm+wk6fS+17soq0HurmoEcVbdu035/8JOZR3OvJZ37tGIaN5xts4GNhRMeNE
	 Xhg3i3KTCTsj7Sfh+XdSBfl7SbgDBVbMWFgUwmXLjkUUh0IJ70GPadCvL5krffg1miikT
	 l3VOVHAmu7+Gb6oPGdGqq3vtIAArAlHoW6Q7/EWcuqJo9KJrsySy684v2oZk2UHQZ1oYx
	 2agifxlQFkRpCLNBQxfTEFBcyFBLnbENxANDXolLCeSwBzLYBcsPSAC4/PCnd7EoHS/Lu
	 lZfEcqI1u18Pp1uCpBHunRhDqJtVGWOvrlUbK5NUw8rUAf89UBgcrfK6ECxQF6eAZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836255;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZLX2FJ8teYpCnQ3RfDTqC7zap37D6OQ9RPoG9fqqkT8=;
	b=kSlrWrXNjte9wPRZo6HucXeso7uyJYJ8FajStUNkKkYB66oVUnXy25VC+ZXNO2ohtPjH
	 quEVb1WUELFJtgN4xS0rKOWx6HJ68icYe1cPKH4uCKtgbcaCSbDMOc/ItzJDRaY/+xFto
	 /O4rleDilDzvU2CgQPqovmmfEGRFHJq6U0YZncljpzA6S2MGTb8rES1b98FPT6C+vYqiF
	 G63vpNpBoDbvrrv0/YapX3tpY2bkrX7mbJX3MAafysvWyksviyXoJ3XiRBn5YgAhL+F4j
	 mHw09B5Z14j6EoK5ttFV/lAM6AZUyVengs21gQiJgCAqvredKuvPBiasbQMV2Ny25Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VyeUJLWI;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42989606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 10:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42989606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VyeUJLWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=ZLX2FJ8teYpCnQ3RfDTqC7zap37D6OQ9RPoG9fqqkT8=;
	b=VyeUJLWIZowmFIkrb87raiEk3FSlhuXigOFqwV4Fnr5R/lZ1N3+fkv31bYpJZi
	gYeXbeW432NBpa2aGQYiyqqhblmuoKbZev/kWPhUH1EAFqBy6kCK+mGjtM61A/xc
	YQ/iRDOmx0C11OvBZ0643KzOr/pI8AoUIy/IFFeXBtfvY=
From: Bob Hui <bg9oxa@163.com>
To: linux-sound@vger.kernel.org
Cc: sashiko-reviews@lists.linux.dev, bg9oxa@163.com
Subject: Re: [PATCH 1/2] ASoC: es8328: describe the power-on register values
 in the regmap
Date: Sat, 24 Oct 2026 18:03:57 +0800
Message-ID: <179283623767.21314.9471498417293367893@163.com>
In-Reply-To: <sashiko-outbox-183604@kernel.org>
References: <sashiko-outbox-183604@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXn8CNgtxqNz1_CA--.42446S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45XF4UCr4fAF4rXr47urg_yoW8XrW5pF
	ZxK343Kr4kur4Ikrn7Zr4jvFyruayfta45Cry8Jw47Za15A342yrZ3tF4YyF10krZ5Ka4a
	qrs8X34xCayDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUN_-9UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3g6VA2rcgo7yVQAA3b

Yes, that can happen, and it is a deliberate trade-off rather than
something this patch alone can rule out.

The values are the reset values from the ES8328 datasheet (Revision 1.0,
sections 6.1.1 to 6.3.30).  They are correct whenever the codec has been
through a power cycle, which is the normal case: probe enables the
supplies and the codec comes up in its reset state.

Where the codec is not power cycled - a warm reboot, kexec, or a driver
rebind on a board whose supplies are always on - the cache can describe a
state the hardware is not in.  The driver does not reset the codec at
probe time and so cannot guarantee otherwise.  In those cases the mixer
state that userspace installs (alsactl or UCM) is what brings the codec
back to a usable state.  Without the register cache the same board still
comes up in whatever state it was left in, the only difference is that
the driver reads that state back instead of assuming the reset values.

The suspend/resume path already forces the two back together:
es8328_resume() calls regcache_mark_dirty() and regcache_sync(), so after
the first suspend/resume cycle the hardware matches the cache again.

One thing worth stating explicitly: the driver also binds
"everest,es8388", and the ES8388 comes up with different reset values in
a handful of registers, so on those parts the cached values do not
describe the hardware.  I can split the table per chip if that is
preferred; it needs the device type plumbed through the i2c/spi match
data.

