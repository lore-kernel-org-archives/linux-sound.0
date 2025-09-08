Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2322EFD86
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343189; cv=none; b=m/1XC2g4XPXyHCYI47h7KP34uf29xur6HQEEDWWzj7UY/Y3gVNSZ40Vf9AMf2YWKsalecwhzvWG4Q0h+y9U4NcuVNX2ukVhhoIRLcVjxztjfheXVMtviM5XFjcubH9aOk5oz2qPrWSvAIFFMPyXPF6NQno+wLO8CCxLQZs+FjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343189; c=relaxed/simple;
	bh=w908XqzITzwjbcbAyDCDAnUAsclxmaNblnj33zPUwdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcPXWf2iXmK7Q0eav2YA8XZqZIFIibP2A1uxJS7ohMj1VKTK/0gqkXduZ3jwPT9iYKPB4/VAWiig5+XJyU4++F5kyc7cvnpsClyDj9dzIQ2E1AcgfNWYeCqrWXCylWnhTKWnXw0UREGIUEZ6Gu9Hgzp/Xy90QW/pUsxo5fCFmNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vg42yqlX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vg42yqlX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f646b1db8so5204465e87.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757343185; x=1757947985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZgxsRyjTNfqBSFfm5OF0LiPwRAdn1CSfCB3geckfQc=;
        b=Vg42yqlX9QIN64GqvUqiBLRnqwEoAfSlyCjlZqqJHSLfaLLpoLy1BKDspS/gv/qpSS
         vWAG+lwBNrRFJ8NXkz02WTABjzY0795H+FgM4PI/nBmkuksOp+JZCmzNv+CEZDHfpPG6
         gE1AyQzY/6DWPar308zHxiq8CsVFYjEmhVO3AhMqn10sctNug/HAAO8sCc1bPzdnDtdQ
         b2MhZxC+cLN1pSaEK2qRnI4thScQl0pr6++/LbGP9JIMmf0W1hQdpyJxcA0DU5uYr9Zj
         sshSO9vjK/u5pNWPGGhdXc0PIwE2p56DJvzvD3yLnp83QMA3dqD1s8LKkOVhxRIGZmhG
         /cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757343185; x=1757947985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZgxsRyjTNfqBSFfm5OF0LiPwRAdn1CSfCB3geckfQc=;
        b=sQsIDcCRL/NFdQ30TjjE7kUJbiE+PjSX4tpMBhvWDykl1YBR4Z5F8RkCsIMgY7eXGa
         WUTTBEvTMmiXmY98m02rrh1TlorPG4UniljPWGrsSq8tsRGZ/tOC1p1vXCDLBXciy1YG
         xsK5l7pZbzLaAXlMMMCbioB51MoQ3DkOuS1kWS1RSnBO4KZnQrM5xHMeCFIm/EsDFmzH
         4Qh/XnNfIgaGZ+Vm1THV8PksgcGQodvrINd8yET2zMlSKznlWDuAns5JmPDr7vORrEVb
         k9CQ/NE5K10JAaUGKO8FuIcfnUC9PxnfrA4o5RSPDiM+Y9NvnN/N7V766qC7xuyTS8oE
         QZvg==
X-Forwarded-Encrypted: i=1; AJvYcCUS9A/qdkuGbN8XWVszWW69bvaNbJQ9jtshha2/x7ItZUVcRjfGLyoRxWu93wosTqTUeKTBGsGkjI60yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeVd6/9s0EOPjI+a4GeisNihyc6HI9p0bbG6NQW0aV/uTLWZR
	OIHSnYg4ssMs3LEyeMwCyKY1lr+Fq72KeqyWWZy8YtnFRa1jFDvTNQ2VV+mDNtBa+waoYK6Hqz3
	jdbnex1rKXOHNBlBUGa7aIL4j27IaNWqUaVw90kT2oQ==
X-Gm-Gg: ASbGnct8fvHbZ8Djr1LeRXBr5rG1k2+099ouvTn+0lF+R2oNvzBmiykmt+uINQIfV5u
	3hwAHDQG9b6Un+U39OQ1I84wua6eJwlINZlj1LVOL5//DeJCKI2GgoM/rZ32UVz17yzMc9ZfBMy
	gfh3TnB6IHlD+e/oD5IXNxLqL2OSOxfdXxiV3Rm+Oc/5UxvNG7jUitqNFBv80uoQ6ZnsSquSyY6
	/yQdvwv8G2JMlflfD6wk6Ml9X59McIpLe1D7tKOmLOMFIb7DQw=
X-Google-Smtp-Source: AGHT+IExEfPbhw040Ax9lWYW/00RYCi5NPaxixND3pSwMj6GHZiYvxD5N07cD0pPsVKbbPShd9omKE3rVgQGsIM5504=
X-Received: by 2002:a05:6512:128a:b0:561:9635:5b1a with SMTP id
 2adb3069b0e04-5626275d86emr2242787e87.36.1757343185301; Mon, 08 Sep 2025
 07:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905091016.109428-1-marco.crivellari@suse.com>
 <20250905091016.109428-3-marco.crivellari@suse.com> <54446af3-9ca5-4932-a3fd-e44185751dda@sirena.org.uk>
 <CAAofZF4XEFXWQEqeKJ3aTjPRuu5RgOEYRLX4Aeq=RGh7gnLGTQ@mail.gmail.com> <863db036-c077-4b2e-a65e-af80ea3c2d24@sirena.org.uk>
In-Reply-To: <863db036-c077-4b2e-a65e-af80ea3c2d24@sirena.org.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 8 Sep 2025 16:52:53 +0200
X-Gm-Features: Ac12FXz-x46Jv77tsnZjCak9n0-W3djTFw1DDQgyBPHKQcYYQKtSTpBFVrLvLDQ
Message-ID: <CAAofZF7kqQmPAHedq4F-7T5fYH45WbOF=fWwSRbMcc7ZcSNxbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: replace use of system_wq with system_percpu_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 6:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Sep 05, 2025 at 06:00:04PM +0200, Marco Crivellari wrote:
>
> > Hello Mark,
>
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.

Hello Mark,

Noted, sorry for that.

> If we're going to convert everything I'd rather we do a sensible
> conversion now than have multiple rounds of conversions.  I strongly
> suspect that most if not all of the current users don't know or care
> that system_wq is percpu.

Sure, we can do so. I will send the v2 hopefully with 1 patch only
(meaning that every system_wq can be converted to system_dfl_wq).

Thank you!

--

Marco Crivellari

L3 Support Engineer, Technology & Product

marco.crivellari@suse.com
