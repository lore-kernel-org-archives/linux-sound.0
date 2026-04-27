Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE335A393
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 21:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327125; cv=none; b=sV1Hkx5D/l1qwvVoOZzLTpTkAt/v4o1l6lcSF8GT6lqi4S28yUd8Y8AyAhzkzNzlwQrB57lrrBaUXt9PfZExTWSnsXbj9J1pt3GOeikxHQ6eE/7dL/8S1rM4SsX5X3aO8S8qX6wmiB5Yj6/mt1uY0QBeEIiXDjNz3Po8RkhDwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327125; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WI6E3yYe0Kp7qubObkVKELRBsSAxexyAeRB2zTz2QO98FEwXHdWhi8eyM95LZD3BveEffWw/9QefLaFQyu7NZ7cwWMWa/EFrQq8FFHn1uKLwhUspYC1Mr/n4w0njjRATBDdziZ7hQtNBNsodz69RHOjmSi7jLYzzahOfz8W7las=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GnAxpk4s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GnAxpk4s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba92146cc86so1162521866b.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327123; x=1777931923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=GnAxpk4szxo1Pors5GdwwkulmVzMndyCkbOALfUtNYMT5roVTCQm+3ojiybOxdpkbk
         fQmMJtKc/XxQXxGYl8nKYnlrPmo33LYEkeV4sA2r/NE0UzGOvlbAZhPauJOxdEOP+Ev6
         NI7YvOOJebVHsZeRfETlwCJwfRlRog6kQL8tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327123; x=1777931923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=eiayRFnLL0IVVGwajfTWXAJT9/1k7ORA6fRZ1KwRqzUrsGwvGMLVk3X6W1PreFV/SP
         DxOTE57z3WdIgzXd+Sm6vFlk1kZfzkswCXdJJiDblprJIYO157lNviHUf2JHkb2GijvQ
         zqjspzvXC5TfGQF+82scauMqy/sI0A11Q/8dcy0TFHhVxB9KuQ+lhi3mksf6zexlIXgM
         trHEtWghI+d8FFsIdaURyxSyalT5IWbF8vlS3SZ5GUFLRp+QASEMxz9WbR8jFWXjyrQC
         vYmsY02l8AEVSvfbI/ahwv77TAEeQEN25+PzcXvl0DZr1br9ByFuFkeQbOQoCmiwUCkw
         Ierw==
X-Forwarded-Encrypted: i=1; AFNElJ/LDlnf5f9pxFHoA5Waungamzwx4JPjTyShIsDq0wt/qn13RhG5+ap9IXBQr5hVRIn9c5YVaW/3kBy6iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztNvkd1oQd4GkPQeK/3PoJMVbB4GWivKOF5a/7FSdtHFFOtnRp
	FldNVa5pOxtfp+aze1xrpBvPngBU0/0KtMdwB/4Ln0qMBxbBpj3TmHbMyip+bxTtX7Di6J+HtOZ
	VBXafkrB7uA==
X-Gm-Gg: AeBDietL31ABnsX1AKWNrXzZ+ujxo8wqYHBVnfYeNCpCtsCEX2po0roKtlEzSxtifZK
	YLpn1r6aVxxpdDMHaT7aYPwqUJNjwV7U4ABP9d9yzbQo7WIb7nl2LWAxORGHzMiig0lD3HTelEZ
	+cNUlS+KG6TXMNUkExIGVhtlYZhAbt5Jf79nDc2gojlXB66eMtDpn9gJUCLtg4EDrreRDmiXmyy
	8nxb3mibgz5ngpCSYSlORDTnzmz4Ww+VmF+RpU6sTPvtTsfDtbjRfPjsliefx2b85O6UvZalboz
	3y0LVQmc2tt8EXTqBEVzCmDxiwNrYLkNSWFv568/3IMy3L++VtIpZP0oO5nlP1eZOvWxgWSEjXU
	t9+J3MOzFjQ/Eo5UQE3ir37wgRdlE8XIXf2XCQVJVLU4Vadwf0vMgQRZYvE+SL9+xHioTfF2vSH
	YPEFjn66QFqNAm9yMp9sFkaNqeUf1KyOD0UEeX4xxzkocWr0hxNoKShnPGeQDYVihyabXpbL7Zz
	MMmUStmus0=
X-Received: by 2002:a17:907:843:b0:ba4:8883:7f33 with SMTP id a640c23a62f3a-bb80100e894mr26040666b.10.1777327122614;
        Mon, 27 Apr 2026 14:58:42 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c58200bsm10230066b.62.2026.04.27.14.58.42
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:58:42 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10760037a12.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:58:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LA7+X9H9mJH6XhvhLFUnS4h6oQNK6xVdpAUTxxvJWoa53VYvKUZ16KokxKsQUkk04inJDfsgiqF27Aw==@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
