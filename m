Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D114900B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741935784; cv=none; b=EiHKDbpMCbT2Kthbvy6j5syuJmctPuSf2e1mRgymvCGCg9bqn/MDP//rPHvcQrRGbEIJ3IV7DU7ouDhkWu+NJjq0FESMMwkqb1AnaTOQCAtLXxL76nddwPrJ6J5RYO4eASNavj5ui2mBYCYs2WoTb/+6K0ew/N1t0EkUERUlXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741935784; c=relaxed/simple;
	bh=lft4pVVKwU+oiV3MnLvnEoJqDJibPqmRZe/N9biPawM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR/K1TY8OMSemN1KfPArz2HaF/2Nz+PaYVkSFTYtiPsu/qZiLAS3LF5Q6xVRy1tilz3uJiYYWifXbl01kqfSq/2GMwnvoiLnXvxUnIMksDVcs32HK2xf4x0jauaOkjQ6V0OQwdkK/CYe6iOAzcGRUibovGEKengZ74JWSRginSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0c9q19N; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0c9q19N"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5281289a91.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741935782; x=1742540582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtARLlnZBsttWxl/lL3msza/jkTlkH1yMW3yJbgoyiQ=;
        b=V0c9q19N5sy26VIKUbqVKXZrLHsqgEI1NdGNqGJE6IoV9CmXz92nUsLU/+qjw52Coo
         n7diNur5+EA1MgCnSZUoYNEhLVJfLLGLbZqRq0EJHb6k2BolDIZGgAs6tHTwEN0itBMc
         n38xySIFqmWHZ12lMtLAMYS53+P2SU17XELlvzCCNohRRWboSYEmr2V10WQJUXqQi7DL
         OpnxMazOcGMViFIPlPamZxGT5GPxzjHgDwiH4mtYaeVVYcAtj2nlzPwh0uym8ClVuNFz
         OUGnqQc+cji88mSrykXmcONeb1Yhxl8W1t4M5npAaU9zn89jyOwNVdxeJcrtlVuROHjc
         JAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741935782; x=1742540582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtARLlnZBsttWxl/lL3msza/jkTlkH1yMW3yJbgoyiQ=;
        b=p7HEzKcJMYA7t8S8anjdHCd2NCXri+iWVAtMbzRApj0ppmesH802B2y86jZ3DvkB1k
         p6KPmD73LrXQ3SSEbX6gtGwvQzernWVayZLw1Le1U4dDYgl5yR4DUE+1pD+7lZ0dHiCa
         4A//x3oZZfNg8sfBGvePhhGkcmh/rjAjXI1chyVuIYYyD1/l8GYObWwAaG4AQAdQaZLV
         2dm5lEexRQVORWCwo9HV3Z0AfIbd02i5gSVaiNVXcvMQA2jcBfOC13ckVBkzsGthXVgI
         VMS44KSVhCQE3NlAM0cE4i5cA1xhsf1/pMRtL3kt5VrVVMSzZfwYprS8ReheS/GW2q8A
         p83A==
X-Forwarded-Encrypted: i=1; AJvYcCVCCmoxd7bgdViWbUirqStGpNkHBnnq0to/YWHq+agvHCch2F7BMaES5Lm0HQR3PSIRGYYWFZy+YzX5zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX5K0HGlIETcI+Cx+thi5jvca+gHVDP+SM4qy+kglVL3k2Fdtv
	svAUGfrQJ9Ljb7ZbyTx8cPsMytkn8mvmoGIlWvk4Rq/wAuHFk/3x
X-Gm-Gg: ASbGnct1wZPMaN3bsVlMtBiD6gt+rpE4lqaqhO1vpg3L2Kf8xfLvt/IVi/mMJWFBmqg
	/6TWHaf3c/7usVV4ILdAxG2/NiLcnsElQvKF1dfXB2tL8oNIfatGDhBSvagHvA908w8jP6monpQ
	PXonQxtHyOG8QxkgWGdPZqCsgnk2Xc5Kw0RLeRipBmIg3hp4lLH3zY29AMi5ZBY62F1+pfcKzGU
	3slf1seMcgUCEWoT5qrPt4hkWLdVMWO2HzP7ghHMN/1rLu6wCyWsfl0EOAna/OdFIVjv76z3u2G
	RLur9NLvoO0vJpa9v1I29wgRcHoaX9V1
X-Google-Smtp-Source: AGHT+IFiwBfdREW7tiSDE2RAmKuJr4eWoY54e/KPMUIFU6U7o3swWBuicMaeOBJujVFHMS4bg5CR1g==
X-Received: by 2002:a17:90b:1804:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-301521a720fmr1805795a91.16.1741935782214;
        Fri, 14 Mar 2025 00:03:02 -0700 (PDT)
Received: from geday ([2804:7f2:800b:948f::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153bc17b7sm431184a91.47.2025.03.14.00.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:03:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 04:02:50 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/89] ASoC: Convert to modern PM macros
Message-ID: <Z9PUmk5vJvu3FRdm@geday>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>

On Thu, Mar 13, 2025 at 06:40:05PM +0100, Takashi Iwai wrote:
> This is a series of small and trivial patches to convert to the newer
> PM macros, e.g. from SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS().
> 
> The conversions are systematic, and we could reduce messy
> __maybe_unused and ifdefs with those changes.
> 
> Merely code refactoring, and shouldn't change the actual driver
> behavior.
> 
> 
> Takashi

Hi Takashi,

some of the patches for RUNTIME_PM_OPS() have typos in them stating
RUNTIE_PM_OPS() (note the missing M) in the commit message.
At a quick glance all of the commit titles are correctly
stated as is, it's just some of the commit messages that
got wrongly copypasted.

Since this will go through your own sound.git tree, presumably,
and the change is strictly cosmetic do you think you could
correct it later on when merging this? It's quite a bunch of
individual patches you have to "s/ RUNTIE_PM_OPS()/ RUNTIME_PM_OPS()"
by the way.

Any decision is up to you and since the commit titles are
right anyway it shouldn't be a major problem for e.g.
naive grepping of the git log. But it definitely looks funny.

Thanks,
Geraldo Nascimento
