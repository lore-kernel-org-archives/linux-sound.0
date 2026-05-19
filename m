Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12902DF153
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207837; cv=none; b=tuGSBYD1vStdpHEuj0wIbztmlPHrOqWa2IHW+v9Nc6jVAWaDKsV81liz///Di2622XhcmHHqWzMExfL9iU99n7OsP3njrzk+GbjZ+KOFeSmVp9B0hxpORSJBkb3F9y1IBw3jjTWKWkR+5CBIO898PykVhv8GoJkbxCVFEDzKs50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207837; c=relaxed/simple;
	bh=sawSq5eXQjYiqQ9J4p/mTD8n9jgYdcmC7L1nxPoWhOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTgiRPPdJySwBk+uzyp4vSUBe26TMWzeZ1oWkZIqZY0kKduhonXXiVpHpy0ERoxQVi3uc+Ugy9d8miaKca1jsjvJUCQ8a9i9Hu2+DQFmzfraGktkzSdpquCYU71AjJzONd4Y7DtK/ZDN27y4iKQKAGgqYJIIYn8/UOZRa2GQ8XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDahEXqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDahEXqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C9DC2BCC6;
	Tue, 19 May 2026 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207837;
	bh=sawSq5eXQjYiqQ9J4p/mTD8n9jgYdcmC7L1nxPoWhOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDahEXqrqLXUa5phbwB8xR5fe5YnUtFNE63KbsZ113vDqjU1nXidwvIDTKncoR2tA
	 9RrmZsdhbuKZx7+RWjjDLnPPfaCjLjQ/hwvyWZ6AauyXQVBbVYrTlZ1OYXcdyN7GkL
	 9kPIueZkMzgCS3nJBiPzdPMLPebEREOT8cO8wDFo7wqEtlwUCaH3CfVoKXcqCn5JXo
	 hXls28zr9ZjuUvRlCbSvhz15yc5M6/S7ucNPwWQ2EVXTcrG/rjgJ8zOIbJskRxQrvL
	 p8ZPgPTXb0Q7LPoVNSX6cY7o7OVvyik8pvJRg1nWrfUr25TGwUAuAegeSxO4QswuSz
	 Y57aKfHHBOVAg==
Date: Tue, 19 May 2026 09:23:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
	linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, ckeepax@opensource.cirrus.com,
	vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <20260519162352.GB3527449@ax162>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
 <20260518224657.GA536765@ax162>
 <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>

On Tue, May 19, 2026 at 02:42:08PM +0200, Pierre-Louis Bossart wrote:
> On 5/19/26 00:46, Nathan Chancellor wrote:
> > Maybe something like this is needed?
> > 
> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index 5fdd0334c355..b9e8df5ddfd5 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -1302,7 +1302,9 @@ config SND_SOC_ES8389
> >  
> >  config SND_SOC_ES9356
> >          tristate "Everest Semi ES9356 CODEC SDW"
> > +	depends on ACPI
> >          depends on SOUNDWIRE
> > +	select SND_SOC_SDCA
> >          select REGMAP_SOUNDWIRE
> >          select REGMAP_SOUNDWIRE_MBQ
> 
> Maybe this instead?
> 
> depends on SOUNDWIRE
> depends on SND_SOC_SDCA

Yeah, I realized shortly after sending that suggestion through testing
that it would error during the Kconfig stage due to a recursive
dependency issue. However, CONFIG_SND_SOC_SDCA is not a user selectable
symbol and I only see it selected through

  CONFIG_SND_SOC_ACPI_INTEL_MATCH -> CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS

so is it expected that users have to enable a driver that selects
CONFIG_SND_SOC_ACPI_INTEL_MATCH to get CONFIG_SND_SOC_SDCA?

-- 
Cheers,
Nathan
