Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97E34F46D
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518140; cv=pass; b=Pxq8ej2+rDIOEmm5wj/lvnIGHNr9Qaxk1+hCNErXKcKMklHFcGluonYMX69hF+Rk1kAThJGoyou6nd94nb/A3u/plLzvnyhsQ6YofF42dDSeiwW8Vgn9RJxJ5ctAaKHg9KzQz8MkmGTPa74DgFt9Fuk6+Ay25C8FTHBDAQpSJZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518140; c=relaxed/simple;
	bh=VyMe6Vh/RSqMPkC7g7vqkV7dGyUIXbsbBgo6GsI6/VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMT80bo7uXSawjlUxDG5Fv/ShRN7zoqrFQWKU1ahijIgN51pxNCEu9JZI5sPF/RmvIbbnXgsj4XQvQtG1DUlHxibyuIYTGwyPSSQiEv0BXIoN6gU/3vhdIHqKj4whPAkK1LQog/Ay28YbzpZKqRuWsxF1iM/weK2I7reygQmcOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL75rsAs; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL75rsAs"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829afe24fb5so581470b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774518138; cv=none;
        d=google.com; s=arc-20240605;
        b=knDpfbWtnfL2kYQ/8F5t+QyT2432HnJvJQxdF4B1+HVWvuMayyIsEFh7Hu8FdTEJRu
         GsZaJVPie1oFsMW0UDKLA/G36VWi7yUUuWgIxeHPx9hgD2+GFKEDH7PMxCNJjJnndSQY
         TexAWQc85Q7pdkcQJSI2vkfWUm0iuPfW/EptgaY1ljw3w/dqMIaZWbGa+w9+f66Vdouq
         7m0art8rgyTkmiDGvpWlTq9FQFdYTOuTI8vQ2KGKj5WcCrMalfqP3ZSt3opQu6Siff1x
         u3hANXs4N0vN1vgLS1C+EoxhX0R0luZpCG/DUiDVE4VHZ5qxz80cWzWh+tswDVWa6zE0
         I5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCod7anEhso2zSzSkgmItjA6g0Z5Swm7Wjv/RdH1Ujw=;
        fh=sAyYgntftRoH6V3i8RvQX9pSjFWFlqT6bl3xeGAO/VQ=;
        b=Gv7GrUt4Y3ThMPVpwStKp7eLDmA0tOV6OwDqVPb5fhnWJ0pnEyoyHT7jyO33NY6xK+
         +psqrl1nal90SaEjj+CP4w4gtagqgtWDf2He8o6Ay0LnuS7QCy0vKAs6Yry1UlO2rfR6
         +own0JvqL5WxV7IaUWqgZI+CMisEjaoxdCV6VVnaPo7ATmN+a81WP3XCEhKXGp09D5HV
         mVbr4/1YgWNdidXRtSF9+iIRe4rr/eg6XhkX+3rrBntyV42KQZ5ZTeer9mrl/GRiXYXW
         eZBG/ClyR2jgcSidS0VaqrS8NIqD28FGOzxt5hKP3hqj6N3qv8AGo10hBKIoWjm1hPuF
         dycQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774518138; x=1775122938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCod7anEhso2zSzSkgmItjA6g0Z5Swm7Wjv/RdH1Ujw=;
        b=tL75rsAsoAPEC5oyCwcAnw/QkuFQa3jMOwXQxGhxKhsmV8Cc287eUtn0sgRh2DPT7A
         1VBlM6edph+dq/jNaP3Zku0tMHDcxkkWk57VwOhSA72vIbdw2tucZSDnOGVuA9nS+fgC
         pbQK+5jKY3hEmdY+kwp+E6pbwgoP4mBhjoLRD5trlz/prj54wy5C1lrIEUDXStSSeO5e
         2v0TWE84YAOixLcwQ3uLi0xybV9lPkva3FYIGd0/QjQqBVEP2Gx8vnnDNk7RJxKE5QzA
         3p72HqpZtB0XNKsuBGX/ZKe4ogz2SS98XnrKy0CrxQgryJpGWeNEinX2Uicoln04OO30
         uSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518138; x=1775122938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QCod7anEhso2zSzSkgmItjA6g0Z5Swm7Wjv/RdH1Ujw=;
        b=J4rortunBZ9i59VBBAuMdUwUgpo6QR8aNBfMd1elABb2MLOrOaEDE9U2DuQbb3Y5I/
         nNtfzoVyFOQVFOtOqOkHczF+aJslvt9qsuTa2/8wnNNxl5O0+r+lJxBazuf3VKjNX5Xc
         bhM2E/KOGbiu6KniMhf21LKLSVjwf32cQsE0EHlWPwwjsJvLxxeUgHnsc2cnQleUssRd
         f7DD2lARrrT14RO709YjCh3aP9fbxBGydgzw7gQnnLFimVGGDlur0TQHDbUkCmb1XR3p
         7s7hMoMQYehifvzHEEFHluSbSesEDuFgTQjKm+W69roOngtOLRW+hsatRC5vByKgsJWc
         kTXA==
X-Forwarded-Encrypted: i=1; AJvYcCWw96kO99hklnscye+nCW8cW1C6JefELgh8vw31l6CReFOVMNtXFpk5G7c55DGvc3yo8PvvodQo7qJisQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylzCEoK3EvzHwOU6YMI10ywcdrzMWNMexsu9Jl8XZZYPSzUgQx
	LC+ibEHIb6YhKUQ9Gjm6Gu5XLUkE15fpzPlBU0yFg++X2HZv6Bg1XCAnvCUTkcmlPbOnUQzwVa4
	RLNr+dSGxfj1mhiaaikyLzpRtoOJZ8g==
X-Gm-Gg: ATEYQzzXhYls/dRpn3afQyWRZKy0OHu7AZk9XO2Z+tVdvlELxf7zuAFE4D191N2lTft
	C1z+po4XUCp2Yz+x+22ifeTSUoJe8zyOIgE4qI6C9qcSZJWLAaDdWJ6LmD2Wl/EWIuu1wuLiwgN
	BpDWviNh3k1Ta4QFSwNEVWOcZA4QZJ7BDekXjDKAvYvZcP4A0ox01Z7uYFOzAKypkbs1QC+jkIR
	9RWNcwFSS6wBPISbJgfI3xh0M9aaMsPdaxCp1k7ZbbByVAM70p+Zk9e2dVekOVjPrJz7ESrcPQf
	GQHQdQ==
X-Received: by 2002:a05:6a00:1ac7:b0:81f:3f03:6838 with SMTP id
 d2e1a72fcca58-82c6deb21e4mr6865416b3a.15.1774518138366; Thu, 26 Mar 2026
 02:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com> <f60602d74e1e4fb5a7458ea7ff52d16933950e69.camel@gmail.com>
In-Reply-To: <f60602d74e1e4fb5a7458ea7ff52d16933950e69.camel@gmail.com>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 26 Mar 2026 10:42:06 +0100
X-Gm-Features: AQROBzBju8H7eg2prsCg4vzIrXkugLWfrOUhUAV0kW1ktvhXO7bv103f2jn5AZY
Message-ID: <CANBuOYo1CXt+dHfcbYZZhvzpsMpZm=vFPUHSVi=5FO_ZaxuUyg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: adau1372: Fix error handling in adau1372_set_power()
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: lars@metafoo.de, nuno.sa@analog.com, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 10:31=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> On Wed, 2026-03-25 at 22:07 +0100, Jihed Chaibi wrote:
> > adau1372_set_power() had two related error handling issues in its enabl=
e
> > path: clk_prepare_enable() was called but its return value discarded, a=
nd
> > adau1372_enable_pll() was a void function that silently swallowed lock
> > failures, leaving mclk enabled and adau1372->enabled set to true despit=
e
> > the device being in a broken state.
> >
> > Patch 1 fixes the unchecked clk_prepare_enable() by making
> > adau1372_set_power() return int and propagating the error.
> >
> > Patch 2 converts adau1372_enable_pll() to return int and adds a full
> > unwind in adau1372_set_power() if PLL lock fails, reversing the regcach=
e,
> > GPIO power-down, and clock state.
> >
> > Changes in v2:
> > - [1/2]: No changes.
> > - [2/2]: Also unwind regcache and GPIO power-down state on PLL lock
> >   failure, as noted by Mark Brown.
> >
> > Jihed Chaibi (2):
> >   ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
> >   ASoC: adau1372: Fix clock leak on PLL lock failure
> >
> >  sound/soc/codecs/adau1372.c | 34 ++++++++++++++++++++++-----------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> >
> > --
> > 2.47.3
>
> With proper tags:
>
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Thanks for the review, Nuno.

Fixes tags for the series:

[v2 1/2] ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
Fixes: 6cd4c6459e47 ("ASoC: Add ADAU1372 audio CODEC support")

[v2 2/2] ASoC: adau1372: Fix clock leak on PLL lock failure
Fixes: 6cd4c6459e47 ("ASoC: Add ADAU1372 audio CODEC support")
