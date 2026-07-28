Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245B3A9DA2
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261245; cv=none; b=egxVSr901webAGZsAXv/l2pwb1j8TKvGtfISY9+1MpPaualBE6kzuDum3M3Y1hHnMLH/U95KlBUZB8B52DJ5wbe8G4tQ4X/IRpxqHULO3ukrJMMtHwmWH25wqYXoiarrK6e++2PlyGpU5OvnNfyXyhusKHu0FNgX+0T0YXtELuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261245; c=relaxed/simple;
	bh=iSOwtiLLBLiWxGPJADdMlgslBm5K7SwbX2FbXZ2yxTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt9Brk9RWc9RmKJRBl31NqnjDYIR2qRcKyMxv6UwScG4of5tOb9Z0wNKncd0JPnhVQQ+6J6TDk4FMGrPbAipjzsuNClFP5QybUwWPHazT5AUAUkvIr1BAzwFqpu4D2QSgekrEYQdEJzTr46mqLgQCsqXxLcuJ8c0ca8N3bdHp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f9MjRsfl; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f9MjRsfl"
Message-ID: <d3105aac-7018-4b4d-8ed9-1e821179ce42@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785261230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnvFG7bfATbXiCziQpDxDLo4VX7GwG39x66H5lok2aE=;
	b=f9MjRsflN54Qp3PlQQ0mJ7tyWsE+83uFS12s7kc+nae/VISQTw2yPCa2mB1dZR1GWa0c81
	IlkglCajaNwdcwpkUZ9Z1axAI9pSEnZ7+6rMt83ttCnw0jK06TaUt/ot5ZqKzPF0JmDsbw
	bMLUBTGnCfSbl9NrmXLKBU9Zc0TnUlQ=
Date: Tue, 28 Jul 2026 19:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] soundwire: honor clock_reg_supported in the clock
 scaling check
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
 <20260728173542.61146-2-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260728173542.61146-2-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/28/26 19:35, Jorijn van der Graaf wrote:
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
> With the helper extended, sdw_slave_set_frequency()'s open-coded test
> computes the same predicate; call the helper there instead, so future
> quirks or updates land in one place.
> 
> Link: https://lore.kernel.org/all/5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev/
> Link: https://lore.kernel.org/all/6991398d-4ae4-45ee-85d0-3b66462fec1d@linux.dev/
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
> v2: also call the helper from sdw_slave_set_frequency() instead of
> keeping the same test open-coded there, as Pierre-Louis suggested.
> 
> Both patches re-verified together at v2 on the Fairphone 6 (SM7635,
> WCD9378): "Configured bus base 1, scale 2, mclk 19200000, curr_freq
> 9600000" for both slaves at enumeration, no codec errors, capture
> works. On the qcom bus the helper extension only adds next-bank scale
> writes of the same value on bank switches (the clock is fixed).
> 
> One behavior change I cannot test: the helper also feeds
> is_clock_scaling_supported() in the generic bandwidth allocation, so an
> Intel link whose peripherals all pass the check - max98363 is the
> in-tree clock_reg_supported case - becomes eligible for dynamic clock
> scaling where it previously ran at a fixed clock. Only configurations
> that fail the bandwidth check today can select a different frequency; I
> could not test that combination, flagging it for the Intel side.

I don't see this as a major risk, the bandwidth needs are limited and
the BPT/BRA protocol isn't used. Worst-case there will be a bug report
on Chromebooks and we'll quirk this...

>  drivers/soundwire/bus.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 0490777fa406..0c1cdd603926 100644
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
>  
> @@ -1385,7 +1388,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
>  	 * DisCo property to discover support for the scaling registers
>  	 * from platform firmware.
>  	 */
> -	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
> +	if (!is_clock_scaling_supported_by_slave(slave))
>  		return 0;
>  
>  	scale_index = sdw_slave_get_scale_index(slave, &base);

