Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F62AF1B;
	Thu, 29 Jan 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708273; cv=none; b=aVPnAGe3jrVp2wwHs/xaFWNbv7n5tjd9sVOELwDWURwCHlYmGGg68YhnSAh7EH4qGWJ0n515NUBCDfFTlpMR8R4fEWDHqetd3sqxJ2ojJkTTOFZUlL0mntvjxiz8Vfy9wutx7Rrtz4Z0G7fv872hAlOTW7gfeTYFKtHUQGogr0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708273; c=relaxed/simple;
	bh=gD+TjH28FkmuBFe0aHVdfvEShsOJjcA0TV3XU8C7haw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzfTOdvEVGn7XxG5IebVMerVm71+MrtYwY7jCPztskPDWELAUJNorJ+A5PkIZ7Z0ttaTbq55r8LPBrA7jTQbMuE728mlflPdhEPyKHKWCIakRuH8EUNKuEPBmW/Yv4b9PHImjq43RRCCn45fofI0VtSWIPh8yBQ4ANCddwAr9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=V50rUZsJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="V50rUZsJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NH1Y7z4Xz/rnFfteVmXJ0FyGxvOgtpdFaiDdQOvHyM0=; b=V50rUZsJPUp9HvoynitTnMEooH
	qhDqmrgqWquVZSOFNhD3p2/9nuUKExMH0zbx+/MkiiTYv8qNjea3Qyw/AN1nsxs6F0kqE0/re4ek5
	Vpt1GPMLwBwUy8eZlZ6KmpC9f6IlNMt5aGoF4EzGoRQJiIy1uK++m1Heqo2uX/dpXkZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlVxS-005OdE-D8; Thu, 29 Jan 2026 18:37:30 +0100
Date: Thu, 29 Jan 2026 18:37:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>

> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get supported channels\n");
> -		return ret;
> -	}

I don't know this device at all, so i might be asking dumb
questions....

It is possible that the device supports multiple channels, but the use
case is mono, and so xlnx,num-channels is 1 in DT? Would that break
given your change?

> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);

Could it be the device supports 24 bits, but the use case only wants
16, and so has this property set to 16?

    Andrew
