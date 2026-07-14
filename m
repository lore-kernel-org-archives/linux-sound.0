Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172641A931
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784070402; cv=pass; b=ZtDAJ6XEUlFj5YosysSGUjYb0HMtjgDSc4SMFFeDw4Xzrt73nzEu9unyHPQtc2GwvPs+il8bcO+oweH1WaMqwY7rZe3OwN93FdnKKeE/4sSbnSwYhcpFqeJ/sd7/ZghuF3UDPX691CqxFSLNMoxBNORrQNDGzR8ecjOucpySVmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784070402; c=relaxed/simple;
	bh=rlRcfcnT+ValWu5eD3CROgJ8ttsCpBtQ3lizbY4CaNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjQ+vBgKr7YoPC9aHs+K/NQDbV0HoQw6vuxtYMD2VMkmaQirYauNevRgLhFn4RWg5+cb0MAp8TuY/sMcdeHZUnBzgQV71T7tqitLo0Blm4jV0LY4/3yM1JABmZVB6o7+zf6ue4hmRPznB4z7ZUS63t00UPiKxxoL278XTHXtdRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaTbS6sv; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaTbS6sv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso58658635ad.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784070397; cv=none;
        d=google.com; s=arc-20260327;
        b=X6Y1HIm8+m4Yf+sDcym7EG/NAiUraBoMVTv0UsPKe6LBGIQz387StAqK++2XhtfdQD
         U0eRGRnPGExZiBj+vs2RTXUoJgJ49+FRnHnMEHvt03b94C5xix5wwr8e1EhXlYBBZ72m
         78MxkwecwcGkJIJQ6Y/MufD5lVIhOi12+UlOKWOdZYma03HA9bt4b3dkF1CrJenAg1on
         Zp3WNImd9aWO/b4R7Pnt2C8wZ49FdDT/Jqlnc4GNNhE/Yci0JrqNEZwjx327M9h0bdEO
         w/bJDAogiqYBA9VZdT0WE6Z/NjcH85MVyQO2bbXsfUTC+pMCPXGuMRuuQ68kagvJPE2n
         CcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rlRcfcnT+ValWu5eD3CROgJ8ttsCpBtQ3lizbY4CaNQ=;
        fh=pBo+fTumDkTYMvReAZJM+21p47Hp9JkSxtJSjMn2b+w=;
        b=KTiaQKaVE6AayoYX/CMfmNEcAgzV8L01bBL5IIbcl2KyWqk/aCoOAy8ZUn1FUcb8Ok
         xxKgZ96UhNtuZKP5Pak/JRue042c/ZFnkEbitbqswzMY3eIC5k6K6WG/fwpyeUz0ewPF
         nmZ0Ol1PmD8JSVAwMMold0e9tPGwreGsn7cQJM1gS4I4ZCsmHGf8Z/RGhyXDLB19coqk
         ldj4q9auJo4oFjupDlly5HgfxcV8W+xaDVGyu5zMW4003QxVQS+6vm/id0WWb8si7K1F
         UEvRb8uY0uuOGWf4xvkbEBhZDksFSnGN9pLkiFjTmgZb99cxilwpYMXRXsAsIJtiaYDz
         H2qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784070397; x=1784675197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlRcfcnT+ValWu5eD3CROgJ8ttsCpBtQ3lizbY4CaNQ=;
        b=JaTbS6svqDysJdwppwr151FpltpF0cGDXvTIxETwBrOb12+qYsclC3nJ0bgzyGnmLl
         bFOXZyDXtTqZZfO1L555XXQd7z7UEV5oVEZ7xUUFft6DqI8GxIOgPkfZS9YKo96IGbu0
         yrVOG2xTgfkP+wfFWicXknpzBIYRz6j80K0TCOmicUwqYk0OVXI0CPV++UWsOHkbQxMc
         t1vxSZ7fuoMdagnH7xvNqP/hosQVIRNlcXsFJ5a6jzfvd/G4hASStFrsY23SMrGtRnBr
         U8NYojS7gVvnUO52LOL4NGAsxfkQPV3vJrAf3hQghl0eE411oJ/xKwcbH7JKjm19t/RB
         DJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784070397; x=1784675197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlRcfcnT+ValWu5eD3CROgJ8ttsCpBtQ3lizbY4CaNQ=;
        b=tG2NPZcPR9FxW9Rd6TMfCXuqo/L6rlfXmhiaGhsVTEV4A1Ig89ODlnf5CWwlzfNr4u
         FyoBEBeWEO2WP/rOOObSzfJ8eqhL9sUb5YxIqzEeWeU3PiLzwX+6i9/ZqZPl2BSpAfPG
         PKuPbYLsdn8SiPPj+wGP07TZ6b2uLJyoMwvyvwGP085cwiw68x+p3NNQ61gAnw1xkLen
         KjJrKHsmSSlNS+2A4ZTMl0Gx1N7rHa1Mj4tH/rBHWEj7CQvNnAx2mKBeVcQin1d33aYL
         UWMCJp1iwd9XvAru6f5e2y6roMaoUghL1QUF/UwUB1ps/L+aNLG3zBjgLSS3aRuGObkQ
         J+sQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLQgM9w5v1kWXxvhoGr0s7RRjRcK0If8WRC98lBocbqNnj9shFZXQ/xmzKYijnhDgoYRXptuBodGQ6xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNnhlsfP2u4xmDbCcbbQ8CBCTRa2FSVv4sJ8u4pvVscyf4KQob
	1cRGCXexRFexRQuOk4foBm3lei6KRzeA51LAdbheTz6x1CNwt5uq3SlyGFECkj+Q4+tCEJNO/fu
	qRCJnVRWfht6WE+XaZHkNdcemo2KSNXU=
X-Gm-Gg: AfdE7ck1RPknqmYkGEJpOTCRgQDVJ+K8ET66Kexhw3hjts9gASAzUARfsEzw6a1gXss
	kk3KQY7i/VUwAFc0qt6CFtzvjLBlS8JD7bthgxAhEpoAsqvsiBbxg9jatxGSzukg2cFJwwiFwEu
	ZtPtVmahYx3vyPnlAwdGr9Yg1a18wSABbvDOyiN1nluV2JLvmWVXsg4DDPrYxA+HimJghIJ2Oi2
	pnN3vuvxvD4fupR+IbttP+UVoUR8pwLXXsLowIZ9+LW/6YoW1G+OQsyxCPYWMSFObJG41ZWiocu
	5mFleL0YcDApg0HMJNe4R/9le3Sv2n/1SuEjH3UqcsGQdmBaEQVL893O8BnwwA==
X-Received: by 2002:a17:903:3508:b0:2cc:9179:335 with SMTP id
 d9443c01a7336-2cef12ea089mr45887525ad.8.1784070397005; Tue, 14 Jul 2026
 16:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
 <20260714120042.491712-2-phucduc.bui@gmail.com> <8fff715a-1386-4f2f-b21e-2f5e6a5b97c6@wanadoo.fr>
In-Reply-To: <8fff715a-1386-4f2f-b21e-2f5e6a5b97c6@wanadoo.fr>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Jul 2026 06:06:25 +0700
X-Gm-Features: AUfX_mxyHp85o-voeqtQKqthUl5PsbH5sXWRljBDmkL-JXWCSd1R7pafJbLpYRE
Message-ID: <CAABR9nGK6Y3o3RL7YPTMjeH9-R4Rdb_jjiPQjrakhkZ77YjfoA@mail.gmail.com>
Subject: Re: [PATCH 01/10] ASoC: ti: ams-delta: Use dev_err_probe() for error handling
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thank you for your review.

>
> Nitpick: could add some () (i.e. snd_soc_register_card()) to match patch
> 9/10.
>
> CJ
>

I'll fix this in the next version.

Best regards,
Phuc
