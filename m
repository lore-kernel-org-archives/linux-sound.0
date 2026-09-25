Received: from mail-lr2-f40.google.com (mail-lr2-f40.google.com [74.125.230.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0484D90D7
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352994; cv=pass; b=HqoDarcqm+MfRPCLld0ZX8hu94c/v5WSftBfltACJwTQYbj6QjEZuShgZhKD/zqznodBnCzrvymmZ66qO3tE5xVkFp3A6Eihih9mOLEDzeJTUEFQTc67Kd76XMpXo9fOP68lSXb2OljGkbcojBkoIWx4K0trq0JMY7LdmE5JdnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352994; c=relaxed/simple;
	bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iml73LRkbNyMCqUOPvFV2zjznURzNKBwrHN/X4seHKchQijSQ8XoNhsWvSvbeBLYeqILtuKuKEF3I793bhRDnOPmxksuBA/0rgW/erze2Hw5kc832xEItUex2iVpgAMZtescjGWfbUhTAD/OmmIV1qKxiN02K/aD50RtatWtZX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFllTQ8p; arc=pass smtp.client-ip=74.125.230.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFllTQ8p"
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so8281661fa.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790352991; cv=none;
        d=google.com; s=arc-20260327;
        b=MXNUcrNTWnMeVzIGYIfSetwQgnfbWZ9n0QzwW4Ly6OJ8hdMHDseAhEo4XvPjw83p5g
         9zRgVq7DCITfWjld6CXYke5DrIvH7KPYxJmz91CqyaG8ha9W/d4wLrJi82oIFJc8x/4P
         hp9m94uu+m1BJ/zcsHiZN7flFBGRcKT1W1p/5YPxzdC+ojtMYfiYVW29x4r3KsAWyd22
         XwV4m/rzzQcH7QPKk+0hWy3hltEQWn+uXebBACY5eqRoGspEwyVxjeAuEP6t+VCAHP7a
         WRnyVK793A8w2QYlz7OMZO/HbBhMviKNNAljSpITm1D1I8QYwemElK5vhesjWy9MkKAa
         qUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        fh=xUIZnHcJhDUvAepRwFcu3zZsxkrdW7u17f0TN1HlqQY=;
        b=SNnY5ZYP7KT9ueXuHMVax9tt1EeQbDJXqpR55VMhU7kUALvXpP5YXwwz0l3MCJxJog
         4Tl1PGy7OaRReEA9Ln0wthq6p1mrQrTmaAttgv5qxoCno4tHAV9UUREpGsthKDYG+Ja3
         SCPmNBpju2qssmGBZ3pqI116DmCthbZ879VPbghwrj1aed3YO2os70VRJZqNeG0/u5jA
         rxifbP+GCr31qNjp+L4YyQnEsJLFwMbgJzVbUYBVYgi9a6b70RPWkquKIPk+X9UUAM1Z
         VOZbIi9HraoKhqQ8Qk5TR2D5+RJoUFYPB8rHSQO56kE0pNLshKWIf9LolWN3JOGnOmWs
         SZmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352991; x=1790957791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        b=RFllTQ8prYocmwR75A0B7d+Dap8NZs2OI7ZiNOyF6Tn1b37XYbpNtu3xUBfTtxB9uH
         hH6XSjSJbxNGCGgQjbSolFH4LwfvjZFh1sE5qEgd1hrui0cpkzrATzHpXNQC55mv+uEt
         CW9nR2e+aEOoD/pNp8BluN1QMiuMb7R9NwrjO0Ekbj8fjhLZeVYWtce9+CQxpqj+wUff
         3EIfgkwqFZZ3nGPxWQ4POpf6vYD7vZegT7hqmoO7/HxASxp20SYjwEVX2t02BpdEEh1p
         z/SyZnVEQ7fQJgXONFuZuq9OoR7b1I7xtYIg/QT9htG8X94MpMxDKJZFw6xDocltlJjD
         UkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352991; x=1790957791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        b=HldTeyoXX5BZQZknY1IEE7477WBNnJs80+53cP7ULnGGZcRR/S5O/hgpulvSvXu4LY
         K+EjOfODOga94ow6h1EBJ+ppLkP1yXAmsHAxkNyPOOvmzT2hIvRAi38VN6IU72xlrkFI
         tCZ/Pmxr0u2NKPHA/7/0KZVnoH77cOH0QTtMsONogA5eHJ1oofR/ksDKcUDugPbCqxdM
         ln4u5DZJdOPq/cnQmn6d3rkamqcjsyYb35PmCbBZMoeFfHnIpdtMhbD9K1mp402QRkxS
         ovR0wkeD8DVW7VDmpj2bEw27H8uMZB3ds9+i2DEfeOStqIvQ0yz9tV0EyYSjeAWcd3B9
         Ysfw==
X-Forwarded-Encrypted: i=1; AKwUvByRs1u6vQY8yKwkvxzTUMMi59qr+zBw4Fy6vQF8dsgUttFZ9IZLPbm2V6kF8kOvPu8E7cddXBICy7Xn5A==@vger.kernel.org
X-Gm-Message-State: AFuF++k8YpKjbO/cPONXPsnYrZlsosxjVhQouw70+jaSrySKbt/i3N6N
	lZ2tIJDJrRhohr6CEFoHjl80We1UgLSQOXgMZmPRjZ0V5oHlS0HSuOOry3S0ZoXurhmUGDnghU7
	gcmvxqrGMRj5tLjUT+MAkcEza03CnkmA=
X-Gm-Gg: AYBFou0nsEdKC5NLNwY1cmZh7m2kBJl/MAImwHaRfOyHnkQ5OCMzQK5i35xtaRLXfqc
	8tJ1bLo9msV15Kh2oU3Py5IDM6I1rEZU1ikm52MSdU90mL/08eSmgzPCxE4H7w1SwG0GzusF2DQ
	XasHfIRqJZ0Vw+r9AQqLKAcjKtkqtd3Bhj/y3umOTzY10YReSOyicm8A0I23zJ7nlwJEXrWnqyS
	VkkJnC6IpU1aljmW3s01Z9VMruJ45OJ2gW6yI9XZWe2ziS3RqUQQCg/BlOt8qIvTrKAuRqszXWM
	Yhri0pG4F8D7DsoRfX/BhmG1dNdHBMV33UzmTTYhoxu/8Yiv4zkt09vYqcMldFec+25CsDOuCUd
	DK6hWj8CFBNCv0OuL/NigBudLGCvkOt6wXQxm7sE1VyYzOHdE7Z5vFw==
X-Received: by 2002:a05:6512:3f06:b0:5b8:bc5e:b580 with SMTP id
 2adb3069b0e04-5b8df20373emr2304318e87.56.1790352990865; Fri, 25 Sep 2026
 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
 <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com> <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
In-Reply-To: <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:16:18 -0500
X-Gm-Features: AclHuK_H8c1Sx43SsEzC-WG489NRPFEttLh2MA3olrFoL5qq5utZjFzQ2PwO-AY
Message-ID: <CALHNRZ_Ljg2ahetObZGE5aj7kM+zgA798kG1_hbC28KHweiYzw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:06=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 10:44:46AM -0500, Aaron Kling wrote:
> > On Fri, Sep 25, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > Again, are you sure this isn't a workaround for terrible hardware?
>
> > It's possible, I suppose. But this is copied from the already accepted
> > aw88261 series. And it has real effects on my devices. On an AYN Thor
> > without these changes, if I start a video, it will play for 1-2
> > seconds without audio, then I'll start hearing audio. With this
> > change, audio and video start at the same time.
>
> Does the audio sound fine - are there glitches at the start of the
> stream?

No glitches that I've noticed so far. Can't say I've done a crazy wide
range of tests, but I've run through most of my normal use cases and
haven't heard anything unexpected.

Aaron
