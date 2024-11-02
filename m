Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16133F9
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730510440; cv=none; b=uYznTuKSSlBQzXEe1sNPWpySc53l+SPRVsJfT1yjdk/lbpRg5SDB4odjakIKm9EBQIR4G7FcQNQzPEkRB1F0rp74DkPPAniIH8OYeVQIlxChKNKfJlxN4cYXJwsf3lYp67g8THZueQGAs2OlqFoV0rLBIdm6zbl0PQLGjXssFSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730510440; c=relaxed/simple;
	bh=BrRccpbniEuTyMXzSED9H43qEsIYFjr8x4RBaeeAYPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaRLrYS4lNM2WSy6lRg1owsb4FNu8GiOQOzh4AQ0e+SvEqFRJZnAEAEYtjBg08N1c1ryfJSqgNBIti51YV0t7Y1urZYsy6j9bORv5ayTRPfcz9OpDvDtrs5rjMJBBuWNlRrG9FqefPo/EoKASPyH+AE6AJ2K46C0gEwWlyT4HXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=hjpwYCcP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kghhN6Xw; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="hjpwYCcP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kghhN6Xw"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8273114019B;
	Fri,  1 Nov 2024 21:20:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 01 Nov 2024 21:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1730510435; x=
	1730596835; bh=QdTh2P9MU68on4G0MEvWGMMNXmTCT3NzZ7eJgtZDayo=; b=h
	jpwYCcPki6FfdbBG6SqtZwsBVLwSl03AMN2Jo82zYPiNBnKEIA5mfP5cSnewJIpS
	Nng9LIq3KgjSENdOhknoUYpVt8DUbA7u/x+TI2tTOgCSswa6ibaR/cKfj8abg9oz
	AUcRB9UlE5/5ivr+gFpX0EFM2V+0nrnjJMKCvUabL6954faEe5FgTpu7Iof95qe5
	QT5yOgaef2mlj/fqwT4IB3HJl2hfp5BZn0mNdJ5e+1JUQpg1gRqKwwO1dw0GjIUh
	BSSS7Rn9ZItpohx/A7j/O2pLFUBu41LDlM6vWYVg6LM2+pbeXuz+Q0hOH7mCyuMx
	eRAUSUEt/1IXquIYFbA5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730510435; x=1730596835; bh=QdTh2P9MU68on4G0MEvWGMMNXmTCT3NzZ7e
	JgtZDayo=; b=kghhN6XwGU8l9iQSk+mpr/A3jaqltq4IBc6mUGGaIT+Jlnbp4GE
	T0R8xviXaJULbebMeUWSn0FAcxdg4dYZDm+x9ffpClvZSK7FcIf1gwacNTKQkSTZ
	i0SgRsclUtvKgy+Wt0Rw+jsE6zj1YGsYL3WPmxBMYvbnyflyIgGV7Z2sufpMlUz8
	F5hfB96Z27JaTQgTJyVBdLeaKwOUWKH9G9aJbRnL/05LrwqgMJCzdLejkWI/WMo1
	QXm5LbaS9x13NmRU9RZ6c1IzHea5w41j408u1V6t9/LjVc2lY4UEoibnADcU1PE4
	TEKm+FaXS6se4hBlfLiPFokmPRRXOamjZKQ==
X-ME-Sender: <xms:Yn4lZ0udJ7HaLw_15X4rwe0_werePO43sWoVTcHbV4v3MxhFh2TjYA>
    <xme:Yn4lZxd3SVhUoQJK6YhiGciyaR7Z4MTq2Bq1paRwgf3-nouNO4ucB_ajScZecA9T2
    0z25qaO2pVwUcCvEpA>
X-ME-Received: <xmr:Yn4lZ_y22krnSZFC3rKSCkqSGbphvY-lxpAIAYNF2J6wi_20q1M3O5jYNU3c1HVN_ezg_xiaVO0141hDItZ9aSRYf9sS4v9ElA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeltddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeu
    ffevveeufedtlefhjeeiieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhho
    tggthhhirdhjphdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhdrmhgrshhimhhovhesmhgrgihimhgrrdhruhdprhgtphhtthhopehtihif
    rghisehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhvtgdqphhrohhjvggttheslhhinhhu
    gihtvghsthhinhhgrdhorhhg
X-ME-Proxy: <xmx:Yn4lZ3O9udxZP0YgqkbsqWodTIlQp40x5bsD2OBViriTWo5_xps50A>
    <xmx:Yn4lZ0_Aknc79XAQO7X3B8BALgBqDtfl06ogpyzZTbNZyLOoPSUNiw>
    <xmx:Yn4lZ_V3_Q2LD7TCfRli9WlvOvrFcEpMacr_nmLbBsY-yeLWgo2ZUw>
    <xmx:Yn4lZ9fCKy0RHpoyD0PsbPeu0HUVOoPTTbJ1dTriefWTmE0oOO5tuA>
    <xmx:Y34lZ4Y1rAdpdS3pTSEVJnf3t0wsMi6RWo9Lduukb3wTSfFdzrWBHhCI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 21:20:33 -0400 (EDT)
Date: Sat, 2 Nov 2024 10:20:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Murad Masimov <m.masimov@maxima.ru>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] ALSA: firewire-lib: fix return value on fail in
 amdtp_tscm_init()
Message-ID: <20241102012029.GA446652@workstation.local>
References: <20241101185517.1819-1-m.masimov@maxima.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101185517.1819-1-m.masimov@maxima.ru>

Hi,

On Fri, Nov 01, 2024 at 09:55:13PM +0300, Murad Masimov wrote:
> If amdtp_stream_init() fails in amdtp_tscm_init(), the latter returns zero,
> though it's supposed to return error code, which is checked inside
> init_stream() in file tascam-stream.c.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 47faeea25ef3 ("ALSA: firewire-tascam: add data block processing layer")
> Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
> ---
>  sound/firewire/tascam/amdtp-tascam.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
> index 0b42d6559008..079afa4bd381 100644
> --- a/sound/firewire/tascam/amdtp-tascam.c
> +++ b/sound/firewire/tascam/amdtp-tascam.c
> @@ -238,7 +238,7 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
>  	err = amdtp_stream_init(s, unit, dir, flags, fmt,
>  			process_ctx_payloads, sizeof(struct amdtp_tscm));
>  	if (err < 0)
> -		return 0;
> +		return err;
> 
>  	if (dir == AMDTP_OUT_STREAM) {
>  		// Use fixed value for FDF field.

Indeed. The return value should not be from the err variable. It looks
good to me, regardless of the circumstances.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
