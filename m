Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA17C5223
	for <linux-sound@vger.kernel.org>; Mon, 15 Jul 2024 06:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024574; cv=none; b=ncaVws35m8QTFp18o5Fndlpl21vW+o4frrnomEAFZu8v9uqNhgRc/rYfHCd3rUzXivTShEE1HAtCPPepG/uCsDlfh+lLQEDpJuuV5aaP8ocDcClQUUpEmxbpTmP1JyLffCZZKu1cdpqNJGpI0pfcDO4n0Uo3+VjELAeTpRLmhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024574; c=relaxed/simple;
	bh=15ONLbLYNtoigo+icZZ2XfefDBTYuiUSJy+ucQ31YAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYS9bhMNLmuiMUiXiANli0EbO0P2QrHGdWBuW7RnzKz0rFOP6PrlX13PeJjFl8c74jSwJUbRAEooBcq+/mPPqmB3c5skmhgmw3MXZpKw7vm4lO59Nb0n3O1kDZgLq/j0nbUnEaJnXCQeGrMvx7VIzeuB1DVZwVtzCaTnI5UHqOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cO9FaQE/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cO9FaQE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA853C4AF0A;
	Mon, 15 Jul 2024 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721024574;
	bh=15ONLbLYNtoigo+icZZ2XfefDBTYuiUSJy+ucQ31YAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cO9FaQE/GUxYGGsuxeI9Bo9vcEYdLybjtwTlxZn78pbZ+MiWg7vb5Tlcqj/Groirr
	 7sz/BBdUoYgTgY4fvBdmViOCqd1PHNZHtWhLCiJqoLBe4Cd0o8Y7+BC5CRyvO4judt
	 l8KPiwtleZ5rvYeOrDH5D83rJxGbBEpaKScBCgdvjZdpC8X61b0nYbkaw8VOHD3eeH
	 u5VPzgBNuFXizJinC9LGI8X8K7L883iGQYQv7ChTMxX+AvFhT7I3r7dDD/lUibHbnj
	 4M6GQvf1yCJLnd2sJocKOpB1i2YOr4ZZZv6Am7qjWYY1GdhKxpqn9lKazYli+ORjqx
	 HTn9iKCZNGLbw==
Date: Mon, 15 Jul 2024 11:52:50 +0530
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
Message-ID: <ZpTAOhsQE0Eh2Yz8@matsya>
References: <20240624135820.516893-1-perex@perex.cz>
 <ZnmG77hBzedDQcIl@matsya>
 <ae18019b-5e6f-4ca8-8fba-353ed19be46c@perex.cz>
 <ZoQF2qjLf7_00yA7@matsya>
 <a89f3755-9b21-41b5-9b15-73105d4e6b95@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89f3755-9b21-41b5-9b15-73105d4e6b95@perex.cz>

On 12-07-24, 18:45, Jaroslav Kysela wrote:
> On 02. 07. 24 15:51, Vinod Koul wrote:

> > > > What about the user of this API, i would like to see that as well
> > > 
> > > Any audio streaming framework like gstreamer or ffmpeg who can accelerate
> > > stream conversions in hardware for capable devices.
> > 
> > I meant to see driver users along with this patch :-)
> > 
> > That also reminds me to ask about usermode support for this, are you
> > planning to support it in tinycompress?
> 
> Yes, I do, but my time is limited in the next weeks, but it's on my to-do list.
> 
> > > > > +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> > > > > +the passthrough API.
> > > > 
> > > > Is passthrough really a new good new name, this suggests data being
> > > > passed thru but that is not the case...
> > > 
> > > It's something like "PASS data THROUGH kernel/driver". So it makes sense. My
> > > alternate name may be ACCEL (like acceleration).
> > 
> > I like that..
> 
> To clarify, are you speaking about "passthrough" or "accel" here?

Confirming that I would prefer 'accel' here and probably not to confuse
with new 'accel' subsystem maybe compr_accel or something.. Better
suggestions?

-- 
~Vinod
