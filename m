Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C926F2A7
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358348; cv=none; b=QtwPnvjdMhWAeE5OiJPUapQ4hVEap0Re9ogJ5WT86Pb0EloA/bzYEKbbiQA/gZMVFYWMEYvkNcBmhJeql6htZTdQDy5lsKbzBqNh4yn9ZPzeCbQNauqZOd9PdoA/D++BKaKASnbw46cRtON507Cdkq455SEdzvBlBRiOukJsZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358348; c=relaxed/simple;
	bh=l+ZWWSXqEyc8LGjj0llP2/jYzT8aZ5jFd3PwUZ2JMKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAJlqGfs/cC4FrvL5ldiNwEFZeQ3LwDSvTGkY+B1li0j9eUjt9SZ4ZLWW6baUaXS7YsKWJaoD0Mxckj0d7DCdjMuncd0kGPqgpgOxgxVOmo5SS5iyLZ9dj2dHcks1x7+CiwbnCZYcl0uwq629WOTfrbIyFmYai4EJXjB/nCIf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuyyK43w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuyyK43w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so24391775e9.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 11:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764358344; x=1764963144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epuaSi7Z+ocAK+KZT84LKdfdXtjiByFin9okPDnQqhE=;
        b=WuyyK43wsZriXOSgrm9iA9zfAnnsxMMz1i8ehyvVaVVBlIUpfy+pcYbChma5VUlQie
         Tz+owkT5nVqfwJk0VdbCti6dCjdSc2Md9f31tePlRX8E7FqfpwegD/8q8KzNHD/20uNu
         xDDE3ilULw5TtlCZv0ACjBZpoUUSXWr4IDYsjRZl6okc0pfNelOW+0JtrGmaB7xuE7Ib
         NYgYgoNhWpWeUieRZiOejVmiVKbCfZPDvdnpukfiXd11uP25YIv/uos2pXcBU/K0vCta
         q1pmPyj4sXZLa05Fzg4NBGN3QyalBHPunAwV4ra9srP1YxUouVQNb9OVTMRzRhT/1oPw
         Bljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764358344; x=1764963144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epuaSi7Z+ocAK+KZT84LKdfdXtjiByFin9okPDnQqhE=;
        b=N2JX4v4B8UajgYOTFqmXCOdWIEGJEahMX2L16B1oXGxRBfHaaSNtiZaO0KyWgKYjVE
         C3W2D/CzIxK7JgnJRC1Hp67dGmQIVwZo7yyB1uqlXAYrKDzASfhEuD0Wd2vHEL6p5Z3y
         nCa/rpCBFzeVZlTugYfS4EBhE0rXW4vFQmM5I93+5YVyfutMrlqx69iSVmfvHk1eJ+eB
         qTRanudnK+EG/TAjZASfZSK1x6O8p82bpyflwgJc3lsE1h9KZk8EY/MjDmtknxFpKDsm
         MQrqcJ4KpB3QwG/MMOxP9ZS6KAHoxwoSCXoiIxqPB1fPvy1thmM9Kt/arzlAd2F19H8P
         Sziw==
X-Forwarded-Encrypted: i=1; AJvYcCXCLe0ygQnrba0Y12flYHoP47psZJoEC3c268iaMnK0g/vmB5OgVL3NquJW1lPXiieGIOohC5qHgi8A8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1bQ8t/Kz0IwnfTYBOb58WZ6ZNCOn5xkyuQQwXTwSuDTBWY1N
	No19IMxrYYHJAWrE19A5fveNmJxVn7Utfsqaj3sHEPJbSQ6YWrMU/XOQ
X-Gm-Gg: ASbGncufZjBRK2YCF3owrCdc/rX//Dd98sbMMReuc05uMSRxDGxxRweW2YxOnXvjDjq
	qoUypJE2r+TkpzpE9a3XieTcJk6Xb508/7SAZQaABjgdetndaq7dMUNbUmRjwztaswk7f1JU2ve
	4Bj1yRqN2TpowMc+Q1d0wv9xYUFu9Ma4gZWpQD1DxgkbEYHQQvIRPSIghN2faqWMjSIOXqLSryJ
	aKD9/huWgs5zFT3rLlN4k/XqxR71XpwA2ko2JXV6ubOHhEFxx3vDqOY9ym2n6cEdXUa6VEK37io
	XYJJw4s2BodP7CDBb763+X2h+3EyOV6AvpADCjX+Bdb3gF2KJ1fSuBjc5zscE9Exu7Po9aOflFn
	JclloaFzuIjA0swU9O8roj+duHOvT9eijOr1lhGcL7LyY/y0RmbFUgaE6n7vYvUPGYrYnwMSwsN
	lkxry4GzBGEKyIMNQxrTC2JMatWAl39mvf9TmbdJX6AIlQQXz+
X-Google-Smtp-Source: AGHT+IFdepamCvVz23LU4OQysyWXmUad4p4NHbGun4IRRbXxqdWML+IFkf2jOGXbpcQpNkS94t0lnw==
X-Received: by 2002:a05:6000:26c1:b0:42b:5592:ebd1 with SMTP id ffacd0b85a97d-42e0f133696mr19161235f8f.0.1764358343923;
        Fri, 28 Nov 2025 11:32:23 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm11234742f8f.12.2025.11.28.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 11:32:22 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C11FDBE2EE7; Fri, 28 Nov 2025 20:32:21 +0100 (CET)
Date: Fri, 28 Nov 2025 20:32:21 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Takashi Iwai <tiwai@suse.de>, waxhead <waxhead@dirtcellar.net>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	waxhead <waxhead@dirtcellar.net>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, 1121535@bugs.debian.org
Subject: Re: UBSAN: array-index-out-of-bounds in
 [...]sound/pci/ctxfi/ctamixer.c:347:48
Message-ID: <aSn4xQPVFYAfdgqu@eldamar.lan>
References: <176428476762.2962.8176922083972711750.reportbug@main.localdomain>
 <aSk8KJI35H7gFru6@eldamar.lan>
 <87a50683z8.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a50683z8.wl-tiwai@suse.de>

Hi Takeshi,

On Fri, Nov 28, 2025 at 06:24:43PM +0100, Takashi Iwai wrote:
> On Fri, 28 Nov 2025 07:07:36 +0100,
> Salvatore Bonaccorso wrote:
> > 
> > Hi Jaroslav, hi Takashi
> > 
> > A user in Debian reported (in https://bugs.debian.org/1121535) an
> > array-index-out-of-bounds affecting ctxfi/ctamixer.c:
> > 
> > On Fri, Nov 28, 2025 at 12:06:07AM +0100, waxhead wrote:
> > >  ------------[ cut here ]------------
> > > Nov 27 23:46:53 main kernel: UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/sound/pci/ctxfi/ctamixer.c:347:48
> > > Nov 27 23:46:53 main kernel: index 8 is out of range for type 'unsigned char [8]'
> > > Nov 27 23:46:53 main kernel: CPU: 4 UID: 0 PID: 468 Comm: (udev-worker) Not tainted 6.17.8+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.8-1 
> > > Nov 27 23:46:53 main kernel: Hardware name: FUJITSU /D3446-S2, BIOS V5.0.0.12 R1.26.0 for D3446-S2x                    02/11/2020
> > > Nov 27 23:46:53 main kernel: Call Trace:
> > > Nov 27 23:46:53 main kernel:  <TASK>
> > > Nov 27 23:46:53 main kernel:  dump_stack_lvl+0x5d/0x80
> > > Nov 27 23:46:53 main kernel:  ? __pfx_amixer_set_x+0x10/0x10 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  ubsan_epilogue+0x5/0x2b
> > > Nov 27 23:46:53 main kernel:  __ubsan_handle_out_of_bounds.cold+0x54/0x59
> > > Nov 27 23:46:53 main kernel:  sum_output_slot+0x44/0x70 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  amixer_set_input+0x4b/0x80 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  amixer_setup+0x1b/0x50 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  ct_mixer_create+0x193/0x570 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  ct_atc_create+0x3cb/0x530 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  ct_card_probe+0x104/0x2c0 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  local_pci_probe+0x3f/0x90
> > > Nov 27 23:46:53 main kernel:  pci_device_probe+0xda/0x2b0
> > > Nov 27 23:46:53 main kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
> > > Nov 27 23:46:53 main kernel:  really_probe+0xdb/0x340
> > > Nov 27 23:46:53 main kernel:  ? pm_runtime_barrier+0x55/0x90
> > > Nov 27 23:46:53 main kernel:  __driver_probe_device+0x78/0x140
> > > Nov 27 23:46:53 main kernel:  driver_probe_device+0x1f/0xa0
> > > Nov 27 23:46:53 main kernel:  ? __pfx___driver_attach+0x10/0x10
> > > Nov 27 23:46:53 main kernel:  __driver_attach+0xcb/0x1e0
> > > Nov 27 23:46:53 main kernel:  bus_for_each_dev+0x82/0xd0
> > > Nov 27 23:46:53 main kernel:  bus_add_driver+0x10b/0x1f0
> > > Nov 27 23:46:53 main kernel:  ? __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi]
> > > Nov 27 23:46:53 main kernel:  driver_register+0x75/0xe0
> > > Nov 27 23:46:53 main kernel:  do_one_initcall+0x58/0x300
> > > Nov 27 23:46:53 main kernel:  do_init_module+0x62/0x250
> > > Nov 27 23:46:53 main kernel:  ? init_module_from_file+0x8a/0xe0
> > > Nov 27 23:46:53 main kernel:  init_module_from_file+0x8a/0xe0
> > > Nov 27 23:46:53 main kernel:  idempotent_init_module+0x114/0x310
> > > Nov 27 23:46:53 main kernel:  __x64_sys_finit_module+0x6d/0xd0
> > > Nov 27 23:46:53 main kernel:  ? syscall_trace_enter+0x8d/0x1d0
> > > Nov 27 23:46:53 main kernel:  do_syscall_64+0x82/0x320
> > > Nov 27 23:46:53 main kernel:  ? restore_fpregs_from_fpstate+0x46/0xa0
> > > Nov 27 23:46:53 main kernel:  ? switch_fpu_return+0x5b/0xe0
> > > Nov 27 23:46:53 main kernel:  ? do_syscall_64+0x200/0x320
> > > Nov 27 23:46:53 main kernel:  ? exc_page_fault+0x74/0x180
> > > Nov 27 23:46:53 main kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > Nov 27 23:46:53 main kernel: RIP: 0033:0x7f77238f3779
> > > Nov 27 23:46:53 main kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
> > > Nov 27 23:46:53 main kernel: RSP: 002b:00007ffc398103f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > > Nov 27 23:46:53 main kernel: RAX: ffffffffffffffda RBX: 000055e0eb622480 RCX: 00007f77238f3779
> > > Nov 27 23:46:53 main kernel: RDX: 0000000000000004 RSI: 00007f77239f744d RDI: 000000000000001b
> > > Nov 27 23:46:53 main kernel: RBP: 0000000000000004 R08: 0000000000000000 R09: 00007f7723ef6280
> > > Nov 27 23:46:53 main kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007f77239f744d
> > > Nov 27 23:46:53 main kernel: R13: 0000000000020000 R14: 000055e0eb61e630 R15: 0000000000000000
> > > Nov 27 23:46:53 main kernel:  </TASK>
> > > Nov 27 23:46:53 main kernel: ---[ end trace ]---
> > 
> > This was specifically with 6.17.8 but up to the current stable 6.17.9
> > there should be no related changes afaics.
> 
> Thanks for the report.  As a wild guess, a simple fix like below
> should suffice for this case?
> 
> 
> Takashi
> 
> -- 8< --
> --- a/sound/pci/ctxfi/ctamixer.h
> +++ b/sound/pci/ctxfi/ctamixer.h
> @@ -22,7 +22,7 @@
>  /* Define the descriptor of a summation node resource */
>  struct sum {
>  	struct rsc rsc;		/* Basic resource info */
> -	unsigned char idx[8];
> +	unsigned char idx[8 + 1]; /* msr + master */
>  };
>  
>  /* Define sum resource request description info */

FWIW, I cannot test this myself.  "waxhead", can you please test the
proposed patch and report back if it fixes the issue for you?

Regards,
Salvatore
