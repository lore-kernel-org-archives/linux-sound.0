Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58CB3A8D0;
	Mon, 22 Jul 2024 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721651509; cv=none; b=XyoYMV9j4T/KgiZBIjZR6YwHPWdidyJEjj4IKG+nk4KoJwQS8o17InNfOi8NXy1MuGezeet/Q8ycG5CtNf9KmpesOXZ86ky+jYFjfQT74H1Bd8V9mjzvllJdlp96FJhE9Mal8r6724N1b6elEu5hT0x2WewwPjf6swSUfwaqkWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721651509; c=relaxed/simple;
	bh=BiKjjXqriNc0igBmEkUuZeDzqg3CLyNhLfoLB2fdxm8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=cNqBPMA5UVcvLtFiiqs51o+ZJGvkntmiwyp96h/5taVPrPyUejjkQUOU0FtYL8A8r52UEq58FJdU/UyWOGVj/jdSzWfdNLAaPQd6mdcwduylsFqsYqMdcb1izjtlKM93+HNHWuzAoZo/SmAOsaHYGedqp2Q7rFV5ppkwGqpwuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=nKVNdP02; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="nKVNdP02"
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 8275FC3FBE;
	Mon, 22 Jul 2024 14:31:32 +0200 (CEST)
Received: from zimbra60-e10.priv.proxad.net (unknown [172.20.243.210])
	by smtp3-g21.free.fr (Postfix) with ESMTP id EEA7413F8AE;
	Mon, 22 Jul 2024 14:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1721651485;
	bh=BiKjjXqriNc0igBmEkUuZeDzqg3CLyNhLfoLB2fdxm8=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=nKVNdP02vmdgwZbxloDoc5xxAq+YPXlTxJswZjbU+kE1zN5HA5U8TgqAZs6C7rfRr
	 eVcEYO2FQ9kKk1yn9GOY9iU2BejEIBjyDFkCAEBPNchCKJcHugehvWqZQfx0tDGNwE
	 o4obrIL/FyMKDpxStcUq7jZQIcGYp4q6W/OibzOynS+Evy/3tDsuW0eqpkuss869CR
	 duBoc7fFQwJBeJIusoQHnm5V+9UuHv81WuY1pzs1Qse859XiYVfeOz7BrE5ULmNZ60
	 LrsWhIXrnGy8kychSc8qQBLvtlzUmNXQJaVfqEPtWmneBGXHU9OQRTC3daT4yArzmE
	 IVMoN/yeZY06A==
Date: Mon, 22 Jul 2024 14:31:24 +0200 (CEST)
From: jau@free.fr
To: Mark Brown <broonie@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Message-ID: <1474761635.17820466.1721651484902.JavaMail.root@zimbra60-e10.priv.proxad.net>
In-Reply-To: <d85590f2-88b3-4bc2-b7b8-9f96a5d5bb17@sirena.org.uk>
Subject: Re: [PATCH] ASoC: sti: add missing probe entry for player and
 reader
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - GC126 (Linux)/7.2.0-GA2598)
X-Authenticated-User: jau@free.fr

Thanks for the review!

See updated changlog, if ok for you, I will send a V2

Le 22/07/2024 12:52, Mark Brown a =C3=A9crit=C2=A0:
> This should be in the changelog, your actual changelog doesn't describe
> the actual change at all.
>=20

New Changelog:

  This patch addresses a regression in the ASoC STI drivers that was introd=
uced in Linux version 6.6.y.
  The issue originated from a series of patches (see https://lore.kernel.or=
g/all/87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com/)
  that unintentionally omitted necessary probe functions for the player and=
 reader components.

  Probe function in `sound/soc/sti/sti_uniperif.c:415` is being replaced by=
 another probe function located at=20
  `sound/soc/sti/sti_uniperif.c:453`, which should instead be derived from =
the player and reader components.
  This patch correctly reinserts the missing probe entries, restoring the i=
ntended functionality.

> This detail isn't really needed, it just describes the content of the
> patch.

ok, I remove this part.

Regards,=20
J=C3=A9r=C3=B4me
