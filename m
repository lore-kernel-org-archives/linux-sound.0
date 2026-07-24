Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7FE30214B
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898503; cv=none; b=DmQecMnmh5UTOW05fdnFX0AeBO+SZpvFGFDVzQ5ViDD1uAqR+xkL0DVV1g0Oj4ThQ+w6VUzgyDz4Cg1711hTtrSutsJ3szZ6iWeMOjJhD4+t3dt6pTOjeYAbtljhWa32V4GsvFEesEatzrc8y28rUifxYsdjYM4USz/7VfSEO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898503; c=relaxed/simple;
	bh=iBM2RWfFi4vG2DaQLikXAs4V2wthrTsvpKMhf5nS+YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd7N252uzhM7rW2lHzj+eD0pTV0IGMMxK8KXEOuOGm+/7hA4HTtqSb7YP2O6Du20rskp6gaAEx/+WfnFDTZ/8XPV+Re4TQ1LDUfSdAtLq75Nb8orkHhIF/iKiyXEoliqHxT8p9OtTSqTBm7rGVvtcuhwGPPjqln4yqMJ1OUlwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/IWBxuD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/IWBxuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F1B1F000E9;
	Fri, 24 Jul 2026 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784898502;
	bh=Vi5AdgLl/pKliexVhDPoKHO0bxDHGTe6vCmyufhkXSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q/IWBxuD8GyqSsUZ4+mDKCX4z2WBsLqg4x1GO7sisGPEiGxSjy3xbDDKgps9qc8R0
	 nuTJEX/DodZ7d7BP7uqJHDdi58U56sBgmVk6/QtSuTIYqTc2HL6Bo+ycovj/drw6/3
	 uSf2vfO+WTwANDgvfAEwfLWYxwlNVvEbNoxijS0+8dbIZ/+lQD+4x6RuAzMlEQA8Iv
	 aydLDDyDR5eP++yfpHDlqZEureODCogxwtWVdOCnQDG7cq38mHCXBFpyi4W20azctC
	 Onz2h7hU/WouCjSafgnN+wOH7iiVImleGCe/sPjHa7YWxDdpdqP6cF8Frn5z1yXgqm
	 rV1n7GaKahvLg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E0AC11AC5AC8; Fri, 24 Jul 2026 14:05:32 +0100 (BST)
Date: Fri, 24 Jul 2026 14:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v4 01/12] ASoC: soc-component: move
 soc_component_field_shift()
Message-ID: <amNjHDwmGHqAWh56@sirena.co.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
 <87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
 <d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
 <b0e44e5d-7649-40ed-8f17-e61b654c1733@sirena.org.uk>
 <87ecgutxhe.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecgutxhe.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Take an astronaut to launch.

On Wed, Jul 22, 2026 at 11:29:01PM +0000, Kuninori Morimoto wrote:

> I'm not sure this is correct, but my rule is that the tag is added
> follow along in chronological order, like below.

> 	- Reported-by / Suggested-by
> 	- Signed-off-by
> 	- Acked-by / Tested-by / Reviewed-by

> Thank you for your help !!

Generally you add any tags that you collect from other people
immediately before your own signoff, that means if I gather tags for a
patch you posted I'll put the tags between your signoff and mine but if
you collect them they'd usually go before your signoff.
