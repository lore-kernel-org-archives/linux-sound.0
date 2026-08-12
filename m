Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981EA3EC804;
	Wed, 12 Aug 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524304; cv=none; b=lklp91TfLHU2ucXKROyL0Ze+3uQbFItpow0lZzjlbtEN15LlZT8hHNIBO+eC3d9k2aAH7ga2Ybs6yl9a6ilHMhKL8pgXVCDrkvtIy892RfRQl2S+zpy57xPOjTa77ARrRqeu0wjK+KHn9so6pvJXF050690NtweLyZ8iJuCtz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524304; c=relaxed/simple;
	bh=2CSMtcXEqc0tpmFCbYeOA99mobukjNgRUya0dU22yxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPNj/WZWf1PW9gWSu/zy0BojNJHAu5kXx0lDrVsXsuwEJsltHUJ7nmWKbrBcMBBu+wwtL0yEIHbin0pHp9mTd9cWkh7MQD8FW/TB6NzMNfRNguGPdNzcfqojftJlcGojic6VbOc6CZ3pg6IRoClNHdCqP+NgHaKKbmITfW7+c4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZ9RvO5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ9RvO5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9D91F00A3A;
	Wed, 12 Aug 2026 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786524300;
	bh=TGQs2XOjKlYSsf1IPMQ1PKQCI6R3QYdOYTCj0+ngk14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JZ9RvO5rnMBpsm/TwIHag8vWK0VkyOZqmGqW0LA/19erVWejoPe0XDxFsrKORnT8y
	 AeciO/7Iag677BVa5xXt3XDtYsebXh2IRUHNx9PfLTrgC16KU+/C9oEq+vWY/WNr11
	 gM49iCmWNifbp1uKK2oXB5vOTEBHuwAstof6gAMGxkknIbIW0E99d/OwTbPt98uwK6
	 7j2T05pPqk+u1+355Mk7TzklPjun2ACDLI7qBhChrOafG7aQ/oF9gg8rDBJw0A2qtT
	 gTKQXTZxpUBFD8NGi9v74qjd5LYUMp7xE2VdC3UmQ4WBaexw03frQoJKbwrUa3u1U3
	 vAkOntA/nrSCQ==
Date: Wed, 12 Aug 2026 14:14:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] soundwire: bus_type: Create IRQ mapping before
 calling driver probe()
Message-ID: <anwyid-ZPYHo1huA@vaman>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
 <20260810104045.60701-4-rf@opensource.cirrus.com>
 <anqwMUVn4VnbaI6S@vaman>
 <271cedf9-9fb0-443c-ae26-fa3276e3c6ab@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <271cedf9-9fb0-443c-ae26-fa3276e3c6ab@opensource.cirrus.com>

On 11-08-26, 09:37, Richard Fitzgerald wrote:
> On 11/8/26 06:16, Vinod Koul wrote:
> > On 10-08-26, 11:40, Richard Fitzgerald wrote:
> > > Call sdw_irq_create_mapping() before calling the peripheral driver
> > > probe() so that it is possible to request the IRQ during probe().
> > > 
> > > Previously creation of the mapping was conditional on the use_domain_irq
> > > flag in the driver properties. But these are filled in after probe(),
> > > which meant it wasn't possible to request the IRQ during probe(). This
> > > was ok for MFD drivers where only children requested the IRQ. But for
> > > normal drivers it led to the non-standard behavior of having to defer
> > > requesting the IRQ until after probe().
> > 
> > Shouldnt that still be the case (conditionally creating mapping). Does
> > every need this mapping?
> 
> Other interrupt providers create all their IRQs even if nothing uses
> them, so why worry about one IRQ mapping per SoundWire peripheral?
> 
> Currently it's just another way that the SoundWire subsystem doesn't
> follow normal Linux conventions and requires the codec drivers to
> work around the strangeness.

Hmm okay lets go with this, so

Acked-by: Vinod Koul <vkoul@kernel.org>


> 
> We could unmap it after ops->read_prop() if we see use_domain_irq is
> false.
> 
> If we want to skip ever creating it, we'd need to move use_domain_irq
> to somewhere that is valid _before_ calling the codec driver probe().
> 
> Or call ops->read_prop() before calling probe(). There's no explanation
> why read_prop() was placed after probe() so I'm reluctant to move it.
> But I assume it's expected that probe() will always be the first
> function called in a driver.

The intent was that drivers can override the properties, so after the
probe is recommended.

-- 
~Vinod
