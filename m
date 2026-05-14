Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F147D94D
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771440; cv=none; b=YbSWt8odiiu6BEPyfkO46Om6WqIiPDghiEToCHLiwae/rh1dSu7OfbbQgEK2F0tRy5Et/iYfYWIr96kAoB7dGwAFM5DgyZ6yAVo1W18r5xjjeRQjXy/Lhg7rD/k7wyD510VM/t06ZR2S7EdELy9CiiZbfvLKNAfQ1p4PYhTXFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771440; c=relaxed/simple;
	bh=tJtcv5aIIWW+WyByT6r/5f4h7bSztJfMeRjqcVhcmbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMn6O9nkHOKIBCaU9ZQW7tCLPmMbCVfmW37Qs3Ax5yse9MuC0uNMgMScisx6lgUrRPZPmsWkTZ+DAIIJ/dZnU2pvbfUKgzQupPIKUkvKIWhd0eV5moMJSNPpuBRhing/EnjIEPALOOK60RNinCgN+PQfre4REB4LGHYJ73+R8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH3F6zzR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH3F6zzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8309C32786;
	Thu, 14 May 2026 15:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771439;
	bh=tJtcv5aIIWW+WyByT6r/5f4h7bSztJfMeRjqcVhcmbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dH3F6zzR8WZ/T3VtI13W2XJMI6594TlJ4x/97Yh7VdboXfbWDJWnwI0qcXBJZBFnj
	 WCLYGdlFfWh61FH7LwLMempYv/cIKelAmbI5GQSZyhLLsveoQSC+Cn8j++9O2GsbNb
	 OWjDmCKw5nT747BrnIibO0Bt6SaVz4nnDnVP+7vpAZwYL/DZH9fKJ/HdEH8MJtynR3
	 T/Wllxv8a+hjKdCGclUOixyKER10eUxj63urslE2p5asOmMvTuJMixjs6+NKOPeWP1
	 rFd4yQJdt3wFIJsCwD7r2uU50+Fumy3otrpjJ+nm42ZRoIvJcdOdqVrcoM4No0Z0qE
	 er7MumIyZeOTQ==
Date: Thu, 14 May 2026 20:40:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Zhang Yi <zhangyi@everest-semi.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v14 6/6] soundwire: intel_auxdevice: Add es9356 to
 wake_capable_list
Message-ID: <agXl6wp-LCw_2vRa@vaman>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
 <20260513031554.5422-7-zhangyi@everest-semi.com>
 <agSbL_gdW6og_PXe@vaman>
 <agUh5D5LFxanFSHc@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agUh5D5LFxanFSHc@sirena.co.uk>

On 14-05-26, 10:14, Mark Brown wrote:
> On Wed, May 13, 2026 at 09:09:27PM +0530, Vinod Koul wrote:
> > On 13-05-26, 11:15, Zhang Yi wrote:
> > > Add es9356 to the wake_capable_list
> > > because it can generate jack events whilst the bus is stopped
> > 
> > Does this need to go thru ASoC tree, I can pick it up..
> 
> There's no dependency.

Thanks, I will pick this up

-- 
~Vinod
