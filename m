Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1B2D978B;
	Fri, 27 Mar 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615574; cv=none; b=ZyHQDq5Gaf/95CJF0k2+QPsrrnYa/mtBDl2B80kwSk+PJ5omPu3coNz31O6su0oZeScjvN6TIjTaG1PNgR0Znru019M7XF4ce1JYO+NFO/uKpt4j1jp/zzYH1JYwe9jRtuPtNt7fULvqCOl5Fo/wR/SDOjGS0QUrgJ5eLMSUfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615574; c=relaxed/simple;
	bh=LV/CegolQ2DUUGI210WS5MfvRar0ZCHgiBr76XhCbNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pmd/XVrShypWkl2H/PUXUXVf0+Hz1H8yVsSsS8TKxiakNuDHFn1jhkgD2Eg4YB2EmGxN0QGTI+sb/XKUHMUz36ur8lilwoPOkPMVDGSotrulsCNntQb27hJht3zOMTRZBmZXqgqbIUo1qYntYkVjmeiIp2V8LyKBtKqgskgXXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gKdutiZV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cDc2QD/A; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gKdutiZV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cDc2QD/A"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F19AC7A01B2;
	Fri, 27 Mar 2026 08:46:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 27 Mar 2026 08:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774615571; x=1774701971; bh=LV/CegolQ2
	DUUGI210WS5MfvRar0ZCHgiBr76XhCbNo=; b=gKdutiZVn72RBFBBol2twYxbtx
	mL45DkBv050Kd9MpqfmUjeIkNOO+1xKDJCz+CctOdneEoKO5tuR8VGVPfSVMZNMq
	72UW0Yn7n29K7pAl2DKXcM090Gy5S6x/jGy/E3dKIEP8jlySemU5JOCuzW+AvPiP
	cVvMk17IjsUSM9+gMqc6+V2rW2soWJhNpKCwnJr8Xdk4HhI5Jg4ochqiNQqW7Csi
	Z/2mrPr5+4kmf7NhbQi2ipSeF0OihaM1yiiRy8WdjawcAKDOZR8D/lZqSBfhO6hS
	VxDTwy8WuTzFYxGLgGAh+YVNBNT5+3yli3B4JoqSTIK5Y/wooTiQrFknLAgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774615571; x=1774701971; bh=LV/CegolQ2DUUGI210WS5MfvRar0ZCHgiBr
	76XhCbNo=; b=cDc2QD/A4u2yLRP1stoO9IAGTHVcZ29CiCKAwtUNo5+txsGWiv5
	zlorcjMPZHNvXBLxF2JNI5lAS06qVGof/3G1sqqrN3JqdE4sQZO7QZgMR0Qo8i6r
	LekNLjxqEn2Xg4AFqGpD17436ss+tJHyXnP3bKcOQSZkhTYf8AxT6zJvfbrw+c/2
	n/9YpTLXWtH5gOblo7Bb4eEJPiSl4PHucAr1PnZ0lfp6/Q8u7sC/+x1m7Bz0GvSO
	8Rg0ZW3UsmGfj8XpEOm+AgibeTfKeL6j2bE/8xQuKL6LpkECRiGDP2SsWm8kJ1mE
	MDDMS2nSqM8w/wO/b+YgLjYKkurczPUYKOQ==
X-ME-Sender: <xms:E3zGaRDXeuilQvxj0AqG4r3CQHTDYu74ikhJ3VVAF6FdqZOToGF3Ww>
    <xme:E3zGaXsCuD7zTKzaEZU4qhcU-VyT1IfHhoBWftpS6V8kfHD61ZKDFWX5X5e0jgesl
    ez5ckJbE8EKpOqQq306bOlVS4tsO3sSrhh6E6iJkc82ilkAaA>
X-ME-Received: <xmr:E3zGaYJScoOH3Ea5d_6jJQkdBejts-46tW8VZt2Hxlhx8UiEN_849ft1khna>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhf
    dtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepuddtpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehnohhnrghmvggslhgrnhhktddtjeesghhm
    rghilhdrtghomhdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoh
    eplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:E3zGaWZzHtx46-3OjJ74jUjsUhblj-wKEXVbzG5-rbxXV8p7z1vm3g>
    <xmx:E3zGaSAK--EGLB3mURwd86paFk--B6k6epBLr_3L6-PzlNUvLxHutA>
    <xmx:E3zGaYbiYM8ER1efc9VnhE-3NssWHgM9PPQ5EWdiD-VB4ew_72n2kA>
    <xmx:E3zGaSnyFy_HmOvCCatGkfkHETYUGF-nsKOCYrC7_w1VwiiV5RHHPw>
    <xmx:E3zGaTsuitEtSsNMeemK4mK_rlc4VjGKQYWQ-v2GVqmQCAWc3jNU_QcY>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 08:46:10 -0400 (EDT)
Date: Fri, 27 Mar 2026 13:45:45 +0100
From: Greg KH <greg@kroah.com>
To: Sourav Nayak <nonameblank007@gmail.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, stable@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
Message-ID: <2026032724-reveal-oblivion-e2db@gregkh>
References: <877bqxsin3.wl-tiwai@suse.de>
 <20260327120149.18076-1-nonameblank007@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327120149.18076-1-nonameblank007@gmail.com>

On Fri, Mar 27, 2026 at 05:31:49PM +0530, Sourav Nayak wrote:
> From: NonameBlank007 <nonameblank007@gmail.com>

This doesn't seem to match:

> Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>

^that :(

