Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848762BDC14
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942715; cv=none; b=b+fvDVai2iu5ar6R6lPXyqjOvsVLtuY237ricN76uzyEJZk9PGO7nw7d45w9yRbBY9gW1TDrVVE5E1WeqcJQHFnVNzyZD/NYBv7YY5mRmGJNHk55L0IuL/FiUXIAxIL4t1Ni8uML6gtTRDSjT6pr7Oir/dBlYlLYkz2wdNRG6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942715; c=relaxed/simple;
	bh=sJYQ1HJnmQ5odfjaAz4LPznXnWsyKF0LcwZ35Z86QXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=az6gW1+KjKIKkGwbAg49FGYTKOoYyZAAJaVrhfP6vVEN+9G0ORoejRKlBZQK/NewBwEv5rQMRuVKyj1BWXzc6Wk5daHcmCRdJsHoooINRiyggcvq9PgHOBUHdxgThRyvQ0goLWj56nZ3LOyvORVXk/4iRtwKDsgPcgAtVY0QWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alqEeZh7; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alqEeZh7"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7b00927607eso60194a34.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942712; x=1760547512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJYQ1HJnmQ5odfjaAz4LPznXnWsyKF0LcwZ35Z86QXg=;
        b=alqEeZh7l7T5NBdewUY7JFt0ZI3QCatAMiMTwPiyVB7cgiFKLeDPs1pXPOuMMAu1hj
         J1ZG3ad3ombChPQqmTfOno3jaxGn7UEUsvNVCN8RJdgwoMeAK0VXUul3oQ4ZOexDCmXF
         UFXnpSBFhSlDdvcbJfavzBKwOy0lVe/44ggGV3/Gfp0yMjfwz9AoHW7ofBg77Om0mLCw
         VNB1P6nAoY2irCJMz7a2TRfKN1pSA/lhW8ilfZ/alpTin6uWDhBa2sEL2G+5s1j07ot+
         PIggIDgzmd+EpIyod/fCnNtdBmxeLGVjkvvyPaT8wnjPY6fJl+5QF+6RbfhfsTeMLKvE
         p2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942712; x=1760547512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJYQ1HJnmQ5odfjaAz4LPznXnWsyKF0LcwZ35Z86QXg=;
        b=hLmJAG+2RXSUYti3qnVWLMOn855ZvsX1Qrb97a9GW7eb6yQB4ojN0C/s+5BdE+eoi5
         J4AiU8Fx2E869LXVzDRzTmLea4V+oxV45kT2Uh96otW956uzfQi0gQm0gtuOoYz/hZKj
         81b3bWTWd259RsLf/lgNtelNxlSvpkRcnR4og2I3d57tbjiWUTitp534e1upTtv+Yapx
         JHOWLQ+QUEpOzFAKKoGbwcuMOlEfqdjwsWfKenJfeg6Vy7vo1A/hmwznng1qxtJpQvRf
         6ipMnaxX3YdjIXY0GhZs6GYx2mPUpmnvOrhfsLBHb+pKMD6nvIhWPXp7VkXNAHSKuN+K
         PXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2G0Rph+U4o+nGQnmLGwZEGKvUDKV+reQLm2dkZBfzCkakHOMwkwxChrDQv8K9dJsEm9jMHkLnQfQtgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOHX7unzBK7CRBPMcJqZ3nq/jTWhEWgaT8gQXndLyBzk+tjSZ
	nPk+2dqKD7FOpCAiCmtrX/66pBwtHB6rKmC7Ps/zn4sxLodBGD571pUiPd13X5UgHNzWujEj91E
	9EevIRZEtTwKgqrDawyhU2/OPSXTu2YE=
X-Gm-Gg: ASbGncuDc8dBaDyN8ENrtfLyxdQANRcTLzS446fC9I+a5a9XRO2zeEpJDbIJac2pzg1
	s8+T08uaUAGi5qs2zD8taIKwSf6MBMJWVdQh4BHl10C3bXhlTgLu+ZYGWKs2nK7simc1x0/7OCu
	A356bGKR1LO2lkBDf9SgAj/ZsgfaR7+AKQ7BB4RtimqAiK884+z/Ij188GYigf8fgUIRirZ27l1
	9B4KnU2ONqN5jrAPzJMbESYp39ycaE=
X-Google-Smtp-Source: AGHT+IG2vvJj9wBrBgytS/7u2V7HiM4xVrVDuJl/IHxrxqkylGm+rIGdQByMnc/GkSWkP3WikChxE4dg0y9mSw8tzFc=
X-Received: by 2002:a9d:73ca:0:b0:7c0:e0a2:661e with SMTP id
 46e09a7af769-7c0e0a270b6mr1397210a34.3.1759942712413; Wed, 08 Oct 2025
 09:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008160452.1741-1-briansune@gmail.com> <53ba5ea7-ab5f-41dd-853e-2e39efac1321@opensource.cirrus.com>
In-Reply-To: <53ba5ea7-ab5f-41dd-853e-2e39efac1321@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 00:58:20 +0800
X-Gm-Features: AS18NWDxEqn1DXHD23DqZcU7_lvdpqATneJZ-9GotKJaV36ym9HlSG_tZkOI3DA
Message-ID: <CAN7C2SCwz1YwYnAD7n=t8hUxME=hihqeF8fYBtvadHVJqj1a4g@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: wm8978: add missing BCLK divider setup
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Fitzgerald <rf@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:27=E5=AF=AB=E9=81=
=93=EF=BC=9A

> If the _nearest_ BCLK is < 1536000 you don't have enough clock
> cycles to send all the sample bits.

If the inherent design follows the original concept of i.e. IIS.
Then the comment of not enough clock cycles to send all sample bits
won't even exist.
MCLK -> BCLK -> LRCLK.
LRCLK is always subject to BCLK by channel # and data_bits.
As for the BCLK is always subject to MCLK and oversample requirement
or codec design.
w/o MCLK rooms you cant do BCLK w/o BCLK rooms you cant do LRCLK.
LRCLK itself is always subject to the original clock frequency.
This is why there are no possible idea on not enough clock for bit load.
BCLK divided by channel * data bits itself must be hold.
Hence the result LRCLK aka final S.R. sample rate either is fasted or
slowed is what it is.
As there are no possible way to generate a incorrect divided result
when mclk is not supported by some S.R.

Then only result is S.R. is slowed or fasted based on the BCLK but not
because you are targeting a S.R. aka LRCLK.
Which result in BCLK is required to be faster.
