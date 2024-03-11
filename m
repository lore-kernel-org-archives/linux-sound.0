Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFB17561
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149259; cv=none; b=kvJ47O7MJWHk04/xs2ihjEuihFHSlO7NsECq8kx0djTct/eXE91+4ibCqK/MEOUeWP8jcQ+YFyx18nOd9tl2qE7EZyLxRGi9qHF3vUMjCkHJ+K7Qv2usQ43YTdeilHx1nM9oI4UQkmWf877yPTbK5OQgp9rnWJHO5efrFpgFvqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149259; c=relaxed/simple;
	bh=IbrlUYNZxvqXkP6Zs5pgUOySu2oeOlmvKd+vo18BIjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWUQWYUFzEyB2HUIfAOTY6uxNylNjp48QKq7GACaOVCkrhgFybAIJ0LkVSY4iaGdaLW2XUU6srAlQUYNvcfjDJCVksWUnllPE/A+gbvK0d5stil0FrLthYX5rZUvYfpsq9Dn5jb1p8mujTSVMWMY0nSp8QkoEAsPDcv3km2U8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=FsAtQ96S; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="FsAtQ96S"
Received: by m.b4.vu (Postfix, from userid 1000)
	id DBD516062037; Mon, 11 Mar 2024 19:57:34 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu DBD516062037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710149254; bh=4SgDhK379YrLBpaJ2ehBUk9UV0oDgnnOmJjYQ6ZVx/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsAtQ96S6pFSlTQ9BYOjygl9f+uVWNv8AkesovjFAZ2ZxZlDzKcbbPV8waayfZs41
	 eB4HIIeVrM22Vu3wFbobBxhRMM+0gOLz16EbVQt5d/5O7SNCj+/of1jR6HiG/w5T4k
	 XBczloeAJayzusLD3OiaBHhH0tkcB535BBDv1uOw4MrPtJwxo+JJ9EvSTRpgjFO/2T
	 eF/y/vpsaBARptDBOnIFUR/p94JFzrqwIBO0txk8jCYix9lM10/+ZLPuKSbTn70DdV
	 gXiDLIpqjB1OGy5hha4Brnp1SJes3iN0bqhdpKHdW2kUo9VERLjlzRlek0la9jgL+j
	 3fsWZs+dvRcsg==
Date: Mon, 11 Mar 2024 19:57:34 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Scarlett 4th Gen fixes for 6.8
Message-ID: <Ze7OhgoCUFzMnX9h@m.b4.vu>
References: <cover.1710047969.git.g@b4.vu>
 <87o7blb2uz.wl-tiwai@suse.de>
 <Ze7D+gD+2DxgbSGY@m.b4.vu>
 <87h6hdb1j0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6hdb1j0.wl-tiwai@suse.de>

On Mon, Mar 11, 2024 at 09:44:51AM +0100, Takashi Iwai wrote:
> On Mon, 11 Mar 2024 09:42:34 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > On Mon, Mar 11, 2024 at 09:16:04AM +0100, Takashi Iwai wrote:
> > > On Sun, 10 Mar 2024 11:34:09 +0100,
> > > Geoffrey D. Bennett wrote:
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > I have three minor fixes for the Scarlett 4th Gen driver in 6.8:
> > > > - The low-voltage indication is now being read from the correct offset
> > > > - The autogain status values are now all correctly interpreted
> > > > - The input gain range is now correct
> > > > 
> > > > Regards,
> > > > Geoffrey.
> > > > 
> > > > Geoffrey D. Bennett (3):
> > > >   ALSA: scarlett2: Fix Scarlett 4th Gen 4i4 low-voltage detection
> > > >   ALSA: scarlett2: Fix Scarlett 4th Gen autogain status values
> > > >   ALSA: scarlett2: Fix Scarlett 4th Gen input gain range
> > > 
> > > Applied all patches now.  Thanks.
> > 
> > Hi Takashi,
> > 
> > Sorry for the inconvience, I have a v2 of the 3rd patch "Fix Scarlett
> > 4th Gen input gain range" which I will send in a moment. Please let me
> > know if you prefer a patch on top of the above rather than a
> > replacement patch.
> 
> Yes, please send an incremental fix.
> You can get the commits in for-linus branch of sound.git tree.

Thanks for your patience. I have submitted an incremental fix,
hopefully correct this time!
