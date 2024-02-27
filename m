Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EB137C20
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.241.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709035681; cv=none; b=ie93vzhLeqsz5bkXHFV4g1D7fJImR6dpmPLtAbc7CzpmxBbkBJAf20PHqWVIW8PfE0aw7iDKDVRoH4jfVMXQrvGK05neB29aksJw8kfjWslOphlJGttvDJspIKf50HVi8jQ3W6h0ZVv/xBYKCFXH2oIgsUAE0kN4r5I3vJkOEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709035681; c=relaxed/simple;
	bh=qi4/dWopxW9hUXi+HOn4Bc61aT9LEYjf2yM0KXDkpPQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpvnYvZ5kSYd9UOWI7Oi7VLKNkskPTJ0d24rj8pjxhQ1rSZRA2uMho2v+GhbpGVcbGGvtP4RiqYpOU/xgaw/ps7ptYe8z8BdUdBdlZ1tJzwfXChZODPQF+GvGDloemsoboh81mbVC7dtA6ZArBOso9m4/FkGi5ZyLbXUVKjLgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com; spf=pass smtp.mailfrom=de.adit-jv.com; arc=none smtp.client-ip=93.241.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.adit-jv.com
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id DE558520362;
	Tue, 27 Feb 2024 13:07:48 +0100 (CET)
Received: from lxhi-087 (10.72.93.211) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 13:07:48 +0100
Date: Tue, 27 Feb 2024 13:07:44 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Eugeniu Rosca <erosca@de.adit-jv.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, <linux-sound@vger.kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Vincenzo De Michele
	<vincenzo.michele@davinci.de>, Andreas Pape <Andreas.Pape4@bosch.com>,
	Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>, Eugeniu Rosca
	<eugeniu.rosca@bosch.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
Message-ID: <20240227120725.GA1141156@lxhi-087>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
 <874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

Hello Morimoto-san,

Thank you for the prompt response.

On Sun, Feb 25, 2024 at 11:21:16PM +0000, Kuninori Morimoto wrote:

[..]

> >  
> > -	return (0x6 + ws) << 8;
> > +	if (id > 9)
> > +		return 0xf << 8;
> > +	else
> > +		return ssi_ws[id] << 8;
> >  }
> 
> I don't think we want to have table for this purpose.
> SSIx special handling exist every where on this IP.
> 
> How about below ? It is more simple.
> 
> ---------------------------------
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 230c48648af3..bbc7845c68b3 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -113,6 +113,13 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_dai_stream *io)
>  		}
>  	}
>  
> +	/*
> +	 * SSI8 is not connected to ADG.
> +	 * Thus SSI9 is using 8
> +	 */
> +	if (id == 9)
> +		ws = 8;
> +
>  	return (0x6 + ws) << 8;
>  }
> ---------------------------------

Appreciate very much the simpler counter-proposal.

Quick/preliminary verification attempts showed that it might not be
fully equivalent to the original patch, but we are still trying to
get that finally confirmed or invalidated. Will keep you posted.

BR, Eugeniu
