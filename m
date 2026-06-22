Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843535E1CE
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110181; cv=none; b=kPZCUECvjD2snzSENuRqKayXY4nJh3i49oSXZ4P7yReyYWPqVbdmwxUQzkr/Dd5i1z9U/xzSFDSupiEAMJ9nS/zzp9fcsDrv1z/q/4wfFVfBdEXd5BbZQGWkmSoSHedb5QLGjt+4/BrkC05XY+uLdTeb0bofSoC9v7h0Y/BNexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110181; c=relaxed/simple;
	bh=OSIM+mQzdD+LjxxJ/dkr8bmxb9uhBqOeLzksxlzF1b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=H46yWyG+NKrbvzPK9EeBBUhR0JsENcNvfVe2HD7VviZVgz8QrcSj7puJxVLeiERfFksFc8rTTWoPTvNk0GPMp88fj4w4iQ0V+1ojTIVWxQVKfUDXDiwpc5MkpsbjszVX4zST1PWOH1qqCIhq70k+X4MKJaAx9sLWRx5czz+koHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO localhost.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A38D737000017EB; Mon, 22 Jun 2026 14:33:27 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A9CF0BEF27FD4FAEA2D832EEA1C72C85
X-SMAIL-UIID: A9CF0BEF27FD4FAEA2D832EEA1C72C85-20260622-143327
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v2 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Mon, 22 Jun 2026 14:33:18 +0800
Message-Id: <20260622063318.3535-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a619312f-55b8-41f4-b288-d7c343f5f9e9@sirena.org.uk>
References: <a619312f-55b8-41f4-b288-d7c343f5f9e9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +  everest,mclk-src:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Indicates that SCLK is used as the internal clock.
> > +    minimum: 0
> > +    maximum: 0x01
> > +    default: 0x00
> 
> Could this be done by having a clock API property for the MCLK source
> and then falling back to using SCLK if that's absent?  That would feel
> more natural for DT, and you'll probably want the MCLK property at some
> point.  It's also a bit more of a neutral description of the hardware,
> future versions might switch dynamically between MCLK or SCLK based on
> some criteria or something.

I'm not quite sure what you mean.
Does the implementation below match what you described?
clocks:
    items:
      - description: clock for master clock (MCLK)

  clock-names:
    items:
      - const: mclk

es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
	if (IS_ERR(es8389->mclk))
		es8389->mclk_src = ES8389_SCLK_PIN;

> > +  everest,hpf-frq:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The frequency of HPF in Hz.
> > +    maximum: 1020
> > +    default: 16
> 
> Why configure this with a fixed value in the DT - it's the sort of thing
> I'd expect to turn up as an ALSA control so the user can vary it at
> runtime if they want to?

I don't want users to be able to change the HPF value at any time,
as this would affect the codec's startup.
Or I can use SOC_SINGLE_EXT to define HPF-related controls
and write the modified values to cache when writing to the hardware is not permitted.
