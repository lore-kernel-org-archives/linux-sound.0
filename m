Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E22C028B
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482845; cv=none; b=P9xQD1Q5pZANbcFedogxOiBvzujsimKLUHDuzae8YkvBxe9olndZR0uKWg20FKQGIXou6HRqOV4crjh/S4MMWZZmUSSSveDkdUcjjrGeZyOYLDTWSlSLdhSyMpjphM11LokJzekTXR3Af3FYfh6nVzQwj7Q2AMHTe5+w40KNhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482845; c=relaxed/simple;
	bh=8Kus0tZd4CK0EY8/6nzfiOVEg1GqsUfNItVlV8LcEUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r21FhR3eQHLMGIyP0eMG9kNqGWJ5LHeM/EycNBUw6SaF53iKtGIAxtmxeBWpSVFkmASs+wmJ4KGiJwhdmvGnMdtlslFN5tuNh7ItXguhlsVigKKw+1BUotdK9Gp+wSCqvWHomkYojRGmZt2FuIp1lk+kzBHZOz0Ez36u7pPQw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6oSFl/X; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6oSFl/X"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso1073433241.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766482843; x=1767087643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=M6oSFl/XSiIb3Cd7ifd6pI7EBk5s3gfufDSDOD9JcLsIAbrg3SMnXIzQNp6DF5i0Qw
         2s5Wee3z52KK/pjEGbcoxkqtekjk+Gufu0uqhUJkFLg8PhgNsPAXz1kEKf2hfzdCFyEr
         TU2vLvwgCfKaVYaSjK5qILiXmstcvTfe+4WtNtiZFOMqlUB/tSnXbgstgaAPWqF1JMrm
         TK8RmKTw0BMH5zCbEkKdoXAafJJkEJ+GSWsij9UQyrEiCekpMAyFU0ytNNGdYCotnsaH
         C0J4dNJ6shH7gPlXuzRZlzuBu0dFyyIo+QZB/kxXxnLCYq+pIlNmmfuD3JsbPoMmY3H1
         0Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482843; x=1767087643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=DShx5QrRcU+rRnrYpsA8+dNgNeWAhr7rx9fdlZfFKZBP/7KmN9soGQh8PbzuNRciE5
         Uw1wV1Ypt9VHwSQntjWCE27+6HWrdBmxVhPecRAKAKq5G5uffKb7kLZYfgvJt8883hJ/
         CY85fjfBCaMZPI+CfsgMTiYEtBusUcUeoE4iDpHcfRQhky4PefpdPMYsHRBO9QlaRcME
         5Rmjpk+DV4VuaNwxr3pLXQeORFpwvEwUzEg/jr7HMc+ODoTJIob3bLcAmD6gKkzwVgJR
         cW9ALdI92xnP13v641VrKmnXnksILV8dT/7zVkgkFCf4usQOuDhOLGRRx2uOhfJ3DVOR
         FA7A==
X-Forwarded-Encrypted: i=1; AJvYcCW4GTr77zyzgmRKtlZc1Gf1VWgiL0FRJaTBPtwtp1dTfAJA6IPH31os1DIPNXMvGel2UKDm04/DDQLoBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdp3y6cvgPr8Zk48tto2vwTwfoZ5Ai5m5ZdNejPx5cMMoP3Umk
	hu7o45krBt0EvDeiIFfaJOYLNHLsaFKcBXt8A91UcNXResWEBsmITSWbYX6Ra182uY/nfzFt/to
	UKMp45YphKDvgD1j3uNRK1Xd0DCejxe/07XnVlDuqUu2ixu4=
X-Gm-Gg: AY/fxX6fb9ZDGjKxzmNMQbQfGYyWUeirF1o2nMvirMVD4R9xSkBgOFV63AQnc8+7D01
	Mt7Z3jPyGtM7/Y+mUQ2nV1pgYdLTh1ZMovEqg14v/c6uFY7y8//ZVK58aCTQVHGyRPB1YdXVwFe
	Gb0TZYbVHQi0UJOwav4/k3hr+W7Q9ly4UofXrLcQQwL1Pg6/0xPVYEzEKfHQmMnEqvs3dIqM3ED
	NgIsH4QfdmMIf/LniHVj5/i9w95GZNmwaQ0z5zUcsYsazZcXkqWCODPqoBskksW4nEB9t+rCv0z
	XIaBstVztnsq2QPlWweGwBDy9nGJ
X-Google-Smtp-Source: AGHT+IHezjaq3BOJA0/IKlT+rUY4LDRLZgpfCi9YXlzB67YTN0ZhqyYz9++mFn6fkbdpRKvBfOwrvMA4yblTtcXrdoQ=
X-Received: by 2002:a05:6102:2c14:b0:5dd:b288:61af with SMTP id
 ada2fe7eead31-5eb1a420692mr3942878137.0.1766482842127; Tue, 23 Dec 2025
 01:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn> <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
In-Reply-To: <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 23 Dec 2025 17:40:31 +0800
X-Gm-Features: AQt7F2pNnJvaR2fFMXaWCzuRSUjzCZVvvwJpoWcbcif2idpoK6d8gJIQk4KoPBE
Message-ID: <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override
 64-bit MSI restriction
To: Arnd Bergmann <arnd@arndb.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 1:01=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Sat, Dec 20, 2025, at 18:05, Han Gao wrote:
> > Sophgo SG2042 MSI driver does not support 32-bit MSI.
> > Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> > +module_param(msi64, bool, 0444);
> > +MODULE_PARM_DESC(msi64, "Force use msi 64bit.");
>
> This does not seem like an appropriate use for a module
> parameter. There are very few things we want to use those
> for in new code, and working around hardware bugs is
> clearly not one.
>
> > @@ -1903,7 +1906,7 @@ static int azx_first_init(struct azx *chip)
> >               chip->gts_present =3D true;
> >  #endif
> >
> > -     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
> > +     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !msi64=
) {
> >               dev_dbg(card->dev, "Disabling 64bit MSI\n");
> >               pci->no_64bit_msi =3D true;
> >       }
>
> The behavior is also wrong: if the system can use neither 32-bit
> MSI nor 64-bit MSI, this would accidentally try to use the
> 64-bit variant and then cause runtime issues.
>
> I would expect the only possible fallback to be using legacy IntX
> interrupts, or returning a probe failure if that doesn't work

Unfortunately, the SG2042 chip does not have an available legacy INTx.

db79afa1e57925ba96ab18514c0ebe42a28e393e
91ed6fd2c383bb8f02d66e98b4a4d2f7207249dc

According to these two commits, these issues seem to be caused by powerpc.
Can we use the CONFIG_PPC64 macro to determine this?

> either.
>
>       Arnd
