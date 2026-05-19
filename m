Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2537D11C
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 21:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779227865; cv=pass; b=QG03cNiIbIrwP/Lz7e+PR7yLK7ouCbwsJ8dSU5jBtGInqQW5pFw7gfgvfUDPhEM/USCLBDhGJqwCPp3CMoi8f9Tn1cA7of8yWotQRkMYZG2Hkdouh10z/0tWR7DdFNCgKkMJLy/ABijg8HI98y8RhfZ/Ef1Dwr7Sly/sC7krD10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779227865; c=relaxed/simple;
	bh=tRz1qL4SZ6cy6guLga+BNdMztE/ip91W3NciC630dNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zi29080YuqsGFRCBvEpSRDtGkavwVcP8H0Izs0MyDm8sFJLVF5D7p64z+iaz0Ff9VkMGSM0yoApblOBqmc0GRtWPmREd6Ck1SvVNBP+vo4RJqF2Hc/QeXL7PHur5/AQexJ/sry1I7YYQQ+WUJzhL26iLDBnVbh3j3Y2UCv9ihsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbkis6Lz; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbkis6Lz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bce386d5b85so683658966b.1
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 14:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779227862; cv=none;
        d=google.com; s=arc-20240605;
        b=E4X7H+4/Xvdxg7YO3qR5z0om0i00tcfLf9p/VOYEI0Co3iBd6ase6oRcT67E1Y/wGI
         9q+KqbTRhTDWvNJik28JZGta2uBvLSoutxiD5TmeTCCI9Sex1SW31c4wlbKPC6fjkbkw
         QYz5BiL3y73fyKua8gi+kfQS3O4mEgqIOq5QqzKPYSPCUpWFowiDmIq5wai3XJSjjozy
         4EMjp+Oes85zBXX6MHtkaEXEF8JWU3SAPnbLOWbjrt2SrVNY5+pKWmbvicwI1mRoyDi5
         2a1M+us4kRzwUwH4Ra/Gu9YVNWltay2q1MRP86T288amnT9UageUhe1itODDI5YZiI5z
         su4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        fh=Yy3PXki5xwJsp90CWTzWjM0rFhuNBs+lEyIMv9yq5pI=;
        b=lLo0Av/1wg7TGltHXebrMsz7+IuFcINfU17AbViDE1PjuaEG2TZslo1UxevApnzvr2
         d9I0t2O9nlVU3irpE68sBTs59cEj4tjLNrBCFnTag6T2hjEBw/Kr2h1A7NWohYpSii+z
         vSU6iP+KXjGltUYlzxjtU45GUIVhc3McIS98iKYbxjAonJsFVcAzi3oGYs1d8IwGN4kQ
         A+pXPumoeoGNqJpszqbPFuX2cgS2L4fdJaFIyEtCsN8XbrcZXSwmu4YtP0ru4RovR/it
         /SdFcWHFZyldxeZ37tGPaXhE0yd4a/PMv1IiDL5SAtwgWfH/Twz/sZOIzFf8JGaMRNPE
         P1sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779227862; x=1779832662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=lbkis6Lz9UEll9Nnr9CM7uZ35HIZop1G4q5MzFWTVdn3MqnTHpRhkhRXBrpYGx3bty
         BpMw6vzs5ebGvh1w5Nolc4p03x2gj6MWuA4PzBYwaG3j4YdvT6YPZquZ6rdjQNzbgvwE
         R4a9N/qV1K02qCGmRjpXD/QAo3duK6cRZVlKkHdlLPClhG2PSibL9N5FZUqaQumrCy8y
         m+ODN9s0ndLUYhH2HDJw9H1HSAXR92ROhz7HhImG3JWfWIg81bxnYqul3NJj4gl8MFUv
         9iXsMkx2kxewfUHZMPV9nCpQKzy2zP0wamwD6wnOr/tGt4CAUrrs25UjeJGZxIyg2H4O
         7ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779227862; x=1779832662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=Lhv3h4QtgS5kwn/tR8NV1PzmEDUW4MyxaRhcnozkAsqnsO5ZonG1DEnEXTExnHSrFj
         /R+tzblZA71tA3cm16bABR6Lvsv9bGBzE8KOQ+KQ+lmaDhaOsxYGQZwOIVYVlQXlAVAS
         ZnsoY4ajYKDirmLQz7tZQ9GkHNHXBBsDGYPPsJI1hStn6f/3N2oFL4gDzLf3xTO2OiQJ
         afBMx8i8UCrTAwy5+7WxuV/Cfmi0VmQpEWFpFD30fUQOw3xW1dObBbTTmbdclpFIZ08G
         TXlMZPAsEtIB7v8b3uVcy4wg1eTlfPO8XYV9xasJBuma784gQq68S4i/mZYDSi2naEjp
         fN8g==
X-Gm-Message-State: AOJu0YyAOgtB+L0jpPAHDVTq9JXG8zAucXd43xfPF4snN4qfEymqwoQj
	Qb8i0l11ehLvN9oMOWjcpOefRmwuS6rZmNyUFp0Prroc6yyz7wd1+dJo9iaQxDVBC5BWnSd7fEY
	/eNxaiUhhTHgfav97EicFUDXCAdvQNsI=
X-Gm-Gg: Acq92OG/7E8uY3w9LEnBYmkOm5qJsHprNS9k/zjuD9OLC8Uxev03jNgP0m1QauAdCdR
	ei++SyafRjwvbHRmNqCb2fTWlfE4Oh05ImGsHhmrbtNqW6/nyrBzlpcKASKidhXuDdeQ7pFwlaU
	K6kjZWE32ByR6fkkNQfHYeUFl130h2care/XB2LvMljDFAAv4k3TofGrycrWx9Hk/Rbufi7mXyH
	+yQLHKQNQ+z8PZ6Jv/9UiFNutt+hhu20E/1YoXTNXHD2YIci6VAv/M74znnzfeurV5q0U/dOdGL
	sWOCs7Ytn+O2UML4/ET5l6XwAO9gRCyMeUBn0IkAMtOaXItuPshPGGH8xqY0W/U8HGR5TiacGLq
	h3LfyF9Xf8R+EkUW3OJhT2SM5d+ywIJRBIOmjwTyClGNbOg4fqPxYoEj8nw==
X-Received: by 2002:a17:907:1903:b0:bd0:bc5a:746 with SMTP id
 a640c23a62f3a-bd51797803cmr1264657266b.36.1779227862366; Tue, 19 May 2026
 14:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519010440.629290-1-rosenp@gmail.com> <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
In-Reply-To: <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 19 May 2026 14:57:30 -0700
X-Gm-Features: AVHnY4J23bC0PIprMi7AoskRuLv549OzojT4O6f6SArUx72FsVkA9zMJisbtp4I
Message-ID: <CAKxU2N9E0HE+4U28A2n5m1BODTEzkgeDKeiXYhcwuLR=fnNZJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 06:04:40PM -0700, Rosen Penev wrote:
> > For whatever reason, GCC is unable to figure out that i2s_num is a
> > single digit number, with MT2701_BASE_CLK_NUM being the maximum value i=
t
> > represents. Add a min() call to help it out and fix W=3D1 errors regard=
ing
> > snprintf bounds.
>
> > +     i2s_num =3D min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
> >       /* Get I2S related clocks */
> > -     for (i =3D 0; i < afe_priv->soc->i2s_num; i++) {
> > +     for (i =3D 0; i < i2s_num; i++) {
>
> This makes the code rather obscure and will start silently failing if we
> ever get more than 9 clocks, we should at least put a build time assert
> or a warn on in there.
how so? MT2701_BASE_CLK_NUM would increase.
