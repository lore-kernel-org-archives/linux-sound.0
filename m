Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7294390CA9
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169363; cv=pass; b=WeWCj7Dn6XnNnPvAw3cuhWxdYooxmACoTfInTBfxdNZ+YjrDEdjZiYexBog5TvgH4CkYsGwdMJ/whZyaS/0mnBfZB2Dy+/mToq+G7HGl/fRVrq3ikGHN+b67+zyH7m59qAfJEmwop2GWVlxV/tqIv/VoKGVIAlGL9yqUhSdzqoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169363; c=relaxed/simple;
	bh=VVQ944RYL2jW7osWE+oGkvHI6DDFI+3T6jS8VLXwjno=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SgrFsD9XBZd3pIKjDwULe1FHeJptUJ8C45t2xK32ob72MIHvKQPDy+d6rEXL07PrIJf9tbfpA3lt2Dgq+mTDGFvartlW6wCJF5nX3OJ7kxmLjp1H6XvpOadv/Ay9CtBZ0cbCxdEjCWwqm7uWy6iLVmbvENtMjV8lcCoacQ6zUhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KKcV6RHD; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KKcV6RHD"
ARC-Seal: i=1; a=rsa-sha256; t=1776169356; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L0YXaio/AKDWDgn0Om4mzHrgj1kgt/D1AAK5do32ihoAIsMI0BtcCrWQM+lgebtupRoiAINWU09DRzTRDcOf+9VBOA3FZY+e6lZ7+o27CbEKdxqX9l3HRCcxYi72PqeXRReDoVMb8e3VCHWpxYDz57fTKky7RugMfX0apcAJUEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776169356; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lm9D+uG7QwJZ1yS2gZOsPCH3zGRxdbhbZMKCurunwm0=; 
	b=EsL7ENp/vDHVG3JzdQNJS+ojHrXjCp1YzbRlNQzA+Os/4h/yrS3C+qGkYOHo2+eCZiPogG2z4G3X7k9V69SWXX02662pXIZopZQGQDFRwKHjMxpj9xAVoBZxluQCWSF9hPI3c8+KaBycyi58El0vpTMTtwLuzQFF3LrEJIon4c8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776169356;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=lm9D+uG7QwJZ1yS2gZOsPCH3zGRxdbhbZMKCurunwm0=;
	b=KKcV6RHDz2M973Nml97QjXXNc5cIJvdcHNmL0ZUP1izzF5kDD6ptxXc3vaZhdIK9
	LhuMf+vMyPm/0icAKakBSv5kZkfK2ZK/wUP+KPRv9JHY2atT1YVnIJ2f8wZAEXTijFM
	wgeDyAWbG8aYzWjrAzf0sXPmAdlQ95GYDYYPUYchi813qkFdMESUuK8YHeilthXKDP/
	DKp4kEwfl+Ig0Kjzr0CQu+V+KTRJx17/QWZWCYZq61Uial5XPsUpuB1hw/vDt7qXvff
	hYYV+ERd2yv/W0JhKKykpiE0Op3frLwSgcTJZLwFfkhOTGyN7pU9s7BE6abK5Ezna8i
	RkoNlKHzUQ==
Received: by mx.zohomail.com with SMTPS id 1776169353845483.4215603755729;
	Tue, 14 Apr 2026 05:22:33 -0700 (PDT)
Message-ID: <8768d96b83029325707a43904766651a3e4de362.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Fix missing error handling for
 get_min_max*()
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260414093336.305464-1-tiwai@suse.de>
References: <20260414093336.305464-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Apr 2026 20:17:28 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

On Tue, 2026-04-14 at 11:33 +0200, Takashi Iwai wrote:
> The recent fix to add the error return value check from get_min_max*()
> missed one case in build_audio_procunit() where no error value is set.
> This may lead to an uninitialized variable and confuse the caller
> (although this wouldn't happen practically because err is set for the
> loop of num_ins at the beginning of the funciton).
>=20
> Fix it by setting "err =3D 0" properly at the missing case, too.
>=20
> Fixes: 4f55a85cd4fc ("ALSA: usb-audio: Add error checks against get_min_m=
ax*()")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/ad36dGpCBTGsyFr_@stanley.mountain
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/mixer.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index d4ef45bf53d7..aa6ea3be100a 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -2687,6 +2687,7 @@ static int build_audio_procunit(struct mixer_build =
*state, int unitid,
>  				cval->max =3D control_spec[0];
>  				cval->res =3D 1;
>  				cval->initialized =3D 1;
> +				err =3D 0;

Whoops, it's my fault that I didn't noticed the code path.

I think we can make the UAC_PROCESS_UP_DOWNMIX case fall through the
default case so that we can move the error check into the latter and get
rid of all `err =3D 0'. Doing so also improves readability and prevents
similar mistakes in future changes. Perhaps I should have done this in
my previous refactoring patch...

I just noticed that you've applied this patch to your tree. If my
proposed refactor makes sense to you, I will send a patch for it.

Thanks,
Rong

>  				break;
>  			}
> =20
