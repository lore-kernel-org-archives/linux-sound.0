Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B52A1CF;
	Mon, 19 Jan 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812762; cv=none; b=eukWVvpHpjBIUxQSHbkyXi2452srCH3Nr+qN3Yz9gHPSbuN8nHPLW4QyhfG1lZYnJcVcQFtLDYlxZCzz4x5LU6SoU/aIUGv9zx+0ZpWHIpuY17KiRKSwpfIP8jKL6aoeYx5vNkDqDRJ7+kbRsVb5sjFTHNFfxVhBYgAZQAJfvF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812762; c=relaxed/simple;
	bh=HUfvF3v7fftxeqSGCGny/PudTR1bVhC4De3fMzb/IGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbEBrDU4RKv0SnEcGxSfnCfgJaG3wn6xhy7lxRuTJWKarA7h3ISkle4wdsPFztn8SY9m/blYedeOqiL/wMv6tI8HZy2Y1EcLb6bdb2B3On8XYdlA6AAYdq+QGlvxVJUgDmVz8Im5+bR1iJU9HXevJHmaRHNUZiXwhpIeRGEov2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=dnk0T/+F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NNxpw/bS; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="dnk0T/+F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NNxpw/bS"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 28A1FEC0496;
	Mon, 19 Jan 2026 03:52:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 19 Jan 2026 03:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768812758; x=
	1768899158; bh=TF6XIg4jE6EC+GY0B6MKo2BB4PAz2ujR5heuZDRckfI=; b=d
	nk0T/+FAn/RqND77wBu42ll1UvSLb/nphvNTfTBicjUpJdwbyLKboTQM4uMMTvPj
	0JIWsc7fjY/KD8wr3dVSK/nwD+gcZdrpf1qi+ge2td1sIOcsSHUYv5pFq65Ow63u
	KkKoDilxZv71naLzdrgJVFVvWv3putpcPNVRip0zZ9ASCVgIdcQkg8UlxqrD1He+
	wyU2nY/nzh8kY97KjV2m+xcm7lU5dcQphJMUQ309EVJDTy/JIp+k7kuoOKXGG0TB
	rKiHlH59aVCYOtCmXtVE1xlxc5GP72q9NPe1cJTZMYH3WWtG1a0lGbSOGUIe4/rD
	Emqe8IBYNtOCnIOdU9q4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768812758; x=1768899158; bh=TF6XIg4jE6EC+GY0B6MKo2BB4PAz2ujR5he
	uZDRckfI=; b=NNxpw/bSijtIpnkD2rTJVRTtLF1ahv2mgQXI1sZbE0iYM1nGqKQ
	eE8olIpGqTbWBZ35sUcs5/HAL3i6QgRDa9u1x9mnYxIpiCyAFqVLkjNyjdd0IcEW
	h2EkjCMGC88OpK9cISYbTrjAmXJ5cfXMVtP/QELY67SGD1OJ3mUhhq2rAEVhUS9q
	bR37mG28aEx8WltKtjjWZ8S4cb350DmrtNLNd9mAugvSry33+GvvPu/5itiHyEGq
	opvpqb2oTH2IFGyMRdTOhMeUufg2xi9y1J8r8ASdFaN1/2T6QLso/EyYtsrxcdT0
	P7zvqoMgwN0FyiwXs5y6TxDSJ1+lurVeMcA==
X-ME-Sender: <xms:1vBtaSJvi4lBRRKZyDZAAmroKHclyi5lEOKWJuthzGNXzAK1FTIZNw>
    <xme:1vBtaVDnYTPde2FaLiqcUqBvkQh4b_GXzOCiw2G9-hvOCxUq3_4YLlCWyMAsWESND
    GH8DbWP73gqQZ7leneZm-rZLjtEG7lV0xGYdw7qNfepua3rX44aY1I>
X-ME-Received: <xmr:1vBtaagdcNdBB5GonYHxG2-L7noM_qFGIMelIT7LXccrXkaJ5k9_oxup-y4mFcR7JlsdBn5XLEocsGNiRU3jYsghiL4L3eSxqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgf
    ekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1vBtaVmeK-ps0CEvnIfpQQIsJhHGzNozOB6xlkwPa-AACRIFw1Q46A>
    <xmx:1vBtaepvAuZb5b3FfiwHPy4Zbzn_FYF1S2tpV3Rp3JIjWwbKW9WMEA>
    <xmx:1vBtaWEYj-TnhS9L1cPWD5NZ3a_eU4DrMnoI07XFjTSFOuKCO6HZlQ>
    <xmx:1vBtaSzV1sZSVdG6MNvCP73PA4rfaPyqhNlAHi6PqOs5s6YeiVaiiA>
    <xmx:1vBtaXSDI48e_N5_yWivWFBBO7Xj9LU3ynC4qYiDWOjoU-jF6m4X1Ei2>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 03:52:36 -0500 (EST)
Date: Mon, 19 Jan 2026 17:52:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] firewire: core: add fw_iso_context() variant with
 configurable isoc header size
Message-ID: <20260119085234.GA490537@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260117142823.440811-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117142823.440811-1-o-takashi@sakamocchi.jp>

Hi,

On Sat, Jan 17, 2026 at 11:28:13PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Currently ALSA IEC 61883-1/6 packet streaming engine provides the maximum
> PCM buffer size constraints to drivers for audio and music units in
> IEEE 1394 bus, due to hard-coded size of isochronous context header for
> 1394 OHCI IR context.
> 
> The limitation is inconvenient a bit, and this patchset removes it by
> allowing the drivers to configure the size of isochronous context
> header.
> 
> To sound subsystem maintainer, I'd like to send the last patch to
> mainline in my side.
> 
> Takashi Sakamoto (9):
>   firewire: core: add function variants for isochronous context creation
>   firewire: ohci: refactor isoc single-channel state using a union
>   firewire: ohci: code refactoring to use union for isoc multiple
>     channel state
>   firewire: ohci: use cleanup helper for isoc context header allocation
>   firewire: core: add flags member for isochronous context structure
>   firewire: ohci: allocate isoc context header by kvmalloc()
>   firewire: core: provide isoc header buffer size outside card driver
>   firewire: core: add fw_iso_context_create() variant with header
>     storage size
>   ALSA: firewire: remove PCM buffer size constraint from isoc context
>     header
> 
>  drivers/firewire/core-card.c  |   4 +-
>  drivers/firewire/core-cdev.c  |  30 ++--------
>  drivers/firewire/core-iso.c   |  16 ++---
>  drivers/firewire/core.h       |  13 +++-
>  drivers/firewire/ohci.c       | 110 +++++++++++++++++++---------------
>  include/linux/firewire.h      |  33 ++++++++--
>  sound/firewire/amdtp-stream.c |  31 +++-------
>  7 files changed, 125 insertions(+), 112 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
