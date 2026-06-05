Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBF4779A3
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644401; cv=pass; b=KNSre9l5mkvrDv/+6BOKTmcNP2Y3ggk9adc01mCIyt/kxqbIH/HGgZH/L1tP5MxCEhiI/Ld7rZrr7BNENGyqe4ICQeNs633Dcl34fkbBeOUBrFZJxG+DDjqNGEXa1GiEhnnUpCsErJLnUkHJWb0tuGc4kGRXG+q+toGkkvn4VW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644401; c=relaxed/simple;
	bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfCLkjQL6wGdOI0F4paLlYq4Bsh6fpiCBgLvKI4kEBvMvHkpxcGB0I4xmMPZYJog+oNryrdJGkgsuTSLN4EHRVWDDgT0lknMVo1d/Ft9RxShViTRbU1BRa5aRLrN3zo1FYyIXg3s36cGITH3unGXw9jM3iZ9rpqFA63o9FEluLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjYn9/pE; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjYn9/pE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so1386734a91.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 00:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780644400; cv=none;
        d=google.com; s=arc-20240605;
        b=FeBe1cGRw1q/HRIy0cWNc/Uo5ivs8ojROoNhAWZgZIsEqHeRaTDo44qZy7Q+9VDXmA
         XGvQWc46wEDdLWwT6viJPFDbVu96Mrfn+K+1BJ9XuIeNFHyMTLJSaHDeOn0qG68YAIOs
         t3yS6Hg1J7M46VFKwNVe8TS0hUwtQoH7orC+RZdpmv21Ynnr/MHjTK949zG9RnHBJAay
         iVqZeYJgQSbLtrKLB+aR0cnS5shcjHI7NOjnGMKhk576+vzU5ZG60B8jqnooEt0c+jT2
         EBiTMPHLN7/+XbYtwVWevoJnlUv4qhb0z/8bCh4PnbFEOc/zrqZNZQvUOuOM0TOwCv1v
         lo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        fh=IfCKDGAkQcsjeE1myPkxJUGOiPaUsQrshziExXIca7M=;
        b=AhC40R21OBr6bo4/EJ+bK/7J2ztAaoVrt/WQ2jORWASB33KYDIgkcKk4OD7e0b6Xiy
         ZY4+zMCVBteM5xj/azzbq2lzHchD4YmM0OnFgKZJgqD9byV4PgAQlJFi47JJB9Qwdat8
         5KY3DItY6OUfpRFc1esDN6bCVYo1yVN+ZZYUyLAIBc3uBMJ6lQFJBIQJAHngqBFY+QJQ
         mEhZcBGob3/5lRZ7AGIoOWD/p2sv9S2qz6sfVGLCI65NC8AZFZLr9kRNOWayPowgn16k
         VDz+mCX0kULgcpWayGkf8zRRHuGOfB1cn4PO8tb6fa7OTX48f2ZBx/k968tzLWToPQmZ
         wFSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780644400; x=1781249200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=rjYn9/pEh05QzES7RoGmkHiPvNIIbN/2odtkES3+Mt9zgAGbsVTs95R3CZzfIin2VV
         LnAsXEiZEVoZySp61BwJbJSvzgKcw/M2jOVbL/2vKiEgpeFGvCKTZ2PKpD4r5XTT9eyr
         3Ed9jgWuXEl0G0QiX5jGY0WOteuIQkIYWJMSAU5kcFkv/YdfF9mgLe00KLpi8zbOycMN
         1tfrZvt8GANLE7jb8TQEm1ZAehmtiK6Ha21mtlYxIkKMM7mFwhIRXQVyt8dDcWPwSM+E
         Xt91Qy/KFWlGR1w4LkuYh/fGvJWZn2SgpCjrvHt9QW0oJXJtz62Xu2l4+7yBT5OmElmk
         wLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644400; x=1781249200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbMS8PUepN0TcCzeq15Lu1btiHSdkxlxUG/cRfRhV3M=;
        b=X9aIHzoU6Ae/eEZsbrjN8i3HJvnGAmUMLXTYuwFPGoYInPCp+CN0jTVkZLF5QkkD4H
         p7HjmmwUHxHuVgyQd1ylSoOVe4gwRD6BDV754oX7YyM/3Aqe4aXU4UJWso65pz//WJDg
         6QuNzS7y8tfkS4UgApbHSo31N5V1vpzS4cjpjZAhp0opkruqaKVKKMUQ38Btvk9ewB3V
         cvRY6aBEVJyYwRQwqySv2fWULJGg/3GW7OyoXMkWIvU/kf1Y6cDEZSEyWOH2XXOPkJL6
         hbut89A4kO0C1V7JmvMA2MULy3NC10C6HwDzp52KGgiT5YSp0gZzvBtEeNpr5lRlxOk7
         +fZA==
X-Forwarded-Encrypted: i=1; AFNElJ+2romzuH6szbf7XwA5vI5ItAI2Op2Kk5BNkkbODM3Snl5eDPDWtBppzz3pW2+xsj3+7ihbJCevAAqkQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXLlkNQpT8P/qzMc+T/yulf9EfQl9ddizKcW5Anx5jO9zGbF+
	MSu+nUmpGWUSNXvpHH9aXy2MbkY1/p0i3KOgktQq/paVP5AWwrGcIUDQcYypVkkh80hpv2c0N9g
	cprDTerVMiHTa+yHg6r2ApxO+vmmqTbg=
X-Gm-Gg: Acq92OHXe3vP4bz1m3HuLZ3L1XA7yjlhAHYBeEgs+LGRbRlMuiKVdYQK7uqUI+IXECM
	BW8Y9tNp85p/UTpEKPUKTH4RTZSq54qOVlBah8P3gflu96DXUXpNzWAjbHlaoRWKyXGjVJa4cPb
	DE7mMb4p4ba/iNwUz/1A2LZbPJtcEASgHZmyYLtPag8SpIrdTnvHNAhCQ8OD3l6TVu0+ACdUejw
	v+c2LKDUKZKd4c+vrkO7y+5mi8uyO+kD8gQjtrgmsofKlW1OEEQ5HU+7T/8HdDAsotOAv6uyr5T
	DFMdY7dUHhw8eYnksHgLQoaon+rk/lwTep3iPoodTWbxncOT
X-Received: by 2002:a17:90b:2d10:b0:369:d7c6:450a with SMTP id
 98e67ed59e1d1-370ec1eae81mr2749184a91.0.1780644399899; Fri, 05 Jun 2026
 00:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-5-phucduc.bui@gmail.com> <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 5 Jun 2026 14:26:28 +0700
X-Gm-Features: AVHnY4KOKDgSpb0rAAvqs2woy5Hzsul7irxFMBOzIzPmWvsBo4cJyTwoWJkizeI
Message-ID: <CAABR9nH3pZZhvRv5kQOB-kBPgpZ1EGvvrMS8YYoSLtyA=3Z55A@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san

>
> fsi_stream_is_working() can handle that ?
>

Thanks for the suggestion - I'll use fsi_stream_is_working() instead.

One thing: it's currently defined after fsi_count_fifo_err(), so calling it
from there won't compile. I plan to move fsi_stream_is_working() up, above
fsi_count_fifo_err(), into the "basic function" block - next to the other
fsi_is_*() predicates, which is also a natural home for it.

Does that sound OK to you?

Best Regards,
Phuc
