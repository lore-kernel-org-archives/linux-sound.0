Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4DE481B1
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 23:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756511228; cv=none; b=YDsRdJA25eE/T4C4pcoFtX8BYyNNOn4hpMYzPaxrES3U8usOYNQd0ADKMAOVEAMxu0PnvIPJH5x+Es4EfFgH6BA9h3o43NTpUOUOjw3vRUMaWrJGRnmD2HGDTVfdrD8IUfkouJUBeu6hUf9JGFLuiXlnb2i1boWa+8kE7OXJjVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756511228; c=relaxed/simple;
	bh=mYMKyoA8RIK3UUy5noKMxD4NUAv/oyIOw0fXqSvDTE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFMU6Ajp3asKiQKv3rl5mCEGxyEm14w5aLYkwYhBSF1U2cUkd7VUPaQq3P0VkCGtL/B7oOi/jZbC6pDYgOMATXTTD+mnCqN7adfTUmahfyAAGnu3JvEpuAKH7hNMXYZ6lMBHiukbNStFG8PrsY0BPq3ee1puTgv4j8LozIl3u4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=RPUC4VKi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nX4G5azu; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="RPUC4VKi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nX4G5azu"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 29FF87A0129;
	Fri, 29 Aug 2025 19:47:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 29 Aug 2025 19:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1756511225; x=
	1756597625; bh=KyqvAjyIHI7CuQ8RAAFbQZBqX7g+Sthw3y87XBxuMpc=; b=R
	PUC4VKightZmhfbpGfkLbJLqrsryMtMAdhwFko8B/KzR3/3UlFLu4bogGvf2j9gB
	U6tN/2Tn4EIwdIHJf35aF425CtN2n1AkSW/jJWucZjles1te+BRzK2LQL9Ure/vL
	Kxi8qNirwlkI4bxJwWAzuleNHVPyQlCJXxOS9wwYxt9upb59xoYWDHxr7BfOcdVA
	+lxwI37/+Gk9heWWgGsEmS7Ge2jvtg6srYX9ifST/JPjzNhSIpiIM4oRldbundzh
	MTaXJGTey2rUq/Isol1OUC7+tI0p+x5t+PXeAkmlD4OioTPYYASf68WX3Da81gBd
	SGtidbb1CEser3/fN155Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756511225; x=1756597625; bh=KyqvAjyIHI7CuQ8RAAFbQZBqX7g+Sthw3y8
	7XBxuMpc=; b=nX4G5azuhroyTitHf0i49wbn9bF8L0ElDTrs0ML0XYQa//8k0IU
	eqMQCaGsgvZAlzWyvA9eRaMNy/7LWA3MgDib/o+UVDiajOaR3mTNh3MdPd43zIbN
	YcCqO6aLntr+rEnBXlEpetYwMspRjoOYsDPvwMCuiojVUbJNAOa5VXawnWHKCr9l
	24FqCVO/vMW4a8LqMioiLqcCzrlV3Xc6PSl2wYMC9n05poyxQfkc8n/Fn1ik5s6a
	K1uZejANqc/AEGLv1DWbAsC5ajKe5bQtnxIbAMisEIxkgtuf35w2OvpIJndEwdEy
	HVfjkPfRabZ2J1fNmrSOyF1ivtYcxZxrRPQ==
X-ME-Sender: <xms:-DuyaOAk1wXhHLtisWKEvj4aCGLFozo0GcOd6BEhJeCdLRmsHkHfIg>
    <xme:-DuyaLz7uTpWT2rgnMq2OFXXvWxwQgyDhC6h0ykMrCD4paYSASH9JxzHe4nr8dl9u
    vX1fbxn4QApTv1fMBQ>
X-ME-Received: <xmr:-DuyaLCadRuvxZ9puSQNA3GfWTOV_K06EAbM-eKwweT9IqiR4luxJpnFwiK-0qz0gy-a7nu8jwWsxaEz5EnpRNNCHR4q2kUo_WU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeegkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeegieel
    jeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoheplhhi
    nhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtlh
    gvmhgvnhhssehlrgguihhstghhrdguvg
X-ME-Proxy: <xmx:-DuyaIZ4rv4FbZf9cnd39Dxx6I-Xw08PsrYGO9sS2owm9Pn1BxI4Sg>
    <xmx:-DuyaDg2q4oskitMPzEvn3vr02NXB2LkV5dlq4O3fJ-wBqklfVbIOg>
    <xmx:-DuyaK5vD9fhmbYmqidJm1V7vzqy1qiKIm00ZC3J5HjYxM8Lv1XR4g>
    <xmx:-DuyaK6hf6t7yJ0OqpNXh1dsEUO2HmB5gHG0wA08rEai0Z1G6MoL-w>
    <xmx:-DuyaNEsM4vjsfq1tjeCF5C-VuCv8PPwEktBGiYtW7qkp5p48qz4ZQqM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 19:47:03 -0400 (EDT)
Date: Sat, 30 Aug 2025 08:47:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH v2 00/19] ALSA: firewire: Use auto-cleanup macros
Message-ID: <20250829234701.GA362429@workstation.local>
References: <20250828132802.9032-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828132802.9032-1-tiwai@suse.de>

Hi,

Thanks for your updates.

On Thu, Aug 28, 2025 at 03:27:04PM +0200, Takashi Iwai wrote:
> This is another patch set for cleaning up the code with the recent
> auto-cleanup macros like guard() & co, applied to FireWire sound
> drivers.
> 
> Only code refactoring, and no behavior changes intended.
> 
> 
> Takashi
> 
> v1->v2:
> * Fix missing subject prefix for digi00x
> * Drop superfluous blank lines in scoped_work blocks
> 
> ===
> 
> Takashi Iwai (19):
>   ALSA: firewire: bebob: Use guard() for mutex locks
>   ALSA: firewire: dice: Use guard() for mutex locks
>   ALSA: firewire: digi00x: Use guard() for mutex locks
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

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

By the way, I found a bug in ALSA firewire-motu driver (that's on me...)
when reviewing the patchset, and sent a patch[1] now to fix it on your
for-linus branch. It could bring a conflict against 16th patch in your set
("ALSA: firewire: motu: Use guard() for spin locks"), and I would like
you to apply it at first (then sent it to upstream), then applying the
conflicted patch with handy changes.

[1] https://lore.kernel.org/linux-sound/20250829233749.366222-1-o-takashi@sakamocchi.jp/T/#u


Thanks

Takashi Sakamoto
