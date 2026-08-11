Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67533B6EF;
	Tue, 11 Aug 2026 05:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425399; cv=none; b=qqxBEA+5WmjZIMFlU2J62xTrZOKd2DoiRXilAwZ/4ggKBx+Y8AH3kXWOx08TakTILwu48SWXOZQOHCvBE4E0AEY886IqusAK2YnBxe2qN67mA1N4rsUCwec9rC44i8iYx7s1Z33Yo+g6LLlckY5ysOo/rCRaKiGplZpCaaQfAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425399; c=relaxed/simple;
	bh=SuRl4ifZYBlKZi2MGZ3D0XIeHFd8TGa3PPcVfoZXR3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/QURqjNiIuq+Qj+cb8JLW5xZlXuCRy0c99Fmnm2uAW8TU/GN86uxv768WsduAJujBZeSrjNXJF6uHQR3/pX0G45xz71Jhv9aCvMcwUuAnQhh/Yvjfg3NvKEMPKzjYeAKaF7Hsca/QBLLnInuMT791TPn+2rRORHOuzlfiC3XrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykfm4EC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykfm4EC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0733D1F000E9;
	Tue, 11 Aug 2026 05:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786425397;
	bh=J31MJaku/FwBp5zHyet9AUq7dcNQhyA+xm3jQGp0ZXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ykfm4EC2wjWqmh5QX4u6RxEKeOM1ukWimeFC3Y5O1kAikM0MqGycVOIRpMaQkL2CV
	 W42EeRKNvWs8AGwciwAz5eVQYSL7qsPQgHrxfPOH56gal8WQnfIE3DdRGQf13755BF
	 TCgQ4aO4DuTXmlrAvWSEGp3qb5vcFvs7GoTm3hjqKUBpwqhC+nhsBO33QmwObQjtPd
	 +Vi3lxvzYWaZ55fPJwOlsC0j0X5IbHnvV12T0ouAFRiKNpNUHmxMIRSPmZyyDsi+0F
	 cP5mJEvriDpADR/N+I/bzvuEWohBpx+VtEYkhnsOQB47aIg+KSqcaRX3sWaPBkoDo6
	 EWO2aK6Zmczyw==
Date: Tue, 11 Aug 2026 10:46:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] soundwire: bus_type: Create IRQ mapping before
 calling driver probe()
Message-ID: <anqwMUVn4VnbaI6S@vaman>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
 <20260810104045.60701-4-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810104045.60701-4-rf@opensource.cirrus.com>

On 10-08-26, 11:40, Richard Fitzgerald wrote:
> Call sdw_irq_create_mapping() before calling the peripheral driver
> probe() so that it is possible to request the IRQ during probe().
> 
> Previously creation of the mapping was conditional on the use_domain_irq
> flag in the driver properties. But these are filled in after probe(),
> which meant it wasn't possible to request the IRQ during probe(). This
> was ok for MFD drivers where only children requested the IRQ. But for
> normal drivers it led to the non-standard behavior of having to defer
> requesting the IRQ until after probe().

Shouldnt that still be the case (conditionally creating mapping). Does
every need this mapping?

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus_type.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index e73c1bea90593..d61a97c5b41ef 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -105,6 +105,9 @@ static int sdw_bus_probe(struct device *dev)
>  	}
>  	slave->index = ret;
>  
> +	/* Create IRQ mapping now so the driver can get it in probe() */
> +	sdw_irq_create_mapping(slave);
> +
>  	ret = drv->probe(slave, id);
>  	if (ret) {
>  		ida_free(&slave->bus->slave_ida, slave->index);
> @@ -117,9 +120,6 @@ static int sdw_bus_probe(struct device *dev)
>  	if (drv->ops && drv->ops->read_prop)
>  		drv->ops->read_prop(slave);
>  
> -	if (slave->prop.use_domain_irq)
> -		sdw_irq_create_mapping(slave);
> -
>  	/* init the dynamic sysfs attributes we need */
>  	ret = sdw_slave_sysfs_dpn_init(slave);
>  	if (ret < 0)
> -- 
> 2.47.3

-- 
~Vinod
