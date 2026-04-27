Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F73B4EAA
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286878; cv=pass; b=euWhgZhPzYTKih+f1zO1/mqWWcBOR2h0kT//2PLIETd9HCpIBSvNzwTCEfUUhl80goxFD7h8UZxFgoBTuW33NAOH3MtKfTy+sP269L2ilKRgtvQSWNeMQi73kkibXwmJ8MOKq4sXu90AZymxqfx6dd+8G89vJk1oMMwM0AimbGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286878; c=relaxed/simple;
	bh=YpU8r+MdLtrongUxlOhttaG6cy/l7Tz9MTUipK+v9vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHzKKPMEt+9vsOXtJ0PYjjirFXhY4RQduZI9LcijDkkhUKyL+GJ8ajN4OO+rJuf7rj2U+O2064LSjvnUDG/qhCT7/94NR1YzfjhFQv2ysj7ud42j9KQzP5tQjon77FK2lz6XMDR+ZkkjVlj+GbTMtUSxNOkKz70WVfEr7XsC18s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC7hyv6s; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC7hyv6s"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab077e3f32so42766605ad.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777286877; cv=none;
        d=google.com; s=arc-20240605;
        b=UGPPzqsb9wP7yWE1YZvPkfK/lsq7qdct9nmkaHJlm3yUaeKN8TOpiGpUsdo9a6XKd2
         X6BP0x7RWST36C1Z9mrzrPhjyWKPCe78VQP0BZKGpnkMp2Mce0GkblQRm3KSPpJHVSNv
         K1mGWGVzUULw6M95SlwyezqQYrVJ/lN77tXJtP4b/lzZENPirJMuf2Bx67n8c6pU0GfC
         6BDyGcdVhfGxyTYI6RupAWdNWvoVI0YRwjou4m4piGNmAyXJ29jwhhbed513Tm4nlUKj
         7thtqT7xCtFl/vjGahtVOaODRzryED3BHfCUQtPwkLyFOSyCVoaK65nWhRPqq8XXfU7h
         0rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7WIXV3vy7glDtk0NEp5Cspv2KG7UzeIls2bJ47h0Z0=;
        fh=JvYbctVq7nMuNiP3K6PELxN9qsIFXlS5vIEknjGvhO4=;
        b=T0sfyPyAskVRNMioX8GZCQ1M5W0gcEBymvqn1nBoee0zQhCU97zgoCAQziL77GtKZ+
         VQaOswplFdMtfrMB1c1Bcs0L0eo7jbl0tuTswrEykiR4Y/6d3KpUugCXEGB9pEPTwyfM
         wPp1eNpXoGWoxtTqv0ySvDMoGhEdzN2XTdEw0CNW54vLB99SbYPR2NA3dLSNE0BLsVp1
         bs29BS4JEMFVU+6vQb/m/t3+SZPrCWLE3varzxUthrnF3xzaoRppl2y1v3JGCsti003J
         HEorO7rjS0WIi4+L01MJJa8wxMNrkTTlAAUn8r+viONiJljk23ijvatwVu8RdNboEbW0
         68Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777286877; x=1777891677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7WIXV3vy7glDtk0NEp5Cspv2KG7UzeIls2bJ47h0Z0=;
        b=HC7hyv6sUdhzTG0aiWowCmQ0A4Sbtvmiv5H0UZNCifDQuY7u85u0NlCyOMlvONHuMG
         5QESSdOg9oYktiK/mI6ShF+3y04o/jqqAiEIxIsAq9cx9bC/u+HfjuwDH1hy72p7dE50
         0fMLS9pGDS+rxuLVEdpQv76Iqx+WPI41Kjr8GnGOBywdoQw0PRU7qZ5DLMetgcNnoBbt
         0tbnj2+eBVB2oOeaExMkQyhiF68wBa5JMRKGgoWjx2EehIjR6rqpV48JIsb3cVu3pLoB
         ngWGNcHxiX6D8hZeSmwo8O1EW/HjMYm1f2dnO9tGwCMcqW+FMy1viLVjLD2oT7g6c7cq
         my/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286877; x=1777891677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7WIXV3vy7glDtk0NEp5Cspv2KG7UzeIls2bJ47h0Z0=;
        b=M9XglKAtYV6UuMfhuYDyyXWcyew/JblgGWQhYWjujvwtP/B1kddp2f1z/mXQlXVmgg
         nmJ3KoBz2vgR8wVoqcdMGouwrnAe6Tbb50OqEvdh1tq8aGJQzScoKzdPd1A3Jlk0Mc8K
         VJP4ffUCxKBZpj5UzsbQe0nenmtbJ+YARCN8UOhk0k13kKEN3mGRcyvoKc5JE5HNbntJ
         i/1Gu6x+0j1BbmiobgbGizajVySBdgbUsirzO5bOk0asz2oTi3esfckb+Cy9hl8db7FL
         wJmxSWq8pKpy8OpXamkfokMVXB35ywkh/eloFoRBDP3N0jZx2Jm3Qe4jXCBdI0DHWVzE
         J77g==
X-Forwarded-Encrypted: i=1; AFNElJ8tszghtDGuiG3Pq7mGvXjq12UJGm7xV29TOr5Y5PdHCFq6XP/rUq9MOmOLfut/VnR/5NKKzFdRC21xWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtGkcgVjaeSrWMbMfNsRoVgeVBXp6D2l8v00fX9+9iJkKeny2
	HhLETHQJ5EzehgsgHlBIFVU9FSQu84obd9NYmw1vQxu65tQFADFVuauueYJJvXf0SO8+NDQKv+7
	9ZhRIBKP9ZUQbdxw0LDt0mKCKhmBNago=
X-Gm-Gg: AeBDieunpU1BcTWWh1bOLdqgcJXZRjIuMGwaIKDE9kvKGKv/94POm9mawq47vd9IUhZ
	13EThrRAjRV8XTTJnVy935r17JMe5s2UsnZRC6D15iAP+j5y/KRQlZoxI4yCVCImvLNlnNB/H+D
	2ufJ5PoPIqV3EvtpIvzLa6EaJBHlFspo1ryqk9PIvcJvtfEArqW0lzf7oTT+ktI58+VLcX0VKAq
	x7INMLYal4pAPVNOZ0BanCcDMkhJyojFr31L3wQH2+6Iv0x7DUN2fMgNxDaPAVQ+0Y7clWrwPRf
	d8BMENSXYCSlgjaJVQ==
X-Received: by 2002:a17:903:48f:b0:2b5:ffc2:b8d with SMTP id
 d9443c01a7336-2b5ffc20c6cmr288496845ad.40.1777286876631; Mon, 27 Apr 2026
 03:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424103806.2276780-1-shengjiu.wang@nxp.com>
 <20260424103806.2276780-4-shengjiu.wang@nxp.com> <c925e9e6-934d-4b07-aaef-a7f737c687a2@sirena.org.uk>
In-Reply-To: <c925e9e6-934d-4b07-aaef-a7f737c687a2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Apr 2026 18:47:44 +0800
X-Gm-Features: AVHnY4IckQd0kNOio5AaSh11MDWGsTPIgl8JS33ob56G8t0YqSY5T0f6WsqJIBs
Message-ID: <CAA+D8AOUVbSmWpr4+KhHC+9zmvj2M-BE_bpYEOUByGUv-wdHMA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: fsl-asoc-card: add channel and rate constraints
 for CS42888
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 12:09=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Apr 24, 2026 at 06:38:04PM +0800, Shengjiu Wang wrote:
>
> > The CS42888 codec has 4 I2S lanes with 2 channels per lane. Using odd
> > channel counts (3, 5, 7) causes data misalignment in the I2S frame,
> > resulting in incorrect channel mapping. Only mono and even channel
> > counts (1, 2, 4, 6, 8) work correctly.
>
> > +static int fsl_asoc_card_startup(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(rtd-=
>card);
> > +     struct snd_pcm_runtime *runtime =3D substream->runtime;
> > +     static struct snd_pcm_hw_constraint_list constraint_rates;
> > +     static struct snd_pcm_hw_constraint_list constraint_channels;
>
> This makes the constraints global for all substreams, given that the
> Freescale SoCs tend to have multiple DAIs and have things like direct
> PDM inputs I'd expect it'd be relatively common to have disjoint
> constraints.

Thanks for the comments.  I will refine it.

Best regards
Shengjiu Wang
