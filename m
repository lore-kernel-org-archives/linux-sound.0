Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC6456286;
	Fri,  7 Aug 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139205; cv=none; b=EGXO9nrA1xzotXsu+hEXL4+D15XhHJ+K0B92o2+bQmDSUvSXV5jM38ge6a0jNT6rgGeaMqcrwh63z+3ktPsqMRL6Pyi06WMip1jMPELQL+ZH6cgfsDaz9fHPRjk4e5eT5e8tw4qUFekhfJGAiF1vFmo196MGi64Qo73NaieSlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139205; c=relaxed/simple;
	bh=8o1y6SNoJ3rIQI1z7D6lmPBc/djxJl8iwaQu4CfhE+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwgpD51bBLSuC5Cw/JCwcc+2Q0zITMsS+DLGRjrisz/gjpqXHzcx4GYmW3cVXIGBGpYijpZ10nACGcPbPCyblLkmNWRriSxz7m4xAoiPZ4Yy4XQrrIF24bRaIIndSsLBFrgSF+brzgVM/zKdOZhgMo2ER2FICbdHokV+bq6srgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPjQEMd6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPjQEMd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A881F000E9;
	Fri,  7 Aug 2026 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786139204;
	bh=0SPcmUx/V3OqxBTb0mN2dvxDhjma7ha1Kt27SZ+B/Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPjQEMd6h1RAWcl3l0o8HXyg6r30+mOqDPDBmulenuiC4z0+Z8G4dnRuPUyFJQfSb
	 +/I4q+4JfhF29aJOQkuCAdbT3UKZK9dTsMk2JqO6LArNPflSx1kmB+s+C30GFiOTsv
	 G61jlAL2byWKpF3fKpkSLZNCgLAqVcj4igQYdQwFCfMhtLFR8pt07J6625DGl/cROK
	 x5lt/7YfI9rJdIxAWKu4RtK9sqDPQplsEx33vo5hgEKYf0x0obvYxJiEIvNihCid1Y
	 OnU0lmfAoTbIhXo3IUjsg5evtxR3AYlkfJy/Xe2m8+Bf/q9kCNxFCJkIRFz4wORvdm
	 gpZ/3LJejpX3A==
Date: Fri, 7 Aug 2026 14:46:44 -0700
From: Kees Cook <kees@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
Message-ID: <202608071442.37E40CEFC@keescook>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
 <87jyq2azz4.wl-tiwai@suse.de>
 <DKITQMNPN2I7.CH00E8CSZMXI@gmail.com>
 <878q6hc3yp.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q6hc3yp.wl-tiwai@suse.de>

On Fri, Aug 07, 2026 at 06:03:58PM +0200, Takashi Iwai wrote:
> If strlcat() were super-dangerous, it's understandable to drop.  But,
> it's not, and issues discussed in the github are minor and something
> that can be addressed in strlcat() implementation; that is, can't we
> rather re-implement strlcat() in a safer way, instead of killing it?
> 
> Sure, there are code calling strlcat() that could be optimized better.
> They can be cleaned up.  But it alone can't be a reason that strlcat()
> must die without mercy.

The risk comes from the compiler having no way to know what the size of
the destination buffer is, as the "char *" argument has no length
associated with it. One thing we can do is change the argument
requirements for strlcat (like we did when designing memtostr, etc),
that requires that the argument explicitly be an array (not a string
pointer), at which point bounds checking can be done.

Usually this requires changing the plumbing of arguments, as a lot of C
code is used to just passing around a bare "char *", etc. And if that
re-plumbing is going to happen, it might as well be seq_buf.

But yes, just replacing it with strlen/strscpy isn't very ergonomic.
Adding the length explicitly with strscpy certainly gets us the bounds
again, but it's _separate_ from the string still, and that will lead to
mistakes too. Better to have it be part of the type (i.e. either an
array or seq_buf).

-Kees

-- 
Kees Cook
