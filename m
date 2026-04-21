Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A330E0EF
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776047; cv=none; b=ltTsAlouERlOkIZOLeZEQhJ9gT0ByLCF9B2hVA1RvDIcQkZDeEQYX8vR0JPgBodNDbgJ8eIGOI2e7zBncZuKqwkXZSr442cirJqcBqAfX44iygRS6+tbHhzLwGj8ii1Uc4fUap9ABBJlswdZ3u4mcfK6fZS6+GvulyTJcjJVyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776047; c=relaxed/simple;
	bh=9Xa52p4RWskyRirzJ8S60Ao7aOMxs/G/qy7EvxBiiDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoSZTIeNwn+z3leiKjk5DupZNg7pcQK1Mer4jmkIAANcLGTp9PoniMOKTRpHBs0gi0BZE3ZLh9Tywd5Ax9NBVEucQsDq9MvYDDRVq5gmwrv2AE3MsFpLBelkQXw+LtXp7LpG1chUCyzo+/sLh9n6KhVpin6dmqi89QXUJRq1hPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=y8zNR6lP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q8ydyVqS; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="y8zNR6lP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q8ydyVqS"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 126A81400123;
	Tue, 21 Apr 2026 08:54:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 21 Apr 2026 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1776776043; x=
	1776862443; bh=djC/dEPE2AYmdFyhcKi2RGjfR1iKIsQJOcUjzkIu3KY=; b=y
	8zNR6lPix7/ZzSrcS+9vCp7Z4CNfw7U21SIxxs6cbFGmy0ESBqR5BLCxtjXJUgZ2
	ii/80ScLBHe82yuf2nQ3gRQTkdKPGQuqtBHBq6EMfN9Fi6x7NYrk5TXT3zn06y0k
	wvlIhvHh6bEt5WbXBz6/kytK8ob7gfE7NYwXHLa3gFQ/EBgmSKeE0iU3m1YHSmIJ
	pFMAkSWIc060VoY8XoUiOJjLBJVVTENtUfHUaTPe12i7plDo70uxQD9KKbKIb+aq
	jB8dih7w54UnZW0lHBFFDLPda9w53NbSz9bt+pK2M8TzcoAdnAl8AA3lb+MqeguJ
	c/xl/y1G9huX1QZO2Aopw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776776043; x=1776862443; bh=djC/dEPE2AYmdFyhcKi2RGjfR1iKIsQJOcU
	jzkIu3KY=; b=Q8ydyVqSqDqGKfRpNdWRu2gffJxKbVOxfSgl3RHqWIKYDepNxW6
	hgdEvgH88xzCSGGeM9KDweB63Z0O6FsJZCO0xif7Z6fDL232LDvn+mzHkEtwJF2u
	EGYZAYltoFyANCQT/ryG2BrJKCl8yjo0kMHMqKjXlvRtuc0RyR6EdCJRZ9PLD+Qy
	jvltytmTvSmO3UIOxFPi/G2bRHNUOKOI1xNCm/x/5xJE304zqOMuPculUqWQDzc8
	52TkKCTfJHGuXhTA7YPe3jsUshOm7m7wJVr4r9jSx4rt0ZBgn6PpX+K5txLvJkfQ
	NZCotQbMJxZoogHIp1tNyNzfPZpJL5KljaA==
X-ME-Sender: <xms:anPnaUTjs5s603qP49FZyoAxoyO_DtrouxNzDtJLROh5usMvfunfeg>
    <xme:anPnaXxTeT1hw7hhk9WZpblg-LQLAQJjBJTaFvk0Ugfl75g3vu6lX94pdrR15cnq_
    yKyr8jFEjR8xr25YlpNvltIjEYX8oDEqyMxKy686AQqeE9CHO9c0KWb>
X-ME-Received: <xmr:anPnacpcuj_uLFx60DH-6K8gz6vYcv9ktun6LbBwPYf2TYKDc1gPEuWJDF6QljvZejuSxSqmwa1iRzkXEKrBXfD3FaG5FnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhi
    ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
    enucggtffrrghtthgvrhhnpedtkeelheefffdvueegveegieevtdfhleegudetffektedt
    vefgteegffelkeefgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhmohhrvghllh
    hoqdhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlkhes
    tgdqqdgvrdguvgdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlh
    hisghrvgdrtghomhdprhgtphhtthhopegtlhgvmhgvnhhssehlrgguihhstghhrdguvgdp
    rhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghise
    hsuhhsvgdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdgvhhhrhhgrrhguthes
    tghouggrshhiphdrtghomhdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlse
    hlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvg
    hnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomh
X-ME-Proxy: <xmx:anPnaa0OYQrLOT3xEum-2HkwXRzhGQyXESsgF7HbYEY5mEgqFJ9xMA>
    <xmx:anPnacxvebXGIa5iL7v-M2ex1tCJil45olVosxeq7b_ygRNTJ2WnNw>
    <xmx:anPnaehnrrleuyLBiHza5hYZ2IozXoiBTuy1NEgtziZETqWRJdg5TQ>
    <xmx:anPnaXrxyrF3wrHic-PLisIrwEc3DE4xu5cMu06xngqj-Lf1Uw0Lvg>
    <xmx:a3PnadmdbQjHbTwgOOyX7TtCNLyXIJJd-6-AWtyhfhAVtDDQa8UiocDM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 08:53:59 -0400 (EDT)
Date: Tue, 21 Apr 2026 21:53:57 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <20260421125357.GA46532@sakamocchi.jp>
Mail-Followup-To: "Christian A. Ehrhardt" <lk@c--e.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>

Hi,

On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wrote:
> 
> Hi,
> 
> On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:
> > Just out of curiosity, what does the CHERI extension adopted to RISC-V
> > architecture require in terms of kernel programming? Is taking extra
> > care when storing pointer values in long-type variables sufficient in
> > driver code?
> 
> That is a significant part but there is more to it (entry code,
> register size changes, the UABI should better be CHERI aware, ...).
> 
> But the issue that a pointer does not fit into an unsigned long
> is an issue that pops up all over the kernel while most other
> changes are more localized.
> 
> There is a working linux kernel in the CHERI alliance github here:
>    https://github.com/CHERI-Alliance/linux/tree/codasip-cheri-riscv-6.18
> That definitely needs more cleanup but it does work.
> Previous work from ARM for the morello project (another CHERI
> enabled platform) is available here:
>    https://git.morello-project.org/morello/kernel/linux
> These should give a rough idea of what is required.
> 
> Fixing unsigned long vs. uintptr_t issues helps a lot with this
> because it reduces the diff. But it is also a general cleanup.

Thsnks for the references. It looks like there is not much to consider
outside of mm subsystem. But I have some concerns if supporting
ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.

Any structures in UAPI header of this subsystem are defined with
an assumption that the size of pointer in the existing System V
architectures is up to 64 bits at most. We can see many usage of
'__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
structure). I imagine to need defining specific structures for this kind
of 'fat' pointer. (The same assumption lays on compat ioctl.)

As another concern is that the padding in structure. As long as I know,
any 64 bit architecture for System V ABI has 8 bit alignment rule, and
any structure in UAPI header of this subsystem are carefully defined not
to have different sizes between x86/32bit/64bit architectures, except for
'fw_cdev_event_response' structure (see 'drivers/firewire/uapi-test.c').
As a quick glance, the size of pointer in ARM CHERI extension seems to be
129 bit. In this case, what size of alignment rule is applied? Is there
7 bit padding after pointer member in any aggregates?


Thanks

Takashi Sakamoto
