Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709836FBF
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071156; cv=none; b=QtCA4Y37zZJWMDcu2T3tOznUa9YnPFDygGTtN49DybovrJROcSS+GcdMjKSmZhoGZ7lpji8PzdAgknSobADWr9q2CseqlFvm7PqcD40w2hv9oUnX5bievesCvprl0FGGNsy1TX56FCi7Kxmo+f5sYWJcjoSMmRGb7TMG9+u2hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071156; c=relaxed/simple;
	bh=MFDUCkLfTDISshsl3AI7BNhvSE3MCK0KANIg3nbtjCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFaKtEE6+iwZrC8CMTxkF7tlzyKK3WXAsJbo+4tIXVg6Ck/PmAdHr+kn6QIXASFqOXLOmbTW/+AIlHKxB9xPOo1qexzVs1qnVW5sDi2hi9XZ3BEsO1tLkLJFu/2sTLQeHgRdCPfwG8FPFJY0kp0NnG87YP/Qn0Zwg5gLChiEjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O8BImNQt; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O8BImNQt"
Message-ID: <69f7ae58-c8ee-4f13-aa7a-139eacb92fcb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783071149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnL2751hIWdStsXZs6WZ2Vg6ii28DjYgFq9G6dE0zBE=;
	b=O8BImNQtHArSfYaWehTpn32fRq+Mazu+8VitSnqGB3y4zQQRNdwklYgdXuLlzdNS2NzuGj
	d8BnezoTAaW07yRUPszgjBGLBq3u4GnsWCzu+rQLe4y7phd5y8dRVNtSUNIlqCiAIQqSAf
	Fv/f0VyMDtlyWO8vKyxJPK1WuM0rQfU=
Date: Fri, 3 Jul 2026 11:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: dmi-quirks: add a global ghost list
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260703011656.2572959-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260703011656.2572959-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/3/26 03:16, Bard Liao wrote:
> Not like other ghost devices, the 0x000000D010010500 ADR doesn't belong
> to any codec. We should disable it in all devices.

for the record the address is remapped to a zero value which is ignored by the existing core logic.

> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> ---
>  drivers/soundwire/dmi-quirks.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
> index 2a98fc8c104d..62cee6e2179d 100644
> --- a/drivers/soundwire/dmi-quirks.c
> +++ b/drivers/soundwire/dmi-quirks.c
> @@ -15,6 +15,14 @@ struct adr_remap {
>  	u64 remapped_adr;
>  };
>  
> +static const struct adr_remap global_ghost_adr[] = {
> +	{
> +		0x000000D010010500ull,
> +		0x0000000000000000ull
> +	},
> +	{}
> +};
> +
>  /*
>   * Some TigerLake devices based on an initial Intel BIOS do not expose
>   * the correct _ADR in the DSDT.
> @@ -212,6 +220,7 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
>  u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
>  {
>  	const struct dmi_system_id *dmi_id;
> +	int i;
>  
>  	/* check if any address remap quirk applies */
>  	dmi_id = dmi_first_match(adr_remap_quirk_table);
> @@ -223,10 +232,20 @@ u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
>  				dev_dbg(bus->dev, "remapped _ADR 0x%llx as 0x%llx\n",
>  					addr, map->remapped_adr);
>  				addr = map->remapped_adr;
> -				break;
> +				goto out;
>  			}
>  		}
>  	}
>  
> +	/* remap the ghost ADRs */
> +	for (i = 0; i < ARRAY_SIZE(global_ghost_adr); i++) {
> +		if (global_ghost_adr[i].adr == addr) {
> +			dev_dbg(bus->dev, "remapped _ADR 0x%llx as 0x%llx\n",
> +				addr, global_ghost_adr[i].remapped_adr);
> +			addr = global_ghost_adr[i].remapped_adr;
> +			break;
> +		}
> +	}
> +out:
>  	return addr;
>  }

