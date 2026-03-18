Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2503A4F2A
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839397; cv=pass; b=rruSwkqBYh+NWzeP/aL13tIHG78xLtjd7aj46hIqX0wj3b085a32LdVarBKlOz6znx3cO0VK4Cwvq0v3Cfwh2HmOvpVUa9Pnjw4xbc1zI9CTx/E/BcNQbRNV5lZg/5BhnDqPlSCbyElZqwyQZMChHggar+7h3RpWt8IvboI826M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839397; c=relaxed/simple;
	bh=mX2Hn+cjlm40dMz9dWd5Wuvnl08iJaqNpJW4nK9UZ5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nh1KPpf+nSlPrFGphDAzljBvf1vg4lc8dnkYNXU5O6CSiNq4SAhOAyGlx0RXlBd7PC3sinNMN5WCp1qLFhvp1WygaeNkUbuKieSv5SN1FY9U3LZHrRa7Hgj3zqDs4kYLJ02LrZY0GPU4+FYEbTEddh7mc9CwzIGeF/reKImCEZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fI02eSrZ; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI02eSrZ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so8164479e87.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 06:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773839394; cv=none;
        d=google.com; s=arc-20240605;
        b=CxzT6gHcyf+RkehUddj8N3ynfSyaSsVqaVo1VO894cOsobHUYxcjpSI8iZwVeaIrif
         LbBr8+uHNe6N+DY2TytEPec/5NVJQ3PwM7NcrhoLuD2K64G5CrQXYM1OQEo2ebitQb2p
         ibGSDsYPCc4j8bC8DrpkMvOzJ1iVgZ9uWebo4IowSykLfncbiqCSiKDxngxDS1i8Benf
         VxXTfC16OB114MD/66v2kqzpyuRzo0IG8iami0jDOirorO1MRg3m0J84Qg4hqfnztIWM
         Azc6BhRmgMfTVIR6+PZ665nD2VFIMIsSmiA+BqDdQJkcsm5zTwIf6MEO9jsiLLbmyiBD
         lkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mX2Hn+cjlm40dMz9dWd5Wuvnl08iJaqNpJW4nK9UZ5c=;
        fh=Tj/g74Jj2pSCJfHdQsxULSjgtbeeah39LNPI/FKpBYM=;
        b=kXTPe0OocnEw3FfEvEL3Gu1tGWI9ceIGUpQQUPHtMIRn4zvLvJAYp8CpxLa3Ql8e18
         Hpx6inQb0xolGJUisUErNAWFzsT9CbtNGfLWCA24MySQ4SwoCAS4bF6V6uUC+fie7/G9
         kPWx7I1Tt4V4bSPFU4tQAuKsiqMvfJ27mWNP0EkUwBkvAbprxg31b9u6gccYUDQMzLPB
         ZGyHT5kZDWch8gLABqIZOWwtyRYtODZbwJG9E9OmbzhL77USh2jVH+JyTs2yxqyEDayL
         9d0pbU5qRm9UE74MkEcjjtlYuakDV+hPj1lfgcKY3SBbLxbXB2U7A9dvRjv7apJfTogW
         bQjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773839394; x=1774444194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mX2Hn+cjlm40dMz9dWd5Wuvnl08iJaqNpJW4nK9UZ5c=;
        b=fI02eSrZkRC1LLwoic8QysLHYwQniZ4lWJdHZ2CjCjRPtuMVJjDMhGpJmvcrwPYtqj
         uk2l/ls/85p0qaFlgNg0qD7t+sbfC1HCNBhs9wV9b+pINqrbXyXsN9T8SBBZaAabQ0gq
         vQWdrE6XQWeGKHztHk8YxcCTXGT2yVzaVerbGsGTc9JLbJNQLjxGYeJtGLloy5sKlRyv
         7OB/edYkH/kO1tyk3OfXqtznIwKbpojYacRlv9DtiWSwnFRz4qyoos1asYyJH8azgVGk
         rb4UVNKk5JbLShdYxCdTKh7pyzrdRAj0FAXxf8ekQmFRANFPxMhKUOItReunSNcdboZn
         pdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839394; x=1774444194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mX2Hn+cjlm40dMz9dWd5Wuvnl08iJaqNpJW4nK9UZ5c=;
        b=ZsGL5xAkBh8K2rwurUaIIKx0kOUuZxEoODwdBaZ4oLjTXI20vGviFrHlvKBQ7qT7kA
         B+d9EhiZpNBzD4+wdtZsjSfjzgZ6YWeygwH/XWUeRcChYEbNcJBgWX1tUOL5HUT0BGdx
         14jb2WY7L3uq9DU/I2vi+ddAxCHaC/61fQdhV0X1sCK075La/fcgaMqzt7MoY7VJRKwC
         xVjnjSlAcZ+Qa8wM6yJAJibRs1kaaQL4w6qFEHC8OPJRKVZjvlpx2pru3DNeI5fDZ/UQ
         1o+i4idZBoqGriiyefxmvE2xGXjZ36ySYZl7SVinW1P02vDPzZJj0l5UWmQe/QnvuV9u
         CwHA==
X-Forwarded-Encrypted: i=1; AJvYcCXUNdwb7PhyusZIxGvifZtbAjian+nA8ZdxchQ7ZCrGxxtObeWuVw3TjyLZa21cFKC0HXfbbllIGCqEcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSGgy2bBfFyqJs7Bn7r+5f3EuttnId5bxePM8+f85gyoFelpp
	WKyPNcZ1p4h+tAs7IA1DiMdU8me8hep2n72W9MUvFLTmhnN+jSJrRxxD4R8muFP3TnxRJisnBVL
	FrXyaINP+HcfbdXjKOmzVrLx6f/++gFU=
X-Gm-Gg: ATEYQzxWAGePFJy5cvvudpQrLfzrj/oyZV7KQaHp7fo0advNCuUCQCpzwVYDjkxP8pM
	5E1sLoY8e+9ZjsXtdG3u2X4ymI59Yeez10lMKwdpIFAWW4KfkuZHwXJ/D7mp3Kuc71uYHiiDb/7
	qHgI83ClIdh9autialTj3KgiINEOHY7Dcvns98f5guqwxd0oJOSI0BUwuswMGac8j0e6pVjFQ+y
	pd4iI5gxor6WLzVdzXeukspZJhjC48ymQu5MTm6DGOtcZ1ZGJvSX62upifW2aRueDxxxhcAfeQ4
	zn+F8oJQELvgglQ3XdOP37hDfLqmsv1rpYxFAFQned6Mrw6OVlzykyX9yfuL1sWpZl13tQKYURG
	iaYaIsvOB
X-Received: by 2002:ac2:4469:0:b0:5a1:3ee1:2756 with SMTP id
 2adb3069b0e04-5a279598756mr970100e87.4.1773839393861; Wed, 18 Mar 2026
 06:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316211348.230923-1-piyushpatle228@gmail.com>
 <20260317-cassowary-of-authentic-agility-05dec5@quoll> <fc4cd40e-ad7e-4851-a483-125b1c1c1697@sirena.org.uk>
In-Reply-To: <fc4cd40e-ad7e-4851-a483-125b1c1c1697@sirena.org.uk>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Wed, 18 Mar 2026 18:39:16 +0530
X-Gm-Features: AaiRm51JPC636QkcUizg--m4enX73V5zKFNfoYdrsLB9EQZyZFUybJRy9GnWn0A
Message-ID: <CAMB+xkYRcRw9q7u5oQSJ=R7op91tQ5rgPeVpMfS_oULKjoPsew@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,ssm2305: Convert to DT schema
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, lars@metafoo.de, nuno.sa@analog.com, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 6:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Mar 17, 2026 at 08:28:12AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Mar 17, 2026 at 02:43:48AM +0530, Piyush Patle wrote:
> > > Convert the SSM2305 speaker amplifier binding from text format to
> > > YAML schema to enable dtbs_check validation.
>
> > Missing DCO. Apply your patch and check yourself.
>
> Specifically the issue here is that your signoff needs to go before the
> --- since everything in the changelog after that gets deleted.

Thank you for the feedback. I have fixed the issues and will send v3
shortly with:
- Signed-off-by and Reviewed-by placed correctly before ---
- "YAML schema" replaced with "DT schema" in commit body
