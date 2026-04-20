Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA093A75B0
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707171; cv=none; b=HSpquZLKmjGghJsuji3uqAlUP4DMjy+Z2FIya4sYu00lljKjvnl4Fas2kcNEairb/93sXkvaq/EmLf3HLB+Ex2sH386hU1HlmmouV9k3YqYkKEkJ/HgCVfZesKhIcr9zlC1dXYnBKs3zm4e309h58wHqhoPmr0+YNCM+jvobX98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707171; c=relaxed/simple;
	bh=+kH8P4yaTumSAFMBB4rVr7II/NVBsEtTzL6bc0YLCgw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkQkQelwF7V+AOMttQhq/KcZrmQbPT/htquEv1fMVnyNrkhw84/eHBijhQjgeQGMF6JvpH5Bq/1vGnj8bdfG8i9oVYvtxtb+q2rxZcWLl+G0VSQ/fWV7ZEDDSWnWrCm0vYvjR4tbn0d/w6Pes6qeia9sbqtV8q+5e29VK7ZkRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 9CEF914012C; Mon, 20 Apr 2026 19:39:32 +0200 (CEST)
Date: Mon, 20 Apr 2026 19:39:32 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net, linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420090816.GA11108@sakamocchi.jp>


Hi,

On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:
> Just out of curiosity, what does the CHERI extension adopted to RISC-V
> architecture require in terms of kernel programming? Is taking extra
> care when storing pointer values in long-type variables sufficient in
> driver code?

That is a significant part but there is more to it (entry code,
register size changes, the UABI should better be CHERI aware, ...).

But the issue that a pointer does not fit into an unsigned long
is an issue that pops up all over the kernel while most other
changes are more localized.

There is a working linux kernel in the CHERI alliance github here:
   https://github.com/CHERI-Alliance/linux/tree/codasip-cheri-riscv-6.18
That definitely needs more cleanup but it does work.
Previous work from ARM for the morello project (another CHERI
enabled platform) is available here:
   https://git.morello-project.org/morello/kernel/linux
These should give a rough idea of what is required.

Fixing unsigned long vs. uintptr_t issues helps a lot with this
because it reduces the diff. But it is also a general cleanup.

Best regards,
Christian
