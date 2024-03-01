Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA0D6A028
	for <linux-sound@vger.kernel.org>; Fri,  1 Mar 2024 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.241.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283522; cv=none; b=rkOTd11bqtl2mzsqQqIDqah7FCP4HGfh7vYYeRlnKRcdyd5RwpNYTqKGzG9wpYzxPYwTjwwVS8wJ2mc/wNaYouxXLNbUDNHt2VjKykC99Yjk0/m4leM4Ylmwe2IQ2Iwc4h2VPNYbR6japyeztWN5SWv5m4AH0IzhFYTzWjoFTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283522; c=relaxed/simple;
	bh=R/SgWhlRRpi5FMTgTc9xwjzPzPwxhr71Zu8T8+Ks4n8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li1+GlZziGBasgbdYEsk3I6kdhp0zMViVdZSD3qS95y/UrcqVmxEFDaeIePTJNn0Okck60XZ7XnvpZh77hL7yOgRMzEpSVoE+26354xdK6lcGmVZIFGe0cPyIHwoqx1QNw2SqpatrxUjYDhI8Hyx8X+Yws7gOo2zM1JinEOsR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com; spf=pass smtp.mailfrom=de.adit-jv.com; arc=none smtp.client-ip=93.241.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.adit-jv.com
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 5BF8952010B;
	Fri,  1 Mar 2024 09:58:37 +0100 (CET)
Received: from mypc (10.72.94.2) by hi2exch02.adit-jv.com (10.72.92.28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 1 Mar
 2024 09:58:37 +0100
Date: Fri, 1 Mar 2024 09:58:15 +0100
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
Message-ID: <20240301085815.GA3088@mypc>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
 <874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
 <20240227120725.GA1141156@lxhi-087>
 <878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
 <20240228094506.GA1150007@lxhi-087>
 <874jds88lb.wl-kuninori.morimoto.gx@renesas.com>
 <8734tc86ra.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8734tc86ra.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

Hello Morimoto-san,

On Thu, Feb 29, 2024 at 12:16:09AM +0000, Kuninori Morimoto wrote:
> > > A number of concerns have been raised internally, related to the fact
> > > that the "optimized/simplified" counter-proposal behaves differently
> > > depending on the value returned by rsnd_ssi_is_pin_sharing().
> (snip)
> > Could you please indicate the sample case of differently behaves ?
> > For example, if xxx was xxx, original code behaves xxx, but simple
> > code behaves xxx, etc. I'm not sure what is your concern...
> 
> Ah.., in case of SSI8.
> 
> > > While it may be clear for you that pin sharing is mandatory, it is not
> > > immediately obvious to the casual reader/contributor purely based on
> > > code review.
> 
> SSI8 with pin sharing is not only this function issue,
> you can see same comment on rsnd_adg_set_ssi_clk().
> # It is not clear for me either, I have been forgot about it :)
> # and I have never use SSI8 before, so I'm not sure what happen
> # if someone use it
> 
> If you have concern about it, why don't you add such error/message
> when begining time, instead of each functions ?
> Because of compatibility, rsnd_ssi_probe() is not good place,
> so I think rsnd_ssi_connect() is good place.

Thanks for your patience and for accepting different viewpoints,
while discussing the issue. Please, kindly review v2:

https://lore.kernel.org/linux-sound/20240301085003.3057-1-erosca@de.adit-jv.com

BR, Eugeniu
