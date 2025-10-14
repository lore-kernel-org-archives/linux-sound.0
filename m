Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642A3148AF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447367; cv=none; b=FzioC66SM22DxP8ODdvNJ8DWrcNknPOe5jcrcVzAbXj1InB/2ed7+Gtlu+9e9n5LLAwXAOuVXIlfswqGZvsMdvgCK0xngj/2vemUDCrvwMaauKETHSTmopmBaCPGE4vH+ur5jX1DM5gCDwy5ec/6ilmfXlqXQsHZIuVcVqoXyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447367; c=relaxed/simple;
	bh=+Kb/v9Q51RP3smqNhNIZx/gSn5Wb8VM99GANmLDV3SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeDCWxqzx/7P6SCL81i9wkph8bQTASGOl/OpZMXbGWG/nZJ7r74DsbXRE8kKUREg2s9GUEqtdt5g/ZOYxj5cIXgMiFNvoh6XfN+/O+HL8jwTt8SCF8sZ2n/OtPuPRtBz6lZnCwwt0R3iRTUvraqWRglj7ixTOLhlMZinS0APjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=d+TKa7YH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XchviEr4; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="d+TKa7YH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XchviEr4"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 28809EC0197;
	Tue, 14 Oct 2025 09:09:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 14 Oct 2025 09:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1760447363; x=
	1760533763; bh=o1nqWht0rwa42esLAK/LwkuvgcfzI2eRGNCzADs1Ahw=; b=d
	+TKa7YHz1NHSPdPNLD8eCqxV2A5ENhX52sJe/7ZBiNIjBtc5FGGzEqUv/flGDcOq
	UsIYZqh04CEk/BCsGWrT9bXWk0c2Et4wdUAjAi7l0NLEdIBQcWSP5sISlw+RGS77
	jZKZwEB5FH5+vbShj7s9CqyQKC+XBJ21UJ8ZFP7S0c1U6WFc/aLOihR4baqXe58k
	6epZhXmXlSKo1DqbA8xESUrTj+DL5H+8sY8GoGr0y/XNvnT+WFPzNpMF/u71irMC
	4ueP92F8cOmayq72BzP7+8SHTORK/aSYUp9lfKIh2pFC0qSzfNp2PgsyeYrDqW8S
	6FGw6nyatdr58CQNYn2cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760447363; x=1760533763; bh=o1nqWht0rwa42esLAK/LwkuvgcfzI2eRGNC
	zADs1Ahw=; b=XchviEr4ltih1zxxYbit8VzGBzp+cI7f3umZrWo+TLY8PeuABjR
	m+7FH5cmreMX770HVa/vSMnTm9mjn8buQN7UF9hwItQP5++82+uFGRZsiEKU/jdE
	Tvb/hebW78gsaAM4S3bmr9feTVBNG1faw0wpRh/ZVREtFuG/HMIMmPgwF9SE/AdG
	MCImeZKFSMASgsko2bJv6I5jmGrrOoPwMZyPJCYLA8zsGzdsW1HbRcdWd68yXnjd
	Eg1zY4m/fGOh8iezuNUhBFUTynA/9XRs4Be0GgvYK1xahTkpEn7wvDmY5cMzRS6o
	0KJRCL+9wowfNJONBakqbALRCWTOtQEOnRw==
X-ME-Sender: <xms:gkvuaJal9QHYHGcZ4Jwr-WvnizGGPrPb5vaa9Gy30SAnF9wghyI5VQ>
    <xme:gkvuaH08dvSbVfYZ-o1uxDuRmSU-XVKuz8mY9EDakv2tqXTFRL6XsGg7QIcjI0m2n
    JuaNgNz7WO_u4rGgP1yrQNS_yORUVHsZ-ycpYg2BNg4s_hUR8y-yA>
X-ME-Received: <xmr:gkvuaJUXaq79of2S_MVYRDQYy65jdcc-lucpVLw7Z3LDDMTHMAiNDGnpnMNQ_cKx56bWs3rvZzs643sTiVQyF65Y_8l4L-fV1WoC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddtieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeeiieet
    vdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhguuhhnlhgrph
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhifigrihesshhushgvrdguvg
X-ME-Proxy: <xmx:gkvuaBVsgnANgMYnVOyS6CgAUJOrAvOzhj-EpT7TjGQsws4kPHLG7Q>
    <xmx:gkvuaIdeYFiR0fNWY5phqPvWHVc9-tCvXL1XwUjpAWEcafYd8dFApg>
    <xmx:gkvuaKUK-3ailZfgA7QkZY8FN3Q0fOkgou0od_Lb1ZyKOtzGzveN3w>
    <xmx:gkvuaBfQYojAFJXQWuG2eQgF5rJI51Z580f5xtzcWeY9AlHLd8EQoA>
    <xmx:g0vuaEmyti7TX-mA10P9oss4ZCDgyonYGt4jkmL8oQRDcxTxyTx6Z4sY>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Oct 2025 09:09:21 -0400 (EDT)
Date: Tue, 14 Oct 2025 22:09:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] sound: amdtp-stream: fix enum kernel-doc warnings
Message-ID: <20251014130919.GA112801@workstation.local>
References: <20251014030552.760648-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014030552.760648-1-rdunlap@infradead.org>

On Mon, Oct 13, 2025 at 08:05:52PM -0700, Randy Dunlap wrote:
> Fix spelling of CIP_NO_HEADER to prevent a kernel-doc warning.
> 
> Warning: amdtp-stream.h:57 Enum value 'CIP_NO_HEADER' not described in enum 'cip_flags'
> Warning: amdtp-stream.h:57 Excess enum value '%CIP_NO_HEADERS' description in 'cip_flags'
> 
> Fixes: 3b196c394dd9f ("ALSA: firewire-lib: add no-header packet processing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Clemens Ladisch <clemens@ladisch.de>
> Cc: Jaroslav Kysela <perex@perex.cz>
> ---
>  sound/firewire/amdtp-stream.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
