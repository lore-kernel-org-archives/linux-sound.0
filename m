Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506472BEC27
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781666583; cv=none; b=SXUJ/t02YI83vX5rFs3MuD3Md/3jJx5giiiVMNUchwYL/goEHwGM7bq7lmKbn3PXRASQkC1mplDH+CEcZi7GfsD1CYY5h2IGlVvqg3jArcpYFe4vBCvLBsNJaAkIq7Ce7Nmnuwpzx9yIAwNIm5AVv2e/UsMdXK+zpSwNjMoe6A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781666583; c=relaxed/simple;
	bh=k8CDpBtZ3hdcyYYtej5MKq6R+l7YxC1wI7na5KDpyrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nnlemzsji4AIHyb33n84Z0UZRis9NH5itRcQJZfHPmXC757+r5Qwm2ae9UsuJG56jzBC52Q/nC0IJe5Du2jWPyjhT7UljWS2DSqANMzQHwBuvo9Ad6GB/rt1KM5kPS+jB+0lKU+8UpZjSXjVlC2VxWr+Z1rgII+EfKJAtgUxRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=UJkaZBY9; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="UJkaZBY9"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF13F3F7BD
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781666579;
	bh=Gi1EOAy6QrYFnLzzvdiYUH+VKK3npUfDVhh2dy8BptI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=UJkaZBY9YRMFuB+V9xWBhoukhyXWpdvzEODFcCWEu1oFp599cY7pRtcp4g2o0Shgn
	 qFbYuE8qVQieDh1PFphOJ2dpw74hMeZyEeM3gtz2y+6sfCR8YDITHSgcd688IMG2rs
	 1thJo5/KoVQ6jks5P/qE8Gw2RNeoXzr3qu/sYg2YAp8Mdczh7Jg6JNUY6i6J7ibCB6
	 PachREv8iaYyqloHLZDu8ruvCPEwnoDU8bfk2h8zcnAtuIlJe9lDS4v5LYJkgMU5WM
	 HGu5vqLY16B+vDUFsmBIdP20h4j42ckbneXW0BbbzNfLW/LKDf6Pvqen7jBWY5zYfi
	 yoa3bbb7qIv1nod2KxyFSm6KgkVajvFUxa47PH+V2JR3MMrAWXb196jJUnGRKn+zqI
	 YyMwcYJiVW3ueGcWDRv3SMhqLNzY66leVIorgP8P/5T+05zN3/FgZPGzTQZKDQJMVt
	 Jmoff8d1UBiCmEUkF+gWqDHu3O9d4yQbvntbUUS/Yr1PmcmZZFNKzeKtFLmWWkwBUc
	 hqh8+NMRcz9FPI566ekqTUo9vcmnwOD1mvWWAU/Ja5aT8LrFPIpTu2Sb7q6VPOcGyv
	 /kOBQud/M2FHlLpi9dyNGiBpztlduAyULUYXOmMmb4huozM57IS/DN0qC8r6mbmId8
	 n72hvCdNWl8Yr5kv/HUTxXr8=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so475530a91.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781666578; x=1782271378;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gi1EOAy6QrYFnLzzvdiYUH+VKK3npUfDVhh2dy8BptI=;
        b=Ltp5O0Ff06eRk841fl0GjsBYuOsDhp7+R/iMigHWnH+QdiGkU5wbPsEoATM2Mr686h
         VL+gHEPXQ0PEKDxSBtwYDfOBssUvE4BVNVG00xvRyhSFJ8Xy393dcXoda80n1jdX+2kZ
         ZlILKDSw8/CozGswiwpucso1nA2Y1zDW1T8Gioli6TQUsQgmBpJ7X8Nr8ZkdR3Cz66as
         UvBcR0StSQR0Fl9ym7B5YoKdtLDn8F+pR7wVQ4UictcQD94byS2oIr4yut7ols5C0Ctm
         lz7apUyfA/CZQtDxePP8oHOER6fDFoVIgR9AevkNRdMJohV3i368upbu+w1OkJVWtsVa
         KwdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LsGP6TpRl/APAcQTdUtvWf/+fW6nOY6T53+R0zn8EopbTLiysDQ9TxfYnk7g6bPPPjJ8Mot6Ot0xV0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lgpibcWHIEEXlbg/qIj+J8HSRRHiZb1Lv/u5+ra2bD8rhJYb
	SRSi7OPe3CKxshtNsxrSJazwlz5jB4ePalIJxxOLOcPiP2RR+Erg+kh1K1cQHYEx7anN7nNwLTh
	OGVhvv2Dh4g4Ae6Hm7XrFP1f8tcVn8icbuxcaGSLRKZViNyIuCsF9qmUq6H6oto+SLPWVMPBoME
	lwxFSE
X-Gm-Gg: AfdE7clI05/PT32j9IaibZyDbTq/yA+3hrkHUBI2q8i2KQLHniNRwCpxietCNDnib+0
	jnmDgX2LF66F9AXgGWa3MTBXPvYrk7pSx0872QSewTfik2O4BJpRXsdhsr0aAWzNJIDnLYgujhG
	6sWGS6Lq59GaTnz5yuwcg22kWHoQfNX4xwASErEhvSdTheYczA1QsLPzApeKZvXXAW73XIctnHI
	RmPVFLWYIUuzGbYiTaYrxCpiphenl/OjfXOIFr3Zvy9kmX/upKnD8GJ/dnpxhFtvQFD72X8RcOM
	Ih7AP35CfnEgBjp5n+JgWaVKsm+MQcNnH4d0rHsnArMdYeGR3Mdo80kgYCT2LiP9cWQnLoZ20UC
	CWxPADY6UOPOFbfTrUGjNgNGP6P8t7rGgOokC3bI4Ko9S1Xx1UvGUIypa0kYo4r5X1vU=
X-Received: by 2002:a17:90b:17c8:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-37c930e1ab0mr2169268a91.5.1781666578381;
        Tue, 16 Jun 2026 20:22:58 -0700 (PDT)
X-Received: by 2002:a17:90b:17c8:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-37c930e1ab0mr2169245a91.5.1781666577977;
        Tue, 16 Jun 2026 20:22:57 -0700 (PDT)
Received: from acelan-Precision-5480 (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521e76d1sm4351920a91.8.2026.06.16.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:22:57 -0700 (PDT)
Date: Wed, 17 Jun 2026 11:22:50 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Shuming Fan <shumingf@realtek.com>, 
	Niranjan H Y <niranjan.hy@ti.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Mac Chiang <mac.chiang@intel.corp-partner.google.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Miaoqian Lin <linmq006@gmail.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	broonie@kernel.org
Subject: Re: [PATCH] ASoC: sdw_utils: fix missing component_name for cs42l43
 part_id 0x2A3B
Message-ID: <ajISWtufxlriqFP7@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Shuming Fan <shumingf@realtek.com>, Niranjan H Y <niranjan.hy@ti.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Mac Chiang <mac.chiang@intel.corp-partner.google.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Miaoqian Lin <linmq006@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org
References: <20260610041753.1151088-1-acelan.kao@canonical.com>
 <178127688584.48375.17454457885369484858.b4-ty@b4>
 <ai+++2m8HWB7F6eM@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai+++2m8HWB7F6eM@opensource.cirrus.com>

On Mon, Jun 15, 2026 at 09:59:39AM +0100, Charles Keepax wrote:
> On Fri, Jun 12, 2026 at 04:08:05PM +0100, Mark Brown wrote:
> > On Wed, 10 Jun 2026 12:17:53 +0800, Chia-Lin Kao (AceLan) wrote:
> > > ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
> >
> > Applied to
> >
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
> >
> > Thanks!
> >
> > [1/1] ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
> >       https://git.kernel.org/broonie/sound/c/c429fbea6174
>
> Hi Chia-Lin Kao,
>
> Did you get a bounce email for this patch from the Cirrus folks
> and if so can I get a copy of that?
I did get some bounce emails, but none of them are from cirrus.
Maybe the email has been dropped silently.

And if this is the issue, I doubt you will receive this email.
>
> It seems we are all on it but none of us received the email. I am
> assuming something went wrong in our email stack but if there was
> a bounce would be excellent to have something to point our IT
> people at.
>
> Thanks,
> Charles
