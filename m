Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C4257824
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788458; cv=none; b=USGCvLGQOMsaRkARcd4YNiNIoB91E5UHAqwZJBUdIwbFH+5aoTCUGfcz2HBzrF9oGaeXhKlmku6fCDmOuqX/crl8ltBvOOR/l5RT9iwPZj8FIJNYuoEiuaOMPNBWg+v7bYKUfRK5VwMNP1XhKlGOQNurmUrn2/KNNpXaSKs7ps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788458; c=relaxed/simple;
	bh=v+JhS3iF8BkuG0nAg3W+NAZ5HnHYBXu+6OuG2pH7pDA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9dZ2aIXGCAtxxgfxpBd4NXLnbEbE+onsLJEZljxtuDa3hkk0GcO6oRtZgbF/uLXNaTozpO1iJtuyw4rWaRRZIG8ib2A5uyZ6FE0MjLWfkjuRhBrUTxfB9+SYYNoUfJjLxJ6ZAuP9CgAohATQQa3uxz/8qY3hqG7JMRLEQRlAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id CB4D714012C; Tue, 21 Apr 2026 18:20:53 +0200 (CEST)
Date: Tue, 21 Apr 2026 18:20:53 +0200
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
Message-ID: <aeej5YjQ9RvB0aWz@cae.in-ulm.de>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125357.GA46532@sakamocchi.jp>


Hi,

this is getting off topic but....

On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > Fixing unsigned long vs. uintptr_t issues helps a lot with this
> > because it reduces the diff. But it is also a general cleanup.
> 
> Thsnks for the references. It looks like there is not much to consider
> outside of mm subsystem. But I have some concerns if supporting
> ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.
> 
> Any structures in UAPI header of this subsystem are defined with
> an assumption that the size of pointer in the existing System V
> architectures is up to 64 bits at most. We can see many usage of
> '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> structure). I imagine to need defining specific structures for this kind
> of 'fat' pointer. (The same assumption lays on compat ioctl.)

As far as in-memory syscall arguments are concerned a full support
for CHERI will essentially require a new UABI and also a new variant
of compat support to run standard non-CHERI aware 64-bit binaries.
This is the main reason for the size of the patchset.

> As another concern is that the padding in structure. As long as I know,
> any 64 bit architecture for System V ABI has 8 bit alignment rule, and
> any structure in UAPI header of this subsystem are carefully defined not
> to have different sizes between x86/32bit/64bit architectures, except for
> 'fw_cdev_event_response' structure (see 'drivers/firewire/uapi-test.c').
> As a quick glance, the size of pointer in ARM CHERI extension seems to be
> 129 bit. In this case, what size of alignment rule is applied? Is there
> 7 bit padding after pointer member in any aggregates?

The in-memory representation of the fat pointer is 128-bit on a 64-bit
system. The 129-th bit (called the "tag bit") is not directly accessible
but managed out-of-band by the memory controller or some similar entity.
It is set on valid pointers only and is implicitly cleared when memory
is accessed with non-pointer instructions.

Best regards,
Christian

