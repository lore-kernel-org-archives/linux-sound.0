Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD91386566
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363823; cv=none; b=FUM1TG2cXmURwEvO4JrmCgnYXKGlLS+NqVHTJ96eKpyRqCtzsaFep9/w4+wcOgz2/J7OcS9e2H7PAdaWSKHb2VyJEIzcH9MciwiHb23jBV7MnpC2qLQTsbMGJKRfHO7uZ7Xh0ai7TETWM9X33yvIlz17MmBOqQVLF8fwiU+OvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363823; c=relaxed/simple;
	bh=fei4LdvFh1HIVfZOFUIllx5UOPiuzB+jiy/kfxhgcV8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojhxXACosWIPdflwDItI6RzUTVV3theXt4Zn0WTVk1w+8XVUd/qXmxPdsgz+XLbupbhNBCijXNuDLwi+YpHrBX2dmmbR3rO/tYCS3crGXnixWY8jDoJ4RcmWGZ69OE7U7EjAe3WOTpim0zhqvwPkEJIIOSVLfn/ieNs8neo/MKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roecPCuC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roecPCuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7494DC2BCB5
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363823;
	bh=fei4LdvFh1HIVfZOFUIllx5UOPiuzB+jiy/kfxhgcV8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=roecPCuCa8CIo1uScfIec5MLvT+0ugc0CbMpVlDgKKcBlaIun6XL1OrlVZA6Ww7Qq
	 7Vp6qWpzcwWGRa+m4kwEUyyfS+t26b3UmFfZzwDMZJ3ijtmCG40i8uRL25cGLTLEl4
	 Kyat0/hcrr2MRIj+Yf0ku+/CheKRIKSef9BsoagzkZPROeO+/kqgwWh49qtacMYifh
	 0tXGsYFWfAMEtx1rnOY48UdUnNhRL+D/LK0MehSDmbZ6WMM69GRPSzrrz/VZZUExqT
	 p2SINW0qh7d6q0El5IfbC8kvQFJ1ncOK2qaE1uNYOnMDgLZ2QUWtQ7+ittt1Ow+ZKk
	 C6l/nB10L/v2w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e91b06006so91705681fa.2
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 01:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9chERmlc9jCZEhuxaD6zjKwV34bIx2Mj84kUTsnQn4crDP2ViTB/b7POJBHkZmn2pXjAWZ4nXtVWt9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0caYaUIqL5TugHlwx5HsG8u+ct/xdqoTz+79dwyvRB02yZ6+a
	rXakQxANcp0UrGHHcXIQ3jMNg5talZhgmjwqKVj+pPwudKEr3eAjvbp+G3NoiMjzEC6cHMSg3VH
	6+3/rrC4Inudmr2oyk4h5cU6cPSW1BSZ6SSAzsYAoXg==
X-Received: by 2002:a2e:bc1d:0:b0:392:c9a:ac43 with SMTP id
 38308e7fff4ca-39240cc2503mr6861281fa.8.1777363821168; Tue, 28 Apr 2026
 01:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:10:20 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:10:20 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <afAsFcydwlCEgWZf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org> <afAsFcydwlCEgWZf@sirena.co.uk>
Date: Tue, 28 Apr 2026 01:10:20 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcx2xwAQBnHpJoV2fp-hp3oRpMc=PnmGmVSX+NjtoesJw@mail.gmail.com>
X-Gm-Features: AVHnY4KMgZSwcI18Mg0I8qURCC0YSMOQTqAaLXrcA8GhCJwxSp9Ykvsjgl2hOIY
Message-ID: <CAMRc=Mcx2xwAQBnHpJoV2fp-hp3oRpMc=PnmGmVSX+NjtoesJw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2026 05:40:05 +0200, Mark Brown <broonie@kernel.org> said:
> On Mon, Apr 27, 2026 at 10:43:21AM +0200, Linus Walleij wrote:
>> The WSA881x codec driver has a local workaround for old device
>> trees that have the "powerdown" GPIO flagged as active high,
>> despite it is active low.
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-wsa881x-gpiolib-of
>
> for you to fetch changes up to bfa336cee3324f991e93e9e570e8b827273df97e:
>
>   ASoC: wsa881x: Move custom workaround to gpiolib-of (2026-04-28 07:39:15 +0900)
>
> ----------------------------------------------------------------
> ASoC: wsa881x: Move custom workaround to gpiolib-of
>
> Move a workaround for misdescribed GPIOs from the wsa881x to use a
> generic implementation in gpiolib-of.
>
> ----------------------------------------------------------------
> Linus Walleij (1):
>       ASoC: wsa881x: Move custom workaround to gpiolib-of
>
>  drivers/gpio/gpiolib-of.c  |  8 ++++++++
>  sound/soc/codecs/wsa881x.c | 35 ++++-------------------------------
>  2 files changed, 12 insertions(+), 31 deletions(-)
>

Pulled, thanks!

Bart
