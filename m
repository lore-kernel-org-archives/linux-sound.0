Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CA3716D
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.241.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709113517; cv=none; b=I9umRJo00DzXjnHlHNMkMC4jV5zdGrgUyPsx1/BuYAP2sv0kotwMC857/br4E3ouXG+GWE4Hl2b9JEddY51/fHOpy420gU7omFltaZU/o/ZX7m6a4rXLo//iMllbuhFQDi5A3xcZOAu1SRWc4gnfYbXeE8k8C3TPwwMzwCvdTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709113517; c=relaxed/simple;
	bh=gZ63arIBfYyx8NBjFi61EgcyDBjPMrsuzd3MPtH5z9I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7x1rgcZ/6l/eLSaSxFw6kmYIVCd40zCYslKmmEIH9MKB1tqoKLLeBubLQ5Is1HEIGivSeCVnGoTNPu05aDGqMgpt4JfypPjxJzUTqW4PhNUGA8cgNVHroCnFaA5qELk8jp0zM1Z8qqThjPiiwC9N5XHn+OP8igjE4Oc7WYiJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com; spf=pass smtp.mailfrom=de.adit-jv.com; arc=none smtp.client-ip=93.241.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.adit-jv.com
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id EAE5552038B;
	Wed, 28 Feb 2024 10:45:10 +0100 (CET)
Received: from lxhi-087 (10.72.93.211) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 10:45:10 +0100
Date: Wed, 28 Feb 2024 10:45:06 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Vincenzo De Michele
	<vincenzo.michele@davinci.de>, Dean Jenkins <dean.jenkins@siemens.com>,
	Andreas Pape <Andreas.Pape4@bosch.com>, Yeswanth Rayapati
	<yeswanth.rayapati@in.bosch.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
	Eugeniu Rosca <eugeniu.rosca@bosch.com>, Eugeniu Rosca
	<roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
Message-ID: <20240228094506.GA1150007@lxhi-087>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
 <874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
 <20240227120725.GA1141156@lxhi-087>
 <878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

Hello Morimoto-san,

On Tue, Feb 27, 2024 at 11:22:53PM +0000, Kuninori Morimoto wrote:
> 
> > > +	/*
> > > +	 * SSI8 is not connected to ADG.
> > > +	 * Thus SSI9 is using 8
> > > +	 */
> > > +	if (id == 9)
> > > +		ws = 8;
> (snip)
> > Quick/preliminary verification attempts showed that it might not be
> > fully equivalent to the original patch
> 
> If it is indicating that above simple code doesn't care about
> SSI8 error case, I don't think it needs to care about it.

A number of concerns have been raised internally, related to the fact
that the "optimized/simplified" counter-proposal behaves differently
depending on the value returned by rsnd_ssi_is_pin_sharing().

> Because SSI8 with shared pin setting is *mandatory*.

While it may be clear for you that pin sharing is mandatory, it is not
immediately obvious to the casual reader/contributor purely based on
code review. From this particular viewpoint, I would rather vote in
favor of the original patch authored by Andreas (Cc), since it makes
things very clear and does not hide any dependencies/assumptions.

Please, kindly provide your verdict, so that we can proceed with the
right solution, due to the issue being time critical for us.

BR, Eugeniu
