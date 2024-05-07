Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D53441D
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 03:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715051088; cv=none; b=TT2XvgUiV565uuXvxLmOMNVwcqo07ac1pr6GPBe20wGuWqMNK9XsPS17ClYRD0qYjNd+VGpJwxMd6IElCGuZUx/tQBXADM85Bsei5WUVo27NAtEbVJXjsYLW1DafrtjxQeel2z2/7twNJmuDUbQ6HcbdDBqTL13cFm9nam0gR20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715051088; c=relaxed/simple;
	bh=VhpNR7z7ioAOSG7wjUlwMNaSt3VXrP/Gm9A2nKvoGeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy+qraVmjWCDZTEBiR9NE2NRCCM1Qvie8Wtw3wNg4An87c+4SprVj8J2jgTiFWTcrZ0XyYEp47kLt9oA5KxPFzUyz6GuVwXBC4wjpabtxlLhR6bXdXznI3wTOUa6vuoiAiMGkauq0QN5WObBF1U9J3yGOYREwlPvdVEF4sZ69F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=RorcnHLz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LNxvF/75; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="RorcnHLz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LNxvF/75"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 27D3E1C001A8;
	Mon,  6 May 2024 23:04:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 06 May 2024 23:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1715051085; x=
	1715137485; bh=byJ1gWMyw9OoMAu/DygCL04aQwO//q5BLPfTubK5GAA=; b=R
	orcnHLzJkxalCazKIieT0ChVS1lKW+2id9En0nzXZ9YTul+RvPGdcMP5KsQL0G7b
	RhyQCKFbxRSjEztnEQGCdsTl/LSfoW8D8evOQ2R9235amEZWwJHd/KVUmQA07RFw
	dma2TlVO7xvnMsB1X2CKj5qh+YKGin/M2KVPmdZvfAvkAlBuWD8H8RH9zD1E/BXe
	Vpmh6AvLFFOGLMDi57iI9r/nfesNWC4E1Gasz1SlimKRabVvuZmjzprPOuF81T4V
	BGNCOMgRy91NQFrxBiIESAd839zNZaj3+E5O35DhtquPAfE3aXOLF2Uuua88UYFX
	CAFKcJlFVMBOoLhdklHqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715051085; x=1715137485; bh=byJ1gWMyw9OoMAu/DygCL04aQwO/
	/q5BLPfTubK5GAA=; b=LNxvF/75csqiAIik9Pgu0FyQAPxuVc98wNNM8s9dOlpM
	DR0VDEDKyIKZ75WaavgInMU+LRDGcidKNV7q9/+8bMs/dUchlod1JgshkOAHZCmD
	JudoZzkqpmGUiHuO5GqiiBw+qDK+CCHuHjU9uIE5jbRUpMU80AyZG0U7UFJLpPto
	+CgRJwe2lOt8Bbd13bmvlGL5LiaQLlHcEbgH5AFXnYul/c0NLUrkM4hTJnV6zRYk
	ziEiERL7ovNJVBTd9uEihlqQ4qJ4lU4yMK5OmIsTne0gQP/KPXDD1dGn2ztGAdbl
	Eld/Ck+yHiaWzsCYYfWAX9klOOeCYBZ7ay2Y3iQ8YQ==
X-ME-Sender: <xms:TZo5Zq-Dh0zZ-Q6hYH9E0Buyg1kD_aTQAxFjVt25NVRE7ysvembLUw>
    <xme:TZo5ZqtnTMW26dxziuvR17g04kY0uTqA4k3Y-ffEHY2XqVxyrkEKbUy2GGsIVuXyA
    n5REsqBsLIkLtI0oAk>
X-ME-Received: <xmr:TZo5ZgAesHnE800PYhP8fuSH-2HSCQuHSLW-gSRSyf7Zo7aSDfDXL1GGZsWTLnlWFwRHucYcpLsFbXcbeXJ6H5hfrNUvU-EHig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvjedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:TZo5Zicy1PcLHCLjegFP9A_5lCbgJB_euEWMBs1byl4_bVUvOpC5FQ>
    <xmx:TZo5ZvMooHQu8KsWjnosE6nnjWYgpP6THY8aSv4kp4ihte_IIGAQew>
    <xmx:TZo5Zsld5of6W8WmMH4z1RC1332fYEDfNrt4SOd5UMS8SK5w7ljUTQ>
    <xmx:TZo5ZhsWQgvoFqciXi0XOEbO9KC1cXoJePgCTX4Pc0-poGFuKJejzA>
    <xmx:TZo5ZopTp-PcBjRKvuaXKDOc0PJCEddcyq-86ZeSG8BVFC8zjWorxDGR>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 23:04:44 -0400 (EDT)
Date: Tue, 7 May 2024 12:04:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/2] ALSA: pcm: reinvent the stream synchronization ID API
Message-ID: <20240507030442.GC413281@workstation.local>
References: <20240506151218.377580-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506151218.377580-1-perex@perex.cz>

On Mon, May 06, 2024 at 05:11:48PM +0200, Jaroslav Kysela wrote:
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
> v1->v2:
>   - remove union usage per Takashi's request
>   - reduce memory usage
>   - use standard ID generation scheme
> 
> Jaroslav Kysela (2):
>   ALSA: pcm: reinvent the stream synchronization ID API
>   ALSA: pcm: optimize and clarify stream sychronization ID API
> 
>  include/sound/pcm.h         | 18 ++++++++++++++++--
>  include/uapi/sound/asound.h | 13 ++++---------
>  sound/core/pcm_lib.c        | 36 ++++++++++++++++++++++++++----------
>  sound/core/pcm_native.c     |  6 ++++++
>  sound/pci/emu10k1/p16v.c    | 17 ++++++++++++-----
>  5 files changed, 64 insertions(+), 26 deletions(-)

I reviewed and added some comments per each.

Anyway, we are at the last week of kernel development process. I think
it better to postpone the discussion about this kind of changes until
releasing -rc1, if people working for the task of quality assurance to
the new kernel release.


Regards

Takashi (not this subsystem maintainer) Sakamoto
