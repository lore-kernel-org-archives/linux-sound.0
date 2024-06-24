Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811512E1D3
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219569; cv=none; b=eoEJaotQwv4E2JKiK5ayY8rV7UCFvL61w0Yx943OKtgmftsxp3ZEc6RUZqciTx8k4l54w8x6XZqrU0lFInLaYBSQn5YQWN8BrvFaTZpkOB4AC5+ywjKnEUf9GRag/P20aiYHP6ipjRm0ZKWV4P+XeiePxxjh/Zzr0de8D7JdhoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219569; c=relaxed/simple;
	bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PARdqm/xaKT7mBzOHzBj4SI5NOMTJOd9ho0Bft7oLGNruH6uF6Zxh5iyXiguorG2RDN0W5dLtoTOgk9LXrKmOvRQiqk4Hgf7pQi5C62srFtrjSQ3QmmujAvep3GhXL9AkL7Drjkn+4iIti7njHfx4msNQADs1e3VNHMkj5xljuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=MzkgpNdA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="MzkgpNdA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ad8243dba8so19737666d6.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719219563; x=1719824363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=MzkgpNdA+GFVqSzcGBdQV5+67hLPJQv//dxUXjRiCZwxk0Pbb6cUCEqgy4VTTNiygg
         HGPX4tQv3bEkRG4s0S7lzRevYKJJqlsUjgFUQ2kXYqGa3nS5FxwDcKzyO2P5IP7QiFyh
         hAxtVFyl4A11u3NhIa++NuzEn86CRqcT9K1Fbofl6/XvmFKQPityb2U0NEOr3pqr1Nay
         bbeRukitLOAAgtaHOMtkJahG1QwhzuzBY4FtUUqiv2yfhBr03ojzwz/GB1i7gzAdxtIN
         Xng3ZSw3PsyDedFYdaWwYsn1ASWr/KLdTRIxDOytqaOxM8K8rLBdvIE3YJuQVWWhVj2P
         dp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219563; x=1719824363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=xUYTB1dLVg9Zr2zY/qaxrCP1nCbNqyv1MgZcXtwSWBMyh4lqygw+Q0Wz79ZbeLLlpV
         39LyOSsXXUBhDMja+mo9FW9SV/Xbas9fQPBKYahcuycdq0Q5SeFR1nYYfwvKxc5tvGUE
         ZWzzrXA9Ffzyfj4nJDTe8nPdijJK9bQRz7hhlLgc2CcRbaOFfTITFjjVX41ygISs8qwG
         Rug2q6qHgFsWXEn/4mZOq6v7rqDQHAPFP2O3ikE8Gymj57f53Hse4P/cgNH6ZaEDuFGY
         hfGui9NWaWOvB9gkimy0YtHPYbXI3fyQhBusLnKEEbvEtCf/EsxmdS3J9HKDq4oV8BAW
         3uIg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7jFXquSFgtdZ7fOxGlOLEtW9qxqmxIe0Dxjap+zmUv64tNh0FrbG2YqLjMVeDcx5mNt6rvX78cLHbv2dpbD0wBbrEUC/3DfSCAw=
X-Gm-Message-State: AOJu0Yx+pgoTrSmrW53ufQ3qWf+VSCtIg5wb6s0PyiwkI2QkBKZP0pCe
	vAeWdJnlwHl7hu1OggedX5wLS3s0EsmFWYypqpy4/SfRPzEqlJAr7oYnOGXllFxIfpK4XpXgPrF
	LG9Qv5IAey2v3DS0phqtcBrFwNFVn+rpbyGm1pA==
X-Google-Smtp-Source: AGHT+IHJdukmHTX31XZGqN8Ya5O7xqbZeOSn9ad1olNhKCpFsHEHdPHP6m4H5tAF93YKuWVFl5Mnqdf3Ba8kIeeVBLc=
X-Received: by 2002:a05:6214:4a45:b0:6b4:ff32:8287 with SMTP id
 6a1803df08f44-6b5409be0b9mr37950676d6.22.1719219562855; Mon, 24 Jun 2024
 01:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com> <ZnkGcwd8M1QFfmxl@matsya>
In-Reply-To: <ZnkGcwd8M1QFfmxl@matsya>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 24 Jun 2024 10:59:11 +0200
Message-ID: <CAG+cZ06R5P1g+1Pk3gbQ6Yod0mBM41dFTgvnBWg61HZFUtmx-w@mail.gmail.com>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 7:39=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
> Any reason why dmaengine parts cant be sent separately, why are they
> clubbed together, I dont see any obvious dependencies...

The I2S driver depends on the dmaengine parts

> On 20-06-24, 19:56, Piotr Wojtaszczyk wrote:
> > LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer=
,
> > this driver allows to route a signal request line thru the multiplexer =
for
> > given peripheral.
>
> What is the difference b/w this and lpc18xx driver, why not reuse that
> one?

The lpc18xx used the same dma peripheral (pl08x) but the request signal
multiplexer around pl08x is completely different - there are no common part=
s.

--=20
Piotr Wojtaszczyk
Timesys
