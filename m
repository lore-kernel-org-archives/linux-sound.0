Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E7B566A
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753850756; cv=none; b=NDdyjEFGxGjwEzj/wb0M45xm2EIisE8QC/8QOZI8F9ghlbv+AX2lwl+BDbB8mOrbRwdI/vywWrIvWtu4Wlb4Ek/QggsDbVyDFe3Ats22QCkkOebYJpmPYZI4kK0dCW6Bl0J1Dp9GkrVrOAuCLgIYlIHx1TNnTvmyJvg1l2XhzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753850756; c=relaxed/simple;
	bh=r2YcwgEWCDFSQb6VjKy4RO0x5titOjsLWH/pp1MQXzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5lXxPrUkucpv0CIBHXywbRoXfaS5wnkmg180xm+KYgWYS+Te3LcRbwUgqn9qbvtkVaz/pRRmfmkN0BFUhcedMarzz/O62lwuJVpkgpf45iQ5lZ+V0Vbw+93+3LWoCyoY6BTipuf2PjAxHnNNcLq11vGbHmcwy9eu7V8Q8z22i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BHep6Oj8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BHep6Oj8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61539e2065dso825849a12.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 21:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753850752; x=1754455552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Re8rgoh679XqX+af6lmKiaB1sX2YuPBP4jLD1O6l/3o=;
        b=BHep6Oj8j6M4fAZe0p3qJLZJP0YmTMMFzAhmAOSC1qr5pgDjknsSK2tJUanGUBkfRn
         G14S1k1UJ8cTg4n0aiMSyv9yK0JHpn87K1HyJsV/47WtPgHVWyaOf2ItOyZDbJW1D3P1
         9r90MPA1TLKILeLZQUK6JnSa9UvTsGbsSRkl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753850752; x=1754455552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Re8rgoh679XqX+af6lmKiaB1sX2YuPBP4jLD1O6l/3o=;
        b=GMrQai5evAJDyKGBPuEwPDriX74kwiXYMAXP3lxIMdr4/EcWosyKWJLyIlSDmDergb
         6be6+KTRYsr2dnBbqz+qT88ZQb7ebYnCeYvRExm7CoHBoLK+qyxfSt3XidmgtPU3IhKk
         Bpps4+8fZbXyDEedTh8MPKdaKiMi72kZvKM4OhG325i0J/QPsqRcdwCYoudRPhOX7rBT
         L4Y7hby6EgUdoefEUDNEmdGZ4WIiSx9NmP6HqoZcP0FWZ6Oep6gJPMi7gWtH4xAsykIN
         CtEsbiWMg5ZtbpaDbd4j2M96j2gIlU33BOeDOJrxvydX/Fdcfwf1YREWAz/gnDZRSz7f
         LT1g==
X-Forwarded-Encrypted: i=1; AJvYcCX0KYurcpzP33omjrb/RTNTuz6FU/zqx/27KMpznKNzdgQ7sA+/4QqEribkXjuhpdHo4bJWyFv9uJsuKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWrGEeiCxWYt4YfvSQ9I6/4+gtEM3p04YIFz0SSt0JHCLTXUb
	vPw3IH8+0vv40X8LTVhi0ozKRFoLhGn33yy8xnhyEcbc+JzcVmEEc1DE2nVa5fhStFvSF9SPlv7
	kAPySzMY=
X-Gm-Gg: ASbGncsc01N70EVdSdM+RILkdjmz8Z3fb+9gdiwjIsF5Qs17ZNtytaS3kUoZoi4Enel
	+SeyN7/2+gYAqhjuqhlkMIcu9p03lR/zIz1uf34HE/8bj5mzK+mPpFlCmdUf+9gS6zEhr7DVpCP
	1wIyvWw5sD+V0V+MOxkwhSyU+sv2SV+CSnI9NH6nRXwd0qpODUImJJYNyh3ejQHhv7AbneB+yta
	MrKK1Mn+Fd8+q6oAK/Voqg/9WhjPnRK5i4511CIeNrdyDxR8D1ut9Ls3m7ICF8gNYCUmUEQb4Dj
	xGfcJm40FgP75bqp885QfNiMjEkj4n6vN7+a7jmTdEKRUHW1r/Z/SzRzwpxC0CnKTHkUbW+eClX
	48zBAVsDD3Pc272yScB4BwKkEfVvEaNLakQQesx3eveBTjgdEbScPHCcOsK/O4OSkPrDtNJQp
X-Google-Smtp-Source: AGHT+IGV/Ge185jmK+JKeqh0qIuqGdqybHX4RUB5D9TK0uR7wVfmXdjR5LeLZqW1yGGmGWgiTeABzQ==
X-Received: by 2002:a17:907:3da1:b0:af2:4690:9df3 with SMTP id a640c23a62f3a-af7bfd85f30mr695783466b.14.1753850752351;
        Tue, 29 Jul 2025 21:45:52 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61562e2443esm2095158a12.5.2025.07.29.21.45.51
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 21:45:51 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61539e2065dso825813a12.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 21:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrLadiWKDum1t0ZemgkAYwT/6lA7/P8izKr4c9EjMSb1UkduroWHVzVB3kM3dO+FfW0GaojMLz9OmKbQ==@vger.kernel.org
X-Received: by 2002:a17:907:72d3:b0:af1:69e3:c074 with SMTP id
 a640c23a62f3a-af7b867d9d1mr788671166b.8.1753850751419; Tue, 29 Jul 2025
 21:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecu4idvc.wl-tiwai@suse.de> <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
In-Reply-To: <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Jul 2025 21:45:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvoZuw-Cv2Bx2ip8Kq4j9jw0meLBg0xz8GbxzFmQK7QA@mail.gmail.com>
X-Gm-Features: Ac12FXxDohtxbX0_GRufoIQKu-T8t2bVC8vlOI2K4Vxui2TlmkhvVGE7Q5GOCrk
Message-ID: <CAHk-=whvoZuw-Cv2Bx2ip8Kq4j9jw0meLBg0xz8GbxzFmQK7QA@mail.gmail.com>
Subject: Re: [GIT PULL] sound updates for 6.17-rc1
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 21:21, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think that's realtek, but when I enable it, I get this mess of
> "which realtek", which I have no idea because the ALC3271 that the
> kernel used to print out is not mentioned.

Enabling them all makes the kernel recognize it as a ALC3271 again,
and it appears to have loaded the alc269 one.

But sound is still gone, so there's something else still missing. But
I'm heading off for the night now...

             Linus
