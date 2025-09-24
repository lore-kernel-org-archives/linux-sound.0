Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6D31A072
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758740311; cv=none; b=U3u5plMHuwWwFIsIt8Tl8pVYDWSHQoleD1r4sCqRgpBTaczAmihiNzYvQEofrc/6fSu8hAy4U7/6YhgzMWzS9IWXkSprB4JGGSpHqck0GFctupZRuCjEGiOcT2Ht7gq2azB18XE3v/cPD1X6HUzELfYvXzUtKpq9HUIWt8Xkr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758740311; c=relaxed/simple;
	bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fsv6UA/s0IIeiihgGJDwCoN+NDsY71Bi9jlp5zKtfS7GY7jWOkdYX+bfBShcHz+No/MJkl9wY3dJuerT9n8nESNIdRtxVvWfLqFtOf751TJX/OuqzVlJOTdjLNwLJr2w9OTnlFXfgUpQG3Ml0UoEG5qhdFzeQt67gMImTeVBwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nonZE0uV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nonZE0uV"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so106134e87.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758740307; x=1759345107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=nonZE0uVLQny5TOOi+KqIwped2yLEoydhjl/vCnV6UWHVCXFBQtsStcpMjfcSHmYws
         ndawyzrdlnsaFp4fBQZJM1CBnKMv0/qy6aJ9VV2wTAWd3UlrQnQlcHYXtVBgDT3c3eQg
         O19EoSwhA5vvdo/gxkbqulZRyLZC2GpCmDfsmqwAtSRsYNNMT9mZpBw38M1Vw90RX8ch
         MUmoQaU/Rd+WSIdCP04amGm5rSNRySj+N9pYWZ9BN/p61WWNsqfBDq8vTcuLs0h0ycxV
         8E0YIYD6U4psQRPtOX+qP1E4P3YMeSGZz9Cajxk2R3nq2FlpLF3FRcV5W55LbRJipTg/
         ZMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740307; x=1759345107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=E5Us0+fj8+RAtR9CnwAYADQFtLKJK6G+s1w1Ys7k6EAsPgzB1XN/YODxBIceTOw2l5
         oXkydV6fAKhHZM7KyZn32woJGQmvDFexiBvnGa/kYIc8mbiLe6FQMznr69fPkz4S/LP2
         Tp4p40Rno3GAmAHfPwwdddTuvdVDHHF3U31c9Xvg58VAk68rI5EM9AkszazyfQcBKmrv
         5NzttKmgq+BCAaRY+Aos0y0HCgTIe4N9ltzRz0Iytq0HEi6Y9uLxWP8ePKGvn5H6Y+Vz
         cRj4FTvoM85E3lP2ZSwAwV67hnRYqr8Bo/TkqRVgSwFv0Whnebq4M6n43EBqAdAZYRB0
         LelA==
X-Forwarded-Encrypted: i=1; AJvYcCVjlhuYUoh4ACRXkP8uK0vcN73s2Tv43cyhIrTy6ZhS3uNyUiJ4oaX6kJvope1xpXW1hT8NHguXpvFQyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJVU32JRzV9cCwAL6OFPuthK+2irKI7Y70+r/zcz71XUjgm+Fc
	ws2XNNZlu8GV+UCm4BfjiBLa/gZT4fiAY+0gnTb4BF5EtHk+5+F76LY3LY2IgFXTcP7xgwFLAYW
	of5XutFPx4U+d3ijruTsLSmOm7cnMFUcp2ZDEdOZxpA==
X-Gm-Gg: ASbGncu0Cn8E4ID0lLJ+vbjL2w7IfSPABL9WTu1hZFJ6hhJq8MmYQTnwauAlmPSGCES
	lF/oplPDI2ci9A6tjXqfxES/WGAap93sJ/SwGiUpSM+QhHCoLJYw30jRKBttAcuXjTxaB9e7KDM
	BXDLafWj8hSAIoNk1GqQJYtCuEsQL25hRafpU1SR8Ro2buOSB0wOtF1dWLqkahHy/r6VxMMxV0S
	TL7AQMp704edS5cAbgpZAzA9onrep5Ruiarmsc=
X-Google-Smtp-Source: AGHT+IG80v30cYAxmqw0nWtuIX67T8j0+pyB3RqSVPJrA4Q3f2yx4NJvYOML7KmCJ9NDodn7hTwpeLEpVOpaBNNnZoU=
X-Received: by 2002:a05:6512:1389:b0:55f:572e:2417 with SMTP id
 2adb3069b0e04-582d4442054mr147305e87.56.1758740306748; Wed, 24 Sep 2025
 11:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
In-Reply-To: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 20:58:14 +0200
X-Gm-Features: AS18NWB3RTCRDB9znJ75efLzXjjUdrkYJL4LszylIzL1olaMxdJPlHwCWt0jx1k
Message-ID: <CAMRc=McVc2aYFX-DKjtNNNs0eZLcq_jahR+_q3EP1T352XhP+Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 8:25=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> >

[snip]

> >
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
>
> How is this different from the existing gpio-backed regulator/supply?
> IMO GPIOs are naturally exclusive-use resources (in cases when you need
> to control them, not simply read their state), and when there is a need
> to share them there are more appropriate abstractions that are built on
> top of GPIOs...
>

I think you have never been on the receiving end of Krzysztof's wrath
when trying to model a simple shared pin as a nonexistent reset
provider or a fixed regulator in device-tree. :)

Unless you mean some other abstractions I am missing.

Bartosz
