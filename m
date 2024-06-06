Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1B02E639
	for <linux-sound@vger.kernel.org>; Thu,  6 Jun 2024 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671343; cv=none; b=uZoZ9zuRi8wb+WYz8ocNTPZsmLB8R8ol65HBtwlpEA3hRndo2zrJAc79VFamtqKBmrCugs8ox9hB7B/jUmUjzlI0ISVoUa41C/WozhEdZ09E4t+f7P0SKllEZia0JpyNMTYFxAmEN4XQbw3Ce+ADe5NMd/5p81dlUToyLnWGpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671343; c=relaxed/simple;
	bh=GLytD12gJyQwFc+svDOqIGUI1dPsYIsB4Gga3YkgQ30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFKeaxpbxDAnM/Ucg4wPZDDrgWQ0QvwLOnDV1cLzsHwXQhMzKNN1LW8gGJWjmo139jJXSi0XlPBNSTKYFkD7U/qjaNZb630nZRNBKjwNWt3H7OXomU4VvouEqwAVpEE9yaT75A8maDu5o72BtWuC6SgEiZL0I2BSNoeTjZRsoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwzVfRC9; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwzVfRC9"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3748aa28d0fso3347155ab.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Jun 2024 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717671341; x=1718276141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+QutklaZTPeWISdUTM08vnEVHTisrvaUIX+vQS8Ev4=;
        b=NwzVfRC91F3Pz+TV8QNdyBW5mYAYsAbbt/Yi0BDi4WwCEhg0gF00vW4WrFm3sgqGHe
         C/L621VSo/2SvPjbVz96XsS5HWdt30mEg0IrVhE4mp5tnkpeTAO8JcN7Zqz7GFzHOD8e
         oJKBFPXdfY/4p4vFiGyOxw/SwZ0l9pDNrQ99lBk3gxtBMje8hLrZ2MW1EDAEHY3aiM3x
         XKBnIOU2s5KO0Dqf+LH7dZBaYYn9vT9AGDP5xGVcOtbAa4zq+//f9eAzwO2EjslRnC9u
         VZt9r+gnU0FjKo3/q20JdDaCkbnIL3ZfmCtKjhv9wKH6gI1mJz0rweAm1K3k3VG9Odeb
         CyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671341; x=1718276141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+QutklaZTPeWISdUTM08vnEVHTisrvaUIX+vQS8Ev4=;
        b=cdpswgSUl87fYj2HK+0e+qcwe9mvW7WIydSU8z0L5Z7juih5yCzPH6wYyGkvmIJb/7
         8rPAgY5UFWyeesy/PMXrTqlCEnpfVpw9F0dTR/wWodGVou5P1xINuUeO3DByO0or3k19
         3li3lazLlj18FiQFKMreQcDB7jPIffbQtEColPdBO0hvgjjNLYxxmfzaZ2tIiaVzq539
         BaJ8ZR3s/y636aRZ8Z7UyTiBeWOHjT3GGFE3UYEqO3Wca6g4INoJl7RIbTeHTPwW7HAp
         O2wTyVJFHO2NPTstYvjDuzXy3wFHgb/ycMvhq0QZQVwZyCfw5n0r3lx/fj1xzWR7H+2r
         hlSA==
X-Forwarded-Encrypted: i=1; AJvYcCVayTuhqJI8E0dHAB2XAEiFbwrVahyKwGmrSbKLQ6LLVVd8wlqfhvz/UQ+2siPhDwfsc4pDKBLUmWTORBRuf/Q6vcMXcekhOQNelU8=
X-Gm-Message-State: AOJu0YyueBqeZw2UfcQl68a1YoVr7+TMQYink+wvHLnAwA83aTGxkK73
	jMIqRXOlapzxGcxcAWe5Pu6VlcbQ7YywuEd3jRi0mkDzS04f41cjA25yf+DVQhHUNAR1losYw/n
	ksiYnWohwDlggcwEBuNU7lFQ+5mk=
X-Google-Smtp-Source: AGHT+IGpYYUU2RCjHDPBjxRygoaTOqon5K0+pgcWecNyTjlNpMamCVjyI1NPd04lcaWDrlfxwavbW6jJPhAq7yOt9SQ=
X-Received: by 2002:a92:c26a:0:b0:374:a2cf:2171 with SMTP id
 e9e14a558f8ab-374b1f06ff7mr54150875ab.18.1717671340960; Thu, 06 Jun 2024
 03:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
 <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk>
In-Reply-To: <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jun 2024 18:55:29 +0800
Message-ID: <CAA+D8APemxqMXdDsS5JVbWXfZPRPF8=eobw33WEhchF418TLPw@mail.gmail.com>
Subject: Re: About snd_soc_dai_set_fmt()
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:40=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Jun 05, 2024 at 06:17:34PM +0800, Shengjiu Wang wrote:
>
> >    Some use cases require that the format of transmitter and receiver
> > are different.
> >    Shall we define a new .set_fmt_xxx() function to support setting
> > fmt for transmitter and receiver separately?
>
> >    For example:
> >    int snd_soc_dai_set_fmt_xxx(struct snd_soc_dai *dai, unsigned int
> > tx_fmt, unsigned int rx_fmt);
>
> Do you have an example of such a use case?  If you can do that it feels
> more like one end has two single direction DAIs (ISTR some of the
> Freescale platforms were built like that?) and it might be better to do
> that and make it easier to combine two DAIs.  That would also work for
> things like combining dedicated DACs and ADCs.

one of case is:

+-------+                +-----------------+
| SAI1  |   --TX-->  |                     |
|           |   <--RX-- |                     |
+-------+                |                     |
                             | AUDIOMIX  |
+-------+                |                     |
| SAI2  |   --TX-->  |                    |
+-------+                +----------------+


AUDIOMIX mixes the output of SAI1 and SAI2,  AUDIOMIX's output
is sent to SAI1.

TX of SAI1 is master mode,  but RX of SAI1 is slave mode.

So we need to configure SAI1's transmitter and receiver with different
formats.

Use multi-DAI may be an option,  but for fsl_sai driver, in some cases it
is used as single DAI.  So how to support single DAI and multi-DAI in one
driver?  Should we define a new dts property to distinguish these two cases
in order to register different component + dai driver?

Best regards
Shengjiu Wang
