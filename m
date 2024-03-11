Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D31C33
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146560; cv=none; b=BEN3VuvSUF+h6tPnueQaXr31fxUlBw6sSe3zjxtTwVNStOmsSDwrJxumd/LfCPtZiCJ2r7X0eqWT2/Vmn8yfVTLdg2+zACXtER19k4IsYP9FZzcUFDRar/EA004GuPy9yL5y8brJv7tRritvrxdUXZSJSzfBp2IHVTF/nGVihow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146560; c=relaxed/simple;
	bh=DN4kXREgEZahLMtZW/woMwShQ/8KouDNFSZFzWtVV0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND5UUxtutfxkMJBXj74o8CJXWfmYDhv2u+yc3rcyvWuYUTyylpQXjNQuPjzp3kJnzs65oQfi063O2m1ZYtBS8+7dVZ8SbFjb2BF0RJnfCrWGesYKztwW46L5pb6u4ATkS82QTTAmf7mTKQWIkLaejlO2nFj51ybnuop8RlneuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=bx01p6Aq; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="bx01p6Aq"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 4B9336062037; Mon, 11 Mar 2024 19:12:34 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 4B9336062037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710146554; bh=eM/CONVbL/2FvKS1pVVX1t4jEy5lkfvaatoEgRwRTEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx01p6Aq6LmU3uyWLMPfhP31uCPbMtm11JCKtFLGD4faKWyqYfF4JW2AAxWIwyt6R
	 bbIBzaGyaYSpN9JhIGXWYPT+tZb3wcbL/1F/gzKOJdfx1eDoPjWYEgkXWjCNLJ+SQ/
	 pBZ6Cfiyqcaxi5Nzt3R8cmxp5A/IheKMK6mVOpQvH71oBHvBYN7i4dUN3GIuJ2fTY/
	 OvIuD5eVrK9CbXJLrJ1IDrYvAxYEgSCLxH3nDvaphPeDiXfgOKwOsWb+8/32QacLp1
	 OXwlork3Zl1Z8ybzVSGyGnFzkBUmCsoJe1qSNBsw5Xv6WP+V/0ZsDnfBbGMg+GNamg
	 O7n3tRHecWAiQ==
Date: Mon, 11 Mar 2024 19:12:34 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Scarlett 4th Gen fixes for 6.8
Message-ID: <Ze7D+gD+2DxgbSGY@m.b4.vu>
References: <cover.1710047969.git.g@b4.vu>
 <87o7blb2uz.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7blb2uz.wl-tiwai@suse.de>

On Mon, Mar 11, 2024 at 09:16:04AM +0100, Takashi Iwai wrote:
> On Sun, 10 Mar 2024 11:34:09 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > I have three minor fixes for the Scarlett 4th Gen driver in 6.8:
> > - The low-voltage indication is now being read from the correct offset
> > - The autogain status values are now all correctly interpreted
> > - The input gain range is now correct
> > 
> > Regards,
> > Geoffrey.
> > 
> > Geoffrey D. Bennett (3):
> >   ALSA: scarlett2: Fix Scarlett 4th Gen 4i4 low-voltage detection
> >   ALSA: scarlett2: Fix Scarlett 4th Gen autogain status values
> >   ALSA: scarlett2: Fix Scarlett 4th Gen input gain range
> 
> Applied all patches now.  Thanks.

Hi Takashi,

Sorry for the inconvience, I have a v2 of the 3rd patch "Fix Scarlett
4th Gen input gain range" which I will send in a moment. Please let me
know if you prefer a patch on top of the above rather than a
replacement patch.

Thanks,
Geoffrey.
