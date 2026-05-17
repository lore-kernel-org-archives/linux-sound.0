Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD29A37CD40;
	Sun, 17 May 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779025315; cv=none; b=DzQQvPzbffuTFMCSU9CS4iIZcjEw6/VWNHLrf96xqRmnbg9EiII0gjOk/YY9h689ipeq19xS3XGUy4+o57mJ52gVmOt+N7vYLGLxGd6BEDDGkvHk3NsCA/qPwXhJzCVJt7T5+xEKVpZ6Ke8vynaK12WY38MopjzmtxCQ4QhM0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779025315; c=relaxed/simple;
	bh=cyq2TqtAGPnsETFBtmBs4BMkfodJc9KJdWXedsKufLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iidBMgtg5+Y2jTpir4fncdn7tDYusLfX+9DK3ohnKPMjEZ1Ci1CcORNQnote0i8p6iD4GBdBEt1FnAMpd4MiswIfJ7OjqCnqyH0zxVRXa7qVcR7wIZUG9hl2tA2UiypClKD6HyeghdM86B6lQecIZmAU190mlpGNyKNd3dDrGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=NTi3Cw8W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HaCWzRSs; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="NTi3Cw8W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HaCWzRSs"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 1623F1D00084;
	Sun, 17 May 2026 09:41:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 17 May 2026 09:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1779025310; x=1779111710; bh=GcUTUhFDF0BSdptZU4+BoaYaXKH4UWOg
	ocHk86AdShI=; b=NTi3Cw8WlweqFSg4M8mfr1DDlEr7TxA5T0D/5VVOi9wRvkDY
	orNyo9kiqWsyVX7hclfIDT2h//yWNSovoZKn8de1LRj8CUAT18Sapsb99SE66qkC
	MJD0Ut2b+31RllG168Uy3qHmtatSEIkQFuCw1TEiGCGj9WyR7ThnK4JV5QFcKfSw
	PzgAg4Agnv4YimWNBIjD2IgqmcdN8GYy7ZPbQhMwBzNxw6bDQbfVk8WW+jgexQsY
	2Yz6ivYO5vGBWdHi4yPdnBVeT6zHB7Ek+EoXzrHmco4vbkNzg3tQUznHYTi4HQMK
	BgnKd/E/C9pxcxerVCl5wN8e3G+p63W636k5Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779025310; x=
	1779111710; bh=GcUTUhFDF0BSdptZU4+BoaYaXKH4UWOgocHk86AdShI=; b=H
	aCWzRSsKLFjKWVe2zqiEIaU5VB/DOGWZGdltgioyB4Urc+9NJWtR0TepKCIazYZk
	1usRHSNwjaJJ5ZMd/EgdVg8o0+dnd3SxqjVYFR0L7JuoXOXbk5vqy4ofkJuAZtOS
	suVkeCnSrLuQYyPYAVPEp1JydtDBEZP9LHRGVEfjD63ma+VlkPgbvizciKKW8+ha
	Wu5onFL/PDAd5gomMKpEimpj9C+j/Q8mR9mFmywj0SKDU4l07hDKyuVy7B26nXGA
	Elkx5mTayW4o+NihMBAu+QtfFTjzjO/0duGiIrXYIBFxQWheBTwDTfKzD3xP7Zdb
	YZHREGP5aWwNvp320GiLw==
X-ME-Sender: <xms:ncUJauidKtkvPHBchxZCNivdvDXGDZtucqun_aiQw4RFckoy3BJxqg>
    <xme:ncUJaq0WFUDbilFooCf3zzfI2MUV05v5NxzXDuj3zqL3flfshutZYjBQGLYGOBfIT
    x3gkEuKV5gqZPhmHsizMKm77QtQGDJYS1V1TES6Jk_E64X53aWQCO4>
X-ME-Received: <xmr:ncUJahdPJ_G8JQ-JB9JFDQTlgLfHY-sUuH3dJchxTZgxYXRNyo892Q2xFEOVmrsIGXTACdgqsNNsymUQDDeRxnQ6J3_WVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeeiudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeegjeetkefhjeetieffleelffehgfeiffekhfelueej
    ffekieeuvdeigeefffeileenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhi
    sghrvgdrtghomhdprhgtphhtthhopegtlhgvmhgvnhhssehlrgguihhstghhrdguvgdprh
    gtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehs
    uhhsvgdrtghomhdprhgtphhtthhopehlkhestgdqqdgvrdguvgdprhgtphhtthhopehlih
    hnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvght
    pdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrih
    hnghdrtghomh
X-ME-Proxy: <xmx:ncUJagyUrQwKUeNQNmR9PfLC2TqQWeyvWcR6Mv8tR9OwPKMyHTKdWg>
    <xmx:ncUJapxnhYIVUCCcBI3b55fHVNUC6Rljde9_pfOTfLgq1ZSLlhibLQ>
    <xmx:ncUJahYXsmQdQJCeaYtX99_zOk-XW6Ze5RIGX1_9-jqGTW1vSY-DPA>
    <xmx:ncUJai2mcgZ0H60cSv2cq7Ce4eFDFDLeA7iTQ7Uc4p5M9cQ7NYtu8A>
    <xmx:nsUJaq-Q0or1u4w06Jb0zJDusuO8SCvzScE2Xd0RDKyKeNsZ5LYuRyIf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 May 2026 09:41:46 -0400 (EDT)
Date: Sun, 17 May 2026 22:41:44 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: Re: [PATCH v2 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <20260517134144.GA465135@sakamocchi.jp>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
References: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1778494203.git.u.kleine-koenig@baylibre.com>

Hi,

On Mon, May 11, 2026 at 12:45:01PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> v1 of this series can be found at
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com
> .
> 
> The changes introduced here are the same as before, but the commit log
> of the first patch is (hopefully) improved to better point out the
> advantage of the approach for mainline. The second patch demonstrates
> the explicit casts can be dropped after the first patch.
> 
> The patch series intends to not change the runtime behaviour, however
> the 2nd patch introduces a few changes to the generated code. Looking at
> these for an arm64 build they only affected register allocation (so
> where x0 was used before it's x1 after the patch). I'm not proficient in
> x86 assembly enough to understand the changes there, but I guess they
> also don't affect the runtime behaviour.
> 
> My motivation for this patch set is to reduce the patch stack for Linux
> CHERI support. This affects firewire because with CHERI you cannot store
> a pointer in an unsigned long variable. But I hope these changes qualify
> as cleanup worth to be applied even without considering CHERI.
> 
> For merging I suggest to take the whole series via the ALSA tree during
> the next merge window, as there are no modified files that are specific
> to firewire only and the second patch depends on the first.
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

These two patches are applied to for-next branch.

We can't predict the future, but setting aside the comment about the CHERI
extension, the actual benefit of these changes in the current Linux
kernel is simply to avoid casting between long and pointer and enable
constant pointer for the existing code.


Thanks

Takashi Sakamoto
