Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC5366DBB
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562272; cv=none; b=Fa/FlgjbWZU48VN/AejUcs8T9x4V9BfJkZc8Wysp5xPJZdM7iYLJkdiPRPhWhwce10ZvAxj/5EnOxC2/9bCDfmPtQy8Vr4fb4eZBHLmV8Sb1UfOdsNivkOomkWsYi4qA3HU2yGNBz30ey+YFuaeJbmw6/hf9b47unNgQreQwZ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562272; c=relaxed/simple;
	bh=vWSEerfPaRk+iI6tKXua2UkSPPsZ3pOrGj+xwe0dWZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzPngMnaFwN8wjdPw0XJg3iCpVZcidPAlzQl01VlPeanqCM8kjo6da6h9dqs2zCbm6OUfL3fGvcGAaXGHp8geGVLRMSH7JeLNz0Bt0Z5Ztnu93Pgv7XF31WaztrtGnZgue5RoyWEn3077wZ5uXVrm7PgF4AyRd9A+S5nlwt8eGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9l/0C1S; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9l/0C1S"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so9143675a12.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 06:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763562268; x=1764167068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWSEerfPaRk+iI6tKXua2UkSPPsZ3pOrGj+xwe0dWZA=;
        b=A9l/0C1SyVYMnYjBzLtCwzH6o2yT5Kc+1ikTz8rOYxbwlQne4Jk+n+2uprRlTQTlqN
         PseyNDMkpkxrl9Co4Kkj/e8f/odL+WY7IT+2z0jhRm1YYUfydqR9HwDpKRfktFvf0SBQ
         4H7SnHLE8zCyHaOtPgFPPQt4X1P5T6qFLr92vMIIJPCVUOnUOu8hDR4vnyWIgt5MHFjq
         om0FPp+WaCuOfOZPBTuN3J+sUN2Io4jK7BFa3S5pVV+sG9mF4zNRrqTv+wwL3AON/BC9
         xMK/F2QaeFmvAhfNvjqeJDf8W4ME12BlRagwx/4EgOd6d9imwgyZIJpZmWOLaMvpf1Cl
         oufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562268; x=1764167068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWSEerfPaRk+iI6tKXua2UkSPPsZ3pOrGj+xwe0dWZA=;
        b=CBbhkNJaE6QpB2PY0AD9sS1KisVtcLC3GaFZN1k9aIlvpKOBQaLtwMB0l+td8q2+Ub
         djNR4hr8HtnUAxuKmbY0BvnKzApYLAppP6XNaYLP40+mX+OD0HS/0dmYNxCn9gigJpml
         lBtvB7LAcvcpi84Y8IVEGuReoAg+iQBGYXWPQC1TqX9ofQiDsTSKdHf4/zzc4q9KiFQv
         99kUAnmRdn9gMlUlUzxzaI7wHM6n/j1v9tIIJFapmWSZCArs2WYLTPm8t5DX+aTADvNd
         xYTyYy7JcBb6oMaLSOBy/X7BQtvElFnKlEYhi3hpLiE6UWOCdWY7HkEcG5OPv9ywfDqR
         tXqw==
X-Forwarded-Encrypted: i=1; AJvYcCV4WFt7f1ODhU2r3cUfqN8v1XMcTwK3hya+LzctMofBRIv26f9DUosl9XVKoccI/RlACJTi9X2d3lgHgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjIn1e6eWwmtr30MEhrJhOCu7dhICqV/4cGliya7ser6yORtA
	JbnTQAx8GOe6toFqwvuDAE6w5cqoLu3UpMgQdFTIBihLNDKPDArBsNGbAlAT5PsG1OLuhkUXxf8
	SbU0A5rFI/NHksFdC17nLS9sPAw1Th30=
X-Gm-Gg: ASbGncuD+tuuxGKbEFZMUgS/xYN20M2sqTnSAvoDld5RwOhqlbMzqerdSZhh9VBWZN6
	J92KP4mxyE1t4AsgPegNTJQjoHRSDhChwAz+rrJb+VM3enHwGRuguvuyl5v9rm2KYky36h7YD85
	2uOTriVM1WpNHaZTNzhfN52a35qksPZ+MIMs09jJCo89bUfmbLlASv4hrGXsmWZSXp22uvQncUR
	mEL2VR/jhTbtH2EHD46iQCC8d2AqcBcc2DEffx6d3iJ5VOpwNAj8hwCnNM/4SihafuL/0JNMJq5
	Fupp6ByVNZAhzkq62r+0CLbtCDXZ3wiJ8VCPBIJGPg2ZVEf/Z9mVrA9T9Jd9WsmqITQC+4s=
X-Google-Smtp-Source: AGHT+IHn+k30CDgmnN3cX0JD20uIQgOwGKj/bJYkmvQ2Q992SFI9vKwkM/qNyYUaTShfNiFnIBCVTi1Yxe5OKWv9Bt0=
X-Received: by 2002:a17:906:dc8c:b0:b73:b1ff:4db1 with SMTP id
 a640c23a62f3a-b73b1ff5009mr967076166b.29.1763562267529; Wed, 19 Nov 2025
 06:24:27 -0800 (PST)
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
 <CAHp75VdLfkcrmaGBPu_YLDReyX5Gvu9pE6BXweArA5PmM3MQnQ@mail.gmail.com> <CAMRc=Mf9djJ77ob8L1OKa6HHBx_JxR_sajWH1mFGz=V+hMDbmw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9djJ77ob8L1OKa6HHBx_JxR_sajWH1mFGz=V+hMDbmw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 16:23:50 +0200
X-Gm-Features: AWmQ_bnJ-q9HQiQwowyGZvvUaMzh50-2xom6S8QmPW3aZF3X3xIPv_WvQVzTw5s
Message-ID: <CAHp75Vf_+WzMn+pmwK4zhLEZtG3Uat4FrdFMCMtPmmX82E3Wzg@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 4:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Nov 19, 2025 at 3:11=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Nov 19, 2025 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > > On Wed, Nov 19, 2025 at 2:27=E2=80=AFPM Charles Keepax
> > > <ckeepax@opensource.cirrus.com> wrote:
> > > > On Wed, Nov 19, 2025 at 02:07:55PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Nov 19, 2025 at 1:53=E2=80=AFPM Charles Keepax
> > > > > <ckeepax@opensource.cirrus.com> wrote:

...

> > > > > I still don't understand what the software node that's already
> > > > > assigned to the SPI device is though? device_add_software_node()
> > > > > should work just fine if the only other firmware node the device =
has
> > > > > is the ACPI device node.
> > > >
> > > > Its the software node we assigned to the first MFD cell, that one
> > > > succeeds but attaches itself to the ACPI node as a secondary.
> > > > When we get to the second cell we try to attach a new node but we
> > > > get the one from the first cell since they share an ACPI node.
> > >
> > > Ah, I see now. That's indeed a fundamental problem that can't be
> > > easily solved. Andy is right about the needed change but phew that'll
> > > be a big one...
> > >
> > > > I think as Andy pointed out though the first 4 patches in your
> > > > chain do loosely want we want. Previously, we used the name to
> > > > point to the actual pinctrl driver, your patches should let us
> > > > do that properly through the fwnode. So we can drop the pinctrl
> > > > swnode and just have the cs-gpios bit point at the actual fwnode
> > > > instead. I am trying to hack together a strawman but its failing
> > > > in a lightly odd way. Hopefully I can get that sorted fairly
> > > > soon and post, or I guess I could post a version earlier if you
> > > > wanted a look in the knowledge it still doesn't work?
> > >
> > > Yeah, I'd like that. I want to get it upstream and have interest in
> > > getting it fixed ASAP.
> >
> > I also have a side interest that the reset-gpio becomes an agnostic dri=
ver.
> >
> > > For the record: I believe the logic behind this patch is the correct
> > > approach. It uses the existing MFD infrastructure that's there for
> > > exactly this reason. However without being able to have an arbitrary
> > > number of firmware nodes attached to a device, that'll be impossible.
> > >
> > > Just an idea: we could try to do the conversion gradually - by first
> > > adding that list of fwnodes to struct device in parallel to the
> > > current approach of having the secondary pointer and then go from
> > > there step by step.
> >
> > My idea was to mark the fwnode with __private and fix the (ab)users,
> > should not be so many. Can somebody mock up a coccinelle script to
> > find all dereferences of fwnode from struct device?
>
> I think you're underestimating the level of complexity. What about the
> concept of dev_fwnode()? It literally makes no sense if we switch to a
> list of fwnodes.

Why not? It will return the pointer to the primary node. You can look
for example how the list of the DMA descriptors is done in
drivers/dma/dw/core.c. Not the best solution, but gives you an idea of
how it may look.

> For it to make sense we'd have to have a kind of "dynamic" firmware
> node attached to a device which we'd fill with an aggregation of all
> properties from firmware nodes in the list.

"Dynamic" is just a node in the list. The only potential problem here
is prioritisation. Should we add to the head, tail or insert? But
converting current approach will be straightforward.

--=20
With Best Regards,
Andy Shevchenko
