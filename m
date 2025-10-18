Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3E20E030
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808992; cv=none; b=LuBqU5Xa4CI00rrmpzjTAaxV+DvpiTq6VXWZ7vh6dNKM+c1MfLULop/kqzkyhS83Qegto7JfSVMiAKwTyre+V9Kw2gcK1MRvrLWKhHVQlVwanvAfpgxNod/Eke3+ZOG+20+KK6xp0OAIVR9QVuFTSLc+pntlJKxaw+dep4H1LBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808992; c=relaxed/simple;
	bh=dAxIpK/l+gZ3SJE/LBb3gShQ8cc9kp6C8RApj+5PKaY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KszVtyONlGRmo50por4E0WWHVPc5PSkklwpsXpu+MyvpzE5UOHbYhlk46z54Ct2seieEX7OZPIiMq5z3AHlDU9YJNbu0Fx0fnoLSTynvjMrlGtKtDeUHImmnL6uNoJjqAmH2VsZxbeWby/zlHojyGLT0poxvAr4ueAYnOAHDxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgxOCU1I; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgxOCU1I"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57e36125e8aso2985425e87.2
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760808989; x=1761413789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzzF5Tn6TyRnvelfYziLmA95XbFxFAmj6l51MEcbDzk=;
        b=YgxOCU1IYvb2Py78WFt3HWXJUKTF73wl28a2cE4PKHreSBOEoY5v8OZwKW5iLQn3Pv
         8gL5nUrMg+1hoctAcGFqOnarERh2nGmCqjcpkl1Nbd0fP0MrLdAXrcu2exAk8jHYTN2E
         934eXGcuPrMTkYzHfzLHavXZSiSIXJBHDCqt2HHLECP6k7qflNfw8qysYE7tkYkHc6+O
         lp8poOlizMldQCJpamn5gNW96rmcUQsLS77o03mYG2uIAfeU2Ika8Umazq4DmWABh70S
         0tAaH8HD8CZMkGNM+oE82Hf+NwCd8K8ot6A2hGmr1IxuPGwjHdqDYapXkmLQ6pUZ53/Z
         778w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808989; x=1761413789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzzF5Tn6TyRnvelfYziLmA95XbFxFAmj6l51MEcbDzk=;
        b=tvLWWN3ycjfXmIpU9B9NZKikySEnJnPNMf3WKkcb3N7GNgwVzitB8hGfhrkH/kQtTi
         aUnIIy6YCe9XVxX45AKmZHrToC5Fy8j4/jEhY5ULNWWNPpO0ZDFy7EcP5EMNhFeaZzu4
         451Xi45QFaUnwYZ+ynKxaMVruuD3MX4dFLi+uT7o2HXvfCB3x1ygFIlJdBMJMk9BSzUd
         H/Rp/zgL+K3HOZwWu0ShSheZ33UVFF7DIrRGiQd23pdCRDP854p8ZvfThi/gvYyniVo2
         EunH/MBqhCV7lwt9ERgmv+PaG1Gs10Aczx+7zf3jwEJX6g4aYlslo45h7Zh/R6nBnGzc
         RZyA==
X-Forwarded-Encrypted: i=1; AJvYcCXbb1pIGxG+Tfm3RhKSPJYrOc2FOenjNgfB2GBnnr88zi2IxHCkbKX+o6WtvToDvbZgQaiHyXsDjSSrnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPerBYweFDGkfqgoON7rRg0oz9rcuWobPaFr28saL1/gY4tIYd
	UwP7EdHJL7yUWgQhlsSfl+oCakL8d3GT74rC88IPOhWqGfLUG3Kbd2VQlNbYJVBN
X-Gm-Gg: ASbGncsD9oVrkeRmje/pglZroIezRxtudMNfjrBxK6/kCDwD/QqoEfuw7rbjP7LPVX6
	s/M2Bz91QBJBFNpKIM0mbpSx/9Bob/HfNELZo+GDjfYcA6WIiPbDErsuIYcm3BbALgTHr32WjOe
	U1Vff5w/u9UYefWLyx/ICkLbwfMDylEsq8bYHkWBmrcdXBwjjfvGO4tvb9maE0xsV1Kl7H1J1u4
	/TaR3/xwmFmVKtsQVsAoZ9ldujnMiNPq0Xs0sXNsKsnGO9cTJIO1fBhQUPZIEqlSgza0k3gDkZa
	VBec3ydkA7VSG9TMQEr0XS2WvO+N9FAxA+0/a2EeTYC6LrEVRQlKLfOQZogB4f6z81DIKoVrwYD
	v0tm0szuYX08tZn3p77Fa2AX7mbsBcmnx8fl/hSIhG8HkTvTmPVDq
X-Google-Smtp-Source: AGHT+IFLnvuiJ5M4Xq76dDEpdkMK0Qu2M8ilTKKCU2pV5gpUa/MTd9FhN5JC4HYvyjgPT8H2Asm8hg==
X-Received: by 2002:a05:6512:131f:b0:58b:151:bc0f with SMTP id 2adb3069b0e04-591d85aa254mr2474920e87.54.1760808988691;
        Sat, 18 Oct 2025 10:36:28 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4a6sm906824e87.29.2025.10.18.10.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:36:27 -0700 (PDT)
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
X-Google-Original-From: Roy Vegard Ovesen <royvegard@ark>
Date: Sat, 18 Oct 2025 19:36:24 +0200
To: Takashi Iwai <tiwai@suse.de>
Cc: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>, Xj <xj@wp.pl>,
	linux-sound <linux-sound@vger.kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes
 mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
Message-ID: <aPPQGFNX26KhrVQD@ark>
References: <874irz86en.wl-tiwai@suse.de>
 <87ecr27trj.wl-tiwai@suse.de>
 <2b24f320-3c6c-4adc-b5c4-ce6134d3b39e@wp.pl>
 <aPFTxD89mYhea2ZX@ark>
 <871pn26kmt.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pn26kmt.wl-tiwai@suse.de>

On Fri, Oct 17, 2025 at 09:40:58AM +0200, Takashi Iwai wrote:
> On Thu, 16 Oct 2025 22:21:24 +0200,
> Roy Vegard Ovesen wrote:
> > > [    3.354844] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> > > [    3.354845] RSP: 002b:00007ffc8d758ca0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > > [    3.354846] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fab8f3112ff
> > > [    3.354846] RDX: 00007ffc8d758e30 RSI: 00000000c4c85513 RDI: 0000000000000004
> > > [    3.354847] RBP: 00007ffc8d759480 R08: 00007ffc8d758e30 R09: 0000000000000000
> > > [    3.354847] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > > [    3.354848] R13: 0000000000000003 R14: 0000000000000001 R15: 0000000000000001
> > > [    3.354848]  </TASK>
> > > [    3.354849] ---[ end trace 0000000000000000 ]---
> > 
> > This looks a bit sus.
> 
> Yes, this must be fixed.  It implies the pipe passed to
> snd_usb_ctl_msg() in snd_sc1810c_get_status_field() is somehow
> incorrect.

I have submitted a patch to fix the control direction.
I think this warning has appeared for S1810c devices too,
and this should fix it for those devices too.

-- 
Roy
