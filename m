Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3792AF15
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283655; cv=none; b=A5DMzAlPtmAOmNrKCAQXTd22M1vtVfEdj1fto2+RSty4wNjdFC7TaiVo5Lia6HOjJIc80CqBYu3/y6TBRulsMdNmVmhtz5rLu6f8HDrHtqSbV2wOz98ja0Xn5gccIQsqcsJf0S2F9Kdf06g15jVzExydaS0mtcXx32hDEhdjMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283655; c=relaxed/simple;
	bh=JnVNdx3sIXtB5sOvmMnqmKW7+ijuIomz5RGn4coQ/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2HUDurGSSJB4k28LgSekDgwozRWV0s1bc3RDyWw4MzMlAOb9mxLz9fVSolwZsKUlykcwrh7RyzbPQK3cVe1byuY8JLUzry4SMZn0w/2cFYUZtMe0vcdZG1GaXmF1Im/QL4MPIeLToLiapAdV0d8DMUpl3m0qJRsPNFaNr5JFaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ghh+nRkL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m4/eWAd0; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ghh+nRkL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m4/eWAd0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BF0E611401F1;
	Thu, 13 Jun 2024 09:00:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 13 Jun 2024 09:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1718283652; x=
	1718370052; bh=3mC4PN9pQork/ZKLcpYEtKUu9JBdJdfQbEnmLGfla/0=; b=g
	hh+nRkLySu1uEQXrpxqMVUtWXGRM5AbMpL0gJZnDLsM2XNgC6pVCWUGeU3d/4ec+
	owrhguDSadtEoeFT+1guvj4xxZha4sBruYgt5IWoXl25ZxJtHJzz4ioL7UUvkzIi
	pozQ/e/8PWZ/vqdEIahmAmcX/T1gQUfYM2GhbRUXcwJN7ZgZulbfFzdP4TLjUfkI
	dMZjEPmb0U6k90T7ObjLoWtETeOM9zjFxE0BNTzNSKMK4JPEI612Xt9FswzMSMul
	r6SW+Jp29gPKxM6DHJnNgojDnk/VJV/IG+JsPp0RbVUl9WW6t3WskptyJwUSNHxW
	7Mk8NdEopCJw4dE4K9iQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718283652; x=1718370052; bh=3mC4PN9pQork/ZKLcpYEtKUu9JBd
	JdfQbEnmLGfla/0=; b=m4/eWAd020IJrvvbv5l59MijCrR2j2c/0tvA6mXA4X/A
	N7Sqikws32gkSmY/+mnlirUg05PrFrQi0xxjRxK48nq3hlvEadhtA985YZtmoLWE
	8mvkGpqabaOdv8fjoER+7WxWgOzuyBMOkREEeD1cO5L8jGtZsU17JqDbjBRC/Yac
	aZbmYkxNQ6LgHaOyuQds/XoeU0fa+MXrD6USdHqkwiPjMrAgDMaveCDsgkjCQBDk
	mZPQl1XbZpO63FBwavKCSwjSp7B7nLYBQ57PIOyIq+FzDi1ylvlfyXPa5/0L/djP
	3Bel7KBg9lc+t3I/McDYZ0nUfq/fmcDrSowQNWEhuw==
X-ME-Sender: <xms:hO1qZklSb32W-ZiKxt88lnitamVdJRDKveNRELpFLv78Kq0pAwEjoQ>
    <xme:hO1qZj27ld0fwzQTg9WTTwp8maJDOcymBycjgKoMXzk2wA_fXc4ULoA26HaVCr1fD
    -dY4CclhRROC8Opyg0>
X-ME-Received: <xmr:hO1qZirflVi3C7q_B726sH-phcP77GaesipUpXkxq0gp-GB2t-qtBYznoiE8ASNm6cKTCPZTuZOsVYY-CPequx_SkYhksjoqYhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:hO1qZgkt68lTE2BbOsIKTtTBEQfcO32TlgyoOZQqoKBQLKrDWqD_og>
    <xmx:hO1qZi0HKNIDkSW8m_KkwQDZ8s0vgcutN8yULZ7MKBqIFW0YYDmjhQ>
    <xmx:hO1qZnsY4JW5Wq0Pd-cnOG7a1082nkahYz7hYyekYUeoNq59qO4DrA>
    <xmx:hO1qZuV_atRZbn_ycS8hk7ArfyOCTHs8iPcOpR5z0LdftsfCufk9Ag>
    <xmx:hO1qZnzyhlWlYd6Rt2RLSnIJjIk98tjQZMgIEqE4Rhuj7OZzwRcq0bFN>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 09:00:51 -0400 (EDT)
Date: Thu, 13 Jun 2024 22:00:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 2/2] ALSA: pcm: optimize and clarify stream
 sychronization ID API
Message-ID: <20240613130048.GB421852@workstation.local>
References: <20240507133551.607171-1-perex@perex.cz>
 <20240507133551.607171-3-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507133551.607171-3-perex@perex.cz>

On Tue, May 07, 2024 at 03:30:51PM +0200, Jaroslav Kysela wrote:
> Optimize the memory usage in struct snd_pcm_runtime - use boolean
> value for the standard sync ID scheme.
> 
> Introduce snd_pcm_set_sync_per_card function to build synchronization
> IDs.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>  include/sound/pcm.h      | 16 +++++++++++--
>  sound/core/pcm_lib.c     | 51 ++++++++++++++++++++++++----------------
>  sound/pci/emu10k1/p16v.c | 16 +++++++++----
>  3 files changed, 57 insertions(+), 26 deletions(-)

Ah... OK. The most of changes in the previous patch is dismissed. I
think it better to respin the patchset if it would be merged after
passing adequate reviewing process.


Regards

Takashi Sakamoto
