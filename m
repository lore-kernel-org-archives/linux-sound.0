Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD235B653
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178613; cv=none; b=UZ0R+WaVT8IsX0ko77gLohwOeby0Qbf4TLfeuOSPBNAv8o2MwzV8Yoj2JiyAKaVS4ix+Ro9V9tQtA9D9hSOsrLLLbKhOLyhxCBHzdwDwzy3ADyL77LAsHrDc40raNSHXWyxIz42Utn+8K3tMzR8UCemtF2Wnzx3Go5NG634nQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178613; c=relaxed/simple;
	bh=hzRFhCYFbu5ABLODoRamtU0jFNXpk+AdRJDJOvvuZxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEmbtvxW4StmLn+QlSd2CLWQLZFmfWeP4WMLMJTIPVVN55ntTq/rUfDHkNSkOfocJvKS3SxAMkKRV5Y929yIvq4jS0WcoeEgUo441bvGn0f4ytqfPKA9rtvtUzf6TWne4A2f2Ry9wh4XD+6F95RZURlqs8Br9BvisRFe1XfLzas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H8L7es1u; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H8L7es1u"
Message-ID: <6991398d-4ae4-45ee-85d0-3b66462fec1d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785178599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqQdWG2MrbCuKWaDcCRh0kPMZg4oq5DYrFrQmE3D2O0=;
	b=H8L7es1uY9Db1E42F+wOPKnxFgwH0HreoRdxSYib/HcpMF3W7QlPzEQxBbYh7ATY2vx/Ey
	U3ljR7Ojh0m3zbHSqZUjPLGWQIo+vfhXzhweS6z9MTZxhQtCyxziSOEkYp2gN8QZ7pVSIS
	pXPM3GsBKy7ULMAKienw+qSOSYb3Sbg=
Date: Mon, 27 Jul 2026 20:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] soundwire: honor clock_reg_supported in the clock
 scaling check
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162741.68081-1-jorijnvdgraaf@catcrafts.net>
 <20260727162741.68081-2-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260727162741.68081-2-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/27/26 18:27, Jorijn van der Graaf wrote:
> sdw_slave_set_frequency() treats class_id and prop.clock_reg_supported
> as equivalent evidence that a slave implements the bus-clock base and
> scale registers, but the bank-switch reprogramming path checks class_id
> alone, so a class-0 slave that declared the registers never gets the
> next-bank scale written there. The registers are SoundWire 1.2, not
> SDCA, so a device may well implement them without setting the class
> field.
> 
> Extend the helper to honor clock_reg_supported, as discussed with
> Pierre-Louis in the WCD9378 review. This also makes a link whose
> peripherals all declare clock_reg_supported eligible for dynamic clock
> scaling in the generic bandwidth allocation, which is what declaring
> the registers means.
> 
> Link: https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
> Pierre-Louis agreed the helper should be extended in the WCD9378 v1
> thread [1]. On the qcom bus this only adds next-bank scale writes of
> the same value on bank switches (the clock is fixed); verified on the
> Fairphone 6 that capture still works with them.
> 
> One behavior change I cannot test: the helper also feeds
> is_clock_scaling_supported() in the generic bandwidth allocation, so an
> Intel link whose peripherals all pass the check - max98363 is the
> in-tree clock_reg_supported case - becomes eligible for dynamic clock
> scaling where it previously ran at a fixed clock. Only configurations
> that fail the bandwidth check today can select a different frequency; I
> could not test that combination, flagging it for the Intel side.
> 
> [1] https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/
> 
>  drivers/soundwire/bus.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 0490777fa406..d94e44b59050 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -817,8 +817,11 @@ bool is_clock_scaling_supported_by_slave(struct sdw_slave *slave)
>  	/*
>  	 * Dynamic scaling is a defined by SDCA. However, some devices expose the class ID but
>  	 * can't support dynamic scaling. We might need a quirk to handle such devices.
> +	 * The clock base and scale registers themselves are SoundWire 1.2, so a device
> +	 * may implement them without setting the class field; the driver says so with
> +	 * clock_reg_supported.
>  	 */
> -	return slave->id.class_id;
> +	return slave->id.class_id || slave->prop.clock_reg_supported;
>  }
>  EXPORT_SYMBOL(is_clock_scaling_supported_by_slave);

This looks fine, but can I suggest an improvement? It'd be good if that
helper was used below instead of having the same test twice. If we ever
need quirks or updates it'll be done in a single location.

static int sdw_slave_set_frequency(struct sdw_slave *slave)
{
	int scale_index;
	u8 base;
	int ret;

	/*
	 * frequency base and scale registers are required for SDCA
	 * devices. They may also be used for 1.2+/non-SDCA devices.
	 * Driver can set the property directly, for now there's no
	 * DisCo property to discover support for the scaling registers
	 * from platform firmware.
	 */
	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
		return 0;



>  

