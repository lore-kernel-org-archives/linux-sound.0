Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D13C7690
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985003; cv=pass; b=DdmT98VaocGYP5Gf3ua0+fYznt3l9UHa8gRza8b5m03Of1EQnGjbagXi0Do1M63P5W7X6VrmmjHahUt1u2xzloL2zw1K2xoLLnFmPd4M0Xq59hIenM38f/fuv5F/bCAL1c3wdgeIOkMWa8sV9oDd0gUpkg06dAabM/fyz8O1cnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985003; c=relaxed/simple;
	bh=si6IHURPiJqi75S2MwDn7Iw/1Se9C+LSa6b1jl2tdPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBJCinj+zJfpqp7dM0SGqpmZo8VS99L4KYi7euasexJeCC0woCLnmCAL32FPLtEY1THjMovH6YJ0Ol83R9ZImIUxZk2O9VY0sdIa+0DRYMlMZGwb1t/tVsmcomfDrvgy3P33nL/Vn1XslKiQmR0WO1ajcb24VahvbLmDF7LMYxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2LwRQmB; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2LwRQmB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6987cd38a64so883850a12.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782985000; cv=none;
        d=google.com; s=arc-20260327;
        b=C5TC1UBnCPUXzHlPVZFbpYTVazEqCiLLvpt3auxDVhaefAslDWSYsNUsJw4e6RAG72
         nxHVMmEbYqGf8IGy1I2dzqHKw3gpPHllfo/au4Vg0hYdHJ/I+KD7cYhgx2AoQV48weZ5
         ZrO+mKb0dDIAYxc+cHlRNeWRbGNQPC6W7L7A/Hv+unYXq81RIGBZaryD3xdTab2ewTRl
         NBbMrdD/Ujz3AmfsNnVnVoxzznkmrC6Jr010mPN66a7b80Ha01Pku1EjApeuuNJQR9HY
         olScnN0jH1MTyQ8HHMT+pKDHci9KtsiPMF9YJfBgeD9OcA1rWaLV9/nP3HpNTxfpSYAg
         hAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3aftVDeJMaU4qXJlO1tggvlxJ/CyhuYiJAwpVwtDP9U=;
        fh=z2TS+J7pUjqFX6mJw3Tx8ygo3+F4oaB03HhDVebjW50=;
        b=Qjarijqg7TMxENRS6f6p2dtsAholvTLfkXzkhOWxMiwpkqlCzuj4TfxoVGp39KQW8i
         4657GP4UOAK33Ad0x/UMJOjNeOCqeRaVaMtzTHRxU2eIF8Z6z5lKk6kdSEUzKqNNQW/S
         r6xEp+rFjvThY29bG3UfGZB5ZN3zd/soCSQPYVrancDUYJrFux1ZiKrU5Zo9pMA967M1
         kFe82YvZAifapOnjHFskp1g60nubQLzww5ntPD4DrNFEYm5kBo7OQfWAT5RsmUjgzeaA
         M3NCwMjityue8z85/7VxydMVx7JF0U9geuTxT7X8z6pW+EQxRwcd7RXEb6C7W0ptPuDs
         6aDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985000; x=1783589800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3aftVDeJMaU4qXJlO1tggvlxJ/CyhuYiJAwpVwtDP9U=;
        b=K2LwRQmBD9RuHVOvx7f4pM+1mDlJCZDxBdsoszig03Tik7j+buFtp726o1KNPKqSxT
         3VbDd0JHo7p0PcvQcpxt0uU0AJ5fvhvfZdBPhUCPiQhzNgxFr6OkQfgpYs9Eato8TjUc
         rRmv5z6v7pUdtsDkW0humhKffaTGkODDtNUQxXtLyuyAuFqxM3mT24HQS5jHqQVGd6Us
         2NvVhSlSKQSpS10bRV8U+vBk4HOY//F51WxohVESpbIjRKXdpDcTpI6rpKxAmfNaviKN
         vvM8oT5M73U2AgxpFszUsQaQejgga7s1NqDvC/CpCFShay4X/ymVTBv8wZfHZOYmo61Z
         NXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985000; x=1783589800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aftVDeJMaU4qXJlO1tggvlxJ/CyhuYiJAwpVwtDP9U=;
        b=fufDaTasSG+5JUHiQKjeB+A5CkSzqj0q5f4bn/esu2YokfnliIaIt4TbOBPGhwkEJd
         Ad5e0OYSbbJWoPED9pILnFbS5hU7htA73mHnmpiT1/Ow+GK2DgISdSwkPJzsS7DEeTGd
         uBszfHZfUrYvemuun95yMStXgyApCAXSjhpJtxyw9glvfwWexHQdLh/drnZyUlqAlNSa
         XJw33aqYiE53vEyEFhSK/qmoVzcPV50CdTE9hKoY9ihaP4zkOJPczmqWlceXzrS60JUL
         A999RrmOytQmQhGaRo9eRl/yufKOEu0tAnNg2EjTKwprU48w/PCH1t5evTR8kAx86dsA
         sgug==
X-Forwarded-Encrypted: i=1; AHgh+RoS+vbhFb7lRllOFC1gp/aQKoDpKBiboxC3Vd6/TcNKZTD3zxxgb77DQl0hpLEkFfwQooeZD1UkroRYyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpQsER8vN8pqj3A+83Yl0/kvtHLX9EwXRpD2LzZEW9AAu9dx0
	hZufFQkF5GOpoCxm0I5KEcVMysg9Dkw5QBnz5DsVzWk00SdQcFjqlnrzMrn13pEOf6h1GZLTxVt
	bNK/MoW1+v+792tat6tSNEzyquOk2lg4=
X-Gm-Gg: AfdE7ckZHPtN+fffgVa+flGnzrjParKOZUla/55NexG2XRVDZnB38+2+dfdEwvvWsfx
	gBk+Skaxm1AZEQjI/nYhxL0nJP1PTVYQBM6VLOnVgskPZ/RpRgJvnSzoUlV1lQmZwPtkxXkqrnW
	GTJGUI8NWf4c6QAJZkVju59mJbD14bJyZLTyu0So7XeRC7X82MiV0Au11JVwPhuLy57lIQgO3fU
	1edbjZjcB9JP+1Gh7rm8P4wpOKcIdZeWWb5ernG99fwKFWtSiK/q2N7ySiA27oLJ7NWfK7Q2aOy
	VXNBZYLAtXo5L/SVy4tJciK7Abk=
X-Received: by 2002:a05:6402:1d4b:b0:698:3b7c:3b32 with SMTP id
 4fb4d7f45d1cf-6989f1b4f89mr2295280a12.20.1782985000285; Thu, 02 Jul 2026
 02:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702044635.29808-1-phucduc.bui@gmail.com> <aac11007-b2c4-452f-9b5d-798d20f675a8@intel.com>
In-Reply-To: <aac11007-b2c4-452f-9b5d-798d20f675a8@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 2 Jul 2026 16:36:25 +0700
X-Gm-Features: AVVi8CctTjLgafqYVS_BjPwWWBJT8Li4D1Gy9jrTZZiQ8Dx7LTo48B10PoXCSsY
Message-ID: <CAABR9nFQw-T23Tti2k93syrvEjLv=62UDPThjHO34tMCzYiJww@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control: Drop redundant stream_open() return check
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: cassiogabrielcontato@gmail.com, Kees Cook <kees@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the review!

>
> This is a good catch Phuc!  Typically such conversions are discouraged
> as things may change in time but in stream_open() case its documentation
> clearly states: the function never fails.
>

I'm just starting to dig deeper into the ALSA core.
Luckily, the very first function I looked at already turned into a patch. :)

I had already received a similar review from Takashi and sent a v2 series.
https://lore.kernel.org/all/20260702084445.519669-1-phucduc.bui@gmail.com/

Your review and Takashi-san's pointed out the same issue.
Thanks to both of you!

Best,
Bui Duc Phuc
