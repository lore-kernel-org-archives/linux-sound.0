Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3160230FF3C
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385793; cv=none; b=Yt1v4mqsv07qaB6dpfEedyBARVfQ/saP3kVvj4ZWhZ1s8mcHUyE8Bxy8VLf+vuptXASJx/eWnmA10VSRaNunzJ3KU4WZ3/hBDh8tTei8c48ksbnbMzHbf6I8LqpRW5gyxsduiwye1RH+C7cGQoceAxZayu51DNY0uX7ibI9iwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385793; c=relaxed/simple;
	bh=w7Mb8IbjpTG1LNxJgWjyj9IyC2doa9g6aNhPGmeo16o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqpkvREuYK1eYZxbOhVtqHFc5myo+z8XCHgQADvTetlXHMD41nZSfBS1RN3hdeJ9uTArll7pbtbyrk7PI/O6KJZ3XXqBseXhj65bUpeDhgfOZOdHkXRidQCvDQikok2b1xvTgb/YkmoVNhiIW4W6Ix5AlRwmi5GoprgjD1dNf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ax4QEuUD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TaHiOVDn; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ax4QEuUD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TaHiOVDn"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id F11791D000E0;
	Thu, 28 Aug 2025 08:56:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 28 Aug 2025 08:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1756385788; x=
	1756472188; bh=eEenZfMb7oKCp61aBANMJ6mQ+H+Gwv0eyds6jzQXqCE=; b=a
	x4QEuUDRlmr327LXek6xxqrT8GQwqmjcItUQzwdw3eWG5q8sklK84eshSiSHfCL1
	J40Upwy3NdLCYfJMXrgR/YzX9y0ObXwhjwycKuJKrXmuatvQMMnzaZ9efv1Pbvt4
	LNk3JnOMypy7ox5Qag0Oz90FpKBoA7OrwiHW04TP21WKEaqkdj6O6P5eNOIUWotP
	Jt3Q2396o49FgRQol73HhmSSOliUeYX3AoWAUUdVnadDZI7TJnDAWu6kry/S8tNQ
	/3WQqz7Ex0Dii6Q77E9O2Xk7r90/NiCryxqrLixDEKYlNAjsdxVnqSB3QzdbNOO2
	1AHPPjm9e265ZKBLzhtbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756385788; x=1756472188; bh=eEenZfMb7oKCp61aBANMJ6mQ+H+Gwv0eyds
	6jzQXqCE=; b=TaHiOVDnZwqhqUhQgxDjw4kzXukhJG1VOm54WUBiHRKOeRsiHmG
	bsAu7numplscnzvI2dsu0plErSN0w77zUeecV9CDZ/rg6DSX+RfMRysa/NSageF9
	ZhHhOK4o0ZkoQoEd4vwOAH/zzw4Z9/8fXhnw+R91GBS9D45Nh2bBU07C0Iq9R8Mv
	dZwqpBrX1mWFO5ZOe9e0PBfbr/Z8wjNLZL9vCcp7XtyquOD/cXRipoGA59oWVIkg
	sHAkO4xwS1HGDZmVTPhlRut88/Ap/jh4LbgiVqRrCI4mp4MQz3XoLeDsutReZl3q
	VkQCLXRiGRc1G8Q5AX/U7mFXgu09yfR3lAw==
X-ME-Sender: <xms:_FGwaHeadBSo95D3td0i2Q4avNQ9B7T-z2WtlzsKH-zJzX5qRWkiLw>
    <xme:_FGwaAe3nkTHdSVyEd5orwMuFSDFIWdU0FEamXg4jeDW_3UcULwJJEKktydOAa-6Z
    ckhzjDRpY_gsKzKZ-k>
X-ME-Received: <xmr:_FGwaJ-7QoXrYzDYgICxBe4Brrmdhyb7jYvYTd3AP-SmUoQSVTEZ1ioLaUsCb0iJWokr4aq9QYBc_rqDVIFy-_Mkz_EyKGeL_3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedutdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeeiieet
    vdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhifigrihessh
    hushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghlvghmvghnsheslhgrughishgthhdruggv
X-ME-Proxy: <xmx:_FGwaEk48PQbMl_MEXW7bGDfUzZ7xLf9nwnX6St2l26hgFyA7c001Q>
    <xmx:_FGwaD8Ot1jqyB9yJ0lt9uLEcJuu_wSASayLWSk2QOGZUtcA5csPJw>
    <xmx:_FGwaKm0pG4X_xorNQO65Q4kyyRNGYQYfIYTsLUT-pSWq5CU3Jy2nw>
    <xmx:_FGwaI2Ca5PBJiIdUJwnoA1JmYstp4gXdM_9wk_NDOcxxdCsWcgueg>
    <xmx:_FGwaES7tCAUBr0miRBS_dIDKE-bNCgQ2gQOiicBphIbYv_PeFLT-53U>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 08:56:27 -0400 (EDT)
Date: Thu, 28 Aug 2025 21:56:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH 00/19] ALSA: firewire: Use auto-cleanup macros
Message-ID: <20250828125623.GA346302@workstation.local>
References: <20250827092017.29014-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827092017.29014-1-tiwai@suse.de>

Hi,

On Wed, Aug 27, 2025 at 11:19:54AM +0200, Takashi Iwai wrote:
> This is another patch set for cleaning up the code with the recent
> auto-cleanup macros like guard() & co, applied to FireWire sound
> drivers.
> 
> Only code refactoring, and no behavior changes intended.
> 
> 
> Takashi
 
Thanks for the patchset. I have the similar series in my local, but not
yet completed. The patchset mostly looks good to me, but I can find
some nitpickings.

> ===
> 
> Takashi Iwai (19):
>   ALSA: firewire: bebob: Use guard() for mutex locks
>   ALSA: firewire: dice: Use guard() for mutex locks
>   ALSA: firewire: Use guard() for mutex locks

The patch title misses 'digi00x: '.

>   ALSA: firewire: fireworks: Use guard() for mutex locks
>   ALSA: firewire: motu: Use guard() for mutex locks
>   ALSA: firewire: oxfw: Use guard() for mutex locks
>   ALSA: firewire: tascam: Use guard() for mutex locks
>   ALSA: firewire: fireface: Use guard() for mutex locks
>   ALSA: firewire: isight: Use guard() for mutex locks
>   ALSA: firewire: lib: Use guard() for mutex locks
>   ALSA: firewire: bebob: Use guard() for spin locks
>   ALSA: firewire: dice: Use guard() for spin locks
>   ALSA: firewire: digi00x: Use guard() for spin locks
>   ALSA: firewire: fireface: Use guard() for spin locks
>   ALSA: firewire: fireworks: Use guard() for spin locks
>   ALSA: firewire: motu: Use guard() for spin locks
>   ALSA: firewire: oxfw: Use guard() for spin locks
>   ALSA: firewire: tascam: Use guard() for spin locks
>   ALSA: firewire: lib: Use guard() for spin locks

In my opinion, 'scoped_guard()' is available without blaces when the
inner component is just one line, however the above patches include
such lines. Additionally, some parts of scoped_guard() are followed by
useless blank line.

$ git grep -n -A2 scoped_guard sound/firewire/dice/dice-pcm.c
sound/firewire/dice/dice-pcm.c:199:     scoped_guard(mutex, &dice->mutex) {
sound/firewire/dice/dice-pcm.c-200-
sound/firewire/dice/dice-pcm.c-201-             // When source of clock is not internal or any stream is reserved for
--
sound/firewire/dice/dice-pcm.c:302:     scoped_guard(mutex, &dice->mutex) {
sound/firewire/dice/dice-pcm.c-303-             err = snd_dice_stream_start_duplex(dice);
sound/firewire/dice/dice-pcm.c-304-     }
--
sound/firewire/dice/dice-pcm.c:316:     scoped_guard(mutex, &dice->mutex) {
sound/firewire/dice/dice-pcm.c-317-             err = snd_dice_stream_start_duplex(dice);
sound/firewire/dice/dice-pcm.c-318-     }


Thanks

Takashi Sakamoto
