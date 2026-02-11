Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4BF332917
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801524; cv=none; b=lhTkeXCNjRo+vH6tb04xBG++gsowZs4iicExs9rF1dckSdXPokN2RFnSAqAzvYWDoTvXD8WyGnRVTW6Hgw6+/xCeU4/ZXi/KU3wRM3y/c6Awsl9YQnxBB5Ih+z4PCaZd/8rjY6zmcwVnKfgs4YYUQlkH/rU6OpaNVI2DAW6jFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801524; c=relaxed/simple;
	bh=nN5YMxGJ7L/VgLFlXRwvfIvW7hRBEYpEhov9lnqTDYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsWvqRH9j/zworlmXHs1M3oB8IqrssAmntSFr8XmikoOpRbhaJoF5xXSLApRpNR1o6VqFOTHY58Bzlf+jsFh6Fc2PHavOAiz65siEJmWrMe9Qpf76AKMnlPvr2vk4xri0Qkoij+P1brZ+NChcb3/qUFGQ0k7+Tp2y9MdqJO4uAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSQblUkE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSQblUkE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so25505875e9.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 01:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770801522; x=1771406322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9N6UOCF8QJ7vfzH0E7tnDHMiYhjCUGNMFyWEDyNz+Ok=;
        b=SSQblUkEB6Nf+BKsUUQo/JLL1aTVSvE4GmGRLU7Vv92fNLIOoeVmUjZw03iwFMpByY
         SmWFn31CSWfNubafFmNZWJBqVYY3xQ1UX5w0JmXDlKRBxAx955sIFSO442LDr5GY8i8W
         vZsl8qvvRT7XxdKQcI5H41dWsihU+17xRx8xWDOWCLGq3gcJD5pRjnJWG9s/C9NmHk3N
         ewBz/zHZ+vvdOG4u533Fig3YDFhnm1hEVtY8lWESrTPPnLrt2/8b0cbfnUBmp0fVRvcD
         Gm9Yz49yLsW7FrXUuQGLf7//3CFl9DmRRggt4m53MaM6f2yOg/ZBqZy6K5FueZlTnxSu
         Dmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770801522; x=1771406322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N6UOCF8QJ7vfzH0E7tnDHMiYhjCUGNMFyWEDyNz+Ok=;
        b=K2f470T9Ykg/f9l0wceefx8Ve+NxmgASTtGhk8JSrI4NaLGBokbqHFR5LC1zyq0cOG
         QKjBuT5HbSdzRiNpVgYcDehZ+dV051gOzXUTy7Is32ulvbrJcf8RB9TkKZOS8Mh/Ai1v
         XL4/SaiFsVa6NrAPqouWwBdpIWlqEG0LYPH8dd57HCfImVAsVQflUNB98Ogarp0SznDP
         PFoMaSg4EOoX+nYADZE0K5SnVfb3NS/6k5Nk68bLfSJvXpdLFXe52fkVd4LpvSxCX2e8
         WiAlTDek1iUiN4T+LMVlKGbDlVVtxYhA3UVWovibgzgHxZHJ3qG/QAzJ61xt3059ZnLa
         0UHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0uvz7uUFiPzu0+CCbbEVbMiDIT/hOEUX0KIMtKtieJYk9NKY99T0Kn93NkFuJZedfmVYFs2ksijciZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BeqxnQ7CgnFZIMF8OsefVtyO2RbC36Hdxl87D9ctcyrkXGJU
	puVBDwXhJkmyYL8APwP9H/hstiBtQIhPtIGZSg+rVpvY4eT/nI+IJ0Zk
X-Gm-Gg: AZuq6aLSXETEVlf2IW7RGvobve8yuzTp1jsAJ2m5MthTyvECHDcW1zt1hAiWykTjrjb
	pxNzwCVkySqBi2/pTaR6zISslQHtuFwJw4bBPqEZ5FMPqeQ9gIG4ZpwgKB4A7Muheg8P5n7SSxF
	UFuF0s2IvM2qLM4PAwiCQRFd02TIhxs30LP9sSAFSldvKmDbkZl/NMc8iXTObKc6JBiJwKCCj4G
	mELpYCA9QQawVxjYLj+R+anhsSCcXwthRVaVPKjDRSIxbOSVwkI5MhTdSE3brxE0A4HhLCq0AXz
	FUygFSQVDtoEAEQgxM4O4YlgChgU5QK2xJfoBqAHpc6RdAhsTL+IVBchC1IX3hxD+eg5HUeyHS9
	OWWfDMwKr91YOMl/QcayaronWjR9NNKb3urV6byNRPFBxtM7QoDSYobydejsWy6wXUlKZ8gOUxv
	xIzhyElW+dUunvuTFB7xiauqY0axgYkxPDazvJVGUNSf1zd12+PZ58MaNgabAJKiZaSV7A9AnOm
	+J55HH5tH9nRKdf12pGV4bLVVoHJHsH2bCePbFl8bS/9g==
X-Received: by 2002:a05:600c:8b56:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-483202311acmr215314265e9.22.1770801521657;
        Wed, 11 Feb 2026 01:18:41 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d989165sm33474295e9.2.2026.02.11.01.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:18:41 -0800 (PST)
Date: Wed, 11 Feb 2026 10:18:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: simple-card: add
 sysclk-cpu-first flag
Message-ID: <aYxJb1mDYIwPr7TY@Lord-Beerus.station>
References: <20260210164506.161810-1-stefano.r@variscite.com>
 <20260210164506.161810-2-stefano.r@variscite.com>
 <b4d3a008-bf9f-4a03-819d-c7a0afa1dbd1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d3a008-bf9f-4a03-819d-c7a0afa1dbd1@kernel.org>

Hi Krzysztof,
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
> 

thanks for pointing this out.

After re-reading the binding and thinking about it again, I agree with you.
The proposed property describes a Linux driver policy (sysclk programming
order) rather than a hardware capability or configuration, so it does not
really fit the DT binding model.

I'll drop the DT binding part for now and reconsider how this should be
handled on the driver side instead.

If you have suggestions on a more appropriate direction for this kind of
configuration, I'd be happy to hear your opinion.

Best regards,
Stefano
