Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7E3859D6
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676105; cv=none; b=PrEtbw1RRMM6R3DN0U5O7evT/Tfd0w4ftMUuL65nS1gd9WqpznkIc38hyhVWuxfeH/mFlNQprOTHyWW1XRAnPJLzi1vHbyRc5XvJvXZWnsv+eyOUz7VR24jFV7HSWyaTTg01qnlzSkTwjKPRVDJmSmj6cmlMcW3US0weMy3BFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676105; c=relaxed/simple;
	bh=8jVMCDTjDJkljkHPTUM482JA16TUKEwmIwUjTJs85bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl3XeGYdd3+TOVM//qO6Hmo05/o78A9Gw7sDcO2hhsCBvYL0TekWLX6Du32dA1w7BjjSNEDPhTCm4i5A4+3FiP/5ityY5lWbvpcSHllkqcaoad5kUjxr7aShKl998qT1P/QlUPkBYMJ7t0MhW849tGgF4S0i3RfM8vVZ/9spGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=GDNGsRvr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RsYipJFN; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="GDNGsRvr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RsYipJFN"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 10B96EC016E;
	Mon, 20 Apr 2026 05:08:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 20 Apr 2026 05:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1776676102; x=1776762502; bh=WdCibtvf5vT2YPPgGlvjTli37GERbk3x
	SROIG0zQjVw=; b=GDNGsRvry28eWO1DQVu39xm2PNt4vgDGtxw/ihnTxoFpT/J8
	uNThBNEtgzlF3HvxXfQEqiN7QAJZ8AP138WXlsfWiUoe+5DDbMYUkACS9fiTAhSz
	HWCpvKYZqEgB7mgzIIuUzmfnjCdVN6GlJadUEkz1e6xdsrNzu77oSWVeor6euHxn
	va4SFlFs9svmw3P8wq6tAAaYKfV/iXlb38q/SMPrVdnoSCWGx0e0Gma35Xc9skLd
	vPVO/YuPxvTnSm0GkUKeI422+vBOw12z3BgDX9VXDZyXrS+4HvuM7qxfu8Ty4wO8
	NMLEk0rKe1SgvgX2lBGZYF9gyrXf4FDXDGB3iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776676102; x=
	1776762502; bh=WdCibtvf5vT2YPPgGlvjTli37GERbk3xSROIG0zQjVw=; b=R
	sYipJFNgORjm0rclpcz6GXW/VQN/YmvixdTeFDQvcAFJNeO30FEzbge9qBFl/wYt
	Uot0oIY9HdVMjWov9abOg3lctbpxPP/10IQvGwwX774qXRV1OHFchKw8wK4IPClI
	LGRH9hzKnSR8txeNzg5mfSVf1IX+heFRZR/LjL4D2rWvpXoSKrIPk1HS71zgCAEh
	/YCgJOmfOlT+6bcuOXmHFCNDQ7r+6E72V3OZMqFrs6mgYUm4DhSLhKObc7FHVly1
	1DU3Gt0FkXgLrU5zfMEwT8YGPAzJZGR+RT4HMCc/p3keLATFGokkzNYRutijMMDg
	RS/rGilS0c6MBWCmas0AA==
X-ME-Sender: <xms:BO3laY5oHT0UuZKk9KgZC5FGh5aqktzcp_q9CT55XmHu4zfAU8U_rg>
    <xme:BO3laf6PX9Hhm4XR9qrR62oOvtSgUtVeXX9n2wb0nqT9SNTN02leMlSCG4TpEIhdL
    fzO6L86l2cqBXMCZQFxBSZB3DC5wLhe6XCN7C-W1nLv3bZCD3PjMHZK>
X-ME-Received: <xmr:BO3laSTs9pa73GTIFQpStF1Y9qPhYLFXo0VfvyJH56KJL6h5WbGBI2MCGMCoBKzcD-Gp4oSTPTavnvkdmT3k-3i8XXO09Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehkeduvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:BO3laf_z7Mo41G-mmizvpNEj8US2AMCGYzPbP_gb50AAz0dIQx7eGA>
    <xmx:BO3laba_qeToimp8SVCzt0sq0HqJyv1k7oFvRIwzJUVdVH2Uz64yEg>
    <xmx:BO3laYqqxNDKCiREVYSPTPXmcpVxeQgDdt09XxPTC6q7SiuuFkXjfg>
    <xmx:BO3laXTcem8lGOxLG05CuVEY70vgvlUF5ZKMoGw0NsbZtw4szTlH2A>
    <xmx:Bu3laeNfgTR9eHLvP1tHD807q2saAZN9Le7TtuaDbd4Kp4ytdNP1M2FK>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Apr 2026 05:08:18 -0400 (EDT)
Date: Mon, 20 Apr 2026 18:08:16 +0900
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
Message-ID: <20260420090816.GA11108@sakamocchi.jp>
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

Thanks for the patches. As far as I can see, they can be applied neither
any compilation failures and running regressions.

We are in the middle of merge window for v7.2. I had not planned to send any
changes to upstream for firewire subsystem, but there is still some time
before it closes. If the sound subsystem maintainer does not mind, I
would like to proceed.

Just out of curiosity, what does the CHERI extension adopted to RISC-V
architecture require in terms of kernel programming? Is taking extra
care when storing pointer values in long-type variables sufficient in
driver code?


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
