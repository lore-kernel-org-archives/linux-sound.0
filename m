Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5673E47B
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741888917; cv=none; b=YsMVsgJN6nEAp7vmrRUyeq1kliaCPvyGRmNg0p8Bsc694d/Qki92bhA2h0/4vtjgh4vD3HRZ5r/D/zwtog7VdARQ5B9R77hizkbNGLa9yWB+x/Y8DtzSCObZSSmuW/rO7qWA7zZJU164ZyK9BigGBslNT1GoPSgJxcisLNb+eKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741888917; c=relaxed/simple;
	bh=7U7DqnrYIwJquGKtKvsBlylrj1bKPP2BRm5kH5aWSOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlyJg8WddY90QQnlu0oMKuHS3M/y11CukUGrwyPYcjQzZy2oWW1YMIeODJNY6AaLf8DXiVgw7i51fdKaYmJfMpm3rM2kV+9kq/YXM4c1hO8BvGsY6RjLs/iv0zyy8jZ0mUFfeDEGoe0qZr5WCSG0yZ1lnnM2N0LPx6vzMnsUDyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eflB/YHv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eflB/YHv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so35587185ad.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741888915; x=1742493715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqn9P9MGjqYLLuIh+HqrjHJ7EuDBnRsonKfIZU9ui7g=;
        b=eflB/YHvDNc0rXrFI6knnb98kXwYdRPtnj1fhQ30G/gngrx8kbz+1h912fpU0HpxCZ
         qK2nga7Y2kMDt66zXPifjhDUYspU/QgYsO31xNn1RLt4nwQd4Fp8Nig5y/ZRRHcuZenl
         El+tnOSyLtBJ3RclFNwefbxsofCF+rlJ3MNKoDVDGqbHQOqo+608Zt+EDZ3aIx7bHgdt
         wqGrKWL22cKGBRgO1Gj2i6xPgL2JVpvLPg8P2+8Eh5O5/awxLz4Bp8HzLhoKyoq+LkLz
         998bwTPfCtewEfeK3hnP4FEmYHqwhstC51FzcGbVtWCpVmwAzdNTnaNUO9MluwNKBSQc
         v/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741888915; x=1742493715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqn9P9MGjqYLLuIh+HqrjHJ7EuDBnRsonKfIZU9ui7g=;
        b=DQlQspBmZ4jQRtv6kwETwMKRSWP57EUXwl797ubFeaNgDOKIhdA2KqKe1wPyuejQc5
         ZR4dqy46aKgI3uVnejC+16auW1dsrYsafXiW7EI9/U380YBWdLiiDzTYNGdfSyX7mS+r
         +Bu2GSAm12eyBqGw59JPo+Hji6i/FajlC52yn43WgSSXR4u2Oi5UrS5enFjGK/bJIxSH
         Vyo6gnCG9HRedFHuyhGBJS42Adc+2pbUzI8OzcNsBXrkdObw8VxQGbKqC/kuD0ByTVRx
         Qpdy6yLs/LfwNZpvlU5OkgKenRwCd7vbC0MH9mfTniUSEeHZ9A2eFVyB0Rjq+Yx6a+Vm
         YcjA==
X-Forwarded-Encrypted: i=1; AJvYcCWwMUg9gTjvn36pI1UJC1vp/YwfTvPCeVSZNX2jsflVgsaaMU1aHdOALrYO7NOwFCOG3e05qv1lstMo0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tJIBmvsfvrMM54mfaPD6F/xeICLbTwEHcpzq9UdTAEoyKe3a
	ZlLyifYyxTmsYphNb0uoTGp2qXNPEkbFkKzzeEA7M2QjI2uqRnvLFkkzl71P9LtDM0pPK+3kK2T
	gBSfclsg31Stwe8R3VjqAafEObFc=
X-Gm-Gg: ASbGncvASi57QrmF7pFWeJ3bYdvuWMENmzOQSxcrajqtr833akExQALcJhwEldJgdNz
	TotczKP6yVVJKw8tDXP7/C6Sqk0dPQcL+ITKfSYx0uvllIL8pdDMESEbbTpVY2JQIGu09TxU/1t
	Ow/pQgYTcCR+u3gcthnZQQy95LBXU=
X-Google-Smtp-Source: AGHT+IFL/Sqhc0MwQGsYSrVICPDK2/nNlByxFWHHzKL640Auv8ZqjHx9S0SEdvNdBkDLpkUFtT0aEk1tc4UnWLEWYaw=
X-Received: by 2002:a17:90b:5288:b0:2fe:b8ba:62de with SMTP id
 98e67ed59e1d1-3014e8fb878mr543709a91.25.1741888914887; Thu, 13 Mar 2025
 11:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313174139.29942-1-tiwai@suse.de> <20250313174139.29942-88-tiwai@suse.de>
In-Reply-To: <20250313174139.29942-88-tiwai@suse.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Mar 2025 21:01:43 +0300
X-Gm-Features: AQ5f1JpfrHo5ek9RIw_b7YxWI0_dAXBXb7jyt0kLNAoQEWzjcYQvuyYoi9BJfSQ
Message-ID: <CAMo8BfJbiXmf83eGyXrg2ZTFA1S-5m4bvWC99E6EneAVvH6pFw@mail.gmail.com>
Subject: Re: [PATCH 87/89] ASoC: xtensa: Convert to RUNTIME_PM_OPS()
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 8:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
> together with pm_ptr().
>
> This optimizes slightly when CONFIG_PM is disabled, too.
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/xtensa/xtfpga-i2s.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
