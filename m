Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580ED2FA
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 05:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661237; cv=none; b=iHz6XuYEbsIljq9GBgkYuZH9YyU7Rb5DTzkc8Ye9k2fMqWuRvC3ZMG3Eshzhmd7gzWi74nSZZ0NPJdPv4ReEsJg0wdxbE+L6hnRyAw+3sKLAAMdLFoxqkuSYYJSu+Hz+tqokSywkUJBF8f2UXQiVzUW75sawMHB0EE0BxYdQZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661237; c=relaxed/simple;
	bh=rCZMiZJuSafQU0+TtUKxGWQU+YCvtQ+mT7iEfmyaky0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocFW4c4DYmvgkKt3DP4bC4ddzkuOvAh/CsK4pwXUKHJ1ftSVsjIR9vWY+V1hyx6L2Hawp+2Ylfrxqe+HeMC+l+viXCMxkj4bIIhKciZg/I8UrVI54/Wj01cnOmy0yRX1tDwePhleeQBWBSIwf74cVqzqd2I3tJi1S3CCqkJtxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFXbJQCu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFXbJQCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59C3C4CEC6;
	Wed, 23 Oct 2024 05:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729661237;
	bh=rCZMiZJuSafQU0+TtUKxGWQU+YCvtQ+mT7iEfmyaky0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFXbJQCuJzEv+MuJwOSGIVmx3IFbCVvNBmOQGk6Z1eZDII2qhuTMJwxNuCczFwwof
	 1GpsajLFqUQDt1eRN8PqoksciCHxUvwOqLlGWVzxf7zM5kR93dP5We/9Ry9YZQz7X1
	 QLeVrsDnAgj6WDn3uzRgSfvv2w1+Hc+Dj+e6Ls5DXg/lUg3FTswUmVtkjn+FWpsUrs
	 fC+jVqaFuc4A3qPREgZsLeIGOEvmH7BisQsckt6mdmdE1XY5k5eyjln4XF3WYeTQ+t
	 RIBdl4W4Ik4KqN0IZvwLl2RSm9kcvbblcxLjZz6crQzYOuqCaQWxVy1FGlyFjMDVXC
	 fY4K1jheksB6A==
Date: Wed, 23 Oct 2024 10:57:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
Message-ID: <ZxiJMQkbA9MhtjXF@vaman>
References: <20241002093904.1809799-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002093904.1809799-1-perex@perex.cz>


Hi Jaroslav,

On 02-10-24, 11:39, Jaroslav Kysela wrote:
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.

This lgtm, but I found one thing missing. I think we had
discussed that we might want to call the devices with accel api not
ComprCxDy but something else? Can we add that.. maybe accelCxDy instead
as both are mutually exclusive

-- 
~Vinod
