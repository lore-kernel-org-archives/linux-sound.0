Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5617758
	for <linux-sound@vger.kernel.org>; Sat,  7 Dec 2024 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733537066; cv=none; b=VsKuHsZPw/e1uSrwcP6sOG9I2iQEj0N3EEOFvWx1yV2htXJ1UEAe5aVvy9FrNUwg/8VSi3+MAA9tT4nFU4g9h9kBYVgpxpp6p80wqidOPV5kvC0plbImDwl3JKdcP8plb0+eFdtffu+oPNRqtRG4eKWuxOdbOwRz9JQl0KRK+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733537066; c=relaxed/simple;
	bh=V7C1wRGDeYB96OH69ATZxfYBkQSxtsJe3vhCJnlrArQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtUZiVyU7J/0cvLTPXlGCBP9AAGYOge3cYdi0E8mlONaKJHZvwXh3XqOT376iBPV9jS7jqU/m3iRt54MyiyTqj9uYUyRvYegXjC5PfkAlIBpj01drNb9X2dYdapObcqhaITx+MYQ9aMXbZhinzfRKrCaf7MLAKXRsDKYUzKwTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=ovcH25oI; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="ovcH25oI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date; bh=qufCZGf89J0bBw2Z8+PCy7g3L/FvIDyUHG086CVZxqI=; b=ovcH25oIEaDoduQ
	QU16VJCz2p2LlnKIC1GpokAfqPFYFuQyzAxB1IBhhPPYuxyPyHiq8MQbe4WLKWMtJQlx9TGyXAAru
	kXEcBZ88CpG+jLQHPllgcorCvMSOh5krd3sbkeRzwatVcKl9b/OSVETs7roVoLIArV8xObzxQKMjE
	gx7S9bGbAr+qX2jRZWS7T1rvT6J9kofSWwQHegVqh1ZMfgqoCyLZP5S8urIrXR9kh7EjosnuEum8/
	NEPmL7syJxi/uUtCTmIguYCAUpWtWQsBRFLO+2GEnX4ZmBeRE5f8A/5ByibcTlp5vjicgtFV75mUZ
	7DGCuElg3emFd3vrwjA==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-01a0b56912a406c78) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJjzc-000000005Rl-2i0L ;
	Sat, 07 Dec 2024 01:52:24 +0000
Received: from [220.233.184.101] (helo=rpi5)
	 by CMR-KAKADU03.i-01a0b56912a406c78 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJjzc-000000007Sm-0nD1;
	Sat, 07 Dec 2024 01:52:24 +0000
Date: Sat, 7 Dec 2024 12:52:22 +1100
From: Stephen Gordon <gordoste@iinet.net.au>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
Message-ID: <20241207125222.7aeedbf6@rpi5>
In-Reply-To: <3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
	<5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
	<cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
	<c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
	<3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Envelope: MS4xfPvocxW1W9kVGhU7N0bpyHzTyoOwPvg7wjdpozmhzayEuzAnjcKCk0y2m5izVz+2i4POjnozrUEGI+R5n73VwhEbS9SqWhavtWp+BrURIlR4NhYYKzRr +xlTiBO6DtdNmXyNxG5RhH57EMwbxhSl5aMXZBIZfHE84CKCgWZ15PGAjSzrU8dKxacRP9OPmk3+wA==
X-Cm-Analysis: v=2.4 cv=WPh5XGsR c=1 sm=1 tr=0 ts=6753aa58 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=VwQbUJbxAAAA:8 a=4jraHwQkAAAA:8 a=nGUhcJtmcE0aEDaiG9YA:9 a=QEXdDO2ut3YA:10
X-atmailcloud-route: unknown

On Fri, 6 Dec 2024 14:13:14 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Sat, Dec 07, 2024 at 12:16:28AM +1100, Stephen Gordon wrote:
> > On 6/12/2024 11:22 pm, Mark Brown wrote: =20
> > > On Fri, Dec 06, 2024 at 10:54:43PM +1100, Stephen Gordon wrote: =20
>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Force clock consumer mode =
if needed
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcm3168a->adc_fc && dai->=
id =3D=3D PCM3168A_DAI_ADC)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ms =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcm3168a->dac_fc && dai->=
id =3D=3D PCM3168A_DAI_DAC)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ms =3D 0; =20
> > > The clock consumer mode should just be configured via the standard
> > > set_dai_fmt() operation. =20
>=20
> > I did try to do this using simple_card and I documented my attempt
> > and why it seems to
> >=20
> > fail in this message: =20
>=20
> You should use one of the audio-graph-card bindings for anything new.
>=20
> You probably want to fix the formatting in your mail client, it's
> doing somet very weird line wrapping and inserting spurious blank
> lines.
>=20
> > https://lore.kernel.org/linux-sound/b64a630f-d71f-49ee-a5e7-ea1e3a7f8de=
5@iinet.net.au/
> > =20
>=20
> > Basically, simple_card appears to set the CPU as producer if you
> > don't specify a =20
>=20
> > producer. I am not sure whether this is a bug. =20
>=20
> Well, if nothing is configured it's got to pick a default?
>=20
> > Also, there aren't any examples I could find in the documentation
> > of DAI links with
> >=20
> > clock consumer on both ends, so I was wondering if it is even
> > valid. =20
>=20
> No, that's not valid.  The CODEC is the clock provider here and should
> understand that.  I *think* the audio graph cards can handle this case
> by having both CODEC DAIs on a single PCM but I could be
> misremembering and it may only be the DPCM cases.

Thanks for confirming that a link must have a producer on one end. The
challenge is to configure it so that the codec end of the DAI link is
a producer, but the dai_fmt on the codec's DAI gets set to consumer.

I'll try to do this using the audio graph cards.

Hopefully the formatting is better, I have changed mail clients.

Stephen

