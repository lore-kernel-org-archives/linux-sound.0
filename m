Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3D21ABAA
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331193; cv=none; b=lkfM82fLAn6kYIahQU9vWxCvZqshlZUKYPgFO3VYvGLtn5abw07E9B2Xn9p3N1oSQq5gsqb2QaNeHrKxJMuoP5KtIi5TfVhwooRznVn8kmBR4iCS86VAI6vMr2kK/vEg56nizckfajLLOfZDWTtwareQDPnIthAdLnvkuB6jNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331193; c=relaxed/simple;
	bh=+/APqOnN84rXLQeXUydTcFlZtrcqSjMaTX9Y+xK4YE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFGzMpgHGuhhZRXGJ5gzVwZ9M+r51p4Rs+u6CqNAbOGFbs2TrR5btBFEwoQ8Vc2LPHSrfGhbEUXKWV6ThSkT5NEiV/az5P2do25CvzUrRJGjr/CHO/7HEbjbZ0PVncrx2txyvVmUFdcqBtNtaVQjm+1zddH+TYs9mms1wKTbsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1+j0f3m; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1+j0f3m"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78c38149f9fso30541157b3.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 17:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765331191; x=1765935991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=Q1+j0f3maF1qb+xbAVAgf08HIzVqoNZ+gYsJisxuwZjzCjCQrWNm2bsyTlUGDVTrlU
         H3DlAMc1nz0lz6ZNOdbVaZtbWKgl9QAC+qHFb6RgTp3lLh3FeLGySXuqlhTYm8ViwXiv
         oG95yPYo3iFLN9uPaqszxFGzM7TwyIWIM7dbpNnw7lvTa+7c6H2fv8FpMZ+AAt+fBFur
         lZjOXs0A4Vyx00OW0GyZW0jtm+3py4qNc6FCDYgXkuOBC6e2i4Wz/5mmGQHYtvkhSH+c
         ITywSjmYknJBJxgnLFddHCy7wql+XEb7ikQMcUMchCJ6MAd4bxAhDGoN7NgK57a5ilIE
         4oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331191; x=1765935991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=kSyllA23UOhoQKQZctI933mP3RGbo8EMc9SVJ4p7szVF0mpQhqW09HQzQoLQdA0qdr
         qKI66j7QSng6WdbcqS0gW+fwmIelCHVCMDdtHzKyaunakYp+8guRJSGHO2bnrp4j6Teh
         0pcGbvv7kWe5ryZ30bgI9cjRxaE2/6BHIDjizot3g6/Wunjh2jX2d4BwVjMF0mTjdY1/
         w0AgMW/XQNyx8ItWmB0aYr7/SYI3ycYrrpyxlNOTv2RqbCFUA4FCsWXWgvz9Gm/iBESQ
         iHVpo1xK1t8HGSaQdU43k1aRw6/AsPH6eWhgdD/8zfPH8DfpuOSjyE28AeeX2dY0M4a6
         MPzg==
X-Forwarded-Encrypted: i=1; AJvYcCXZW+9NaF5pzg/GHDiywV9Or0lNrrD80Z3IxZhWUV+854oawp+Y0i2v78vdFNB+HvmMR4SFM7taqZxv+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YykM5zh4i3o7W9gre9za4vWO3gFWOB7d7FiTCoVP0Ggt2LQntN/
	Rw+iiFnbybUWRerdfdrJWxp0Wv8SV6SbFeZPSkoX0cmSnugx8N/8ynrPv9Qs3DMbg7hW0sHoLMf
	9Le/+bJ9mRBNyZmwcyjSRf8R8uj4PA7E=
X-Gm-Gg: AY/fxX7kt5jW5UcP8qDA/b+BDhDbyxfPFh5d8BiAaqG1y1M0ayzakO6IVtyf7/vWWwb
	yVygT62C94lc/gfGYKAsqLT4VQKu0eYibhsuL/1zBYFB6xpbJEJKjWJeBbr7awt5S1Ooxyh34fF
	ZXLvey1ah+ACl7eU/Z0lBav4VcVE5dW7pkCf5GpCZCSEV7ZcQFdTcfRLyEcksXwc4H4hx7n4e2o
	s8SokdGd9+Fb55nD/Dz7C788pxiZNv5ER/uO2XfZoqlf/WNM2vF/4cGgnzU4k6iiLQKGYpn
X-Google-Smtp-Source: AGHT+IE85Xv0u/sx6VfPNzN3g4Tl7u3d0ImAA0DZGLPPhQUIIiFLjZzVvS+WAuRYWIBQ7d8QfLpIaV6TgcnURt8BOek=
X-Received: by 2002:a05:690c:4a0c:b0:787:e3c1:8c with SMTP id
 00721157ae682-78c9d7cdacfmr5671147b3.64.1765331191298; Tue, 09 Dec 2025
 17:46:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
 <871plbucj3.wl-tiwai@suse.de> <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
 <875xagt7d1.wl-tiwai@suse.de> <87y0ncrons.wl-tiwai@suse.de>
In-Reply-To: <87y0ncrons.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 10 Dec 2025 04:45:55 +0300
X-Gm-Features: AQt7F2rd32LSsdqWLpP58mgpRDLCWij5Xhm4_fvW6LhI8L_uc3Zw-8pHnicMoVI
Message-ID: <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 12:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> The below one is a revised fix, just to be safer in case the legacy
> driver is disabled, too.  Give it a try.

I just tested both patches (this and previous). Both work.

Also, please, add this for regzbot:
> Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/c=
ontrollers directory")
> Reported-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin
