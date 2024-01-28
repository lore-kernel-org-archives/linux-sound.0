Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB071EB29
	for <linux-sound@vger.kernel.org>; Sun, 28 Jan 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706438177; cv=none; b=sPV3HP8mr+MoVhMM5RRNpjU5Ty1a6CoyUoLuYDhpN8K2h81kLA/weWan3MEIwajQayeyNL00i8+QQSm8Lx1qKYKCUT4mSHYwv+rSLgPgievBQO9gQNu6t49y3XV24fxkyG2Q91olpoLzVaaTygZBETqoUcjbc8Bfcbixaga7+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706438177; c=relaxed/simple;
	bh=PysUJPrwPRAXP68I0Rtgzr/rQ87OE0GEwEypUvcROZY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHhuneMXI/sbpsS8a2YXIzpxDGkkY3R8qmkRUyvpPmPJXo2Vdm9UJei56O/Dv0QKQ30oQUQQ/YJHfSbcBcEHxH0WZ2MXD71yHFgtRirf9yvbM0uWa3lzn3SRYk+4vqviCAvVKoFbYdIHxhIWwdPS5q5SpClSnK4nyFb5pVIsJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=cBr2EUHG; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="cBr2EUHG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=PysUJPrwPRAXP68I0Rtgzr/rQ87OE0GEwEypUvcROZY=; b=cBr2EUHGCNw5UEGiI5CyMWbIT2
	YH18//bEtOQbWnCzx4gp3HTkLRInpeWFots+4bQ077lmFWuou51Ir2belmEXAehRjZceGO5qpD3Tu
	fjnu+NnTrOalfRO14btCQQoytAK5phuK7QK0jtPZb+jaRYW0GmjIl9kbO1mzW9N5y1lM=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rU2WC-00000000AQ5-0S2l;
	Sun, 28 Jan 2024 13:36:04 +0300
Message-ID: <3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav
 Kysela <perex@perex.cz>
Date: Sun, 28 Jan 2024 13:35:51 +0300
In-Reply-To: <87mssw6sry.wl-tiwai@suse.de>
References: <20240123134635.54026-1-alexander@tsoy.me>
	 <87mssw6sry.wl-tiwai@suse.de>
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

=D0=92 =D0=92=D1=82, 23/01/2024 =D0=B2 15:14 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> > On Tue, 23 Jan 2024 14:46:35 +0100,
> > Alexander Tsoy wrote:
> > > >=20
> > > > Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock
> > > > selector
> > > > inquiry for single connections") we are already skipping clock
> > > > selector
> > > > inquiry if only one clock source is connected, but we are still
> > > > sending
> > > > a set request. Lets skip that too.
> > > >=20
> > > > This should fix errors when setting a sample rate on devices
> > > > that
> > > > don't
> > > > have any controls present within the clock selector. An example
> > > > of
> > > > such
> > > > device is the new revision of MOTU M Series (07fd:000b):
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AudioControl Interface Descriptor:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bLength=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 8
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorType=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorSubtype=C2=A0=
=C2=A0=C2=A0=C2=A0 11 (CLOCK_SELECTOR)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bClockID=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bNrInPins=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 baCSourceID(0)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bmControls=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iClockSelector=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> > > >=20
> > > > Perhaps we also should check if clock selectors are readable
> > > > and
> > > > writeable
> > > > like we already do for clock sources, but this is out of scope
> > > > of
> > > > this
> > > > patch.
> > > >=20
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217601
> > > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> >=20
> > Thanks, applied.

It looks like this patch will bring back problems with Behringer mixers
[1]. So we probably should revert. The mentioned case with MOTU M
Series should be also covered by "Support read-only clock selector
control" commit.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D199327
