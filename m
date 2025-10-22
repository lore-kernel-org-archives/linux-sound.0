Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE3C30F54C
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123702; cv=none; b=di3osoTYrJsDzI8349V5QkkyWNW2KHVCEu0h4m2hu0MovF3nIRtEzt1GFABlBV80fj/cLH86+zKAHLQ66cN0Ml2AhHzHFOuNza6y2QeP8I3oAUDn1T5MdEE6HL1pMy0L1LtihUJHvwDl6MkvD+dKw+IfXr1owflHuYtmGam+nD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123702; c=relaxed/simple;
	bh=exW8I+sKNQk/2bOIgYQgH83ArjIfH8n54jVGuR5uqLM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8nQ0H7KrpU3fDNn/YJezlRpwzVVbJoGMkiuk27Hf5rvullSYZmj4wunIwKnTu6HOC9nzk4gZwg3rkSGMTUFezgCaQZwAhKHSpvEYdYW3lytq5WG1aXvAOvzyvngd98pc9n1GD/EVQJuJxXdcxRg3YHgKTvJpn1lRZjR74AOA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=jTvI9p+q; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="jTvI9p+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1761123682; x=1761382882;
	bh=exW8I+sKNQk/2bOIgYQgH83ArjIfH8n54jVGuR5uqLM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jTvI9p+qUfzjkQlnfYuz3jC43dYwLCHduIct2bDadI4ZmHp973JcLUC4BX3Z5ukIa
	 lUkW+3IX5prRKeAEi8sPS2LD1iFyYkS+YrpEaodlzFqu3a1E66GFcw+gztQIJ0f0VE
	 vXh8NAbb+wfbecpZTzrRNPIr7hgIG4gLTMXyzs8pWswM88ysev+lwNqvTbtA+wy8fV
	 4EbyLUIO1ZLLoB7GSDZ+p3DZuYBHt+wrdQ4xYIZUseGw+ObnNtcMNIQC9gH8Gtdrf8
	 Jrymxj88wBinwhSK2c9HuNDMbHYc+e8Bl8Q5nH8nSnOFNrUO3hZntS/qW5eXbfy6yQ
	 IZM6sE/cRT7yg==
Date: Wed, 22 Oct 2025 09:01:18 +0000
To: =?utf-8?Q?Tomasz_Dro=C5=BCd=C5=BC?= <tomasz.drozdz.1@protonmail.com>
From: =?utf-8?Q?Tomasz_Dro=C5=BCd=C5=BC?= <tomasz.drozdz.1@protonmail.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Realtek ALC897 - no 5.1 surround sound.
Message-ID: <WVwbXybhbdHdGv4lpPCFz_52Ls7g3ShVFnHdDvJKgAeP4nZQVw2pEuxIhYby9V9FA7HGBK6DCrNJsRrUvDV5RaUuIObpufcaJEDBEeGZyVQ=@protonmail.com>
In-Reply-To: <WpC4wmD50rlPuivdEgS0NV22vN6CliRVVqhTaCpmVnY0D4ejo4Ny34F0hO5xaYWunIhVTf5O636OrGRzy3tyA5Ews6KHfWwmckXcHOIvhKo=@protonmail.com>
References: <WpC4wmD50rlPuivdEgS0NV22vN6CliRVVqhTaCpmVnY0D4ejo4Ny34F0hO5xaYWunIhVTf5O636OrGRzy3tyA5Ews6KHfWwmckXcHOIvhKo=@protonmail.com>
Feedback-ID: 6711154:user:proton
X-Pm-Message-ID: a22a4a68eace4a375f58261e61ba86a54af9ecbd
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all.

Anyone - please - can I get any info from you like:
- we heard you but do not have resources to look at it now
- we do not plan to add support for Realtek ALC897
- ...






Sent with Proton Mail secure email.

On Wednesday, October 15th, 2025 at 8:35 AM, Tomasz Dro=C5=BCd=C5=BC <tomas=
z.drozdz.1@protonmail.com> wrote:

> Hello all.
>=20
> I use Fedora Silverblue.
> I have: 7.1 CH HD Audio (Realtek ALC897 Audio Codec), Nahimic Audio, as m=
y sound card.
> But unfortunately I can not set it to work in 5.1, 7.1 surround mode.
>=20
> I do not see my model here: https://docs.kernel.org/sound/hd-audio/models=
.html
> so I think it may be not supported by Linux ?
>=20
> I have asked for help:
> - https://discussion.fedoraproject.org/t/5-1-7-1-sound-speakers/156932/5
> - https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4788
> - https://github.com/alsa-project/alsa-ucm-conf/issues/590
>=20
> and they said I should ask on kernel mailing list.
>=20
> What more info can I provide to You ?
> Can You please assist, help ?
>=20
>=20
>=20
>=20
> Sent with Proton Mail secure email.
