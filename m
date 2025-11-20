Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0149834AB18
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763659069; cv=none; b=GALUddTwngt0EstGFTzfpLAd3gOQE+U6TukHO4sYNPzUwmBJcGlCFEOFj6GNINAbc3rigYwo9yIqXF/WmF8ql24RRzx/1s2SxFdTG6p5qWBa4duSbSwD6eAgIWj5ya9sutu23kRgKzoLZjQNLSNUGnTONA0UdDZvLAoYTsq8pBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763659069; c=relaxed/simple;
	bh=HM5xDYXeJBXwPbxK1B0oiTDifoU0viP/XqUQbtwrSiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBQIJQ/mSR3SKAyBv1/gLVxiHox1+TZ2lqGpsgObwaUMwCHPfgyNXJQipccRfDOnpZ9opz0r0uQkStiQsApzcYeBxIJGJjydOFeALeOHQR5xbdifUWaTgHEAO0OTBVT8ogYAARn54PasAItk2L/KtZs5KByJHA2Bv6yl7AaKNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRMZbfaH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRMZbfaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD99EC4CEF1;
	Thu, 20 Nov 2025 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659067;
	bh=HM5xDYXeJBXwPbxK1B0oiTDifoU0viP/XqUQbtwrSiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRMZbfaHRFYciaMQBYnKwPfqj6EvqOUfLzaV2xoUmI0L6GJ2FrzGinlmq3DKvSYfe
	 wc3FqfJtczs9mYeJ1eDSMt8+NEe85JsXWQcrCg5/m9ztZ5lgoyDD8f6si462fyhNKa
	 IgCgUsuvdw8dBKBFs3LtWYbkXrKL2sKrL1KE7pNgUdJpLWUD6iayEykIRRLzoEeCMK
	 GamBhP5b3t8/eOxaPdA3j6FredeX9UFXBP5+8BXsnideMf1oDSMcX1a2+tqPP+BrOl
	 ZNyvdegWs59A3Z+g9jH5bZnxywey/RhUBcs4S+7Fkltk2OXudq/YbyU0c36Plm1uCB
	 Ic1CulPUwjbXw==
Date: Thu, 20 Nov 2025 22:47:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 00/13] Add SDCA class driver
Message-ID: <aR9NN28_esxRjpeo@vaman>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>

On 20-11-25, 15:30, Charles Keepax wrote:
> This series adds an initial SDCA class driver, this consists of a
> primary driver attached to the SoundWire device, and auxiliary drivers
> representing each of the functions of the SDCA device. These drivers all
> use the APIs added over the past series's to provide the class
> functionality, as such these final drivers themselves are quite thin.
> 
> Also a few fix ups at the start of the series that have gathered up
> whilst the last SDCA series was in review.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
