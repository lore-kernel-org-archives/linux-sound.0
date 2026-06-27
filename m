Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB51B6D08
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553004; cv=pass; b=dcI99nagEjMfgvv2RhKoZQGgQKRWTIp/KmluG5ow2I9PqUvwkHd8shh0WHuukzQE7LIWTBLn9jjL4n0NQp/O0dGkCoLSAorD5p7aWhnEm3aPs7VTc4ByPJQWMWWoEjBPEnosF6eBIjJ/xjarOXIl++Rp4I52w9HGvOfW65SbJ9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553004; c=relaxed/simple;
	bh=mEey0mZ/YQUVVRfyx512hS1EOJH/O+P7h4hxapMTi3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtdgwkDdsHiJqVcprg6mxdh3fdXn6RNXhqJ2DzJqrQL+DxBIBReL24bYt3cELmLcUGYiNlPHS0cGnE/nNCf/5zhd2bBfn0hD4KUL5ns3GR91tWZzZxKMn6WoBUX9pe9HkSa5OvoLWT6VZhiEY4afIg1Z5pc2+JY/3G7Yx1T8eGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAi0AlOk; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAi0AlOk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so1090412a91.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 02:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553002; cv=none;
        d=google.com; s=arc-20260327;
        b=HiQiTT7vWhnXOINqhcUiBmV5Evmiy4CfQMHcGYT3aritK36qB07ryiZlsHXQt8TadM
         z9TiDcuHZQyVjEwcd2GXuHTeCtiepaFTzlOJGrUChBCuw8RPY0kl2Nfh6z1Ts87u38Si
         muqqv/LVreqCEaFwKjEy/Z1LK9EIK15hU6uVXqkpdocYF44+9heTVabTF3D1HT2/DO/c
         qM6LXRu4TKkTJ918nk2QaNt7R/ZM8TMqZsKQXiQMiYH6t/wx4OsgC6FH7/4QOPwRUHnu
         mjJlbjbW6+kBBbHpm5TaWVSgWfUFJCdQaP4KpM0i50ETekfzfmun5gcKz5v7o/pBoxH1
         +49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        fh=lzPPSKFbLaaeH02jNaeTDBimvAF71d4wgjGvJBfczic=;
        b=MyJmOavVjKnxmhENwKbYb7tH1Xe5wgQwljehDSORiUWKL9P8oZbnlfkv99FoJMFWs2
         0SssdFLgSq7lqKsLfPVMPReTxJqN9vKJ2xoFrROnsSZmScNx/eK3mJjJoSNzpAAxYWKV
         /9JBkpOlupsTvg0Upw6LrRilsoe3+u9wqP5WcGD7Bfb/uQv0w9On0Bq/ZlZqRYqb32Ce
         aNRCw51+aGgcNAfsd5orPUfqV5V9CsLq+SkfHoYBuqOzpDaR2/b3TkO8nlBrddI+PJYe
         XAArZ2Kwb5gkvyLGPHYufReJ2ByTqryBO5f836jkkDhH/0QfH2JAGV5E9FJg8B0irqT0
         hO7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553002; x=1783157802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=nAi0AlOkXtJ0F90wS7rcn0xvD5mZcq1xY2RqZjccNApgf7V0Is4Wp/dplOu6cHjebN
         W1XtNpxh9MBKwpN+KNgaVfAJ85FtbCi3Nuh/WbsZuaEU7On87msfjc5PgVj/JaRxoho0
         5bNuZ/WtKennoJ0YfwB+Jcw30zF4TXVS3YXGom2IkKprn+XfFRhUZB1RY1OXXX2DB5hG
         B/mInTETUpyS/ScH+WLAF8wu1fPdrn1wXw2A7yum7NBqOdeE3anjlsY0zhjoD5BwgndL
         q8Rhn2ZAS/aOUp3kFbaKil6mCYIqtDzZCgKY0mpbzSQWY8vjt35eaXKqyrnGHtroizue
         I+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553002; x=1783157802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=WEitVZmrWLLqh2FJrqKlwC6+5Qci95vZ5aWjpj5QKPr273u/YEsLeR3o8fsgTLHkJI
         yHxKmu4XGVm5kHq4BVAr0NKUdskI9Al3T1NmPz2Wx+Mc7UEyI/Y9l4dx1FMhQr+NsXTV
         Z6rTkENcOJOfQooegbY/pEUawKHPl6xc9TLIZHhccmgichIRBOxbMmJ4yNqIKYEJdYLj
         BZHEgJVWLZ0DuF4hL9bcSXGWdn1PwqpFVD9J+GCowQdAguX+f/JVaHwq1GkUjRhZKeQA
         dUQyG9LPrHRFy3hLztakc4ynYAtIzAjiA2isBHQNVaxrL3A7ZiaTkvK+Pj0+lch8v8Jx
         99LA==
X-Forwarded-Encrypted: i=1; AFNElJ8CWvhKXM+vThjvkn2xHZKHTZHMOVlPJiKW2lSVrfCq0579gQEPvK2A/VXDtYeqzgtL4po9Yusdu13zQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/LQpcJpuM+zWEtJAfwIrqW71P+O5ISSARU0Cb0uxs8jF+vxIL
	JQ+qH18NdcJfNjOZdKMm5rksaE3meSj7zLqBAlVYvwFKOxC/YXpTJ0bOP5IxfcYVVoIIAkQCbii
	PouCCGA8jq9AOC1KwcGPNZVWIoGixuhY=
X-Gm-Gg: AfdE7cm73jEdmtf3TkcI6l/hnEckao0iDP++uhPU9bgZGBH451bondg9xmdR3z9j8kp
	wcgCgUTKJsIxz0TxMMnXwGpGb+feG4biABLjQTBOeXX8mHQNqF8hyT9ntRZF5zkK/Ld9cdagDLa
	c5iB/lwbquTnnx6KAZ9gqYWQcIVyJ3kPcPlmrxtH4a0hpc8TfiVcQ/zAO9LAZgk7xoLId2cD6P6
	2WVsT71enLrv3/IOMUU1T8HpOYpYNrAO/9Y/jc8fug0+DgOZDUey0Qn5Qi76gWLPFKhjsORdpHh
	nCvIfEwMu2XSuZIzX+m5Ksi9nFbBvGIaHemaJ71l5tE5DTRfKk6JVqAx3y78AA==
X-Received: by 2002:a05:6a20:a113:b0:3bf:7ab7:98a4 with SMTP id
 adf61e73a8af0-3bf7ab7993dmr1131724637.27.1782553002174; Sat, 27 Jun 2026
 02:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-24-phucduc.bui@gmail.com>
 <aj5tUdjxlzkDIim1@opensource.cirrus.com>
In-Reply-To: <aj5tUdjxlzkDIim1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:36:30 +0700
X-Gm-Features: AVVi8CeL_jVD37I0a5oLVQTKzU6vWi6apDu8KwNvmQOkUF5YXGnGH1JqPRV7teA
Message-ID: <CAABR9nHdqPQE9U1jA0J8RwUpgpcnFXXvx+bTPEwAWBzLn6=ahQ@mail.gmail.com>
Subject: Re: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:15=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Fri, Jun 26, 2026 at 01:13:28PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > -             snd_soc_component_update_bits(component, base + CS48L32_A=
SP_CONTROL1,
> > -                                           CS48L32_ASP_RATE_MASK, targ=
et_asp_rate);
> > -
> > -             if (change_rate_domain) {
> > -                     cs48l32_spin_sysclk(cs48l32_codec);
> > -                     mutex_unlock(&cs48l32_codec->rate_lock);
> > +                     scoped_guard(mutex, &cs48l32_codec->rate_lock) {
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                             snd_soc_component_update_bits(component,
> > +                                                           base + CS48=
L32_ASP_CONTROL1,
> > +                                                           CS48L32_ASP=
_RATE_MASK,
> > +                                                           target_asp_=
rate);
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                     }
> > +             } else {
> > +                     snd_soc_component_update_bits(component, base + C=
S48L32_ASP_CONTROL1,
> > +                                                   CS48L32_ASP_RATE_MA=
SK, target_asp_rate);
>
> We can just drop this second write, update_bits won't do a
> write if the bits don't change and we know they won't from the
> read earlier. The original code was a bit odd, but might as well
> clean it up whilst we are shuffling this all around.
>

Hi Charles,

I understand.
I'll remove that else block in v2.

Best regards,
Phuc
