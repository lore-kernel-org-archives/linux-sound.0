Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A253AF676
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434161; cv=none; b=g0l2mRIZ4uSpR78MafWMJHNyp7HEK1UgFke5QP7opf/ghKzcLrV4nJFMOFxnhwUgaMPc1FBO1JD2iGUO4aEjXbsfqzEuD/mXNaPJXLlTrjwq8HYSKPO/Za9oIgwRggzFHIf0tbqomSuRwPsW5huMDcYPsIV9gYNMd0+vB2WNfpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434161; c=relaxed/simple;
	bh=8hkyYDLm0ao4OTWR5GyQx8eMZFLXQOqO/8aEQmvDKcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSE15Mh18XpsBSsCJNTT89Hz2Ke813IyAMRbgJ8BqjeQNkhseYvoDdpbAS2ZqazMTz0eCAZQFiTa+/zxsBiexgAtWAoE0NEWn26MixEx/3x61dUZGN+gZ95voL9cFQsHyMe0WpJKEnB5rGnkqPzBzj96GL7Ql9jcZYuvgJbjr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=NDJB16Js; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WolxPVFi; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="NDJB16Js";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WolxPVFi"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 43D571D000C0;
	Thu, 30 Jul 2026 13:55:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 30 Jul 2026 13:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785434158; x=1785520558; bh=x6dAEEnVjv
	SEEJYKJSnWPnKvW+1vqS1p2AIIX3mh7Jo=; b=NDJB16JsLDopFfB86/D94HX2GQ
	WLl+ioFIqTTGXXsl9vl8K6XhOW/PUYolgiS8crv0lfdD7qEx1sOm87hSuAEUgN8q
	cPaY8/xxN62LoQ6ViDaY71zeCCqTr97sPqkkmgCWnFWftsmFoqVlH1VH7OWNxMg8
	fVdJUV/R9i4ylknC0vber3c3gPIoV1lZLz6JOAH0ahhpcS+Nv135pEptHkJjjIGv
	8WvvOen7eqPTaoXAsbOmlDXrTa5sK0R+KQsVU/GYF5+zXmdQP4MZWQmOfOeZSdvZ
	kWpHAPG4AkfNuLt2actGFQndfvRYgsSFUQAno1xEUan4F744sStexLIF8aWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785434158; x=1785520558; bh=x6dAEEnVjvSEEJYKJSnWPnKvW+1vqS1p2AI
	IX3mh7Jo=; b=WolxPVFiB1rzeF+mmWPIu2lr2fbSyk5RgXZoBu+JITc1yBL9wFG
	4u2b5l8+2tqOH+0QCyl2fEgV5zVYZ6Fy4dppTnscoyRQ+P9mBXFc8hG0WzFAfQhE
	NHGuQNMICczTt3V9uyk3g8HnoSms8N2bjve2Y77A7ON9S1b5+ODDArm9ZhYMG6pk
	4uP0FvdN+NvVouv5KnzXx8Mjk4O6l4S0AX5WuIauCxSv6u1dvW2dejfwKHiTHB9Z
	h0/SAYR//5QcTX7/g31MpfaQCXLMqkmfvByo08G+q/09HD33ZpWZZqpPGfJwhf4l
	eiQbhfINeerd+4fAQ5ijgf7T7C+0Hnb/zFQ==
X-ME-Sender: <xms:LZBravZk5kYh5VL7dCseAZexNlns4oqUm_RS62N6Dgg4xNRxr-Zebw>
    <xme:LZBrakagKW44Rdx5R4anyKhWtmxqh3nXjrsXX8xlfkfNR3X53WPvuWUtB7KaHNstB
    IkYy9rF6a42BzMo-b73vcK2gNfXQzW1cT8gq2QEGRbB16NSzynxdw>
X-ME-Received: <xmr:LZBravkXifYdfwcG05tgASREQba67ZSnrgaLwHwkLK2JCFwKbHUEDhM6W-Y>
X-ME-Proxy-Cause: dmFkZTEzDXfvS2Kgq6Udo93PSOqG8LXz32psISKtmQ8QwnWbdUsy7qTXecmin8vMDKjIhL
    Qkh/uGcRuXKGPidgea9LpwWIsfYsROoNY/E9UbLjdb8GE2Eat5E3xUKLes3Eb9XauELM9S
    8WZrFQ0aLag5S3rk0vzNx+nHFg1SUTI9YeLI+LcU2WARTMlqCbPwXB7XlVKv8/gjvsYBlk
    o6t0YLEarJfxjC+mUim5rTpczX19w1tywd1JWcvtVTVQ0srdeogPBnLEfcxWqB69OCCtU4
    OZvyFXdkYkd8jb1DlR8yqSHNUnIm2VjCbmNnerQ0gfmpOa49w6yeYllS0k1I9K+5SEcUVK
    q54+G/K54ix/p4iuvhCLwm3wAYunqb+A9jdfya/Zr9by+UjFkg2pD+HEnUgBI3kucSEL6J
    rBozkmd5yYBOb4x30ju7T6hEjS/9StM2jlHt6gJhfceTe7kr5CPfbSRYTxDgf8Ju4Xrl1b
    ellNKBney+W9WRYxEkV9JV21eUgdhwiR3CVKuglIHI9nOaog5QwOsAxQwH3EF0N5DhXjHV
    5n0j0mcRX6OfLso8qbYnUkP31h3WGAaQHWgWhao5BfR9l5x0DJ9Gi3BJoZDA1FmiCTUCGa
    KPMSVV88mb0d2uWCAwp8ADxMGxOYvrRrkUX1MTyGrDyVtJ/qXDHbiGTzbDGw
X-ME-Proxy: <xmx:LZBragw0T1MGrzNv0oIZ3GxYKZWSsNRuhOQQeXI8YDe38YHsYvgO6g>
    <xmx:LZBratNuUu6wju2k9PwTtshHtY_cQTUn0k60LtExpqSF8sqrnbliPQ>
    <xmx:LZBrakStxkprsV2tee0XbWu3o-4LIA-lDgCcKfNLlBzFL7BeopEXHw>
    <xmx:LZBraraQh-RD9G_1dmQUckX0r7hxR9ycyPtDy8Ber0SByYlYMK8PgA>
    <xmx:LpBraiwmD_TGR1o6BmWNod22xUpW0NjKIbc8zA-vLBPGNP7_vcnLBMV1>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:55:57 -0400 (EDT)
Date: Thu, 30 Jul 2026 12:55:55 -0500
From: Ian Bridges <icb@fastmail.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Add hda_append_suffix() local helper
Message-ID: <amuQK0k9uIalPCxA@dev>
References: <20260730161518.641254-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730161518.641254-1-tiwai@suse.de>

On Thu, Jul 30, 2026 at 06:14:03PM +0200, Takashi Iwai wrote:
> As strlcat() shall be deprecated in future, provide an alternative
> just for a simple purpose -- append a suffix string to the given
> string buffer -- and use it at appropriate places.  The code isn't
> really efficient, but we don't ask for speed here, so let it be.

The patch was tested as follows:
 - Applied on today's for-next (f817bac425c5) on top of the two jack
 name cleanup patches. W=1 build of sound/hda/, no new warnings.

 - A userspace harness compared hda_append_suffix() against
 both the kernel strlcat() and the strncat() form in jack.c,
 exhaustively over buffer sizes, fill levels and suffix
 lengths, comparing every byte of the buffer. All cases
 were byte identical, including truncation.

 - A QEMU boot with intel-hda and hda-duplex, comparing the PCM
 stream names, the codec proc dump and the full control
 element list between base and patched kernels. The captures
 were byte identical.

Ian

Reviewed-by: Ian Bridges <icb@fastmail.org>
Tested-by: Ian Bridges <icb@fastmail.org>
