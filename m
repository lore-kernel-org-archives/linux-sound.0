Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039E33C1A0
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554114; cv=none; b=Xmn7PFSe8gsOSkmlBrddyBCmemdx/uhmaZkq8+xKjAMegSHCgd4kg4EOnmBab6AHv06WvcI23eR5wlL1F6hOQWIp6hc8wRiAHckgGUcBbaGJcaP37xnoSld+srsFsEH8oMcwvqNOdMZs8e4U/JIZl9zgKSGXvblZjooforMOqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554114; c=relaxed/simple;
	bh=Wz22VNw2koGqXzDFonKTJXftJJ4grDjQU40zXPDvokE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUip9KLtHIsMZh10pXjhRrtkYjEEON95uLP3k2cVtIvyff3JsVdI+wvH2OAbm21bI8NQATkM+ttEM/JI4E/TTXgIJpGU/JkzrSUpyWBJ7kvhgFHXRDffaUeOLaZ8SKx8U9RSWTft9xa0l1EYXZMlEu2PHu7UDL8EJ2OwfjS61s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bPZ0tQim; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bPZ0tQim"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5945510fd7aso5653848e87.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 04:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763554110; x=1764158910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewpfEurHKI2PvmBBBNex6EdDDdQ+CHyaRtPaFhGL58c=;
        b=bPZ0tQimRxYS0KttpsMDNJjOxaczScgdW+WONGZB9ML5bBJJkMv7bpkEeBoi0EjG7o
         9qG4in33emt/xX9jZyQXOXYzD+/CfZMps8dhawqWGaMRUKYr4MXvRjFqTflkK0Qj0wCg
         uVgW0nqU2SQbUNISd4K5ywrb6LmL+iPZkZUNiMXjQDOd3XjVnkLH6wpcIW0mA5dzPPIx
         CnpCg7DmoPETYOnl5B6TtjRI2dssrp1Kic5lL6JlTl9frcMWJiziIn/uu1XmOyUkUwFC
         b88wV6wgPHJzVdAijwOW4gVTA5QU0kSYX9efyIx+iZUzjdEZhytkKeoc7a3gooDvo8hj
         VMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763554110; x=1764158910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewpfEurHKI2PvmBBBNex6EdDDdQ+CHyaRtPaFhGL58c=;
        b=RAdP1R7Mqh+v93DEBWGYq7XdJOIXR7RnRLsy0ex6ua1j3tuoPJiz9FH9JSYrGlj+eP
         6NQEScL46mxtewM078pgVZt+6Nmndz9kUkIpmFP6+7kIQYr72hwGRNh7gjI0mJalQeZW
         TdwIQC6hYSJprGIWtvTIjPYY69jpMrAE9I/CjdnQwjzjfXVZtJBxfQisWogCjq0rbZAM
         gRRHr1nh5FpmjR1ZZunye3n6ZEfUzohAfRdbhjupgsUnca0OvaHW0rE//vUVcweKXeEh
         GcOdHKH3+wLV7axIO5iEPjQxSPomXdjaLGd22FFm52pHnOjBS60Wl/jRgLLhU5XLjun1
         pU4g==
X-Forwarded-Encrypted: i=1; AJvYcCWTeU/sM/znqTBmqAvQHWPe6Im0TDDmH/vkVcAZLRpmDjGZOqliwJgfpTGo6cZw+Bnrm3zpwvjNsuOqHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpYjNmqVi8U47RTAZCEhq4r51ockuXAKhXxTqyL+huhv1NuQ7Y
	K4Ox+f0rUH58VUBZnOyXFoqcSX4q0FkoVix24qELru7TfSHVEhpERo8XpxWCCFROHHwa/ArDwgq
	UowAdIJljaozj7uY/EnFvhs7zOcCFYpBBQjmlEL8BPQ==
X-Gm-Gg: ASbGnctzpGih2v4SZqAlruqcieV0U2vDwfD0cfOYkox/cVa7xt37VwTduHxee6o55qR
	Xut5czer6urJn7oCHp8lxr59kDwSu+zq0Y6tvp/82b//dUaTOozkBxm+uAmyU4Kv/wf4t156Cn0
	1aQJJp5VcI7QO17adYnUaYwxGbzZF2LJ34yiTkNTlaeIkkTZfpSTPzdXdOFm2fGp1qLe6wYc/+0
	LFnHPiAqWBWJGzgC2AtHJI/dtLdQCRhZJCaAbbGF7sOcBf5C6XDq0abvyrp+rgm+cdT3wnTZ/9p
	8KMI0rQC3rX5LWJ6HQQB66tKMPs=
X-Google-Smtp-Source: AGHT+IEiGjNOAm1kQqnCeHwbRlO6IgCR+SqHq6pVLksSOJ/nlS8jiL0+ZqvV+AivapMAr8Hre7giOlaDHHZ2z4EJLc4=
X-Received: by 2002:a05:6512:b9a:b0:595:8200:9f79 with SMTP id
 2adb3069b0e04-595842134a8mr7324699e87.43.1763554110316; Wed, 19 Nov 2025
 04:08:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org>
 <aR2OU4se7lxcMtGW@opensource.cirrus.com> <CAMRc=Mc==X3wERStdXmr5A9p0sPe7wdrPE4GZuqPLaKoBb9O9w@mail.gmail.com>
 <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com> <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
 <aR2i6lNNWEbQk0fx@smile.fi.intel.com> <CAMRc=MdYcdrQSDWKDHrx4-Y4-y92AQqr73MoRC3ws-X==SL0MA@mail.gmail.com>
 <aR2o2R30TbVOcqZe@opensource.cirrus.com> <aR2vrdBwF_oJ9H7k@smile.fi.intel.com>
In-Reply-To: <aR2vrdBwF_oJ9H7k@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 13:08:18 +0100
X-Gm-Features: AWmQ_bnlt7xm5Xhl0pfyQ1LEQXKZB_3reTw9ahGMipNq4xhMIivl8EVAqCbA7aE
Message-ID: <CAMRc=MfQTY7REt4Mty6mzv9Onwjv75LMU_RbJCM4LSgT74RHsw@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 12:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Okay, you got into fundamental problem of fwnode design it seems.
>

The problem here is not that we can have a single secondary firmware
node, it's that we can only have a single software node. But that may
not be a problem because the question here is: do we in this case
really need the software node assigned by the ACPI part of the MFD
core. I'd say no, see my other response for a proposed fix.

> (below is the summary related to that, but it may be not related here)
>
> If it's the case, there is no easy solution for it right now.
>
> And going ahead, please, don't even try hacks like recreating a copy
> of needed properties from the parent fwnode to get an independent child
> fwnode.
>

Are any of these properties needed/used? If so, then maybe we should
consider allowing the primary and secondary nodes to be software
nodes?

> The proper solution OTOH should be decoupling fwnode from struct device
> and making there a list of fwnodes.
>
>         struct fwnode_handle {
>                 struct list_head node;
>                 ...
>         }
>
>         struct device {
>                 // asumming dropped of_node and fw_node
>                 struct list_head nodes;
>         }
>
> This will require at first to make sure no code dereferencing fwnode
> (and of_node) from struct device. With that enormous task done, the
> rest is much easier to achieve as it will be just API's internals
> refactoring.
>

Yeah, let's talk realistic things that we can improve now and not a
task that will take years. :)

> With that done, we may stitch as many fwnodes as we want where the order =
in
> the list will define match priority.
>

FWIW we can already do it without changing the fwnode_handle
structure. The secondary fwnode also has the secondary pointer so it's
effectively a linked list already.

> > I am guessing this code has perhaps been more heavily tested on
> > device tree where it is more common to have nodes for each cell,
> > whereas ACPI is far more likely to have a single firmware node for
> > the whole device.
>

Bart
