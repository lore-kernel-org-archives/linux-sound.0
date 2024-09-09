Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD0176237;
	Mon,  9 Sep 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868311; cv=none; b=O/9KqLyKjmxFPoM240spTMiUE121U6MJJyYhSLZ6cFizlYcH368NV/tub3lz3ZFSoMTaMXGRfJvHbM7dKHqOHE2Bxpfzd9XYxsl01XlJj55QCv+gWb1Pi/VYELlBNWd7KwIpRXpLzxwZ3n0Ctwtu6ezvKV7snEB3VEEpX2yA36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868311; c=relaxed/simple;
	bh=NaK4IGkK3yYM9oPYSZNZv1mQk+31AqxJcc0vqsBTh4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEuoM11AEPwCxQ6qihZPjZB7hV5WTk+ncpKCV7o2tF8qOJJ2/R1/z9+rYV5zIPQUE+YJhhlg1t5gNYFljF/vF3bI+Qjhe8ZCtsbZS89+pBms65qIbDlGQvWsowok32ro8ukg0TbjYj3npKYHMWsy81rxf3TlVMxORsfH0ohtF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y32/EI+f; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y32/EI+f"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86e9db75b9so514144366b.1;
        Mon, 09 Sep 2024 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868308; x=1726473108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnlMePaQtVgsvXk9LZxuNr2z31hgnUzp7zp9Z82EdG4=;
        b=Y32/EI+fmUFHuB2dUKLcjsrEd4BvF62kW5zQVc+jTNxUYbI7wXliDxDc1VrZ8nCHY0
         vPEt1+b768PuUh0ZmUdMsSgMtWcegRe8A3okw9PrGj483j25BrDjvLu5QTwt/OKPgl6V
         LXcsNKkaNJrRMmFk8xsnkSdfMX8bcv4C0hFFJVDdyfa646m0Vu6ZIBGmtJ29QE/nHcrL
         XNmoxb9/r2NnaA2KgXpR5z9DjydAmgAj1dWaW2MwG4xys8A/h6KHVmVCxPRmCNJp/4ak
         u4fmD2TxdQzJiv7X4WJ46Vh7kQHqKsi0yg1WU1C7R03X2SPsO5C2lF93z9yb+St2SuTp
         qbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868308; x=1726473108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnlMePaQtVgsvXk9LZxuNr2z31hgnUzp7zp9Z82EdG4=;
        b=rN/2GejFzzP9iuZP3lTF3QcVdqxmbnvWXCqeNFkKhoze89fQCAcblo0V0WL1Dc6kAI
         xHUr7bGwsJChujpOe92HFlNy0v5xpo5NmPXRS+LjzxaNgMkYg49fJuQpMrk+MDzg0/Fo
         lwUmwW26bCYtV17a2cMey01cVAJqUFEJ+JY6QVf2iehQnQOVn91vUt6ONrJHQsXbRKDg
         KKyF1TZfQQZlsYccQ6nIA+F+ehWJY7RfwYtFswXXbZm/2xsGdNHm/OqeJu+GE6/KW3OI
         acATY8C0nM3DZCuVE72wuB4isBbTSkkgod1do/2BeJUfxBQm2BkZLNXCpABnOWFEJaKn
         iyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrIh2NFeciSzVVw0Tu+d0R+XBNBbr2U1Ya64m8TqGQzrmnTIoKy4+LQ3PLImECBFRJaEtOeyGOD1q8@vger.kernel.org, AJvYcCXn9ZV2BuOkwpdEGDWoKmNXjo1Yw+6DQ56bWX8O0tsBi1i6V8ID1MH7wBZOvAV/rjCpJmBW1Rii3kg5xgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YznV7b3CFP6fZVNdFReHiTyID/s5+8np8USqO+5/+iuBcvXxSEH
	przJSJUO1P3WY1st0j7p262NX4prVkWcSSTDHri03yHVjggwKIR/d6VFs0dBrrwf/Lk762+0lGq
	hRmy7HRiKXa6ATJb+G1DTa/Ewe1o=
X-Google-Smtp-Source: AGHT+IEhowGhRw3O8ArkWuoOyknvA+dN/sW3KyN/Fh6QVm9IsWldUL1q16FBTUiLgmmhisNSM7Df20xn6rpR9GQt0hI=
X-Received: by 2002:a17:907:3e04:b0:a7a:97ca:3056 with SMTP id
 a640c23a62f3a-a8a885f5cd9mr986531866b.16.1725868307394; Mon, 09 Sep 2024
 00:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <f9111564acc6c9ac011318a7eb3c6843ea0529ce.1725518229.git.zhoubinbin@loongson.cn>
 <x2vcgpjlamobnlsj7ty5aekj35kjzpraizqd2zhvbwi7mhputx@snxtfb3hgznb>
In-Reply-To: <x2vcgpjlamobnlsj7ty5aekj35kjzpraizqd2zhvbwi7mhputx@snxtfb3hgznb>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Sep 2024 13:51:32 +0600
Message-ID: <CAMpQs4JsbodfscgQPYVz0K99mYAQzZp3pvhmHuvddsw3YWvQEA@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] ASoC: loongson: Fix codec detection failure on
 FDT systems
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your detailed review.

On Fri, Sep 6, 2024 at 4:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 05, 2024 at 03:02:55PM +0800, Binbin Zhou wrote:
> > When the Codec is compiled into a module, we can't use
> > snd_soc_of_get_dlc() to get the codec dai_name, use
> > snd_soc_get_dai_name() instead.
> >
> > Also, for the cpu dailink, its dai_name is already defined as
> > "loongson-i2s", so just get the corresponding of_node attribute here.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_card.c | 89 +++++++++++++++++++++---------
> >  1 file changed, 63 insertions(+), 26 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/lo=
ongson_card.c
> > index a25287efdd5c..d45a3e77cb90 100644
> > --- a/sound/soc/loongson/loongson_card.c
> > +++ b/sound/soc/loongson/loongson_card.c
> > @@ -119,44 +119,81 @@ static int loongson_card_parse_acpi(struct loongs=
on_card_data *data)
> >       return 0;
> >  }
> >
> > -static int loongson_card_parse_of(struct loongson_card_data *data)
> > +static int loongson_parse_cpu(struct device *dev, struct device_node *=
*dai_node)
> >  {
> > -     struct snd_soc_card *card =3D &data->snd_card;
> > -     struct device_node *cpu, *codec;
> > -     struct device *dev =3D card->dev;
> > -     int ret, i;
> > +     struct device_node *cpu;
> > +     int ret =3D 0;
> >
> >       cpu =3D of_get_child_by_name(dev->of_node, "cpu");
> > -     if (!cpu) {
> > -             dev_err(dev, "platform property missing or invalid\n");
> > +     if (!cpu)
> >               return -EINVAL;
> > -     }
> > +
> > +     *dai_node =3D of_parse_phandle(cpu, "sound-dai", 0);
> > +     if (!*dai_node)
> > +             ret =3D -EINVAL;
> > +
> > +     of_node_put(cpu);
>
> This goes just after of_parse_phandle, which simplifies your code.

OK.. the ret param is unnecessary also.
>
> > +     return ret;
> > +}
> > +
> > +static int loongson_parse_codec(struct device *dev, struct device_node=
 **dai_node,
> > +                             const char **dai_name)
> > +{
> > +     struct of_phandle_args args;
> > +     struct device_node *codec;
> > +     int ret =3D 0;
> >
> >       codec =3D of_get_child_by_name(dev->of_node, "codec");
> > -     if (!codec) {
> > -             dev_err(dev, "audio-codec property missing or invalid\n")=
;
> > +     if (!codec)
>
> Hm? So you exit here and then caller does of_node_put on stack value.
> This is buggy.

Sorry, I can not get your point, I think there is nothing that should be pu=
t.
>
> > +             return -EINVAL;
> > +
> > +     ret =3D of_parse_phandle_with_args(codec, "sound-dai", "#sound-da=
i-cells", 0, &args);
> > +     if (ret)
> > +             goto free_codec;
> > +
> > +     ret =3D snd_soc_get_dai_name(&args, dai_name);
> > +     if (ret)
>
> Your error paths should clean here. Each function is responsible to
> clean up after itself in case of errors, not rely on caller.

Yes, I should of_node_put(args.np); here
>
> > +             goto free_codec;
> > +
> > +     *dai_node =3D of_parse_phandle(codec, "sound-dai", 0);
> > +     if (!*dai_node)
> >               ret =3D -EINVAL;
> > -             goto free_cpu;
> > +
> > +free_codec:
>
> You are not freeing any resources here (at least not directly). You are
> dropping reference. Use matching label name. free is associated with
> kalloc()..
>

OK, I will rename the label name as codec_put.

Thanks.
Binbin
>
> > +     of_node_put(codec);
> > +     return ret;
> > +}
> > +
> > +static int loongson_card_parse_of(struct loongson_card_data *data)
> > +{
> > +     struct device_node *codec_dai_node, *cpu_dai_node;
> > +     struct snd_soc_card *card =3D &data->snd_card;
> > +     struct device *dev =3D card->dev;
> > +     const char *codec_dai_name;
> > +     int ret =3D 0, i;
> > +
> > +     ret =3D loongson_parse_cpu(dev, &cpu_dai_node);
> > +     if (ret) {
> > +             dev_err(dev, "cpu property missing or invalid.\n");
> > +             goto out;
> > +     }
> > +
> > +     ret =3D loongson_parse_codec(dev, &codec_dai_node, &codec_dai_nam=
e);
> > +     if (ret) {
> > +             dev_err(dev, "audio-codec property missing or invalid.\n"=
);
> > +             goto out;
> >       }
> >
> >       for (i =3D 0; i < card->num_links; i++) {
> > -             ret =3D snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[=
i].cpus, 0);
> > -             if (ret) {
> > -                     dev_err(dev, "getting cpu dlc error (%d)\n", ret)=
;
> > -                     goto free_codec;
> > -             }
> > -
> > -             ret =3D snd_soc_of_get_dlc(codec, NULL, loongson_dai_link=
s[i].codecs, 0);
> > -             if (ret) {
> > -                     dev_err(dev, "getting codec dlc error (%d)\n", re=
t);
> > -                     goto free_codec;
> > -             }
> > +             loongson_dai_links[i].platforms->of_node =3D cpu_dai_node=
;
> > +             loongson_dai_links[i].cpus->of_node =3D cpu_dai_node;
> > +             loongson_dai_links[i].codecs->of_node =3D codec_dai_node;
> > +             loongson_dai_links[i].codecs->dai_name =3D codec_dai_name=
;
> >       }
> >
> > -free_codec:
> > -     of_node_put(codec);
> > -free_cpu:
> > -     of_node_put(cpu);
> > +out:
> > +     of_node_put(codec_dai_node);
>
> Yeah, so here we see drop of reference from stack-based pointer...
>
> Best regards,
> Krzysztof
>
