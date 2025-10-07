Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021911B4F1F
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759838204; cv=none; b=ZiOEVwFY4uWQi50zdqAcOABnjEP+b66ynuW5tB/Oxb68M6CWRl0qSY6kv6tWwu4cRE+Zp9i2bPMeTfg/u9/vYFX88QxFVV37Jal+f7/iOLhNLV8xvZLpNOPyvPjyDqzeJSUKv7ENEOEfhS42DT4IRmfFAvtGBynxfw2VpYl1Ha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759838204; c=relaxed/simple;
	bh=nDnAQgr0ehcQfLdJbw7+Vc9h3ifViIBS7JXVbBJKbvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASma0XFgm05rYzDDC73aE/qXe2gYWqhhUr4lhb2i+PrE7pE+yMq3vPoQjCPrejNoQdqdR533ddvBS0Psc2NmOpHdT3EI5vsiQFYB73iq+L9oK2CHnTRC8iOsEGf97I1ckrU/rSt4r38607ZLFfLLsagmAzaVr/nAtosBnLbGWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAnCErPz; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAnCErPz"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7a7c1ecd433so3368661a34.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838202; x=1760443002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDnAQgr0ehcQfLdJbw7+Vc9h3ifViIBS7JXVbBJKbvE=;
        b=IAnCErPzEexbl0VXmsBkVwT1/JShIy1f+RzlRiT+iec/1Em3wyz6n0n/rWVMev1GZE
         1PzQv1u/SHK5QbTkgLqZtfjYvbZwiRD+jJUlSl/VgBVPJSwZ0WMYRufe7ZOrqL7esJWS
         Pe4E/fE098qTgNud1tJE9mmUhSnTts27SZsKuYID8NduW6MkzYjM0HNTrzK6hxjl8TAI
         4n+DWajBvGMOS2aMdJzHkZlC4gpMsJtYM4czROaVRX2X7gJY/L5QVBw1sgvpUyB/Kg7S
         42x/h9ylzOWiWd0MhvFtAQZaxV/+SEGpfHcovloke+g/l8d8r33HQQzb8Bq9EzjfdAbb
         v8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838202; x=1760443002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDnAQgr0ehcQfLdJbw7+Vc9h3ifViIBS7JXVbBJKbvE=;
        b=i0FvXTU8GGcYCOd/rEWOvTK/sfgsscVKxxTJhiWwaGXIyRftgFzVq5T1CWONXtfkWs
         Gb8Q1CbhO10+P5PdQSlx+R2Tn6jCa7r4dpX3C10XuoezmNYN062J6FXsJs1+6DhLMI25
         7wMoe4t4XHFsrNe1drcmkqu6U3D6NNS6o6OTcqlt3xQC4ymHXvW5LHQeWcqIsztUe4LE
         omNLCEs6cxWhAkbte+NLQb6PYqYUI22/AyJTOvBsy6CLd6d4DExiThxeJNAis4OsrjNx
         f2clV8FYNaeuLXoKEnNBLZw8I/dh8iM1+p1vy8aJBPz/A3d5r+ByVVfvKbxMdH2T/Qvu
         9exg==
X-Forwarded-Encrypted: i=1; AJvYcCVnMA2SBGisXIW6zL13NjVCubAq3iCQ0GRbeb/zInb88OdT3nDKB0f11bXyTMPnSxusJ/EYx05oELNLTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMheNEZ59wr0ACm1MFULEb44crSsDAuOF8fSrwIrv8yViEmVyy
	ETyJr9vNuDVzN7cBwHFK2LK98N4G2NqmW5Ri1tBcavZqYOd1RAP7ojOq/RNtCyNpKtf0BbNHm8Q
	vpzkPgZrovNf7Lt33V01z8YbF43K3ML8=
X-Gm-Gg: ASbGncvWmTh2Ultc+aPvSLoc46s3+sNpnZV1JjUbWij4VCfOzFZIWmK0tPk9v4SzC/X
	sdHUFWMmVb2VSXBkfBFrBEgb4qPnLeSggvgtkhW7gnP9osRDa4seXuGbChdN2JYyXuRI17H/cOX
	NKEOEmygSPt+73qCT37crFjpd0UGrsALTvrsnjy6P122B9cVDY9+noxXqHYjf4UArMWQEy1zRix
	XvRqaqwN20Cc9UnouHDNVi1vfD7LK4=
X-Google-Smtp-Source: AGHT+IGf1SyOfC0WI5vDsH1aFSv/+54kbpC2ajcfxHOjA2QxNkQPutmrcDALkOHUhMYn8vqOvC01ofPAA4sM3QF72MU=
X-Received: by 2002:a05:6830:3786:b0:748:8b42:77ab with SMTP id
 46e09a7af769-7bf770d4574mr10925867a34.0.1759838202064; Tue, 07 Oct 2025
 04:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <20251007113305.1337-1-briansune@gmail.com>
 <5a71fdac-f6cf-4557-9bc8-d416a033263e@sirena.org.uk> <CAN7C2SCHirxurUA0n2VZKEEiYCt-NUKgspGFfZLNurHhACZkBQ@mail.gmail.com>
 <3266559a-8403-4a26-bbd9-c54e27fc59f8@sirena.org.uk>
In-Reply-To: <3266559a-8403-4a26-bbd9-c54e27fc59f8@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 19:56:31 +0800
X-Gm-Features: AS18NWAu7PJlkBsOtE2R4WdatURJdL0LNgBsmKGMTutcvQMQA045NJ06MTP4Ums
Message-ID: <CAN7C2SC96jZYYGP=DFrSKgtEfxy+MYpM7=-iW8YKhDG81ufw+Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 07:48:11PM +0800, Sune Brian wrote:
> > Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > > Please don't send new patches in reply to old patches or serieses, th=
is
> > > makes it harder for both people and tools to understand what is going
> > > on - it can bury things in mailboxes and make it difficult to keep tr=
ack
> > > of what current patches are, both for the new patches and the old one=
s.
>
> > Sorry for this action. But this patch is just a title fixe according
> > to previous comment.
> > Patch body is fully aligned to previous revision.
>
> > May I know what is the proper way to amend the title?
>
> The title is fine, the above is about sending the patch as a reply.

Got it, when title amended version is sent, need no reply with
previous revision ID.
Thank you
