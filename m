Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9B52737F2
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089659; cv=none; b=bffXWfA6Nu2xDtrdAgomFKggk7cHpGF9y5H6a0Sll7Y3ULAq+Hj0OcfnuMYhmlrICXUy1DPiBfvVjnllA95o8UzdHNu/nJSGPr48IYROuVS9zcxa/sMXD389bGL5CkfqFFKpbXaWPq7wDBD+gE+vnMzhCeoUWKzyQEb3C7zCmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089659; c=relaxed/simple;
	bh=5kBQUodburZpUQg9PqXMZ+zCo/eZmJ3WX883tAeSUkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRA4tJMan/25PTfxRoZpB5G3hZ6tHOTd+y9VsMQ1+9DBSc+FqbyASBDD78KMBO8WmCXYi5sOffeg8+7yj2Uyj+6dHe+ZIqFqwVTadySaaKo5dQtZakhSN30uL+8UBk/tUtrMZZKlzplTjxVP0aLLUUp7nHBu/HXaFrUMxjS3iVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LH6mfVtt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LH6mfVtt"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37fccf7035aso79100081fa.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 02:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767089656; x=1767694456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVSXM5uZ/ZoALSbos4UD91k3p5Xyi3zF+/Zr9flgtj8=;
        b=LH6mfVttcHYjD67TNiyXiXyFLvhhGvQOgafT+i9XDYvcGh8zrJUhFnOFgN29NKg55M
         Ze4/s3ygFBLKma07VnQVi0HltKgWuNjH8Zt/9Q+Au+KBr0/3zkkojGMJWZGDWrHhw5FZ
         Q4fOyU05GwcRya74z2ERKaB2b7TCCTzm/Cg5oyxtn27eMc8ZvQFcOyk0lv4gRd4LmZxA
         stfLVBPkNxtMKmqvkg63p2FW1+vF83xq17lKcfbHVIv/btwv6xA4owmKTZCiioBKqyPq
         05y14lkfbkpz0CqjZg9TGA9lF0prAYLtpciqcnV2vdIrkiSCn3RfH92ixbG+gpCG5/Uc
         PSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089656; x=1767694456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVSXM5uZ/ZoALSbos4UD91k3p5Xyi3zF+/Zr9flgtj8=;
        b=HC+IDFCEKvRgoP3J/TT+uuCLCrTCSjSndKXiZbTNHBo5wy7V6OBT/t7gzydM4vxyvU
         okISEGBclZqKZ84Z5fnd4J7DPGOuoIR41qzH7Nfb9q0+pnfBhDylM/Zpg5gkOVs8Nq7W
         2sIOFxesOWU6/nNuyaiRkZzRfrg4DtaQXfPaD0uzUksDZ7j86BfBS6vK343xtEBuY1ow
         mfADvl/33IUwF4HE8H0/VYiBlJiP6/eGWLobutUvBkmO6DOnCCPm73GdQvtvNRoO5lIc
         Gk0opc+QeDA23RNAXDMwlJm2DwKO9rFBL73mWBNvTr16+DKFEiyX5JYEJe95X4PZl0kt
         KEuA==
X-Forwarded-Encrypted: i=1; AJvYcCWowl+SbN4Jm8NDv0yBdYhep6jOIoqiBFFgLKz+mE82RPHj9q0ajy6zA6+IDBk1yXzkUhqn+8YciVDEdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2M7vyw4bQrObnWFISzsIFetcYNXrdNCipMrA3/TtzetfBpWdy
	DC++UhTzNPWTIA6G8gimzXa35g/m2GsMpYeq3AUyQIZLCeE7ZLcrS3GvUgG+J4oNqZHP6rN1eHv
	XgBBdZ97EIHE6nZCXe+4uecjeEt60zLQ/KFVqjD2gKA==
X-Gm-Gg: AY/fxX6uQX6NLXUmv4oOy9fU2TbV10KIVQC1z367qjzDZlnsBg/V9e/sFg6TaDx5Feb
	iQPddl6UaIehLQ42q3n37kRmBimY6qp5UOO1ScQo65dCVmqzh9cVo50+jq0M+ZTv3SB4+XCqBpk
	Vu3iEy2v9m7WhWKkhwMwwX4QVXbEdAHGK1sHaRPAOeaycYECbP1x1KhtuNPgViyndCmsZw0PIy5
	ygE3o7+V3+mY1VsPxbH3TPWKQo4i7K3bNWJzfp7uTr7wPfM8a1MBVh/Ug/m4sj3GyEUdD7qHBM1
	ZQwIlcZhFTcUB3kPCyR4OT+tzGwA
X-Google-Smtp-Source: AGHT+IF6sMmBs/vdaLdzl/aD3mfqa3l0/pzaIblnyrTpAcYQvu5H1cfPRWkYnyyDtLd97e+KQ8CPjU+YSzNzmZydRaY=
X-Received: by 2002:a05:651c:31cc:b0:37f:e5c3:5976 with SMTP id
 38308e7fff4ca-381216a50a5mr109472351fa.45.1767089655765; Tue, 30 Dec 2025
 02:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224162635.147710-1-marco.crivellari@suse.com> <aUxNTF-wOWSDBCU4@sirena.co.uk>
In-Reply-To: <aUxNTF-wOWSDBCU4@sirena.co.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 11:14:04 +0100
X-Gm-Features: AQt7F2puoexwzYC0wivRP369ScixBW0iJh9DSa6OStqVDzM6iio7Y3XokTL5_aU
Message-ID: <CAAofZF7J_PokhFV3nJfAQ9S4ars87r6SF13GZu4=S_BygdQJbQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SDCA: Replace use of system_wq with system_percpu_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 9:30=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Dec 24, 2025 at 05:26:35PM +0100, Marco Crivellari wrote:
>
> > -     queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us))=
;
> > +     queue_delayed_work(system_percpu_wq, work, usecs_to_jiffies(timeo=
ut_us));
>
> As with all of these thus far I am unconvinced that there was any
> intention to use a percpu queue here.

Hi Mark,

I will send a new version using the unbound workqueue. :-)

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
