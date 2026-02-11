Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DB369975
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809397; cv=pass; b=nlxMUp/WgpVbazXqYF00AKcckNUKVrx5PuJLtXaadYG3mTbN+z42xMWJhCSX7sqNBniy949CK5wRKjmGXt0FDuGTN6NVuDIiuuYKzq8MUw4xxWbWUcUG0FYVa3T7Ub7ruJLL+8qMumC+tzuRPSIFqdHybuL1SrPRqqb+/FSMRSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809397; c=relaxed/simple;
	bh=sLnOa71h29WYuZ9LNj9fnvGyP/4g4rt7bz1/6hf6FC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnCyCmr83+lQie4Fg/RDGiiY77sxPbd5QywjiNU4oKEkK8FkkVv4yFmuMjWrVyKHHbRCzEsQJUe9J7KFEwSrs+c+ms93qQu2li+3m7KsqpicgVYgYbqXaDvhvjZjxZFMUMRjdcw86urJx9lqYaJGRdH/ETlE2UfQwXhM7qzJ+n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/x5kKtw; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/x5kKtw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a9057b2ec3so8884505ad.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770809396; cv=none;
        d=google.com; s=arc-20240605;
        b=c55rHMHkF9pI+8/sGwZhcOICcWMInHz+QgHyDPsQGiZayzCWlyfF+4a1ioroPLzJtf
         19vSJ56LoItwoTGfUp5l5fUnySim/TDZFvPzkFxnVSxaBOXKEfQMdF0iXnzDxPi4NRdz
         EfxXT1Cr6hdwrW9v9DXmNCEvNxy4nWGbrooM7n55e4Wi1z5sKxmsEphMalzML3kyhnzv
         SEYQ4Exrd2FnGt8AoyuQePUiyK/fShdOnvOj+kkLA7Q0273nfF459XPn8HPn7TbgpNdD
         9uuJ+s/GWab2HeowVVECH3CQsSrJo0vInJhI9RAgoQXbeROIlzdRjrkrt683ef9ZYq2c
         hVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMkh7cnzDv96CNvbeCbaRTyM6wLKZu/qXnz0rFwQJdY=;
        fh=cl4AqUfPgvNYbSSExdfddsQEsZdyI01+KCSWtK9cDq4=;
        b=T+RyiXdCK4WGGu4khZq08/1/t6fP9jTeMTNtxbc+yBHwPoMgbw49AU6GNZQKb+DPFc
         31WEb03VitOT05PlQP4b79VghXLEimz7ufPW8UIBU8YmRoAgVVG9u5Km3KbIw1LbKo1Y
         Z1Fr7GypVEYktT8v2yNHYzC4NaSFhbvXbibDuhwiEvne4EJQiGuZUROS2bFbZOEjhXyK
         swoCmNjXqk1gwYOnkyZbu0N6x2eFd/cfORF4MbppG+WW3mITXLCWjdUbzGHqRgGMSwtJ
         u8af9fEHCnj0pW2EOfME1hhZAQMWtCwtoIUzqe+w9KjWzURlj2SlR/1OT1mb04gJ7CJT
         jpdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770809396; x=1771414196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMkh7cnzDv96CNvbeCbaRTyM6wLKZu/qXnz0rFwQJdY=;
        b=K/x5kKtwqkbRsAOPp0C2IMLHa86pRws/mouUgEnLGFhShfaYL0V3et4nrOFf39sCsQ
         lY30nML6mrjYliISKC/TYSumKvdIrtcwLn0YUkOV6BZHacUPeIjQQOAp+0Z/XomnAxbK
         FfjyyUyPFOmxU/PZcgX0lTO37uwRAzx5IADd5VU8EM+jrI7eNRyGxsfTzTSGTwakppII
         xKChENQBIti0bL59ZI6BxkcQeTEuGoImp90eoHUf4AQr1QK7RihWT7L0TCE0Hgd7yajQ
         Sr6CzGtQd+kxCmBaWym8eqBu1Ox/wp7wOvlJv6GWKIMW0bqB0uBV4cYza8MnK/ZJWQQN
         lOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809396; x=1771414196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMkh7cnzDv96CNvbeCbaRTyM6wLKZu/qXnz0rFwQJdY=;
        b=CKHaVRbDn3lJDKsWgTCqgMRtrldwbWeIsMjGtZ6bLLBu6lzyBNNGgX/K7jLM/6cFis
         tF01+9tld7Lf+R7uDxySBqoTUECragcaOJvAq4atSP2fWbiujQX51czLTeYqNZi7WimD
         E7NfmmlovayTVwnLhu8mOrftCKb3qyB4+LTsA4Bg5WqOlL1IGmaXwz/9hqUIfX/ALTn7
         RRdfEZ2OTkfQoIwk33DTs25U3BGmmIyujJp/PRoeXXpOZy6Nl5Ox/ig+RvVx15qQQiRb
         A51mc+sAY+z+7GvabcMndDqjH0yGMkBGUHQMRRqH28zszTlUWtdFlzs5Cxt+OcfUFDnR
         ooxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxE3tVpFD6mOHvmMtVK3IU7w7EEEhBGwgAQSAmyhaUisenQk4Kgs87kNBwcWGlXDbekeWRa6NJnHm7kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzINFOHqhvIGV+jl1F7pH2S0lhEEH+aFCv8iMBC3gLky+ijz3Ni
	zJRW3c1xbRNpKNG65YoF4ZKUyomSOGA6mAX7zGD0ILj+eJQzSoWelP8U4bSao6WpwgDNuB5hLvK
	lJIvVUDfKlvDkhhO47JNvSRLqndV86Cs=
X-Gm-Gg: AZuq6aK3eAiXm2RXRYqe9kCJnOI0XFMQjV0FwZ3HW0Wvr2pxfTRcNsRHu8GN1VBW8H2
	AL5nhtKwWzTHPKICpevHDtmEBh5E9UVAmhfW6AoL3oPbEGROftpS4PsILfz/2KjvqBSS49DBzJx
	uhlakV2rQt2n2xmWNkFkMK48byt7m+LhRb6zZQsAy4WkevwDrjj2uxqRMkmLclk56XcJAIIadtb
	pVr/3h3XxBL/ktjFkA2596coALgLYFy+zvFdFJnbgWi0hqSDnWdKX4wf8z7JH5psJ5wZFTdMT1t
	qYk2wqsbAzhldOx93NU=
X-Received: by 2002:a17:902:d4c2:b0:2aa:e6c1:cea1 with SMTP id
 d9443c01a7336-2aae6c1d148mr108095975ad.17.1770809395707; Wed, 11 Feb 2026
 03:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-4-shengjiu.wang@nxp.com> <aYxl-84o20htTnNt@smile.fi.intel.com>
In-Reply-To: <aYxl-84o20htTnNt@smile.fi.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Feb 2026 19:29:42 +0800
X-Gm-Features: AZwV_QgnSiInqQGmLAwo2fh7tDu38fawLdb6UdwB4QGSTTwD8LZCvKhPLMw4ToA
Message-ID: <CAA+D8AM6SxpfUpZJQAT9cif+7+cXwQCOmFqOXcNyQj=jd2VpJQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: ak5558: Fix the supply names
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	ckeepax@opensource.cirrus.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 7:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 11, 2026 at 05:35:27PM +0800, Shengjiu Wang wrote:
> > According to the binding document, the supply name characters are
> > lowercase.
>
> Same question. If it's okay to convert, please elaborate that it doesn't =
have
> any side-effects for in-kernel users. Also, check if these names may come=
 from
> DTS (some old DTS might have it, in such case it's a documentation issue,=
 or
> driver needs to support both).

Thanks.

I go through all the DTS,  no DTS uses DVDD/AVDD or dvdd/avdd for ak4458 an=
d
ak5558 codecs.  so there is no side-effect.

I just am thinking it is better to fix it in document,  it is caused
by converting txt to
dtschema.

Best regards
shengjiu Wang
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
