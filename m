Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367D86341
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 02:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783217142; cv=none; b=sWu54I9bUwUNVotsXt6eQCtfoPSVSb1aIRkyxjSm5lk2j7T682M1iUTZ5sIUN3NT/ByMQ2nL/nkAswVq3LAmetl2Hz8nbt9OAl7N/gWFXb1vvWubdqeOokd4Jf/BaKWdjnga1+9ZosXHs29ZY1ZujNV8MEhOUJKCfrCf4VzmzNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783217142; c=relaxed/simple;
	bh=so+yhVCvvaIqqGt6b6i9YWmP4WE6FyTqPwNSmqlViWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txkiBoZWweMIX+xbBBS2uJsveWn203Kt+gWaiU6aqYM7NoHAurAKmj4D0SG8pF1vL5p5iFadNGo/ZaYYJF98jJ9D8SmWZaYe7p7/zsIFhogZR28kebCEKaC/BCfA2XsoCeI8EuvNypV4lioqTvDxvxrz/Qq9tCKqTXJLSvD4+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKcHy2sw; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKcHy2sw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1628617a12.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 19:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783217140; x=1783821940; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKocKtEz1RsMH+lMlj2oc8msPllSiCeLmatH4dj48Vo=;
        b=AKcHy2swoiARF6SHujuR2GIVY+7AXxaPUBSkMQTV0HnDzhDTphbn5P3SRivfmFY5ix
         SIo78aL2e5peyqC1O6ps0SsGj7YHXMPYBlnAn4xhoY08Sjyl/82LC4de78wKqtLxrH9N
         mCkU7HhU1xY4aYzO/k53u9JYPBsEafFyzisUvgzKJGS7yQeuX+g08Z0ohucoQ367J5TE
         0ya0dVUfWGF9NSS7fX4Ezy77AmDg2JmvV8FGEzfB7RTvqBvWZpFYyjrryj3uWdc3BvXU
         xqQIEqh7tAw3/SRFBHtxs2u/4n91YVW0yXTUiWQuODNjx1qQZFVQs2S9Z8vTCMfAq+wx
         azTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783217140; x=1783821940;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKocKtEz1RsMH+lMlj2oc8msPllSiCeLmatH4dj48Vo=;
        b=cuNlxQGTudFAY37RViczvotWnmNZFTWCwOnNmEnWaxba4Da33m8QGnErhvGj2FFL7P
         mBzPhzi8WP0DSyZGj+us00t2pTtFGW6GG1GW41weUTwRxbgxQHOdprgswJtlbQ154Ey2
         N4YI6TS5FGm2Na2spl0d/2YYKffgwFNTr0xRWmiQRT2vnNKXJbZrXzqXAK3buABOWUoK
         /zMzHQAQkCZTyFxKFcGyRH2pI8Vl5OPFAuG+jV3uUFurNV1lRP7XiHxBs64SG9IfblKM
         9gVXZIDgwR6jUjuIPaXxrpwBbwb/BIJ0zhSYxdsSTCmhpkhlFs5t2wCG7n/TsBJL8c5Z
         yqVg==
X-Forwarded-Encrypted: i=1; AHgh+RqwnQCgK8wqcVvK8VItUVghn9m6TO7VL3UUdLTLlB0+JkLHVv4oLcFDsSB6XPm/F6F318rzz9XFR8ciRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUo613SfHhszRGef1GNu/gZa+nLHW4+/Ctw4p+JzmuYse2JMJ6
	KYVcGzzZbm+Ua/dFTHRP0DDB6Os/U3VrrUCi6pvgFNyy+Nk4rxvj2yys
X-Gm-Gg: AfdE7cmh3mE2bEDYeP3VC1Z5cZ9yvPlfbrbgoujVEJorT4iL5Z5inYCBKDIGmTkwtvU
	XbmtEcBsE57rgrj6y8Hxj9icW2liX+ugYwp08DZasUox7QsN7Jj6j7kFce/ClxtLHipgea+EEBW
	EX/2Pb0FCtV2j4/XZ4tJ0XXFAbTkzQD+Bh+NkwBACO1G/YjF4iz9AMrJsYVoBH/Ug5YMEbkDVKK
	cENtLe3D/cgzabh+WUdSakvFAfOv9aET4LfHM/xyrPVWeE4W+x5Ll0PyRAcf6uOHJJKMFw/YiGw
	ppITRpL5PgCWa4KonjuTW+j+xnzeTxDmCoDMt9ch6sgUk0rjGS+1MVEHX7y64zV9Glx9lK+3/sc
	5FiDhu2VmcJAdeKX+IRUrbIzrrD0AsiO7ILgf+7HT3Y4IWSKWnVgWzgpz4cam1CqY9chh9ixCG4
	SoZRCE5U7cE3iw8pS8sXpcWjUyP7VtaC21TXJenoTpEOtLUbDwrswZtZXu2e5ygdqA11Akias4E
	iG436EXPyecSHMh1OfNpsIHrokCYPXAoSkJZwNs8XR4SpPCpcjNrNOUlMHwdbbgpt+vyoxovgn1
	ONl0
X-Received: by 2002:a17:90b:3808:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-3829f2f3fafmr4872588a91.26.1783217140598;
        Sat, 04 Jul 2026 19:05:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm27946996eec.12.2026.07.04.19.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 19:05:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 4/7] ASoC: apple: mca: Support FEs being clock consumers
Date: Sun, 05 Jul 2026 12:05:33 +1000
Message-ID: <sCELYiNQSvCxqjQFP0uhkQ@gmail.com>
In-Reply-To: <DJLKAJ8IU0Z5.EU158RDQ31H0@ubuntu.com>
References:
 <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
 <20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com>
 <DJLKAJ8IU0Z5.EU158RDQ31H0@ubuntu.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Josh,

On Monday, 29 June 2026 11:19:27=E2=80=AFpm Australian Eastern Standard Tim=
e Joshua=20
Peisach wrote:
> On Sun Jun 28, 2026 at 7:42 AM EDT, James Calligeros wrote:
> > +		writel_relaxed(port + 6 + 1,
> > +			       cl->base + REG_SYNCGEN_MCLK_SEL);
>=20
> Where does the "6 + 1" come from, and should it have its own #define?

This actually only ever gets set to 0b111 (port =3D 0), and trying to set
it to anything else breaks the machines which consume VISENSE data from
the connected codecs. I will just replace this with a static value for
v3, which seems to work on all the machines we currently support downstream.

> -Josh

James



