Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422019F49D
	for <linux-sound@vger.kernel.org>; Tue,  2 Jul 2024 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928287; cv=none; b=axHWF1txAkIEJ6Uu3BfpILU1B2/I9YyNfUddrYRdxt4xPW26E8x73YyZFQ0kscvDf0AgxMxLnYfJGwEFHM569n7ejwAanfhAwkObpki1BbJ7S/wJMaMHAHFyVFZ8AF1e06yEijhzEoBvIPF6dpQd3V3BJH4mYdJSM1qGouhbQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928287; c=relaxed/simple;
	bh=5DN1qoNpLOxS7B9U2ZZc/UWsCH6qUQ9gFGgdb1j0VQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DD6zBWvfoZiO0dQEoDSZlF/WoKNqnzlZ/yDtFfkx9bYfpBB4m3+W9yrlzPGtfoZbQIQPiVvQvDYElzD9G58YEOBhpR1899jVGWlwOAEjpaNZtTielPweU9HQHCk5cwFfg8hB+IaLJIYDsnk5ncDXiICYHjrjY/EgoMRnLcHPiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlzkTiXG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlzkTiXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15655C116B1;
	Tue,  2 Jul 2024 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719928286;
	bh=5DN1qoNpLOxS7B9U2ZZc/UWsCH6qUQ9gFGgdb1j0VQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlzkTiXGHr9jx0e8fChI/whv1XE8t3eeiBEG73X9JKiS4S+zAlZAUgRGMkSMVflXu
	 GS4IViQkukYXk05RMlnE5QbymAgDgKpqJDx77TnUTKJZSICx+doKBOj1VjjYnoJeUH
	 /3b83z57im31iQjPisHd8io8qkRQxD1WT5jutOffelrOVQIGd6X4keRaERAo1Iber4
	 lhbQcbsH68YW1a0EDe7iKhoWgaclue6s1NGZLY59f4gLMO09JT1ids/kSUhm+t1Y9D
	 xu2Qtzk0J14ifgPtnunG3DfAJ13UOv9TtT1js6ZUhvMhRS1wcR9GMeqRVGhR/YnFgG
	 mpQTimE51a88A==
Date: Tue, 2 Jul 2024 19:21:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] ALSA: compress_offload: introduce passthrough
 operation mode
Message-ID: <ZoQF2qjLf7_00yA7@matsya>
References: <20240624135820.516893-1-perex@perex.cz>
 <ZnmG77hBzedDQcIl@matsya>
 <ae18019b-5e6f-4ca8-8fba-353ed19be46c@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae18019b-5e6f-4ca8-8fba-353ed19be46c@perex.cz>


Hi Jaroslav,

On 24-06-24, 17:31, Jaroslav Kysela wrote:
> On 24. 06. 24 16:47, Vinod Koul wrote:
> > On 24-06-24, 15:58, Jaroslav Kysela wrote:
> > > There is a requirement to expose the audio hardware that accelerates various
> > > tasks for user space such as sample rate converters, compressed
> > > stream decoders, etc.
> > 
> > Can you please tell me more about this requirement. The initial view of
> > compressed API was data only and use alsa kcontrols to handle the DSP
> > functions? I would like to understand why we need a new API.
> 
> There are very long threads for v4l audio support - last v15 thread:
> 
> https://lore.kernel.org/linux-media/1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com/

Very long indeed but very interesting. I think going compressed audio
way seems reasonable choice to me

> 
> So the goal is to create something more efficient for the offload work, when
> the data (decoded/converted) should be returned back to the user space.

Not rendered? so we are using it as an accelerator...?

> 
> > What about the user of this API, i would like to see that as well
> 
> Any audio streaming framework like gstreamer or ffmpeg who can accelerate
> stream conversions in hardware for capable devices.

I meant to see driver users along with this patch :-)

That also reminds me to ask about usermode support for this, are you
planning to support it in tinycompress?

> 
> > > +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> > > +the passthrough API.
> > 
> > Is passthrough really a new good new name, this suggests data being
> > passed thru but that is not the case...
> 
> It's something like "PASS data THROUGH kernel/driver". So it makes sense. My
> alternate name may be ACCEL (like acceleration).

I like that.. Also do we change the device name if the passthru is
enabled? it should not be called a playback or capture compressed device

-- 
~Vinod
