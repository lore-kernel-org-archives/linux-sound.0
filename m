Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E39322A2E
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781852311; cv=pass; b=qB3W4y0N1QKVyfz7xVxAliSxEnLjVwThi0DLi53DI3a7aPC+Ur3XWWxZA/ghakYhKpcess9O2NzxPj6Ah2eywDsWRXK9Y46IiHjhGuxNmCxsD6ONjrQRdqVvdbb5x4jYbO6PD7oqgOgQ4TpweEtNblMhRX01DgmDWFQVtKDDkjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781852311; c=relaxed/simple;
	bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKei1Ywt9RUfEpXVpFwh/vRCftHYen3v6Q/e7G1xLnI7ATiLc6ifPJFd+GPp/J3+51h4Zyh0UUeuy80rumQU5oeytzEWl0pelATtb4Rg/mwA2QleVI75cxxPxcmuQCzdSaMhS7Q4GKiro08W4kIZEg3tzG8ZgZ/HxUKSFQJ2kQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWcHAijn; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWcHAijn"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c85d8615b09so1276024a12.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 23:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781852310; cv=none;
        d=google.com; s=arc-20240605;
        b=B+NKVDTKLLooiWXKv17k2L65yXz/4d7jGU130EN+PMfqslqnxckrKJd+D56TkG2D4K
         E20Zp/QVYnNwimw39ItePwnmh96gYDza4hFHWD5MCDgozW7+1fM0HKAQojsr2WmIqprZ
         9/O8RcE/NdBCxphTvUWIGCgY+0budnZYgpUY1amamjMg7uFbsVjYs3yW5y8J+/Ap8L6G
         LS2ofusWBocSrCLna2Oa/q0OHb1nTPgUIlkLvRUjVDDtKGM6ddHPkpdJ6J1nq+mWNVvy
         pFJhk7oqW1opJp3nsKr2grTWNZg3xCmH2F5e15s5bvE0kja8OTCXJpterMlO2r0ZkAia
         gefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        fh=nTux7bnpKF6NHOPz9eJty/oS/P+KZu3HRi4aWXOPnQk=;
        b=bAbJowv0rh+Nz95N7S4LJAHWFYAOPpG2AfMLUK1oZ2nvaDhJTkCAELWl9H/3OdAe6H
         fA9h9uiUzvkBzWO9A1EIMlEWIyiiY8qh8CTzhWF84RZVwUhKO9HzF0qKS/3YtCOMOPMY
         +Q8920pM2BeNic0BbdzcGrrtJn5k0EntXevA3xNV0sZkCeAaqXWUYbZkKfSk/hLCzEHF
         5iL98TS5pcFWLGEflpLadGbeu/+iRTYxECYqmJN+ac2MNuJkmqpNFmUOlsGZUgWcyIIJ
         +30gq7FRIKUisU5fQz2lLCkwSNKJ0zuzFOCugcW6nd2EabfG86v+yOCloFVVWUivvxyq
         Lqvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781852310; x=1782457110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        b=eWcHAijn8Qzpsk5N5T7VnvyCTzQ6Uvqzkoj5D5Ruz5Z469r832FPwLTNeBXNd3EEb8
         5TkraLu4qw8GqNF6sMQ70Nwc3O6DpgAjhEsJ7JWdI2qfkQubDMFdR7+m2/s/rzX47Ygv
         JddmylE7cJkP2EG3lxXKd7fQt7kFzPuypvTLjArMf8WiGY04IJgMRonLO7A1bF+zwAb8
         lb+NJ0Ro2fzC+59bX09k6YHgnaFHKDTfwUPSbPl1VhZvMJHmUq8+n3P6K75phNxkQSm0
         /ogV4DYkDrvTK6KZ9tFedqYTtoKdIHJDvCefe3rXjS3qpUtAVPBtbCnU8dkSCKbEGpDS
         OLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852310; x=1782457110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omTwHM+FxqUGDTH6qWfHVXW2MQBW72PZp+8U6Hx+ykg=;
        b=LO/cF8fXfFO8z9wletOtrEsqOU4v/31YJjdlT6H/BG2TtNFyTBNYt1Vp9Eubm1uqjX
         0nwCORpaKg9PbnMpm4CoqFCCb+2kLLh/UvuQo61ksTI22QtU4LCVanRUuCtFHJ6O0JNl
         A59kbfIXvEOmgKrb5+Dr3QjtVOFRjUk/l6PWqBM+pVhqbN+j48/3fBXCAScPeT4lnDbl
         Bwri3WwTVxiqa+NbSJ/DrpFCXcELwmTU9u6Sk520LB/VnkXL9YQ1GQeIb7dSAKD8fMTm
         VkVDd355N7YO1Tqa0Xc1i98NKGl4AQiiX4WyJ+rFr+gEHp84OcyRstKaAPwkvhj80Umg
         N9Ow==
X-Forwarded-Encrypted: i=1; AFNElJ8QrevONMx7/LcmAqeVZkXN79Jw9cY2mvYevK6BxNZbd13p7WO5LZL2wP19nsPT9vzEZzNlwWbuFvaBYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeP2jemO5GjnCRMVbKOFDHXke3i+yPfHgjQs6k4BF3Q/zmba7t
	SY2/mohxWVH3ccN0DlLnj1+wY8CTu+0N7newhabfEBOFwzTeIL+VEWFpbLldYFM078aTZIAVlTa
	r5T1fnmqrVVhhb8QBls9eDYG6b61+lTI=
X-Gm-Gg: AfdE7clXbXRJqKSj9lQgwDe5ifPwW8Evt8kfhVEmA0wEoH3LdFDo9Mh8hXWCj/QDJDc
	qPk8DYivz87QQTdzHdQqBTVJTYvhCL38w8Nq7ZY8peen2guH78V/kRVJZ7BeWKAg9bMytqz6oQF
	8J2thpydZ87hf0XLQGxqdCz1n186Lrj360npJdsQIHMla7NoWNv7bEWYnAFf48evxr9dN54ZLYM
	wJZSvSbVmJRTsb1JLu/vIarRazqjlwFLbaa/XMg7eekgtrrmabc4uiz8DLYiy+4gCXjs2Ul5UbX
	qPBabPrmGlreqo7MotdTIkpXOdw=
X-Received: by 2002:a05:6a21:1493:b0:3b5:6b5a:4f29 with SMTP id
 adf61e73a8af0-3bb33c411fcmr2889534637.30.1781852309935; Thu, 18 Jun 2026
 23:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com> <D9b19fqJSQK5FO2BflNEKw@collabora.com>
In-Reply-To: <D9b19fqJSQK5FO2BflNEKw@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 13:58:18 +0700
X-Gm-Features: AVVi8Cdm4erPWecisaOWEQ1-2N07q0qf6x9N5Gw3YmftzXkgKtw2pGyicktpxkc
Message-ID: <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

Thanks for the clarification.

> If you want to try again, do so in a way where you don't have to indent
> large parts of a function another level, it's possible and the diff
> will be something I can actually read. Remember that you can place a
> guard for the spinlock in the middle of a function, and it'll only be
> picked up then, which should reduce the need for the scoped_guards in
> this. To avoid having to manually do pm unwind (and therefore require
> that the spinlock is dropped somehow before function exit), use the
> runtime pm guard macros as well. That should simplify this immensely.
>
> Last but not least, please run things through checkpatch. Even at the
> default options, it'll warn about the indentation level. With --strict,
> it'll also tell you about the braces. Personally I just use whatever
> preset `b4 prep --check` uses, which usually is quite reasonable.
>

I do run checkpatch before submitting patches, but I wasn't aware of the
`--strict` option. I also didn't know that runtime PM could be handled
with guard helpers.

I agree that using runtime PM guards would make the code much cleaner
and avoid much of the extra indentation.

These are useful suggestions, and I'll keep them in mind for future
submissions.

Best regards,
Phuc
