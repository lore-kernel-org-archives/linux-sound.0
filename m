Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403B2557F
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709169642; cv=none; b=fd2Mu00ii2qVS7r6T3Fsi/ygLtke6XHY2ye2DUuTwQswdGCOx5WDtrdT/YM9S9wVCLZ4VF4rNVjH+s2VdEYoXiaeUIIpUTdNeFCfYVrR4ivCAnC048DauQ0SGWbx3zroDznjqKUMFspg02MJlL9Owvllg9wFMbGMlrouD0GDfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709169642; c=relaxed/simple;
	bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svFQMLfOrNaJZ9g8zf+gfyXvUuLdkjMfvcLUhgt6mzyCAuS2zkcG9FEYzfq3V0iXxl8k43P+DVGyH5L3ho7yiHt7S15c1k/e7S7xvD8YaXEEZfFzYHSootsIFtMEGy5Kbpzs84+L8gv/fMofblry2XMY9u+8K8Ji/T6ayej7YKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=33atkk5Q; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="33atkk5Q"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513160a49c1so1581e87.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 17:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709169638; x=1709774438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
        b=33atkk5QgfeUJtmxf3OBHJqW9VYBJPrL6rte/QbkzBUAGLtvBQGXMOYabzFaa4YEw4
         ZbmH+DB+i0PTMSvfWaD/6nLrmnjzAH9Ok0lHIplfF6psH+xFeWKUYfqbOMotyVzeDOU9
         KnVuJqueGKsffQHZ5Rn74yxuwrFdebxiEX/NHFTDuUaXMo37HX3sTFT2Zl9OxHdVEVHL
         /RISr5lIXa/e+hd6MzKbBSk4Uxrj02gYrh5EzsuRpRug+d8sM6hSLy/KrN76cu3+ndQz
         kIGHPoaz0jRxX8THQT2B5ggAnr30+TghXN4htHnLADMgeYIUXVvW9bjwggc7ZIi0nnOd
         w4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709169638; x=1709774438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
        b=S9M4xYyqGIJDfd84ua7CD3/z8FKjTX2Gb1UGXXi/CTssf/VMtwk3TdFrOvXI7bUolY
         SUpEhGaTb+T3Wd6OotmcGYTkDY2Ln7m3dQGQJyUFoRv3T8IZD7kt5Fjd0sogHhdP+4Pd
         Y4lxVkqg0JLnAYKlL+9JphFWTbArpM+kK4TFJYLdFXsQSHy4qr75i0t9x64tjleBFuNM
         sShuAt7w/SLt6IVvb8tD9rAjfIrcFaJshBNuXtX+J7h0va3OBRY6udVmQEw13gSZ8Etz
         VyDAn0/GmPrBL44f5jtlf95L3Qs4Ii0nKy2rcQswfwgGIenYgbLNVzlaSrOsi7RDEPEa
         DPwg==
X-Forwarded-Encrypted: i=1; AJvYcCWkZzArZ0NQiV1xvQTUKEMzWCUdwKdD6zZVZ9347nhnxgDpCquuG3M+N1XylrpWKGqvOhtIKpM6LQX6Z1IQ4R3Vrf9NfrsKIidLTkc=
X-Gm-Message-State: AOJu0YxmDt0gCnWPXh/XREPcQTKbLuU4I+aAqJJnqPokghm0+5sM/QGm
	UDhpXF+x18iaWUEI3yAToQxijCneXkumxt2tljPovjYsypUUCt8+vbpGEuNw48+ZcRI1sScQJS8
	Nz5K5g1UZ6OnJfSgmy+75xq+O2VNzyXE/ACw=
X-Google-Smtp-Source: AGHT+IH+1faJQ6/uhk0gfw8WjBzEoA6yFwJGOjkqCCQ5VIO4G5fNEb/+XhhhpVB3yiDXkNVFX0KRVuH2xhjKWBo/N64=
X-Received: by 2002:a05:6512:1247:b0:513:1cf2:e14f with SMTP id
 fb7-20020a056512124700b005131cf2e14fmr45944lfb.4.1709169638465; Wed, 28 Feb
 2024 17:20:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228140152.1824901-1-arnd@kernel.org> <87msrkhcz6.wl-tiwai@suse.de>
 <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com> <202402280925.5B709A60F@keescook>
In-Reply-To: <202402280925.5B709A60F@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 28 Feb 2024 17:20:20 -0800
Message-ID: <CAGG=3QU33tgfN_veiJWooXy2EhfZzUFkJZF3XdjSLE8fFCCkOA@mail.gmail.com>
Subject: Re: Clang __bos vs loop unrolling (was Re: [PATCH] ALSA: asihpi: work
 around clang-17+ false positive fortify-string warning)
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 9:39=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Wed, Feb 28, 2024 at 04:03:56PM +0100, Arnd Bergmann wrote:
> > My first thought was that clang warns about it here because
> > the 'u16 adapter' declaration limits the index to something
> > smaller than an 'int' or 'long', but changing the type
> > did not get rid of the warning.
>
> Our current theory is that Clang has a bug with
> __builtin_object_size/__builtin_dynamic_object_size when doing loop
> unrolling (or other kinds of execution flow splitting). Some examples:
> https://github.com/ClangBuiltLinux/linux/issues?q=3Dlabel%3A%22loop+unrol=
ler%22+
>
> Which is perhaps related to __bos miscalculations:
> https://github.com/ClangBuiltLinux/linux/issues?q=3Dlabel%3A%22%5B__bos%5=
D+miscalculation%22+
>
The idea that there's a bug with the __b{d}os builtins is
controversial. The consensus among GCC and Clang compiler developers
is that returning *a* valid size, rather than the one asked for, is
okay as long as it doesn't go past the current object's max size. (I
couldn't disagree more.) There are a lot of situations where Clang
reverts to that behavior. I'm working to change that.

-bw
