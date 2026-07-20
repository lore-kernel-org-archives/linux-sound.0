Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A042FCC0
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558686; cv=none; b=lR8HmvMFd5Ws1t8FNRdPlrlmhr+7jxFEApS/GBEobBYDuwN881ing9vgJ6ir2t2dTToy+yXoMH8wC6KxNVCIFV8PG+Saee4t5G9iTmo8RVlIc+xFekR9XfPAwdm/mr2al7H/6QyRybm4D3EuyLxFMq4UgEMHzulTVmHD9OWCfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558686; c=relaxed/simple;
	bh=D5eNkc6oopz6Vs5ScuNTuY02P0gVdZnp0VO3XIAQcRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otwc4p/Z0fS/E6ULhDUY+ui00lse0q0rqMWX7cmMoIVwj2LPDQM3tmdVYMj0VNvuDjoEIGntSdD0KdBSXGjkjr+8iUO7LLcVAxa+bqWo8q4q9bR1Mf/I9L52Rm0i6wu/m2d4iexOo6U6abbXlcjFh/5Tm85Jlvq0XzVtS+fP5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jnI3ALc+; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jnI3ALc+"
Message-ID: <c7fed24d-3dda-4750-b6f0-7e97986c1a81@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784558683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+a/cGv82mut/Z1M4ulFrjuCu7c10/qUkSIdkoIV5Teg=;
	b=jnI3ALc+vepgwctPAeS2em2V6Sz92GxD0uSklg/i62jjZIVmu41pC/3ePtIodtqOORAiPJ
	igUnYtcB2kCBdP7VhQlt4l3eBZcYs4+Lpc8aB5xiJ3Ti7qyAn9Myr9ra6+Ce5AsjmU+1lC
	h1huwZj1mZIwb4XXtvVR/i/AIYECGes=
Date: Mon, 20 Jul 2026 16:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus
 Zenbook Duo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260720095741.3592825-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260720095741.3592825-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/20/26 11:57, Charles Keepax wrote:
> The Asus Zenbook Duo also has a Realtek device in the ACPI that
> doesn't exist in the physical hardware. This confuses the machine
> driver into attempting to create DAI links for the device. Add a
> quirk to remove this device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

This is likely to be a never-ending race... I wonder if the machine
description used to find the relevant machine driver could be used to
drop that ghost device, or if there would be any merit in having a quirk
file provided to distros and read via e.g. sysfs to have faster patching
done by userspace.

> ---
>  drivers/soundwire/dmi-quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
> index 62cee6e2179da..f738e547a1f30 100644
> --- a/drivers/soundwire/dmi-quirks.c
> +++ b/drivers/soundwire/dmi-quirks.c
> @@ -200,6 +200,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
>  		},
>  		.driver_data = (void *)ghost_realtek,
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "UX8407AA"),
> +		},
> +		.driver_data = (void *)ghost_realtek,
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),

