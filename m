Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42636372663
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374849; cv=none; b=kKVldzh1UmO+DNUhsvUO89iYoWncfcE1yEga4Tc68+o/urMKHtFyTI89gQVZhHEQeQisfSINDkDB4kzrsYPun5L8BtHpKK3IXlT/8erSdOo2sHfIkHgW5QCuHd7MTxX+3qIgHD8YFiki9zfCVpacwzRGi1fdpF4hOTF+P1NaWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374849; c=relaxed/simple;
	bh=ocZ2kZw/C7ztn7N9NGHWosQqYDjNnz6g4pyt+agb/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIBsYnu9RucyuAG2LkFKBrxBJgmZe6L7//G3vlxYBXRAtA8Z2R4SqVjh2GmKvmLkRjvd/61zYsL+IlXLAIzwRGmMt1zUlgNSNeKqPsErGW0SRx5wNmp1RjjcQgPNqARudGBag15UIDCP2dgyhr5OCRQPrmizOE+Y3Utul8TtYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Qb1YF6U/; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Qb1YF6U/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3TpxItcX0fFDBlAMfYWBwCuoEjHnqSAxKJmi2Q+d788=; b=Qb1YF6U/oklSplm1yxNEH7VdIm
	GOFRDa2VyXCIYZhcfDHw0acdOrTNPQu8SksZu+dcLhwy147nAJf8wLELW0fsoQh1p+8EgP0z4HPui
	yxjjTJVgJhNrxk2QlpmmcLdxaeHtK4k6Jd3xkJ0pHGcaeoTdcBq51zss3jFPNAAgezlIt2ddaDlOZ
	XBOKVhef+ANa1Wra2NzjThNkjwSXEna/ksGwMjaK3ZaR27dTtPZtCz4ZJ6SQ424iG2mW575DTgt6Z
	E1qEj84DVYIiLH5xaUwZ4NjMgCTaOv4yF6mmqB+6kgs92QqeYGeMSSr+BY+K5OL7H2Oq3X8nt1qaY
	IUogWSAw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ4gG-0009ps-0G;
	Thu, 21 May 2026 16:47:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ4gG-000FRF-1b;
	Thu, 21 May 2026 16:47:24 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Thu, 21 May 2026 16:47:23 +0200
Message-ID: <2538327.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <075c095d-c42f-46cc-98aa-b290f25519d2@intel.com>
References:
 <20260430140752.766130-1-cezary.rojewski@intel.com>
 <6456213.lOV4Wx5bFT@steina-w>
 <075c095d-c42f-46cc-98aa-b290f25519d2@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28007/Thu May 21 08:26:28 2026)

Hi Cezary,

Am Donnerstag, 21. Mai 2026, 16:41:04 CEST schrieb Cezary Rojewski:
> On 5/21/2026 12:11 PM, Alexander Stein wrote:
> > Am Donnerstag, 21. Mai 2026, 10:13:45 CEST schrieb Cezary Rojewski:
>=20
> ...
>=20
> >>>> Now, listing the clocks won't help here unfortunately. The patch wor=
ks
> >>>> on the component-level, clock details do not interest it. Also, could
> >>>> you specify the scenario? Is just a simple platform boot causing the
> >>>> problem -or- do you perform some specific test steps to reproduce?
> >>>
> >>> There is no specific scenario, just booting the board causes this err=
or
> >>> during probe.
> >> Thank you for the confirmation.
> >>
> >> I've forgotten to mention - please also attach the equivalnet but from
> >> the system running the previous kernel (one that causes no trouble).
> >> Now, would it be possible to receive the excerpts as attachments? The
> >> timestamps are also welcome - in the above snapshop, all of them are c=
ut
> >> off.
> >=20
> > I stripped the timestamps deliberately, people told me it's just noise.
> > But here we go
>=20
> ...
> > [   15.360319] tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_s=
et_sysclk() on tlv320aic32x4-hifi
> > [   15.360342] fsl-asoc-card sound: failed to set sysclk in fsl_asoc_ca=
rd_late_probe
> > [   15.360360] fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_l=
ate_probe() on tqm-tlv320aic32
> > [   15.558546] snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi=
=2Daudio-codec.1: ASoC: Registered DAI 'i2s-hifi'
> The framework' behavior looks just fine. I'll need some additional help=20
> from your side here.
>=20
> What does -22 from snd_soc_dai_set_sysclk() actually mean here? The=20
> codec's ->set_sysclk looks as such:
>=20
> static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
>                                    int clk_id, unsigned int freq, int dir)
> {
>          struct snd_soc_component *component =3D codec_dai->component;
>          struct clk *mclk;
>          struct clk *pll;
>=20
>          pll =3D devm_clk_get(component->dev, "pll");
>          if (IS_ERR(pll))
>                  return PTR_ERR(pll);
>=20
>          mclk =3D clk_get_parent(pll);
>=20
>          return clk_set_rate(mclk, freq);
> }
>=20
> Do we even get here? If so, does -22 is caused by devm_clk_get(),=20
> clk_get_parent() or clk_set_rate() ?

AFAICS the error comes from clk_set_rate(). For some reason sai3_mclk1_cg is
to be set to 24 MHz which is not possible, because the parent has 12288000 =
Hz.

> I'm also up for a call (e.g.: Teams call) to debug the issue. Typically=20
> such problems arise due to dependency problems between the components=20
> (e.g.: platform into codec works, the other way around does not) but=20
> I've only spent an hour or two analyzing fsl <> tlv320aic32x4 stack and=20
> analyzing dependencies usually takes more than that : )

I'm open for that as well if you see this is a better way to approach this.

Thanks and best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


