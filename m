Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E922BFC60
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645841; cv=pass; b=WW70E3POpLHLVCF51PIde/So0JlvOmn8HwpQiAB7gBGKywRA6yeTaYXNAq8fG70iaFkmaCAe8QY6PJR9NdNo0UJ8YzZ/TimM0TajZ8hP7oDMi+7EuAvWeC9zjBydC9thm/Vv+X6nu3+4tFg2AVtq/CDtHp1G8A0IUVmAe+mopok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645841; c=relaxed/simple;
	bh=bB/l5IzBo3Uz00TsP6msX6F5bA3Pf21sY7q01hxENmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRu4aUcESPTLL4pwtJAhrl3qOeMC8Md5nNVwbanOajvR+XDITAX5mfXHQJKtqo+L0ybvGRn/L6S2bqsw8ZfWLCo8syyJaoMFjLSQ8AGuiJxzZ+G+Yl6h/1Y/Hlshbnatn0/kdW4CPYUleN12lCPlnOWctOl7GlqKiIRYrcORJbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afjTBBC9; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afjTBBC9"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so16121845ad.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 18:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645839; cv=none;
        d=google.com; s=arc-20260327;
        b=EeXv8B/KUEA4PZzegMK5rFGgu+EFU3zZ93YqdtNx0YYDWGrDvhcl1Wk+xO15QZ4ifg
         AmE0l44dJ9fhGgXiUV4fSn/xgLuIBbv03uvRThzn/85xhliGpNTkVa/rRbYsvBMxvvMz
         UXufYiSQr8CDKYNfaRep/TXLJMgCGdQgh1oeeqfid4ajkX/LPOw29HKkl1x+xtKP33Os
         wSigDucAMcu3UTB2FkN6IUvxiZ0+BVJJVDy1Hc+dG3IPd8KEaZSXoqcBRs3v6iNirk5z
         iHkBWBIuDgN4y1LOLv1b3WOumOvHwJLTMwTgKvAUmtrE4QeUl4Ao9BKc0+yRu5iWuFQt
         G4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        fh=fvdrpS+Bi41UF3YPJn0NdTTFuIMdeV+0kvT31WooEeI=;
        b=JBoT0FYqPtW+wALvUwK4xd7xCP+xcRBy2BENg+V0bYmqP7SxMEUgk1RYuouN8qQI7i
         z+/YVuPTrgMOOdhi5lK+HS8TTPdUVoIFaE1Ya5l3ERb1fC4ipz6pKXxpR+GRn9tV+QIz
         2uLJTsVT2v8SKCOaGTqEUKWb5/+wBo8M94SKAdhQlBgBScSVVpTkkXnQQpKAmG8VseEm
         X8JSEgMCExm/iv8/tI6+AQWj9oILA2GFxU0hCN0+Mo9uE6+dyFO8qZjvC79YADVB5X8l
         sr5keY0JXUsxdGwNv9IVFLZXC5Vr8TALNOo6X+f8srr8IkMBo+0I7sBGLtgu48S4KRQu
         pWmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645839; x=1791250639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=afjTBBC92FZAycK81Y3W8MduKDPalPQM/hc/DeYZ+vijQLzZLxLdhGjn4sTk1UUoTW
         iZgbW5cmZ6OIThRYSsDiDNL7M15Czu1q5Ej1mAmAf/rA34fq7xHZ/6z62OIphushVM9k
         YEDOiIMGAg7yMqWpO6pGG78e+OSgPNK8lLZMxF+MZdD4rNW5yCHZ5myulpCdYifSL0fA
         +ATByRW1CCFRGfrbLmAGL/Lc9DbvzA5rP0KHThGyWWPZqgEAD8a4TbUzeCV7f/37fhQg
         Y8jfjcfkxouxsOd33L4y+nCYJX36uN8mhZesSBy0xF+YJo+FIlZdNiJmR9FZA9y+odiY
         AD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645839; x=1791250639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=1uhgZQPjJ5Oe33P4QysFjOH5hVg6VYcco9bIguOIpxwnO/LL5GrWe4i/O4Dx1lP3SH
         7hHWQFmMTM+g5hvhcM6izjOEpnvw8qYiThKfuN0bp+GhLGKfPe04ZaSWeuVrSAXaYYAy
         mp3Ax5L01qGLo3lJZUvYbiVQID41VhkUP2qyJrVmCK0lIT+rncXZAUeNqxEXN6Axf2zn
         XkXp9Wjkii9AGyr5syoX0OKzI8MRWybeoN9jnf6k5ldoBnMoJBOuROEE+1WDupK0/qnq
         i4TGsHrsTUeKmOTiwN6VLqHhogxzuJ22HJyyNUULlIy8l2bMzDzE3guIURoyeyXsufHe
         jrmQ==
X-Forwarded-Encrypted: i=1; AKwUvBywNQGutOpdenTvBpHHciDz2/1DRX1YSee8HGzxi2XZ4hQ1d+1S7aM+mSgG69YK8FveWcHshlc+Dr2ewg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaBqADCw9bhlgRpPDcp7CbE4fJr+0AGTkux3ah3v1RxpHyf5iE
	cxnZy8y635Q/J1sLP5K9+2ZZZHa1XlVuSkvFLoWL9Zc+rnwnZYmxXbgvQWkZuZUlgewIEUGnylu
	IHJdnutHWQC7pSKkpLQ4fwdGMWicEhaI=
X-Gm-Gg: AYBFou2up051Uaw0r5AogFLqde5kosOtBCeqDq3rjAyTdIznNWXOo9/DKsSGgkTyUba
	YHfzw1x0qrD4Xg2aq/bk7fHC9hZvuQ9nvo/haijXLgqd5CHHLOCzJHwBfe7upO5gcxA9fvyKl8E
	WiEw/0XnsZZavdeZEU0BhJHBgwFI7loHgSryl5rLnCjqFpJUYTKgcT129PipXZFT5n8bpv7HUwo
	gjYSqb43+RulTMuJ6rLDxmYTGj3ITpJ9dWV6Ea5EOOD5xJCjeDAcHtfHtX7dX8L2+ZUhLIv1Ikm
	Z8UKJlapWtSsotq19dZ2s8PKvnZrLuo0iSqvCM5BFxarrCCgCTECBfA=
X-Received: by 2002:a17:903:3c4d:b0:2dd:c100:b2c6 with SMTP id
 d9443c01a7336-2df7dc506e7mr124008955ad.49.1790645839130; Mon, 28 Sep 2026
 18:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com> <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
In-Reply-To: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Sep 2026 09:37:05 +0800
X-Gm-Features: AclHuK-gi7etBZa6zDkid3kRxBB448XKArKELjgsns_Uu77zQnT7DY8d5A5ELVQ
Message-ID: <CAA+D8APNVx1P0G2pPJ3W9u0eY2pqsKeV0Ar0Aau9AeR5mYgpgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 7:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports three independent conversion pairs
> > (A, B, C). The driver previously registered a single DAI with generic
> > stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> > multiple independent conversion paths from being used simultaneously.
>
> This and patch 5 are not threaded with the rest of the series which
> really upsets b4 :( .  I'll fix it up but please look into your tooling
> here.

Thanks.  There was an error in the thread, the patch 4 and 5 was blocked.
Then I resend patch 4 and 5.

Best regards
Shengjiu Wang
