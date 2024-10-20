Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE336124
	for <linux-sound@vger.kernel.org>; Sun, 20 Oct 2024 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729461935; cv=none; b=g118Mvj1qhp3VEZiRlopQw9W1jNoJsyS9xC7g7MYKipEpA/+FmkE/GAezN0k4p0RH7p/U3MBjNhuIdCeymbHtWQnx/DFYKVuZ/ksMqWNygbQf4WFQp65x78nG2Eoi6HYKD3svlehpl4/yrIhikLhnJGOZauNWhF8EMyfFsLdzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729461935; c=relaxed/simple;
	bh=3TLzV/58pulwLA4rXdezwT3JhL1GWgNEPFQw2uDz0Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd/oMwgVnmiKU7km914KIJdSrd5amXAjc1Dm9Re+42GfFrFF6fD/HGmdkwdKNnSPGlJmYqUalXRUHJOTQ3Jb59MkF27i7jWO/s8oHu5/91uRg2klvkFgYWARm7vmYj4i9ql10aYHK4AuqLI+mZl5GE4/ENEqScrhxuS0trRfBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Dhl9QVFm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H8qaQZVv; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Dhl9QVFm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H8qaQZVv"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E867011401B9;
	Sun, 20 Oct 2024 18:05:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Oct 2024 18:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729461930; x=
	1729548330; bh=VxqPhTxBUjnGxtqwHW4SDZEkiktpgI6Sa6i48YBy6ng=; b=D
	hl9QVFmkuM4JiZi655SSoVhgLmXqDrtGWTPzaEQmPKwJqgGkdJdtgO+VnPwU7Kb2
	Y8U+7VKo5wUwo4QsyYp//MHI8iiNAI+jQO0dRGaFUbR0T+QFvs3j7ttDmHiDFCtH
	7a1LbTjWfON581mD/fDLEFFCtBcBu4YIZ28Ria/9Drn4Oh71OuRoaOXbrdH8hcYI
	sg6fFQ9wZTJKYKHoYCWkZbFXkJZrMEET2nO7XwmsS9zP9AAO0ZcR9AHviRyfN/65
	+pqXGPat8jnc7E6RHTqvK7CK9ba/ZR7ABjcvK/VR9i9bFyrWX0t+SabE73YFq0ag
	ppVuWi/J/Ms/RQO0fJANg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729461930; x=1729548330; bh=VxqPhTxBUjnGxtqwHW4SDZEkiktp
	gI6Sa6i48YBy6ng=; b=H8qaQZVvbeIpuVSOurngjJfZpyGTyBNWK9VCtP4maI7d
	BJmB0ZtYmBknsfIbjn5c8dAGb8nW20W32v5fXHIcIfRSPRIvVmQ3X45QwKJ3YJmO
	5+AW2uXd4Jqj7SL1owKqfd6GpHfx8y8XkGEpcwZgDAHUMPPxfa0pF4fb+PaFZd46
	syFWFdUgJZGEkd9hGL7qQVTa08IdgEidJXLtHw2YS9z6xLq4+9PtpvEb2nqVpdZ+
	uLGN2GEvcrKsONcZ6zwZOO8Aw353+Jwjj4b+FfmVHgYizNWkHbQTnXOzVkmank/j
	hJg+VTjHHZyUg1YjKvQWwwausaKNn3XQqqiP3v00Ng==
X-ME-Sender: <xms:qX4VZyJvePdpVEIjMI0vmS2Ey2RbFuU3ss8YUKRsrfZOz6b1ePwjxQ>
    <xme:qX4VZ6L5bcnJ_OiQ9Ge6WhkRoChk6YBoQY492gGt-Xw4DkABPavjhXddtuni_0JpY
    IFVsWWy1oINnEzCdTo>
X-ME-Received: <xmr:qX4VZysu0yZQhKlLqugtuJaCL99AcC8MHtDIUI1yY4gxEHncxANjbGe7Qc36F_He9Xf_9WiReChkX4BEA5WDPK3hsHTiOiZuHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudffiedtuddthfehffel
    lefhheetudeiheelfeetleevjeeifedukeeujeelkeelnecuffhomhgrihhnpehlihhnuh
    igthgvshhtihhnghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsg
    gprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhhumhdr
    shgulhesnhhpphgtthdrrhhupdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrgh
    dprhgtphhtthhopehlvhgtqdhprghttghhvghssehlihhnuhigthgvshhtihhnghdrohhr
    ghdprhgtphhtthhopehkhhhorhhoshhhihhlohhvsehishhprhgrshdrrhhupdhrtghpth
    htohephihkrghrphhovhesihhsphhrrghsrdhruhdprhgtphhtthhopehvmhgvrhiilhih
    rghkohhvsehishhprhgrshdrrhhupdhrtghpthhtohepvhgvfhgrnhhovhesihhsphhrrg
    hsrdhruh
X-ME-Proxy: <xmx:qX4VZ3a27GHXyDSHZhNBd0wpUshG79-w1IO_WmZ7PykvABtUbBA_bw>
    <xmx:qX4VZ5Z4wyJpWNgj2mGjx7FgInU2uDrAm2rvSUO___0MVbWa1ce2BQ>
    <xmx:qX4VZzC4vyqkZqdgJbvDKyLs4oYjOFC2xkHHGlrSHRfFXwH3iySVRA>
    <xmx:qX4VZ_Yd-lHnqyasXGYd-ndNiKWvqpT0U6aPLARGnES5548tWVWJCA>
    <xmx:qn4VZ7lgFMEf-ITjMJ0bbpUKaI4vlJJSJocnIi6kAKZS5L6Kd1QTMRJC>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 18:05:26 -0400 (EDT)
Date: Mon, 21 Oct 2024 07:05:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Andrey Shumilin <shum.sdl@nppct.ru>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	lvc-project@linuxtesting.org, lvc-patches@linuxtesting.org,
	khoroshilov@ispras.ru, ykarpov@ispras.ru, vmerzlyakov@ispras.ru,
	vefanov@ispras.ru
Subject: Re: [PATCH] ALSA: firewire-lib: Avoid division by zero in
 apply_constraint_to_size()
Message-ID: <20241020220523.GA10241@workstation.local>
References: <20241018060018.1189537-1-shum.sdl@nppct.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018060018.1189537-1-shum.sdl@nppct.ru>

Hi,

On Fri, Oct 18, 2024 at 09:00:18AM +0300, Andrey Shumilin wrote:
> The step variable is initialized to zero. It is changed in the loop,
> but if it's not changed it will remain zero. Add a variable check
> before the division.
> 
> The observed behavior was introduced by commit 826b5de90c0b
> ("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size"),
> and it is difficult to show that any of the interval parameters will
> satisfy the snd_interval_test() condition with data from the
> amdtp_rate_table[] table.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 826b5de90c0b ("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size")
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
> ---
>  sound/firewire/amdtp-stream.c | 3 +++
>  1 file changed, 3 insertions(+)

I think it a good catch.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Regards

Takashi Sakamoto
