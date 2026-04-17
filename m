Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDC33B6E8
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409902; cv=pass; b=GpWUWQbf8+GezhLkTY7cIiYTvnm+AVAZTYRwGp4jg3PI8dNEz9gwXOYxTF5LjHL1tZrE6/lF3QUoMi396t3XGX1B9teMpcNz5lQidbD7cSecHZzJp080pad3RpnR0a5XhG9QUSuhzNveyJXJlk6foSsUDBdo5uP7mTN+d80GZ/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409902; c=relaxed/simple;
	bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah+f5/NfPRh67YXGrrO4ZaQKA5pMd+KNUPlRasb2qb9r1JiDoscdnaDKetrsfjHp9XoCcKFE3JkM7qWP6T99OkAhItxvP4mY8le1ilA2uxO9OIlRGY5nYoy1HO8NxaRGi113yfCM0RNQ1jWh7vavFuY2gZcbp9ndc58mB2SFvug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRl73Ztf; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRl73Ztf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aaf43014d0so2130965ad.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 00:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776409901; cv=none;
        d=google.com; s=arc-20240605;
        b=WwjwssFSxsnAOjMtxM+SdgTopGZDUhSVzTORBxgBY8Aj1mLd+Pf11Yp+R05ZcczyMY
         A+LjDEF6cOHqAMc1NW+hCHX6TXkc7ZxD9l/zJvHFIjCxcLo8QGiSjacYDuysf+FooT6b
         KWgU8uwc95ZJMDbHnyYOfPTIHNJAwgZHDP3n8Cq1FWGkRk9lvarFDQgs7n3xOPijAjmY
         Cj+CQn+Vz7CgfPSS/KR8+QOwh0H2RJUVAzG2hi4tcEF1mW9921IF7FATrD8DbioMKaYF
         uQhJCgRowV6rrYYWO4OL36cdiQlJ9kAYt0QTDblDPyErM0WNPSqt2v0fom4Zr2XZn4i5
         cGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        fh=mHxyVVACeRm9LU7UrItXF/aFFgpJiHpZUo+108BGMcA=;
        b=A7y8ExG4YxSh5CFRMA3+yx1aFSAFWAu+bCfsNKSrKaqpUVjnnhtovfCZEsgGL1XAye
         rJVuo0C7KL+vpF7EZ7g2+/vG8BzfG+WYtY0qMBU8jIz9cOWbINxWzmH9N9L9qRrf/xCn
         cgLegPYlYSZEAODVgn2H7nucmrhcztWBMco2llaO5RptpLmgYqs/Nf6UlL7LCSJHA1Dm
         2n9PvLJ77j9eGqXROE8d5iyL033LwmVU0rm05EifR1I2EfDwCPZrES01Z0MihCP9OHgK
         VOc2sZ65LsGm/z0OhWf+p2dm1m4RJJ1iM4yv9oaxHtbCwZZYBAbd+uyH+G0o6zdwXV4v
         tgdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409901; x=1777014701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=lRl73Ztf6vQ+dPDOijkfogT4WK+g9JIxcMkPxmJoY/YNnPqKSm263lgh0BspbfHV4y
         CEG0X5E+FTiKT0FK2r3oCYyJFS2EH8MQIA8cbJ1/+jMsnHLitDUfqrbQtjlYzQp8ZhaJ
         24Jaa2iqS/+FkS/bwyMFT/1+eQHcktkSq3J/yHZPLZy1ps5KQzAq/jD1bYHyWBDACC7l
         I8FJnTP2r8NcjJK3GHA2jsmgdZqNNRL+zSe3EfKjpfrJl9mxDNva+W2Ny1pCuQkmZnEG
         4dWut37vCCRklixj+rUfNe2sUN7UC2KZOgWXe3/D8AGPacVuwgVOaJeBN+tHFN0tmTY7
         D93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409901; x=1777014701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=pyfvWsp0mnfSqq6iSnfAjZWS1OA8KMPWGnrMYvckI/XVau/8ywNtGFI7Z08Qlwkt2W
         79zJrXzIIaL4c46IyDYJVliR7CtqATWlORp3BlJGrljOd1CJkUZRh+b7jkCPvWXdizLF
         H/lIr2iOLffVA9Wj5WI0203eOU+wwzvmrIFaKBW1lg+E64BW0dk8qlmhuZ4olHjN88Kg
         cS8x8KfJCtaX3DcxloYPcVy8wtNJKkDeokP87EGpF1QemWsVffDQgiJ7uhtDY0ZEcwdx
         +zuwPtU0rRXLeidr97VOQld3+f8zOSUV/TPwZYMQ2aCTQWDOsNH7HhA/8fZhP9eQQ/kg
         DRrg==
X-Forwarded-Encrypted: i=1; AFNElJ/S+4sUBt4+20Un3d+zm5bLPAXeYbVeiFw6YVQ/4Zu2rol2NdnGX/LcZ5k2QiDOaA2MtCvcfgYPDfJsyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXe0JzahVNh72topDmxsqATgid3BQjPIDfqrLVlBhZpM+9d/p
	NPLsO3kpUTCQkZ55usxqdvSY2JKsk78OsnoSC2KppBkbteZvEHi1brCNi/Y2YFwlJ5unrUC+uvQ
	SjjbXTHpRXcNd1K2naRy27gEWSRBLL50=
X-Gm-Gg: AeBDiesKi1S6+2g1PPiO8hvuiFFr/Yzi328UfYqZs491evuqD2ZDOqLAzxx+6ZBbRVH
	dEvWkJNkqaGzsJR7AeVFqJOEuIYfQEW+ogtlMDPSYSejlw+dAb7w8IFrVRq81Z1OGX1nS3Q30pM
	5u6JfkmRMSt4dBLnGy5F8uigK5i2f9GdCJsosvBc8bojun7ZVEANvFvpF7P571/fBgr/HMzsXjA
	6uq8XutVOdCeWAl/uqlnStoYvOmOygmemaU2jF5/bZONBwcy40hVfZTw6WZJmX6uHeHcdqE1GaC
	YO7SOGreoWK0Fh3eZQuIT8aQMP13mPCUpy0NXAqS14Sb5XDE
X-Received: by 2002:a17:903:1988:b0:2b4:5cea:f618 with SMTP id
 d9443c01a7336-2b5f9e7823fmr16651795ad.3.1776409900985; Fri, 17 Apr 2026
 00:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
 <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 14:11:29 +0700
X-Gm-Features: AQROBzDizsepmDX0MeErlaHCs1gi7_m9r-_da5ZnWboWUDc9-Dlr4ZBcUowHw4U
Message-ID: <CAABR9nGdBVaidxSoPHjXSFZxuiN2-194DKqB-d=__awc1qGGrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> > I d> Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_d=
ai_trigger(),
> > I think this runs in an atomic context, but please correct me if I'm wr=
ong.
> > If so, is it safe to call clk_prepare_enable() under guard(spinlock_irq=
save)?
> > Since clk_prepare() can sleep, I=E2=80=99m wondering if this could pote=
ntially
> > cause a "scheduling while atomic" issue.
> >
> > Would it make more sense to move clk_prepare() to init time (in new
> > fsi_clk_init() ),
> > and only use clk_enable() / clk_disable() in the trigger path?
>
> I don't remember detail of SH-Mobile clock driver, but yes.

Thank you. I will update it in the next version.

Best Regards,
Phuc
