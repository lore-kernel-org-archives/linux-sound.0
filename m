Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C228274670;
	Fri, 18 Sep 2026 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760959; cv=none; b=RCrt2XPZYe0gK06iE2ISaF3xly1FLAfuEykYLrPs4d15SMWlDSSG5keFA/BNN5oH67xf0ffcZTADDRTrLWmJBigFD90d4NZXsSA2L7uzyNEo7uZV/uHazUmUdtZd4XQdb1JmJQqgUB/85gPrh73yuWfiIrmL+F5aj4f/OyA7sAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760959; c=relaxed/simple;
	bh=OzfjAV8sTLAyTcebzvXUrz9Lwn5cL3m38fKNeDo7coY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9XemAHC24/1Ng69eA6nr2ZhoUo34cIMdJ7b8bm1EgVzBI2Nvrik9IPE7JT9+rBxspIU1f348kY+FI3MwOJtcRiV96Ei+GdW37ZrQvF8JuF6MZnfE8acfpV1AEkF7TmTAl7LRLCmoAmmhsPB/ZTKfgxplDwL+FSYTKQ6cI2PI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVcSLY7c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVcSLY7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB901F000FF;
	Fri, 18 Sep 2026 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789760957;
	bh=L/reEUqGLDWHyt6B4Ee8u2BvY9KAYiZjL9r1rVIJw1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZVcSLY7c9HHP1/mFGIZ9aLFwJlLHuOselmqjDP0NulwsUMAPSYndR+0dYeATxW/fF
	 P6C/QzKffg0gdc1OmkSuZTWyjEIJ4oPolqhVygJFk/uRRpyR+ImX0rC2manIZHQZ+0
	 QWi7HVcRKcYNPhK9JjCH1IAFvszA7rnax6h/XZikFakwNX+n80Q2XAfq8cRqOM7/4u
	 xxIiOV1cHQ8TRHl0zmo2Cy4GZVpnARsycSwCEtwMUf7hWtqSJZCLPWvJbf5h5TFWE8
	 7n7YYQY/OTJ3SowfI1C/j7ftnxInsPdKWZNsfrayZYTiq6d5tZ2zSr2y5yr92JB99W
	 1WBSSfEcVdHdg==
Date: Fri, 18 Sep 2026 14:49:15 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 2/9] mfd: dt-bindings: ab8500: Describe codec DAI and
 microphone wiring
Message-ID: <20260918194915.GA1640890-robh@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>

On Fri, Sep 11, 2026 at 01:03:45AM +0200, Linus Walleij wrote:
> The AB8500 and AB8505 codec block exposes two digital audio
> interfaces. Define the codec as a one-cell sound DAI provider so
> generic sound cards can select either interface.
> 
> The codec binding conversion also omitted the analog microphone type
> and bias-routing properties supported by the driver and documented by
> the old text binding. Restore them so boards can describe the codec
> wiring without schema warnings.

I assume there was some reason for dropping them? Perhaps it was 
there's no upstream .dts using the properties? Could we drop them from 
the driver? Are we aware of any devices using these properties?

Rob
