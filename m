Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC422EE8
	for <linux-sound@vger.kernel.org>; Sun, 28 Jan 2024 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706448441; cv=none; b=OAkw4ul6b4E6YGzRWKYmoqWAu5UgjGf0zV2RiuCm/yJJk4Fip6ccj6DJOdl+qRDhyKToZMuO1xkAoHhPkOvshiS9rAU2/IjjNQCu0paFPLjqQjQX9wJHNg9V7b9cRruUrJNH1lI9wNcuYjf99F5flVJAORdiySdyGXpwwv2rVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706448441; c=relaxed/simple;
	bh=wjtMckO8PW7oVoKjaFJ2U9jTcutNCSldHHN5+gEojZ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uN7eRdKCuxOxkLixGG9mt1MgBtSOc/iyS6UDIVPTJ62A/G/wJU3B3RmZEivn72NUiFZF8n7i+63B6ZF9nMTe17uhHytBcZQQ9J+09eaHl19xQP4rTPhh1kfwhjCMqGeMsTrfKkEL/SECbgWdtDVsyN9dWdcHt0KDcVYbQu7DxiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=Ao/oJIHg; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="Ao/oJIHg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=wjtMckO8PW7oVoKjaFJ2U9jTcutNCSldHHN5+gEojZ0=; b=Ao/oJIHgR66n62eC4k/097uYo9
	mk0Ytddd2Ni4rU8S7wcGPNyH0NMhp0AaYxNgpns1gnZV0gyMPBDcjUOuwQl8DfQwyZ835gC04q9Zc
	Cl4sEHDSH6RrLbjjGQbNiffcMJLuPmGDzEkN8qR+s/F/b7BDiRtbbzw6B0l800z0F3CE=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rU5Bt-00000000B6x-0PxE;
	Sun, 28 Jan 2024 16:27:17 +0300
Message-ID: <d2273d0ac541c82025a01b137bc956ef6fed9261.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav
 Kysela <perex@perex.cz>
Date: Sun, 28 Jan 2024 16:27:04 +0300
In-Reply-To: <8734uhoe0a.wl-tiwai@suse.de>
References: <20240123134635.54026-1-alexander@tsoy.me>
	 <87mssw6sry.wl-tiwai@suse.de>
	 <3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
	 <8734uhoe0a.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: puleglot@puleglot.ru

=D0=92 =D0=92=D1=81, 28/01/2024 =D0=B2 13:09 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Sun, 28 Jan 2024 11:35:51 +0100,
> Alexander Tsoy wrote:
> >=20
> > =D0=92 =D0=92=D1=82, 23/01/2024 =D0=B2 15:14 +0100, Takashi Iwai =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > > > On Tue, 23 Jan 2024 14:46:35 +0100,
> > > > Alexander Tsoy wrote:
> > > > > >=20
> > > > > > Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the
> > > > > > clock
> > > > > > selector
> > > > > > inquiry for single connections") we are already skipping
> > > > > > clock
> > > > > > selector
> > > > > > inquiry if only one clock source is connected, but we are
> > > > > > still
> > > > > > sending
> > > > > > a set request. Lets skip that too.
> > > > > >=20
> > > > > > This should fix errors when setting a sample rate on
> > > > > > devices
> > > > > > that
> > > > > > don't
> > > > > > have any controls present within the clock selector. An
> > > > > > example
> > > > > > of
> > > > > > such
> > > > > > device is the new revision of MOTU M Series (07fd:000b):
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AudioControl Interface Descripto=
r:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bLength=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 8
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorType=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorSubtype=
=C2=A0=C2=A0=C2=A0=C2=A0 11 (CLOCK_SELECTOR)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bClockID=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bNrInPins=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 baCSourceID(0)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bmControls=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iClockSelector=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> > > > > >=20
> > > > > > Perhaps we also should check if clock selectors are
> > > > > > readable
> > > > > > and
> > > > > > writeable
> > > > > > like we already do for clock sources, but this is out of
> > > > > > scope
> > > > > > of
> > > > > > this
> > > > > > patch.
> > > > > >=20
> > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217601
> > > > > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > > >=20
> > > > Thanks, applied.
> >=20
> > It looks like this patch will bring back problems with Behringer
> > mixers
> > [1]. So we probably should revert. The mentioned case with MOTU M
> > Series should be also covered by "Support read-only clock selector
> > control" commit.
> >=20
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D199327
>=20
> OK, care to submit a patch to revert it?

Sure, done!
