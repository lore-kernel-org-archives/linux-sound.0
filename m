Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742CC1758D
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563871; cv=none; b=uUTRtKBuK+j+hS51hywNjZDI3PBpaBs5KGtMgPcfTG+Tptj41iqg1PSSmiUlDEXm1Itp73r4e03P/l6rNQRLkfWNiuFzRyer9+GCBkxbO7/YAeiZgDXpuhJCRX1le/jFRBWgLS7J3Z9om+E6Z3NAPT/Qe8WjLRct34zXj/ptidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563871; c=relaxed/simple;
	bh=9n0ipes3a+K1rLWUQUJFWMsYgjdi1oVlI02gGSrkneY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDaz+LvW0wtlZX8YGfJyQB2BUHwt85zO46bYBzy4Wt3GQxKjwdoaGIKmBhu3rG8mk42SJSv7h7p9mFMgags2wIZQvu5LXvj4H0frpV23WdnyRcu7v3Ha/UCPq30LhxDGJEz3ThqXrtRGhu2tzBz2yeGmTp2luNvOmByGtguLiRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=EzDHgoQp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pyf2z8SI; arc=none smtp.client-ip=64.147.123.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="EzDHgoQp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pyf2z8SI"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 97D0A1C000F7;
	Wed,  1 May 2024 07:44:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 May 2024 07:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714563868; x=
	1714650268; bh=yTqmmL9F1KXe5l5FZs/v8LTxAq9C75hF1YjZkMDAzqg=; b=E
	zDHgoQpO5UUow+MC7wpFbOUUxsH5N4VaouS2Fn5fJ0TGQ7DNs6qDTFp8El00gZtF
	M3wheMlm9LfI2ZcinF+3tqOm+g3VAZmF6fDe/5vE/aGyjPKLGzbytIX3eZeeFqjC
	kUnVXdVn3UL9KDVlSnMLRKucPSdJukGHa85inlZ3G2xO561oFPSDIQEq6EgWT6ph
	/B8y3dVW6oCrb6Exs3UjMZoP16nWhRL+jnREHlesViRB/PyKEHs6kRZ0Xkj2oHhU
	gr48WER2fuStKtaK7wCyt0SywImscwu5FyFQl90/IL113RyyDEpMpXe3AMtGMXhU
	4cRdud1LcbLtdI8+h32jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714563868; x=1714650268; bh=yTqmmL9F1KXe5l5FZs/v8LTxAq9C
	75hF1YjZkMDAzqg=; b=Pyf2z8SI3UeyZYi4gQ/k1H/6v2Q3Fo+MKgD8QHAafPJP
	xYenXYHeYnn4otufxroB1XBu6UTJ4Xw501xwPv4LA4ZYr9nP+tuql8gZPGaT2tVC
	+fxRft2zcwimFZKyIPtsG7xsPudqlnjURC8PqWYn+Myb+a4lXLBfaZ4K6FJ/ag8b
	dhZDXtjtPIENLQATrq+ReIVhYVqk15Yc4gThDUfewm2bzwT4iKv1K7i/huySVV0v
	nYN1gBLjS2k47hxyP/01YTiC9DuFPnA9KDs5o9qWpK+Gj64x6sFQ12P8VaKzoz1o
	a5RG3W2b9/INNGVWl3wLSlYzoa7z+6HEqWRd+9aWHA==
X-ME-Sender: <xms:GysyZgllHuYLhDzCFbUSd2FqTcXuZTEbW5OvnGDVdYdXJ5RcyXD9Cg>
    <xme:GysyZv02-YODyCzH7n7u2HBydqmZ_5oUrFehWJztaaUklUOrkkZ52Zy2Ls-wxz_xm
    SuCVoHYJzDu_0gBNBg>
X-ME-Received: <xmr:GysyZuoPICfV39X4jYegORUA8vj8TsBmXnPBNXGqCEOv8GKSpMeiCPk-5hEdYbT0lcSzdTRtMngVqH3JzQIk4wNYmyKLZ7YQT9Ue>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
    ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:GysyZslujlNuzWr9v5hjoyOmD2wvCbLxzY2sdSO2otIH_tSlaDWMiw>
    <xmx:GysyZu2FvTZ1CDhCGxo2-brDstgkaVJeKMjO2AdWfppuH7FMp9CgcA>
    <xmx:GysyZjuQZxLJXdDbwovDxq-OLYIeOGOH-N0qas3Z9xUyoa0JIpZSkQ>
    <xmx:GysyZqX8rnQyUQF-OpN_6HUb2R_whd05CSxcPDoU365zjkNMb5N8yw>
    <xmx:HCsyZjyiHRUszhxEsOjG-ixE2VtAOS2RCKpY5c5_15D3Hm9tYOKPaRkN>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:44:26 -0400 (EDT)
Date: Wed, 1 May 2024 20:44:24 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
Message-ID: <20240501114424.GA100916@workstation.local>
References: <20240430161012.4011064-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430161012.4011064-1-perex@perex.cz>

Hi,

On Tue, Apr 30, 2024 at 06:10:12PM +0200, Jaroslav Kysela wrote:
> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> internal command"), there was a possibility to pass information
> about the synchronized streams to the user space. The mentioned
> commit removed blindly the appropriate code with an irrelevant comment.
> 
> The revert may be appropriate, but since this API was lost for several
> years without any complains, it's time to improve it. The hardware
> parameters may change the used stream clock source (e.g. USB hardware)
> so move this synchronization ID to hw_params as read-only field.
> 
> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.
> 
> Cc: Takashi Sakamoto <takaswie@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>  include/sound/pcm.h         |  9 +++++++++
>  include/uapi/sound/asound.h |  8 +++++---
>  sound/core/pcm_lib.c        | 13 +++++++++++++
>  sound/core/pcm_native.c     |  6 ++++++
>  4 files changed, 33 insertions(+), 3 deletions(-)
 
Thanks for the reference to the commit to cancel exposing the data of
snd_pcm_sync_id union in runtime of PCM substream. I'm waiting for seven
years and it is time to delete it from the runtime structure and post the
series of changes for it[1].

I have no objection about the reinvention of some parts of UAPI to
provide any information between several PCM substreams. However, the reuse
of snd_pcm_sync_id union is a bit disapproving idea, since the data have
not been utilized effectively past 25 years or so. The re-introduction
would be a kind of 'history repeats'.

I think this is a good opportunity to invent for your purpose. Let us
work for more sophisticated way?

[1] https://lore.kernel.org/linux-sound/20240501113445.100817-1-o-takashi@sakamocchi.jp/


Regards

Takashi Sakamoto (not sound subsystem maintainer)
