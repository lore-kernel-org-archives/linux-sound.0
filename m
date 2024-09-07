Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8FF4D59F;
	Sat,  7 Sep 2024 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725696505; cv=none; b=VxWXprrkk4XKVwtLwkJ9CoQ2fNN9JKqxdDoGpKocHJzBZ5S/h/DPrOVIjvNqTInx939yBoeVaGi0TMbnuZeJMtlvYAiSNmOn+sTC3sqz2It11Sji49xsp3CTrdaU+TXdjteexqxXfLA4ZEwQBG2knTPuLNFrliSJinuOHVDmSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725696505; c=relaxed/simple;
	bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al/LsbAX5DANdILWsiy4l741gzBCBE7DmIbglOWX3tP06ueSVmZwW7wibWId4vf1WvrXtm1vI9+tpK+uzvW8P/qd16Z3fnfN1OZy35+ftDe7ahZ5cT3H4peJaNmRgLZCAETBezed4BghEshwlMJ9LfmKP+V6pY4U/OaPEgqJ0Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi0MR6rh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi0MR6rh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a81bd549eso285441466b.3;
        Sat, 07 Sep 2024 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725696502; x=1726301302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
        b=Pi0MR6rhdG49EDoBfVjCYaThtnlfiDdgjHXSCOP6+UKRKBxoL5/zQXTilXXVZFLzjx
         zlqtjHwTWi7cZ5iOsl+khOAkTzIoFq1xXtSNIJu//mPdMRpxMrgGFD2veLsw3eV9ZJPq
         GpNTq9HrzDRSArb7U8H04joJetD50iZ1QYzGJbps3wudXjxQgl3vBLrcZVaqF/su84qW
         0360nmBpD3A3dY+9zeUT5JK6VZGrtZuxBfFm1PDjT7cAiMR7NTAiswWgV5asqwx/KZ6B
         hJsoDA3sMz7hdK/tvF5T9kocl192V05QN09o2V+buoZuIUwHHbgPSOFxgrtsQA5Ko/vz
         du7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725696502; x=1726301302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
        b=UKBD1dYLJviJutYQGtxIUMyzklSIoZCGueXiLBIdFd+ibKL3LwOwQZSFwcxmbuGkIo
         lRDgpk2fnH72N0BDsf/tjGcyvFVyWT8cn9Tx7B+h5jYXGqBkFDsbrcMzzIAUoCpTLgVX
         Z0DgE/nzM1ImFUMXHOG/C3G7BHujTbmceOCor/J0NYFaaGtkRsGstpqWM658Hyueqo0O
         OQmeNX8PGXzXeydKLhpATKRoHUVAwotuxa6/b+zCsGd5MdMYQ80YLPBY9juF+8lO72s7
         234Gz5XAKrG97eaOQpsLrqv7NxfzssbxQa83VFvXec082iZP1Gt9wTLj16wdZS03uF4B
         9G3w==
X-Forwarded-Encrypted: i=1; AJvYcCUsRWe13XR7bhVYqsd67/iE2sQWUgpthKgUfx2TB32k8ztRVTvPk5Jkj9mG+4Lk2rX+HRedJn6HRT6f@vger.kernel.org, AJvYcCWaQrFyGPh0/TOIuFFB6d9jzYvNF4yuT6oJI4TlGQNzDLULU/6cTLF66L4DvI/mjNBr2hyjUWMQi00NREM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMh9XgKInSdyCf8KC54JjBnpIX0MnZ+lxQMGbuB3bdcW2Rxxf
	VO7BTdyLuQUIUbN2BNcWg0bJ39RSXSra0sSgyClaP/BISWe5yxvhVV1f5ruT4T4mbmlmoKKJC7K
	i3hQnMLSD7Eao3JW6ep7zZ3K0/kc=
X-Google-Smtp-Source: AGHT+IGPTkO39hgErmS+Z3Xr8V3YRQhXuxzN+qzRN7M1pY9F102PaN1oqqJJk5oNCHR9jmilkr0WjSzr7xdwGQPGCIo=
X-Received: by 2002:a17:907:5007:b0:a8a:9195:922d with SMTP id
 a640c23a62f3a-a8a919597cfmr238991366b.0.1725696501579; Sat, 07 Sep 2024
 01:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
 <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
In-Reply-To: <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:08:08 +0600
Message-ID: <CAMpQs4KedjHVK=Y87beuc0M_DadrXWWgcC5ob+wXfdy4XtCdWw@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:07:21PM +0800, Binbin Zhou wrote:
> > The Loongson I2S controller exists not only in PCI form (LS7A bridge
> > chip), but also in platform device form (Loongson-2K1000 SoC).
> >
> > This patch adds support for platform device I2S controller.
>
> Can some of this be shared with the PCI version - is it the same IP in a
> different wrapper, or is it a new IP?

Hi Mark:

Thanks for your reply.

To be exact, they are similar, such as the definition of the
controller registers.
But for example, DMA data processing is different. In the pci version
of i2s, the DMA controller is built-in, while the DMA controller here
is external, using ls2x-apbdma (drivers/dma/ls2x-apb-dma.c)

Thanks.
Binbin
