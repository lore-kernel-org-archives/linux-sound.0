Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FE522EFA;
	Fri, 18 Sep 2026 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761130; cv=none; b=Vne6dZITh4jji+tgOzR/z3MfuGyrHcT0cWwLMcE2tjNuJ/lnoCCL5rSzJArI0EWdziGG4UfkDyZMGAiYQ9HWl1JE73k3RpukgMnxT+PLIjag+7ZYspxQaJMA8W2oy9nA0klDAirwvMxXn7npPSf68PcU7DaeOPUbu3x9z5JwSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761130; c=relaxed/simple;
	bh=uC55+LeYJDbvXBg1ynFZa1Ai0t6FnpApWMWKyAVhfXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM4HazkkOV/tMxz8kGmUEFufDLto2lBQhwk2MeZhSYENGnzGfhe0wh1F175DFxpLD061HXzOcLld2xcMQL10ggMbFhghMwtut1i5/7MpadisTDaO2REoyQqo6OFhqqR6XhOsWChYniWvQP0IBBJzRJguBykBQ40lUEN66q0CiDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtYDyaMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtYDyaMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293C41F00898;
	Fri, 18 Sep 2026 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789761126;
	bh=dMZ/BDFa0uYXPcxKoVn675fpOlfInGF3gfzODUk3XIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LtYDyaMpFfLXx0okWCc7Fxh4yEvlttt8nhFhAkUBOA9bF7/VCaaN/PIiSTynmqvLD
	 AxRz3jKV/3UGyrG2ecf0JA26Sp9H6cXR11EsYYgzNqIZHmUEJfb8F3SR4iptEoORns
	 MdujOVoA7pAYn87Rlnr2NHZteZZ51RvD1iUiqHN6+yGx0qjo4wbX9uFFO5c5FXp0RR
	 YHSrSQhlDxnAcVEKHOXoRdvSEp0DzQblp+514Ct2hye3Y0oBAKVTbqr7XrYj6YJP+H
	 jpFaSwVlBGMq3Lpg/nrgbqlVtLdo5CTV9dDCTZ06OedOFoVquw9JJoPzXE2MutyExF
	 bMANW+2HM6/kQ==
Date: Fri, 18 Sep 2026 14:52:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound card
 binding
Message-ID: <178976112397.1658658.5859339265734560544.robh@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-3-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-ux500-simple-sound-v1-3-6771ac714e82@kernel.org>


On Fri, 11 Sep 2026 01:03:46 +0200, Linus Walleij wrote:
> The Ux500 device trees now use simple-audio-card and no longer contain
> the MOP500-specific compatible or properties. Remove the obsolete text
> binding rather than retaining an unused legacy ABI.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/sound/ux500-mop500.txt     | 39 ----------------------
>  1 file changed, 39 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

