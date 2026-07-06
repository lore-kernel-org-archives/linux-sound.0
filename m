Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1272D41611A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348809; cv=none; b=g40wkiWY4nFa7ryF41fXTDSMhX+c/nNhOWbmfOv/c2P3ZIPuH4W8DJfKpaBqVxKgtQlLlLbwDsRSh4M/sqQgISvgfyZTmyBYFRCgxRPiVMHp0DtmMdSjY2wcunPbk6bGyK9oSTKrwj3LmPUw/SY6LcmjBex0HwsjOjLqXE1UxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348809; c=relaxed/simple;
	bh=MeIuKH5v+1Fb5EfFqq/XZIaqvul1IlPgc8ki/E0i5qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH43SYxjscVQrget5XBYjlWMlKdtGRpol00Szs6vTYB28pY3kOYwDe5AJie758p4SfNYZZV71pTmt1tu3cQMn98XCnxSj2BBymJJkqB3eMlVf+FLFNJIt9yxZsP8U9TAWY1DWioMJ5qBOF1ojyvHbmV0rCsqU1XHrT0mXkocmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=rM1QfgkB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OJQVfsnL; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="rM1QfgkB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OJQVfsnL"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 285A61D000E9;
	Mon,  6 Jul 2026 10:40:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jul 2026 10:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1783348806; x=
	1783435206; bh=HTnzBV6+tmZ1H8ZO7GT01rl8xe3TfaibSd4/Ze0prGE=; b=r
	M1QfgkBC0Fvi1g78830PVlz87l20n/UUo+9gKEyRqPKyn5Px+OtrlYcqG0VpRtAV
	Gzz0j7PMrPQy496DnJKOT32JN+gsh300sAq98b+YVY6ZQzO4Q57oTwdKHLAxPVfS
	tW9ZQhGG9FQsF9amCf3UnXXVFOebCfuRM3Ea5+N7EcukuPpOy/kVMT8C1tmuVStU
	xdZ8PxKcytun367deV2RmQeYeDuDO26gBla6CsyfYGBEOl9vJguTnWxX74jfW9qb
	q6QaM8fHahMIW66H6K3/ZjequWahquj9clKIj0NsgAb61ctUvWNsPQ0V79G9pkvG
	weeIaHIm7ePWMPFtUioaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783348806; x=1783435206; bh=HTnzBV6+tmZ1H8ZO7GT01rl8xe3TfaibSd4
	/Ze0prGE=; b=OJQVfsnL4tjDQEP31n1hP0QSbyrB8MF/8l9NPHf3qD5/+IZwPaj
	QHlinAE7Y+EoMMEhqqxG0jCGv8l7QwlqqxY6gMpeAh0jiOoeN1AMbWtaTAqxttyo
	Adjbu/8Hlv6v7qxqMOuYXe5BM47mFwLfg5vzGyHwWlnSUCjVdDr4YwMguSCWdJvd
	4dU5+vZZ/u+k2EGXXqsaIRztK8amqBeqil9KDFVvIi+Uyj632cKlzc4E6uL9G7xm
	Dp8Yu4ivxPTxcSSOQJHl9+azoiuNq22yNsQPoKbTVMCt+0OK13exfx9SbTpo44S2
	7SDkU4Xkv8rfrjT50yffAX6kZKAql3C4Igw==
X-ME-Sender: <xms:Rb5Lanvwgb80e7JU-PASn3hwy99nwhPLZZhuqZocOkXyebSCzDu0XQ>
    <xme:Rb5Lav7dl1W13X7z-ib_qCkCHT2q-ZZGNWDYg79uujKxGNAM3VjvqND9zHQyZW36c
    DymMg70UUyDNOajYDDm902m-nBwhuXq_DnBm2n4lJtp_QLSDXMo-9Pl>
X-ME-Received: <xmr:Rb5LaoLBwQHruO4gbF9phaYnWqvlEMCnZ20TbxZz3FZhNuQqRFxHcejEie_nDk5CaDDk2t_X5H1aeHe7j3RkIMlLwKinGw>
X-ME-Proxy-Cause: dmFkZTFJWAfkPnJQFX8KRu5uYhcE7oNbrHSbldfuv/yq3yF+spj1G7ylkRLSbbzBwPCtZl
    K4Tuhy0RHCbnF+HwfkcJw9EL6456P8H6/aBI/JinIGgreaoD4FGD/c0QlBOJ1Y13IVxbHn
    lZoTWm0Q25BazSr1JlWPsj0zOdmzix/LQX7QR+rRYJdpB4BW+8drUw24k2Fo+HlCzQ2EIq
    U1couTe3H96mnbog7lSlYpnK/rPQZLgE85RZIf3IQnG55XL3pOCBSBSz/yeIcIbNnRKEC9
    EOjMqA43ICDOHk8ytKS6+r47ypcxZndS1n3LS0uShCODY841hKPVbhvIWPZyweLYH/ZAcA
    giefHQG+40v7fLCmCwKJMuZFR5RN4bH7txUFePcgHCFJs6C3E9YIT+xq0/pOWf4MIfMgPr
    pijsGwLA2EjMtus++7rZ3wYc/d8+GifvYcl6pAVpdHTEt6Us6yHokx0Fr1V211u5a+Fn5p
    eQg93rq8uY1lFoPNpV8/qCTWYAW9JdnNm210QtPDwUKNVu7DXymMRjyy1/mW0+DhALZg2d
    1JyoR3sLFt8lbGrEpEfBATrVFKY+AZYHRe9CQu02BwBPpdpsxVcc9YRgZTmqWLrqM+qjbG
    63+PIH6zGkk+qB2z7fqq/QQCrpmBf0PGYEpt4QdlMbSSDrLNm6YdSbpKXApw
X-ME-Proxy: <xmx:Rb5Lav6z_NtezujhWVz39UqcgaacF_z1Wduo0D7evMaq3PdL-hxZCA>
    <xmx:Rb5LarxS2FCEBXQ22eDcE_uJWro1bt90jbDUUawZNI1Aw2HhvQ21-Q>
    <xmx:Rb5LajajUR6H0mBiRTiDyWdD9S3X3Jahwm2Q36tJ-Us6NFAtynLEVg>
    <xmx:Rb5LatQLAPkgxRWpIaD2e4n19qT-efVlbKIrgeahQ9DsMm9jZm6uug>
    <xmx:Rr5Lap_rLnIYT2SeAX4StgoI-8cfHJn16ldA4uugU-mYZHXLLgHepQg7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jul 2026 10:40:01 -0400 (EDT)
Date: Mon, 6 Jul 2026 23:39:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Longlong Xia <xialonglong2025@163.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire: Drop redundant mod_devicetable.h includes
Message-ID: <20260706143958.GA168076@sakamocchi.jp>
References: <20260706032639.273929-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706032639.273929-1-xialonglong2025@163.com>

Hi,

On Mon, Jul 06, 2026 at 12:26:39PM +0900, Longlong Xia wrote:
> The ALSA FireWire driver headers include <linux/firewire.h>, which
> already provides struct ieee1394_device_id via
> <linux/device-id/ieee1394.h>.
> 
> Drop the now-redundant direct <linux/mod_devicetable.h> includes
> from the per-device headers.
> 
> Signed-off-by: Longlong Xia <xialonglong2025@163.com>
> ---
>  sound/firewire/bebob/bebob.h         | 1 -
>  sound/firewire/dice/dice.h           | 1 -
>  sound/firewire/digi00x/digi00x.h     | 1 -
>  sound/firewire/fireface/ff.h         | 1 -
>  sound/firewire/fireworks/fireworks.h | 1 -
>  sound/firewire/motu/motu.h           | 1 -
>  sound/firewire/oxfw/oxfw.h           | 1 -
>  sound/firewire/tascam/tascam.h       | 1 -
>  8 files changed, 8 deletions(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Iwai-san, this patch should be applied to the tree which includes a
commit ecca1d63c1ea "Replace <linux/mod_devicetable.h> by more specific
<linux/device-id/*.h> (headers)" in v7.2-rc2. I would ask you to apply
it to your for-linus branch and send it for -rc3.


Thanks

Takashi Sakamoto
