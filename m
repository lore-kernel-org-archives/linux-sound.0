Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDBA392C3D
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368637; cv=none; b=TQseoV2urjW+Wy9R67oCR0kg8RUfLYM4SPJqx/BVFBDGy4rYodAjG7bWAXM3mPmXKmLARvIF3FiAZANsFh7JbXr/pjTc8vGAF7Yu5Zrqm096dTwmtLoNVp2yEJtZAXPq9vRp7tec+wu/PsKlqEqcP6cC3Cusa0NG2FrcAWn51QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368637; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVxbi1b5V6unXfMJdraSc3zkxr70LxAoj/yT27uus4j0ZIV3b/eQ15fvW0b0M987+8cVxA2zhf46CvSkUjdijBHcUFww7vomq3Gvsv7qWPQ6Zlnr+Fu6pvRALiaF/yUgr7o8cSEwNvY+WBtZ2Is9umb69jfBO+g+DVKv5SEy4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b886fc047d5so2002672966b.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 02:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368632; x=1777973432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=gjuB3Sn//Du6bdapVUYGc50eX85rGDCEmHBj4Odo+oppUjtI9yo3EslqX317aJYYb/
         8pEvBcobbR0/6RCa5xOjRwqKVP6S9EVQR6nmcvcuYBvXdHOzwG45eyd3sOzYpgai/i65
         CNVhg8ClJdFwO+JG8nEyB8FR27tiFlfNPdO6TmEuaRGP2G/UWTy5JKhS6mqojgFeLIfI
         /amV1H0B02Rfz+XMoR5RvDYDQWZWcIOaEIbY3aRAYfvzsukoS4KCGc0+u4zhBAGqOhto
         cgPbJPhSewWtKWjgbkDek5forP1poZgtyPuPJVgve9jsyLeKTzDF81uLd91eil9cKifY
         NmKw==
X-Forwarded-Encrypted: i=1; AFNElJ9ryZu9Zg+uHb5zbvrg+YZ3Dz3Kd8wjqaOlMv/PL6WZRgpBOYEyNeW1c3uC/sHTuyjsCo/K1FPctLVWIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJVwV6rGTFku+inPdjUoVYz+37vC0Orv3hOlS0p9p17h7BtLh
	Vj2VlZZLRiRZCkqKVIe2HtvUUbakM/lflrl532aaYDy/MuTWStpwCklSZz7nqj0Ry/w=
X-Gm-Gg: AeBDiesycG2GymyDnwVJsFSEiM4y4o7UFde3Wsga8sCcCTv0wYcLqDGftEAH6GBllLZ
	powJ3xl0/DYK4/jrMmbI7ohpUcXMqLp3/HyBm6aYZkVuUwHYzkxGg6O74fBhPB/IulJ37jww933
	mccwP1STnYbv66Ao9pA7mCmgBhwWm0jidQ39b4VoEvJgR77Eyi0lWiPSmWOPTB9amEm6s4qmZ+J
	7cTEMbEFCK+G+tCvH79KxRlUdpV2gexz+LW5a1QYLuaMyxDvv5Irwm02RZI7u3gtx351vBE+EQc
	4xx5WDQg3h/ri7FM9UOYfXAyKe3+S9f8KwfOAOIQKtwr+8AWdiyjVucqnPxgEx3Tsv4EpiFWJ5M
	+95jzTdUnvIo9Vj9F4LJ9cT1r927Osf4xwvTxsO52XC21iEOD7cC8mwCOYRTqP0KKuHs+dV5nOi
	+uyY0fW9MbizCUUfgF7pNVxvSr0m1Q/EebIKYuY9xgjbM4O2myA8A6MR0spIdXg1G+08UVpTg=
X-Received: by 2002:a17:907:6ea2:b0:bad:d530:dbf7 with SMTP id a640c23a62f3a-bb804727dfemr137249566b.32.1777368631807;
        Tue, 28 Apr 2026 02:30:31 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adcf1sm74415666b.35.2026.04.28.02.30.31
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:30:31 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f97c626aaso932338366b.2
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 02:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+aVIZkbzjbvZwkRkSDgard043348nrv9UX4RjPhFDsTgGdXB/D0fK86hIoz0ecYgJGDjaqceytIc3wmQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
