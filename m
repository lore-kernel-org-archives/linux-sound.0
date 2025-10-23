Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE73230BCC
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245044; cv=none; b=UTSBmbK1NKDwSqDlQUf7TRcCegRlAlu4EPrNYOH6A6hJf+kRm5FyJX/aOc7G35Bfu0O1vhHBvmEWkUDv/fu4CjSuQteYTf8GABnoMeCLltB7NFYVgnmjnMtY/DizDdff7HORe23564HahndNpxGCIIyJHe5EXnmwwL3CtqcrGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245044; c=relaxed/simple;
	bh=PYp52JdL1zIXM3tFl6ymQmTmBEsgbvGo+/rL6L5cfGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuKZx41SvJdprYgcWejQm14IVZiIBfbqqCArTfgU0cP+p3MZoCcQAVyejRmk5ow3IjWSdBm3lRFjVEsBCvzLo7INurSEcxO0VJlm3fD1zL4DOfsEbN6X78oxkR1LVOxvpNVZ6AE6t6y8l5s0ajZRcBCHJiPupnIWbzzXtNyzdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s0yNVa/e; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s0yNVa/e"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58b025fce96so1079422e87.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245041; x=1761849841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=s0yNVa/eJZhfoD3bMLT1xWtZBJPc1t8A/Zn2xYvJEgb/5MtqNO0u6wsuFrM8+isO8U
         a8RqaMEzvq4KU+ucS1pGmFbO1lJkh200XIxtI+uKBrtnG6LYvmZhKlbST26f1dgZKE1G
         dOKkExTkR8MKfeKYs7aXi148bX5ANT4YL2UKuU8MsQpC5zW3VrySCfAv6AqUxxr4U7+w
         YLQx0lhCkihrCpKURL10BMLreCwmNrK2c+SVDNma9CEgKoPeWpeXS4Dtfjcr7DRXw/5I
         R22ChlayhU94emhkIFIMNElmKGF4HJbaff2HtFXiz2ZXhy5tspL9shNNfuFjMpURLrzh
         TvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245041; x=1761849841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=L+b/PSFKO1dt4rw/sIMq0FFeTyjEGe25dqmzNNFzzkcs9vfQ81yTp58+V9ucayDpOC
         dm3mAamWX2nbaEJ21GYZVG8NnydQpJzpk791eFSpt1o6kJAyvPAwSE4ATq2qmdYzNvTq
         Iqoa4gXuXMQI/pOBkKe450g5Id4oYlOfd8iIK0rdvCMDVQzfVxwxOm2uJRBo9b4Ew3Am
         NKZQrdd4L0qjtknV4j+QCVmfM0xwuTsqGyC/Qaq6jl7uOm7CT5XqYhWWn7OmP43CceEf
         cGKUN+jzdJJhTXJKLewneSxdW4krchHcHKonKgmekIYj+UjplzXYjvUWB9QQuy3DhVVa
         IVaA==
X-Forwarded-Encrypted: i=1; AJvYcCV9rwHTz6V0Sj344vEmnWv/T2Y18bE193au9PMNW67naDImv9/wFVqI1EJ+3fPDiZwgzURTEpHQanOkog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWWw5A9A30DRtpuTFgesKlSMXrod27bAX/1lI/QGQjz4GnqjJ
	ohiiUFZqUfs/vdQSGwwCLk+d/7CdHI1Bu8ilG4D4RHZmda1t5/KRBJgF0rbtYA6HirM+RxSgbi7
	Xe4P7cEGX/EUOiak3+VA3A9ue824W4tY+Oq9rjgDPXA==
X-Gm-Gg: ASbGncuoccW+cWX8jmZ9pQ/cZH7ol1nX8j7DNk7xyAL/OZN8PpB6MnFa/76QU04QnpQ
	YCPB2/eeaCbrr2ZHm+GXjpYbQWQzGaGV+x2UiPuu7WSosWw5OnUdE8eXtvLMSVdSCC+VoQGgmik
	sT7+54du5qlc6E3UvJ0GW5HTlC+9SCEK/7bJ2WxbZx/IJpLK0sJ5ByV2WnjxxpQ7LZZS0z3CgGJ
	MieW8ZwvBhvVH23finckwOzaSSU21/0SlY/WRVJPE18q9+RBEej+8glNJJvp4uYAO50AEavbx5k
	pcYIqPHoOaVifaqDT4Smloolsg==
X-Google-Smtp-Source: AGHT+IHraJus61bT3Hr2N07s+Ur3YCVMAET0C9pakpGhymtxfywdhGOWwy5gv3wy+GpPvNZ0Z7OpA/pQbI51BbDb264=
X-Received: by 2002:a05:6512:3b1e:b0:58a:fc55:883a with SMTP id
 2adb3069b0e04-591d84eb531mr9214189e87.4.1761245040819; Thu, 23 Oct 2025
 11:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com> <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
In-Reply-To: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:43:47 +0200
X-Gm-Features: AS18NWCf9BHk3M78U-yTtMgDQhhnI1g2CI7k-KfJvPnPOvApY9tkkzNXTL8vud4
Message-ID: <CAMRc=Mdah6ve68h=d93VHXGij7KAQiGWuOGtzX_7VSPsCi=bbQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 22, 2025 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static void string_test_strends(struct kunit *test)
> > > > +{
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > > +}
> > >
> > > Have you checked the binary file? If you want this to be properly imp=
lemented,
> > > generate the suffix. (Actually making the function static inline make=
s my point
> > > really visible)
> >
> > Andy, this is bikeshedding. This is literally the least important
> > piece of this series. It doesn't matter for the big picture whether
> > this is inlined or not.
>
> It's definitely not a bikeshedding. I try to keep a bit consistency here =
and
> I don't see the point of bloating a kernel (binary as well) for the funct=
ion
> that just a couple of lines with simple basic calls.
>
> Also note that with inlined version strlen() for string literals will be
> calculated at _compile-time_! This is clear benefit.
>
> Really, library code is not as simple as dropping something to somewhere.=
..
>

Ok, whatever I'll make it static inline.

Bart
