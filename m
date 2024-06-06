Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1421993A0
	for <linux-sound@vger.kernel.org>; Thu,  6 Jun 2024 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683006; cv=none; b=foTfBhNEkfx9sCzkIHeb3WeWWsO5HUwCmgZtMqxMZrnhVcxA1IF1Urn+pyzFeYgQVmOUXUSA9bi0prD9e9XkP1jUswkRJtggxFb1wPuYNQzgc87i/Osy65DYNfrwDr3JyWYtWsb0F6b22UsXURwSaHaB26AHcAr8KT1bvLWpLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683006; c=relaxed/simple;
	bh=4ntcc6Z15d61GnycnYiER4KMrpMXZ5XNrPEAClMFN/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMAHum8U+TZg7HVa8VwQW7DPKPDKQIB5tJ+aES4inAY3G8raWWxvV+7/f89fHFvcNA/CLbI9NxAfdexZJXoT/YWDOnV+97/xRxtfHcsGFT6QOi4FNoPJfHmVutzzkbMKFXOypBaOcEjx7SteDQ7eYaHdN7dZxoIwrb4EP1srw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgjJgD+8; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgjJgD+8"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3738690172eso4137685ab.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Jun 2024 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717683004; x=1718287804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw0tvxNBxWIBAkwEOzBxwd1l7mKn5X+O1aLdJXqiTPg=;
        b=WgjJgD+8TkUUxxzHnTGPmF5p9JUdRF5YPchJe4UDeEgpNACH7xb9E9ZeyRMAex4XyJ
         K1DLgvzVyPq9Hxl9z2tWwQV4/ZBGcNYvT/OQ8Q9SZn00kNPbKzOSGn5eqp2IvUmzQZK9
         bdFN16Yw1JPF2Peu9Ju/DHcwz6w1gtgqvTcmM+YpICnFu7BaLRXJgNbCWd7RTJ5Wz0Ix
         3zrBFCPUhk2BlRP78ksWs+V+k4r/ASEjdhJcF78nIV+Zmof62cFBn2UZPDC1MRgXem1d
         gl4K+F59Oa3vYZqddfv9BQ/mtuNVAq4su6tAoXWzyGKkF5TWtQ3TstiGeCuqQSH4HFCD
         rh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683004; x=1718287804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dw0tvxNBxWIBAkwEOzBxwd1l7mKn5X+O1aLdJXqiTPg=;
        b=LaTQ0sh7TGrJf1CR0quasFbMU0haB3jzcKbB2fkPJCI3jmHtI/OFxy0yqZRJ+jx66i
         SfpYgyrbBG/+9Zi/KT14zK1SxQzwjTFLmLxf4VvyOD2nGI/mL1nnrqF55XChxQfTafg8
         SUEv3SPaJLvhUOPzaFdiRS1iTOdIBRCO/+vL9uGGgqR8zEPH/LukXNY5JNtX4kivrVWG
         msIxWMNBZhQS3wV+I4kD6Q9HzbHQx0s6SBnfeUgaVFTVLC8nacKTA8fHcNGacoeH62Ih
         55ikIVAdL9clcjl0oC5U0+bWq7Uz5IPrIo2u1s8JJCl9nXYjT5JMgl4XQ1NtHPIq63LV
         /lhg==
X-Forwarded-Encrypted: i=1; AJvYcCVMyOpqWDaDprjS3svuNaz3NrOc8FZLLypR3RK/PY+VJWYPFK7FUPryOh0Ooy53cEYAqvVWXhbDYzeAnCQfaiUQ9JDcg0+0MQ5BxGo=
X-Gm-Message-State: AOJu0YxU50jt2nDGc08x9A/GDhXW5+vbZy1rBm+YPSWh4PhUCkAakGj2
	1rd8mWlhfzhtMW3eIKV9vPwTf+ek3tnp/JNlPwfVy4waV3zwqC9MaKAJOLigA9LsBTFc5ltq6ny
	4TsazOv8YtrkVEYN773QHpwpJqEc=
X-Google-Smtp-Source: AGHT+IEQxUm0fYRkQu3ElaNI5Eiy3W68YFaS+YgBieBS3P+3J36MmrCzmenuf6dcRwgSs3U2QTYFBOh7GtIhDveMmA0=
X-Received: by 2002:a05:6e02:1a88:b0:374:b07f:6dbf with SMTP id
 e9e14a558f8ab-374b1ee3e57mr63545995ab.1.1717683003826; Thu, 06 Jun 2024
 07:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
 <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk> <CAA+D8APemxqMXdDsS5JVbWXfZPRPF8=eobw33WEhchF418TLPw@mail.gmail.com>
 <a9b8ba84-3f10-42e2-83e4-2c8549bb43d3@sirena.org.uk>
In-Reply-To: <a9b8ba84-3f10-42e2-83e4-2c8549bb43d3@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jun 2024 22:09:52 +0800
Message-ID: <CAA+D8AMckXsESj=+vZqRqr_FkkEMsN3NDKqt9AgnNgXSin5RZQ@mail.gmail.com>
Subject: Re: About snd_soc_dai_set_fmt()
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 7:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Jun 06, 2024 at 06:55:29PM +0800, Shengjiu Wang wrote:
> > On Wed, Jun 5, 2024 at 7:40=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > Do you have an example of such a use case?  If you can do that it fee=
ls
> > > more like one end has two single direction DAIs (ISTR some of the
> > > Freescale platforms were built like that?) and it might be better to =
do
> > > that and make it easier to combine two DAIs.  That would also work fo=
r
> > > things like combining dedicated DACs and ADCs.
>
> > one of case is:
> >
> > +-------+                +-----------------+
> > | SAI1  |   --TX-->  |                     |
> > |           |   <--RX-- |                     |
> > +-------+                |                     |
> >                              | AUDIOMIX  |
> > +-------+                |                     |
> > | SAI2  |   --TX-->  |                    |
> > +-------+                +----------------+
>
> > AUDIOMIX mixes the output of SAI1 and SAI2,  AUDIOMIX's output
> > is sent to SAI1.
>
> So that's a DPCM case but hitting the DPCM scaling limits.  One of these
> days someone will actually have a use case that generates enough pull to
> get digital routing done...
>
> > Use multi-DAI may be an option,  but for fsl_sai driver, in some cases =
it
> > is used as single DAI.  So how to support single DAI and multi-DAI in o=
ne
> > driver?  Should we define a new dts property to distinguish these two c=
ases
> > in order to register different component + dai driver?
>
> Some drivers have bodged it by adding 3 DAIs, one bidirectional and the
> other two unidirectional and relying on users to DTRT.  Nothing is super
> great there.

With multi-DAI,  there will be three devices,  hw:0,0 for SAI1 TX,  hw:0,1
for SAI2 TX,  hw:0,2 for SAI1 RX. Which means the SAI1 TX and SAI1 RX
are in different devices.  Can we let SAI1 TX and SAI RX in the same hw
device?

best regards
Shengjiu Wang
