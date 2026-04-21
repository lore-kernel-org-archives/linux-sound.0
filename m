Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C63DCDA4
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802062; cv=pass; b=CqZJubLI/zetu129yM9M0qJEYi48vdjgUGRHN8F8TS1/zpvFd5bwhBrtuyY4eMzwmjsPIjHfXd+j3+xALJSs48H1OQS+V4dJdz/ZSq1kd2d40whAn5euX7CLXgkC+ylAkQp1pq6gHfqVxHlYRcc4zzLPFBjKBDmJqaWDloEiYb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802062; c=relaxed/simple;
	bh=823S5uz3tJJObpEPcWmvau0aO2vpfGG9Vl1N5EZDQ8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZuv1OHsYkDkbrx+yffixTNEyNDecnYteVKidNcb0Fqyd/rrZLsGRimnbjNCI3bV2PM6fjSM6rRwyfJtYD0xMM1cIbB9MGUzAflf+3yNJy1HTvNCRSTXZiTCg0P90j/ge+9NUJcGSMCvf8fY5auogMwRYpSrl52BVKBRCt4hAZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jTtZPxWf; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jTtZPxWf"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D7363F7FD
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776802057;
	bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jTtZPxWfYjY141+IDtq+x2elUki2C/c35h6/SWT+VrUAE+C4eda9RrhXXguPYVqf9
	 +wdvN+lwVIJB0hbrNfem2zm6gtCM91XN4mwGfD1kzqXoZmJ5eFkaqLUj30bfAa6hr0
	 bDDiuG4hyibJUGJ8NoeTR379gtuz7HWiksZSq2lbCymEKDQKKzVLaokN9rRwNDq6lz
	 kdxSkmJkCD50LqS7y6kWofsRraF10nF7bSMjbYkPC98h7pIme3kx8lerrvWLoHr/Z/
	 UOsh9KRxX4+TO/n7sqN1+bzw4WOwcZtJIRUOtjZDLIoUKSgQAQi7GJV6CASR7c9hjD
	 3d0W3iEFMJjXmQXQdadS/I6kyoy4k9XUkOF2MSjdOVLgCaqOZ15n3inCuRmCLA65Mv
	 9FCrLJMR1Wq61slqqHRhhPbKi2dDyG/QWF/5G4O6SQpMsiyuC+OHiJqLHiuPHc0h51
	 7uf5khACDp2/qMcp9f0sLiO2mF8WddD7l+Py8RyUsC3OO1+5//NqJuya6tNjon2wei
	 SFjhbwTtltdo4ahVRgDVSjSoOLwtzlNBNQPqxQXss0Fj1ITch876TmGYPKyfKHX8hw
	 kuLyC9yy5Y81cdKLtgJfhHdk6sGU/l7WHvVjj7qTNdNq8G3SFzVHmhhxlzTq6At8tw
	 bXsyHjMfgA+phDktt6OHJS9c=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ba70cda6755so152278266b.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 13:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776802057; cv=none;
        d=google.com; s=arc-20240605;
        b=TZW/E38jVPLwu6N2diZfVOc0O10mpsDqmUiuA9HrNSqUCGxHrhsmKc2rsU+NeKJeDK
         DVcOX5m44NZUphST25c8qkrypD0BNRzqFdlJFmSe58Yk7uLJVEPoVzjELdQn84o+42nq
         gi/hxHMkjKdEFhIfzZH9U6jRGbys0IwNzQSSYAxAiwKWHP5I4OkPWPm9AKk7ScjGote1
         6JwD9ydDMEqWaCHNjqqzoQ0FF7a4yhAE/EPIdl6OKB/dNdxKLp66nekRW5bRMiZWp8iQ
         Kv2jj93bpqBjitSRNY/n2PaaKYzZjpz7ruaoScz44KSQ/npgUHCS1S0h0oJtYkXJGQjS
         pe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
        fh=ST6YpP3w9TZan40A9p39xi5/cu4ioaHkvQKL8iIH/n8=;
        b=ecQAGqSKJqSDErGcQySy83bjfldmk8facxoarc1vznwe4wgBADiO2h237Tla1vQYVu
         nWUooJJvxDoPOGgLSUjbs1NZumj1wK6HYow2/YWuO2bPWB80xyZ6q4vNX6jYUIlMRwio
         7how9KtsKlJYt7GojFliz4P5jTAONR+rYG8IGS3X/1qAUMd0bsNm98DcBal8X26IA0op
         k5wX8Zbpoi3no64JsgCruZusU1w5qzxpsq7MsPcO/wMHWbKvG8BMo1nMPnSu3KFfGZTA
         ORLKTfXRdKnE4TmQk4WAaRsSqVVssZLdnuZxbXuve34PVk7QNBIttRtgiY/H74vwqJ9g
         84qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802057; x=1777406857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
        b=HjJ2/Xy3dqAMC/QrBmuS7SDPCjf0/liSEXTZ61kMcjGiUvggv9N8IzKZH78kLYyKZA
         iR9dNd0vm1prPysqWR2wH5BvqP8XRVF4u47Oj9zUYZOsuRcp9C9a4F8MfAj8YofNRc8+
         6nDs4GdRDzxhB5bvV7ygMjzh99i9ZbP8gV6SiDqw3TbnWB/t3kYUr7BWgeFD1AQbMdDX
         xq7gNnbJEMKhEJKTBzJ9Eg/S5BlZ7Xy9qzGzcm9WJRhIAmvoIXripLp68CIxU6VYXXfV
         TZzWkBZdX1HRvLX17QfAzXVeSG6VgPUje1tXL5SdcOOuTeEn7z04C0Se5NzQrSkL2ccv
         YV0g==
X-Forwarded-Encrypted: i=1; AFNElJ8cU+Mq6B7skEhxkCiY7rlzBQppudx03K2e7K1GOZY9r8Y22NaGJ1pZXFKP+Vuabt1cKCtqkfhMBkPk8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVmFTivZsHqMJl6GOhPfBV2dS8YssfMTQxDY1Rz3u4vXX7/gw
	EV0FMbi0nN/28uZyqPrEyFwK9cVlabX8wyDH8uIZ8PT6vwZFtgyJnJPFHANNglC4s7OlnsUQ/Gb
	A3VJLe6pf0/T/pebbEFCaYPnpjlE+8CbXF1IkqLzLhPiahunjPH4TC3NmaumlrFG0FDBb+7Va3Q
	QFHmZxMjUzIrZH7ERLL1fKIQgGGh/IvVYNTl/edelHpNa6vr84da2nI/g=
X-Gm-Gg: AeBDiesp7926Wdr/06jWOpRekYdPVC6oBRW1UvxwjMZ41Z0MRLVVQebmiwyA8EgH0V6
	lDKfAbMk70jVzzmo4mSFBoZdxUHvdr4A/cPTmM7SOhkatyep5+16cyMaUwH4I572LRwHHxMdHK6
	N343/6UbRnswoQ0tZLZeRC4f2crqusLRYj/TxTjrNxCbuWiuH+os+BOka3yzaC5lW6sTnV1gw+A
	M3VdgwDNJ3heIC+BxlJQJDr9yZ3MAuRWL1pxKz2LPRdJm21Mg==
X-Received: by 2002:a17:907:160d:b0:ba9:2223:93a9 with SMTP id a640c23a62f3a-ba9222393e3mr365454066b.33.1776802056799;
        Tue, 21 Apr 2026 13:07:36 -0700 (PDT)
X-Received: by 2002:a17:907:160d:b0:ba9:2223:93a9 with SMTP id
 a640c23a62f3a-ba9222393e3mr365451666b.33.1776802056350; Tue, 21 Apr 2026
 13:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com> <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
In-Reply-To: <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Tue, 21 Apr 2026 22:07:25 +0200
X-Gm-Features: AQROBzASU_KTNYayV4ZF9fPgCjdd-0NvGfl1zXPAI4_UHIVGmRoYed66n7wTKOE
Message-ID: <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 6:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:
> > Limit the digital gain and PA volumes to a combined -3 dB in the machin=
e
> > driver to reduce the risk of speaker damage until we have active speake=
r
> > protection in place (or higher safe levels have been established).
>
> > +             snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
> > +             snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
>
> Do these actually match?  The hamoa WSA devices look like they've got
> sound-name-prefix specified so the actual controls will have WSA and
> WSA2 prefixes but snd_soc_limit_volume() uses snd_soc_card_get_kcontrol()
> which just does a snd_ctl_find_id_mixer(), that doesn't understand
> prefixes.
>
> Probably something in that chain of operations should log an error since
> typos really aren't going to be discoverable here...

I think you might be right but I am not too experienced with alsa so I coul=
d use
some help to figure out if what I'm doing makes sense.

I ran `amixer -c0 controls` and that actually shows the prefixed names
as you said.
`amixer -c0 cget name=3D"WSA WSA_RX0 Digital Volume"` also confirms that th=
ey are
still listing max=3D124, so it looks like it indeed didn't work.

From what I understand the correct fix would be listing all four as in:
snd_soc_limit_volume(card, "WSA WSA_RX0 Digital", 81);
snd_soc_limit_volume(card, "WSA WSA_RX1 Digital", 81);
snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital", 81);
snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital", 81);

Does that sound correct?

I'll run a few tests and send a fixed version once I have verified
that works and amixer
prints the correct max limit.
