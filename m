Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A539A7F2
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779643185; cv=none; b=lHA4CRWp4V9PvJFC03IS66uJdnEYR8WAo9XhHgP+w9XVcvetXkGzOfCmNRCHAguJ6HNJc9lKVkEEJM11EkUP5jp0KD1CVOOcpn4F6IAfntUPTDgE/PMdK2+3H/ieRYp65LsJro6NtUsJxgk7FrqA8wdnU+Jr5aJzVH9cA8tXBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779643185; c=relaxed/simple;
	bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuU4KqS5Re+dPV3A4sp8cKDbKkzy6VXwOWjMpOplLXrtGgoPEhVO8RV0N0ESy4f0ilaCUljOCAjAKrYaOC6+5LuN3ORr2owZWPj/7PdwpOCBhOsbprpIdj2ty+P4f6agBPnyoHlDs4Tvz78+aWC9cAVqT/v/G4bmGueUcydyGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYbVPfJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYbVPfJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A8F1F000E9
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779643183;
	bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lYbVPfJuvAIjdkzuTPnmdzs5ilrW63J1vyl1GHDO0OL/ffzowQ1KSXBkj4StD6PC1
	 Q+Q7xi7Zq+c1iUckF1X50AlDebN7a2oZwWB/k33FLwVpZkbgRrJmR3rzUm2XO48N+n
	 LZ9CA/7FfImNi9sHBaVQbBt7qP/VyFrjnpFjGRb0oPRPfC/wrgqQii/IMjZYXReA2L
	 wW6OrDfP/NRDvFqqEx17C/Y1CzRH3+0UV8lKH4bu6wmDzuOl+eHS6JhyK/qjMUUY5M
	 NnIvqZpf6Qzs8ZAjWkZZjcHE8qVqSloSdhx4KwlQIEXQ9EjBgBPwvWoQqvi1DChBtf
	 6DczsnKCPaELQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3939d2bd739so69618171fa.0
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 10:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98DCMl5gYi4CEs9I0sQtuaXaPmh/zPXf3o6YcfP8MS/S56cxTr/4GJifSVdqfU6i6k00gu2V86ZOMYNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRwftCcj1EcwpzxdwFfM/Clly+nSkpQ3gF2zIKEXEtWgeo+2y
	k3ChWb4nmLW5HEmS4DBd1TLRulx+1wJZDVuPxZpn143M9jvfM0Q9AlFiQSxObk1fqLwyCaEjU28
	rUNWsRuC3pElS1HhctAHFT74LXZQS3vQ=
X-Received: by 2002:a2e:87ca:0:b0:38e:2aa7:3984 with SMTP id
 38308e7fff4ca-395d8c2f009mr26627641fa.11.1779643182406; Sun, 24 May 2026
 10:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com> <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
In-Reply-To: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 20:19:28 +0300
X-Gmail-Original-Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
X-Gm-Features: AVHnY4JQEqR1NRvaAlulfLfl6JFdwlybp-Zu9dQL9cGHE5MXYGpl6ZK4AUWGpHI
Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 9:41=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, May 23, 2026 at 3:11=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.c=
om> wrote:
> >
> > Hi Chen-yu,
> >
> > Thanks for your feedback
> >
> > On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > > > Enable the APB bus clock before the SPDIF module clock
> > > > during runtime resume, as register accesses depend on the
> > > > bus clock being enabled first.
> > >
> > > That does not even matter here. Access will only happen once the runt=
ime
> > > PM callbacks return.
> > >
> >
> > I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't imme=
diately access
> > registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so =
the order might
> > not trigger a failure right now.
> >
> > However, if we look at the peer driver for the same Sunxi SoC family,
> > =E2=81=A0sun4i-i2s.c=E2=81=A0:
> > Links:
> > https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-=
i2s.c#L1296
> > In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strict=
ly enforced as:
> >
> > 1. Enable bus clock
> > 2. Access and restore/sync I2S registers
> > 3. Enable module clock
> >
> > Since both IP blocks belong to the same Sunxi platform and share simila=
r
> > bus/module clock relationships, shouldn't we maintain architectural
> > consistency across these drivers?
> >
> > Enforcing the "bus clock before module clock" order keeps the dependenc=
y
> > ordering aligned with the actual hardware roles, where the bus clock is
> > required for register access while the module clock drives the function=
al
> > audio path.
> >
> > Wouldn't keeping this order also make the runtime PM behavior more
> > consistent and easier to follow across the Sunxi audio drivers?
>
> This should be your primary motivation for the patch, i.e. what you
> put in the commit message as the reason for this patch. What you
> currently have doesn't make sense, as I already mentioned.
>
> Some background though, sunxi is done mostly by volunteers, so we're
> not overly concerned with rigidness or aligning different drivers,
> unless they share a common library, such as all the clk or pinctrl
> drivers.

Oh, and you could also add that the resume order should (normally) be
the reverse of the suspend order.

ChenYu
