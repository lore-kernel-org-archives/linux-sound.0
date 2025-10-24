Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C946280018
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306229; cv=none; b=XIFF+0vwO28PaUbfNnouERI6WqEnq7K57TDC0J5udWbl/IsL2lEB86RmOaEUhuiFCpMDbaPIMaevufrcv/s3oaKHg2pqC4YOwRSxBiE6J3CiZ25tIFSXxEUpwjsPiTMhv1s1WmaZTFkW4tmPzf4duRiAjYutBum6oTtEhZBSR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306229; c=relaxed/simple;
	bh=PxqA8fGkhLyWpvdGiiXd1sJ1JUPWNYJtdS3Gl6lhaNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmLxiIGHSC1XoLxm/FPxPaMa4kcHnlyDrby1jy8zg7VEJwA1sFeuSA91g3IebeeX7JhoN9rcps/7OUq8tfa1JRzFtjRd+Z0oQzFv9B0a+hZeih58oO55GXHROK1cLSWUfUXsjo9WISDnYPsglp2bM50pZVPZ/sU2zEieBK1w9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lh1e/Ot8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lh1e/Ot8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471191ac79dso20981435e9.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761306225; x=1761911025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5qxkD57psZ9p1LY+6HM7xc7ogBuTrsa0anMGrCbLRs=;
        b=lh1e/Ot8jy9dAbq0hlw7K2TM5utaXCLVAJ7UD1hgNetmCOQTPGgPI46nS9s0KZ0WVf
         iNXnHpb82R8tovxqmct2Lewd5wDY41bCHJSPESRDPTqjSPNvjHQSoyzVM3cAl2XAzCuw
         dUH93Vu3soKAdw0wlBndvlRc128xtufazOWmWARkfOQNTXg/Dh6zvyBRlMcfvMapjlCZ
         z4/VKgy5SA/3Jtz8aiYBtze8JgTngy622wRdlDAuC7Kfy4cIHh7mnyPD1O/H3qPTUZxn
         IWAgZokrVEqT0dcwmOinAKl2nS2qKQv/mRR6azxjfC0zJozN0gZc7++ThWFt1bLcej9i
         kLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761306225; x=1761911025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5qxkD57psZ9p1LY+6HM7xc7ogBuTrsa0anMGrCbLRs=;
        b=X7MKsQMxr6md5b7rsXYmyw1+TFkBhLxBBfo47CgFVQm7JeIlG8MGtu48a+o5xOHxQ9
         LKY3yLnflEtSNFFkMOThxUL3j0Cc+v2QC6q3VFPdvqGhE6nkRvD3YJ1AvXT8VhkAsvcK
         mdbdSoPU2ESQeXOIMfSljoaNYuj+bhcA8ofGAx5TK4bg3RliOmK2qEHvvTvTN3On1Z3f
         PpcsFTHzNRaknVEbcn+BfSJXHDO+EjW78KYkiHMmIVe9T/U6SX82eSmSBGvQGYxaATpa
         Tvr2grrJ0tEchNbtz4a47jJKO7OZV5qGkDFGei4+hzGeeFikNFpV40x1bAgzXVESGDtd
         fDiA==
X-Gm-Message-State: AOJu0YwfSgvRRxBY7CXnUbl2ENw8esRE97hrmyJMqmqolqqdYLg/LbvT
	OpxCiN/bl8Uuzq4DBfy8mwXe17zQfFI4hcI7IzlFxbY/bnlzDZWtwoQDXJ8S0B8o1qU=
X-Gm-Gg: ASbGnctgn4V0Lo0YTUryGy8GKI8LBHg8WcyVlYEC3/pi9c0bbNJO4DDflldsatjjuFK
	ivz/ngofTE4lkA/F6cc0Vm5Jw0PfUJ31eiH1WVfCER3LZ2aZaBs5tZsACxsKRlMVUIlNdCmsTHq
	g1IR4aC592FVCLoH5TrW9Fin7USluZngIyWa2OY8+u5pxgM+55IJJss0t5Pr9ok99mv47sTSva3
	sWEnC0oMeXwDLMYcLaKos4iogg7mKWcDrzagadz5elcLOpK/rNKEJwLWhdWyHPBFY2vQRGQqa6p
	R1EXrLglzUtdEdX0rZIUcf6TOQlK1Dk6gTyuKLVrJM8dWZHMhZPBfwjyftajx3dBulYDC9h3KrJ
	dScjZUI01pgFnTnTkQLAQ8/F6mE2cwUuhD2qbXK8mxPg8q+WaT6THzfxldw0aD6B14dOAC9a7rC
	gwX0lv4Q==
X-Google-Smtp-Source: AGHT+IEFZqjbBQ3BoVlU2o/IDQHLthWzfbI/IS0tbpMXmAbbZABjCZQYFwtUHO9XWsJ78BnMwpcv4A==
X-Received: by 2002:a05:600c:b8d:b0:471:115e:624b with SMTP id 5b1f17b1804b1-475d2e95f39mr16080735e9.17.1761306225250;
        Fri, 24 Oct 2025 04:43:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475caf152absm104269795e9.9.2025.10.24.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:43:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <aPtmbe9uoHIPfZz7@stanley.mountain>
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
 <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>

On Fri, Oct 24, 2025 at 07:37:51PM +0800, Troy Mitchell wrote:
> On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
> >     424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> >     425         if (IS_ERR(i2s->reset))
> >     426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
> >     427                                      "failed to get reset control");
> >     428 
> >     429         dev_set_drvdata(i2s->dev, i2s);
> >     430 
> >     431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
> >                                            ^^^^
> > dai is not initialized on failure.  Generally in the kernel we always
> > check for allocation failures.  Even when they can't happen in real life.
> > I was hoping they were going to make a rule that allocations under 4k
> > wouldn't have to be checked but it hasn't happened yet.
> Should I send a fix patch now, or should I wait for the maintainer to
> revert it first, and then fix this error and send?
> 
> Thanks for your report!
> 

You should send a follow on patch which just fixes the one issue.  If the
maintainer wants to squash them together that's very easy to do in git.

regards,
dan carpenter

