Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF432E6A8
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049384; cv=none; b=IJs+TNxGkdzc2SxFupVgAhRbB9t2Qcy+k4lb+o/U+DWI7ts29MxS0KRze3116c2yHzj38qTUu0PWcOb/5NoZbDV1bzwMXrdIKi31SYiJKHER0wQEzRY3Aw0JnDb/rWDWAXQPqKfLRzAFzlhX6/kmV71xIVBdNtcjahJNXA49gg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049384; c=relaxed/simple;
	bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjZiKj7zB3uTLEkkrAtifbbrdFNUH7zwUvGdN3dWSGEyVfKY+AD9Cp39NlWpwNvXz8XEi+sERvfvALwE1SmkWFKDPFGLtR+4CK3xf442QFyS0f/t0jBZ44jqm1l2fXorjtUMkEdVj98CfVIn4x4/CMnAI+K3MULXQN7ywfKzD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RL+4kPXj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RL+4kPXj"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so5305563e87.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761049379; x=1761654179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=RL+4kPXjFsX0wXlPPiJ5544+gQZ4r6l666llWohriyz3njEhG3+oC5Qtxesk6esIe+
         P5XMRnaAbbKBi6THsgxTO8jRGzCy+Zme7OrYvEmw0i7n6NgGBfYbkLr2Z64Q2o5s4YJn
         xOrrIeSlLDuGUQZ2Fxb//x0joj6sP/BxA1YaMNayXomt2cuw3FghGC+v1Pz3nyQbHcq9
         6w/j/hayOEZYQUP+DARX+J/TWA4CXbDFy5mFspNwqkZKhvSBkNo5SUx+e89J62CiWdGJ
         BcGdXW7qHf5aGjMloBUKX6wVuo3w+hg18Qo7+2KEzuFQ6MAgzrMm1X72FHz49SJw8C30
         JKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049379; x=1761654179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=au+oXxFxPI6iM4OfFyzkhhrVfJF8dkvep2w5mQDnKrJ8pGpNVX9RzxInv/ezUqrYK5
         bBjXkjUmIWpDwWOdZCIgItebm1dFlVQ+9mQVbIiLtA/kVOlu8/CHlqUF4HdP/s5I3zLc
         1DnSWGPjRdR3hlhDlHyKin+sf6WKikLHD1SwovEZHaH7tCBNI/diBlL57vrg6cU1zMPI
         VDbcsndD0QIbYIw+z5rsWV6nH1jGAs3T7/1V5spdU/BcqRdD7EWhUFSEoY5eUNEvEY8n
         z4tYKf3lcFh+jhn9virfVjc5mXPdJAUIVHs0cgN/38ovLzHdzmK0i7AfTAeEDJwz2Zvo
         SNjw==
X-Forwarded-Encrypted: i=1; AJvYcCXc24eCloWgQZH/Nk+dTJEe08/AYN58C4FIWZ9x4S9LPoJd37iee4zQ5Pbs3lBtHWCjHIHze9ZuadCaUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFN3bJW9tDzJxzQUNUcKzqCq0Y6ekEFApW9tzhcrPp3+sZ19b
	y2n7u9RBFZEvOB+6YYRec9ErvptIE6lT8KWWf3uAuLv5JPn4umB9/8OeBO38uSS+fckeNliGyhf
	qDf9XF7DTSl/V4XZdrlQAn/QXhKLGF6kET8SCzbXZ/Q==
X-Gm-Gg: ASbGncs4UAg5yrhCa7YGK5bRAmubTpNPrqBqYUHlymAIiKJ91KMbDUD07ayCIHbCaat
	lqdWUPDZ+zxNt6mB8+fPiND+7wjyEpmE+qWnFKsOecmJr8VEsFoXb6T9uwofp4a9vgVZSYCvCjb
	SSSSwNr+zZV+ZupvKdWwuVg+ps2N4MQRHlsvdjRjuOA97WRPI4iKtcvHjzbeC676OOQ8wIiRaDD
	jojJZeFyfBkQyp88VU98kRDVRVbsQkY/Pa68f1YpnAuP1tAVTK3gLISTvLuKRXRM94JDMBpxiYN
	Mh82Y3ICK1iHO7TLIewLyzTrmyg=
X-Google-Smtp-Source: AGHT+IFwqbCzl1LvRrGVBsJkNxyTepKCymSn3z4xLOoxxtlzHnxQDfI8sBh0KLELngrOm4B0AY63u0QkMaZ4C4nL/Tc=
X-Received: by 2002:a05:6512:6d0:b0:585:1ca7:1b7b with SMTP id
 2adb3069b0e04-591d853530amr5944540e87.31.1761049378748; Tue, 21 Oct 2025
 05:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com> <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
In-Reply-To: <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:22:46 +0200
X-Gm-Features: AS18NWBF0GY_y5H5_yrBjx5aMTjq-BCBKISyHH-S44AO8cdbNH0Bf9m_yOfn5F8
Message-ID: <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Tue, Oct 21, 2025 at 2:20=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> >
> > And with the implementation this series proposes it would mean that
> > the perst signal will go high after the first endpoint pwrctl driver
> > sets it to high and only go down once the last driver sets it to low.
> > The only thing I'm not sure about is the synchronization between the
> > endpoints - how do we wait for all of them to be powered-up before
> > calling the last gpiod_set_value()?
> >
>
> That will be handled by the pwrctrl core. Not today, but in the coming da=
ys.
>

But is this the right approach or are you doing it this way *because*
there's no support for enable-counted GPIOs as of yet?

Bart
