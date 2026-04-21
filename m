Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2F384249
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757226; cv=pass; b=TbjsdpBhDVcDhoOrjHC3ZUlulYYluMqSoTGLO4Lc5t8yiJKtMAOa2ThEZakHcoKxQ4/lYC2lE2sgTRIUoKbR0ECaXcQfXZAHkh0Kq/VSajDF5aAO1bYq8MaMCGYNMIqzFqUd/GqTu1oCrZhM8wnPw+FaOjVyq+Pt9S7MHs94hOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757226; c=relaxed/simple;
	bh=afwH2wtvxXWGuGTAargWCzXWntaQ+MUFDXcX32p1SUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3p+9dQACpe7GPJRxacaBCsmfGmn3QCbMUYZO0arQHp9HBaZTONGrBVqeGM1YIOXYh0gzoSkgu7oqNob9bM+2Wwc5sjcUh0Cg+USGEtTZ792I4dfJwnQ04d6VFT1F3QzckokjwIvHpiqeH36Dt5aZuxMTwP2/dQyIpaSxc+U0/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdrmULVe; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdrmULVe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so3543480a91.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 00:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776757224; cv=none;
        d=google.com; s=arc-20240605;
        b=BO2dl5bswY3lghfpCfTemnWbLjFOO6oUkP+U0bk+1UTF1NbbiiSb/nvItc2TbjXs9f
         5PRQuXu2KkQrXaNQyl71WeCZWuCxMhrvyYvKoqZYHGtRg7OG3LgUlJqomgDA7CNhnu/M
         Uw7tG80Fr+j0aSfsIwIzbx/QZ/4djmwCaTLqoLRj3sm6YTJlaS6g6tbZV25/qkGp8L/s
         65lhtjs2177hMIxMw1EyobHObxSy7DLp4Wk6eBSHtKfHzynKyTnk9l3Lk7MxMepdj3cN
         0UdU40966IQ0T3vengn4ti6DPyToTEzioAu+6XJAIDbeUNUDLL6Mrg+KsfBs1HhyFWPm
         G+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bh0VOjbMhtH+2V4ttttWsNwgrNIKj1T3RMmt6G5B52U=;
        fh=J8gjf+SkcewzZMjuFGd3juGpQxxvfPcvkFQ+edwQoq8=;
        b=M0e+63iT+klYtntkD5y2SxqGVM6cDhIaK3EN9DysSCUJpjAGy1jzLoOFEY6bMtiLd4
         cjAd+elu7FvUeVhjvcvv9UEC51/KIhrS6CosWo6JU8Kw07wt+jaeVncgrm21mIEkmGqB
         XY0ltRMrx95pC6cilOeUj81585NEjU0MrUhuq8Iu63vkSzn/4thPrZrtH2d4Co9FaLj6
         YzC1JBS326gr4xlcHTP3EPgn8gnKYn3KVQzFeMQ773G7R83fXhOUi7GhqBYlIhxlvNjN
         xOukJvIuopYwQaFRMVhANN0pEl7de2UoTXMZW+sqHtvmLFOsr9GCGRCwmdVFwn54wZE7
         csqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776757224; x=1777362024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh0VOjbMhtH+2V4ttttWsNwgrNIKj1T3RMmt6G5B52U=;
        b=AdrmULVeCN/cmKxU7rOrwkwpNhPOF98LHmZPQvAkJhM1LNXkrJsb/z33LcZoUMn0TE
         nLfUbGmrTge3rB1zS0Ki/qw0DqYT4Ndhnmt+8UNcpzKhOghosSE5fRCJ8+VCObfBCSoj
         fhcPdDi0/TpuUtvij2grqsPQKY1f9e6akzeOfrdPaqoJELWEFNlA+CNnUM29vxVZeNlT
         ZrRmseK1f61NJi3kbVMkBvxjePLM/k8jBTEcrmr1XLQJ/EUYWdxyU6GmNF37/f8eOZg0
         pahyy00QDD2nd3XBvbWxDS8GMHSCMJO6993v8qAGBUKld1sUDlPZZu7W5QDwvpBIAbx4
         Wodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757224; x=1777362024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bh0VOjbMhtH+2V4ttttWsNwgrNIKj1T3RMmt6G5B52U=;
        b=jnPw7Z86+fKW6Ho+0wtOB+7Bhus+iJLLXkH5y7dHeiggSzaU739FOa/u3WXXvHBtcF
         MXH3Rp8VHt0v/1r/BDFOiYlFKkKJrE/09b7b2mfVe1ZV/f3+0wsIP/D3EGjjc4ww3+i/
         p5Bb1y/0bYVhY9+wH/7n7LJsXpxL0OaCsn2DL6Ke3Q35J+RlWbOdlvKMOFTEC6Qw+32Z
         etBnQof1rsvf8+AlkqLUdZ20pcZ6ZhIvLJwy/OlzwZEQ6CHwjXQe4SifJlv6GbVFtSMi
         poha9ct2gSupNHTFKtW6KZo03hjxn7hT7HFNlM/xohxdhc31D5JAyyLFQ+5H8u/1WtDB
         Meew==
X-Forwarded-Encrypted: i=1; AFNElJ/Yipf81NLpM1AI0OFsU3PmkYkD6CNok04ZLRLIWui9mBFCSUWRFIm2pNMV7fps+ZUJMfPOkv3CNnhS6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySg7WFXcAxOK/47pyOwKpPT6HDUxf2jLRvOHX+n+VqGucxuT/r
	nwnGwZonEqECe9NingOEFfBatjWURaBfrrszCqF4HGsE/3kOe/4kduxxYKoFZFRcaG/62zsrKYB
	++dACEZ3Py5hsqy/fPB4E7FfOr/NoyBQ=
X-Gm-Gg: AeBDiev2CnuXt8mm5Q3CrlE2TCt83GBdiHUACTGGD6uFsakcb1oyr88mbOORjLJmKYt
	mBznyR6aAu4KyNi7eVvhgF2kwfTv970U9DI5DeA8Q1UK6PdBDRddVwoms/yaFV2+MgvC4IbIC5n
	EitmgHMw10GkOADKXr/webulLMSk7CViFnCtf9k3A31bAqWv7cg2LPv6+RRgzIx6d5DE6zUDUjL
	nCOWVlHOzLO/C2JSUZ1adNii3LAeuTxc1nrAE057DitJo5bFTtmZSH9y+KZADxUhPxJ62jFSHi6
	erC9zDd/S+YTaNAtwA==
X-Received: by 2002:a17:90b:5288:b0:359:fe72:3559 with SMTP id
 98e67ed59e1d1-3614048b1aemr21085898a91.21.1776757224448; Tue, 21 Apr 2026
 00:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420085344.2081805-1-shengjiu.wang@nxp.com> <6c6f94b1-a4fa-418a-b471-8e3c82305233@sirena.org.uk>
In-Reply-To: <6c6f94b1-a4fa-418a-b471-8e3c82305233@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2026 15:40:12 +0800
X-Gm-Features: AQROBzD1FwWrSiTcb4_TXXYBoiE2Up6O4dADIks7SRo1J0rNtrKh2cWtOkBvP_Y
Message-ID: <CAA+D8AN3kmU-FDHF-kb47=ayXbypka+Q0vO-i2Bpzq1GSABuQQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add DC output remover control
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 8:50=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Apr 20, 2026 at 04:53:44PM +0800, Shengjiu Wang wrote:
>
> > +static int micfil_put_dc_out_remover_state(struct snd_kcontrol *kcontr=
ol,
> > +                                        struct snd_ctl_elem_value *uco=
ntrol)
> > +{
>
> > +     if (val < 0 || val > 3)
> > +             return -EINVAL;
> > +
> > +     ret =3D pm_runtime_resume_and_get(comp->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     micfil->dc_out_remover =3D val;
>
> ...
>
> > +     /* Update DC Remover mode for all channels */
> > +     ret =3D snd_soc_component_update_bits(comp, REG_MICFIL_DC_OUT_CTR=
L,
> > +                                         MICFIL_DC_CTRL_CONFIG, reg_va=
l);
> > +
> > +     pm_runtime_put_autosuspend(comp->dev);
> > +
> > +     return ret;
>
> This will return 0 not 1 when the value changes, meaning event
> generation is missed.  The mixer-test selftest should report this.

snd_soc_component_update_bits() will return 1 if the value is changed.
and the mixer-test pass

ok 120 get_value.micfilaudio.8
# micfilaudio.8 MICFIL DC Out Remover Control
ok 121 name.micfilaudio.8
ok 122 write_default.micfilaudio.8
ok 123 write_valid.micfilaudio.8
ok 124 write_invalid.micfilaudio.8
ok 125 event_missing.micfilaudio.8
ok 126 event_spurious.micfilaudio.8

Is there something I missed here?

Best regards
Shengjiu Wang
