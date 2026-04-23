Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC2F4F1
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776954013; cv=none; b=E2PZy/Z0faRwzdIYVk41GKzIRKrRq8HnazC3ZGX43cRlOZ+pfvx3j4xxx2HQ/at3adVJmWdpUc3lR+RwTUWvHrIKcSYtBhhx+t+Nay3c/C+VAeZnYbVrkMyJDJMZ/ME+DvUz+f4wqHrDy9UB939X+0wDS/Y7UqqRLIXHZSr/hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776954013; c=relaxed/simple;
	bh=C/U2qnjKwqDPdf+svD1nDpFc4UEYeMfgJVsi3FCK/vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1V+Rt0boQfpYgdt3HTouWZzLeKjk6fbtOrvub4dyfhFIu+CLENeygf9WsaeVY17j8dYzCdpixyGMlDETCzztovaWMvtx5vssY25dUv+fxsiX2t25qqXUapeCY9JdVn4WHB/u4CxVg88GSVd2imA7UgXOEXdRK+1mioSMdDDU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=CjC8bFlY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D/1qcqx/; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="CjC8bFlY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D/1qcqx/"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8967D7A01F4;
	Thu, 23 Apr 2026 10:20:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 23 Apr 2026 10:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1776954009; x=1777040409; bh=k9WdZ1YDztF+V84nr1eiikJrtLDn/bZ9
	EK7VAebwnA8=; b=CjC8bFlYTNyfNP4RcQP83xmeIs0Ia4NDOjR3C1DIYajmnPCY
	xRPcu4On/kWt5Cy0yv0Riz9LVxhrr22GrLbw5imnfjqqUQ/rwFRBgk7jR6tPynJV
	PDEKhNcW0Qjvhafkkg1w12SG5BI4zTRLaIasCf8kXUprd6xG4mgu9IhhH66oumkO
	MuSwMtJzeFmqXrB7XnCWqtr/gJg7/vGz0SmDh87voVs3txUmwrwntNYGPAyfr3cu
	ZlYgePMgoM3r7JbLbY6mwbg9QfMiPCZ73H4R0ZsoC1YzklZ3wZOar0/RAJSmHU4F
	APl2VOvf1wUXL8/B4P1pxnfQFfNt3EgGpdZPJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776954009; x=
	1777040409; bh=k9WdZ1YDztF+V84nr1eiikJrtLDn/bZ9EK7VAebwnA8=; b=D
	/1qcqx/1E/Z8ml7EoQX9KhV0EnKLRG9pl6c782Qlantx7xWCD/yiVaCZYVHdhu0c
	OYtv7Yl/lBEOnn8jw/MIaKD9JJNbEcWh50Xdm4QMHLsgHshd+hl6xVBqhiXcm9D+
	p7LK9uDDrt3tZeH1tUC/yXxu4MD/KSjGYO1L5XGcrrwr2gi+EMTW26rOflLNT+Iy
	pg8SDIYTGMLQBgof+sWSuyd44EFV/t4DQqjVarcIMo5XrLy/CJZTJFkYtHxQcnia
	IEHbUlmhh8tfj4Zm9EDrbnBd9HWIIt/zmDzixOSbPjOkXGF+1HAx3SSQ7rWhrjbw
	o3mFv7ofHz280YpruCpnw==
X-ME-Sender: <xms:lyrqaRrunQJHagbmTtwSrTSO_gKaTR2oJJ3OJCu8mhUWtFVnn6nAhg>
    <xme:lyrqaZo0JOYpiZhtOS6UPIFGGTxIC8hSogJq_EMaKoFfWStfc0y2Ayo0Akny6CmRn
    WG4EvoY5osGK0pB_iQdc0z30I8gVHy1MuPg71vq7QN1DYSdWiEXAVA>
X-ME-Received: <xmr:lyrqaZAqZSJZvo1mAl6gE9AoDDf_-6zx65JshGYE7chVMu5F5QSiSgsdefM9kUgz5bCro7wa4YPKhMVr-zhEuQ7tIIGL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhepuddthfejhfefkeetkefhudefgfetueetgfdvffejtdeh
    tefhuddufeeghffgtddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghr
    tghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvih
    hnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegtlhgvmhgv
    nhhssehlrgguihhstghhrdguvgdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtii
    dprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopehlkhestgdq
    qdgvrdguvgdprhgtphhtthhopegthhhrihhsthhirghnrdgvhhhrhhgrrhguthestghoug
    grshhiphdrtghomhdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhs
    thhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqshhouh
    hnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghs
    rghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomh
X-ME-Proxy: <xmx:lyrqafuPgmjA9SVddL6VCMvRKYLH6xIlt5kLQItuQ6JEz8GHU_LDfg>
    <xmx:lyrqaQKS0bujXqxwEi5UCs_4vwOgJOnAkmwNCjx4uKNc8U6xKFmt4A>
    <xmx:lyrqaeZ8uflBs03sc2dQvby3xZCpGzMD9yrchotoQiOJgLgQRNRCBQ>
    <xmx:lyrqaaAVh4nrklaw7cKSSWOF7l1WATgsrqwXDqUXXJmzPDCCoZDXBA>
    <xmx:mSrqae9HsmvR4GTdUHrA6JZp0iMqgI3ZNHfn7ivYe5cmPE6lAeEq5UF_>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 10:20:04 -0400 (EDT)
Date: Thu, 23 Apr 2026 23:19:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <20260423141959.GA268626@sakamocchi.jp>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1776579304.git.u.kleine-koenig@baylibre.com>

Hi,

It is unclear who is responsible for maintaining the 'ieee1394_device_id'
structure in include/linux/mod_devicetable.h, but if it falls under my
responsibility (which seems likely), I would prefer to postpone applying
these patches, or at least exclude them from this merge window.

After reading the discussions around the UAPI, I am not fully convinced
that your patches appear to provide clear benefits to existing
IEEE 1394 bus users or their software. From my perspective, the motivation
appears to be primarily related to the CHERI extension work.

As you know, this subsystem is quite marginal in the Linux kernel
codebase. Given that, it might be worth considering whether this
subsystem should be excluded from the build target when capability
pointers are enabled (e.g. via Kconfig, if available), since it does not
appear to work outside the ILP32 or LP64 data models. It may be worth
carefully considering where effort is best spent. I can understand the
merits of CHERI extensions, but changes related to this subsystem would
likely be acceptable only after the kernel core functions have been
updated.

That said, this is just my current view. I would welcome any feedback or
objections. Besides, it is still one of my tasks to figure out how to
adapt the UAPI structures and the firewire core implementations to
non-ILP32/LP64 data models.


Thanks

Takashi Sakamoto

On Sun, Apr 19, 2026 at 08:42:12AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> <linux/mod_devicetable.h> contains several device_id structs for various
> device types.
> 
> Most of them have one of:
> 
>  - kernel_ulong_t driver_data (sometimes called "driver_info", sometimes 
>    the type is plain unsigned long)
>  - const void *data (sometimes called "driver_data" or "context", sometimes not const)
> 
> A considerable amount of drivers for the first category uses the
> unsigned long variable to store a pointer. This involves casting both
> for assignment and usage.
> 
> An additional complication exists for the CHERI hardware extension
> where sizeof(void *) > sizeof(unsigned long). So with that an unsigned
> long variable cannot be used to store a pointer.
> 
> To address both issues this series replaces the unsigned long variable
> by an anonymous union containing both an unsigned long and a pointer.
> 
> For all non-CHERI architectures this isn't an ABI change because all
> have sizeof(void *) == sizeof(unsigned long).
> 
> The first patch changes the definition of struct ieee1394_device_id. The
> second drops some casts in sound drivers. (There are no other firewire
> drivers that could benefit.) I adapted all sound drivers in a single
> patch, tell me if I should split per driver.
> 
> For merging I suggest to take the whole series via the ALSA tree in the
> next merge window, as there are no modified files that are specific to
> firewire only and the second patch depends on the first.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (The Capable Hub) (2):
>   firewire: Simplify storing pointers in device id struct
>   ALSA: firewire: Make use of ieee1394's .driver_data_ptr
> 
>  include/linux/mod_devicetable.h |  5 ++++-
>  sound/firewire/dice/dice.c      | 34 ++++++++++++++++-----------------
>  sound/firewire/fireface/ff.c    | 12 ++++++------
>  sound/firewire/motu/motu.c      |  6 +++---
>  sound/firewire/oxfw/oxfw.c      |  4 ++--
>  5 files changed, 32 insertions(+), 29 deletions(-)
> 
> 
> base-commit: 028ef9c96e96197026887c0f092424679298aae8
> -- 
> 2.47.3
> 
