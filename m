Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21F5D475
	for <linux-sound@vger.kernel.org>; Thu,  1 Feb 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796825; cv=none; b=K+EUK86ajOzQQqTxYIYBKJKrWgLKdQtUFNvon2It47K46b5s9jl9cgqyMH7bzrqCA4biibGKHHv1RNcBn1GxTvrMMskAyi9c6JyEZUuOL2bwBsFt88+J7sggBoOzjKLXL+vBWw4PcDSYF5+jjenkW5decVUWqPLKZ+4uglExEGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796825; c=relaxed/simple;
	bh=ECkhvJTSiwtqcsjiUJstiQ6wao8GGDI7wuIUzGHetV0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opuR5hOFVX5JidzSTtwQUUEupadw3hCnCKGzh4uAWv1ejL6SczYzbdwDGDcQWcfYb5J4ecxJpSlS4zLMNVBZuJpgniDbPBvfXlVJu3jz++QcHaMl2vyya8UXhaLyLpEmaGjZDIWbK8ZK6AB0WMLo7+irvP553UJOnpYSa+7o2IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=TBIluyxF; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="TBIluyxF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=+NSjZq6XHGcqL3FInz/Fdm3h+tMVGOHalEiYvpOjEMU=; b=TBIluyxF7nJjqWEALZtEgWRGxM
	foFyCfB+4Xn7u2CDvVkjj6GcqDC9oNQsAnYU3kJSAWwtZplBhXtNfFGIH1ZpTYIBgnHGq4R0xzRII
	KwqgFDotJq8j5PHCb+l4KF0rW9CnNwM/HIEUexnG1d8AMY24qyUDdPtlFfM4G/jfw+Yc=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rVXov-00000000zUI-3P8O;
	Thu, 01 Feb 2024 17:13:37 +0300
Message-ID: <63f56132a10263e29a7b667225a756e3ed4223dd.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Ignore clock selector errors for
 single connection
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Takashi Iwai
	 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Date: Thu, 01 Feb 2024 17:12:51 +0300
In-Reply-To: <87le84z6t8.wl-tiwai@suse.de>
References: <20240201115308.17838-1-alexander@tsoy.me>
	 <87le84z6t8.wl-tiwai@suse.de>
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

=D0=92 =D0=A7=D1=82, 01/02/2024 =D0=B2 13:51 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Thu, 01 Feb 2024 12:53:08 +0100,
> Alexander Tsoy wrote:
> >=20
> > For devices with multiple clock sources connected to a selector, we
> > need
> > to check what a clock selector control request has returned. This
> > is
> > needed to ensure that a requested clock source is indeed selected
> > and for
> > autoclock feature to work.
> >=20
> > For devices with single clock source connected, if we get an error
> > there
> > is nothing else we can do about it. We can't skip clock selector
> > setup as
> > it is required by some devices. So lets just ignore error in this
> > case.
> >=20
> > This should fix various buggy Mackie devices:
> >=20
> > [=C2=A0 649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> > [=C2=A0 649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> > [=C2=A0 649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> >=20
> > There is also interesting info from the Windows documentation [1]
> > (this
> > is probably why manufacturers dont't even test this feature):
> >=20
> > "The USB Audio 2.0 driver doesn't support clock selection. The
> > driver
> > uses the Clock Source Entity, which is selected by default and
> > never
> > issues a Clock Selector Control SET CUR request."
> >=20
> > Link:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-=
0-audio-drivers
> > =C2=A0[1]
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217314
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218175
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218342
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> > =C2=A0sound/usb/clock.c | 10 +++++++++-
> > =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> > index a8204c6d6fac..60fcb872a80b 100644
> > --- a/sound/usb/clock.c
> > +++ b/sound/usb/clock.c
> > @@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct
> > snd_usb_audio *chip,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 !writeable)
> > =C2=A0				return ret;
> > =C2=A0			err =3D uac_clock_selector_set_val(chip,
> > entity_id, cur);
> > -			if (err < 0)
> > +			if (err < 0) {
> > +				if (pins =3D=3D 1) {
> > +					usb_audio_dbg(chip,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s():
> > selector returned an error, "
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "assuming a
> > firmware bug, id %d, ret %d\n",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__,
> > clock_id, err);
> > +					return ret;
> > +				}
> > =C2=A0				return err;
> > +			}
>=20
> Hmm, what's the difference of the behavior except for the additional
> debug message?=C2=A0 Both returns ret, so I don't see how it fixes.

If pins =3D=3D 1, then ret is returned, otherwise err is returned. They are
not equal here. But yes, the code is a bit confusing.

