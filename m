Received: from mail-108-mta19.mxroute.com (mail-108-mta19.mxroute.com [136.175.108.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE86258ED5
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765554585; cv=none; b=RuPPvMyYLuuJIv7IM5+PSBaoEEtu7aaU+CwBVvbKKBvXVa7+QDm3gTeOR+t+ldHKPvwcczyLXsAFGrymd0aEwJnBgYdFtQ4de50qDQK2UAttgIW5PnQDBE2qQkaqtKam4GnMMflzf62Zp6QoHDk3pOyTGHoB47CMGEu6s63PH90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765554585; c=relaxed/simple;
	bh=hkpYBG5vk3WDAK/31daDTJTOmP5QZ/Fiiwvk1JR5CQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7yfdMztyeK2BbGaViq6kaXbOPEdE7mMFSRjvOs2As2Kj+5jv5aloj7ZFYg2uEhzsvHbES28nVscW+kCPYe3ggWGMgmQp6IoFqeKuCnj88tc0RmCh7lDpvSxs3qmNIQw/38opzD5Z8yKiOVcPLf7TBevwFsP37tU+hRnxNXB5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bradkelley.org; spf=pass smtp.mailfrom=bradkelley.org; dkim=pass (2048-bit key) header.d=bradkelley.org header.i=@bradkelley.org header.b=P39YZOF8; arc=none smtp.client-ip=136.175.108.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bradkelley.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bradkelley.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bradkelley.org header.i=@bradkelley.org header.b="P39YZOF8"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta19.mxroute.com (ZoneMTA) with ESMTPSA id 19b133c338a0004eea.00a
 for <linux-sound@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Dec 2025 15:44:31 +0000
X-Zone-Loop: 468d713b3d947dc63e78f1c19eaa2f3dd34d4639d877
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bradkelley.org; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=D5nJJPSIBLPsvqGLjBFyHihpYd1ow/pbD6dpwqMdMNA=; b=P39YZO
	F8m62ibN/yCa4QF9IS1gr9edr1d9yw0eFjT5DyA9PXoGN5qzByYYKVj/ALXaMf2xUeo7hKHH5XmUc
	+LarRvJt1IuOQsvrJdZJgz58tOv/qUfmydGInQYF0RFDkAgTkq/N0NRz3Kq4BOvXpswLGtNGoN6ji
	u7nY/lfAJMicIl8ILxTTM6tyjIRMAYT15Kn6ePCaOA3+PHPgd9fqmdj6rE7e3iRXzap+1Iglaco/C
	iwyTqSKZp6aZhbiwqpBtlNjohEa8ctHMULg2xJG4l4vRTlTty1lXSKZmX1Wmpp9Tc0HQOsc8uDwAO
	bipgrGDnSyJKqaEW8oTl8KSo7NCw==;
Message-ID: <f93147a6-0357-44d8-97ef-9cefd666629a@bradkelley.org>
Date: Fri, 12 Dec 2025 07:44:21 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Correct a typo which inverted the reset GPIO pin
 sequence.
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Brad Kelley <spambake@bradkelley.org>
Cc: david.rhodes@cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20251211051628.391435-1-spambake@bradkelley.org>
 <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
 <9bcc59d6-027a-4b66-af81-2f69c84c3efd@opensource.cirrus.com>
Content-Language: en-US
From: Brad Kelley <brad@bradkelley.org>
In-Reply-To: <9bcc59d6-027a-4b66-af81-2f69c84c3efd@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: brad@bradkelley.org

On 12/11/2025 2:19 AM, Richard Fitzgerald wrote:
> Actually this patch looks incorrect and will break things.
> The 2nd argument to gpiod_direction_output() is the initial state of
> the GPIO. The kerneldoc for the function says "The initial value of the
> output must be specified as the logical value of the GPIO"
> 
> So the original code is correct: first we assert it (logical state 1)
> then below it is deasserted (logical state 0).
> 
> The problem is that originally the code set the raw signal level
> (0 to reset, 1 to not-reset) but now that it uses gpiod you must
> add the ACTIVE_LOW flag to the gpio definition if its electrical
> signal level is inverse of its logical level.
> 
> See the code in gpiod_direction_output_nonotify() in
> drivers/gpio/gpiolib.c, which inverts the value if FLAG_ACTIVE_LOW
> is set.

Thanks to both of you for the explanations and patience.  That all 
makes sense and I appreciate the guidance.  

This my first patch. I think I need to send a withdrawal email.

The problem for my use seems to be in the superaudioboard overlay 
which sets the GPIO_ACTIVE_HIGH flag.  A quick compile of the 
edited dts file fixes the problem.  I changed the line to this:
  reset-gpio = <&gpio 26 1>; /* Pin 26, active low */
but maybe there's an updated method.

I'll do some more research and testing and submit a new patch to 
the proper maintainers for that overlay.

Thanks again,

Brad
