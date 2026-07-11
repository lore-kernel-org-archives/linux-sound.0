Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B0EED8
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732191; cv=none; b=rKjWlIq5DORIVY+eCyUZ50BMBYUPe+FOUyiRjcqHaT8MwoZy0xcWZbdNA2f378aiz6853rDU6ofI7ZfGM4tvbEWVCnntbWTEz0Y9nqBTqrOobuQU4xvwMK1AOB3NLVBfqDufdBU9S990JDRlgYJ+EDwt885VzWDFrf5ysXxJhtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732191; c=relaxed/simple;
	bh=ug0y6mP0R212IqZ960j7rjGANnGythjIR2K0a6Zc8y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ru0+eLCo9WBl812OP4e1LATbXwvKauWEveQ1w39T5zXyTpb7Z+BDN6IdeHKwAZwWkU00HqtGAfK1Uq1WxRrv6QwUfNkH26cVXmzI2CENG9qOQzA+KarZNPGZncaCBwC69d4RiRhyuxgn1nbxXQ1GYT7P2lXyKnud7vTnAfU9rD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmCvuePy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmCvuePy"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38175907a56so2076895a91.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732190; x=1784336990; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVwzljcoSLFxXAkpDsnmneyS1Y6KkO0TnKfWfmJr5FY=;
        b=FmCvuePysZpdjnBYDNE7RllTCDspht+x/Jvxs7fHkmGCmq4thjGriIs1Hzj8Qg1DYe
         kIDza0fZYrysxC6i9UAbqrzARD+2Etn4dX43NJQK02xbXSXuAZO14F6igQD+GrLNuYRD
         a/B2ou/0D+s4RgGUvSy99veVhrbdlyw9dvEwmKcr/T9tFq8huwZwhazTsW72+IEPLnWt
         fwa7NKfSqCBsvJmqSHv8VVDZQ+bS9XXcZaft2j1ldkLwjFpUht8Zyk64vvKsMLwjWV+6
         8iMd3oEkUXU5p0LXSu4ZOAM9VgPc4jY5HRlSYUkc30S1vH0NEss8mXrqw2/QGtNezSJ3
         GdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732190; x=1784336990;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVwzljcoSLFxXAkpDsnmneyS1Y6KkO0TnKfWfmJr5FY=;
        b=QKqqR/x7v3Y8HYzZ8lLGQogRN7KzXJPzUL9tmsQISDCKvHbMcrmd6l2SOvllpMm3AN
         8M/t35VN3URbG3uR9zw8WyD8cdDjy1BURsgOxY3zStkxdxAef8Tw4wRP24ErNz16jnNw
         FNj054N6m0l2SHg/YlsIPFBradoa2RqaUOBWep1ewQVE9kGDCWNW5MwuA9TituNWKg9z
         Z3HpwqJvEykycNmlSXPSGd7KjW7GLK/OJhss21OhQj2tJUUvcCbUhUWlKaInnqPFzucN
         jxuE4Al7mbQCeSi2sa19eouI3kvGJyGSSQYwtEumv6zcGyvQO1xFI/L69FDUk2PZFrXd
         pXOQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7HYcMiJdUHXnCIXOtOmglgskYZIBjDXDN5B+dBwxYsEA0qMj52eMID3Iv3KZFOwvh3ZSu1XgJrggSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkkeU5jMJh2XZskoN/FJIzSUAgjkQtWOSqqCmyLiyzxfuQ5Q9S
	Z10shximaNzC3u/NHBf8chKf5lwh1uruYT0JHgeoIiNPN0tV8mPTM2hW
X-Gm-Gg: AfdE7clydJQx2sVoauVVbzcnUP03OUzlvGbvlBOLAV+3B82zywiQa1W3wDGvmjVh8Gr
	KkmXb0bvlFkf95aMBUinATuOROPXu/GftNLDXbEamGLh5WFaHNvoBvDZVhHAq4AMlJgH+UeK9ai
	kcoPsV9T4KC8oSUXuPVs7VNuVl7RMmtxT5NYEckXUzFo8Q3shqFgnaGR+oU1J7mwqK14cwzWcQT
	M6XOQCR8srzN8CY4X4liBH60adP+v1Hfh1UT/XshGO9FN+NMa3S+f+sqt4pDcjA36iOk3avolgY
	7LV/hFomyCWs62ylhLxijLhfKizU9q7Wn31SdQIewlKcptlbEHg1xKplpZfh3iWJAMEJExrURlH
	r2lEMRsGhyHPHk+yBNPfR6lscRh386Irryqt9XigqWSN+k+q9uAJ9ziT8MDflDNuH4FNu3N7AxT
	Gv6IBoMwjyUd6fc/ipJgpZYXuGCp+/RPWnKR1afJ1LoijBs3JzLhn/QoWOe71vC/ilAFIPsDFTd
	kEo057i7/4dEbXVDUQJ4/ZQ89tM4jQS1Al1ZfLp4nvmP2mSpp4BIJLfHp9pO0RcO5s=
X-Received: by 2002:a17:90b:57ec:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38d16085723mr7470659a91.20.1783732190004;
        Fri, 10 Jul 2026 18:09:50 -0700 (PDT)
Received: from minako.localnet ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm27882042eec.8.2026.07.10.18.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:09:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject:
 Re: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S capture on the
 frontend
Date: Sat, 11 Jul 2026 11:09:44 +1000
Message-ID: <6zRExDMwSfK20K7px8nPtA@gmail.com>
In-Reply-To: <c9bd227a-cc37-4fd7-be3d-b7502f52fbfc@sirena.org.uk>
References:
 <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
 <178370665528.82617.13561476084775898427.b4-ty@b4>
 <c9bd227a-cc37-4fd7-be3d-b7502f52fbfc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, 11 July 2026 8:24:11=E2=80=AFam Australian Eastern Standard Ti=
me Mark=20
Brown wrote:
> On Fri, Jul 10, 2026 at 07:04:15PM +0100, Mark Brown wrote:
> > Applied to
> >=20
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> >    for-7.3
> >=20
> > Thanks!
>=20
> No, it's not, sorry - I backed it out due to the build failure and b4
> can't tell it was only pushed to my ci repo :(

Argh sorry, this function moved around the downstream driver a few
times and the branch I used to test these patches at runtime still had
all of that churn in it...

=46ixed for v4.

James




