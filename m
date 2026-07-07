Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7A2EA47C
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412820; cv=pass; b=dvGkGd5boQrefDwK37ZNtUuh8jhig575KKl+UYoALCkGDbka4xbO5WbstM+LC5lld8glR+z/WWxwme3YL/EOL8P8l3bFybrCitFYtKQRJmnxrUXzXl/i3gV20nYBKQFDO5PHxEhxgzWjkPTNo5urjv74VRxwSxffhF8065+lgys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412820; c=relaxed/simple;
	bh=t2KbZDKFvOYq6xvt32MBugAa6A52z4hinT3kc7gupyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrvercTUYlZGgjXcxZLDjAS6Ad2WOKbEBeF21X8PLJ0wq+V53pBhPjuRE3l3e47oOk4qMFEk/GFe1OHPHjtk3CvU/sLD5sHbr8I0tybvIE9hm09xnTpSNOrjXqPCO5xsJDgFHPVtr4GYj6Z9geFMTz85c9l1dd6OhIef2W7OAdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nw/N1Tnp; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw/N1Tnp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8475eca3a66so5644720b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783412819; cv=none;
        d=google.com; s=arc-20260327;
        b=M71UYAfe+s/rnUhrDHCHFYx3rKxD7h7BDDEjRNuIA+W0ryKjY+oxbfXxKwZ4o3kIYh
         xapKQKZVSs5icK7nMb9eHfaHjjpLXqdqBFEud0TUyBZIMw4QKqIBXjfOp0pDEpDwN6RO
         pIpdSh3A+rQnQruN5kdVNpuJ+O+trGvVW0gA2kKglAtlZkPGG7tb8quAKNTZcebkhrbo
         LwJ7v+wcCE7pF5iVwuZLR0LDcnfrapvhLn9PxqPFoMn+BzwG/cu0JnrcFp2CFVo7wDzC
         iBLuVVIdowDfGyemP8mJJdiYm4P/3qizpFSWs8cxR1utiHlvuSoMRx1+vW47Qk/3FXna
         qK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BvGLp93sMFv5/1mKWde5tSjRhreVZ2xQLS/8tY52ovQ=;
        fh=f6pgCZqVjpBi0Bg4/01cbaQ8jzNi96U1xIsu7KwjMYU=;
        b=S+ylxgCveAXLZarc/KRl2CkeDVbXdMyEqeYC5CBddSlW9iAQrk5VSlUmk1L+Rf3qSQ
         NFYvHxXBcW8IZDLa0b1GkjUuv7tdvL1il49cGJgNc2CuUvQvb0PDkj+ookwbLcdZoNcq
         HYx9MjrScnwHXbZOC+BLen/yWXOrUxl48KDHiImDt7+oPAE6p3gl/1ZUuN/OXV9TA4wj
         PNzhqElnMT1wxNEz+CaMXZT1RmbMSjk2r0z1LsdMTxGKbRLT2z4p1j03VSEN+g/dld8V
         05L7Lr+YExQuitAui7mPiHTmp2ahwzPy+r5DyFtNfHDSR6SZ/OspGl7Oo2PNrRnvWobD
         t5jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783412819; x=1784017619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvGLp93sMFv5/1mKWde5tSjRhreVZ2xQLS/8tY52ovQ=;
        b=nw/N1TnpeILr+c5Xl53h/j9DOlnm7ffVpx96BKOTmq5JHLW5DE95pUhlSt0DRzzmQU
         smkTeXhZrrMyOa7lVDGTtbNl5d2zEov/eFDweztYR9pPHmG+bY8l5Ec2m610YS2q6V8o
         Qk7r4Q4dcKQHuIwQohBVxbwyHRGDGldusaCPAQO5cxyBpQ9mv6pGGu7NwEnZX9kAasb0
         9T6rkM+pMmj38pJmbqlvbjM9HSraoRxPuuTngnETwEpBjexhzgNSxXETgVZrivZN1Tx8
         ucDX/GiZz5wbXPc6nVnYyyHewF1J6mIBzP++5lU6ZbTIqjFu+WskJ7p6QC19HF4fnHfC
         TXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412819; x=1784017619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BvGLp93sMFv5/1mKWde5tSjRhreVZ2xQLS/8tY52ovQ=;
        b=X+cC8FrVYZuYH1ZGYNghmjPGug2Dq6WQDFVvWGMAIg4n01hx98cplWjgurWoNm8QY9
         ox3R6Sq6YENKr0T0r0jZsRypdjbhpfK2a89y4YULaNlnKD4m3WfNib8+/DigaAWMCBVg
         TEy+rQCluvUQNtnA332PFi8NzTmVr4NpMHz/QDxMLoL9fyt+GRaPu1E5s86m+YjjODIE
         WkLD08mo7Uitdc7uF6MqnBTDd5dJR6A8wV+phkT3q8/IPDLg8d75wA8QJonC07olZsy0
         IAMBGQ6+mMx9Kt6RK/zR4IiAipUzKKz7/GhtYBByJp2F4kiq40XvHIFvWi1Sm82AGxT5
         k5uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfTrXS1VdQKq/Ft5+q8G4jtIrjj7tvf/Oji1RqqaiyRB4SKsw3b9rhzL0Jr018fPf0xOPz63CGJJ1KBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGv5ugYg0VgXucXHLisEknjQJWLG41j1lECSbqA9tPo/wOioI
	D3KCX8NcNaRZNv2hXLOdfZe5yLng+MMTMxLEg+jyZvCaZdtnt3fw2eqQjcsg/+ZagvNYI19Kg20
	/PLEz1kRDtxzKMvetqZJI+DkTINlvnXM=
X-Gm-Gg: AfdE7ckzY4xkpi4j36jzwE5lswklbRJwbsF3E1wSRs1m9QnlRS7Drz4LUs1SCHtXiBs
	H2drNdjEWAwsBBUBR3Tog5y5VhwXH4B1WKoSRU09J3E5xWDUUvzAuzWt1+Q9I3y6rB1qgO30sUY
	10mjxkijCcudvdPcP/kjx/2/JggqpbeVr1aDA5+QfVrlWOJopTsyUCfNmSTBAd0ylcivx1GA+nC
	SNnSa8UUxrDU8uiPKONmCQ+7Ok+9jjBLwayNrsq0eTLAQeQXlh/4ScMlNDLPoM4S+zKPe01h5L7
	kkBb5cklobB/pd7qwUGaEUrq3xs=
X-Received: by 2002:a05:6a00:21d4:b0:848:2f77:e2df with SMTP id
 d2e1a72fcca58-8482f77f310mr1895648b3a.72.1783412818546; Tue, 07 Jul 2026
 01:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706084950.49331-1-phucduc.bui@gmail.com> <20260706084950.49331-2-phucduc.bui@gmail.com>
 <09c381c9-113b-442a-9ada-fb177d6dc4e1@intel.com> <CAABR9nH218njttZT2jdwLG0vL7BrJ6HgX7nvRF2iRw_BTKuUrA@mail.gmail.com>
In-Reply-To: <CAABR9nH218njttZT2jdwLG0vL7BrJ6HgX7nvRF2iRw_BTKuUrA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 15:26:45 +0700
X-Gm-Features: AVVi8CdGwLg0Cub1qdVO5o4JACCZq5k6AN0wphoLXh6QQJiETHdrkTbd3RVr4JI
Message-ID: <CAABR9nFkZFrFGZ-gw2Rm-156+SYxACqad_XueK2WErv_QbpHNw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	Len Bao <len.bao@gmx.us>, Mehul Rao <mehulrao@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

> > >       err = snd_card_file_add(card, file);
> > >       if (err < 0) {
> > > -             err = -ENODEV;
> >
> > Seems unrelated to the patchset.
> >

I'll drop this change from the current series and send it as a separate patch.

Best regards,
Phuc
