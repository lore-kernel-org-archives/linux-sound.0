Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8A2F7F0A
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 02:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268668; cv=pass; b=Apd6DQlv2sSBwHo3a/VFaoxR8fehWjegfHII1hBZrlHqKl7oQXbzV/IW5ofYm34SpDBJaQrOwMBf72Ed+KWrh+Tx71q9NjNO2bXLSHG1CXPHqvtrFjl/GuTmu2zd1QH6flgU7wqDFZ/iyK3m00/xLJmyIxdsWxIV7aInUJVYpqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268668; c=relaxed/simple;
	bh=B/ln2cCY95JHYWnm1J+LiqXJhsX3Vj7BZ3VZc2i4tjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gryC8wQLIMVz2prjqVmH6rTTuJAzKI8vddWH00YIb6FNz413U19RxCmwspny67UCFtXr+aMiiAfv2xSr6cLmW0ZffDFXTF71JKKKAvb47QYAS4DjnjUxcGJd8hkvzV4Mfn0Jca/xegs27W7HowxMsFIlh9M7Axwd8AI1jT6wQOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXY+kCbf; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXY+kCbf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c897468a244so150719a12.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 19:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782268666; cv=none;
        d=google.com; s=arc-20240605;
        b=jOJZfgMLimjJUrtkPOPefPmOwqy1xcjqxQtjmIWSd8S7fKdWdX0OUv0mM4Hz2qrAjn
         Gx/0NS0E6mceoQIBtMj1+GWmvpHuSI8NxaMXC18KcAVLa58DIN7yD9jy5gosaoeBBuzJ
         QkA9ri0hLB+FOL6IIS6F5mxNpMyx3+FooBxxmsrtuOV/3Ug5xnwOCIQmo3GNQFLRTPE9
         LFFZK5IgMajCUgM3D5HbNCm43ws7VEvK0u0mPY8j0vn8J7N5Nq1zOSDbt09aN3vJ3e4t
         IeHAcOh0WxH2e0MUQKuKvZn6bhKouXGINSes51hYuS/tPI3qTJWGOcWI++d+pg7K5nCt
         f0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        fh=YQvSaH7n6Q8qWSwFNqtGpSg4cdpGrcqIsKCMLuaMMJg=;
        b=XgEti5oAiZk+PVIbgZ9+aZ7MHuWpeXTw28tS4mGGBjkNigkWinBMtrTxK8SubeByeS
         /lzSFdKfQ+1otONu0M12EVbJA220KrsjBBdSh6tXOKRzW2rp491iXSrIltgasoFMtqNK
         6t+wuRpchtuiyZ0gmvKilIzB++yFz2GwPBsyfxqmJnLYJcGqrD5dPJMNV/C+NI2hLw0L
         vE9QWojSFnpRgGRyDEm5LhoF7Tt7DpRiAd3PobUCR7HBqbl1UwdBJ9Wzi7I10WB03/GC
         IcHDeAtqrFBj7i99hTBdFVilCZBlomGGJlAbyvsvJq1V9gVmV3J2KIrHBl921W0dekae
         GTCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782268666; x=1782873466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        b=iXY+kCbfL++LL+C8tLgqxThNNHm8ZpXZe3Rx3OBUqyptfTnrPPsf5Ew4uscY6/RWFL
         zN3iNRtGVuOC9Fxa6fSwp+YiO1kZcMa22TYpYxoHpZVqyqpny0Q4ezBVvYzfi2qZLyzU
         jfrdNCfUZ3SoT7UwW21YIbCNFXucJrGPaKBMZAU3DDd1KaB/REYVLVftbdRzGc4KLhPY
         9yrHaqO0sacO7McigZVxYf3NnOY8lw/YckiEjP7zL44HjO4mmAq3HQh/gNLX/ukqgUv+
         cCTeeBw9Hbhafh25Nlbtdw59x92nU0eI2HmaUyvNlGfHUJc+1BR0PMXwU3Hi2zZIXUVn
         np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268666; x=1782873466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        b=IeK0e3wr1wSm1ABkoqtejPkuqAbEPzHGXlRNs0a6NLeEN7MK/Fn5UqEqXjIT5lVgmW
         g59HulOAQzoLH8piuCYjcuZ8aGP5fOcsdnarj8r8TpAH7NlYSPYNCcQvssU2HPS+WXYY
         v2j0mQTsTBOwBnkT9SQJEAsiV92hcnxu9YfWVZviBKvGC7RK1HpZNgzM1O74tDlapbuf
         f6kDowknLMJeCNATVDToLM07kclZO6UxD8NCjGJaGETvLNtkbtPBYk0VSxqu7rvW5+Bc
         d5uLS2MwOd6DXTxRSn2MtOVeZh2qrFU3Jr7Z548pe4NiG8vKBIxV1yA6wBVjt5vMK5g4
         MVyA==
X-Forwarded-Encrypted: i=1; AFNElJ+lEmmhsTTmX8yqozCH56G+KtMwrMOE3BZQEBhaEy7ayMlVf4BEl1q8W9SC/l9pO4pGSGXUkeMmLPh6Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeFPEqQ/+QTx7Fh6/rJ7HPdp1W+aytr2VW0Ny53x4tM4g95d5
	mtJYfGbgsIDwCKLMbZb8QWXNO78Uy7xBKoV4zvfZX0M39v6FJQzTN7pGqjrNM1wd/YApynetHxg
	lCWXobWC2iijuu5a+3A9Uv67oYdvkH7U=
X-Gm-Gg: AfdE7cmhLQEJbvthlgnFDPIXstSrMIuWWe3vrahkLbFJw+u5eDpAP/oysHGir3fMYOV
	E06/4BYnlaBdAJwjHK7QJkOQ5Bufjptt0WktC1kNiI9I/n0gYGcqQMupuomk5eFSP/1/cYXx2oz
	0uwVQHYtXtNJaq0EoTKQnuH4CX40E1+7WmNuWXKxY4DEHkHMX5PbxNhKWVfRBoI10jdEWhoMccf
	NJ+i6uOEcMSha12Y5wQM7vFSS/pIddUSCc68nSK/JrjLUdvCHuY6ke7aXAd0a9bhBrhG1Uw/3Nb
	/Qv8xFVEgej1jjxlg9MnAAfJlj4=
X-Received: by 2002:a05:6300:49:b0:3aa:f2c7:fd87 with SMTP id
 adf61e73a8af0-3bd2d23dcb9mr1656815637.31.1782268666306; Tue, 23 Jun 2026
 19:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
 <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
In-Reply-To: <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 09:37:33 +0700
X-Gm-Features: AVVi8CdkK8REN-AFfjq_xzCg7k_Htq4uHz7WQJiam5YaqT9kTDS7xjGfn0ufY28
Message-ID: <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Regarding the case where PM configuration is not enabled, with the old
source code, I suspect there is an unbalanced clk_disable_unprepare()
call on hclk when the driver is unbound after a successful probe under
CONFIG_PM=3Dn.

The actual enable_count / prepare_count sequence for hclk (with values
clamped at 0) would be:

probe:

devm_clk_get_enabled           0 -> 1
runtime_resume (manual)       1 -> 2
clk_disable_unprepare            2 -> 1 (at the end of probe)

unbind:

remove -> runtime_suspend   1 -> 0 (ops->disable/unprepare executed here)
devm cleanup                          0 -> WARN "already disabled" /
"already unprepared"

This conclusion is based solely on code inspection; I do not have
hardware available to verify it.
I noticed that Nicolas tested and ACKed the use of devm_clk_get_enabled(),
so I'm not sure whether that testing included the CONFIG_PM=3Dn configurati=
on.

https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/

If it did, then I may have overlooked something.

@Nicolas (or anyone familiar with this), could you please help
double-check if my understanding is correct?

Best regards,
Phuc



On Tue, Jun 23, 2026 at 5:53=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Mark,
>
> Thank you for your review.
>
> > >    1 Reverting back to devm_clk_get() to remove the implicit devres
> > >      enable/disable behavior.
> > >    2 Manually enabling and disabling hclk explicitly only around the
> > >      early register access before Runtime PM takes over.
> > >    3 Dropping the stray clk_disable_unprepare() at the end of probe()
> > >      so Runtime PM solely owns hclk afterward.
> >
> > Note that runtime PM can be disabled at build time so we might not have
> > runtime PM at all...
> >
>
> Thanks for pointing this out. You're right that with !CONFIG_PM, the
> driver only relies on the
> two manual calls to rokchip_sai_runtime_resume() / suspend(), so hclk
> stays enabled the
> whole time. I understand this is unvavoidable in that configuration,
> throgh, since there's no
> Runtime PM to re-enable the clock when it's needed.
>
> I'll update the commit message to reflect that the driver uses a
> combination of Runtime PM
> and explicit manual enable/disable, rather than relying on Runtime PM alo=
ne.
>
> > > Links:
> > > 1 This change is based on the discussion around manual hclk handing d=
uring probe(),
> > >   as raised by Krysztof:
> > >   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@ke=
rnel.org/#t
> > > 2 Background for the earlier devm_clk_get_enbabled() conversion:
> > >   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
> >
> > > An alternative approach would be use devm_regmap_init_mmio_clk() and =
let regmap
> > > manage clock enablement around register accesses. If preferred, I can=
 rework the
> > > driver accordingly.
> >
> > > -     sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
> > > +     sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> > >       if (IS_ERR(sai->hclk))
> > >               return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> > >                                    "Failed to get hclk\n");
> > >
> > > +     ret =3D clk_prepare_enable(sai->hclk);
> > > +     if (ret)
> > > +             return dev_err_probe(&pdev->dev, ret, "Failed to enable=
 hclk\n");
> > > +
> >
> > > @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_d=
evice *pdev)
> > >       pm_runtime_use_autosuspend(&pdev->dev);
> > >       pm_runtime_put(&pdev->dev);
> > >
> > > -     clk_disable_unprepare(sai->hclk);
> > > -
> > >       return 0;
> >
> > Are you sure that the runtime PM state there is such that it knows a
> > reference is held?  The driver used pm_runtime_get_noresume() so the
> > device didn't have RPM_ACTIVE set I think?
>
>
> You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
> think we need to add
> pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFI=
G_PM,
> the pm_runtime_put() at the end of probe() might skip the suspend,
> since the core still considers
> the device suspended .
>
> >
> > The runtime PM API really is a miserable collection of landmines :(
>
> Yeah, plenty of landmines indeed :(
> I checked, and rockchip_spdif.c does use devm_regmap_init_mmio_clk() for =
hclk,
> rather than wrapping every register access in pm_runtime_get_sync() /
> pm_runtime_put()
> the way rockchip_sai does.
>
> Best regards,
> Phuc
