Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7F7081A
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463032; cv=none; b=Fsy9BGju0QGlTYi0u0zhWndi+NgH/4mcX3a+cLNGEO1DbwDRH838Pj/Q/I/e2JuIclCv8+3zZRE8Mn1KU5TFc5RkYcaOIhGWrTg9QLjo/zYcFkKBF3gsJSJ9iWN/jnQLB+Bdmvbisv8ehCje04JHcMzFFioF8dirDZpolIl9nlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463032; c=relaxed/simple;
	bh=JcUmuDBdK9DC1tFvRdTyF30iAp1H1FzfMDEk0X1mbEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9LH+sLXPSa/Fw7jYZJj6WXGBh4g31bgrlU2/sYRnsHqkLmpFXRswWDx/NiGm+QieSUzRgF/pgIgKkUt5+RFYe5Fkrl2vpXlEbVoFFcOeXboOHm6mU6NN7aXlz+lfu4oqM9qDNne+W+XlVFKw6IqpgPFXKQfmWRMHl+PKB9zMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1eTAQ6K; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1eTAQ6K"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f7020a928eso5006768eec.1
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778463031; x=1779067831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igIi6LIW3IB0IGgMEC4IJNTPQST5FaY0+izMvLpd7uY=;
        b=f1eTAQ6KjIDZ7Hqkn1sCK8sD3e1ly900Is4Rx1wLs+aytTEoMegRJka89XZ3we4clJ
         y9R1LEDQeZK+4kVg5ecKvrC+5U8TY0heTIyn1MvGMjxpSgYrDmOwTQ+4WfwZiYoruLpp
         HLy0rQISRcW9RA8SY1ceCepbhVenh7wKrhnpmtf97ffV4LA8FBA1uDnU2xMODdVP3gTc
         b4AGw+KPUMuwA+VAfXDptknLy9fofcexULb5lmC+2tmN8czXpD60WeAjgYfFjLnGnnC3
         0ITJAvzdUtfppv9zOuE5eie8dC5NbQSVBKMGbnnasWSLER/3VAPw87meOkIxsfNE281+
         GuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778463031; x=1779067831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igIi6LIW3IB0IGgMEC4IJNTPQST5FaY0+izMvLpd7uY=;
        b=KBpkF79e41MLJM/bhf46EVW3laq9Ax7hs07Sdt/YZEzYvGFjQv3jgkNQo/GjIlnsfP
         3WxUIixoiOKPcEHOtF2DvzQFI00nWqiCitIqPfPW4cae1Xld+EZqoxVD8/RRqgDEX03v
         7HjDKuys+A8KWilyr0KxEHyE++wZfAoaHSSjKkGZoj2geMuZOlST7RaHqy6NuvpBXGIv
         WrGp9s+SkP7DAWC4Nox4EXZIg8ao0CVj29f/bf4tl2bxmkfk7o3nYN2hAtK5yWmDKM5y
         xwjg6wRI0PvsE76g4s2ekIoE9A8ZXNIQQRp9oaT8rVHfgzab1KMwxszPOc2ulij1rRsA
         Vp3w==
X-Forwarded-Encrypted: i=1; AFNElJ/7xZkbRFSi0TjRlhWwvYoh9Pwz2zALqclKP/lpoR7/sJNt289a+R1JsAzhZ1g8XkxQ1s32SxrPsTZV1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YylYbZef69McJuwkU92o4MPX0i0aDo8dsQ2Qrf7VjBThk3+EsQy
	e8fQGRM0gUXUpG7IBX41FCzv0c+iaRoVPOocIGwO6dM1Cj4Bg59dVG0s
X-Gm-Gg: Acq92OFapGU2f96c0cxcUW+y95HXD3xfNzF2C6bdYPouO2Coh2fUYIF/jsGDNhjh8ss
	6+Vvx1FhxkhqB0fQVPIhahqMOE0k+nZrCrSdetE6yIKRmBGVsE7dflBuIoXia0SCVhY30C9QE0S
	qFSh6SY0jJDropuxi0a/em/4VKwcSk9a7VAO0quBTfbmqU8GkQadamU7iRCvpYzOA7j5rvak4yl
	Gr4bd/xudKSZDJjSBtN6zsMD9rZW0//l0SVdLBKBL43SC0BcBSgDOCH7aIcvPr7kxN0a28UEfDN
	Sb30sT8oo3nb2tbEHA+dfWmujJi45rZsytUmwO2Xp1wDab1/bK5ZCQ8aIAk2Ax70+UAZVsA8XGK
	KtrkJ/Hu0xvslBydegWV0ARcCkf6mWuNlMLP15aFFS/XTItZ9OSKUIxcSZ/4SnYP6oQUOq9Dbhi
	98J4OOZA0Ihg==
X-Received: by 2002:a05:7022:52b:b0:128:d752:e074 with SMTP id a92af1059eb24-1317d8939f7mr11205857c88.1.1778463028570;
        Sun, 10 May 2026 18:30:28 -0700 (PDT)
Received: from geday ([2804:7f2:800b:ba0c::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm14991824c88.1.2026.05.10.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 18:30:27 -0700 (PDT)
Date: Sun, 10 May 2026 22:30:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <agExLK2GR0w0Z_N2@geday>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510230853.154050a2@pumpkin>

Hi David,

On Sun, May 10, 2026 at 11:08:53PM +0100, David Laight wrote:
> On Sun, 10 May 2026 20:24:41 +0200
> "Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:
> 
> > In the changed files, strings were copied like this:
> > 
> >      strscpy(DST, SRC, strlen(SRC));
> > 
> > A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> > Actually, strscpy() must be used this way:
> > 
> >      strscpy(DST, SRC, sizeof(DST));
> >      strscpy(DST, SRC); // defaults to sizeof(DST)
> 
> Nak.
> 
> This is test code and deliberately doing things 'wrong'.
> 
> -- David

while the change to fortify.c is what you described, the other two look
like good catches to me.

Thanks,
Geraldo Nascimento
> 
> > 
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > ---
> >   drivers/edac/versalnet_edac.c | 3 +--
> >   drivers/misc/lkdtm/fortify.c  | 6 +-----
> >   sound/soc/codecs/fs210x.c     | 2 +-
> >   3 files changed, 3 insertions(+), 8 deletions(-)
