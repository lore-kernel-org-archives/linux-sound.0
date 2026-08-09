Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF4245008
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284403; cv=none; b=PCDIDu8XwEvSFFx3rYnXNwoQBkdbzOU6kEqQDwp7dp8lZVJM/D+rMxdG5S4BAaPLxUMzCpBZPvY9R77UE7Xn4K/xOEZUL5oJDSeVWJhmzrOvW8eJZKrvICbJS3sAA1ezSnXoZ3jQ8ELhRTmm3en3uB7mfeNmv1UBRcQbWlm9Vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284403; c=relaxed/simple;
	bh=s1AtzEU34CehH4LO34YcEuoDgc+1M6QGfK5TmoBc+fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFxSHZHsuY1IRxpwZ5jZocpowuJBRItgPYspu00VhZ5vyI/Xch0rHLR8jZ56pdpltvFNGhFwNl74GxVEFLeMtEHGiFxebcNAT+y56w+dVuNJ9UIq7Gr71wnzBwtmmiSZ8vOabCsWtT0TUmv9IBfZcRLDCxObs3qKYRkJVtT8h8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FrNCtsR3; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FrNCtsR3"
Message-ID: <413bdfd6-e0b6-4a64-9e60-cfe25ac684be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786284388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/FQqvJsYVON7n5y8oKHd48bZLUKB/UcRMmlnp5jPIc=;
	b=FrNCtsR3DuS3mEs1I6aOvPjCSul+ScmP4DDhI6zzEOUAp30lPB1v09GslDx1gZL4xKs6/c
	DYSut7mZqmhbgJl/jyNI6ItHy2Ds4LwPf2ofUU1JUwlcXNoFJtz1Uj3FACkSTTIghZ33n6
	kOSWPoFvdNED10s7VTrr+wdMvyyvlEE=
Date: Sun, 9 Aug 2026 16:05:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: tas2783: let regmap-sdw-mbq poll for deferred
 transactions
To: Ville Saarinen <wiza@saarinenkoti.fi>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
 <20260809101541.4969-2-wiza@saarinenkoti.fi>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260809101541.4969-2-wiza@saarinenkoti.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/9/26 12:16, Ville Saarinen wrote:
> In SDCA, a Function answering COMMAND_IGNORED to a Control write has
> deferred the transaction rather than rejected it. regmap_sdw_mbq_write()
> handles that by calling regmap_sdw_mbq_poll_busy(), which waits for the
> Entity-0 Function Busy bit to clear and then retries once. Neither half
> of that works for this codec:
> 
>  - poll_busy only polls if ->readable_reg() accepts the Entity-0 Function
>    Status address. tas2783_readable_register() answers out of
>    tas2783_sdca_mbq_size(), which has no case for that address, so the
>    poll is skipped and the core falls through to a bare
>    fsleep(cfg.timeout_us).
> 
>  - tas2783_mbq_cfg sets only .mbq_size, so timeout_us and retry_us are
>    both 0. The fallback wait is fsleep(0) and the retry is therefore
>    instantaneous.
> 
> Every deferred write consequently fails by construction, returning
> -ENODATA and logging "Defer on undeferrable control".
> 
> Add the Function Status register to the mbq size table so the poll can
> run, and to the volatile table so a later regcache_sync() never writes
> back to a status register. Mark the UDMPU23 Cluster Index deferrable and
> give the mbq cfg a poll interval and a deadline.
> 
> Note the two cfg fields reach read_poll_timeout() as (sleep_us,
> timeout_us), i.e. .timeout_us is the poll interval and .retry_us the
> overall deadline -- the reverse of the kerneldoc on struct
> regmap_sdw_mbq_cfg. The values here follow the code, which is what runs.
> 
> Developed with AI assistance. The assistant traced the -ENODATA into
> regmap_sdw_mbq_poll_busy() and drafted the fix.
> 
> All hardware measurements quoted above were run by the submitter on the
> affected machine. The submitter has reviewed the change, understands it
> and takes responsibility for it.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
> ---
>  sound/soc/codecs/tas2783-sdw.c | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
> index 3d0b11654..5a7ac6224 100644
> --- a/sound/soc/codecs/tas2783-sdw.c
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -423,6 +423,13 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
>  	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 0):
>  	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 1):
>  	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x04, 0):
> +	/*
> +	 * Entity 0 Function Status. regmap_sdw_mbq_poll_busy() only polls the
> +	 * Function Busy bit if ->readable_reg() accepts this address; without
> +	 * it the core drops into a bare fsleep(cfg.timeout_us) and, with that
> +	 * left at 0, retries a deferred transaction instantly and fails.
> +	 */
> +	case SDW_SDCA_CTL(1, 0, SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0):
>  		return 1;

I don't think this is correct, sorry.

This point has been discussed quite extensively in the SDCA group and
the net result is that accesses to the FUNCTION_STATUS *cannot* be
deferred. You cannot e.g. get a COMMAND_IGNORED response that would set
the Function_Busy bit while trying to read the Function_Busy bit...

Put differently, deferred access is only permitted in specific cases,
and Function-level controls/status are not in that list.

See 10.2.8.1 Rules About Which SDCA Resources Can and Cannot Use
Deferred Access

