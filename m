Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA3328B6B
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561518; cv=none; b=IIOEB+wAmHYeLILT065jF0Lc6+YF3Ul8wGm1r2RkU1kbgoJQcBLDqF0Z8fWloMXQ3Df5fQJ3zho+UnBbpaT8D8nqFmJjy/s3Q4hy9XK0YLxhKj5e3mrW4Sjt2iGMwgtvsjwXoaXvTNzvgBsEsCAcEvfgULBNTHBGYoxwY1uixyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561518; c=relaxed/simple;
	bh=NJrhdUcFLHXStkeDIb9AkDD9PRD1EDRXbbGXl7OqDr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku7MSUQNLmDunuYl3m551wEbcWwcZsT9xqjx33Sg35xU2J/nIU/tnFBbln/1GI9mj2VBeV9lDMXzw4eD1iFLfWAMr/EP43gwmxGh0m6Pgv200ak1F18Ei6/QQYCn67Td0TUWIjwu6o6YdUNBt+IXfsakxh7nDlPyHzbAZHX+0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYyC7iJp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYyC7iJp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so11283092a12.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763561515; x=1764166315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJrhdUcFLHXStkeDIb9AkDD9PRD1EDRXbbGXl7OqDr8=;
        b=DYyC7iJpqqRV06zUs+DgqnXM4pYzJTJUdJnnE+eeE1uhu5/umxlS9DOJ5jyvnXwQLs
         tSKE98q1x5uvYvUMLd/E4u77a9AbOCMj9YW6klmLdokap03/MDqs24xqFuDK/ZQIbTPL
         PhgWIyuWQE+t7Xn9/MCnA6ksQUAtzFrwFNAm8QyLNkJ25PB/w7vvjylxnt1WTPZTZmzj
         VIOujkIfkNoRRrEIheJ4n+C9zaeGgk/I2fSh7STcACcdnMVWBGFjlO+itEHFMUWomMlw
         dr6WH1ihBvaItrW8itmxTpaRmA8xz9BLS9mbLKQoGLiLkxDMuG41runK/cjbv+nes1dw
         oHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561515; x=1764166315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJrhdUcFLHXStkeDIb9AkDD9PRD1EDRXbbGXl7OqDr8=;
        b=C4hn9HIK/O5ScQxAAbOM+wr5hy8xrhtBGWIKxeC4yzYq0OD6BOhfftJT8AnTHpLFDD
         z1pxc7dUXJZVdtjICYT0otDQ+NVroowIVjGlHOQhQJS3IcNXRF1EPqHCATGt08HMngNn
         Ftc3TG7a7/UfJQkzo60Osyuj2cdCQMKtlF7FOQOI+VJGFreciT/m6qBKybuhVIdT7vnH
         yDKJgxkzFpbxdmf87QAkbChTOzoevKQZMD6gH27epWmao2/JON6LU+fM3S7Mjl9jzLO9
         F3gU4NZ8E7wrEDhOehnE6BtLyiffmtGHi0llLdAsUPtwxCq8KQQ4ZgDPodIf3cjMkdjb
         9jJA==
X-Forwarded-Encrypted: i=1; AJvYcCXoavDPVGftd1StgE6burTS2iNEyzz5HriZHDg+QUaXXScg/I7CczgeFoBtuvL9s6nzu3S2Tb1ypnkc/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWzR59CAYJ3JMV5hUijVQZSy3QSLDWiaSnpmCxVJboqXsUIzp
	jYqtsWRLSNnuOvxWWiSMg23htN6wCDgXYDorkN1I7ON16bPYolggj6edsQWjsX2dulrCg4XMYM8
	pGvhu7QpmYbnTQf+p6oY0oLvsX6kQZv0=
X-Gm-Gg: ASbGncu8DRQigct/B8CN9Cy4m9AMKcRuJiwkwLjPlT+WYSvFSDh8yEfRBdk9N0Q2lWq
	md7lQJWzngxGOlH7na0NT3v22nDkRpdQCWqWsQjjUDsPC0mpnmRPa2YGQHxR8sJ44wvICAuC3cN
	I/Hx3rNI2qI7nc8RhVq0e+VfSkWQF7t/ZUHlLpOt2Q8g4M7GmXlp4Vb/DzVYU5DzLWHqiMJQl38
	GwT0JjtpLiCVsfFb8xZya7cNQi/tcLCCMipNuR0Yfs5pX4MOla/ChtVwVA0boGzexuV0vOsZA7G
	KF9/j8xTjUyc9Ijn1wa00/c3kMaO3nioQ4HDh8jR5jTwltQtBUzQGs7pQ80s4rKkzfyJ0mbk7mH
	otnTbaw==
X-Google-Smtp-Source: AGHT+IFEXIkjxyjvo3Heg8Rdqnv3nAxyfyX8doWI94v7sDgAwB7zhzPma511LvpWLcEqAp+oBuiHOWStr+0eOQi1eXM=
X-Received: by 2002:a17:907:6d1b:b0:b73:398c:c595 with SMTP id
 a640c23a62f3a-b73678add5amr2235890666b.19.1763561514654; Wed, 19 Nov 2025
 06:11:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com> <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
 <aR2i6lNNWEbQk0fx@smile.fi.intel.com> <CAMRc=MdYcdrQSDWKDHrx4-Y4-y92AQqr73MoRC3ws-X==SL0MA@mail.gmail.com>
 <aR2o2R30TbVOcqZe@opensource.cirrus.com> <CAMRc=MciO0WYejOYZduqE73U4OVTxcaMfe6Sv1VXWJWL2FFNmw@mail.gmail.com>
 <aR29uKW7yLxws9jA@opensource.cirrus.com> <CAMRc=MdXNXQhE9zi=i0x0yGCi0fKQNU8_tn2_Uy24TAhxG7BRA@mail.gmail.com>
 <aR3FnUNO4DyCdiLD@opensource.cirrus.com> <CAMRc=MfuQSGPbt3x366j5c9Sg-mgu=TfmD6X25Dk5Rmu0JiiEw@mail.gmail.com>
In-Reply-To: <CAMRc=MfuQSGPbt3x366j5c9Sg-mgu=TfmD6X25Dk5Rmu0JiiEw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 16:11:18 +0200
X-Gm-Features: AWmQ_bkdZvQRGM-9u6BPNa0MIyrFFzDnJukSJG2IxcoLgl_ofWnSxnzvQoAeVFc
Message-ID: <CAHp75VdLfkcrmaGBPu_YLDReyX5Gvu9pE6BXweArA5PmM3MQnQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Nov 19, 2025 at 2:27=E2=80=AFPM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Wed, Nov 19, 2025 at 02:07:55PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 19, 2025 at 1:53=E2=80=AFPM Charles Keepax
> > > <ckeepax@opensource.cirrus.com> wrote:

...

> > > I still don't understand what the software node that's already
> > > assigned to the SPI device is though? device_add_software_node()
> > > should work just fine if the only other firmware node the device has
> > > is the ACPI device node.
> >
> > Its the software node we assigned to the first MFD cell, that one
> > succeeds but attaches itself to the ACPI node as a secondary.
> > When we get to the second cell we try to attach a new node but we
> > get the one from the first cell since they share an ACPI node.
>
> Ah, I see now. That's indeed a fundamental problem that can't be
> easily solved. Andy is right about the needed change but phew that'll
> be a big one...
>
> > I think as Andy pointed out though the first 4 patches in your
> > chain do loosely want we want. Previously, we used the name to
> > point to the actual pinctrl driver, your patches should let us
> > do that properly through the fwnode. So we can drop the pinctrl
> > swnode and just have the cs-gpios bit point at the actual fwnode
> > instead. I am trying to hack together a strawman but its failing
> > in a lightly odd way. Hopefully I can get that sorted fairly
> > soon and post, or I guess I could post a version earlier if you
> > wanted a look in the knowledge it still doesn't work?
>
> Yeah, I'd like that. I want to get it upstream and have interest in
> getting it fixed ASAP.

I also have a side interest that the reset-gpio becomes an agnostic driver.

> For the record: I believe the logic behind this patch is the correct
> approach. It uses the existing MFD infrastructure that's there for
> exactly this reason. However without being able to have an arbitrary
> number of firmware nodes attached to a device, that'll be impossible.
>
> Just an idea: we could try to do the conversion gradually - by first
> adding that list of fwnodes to struct device in parallel to the
> current approach of having the secondary pointer and then go from
> there step by step.

My idea was to mark the fwnode with __private and fix the (ab)users,
should not be so many. Can somebody mock up a coccinelle script to
find all dereferences of fwnode from struct device?

--=20
With Best Regards,
Andy Shevchenko
