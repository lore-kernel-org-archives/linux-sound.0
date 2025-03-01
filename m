Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F41C3BF1
	for <linux-sound@vger.kernel.org>; Sat,  1 Mar 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821197; cv=none; b=oDHp8Yxv+88PLj48p/UL3rE08RM4Zok1WTgOf9dMsp34/OsPFfFwgvpfN9iF5GrIBJ11lUpvQTn2ufrOalbzz4mkpwk0kMqTyCw9ZUA0BSGrMz8oJUbydIkOVVUVa5VhAxZ192wHemPXaj9eBPSAd1G4kQ19JqnXOmlH2/QexO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821197; c=relaxed/simple;
	bh=QJaox352Ycg4ji4TTT6HqLTFL029xkbI/FSW0iYv+zE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=eAJ7oFKGE2VkWQdcBF3QKtTzEQI77JAC974J91uhBQcilcmdzxdedN8QcOaOFTDG+0xlzS+S9OiZJvSRzLlq66efXtIrX8lWTzhJii7I4tgUP0HCPxW6gwVTQXwsrbIvXiRy+qZ/uaXeWXMWGxC65pdNMdp5IDfdLqHodMN7MzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d2ef1a37beso26697325ab.0
        for <linux-sound@vger.kernel.org>; Sat, 01 Mar 2025 01:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740821193; x=1741425993;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cTUFcfA4nD0TA+byzfmiBfeOCVzsCiVGYn6UQ/fn7U=;
        b=ri0HXSVabdGphvlI9SaaFWTtM9HhaETSYmQxPB9a6XX1XPUuaxkUu6qOaZ1BVHLEmm
         dP5eRxMsFPYgpepmnOwsl+RNZt0FwhKFVAoJeIf/FZQid33F/QLWNmfoVLPQX9vj3aGH
         cYTCWH6vZyGato5l8ZZrAaBZvsmk2Kx4PSP5s1hyhkYeqP8yvV4TzKpHC3dabSWdjtLc
         a1j/Z8oLfIEdfcOsH7/R1gG93jxzS1vHWy32uSbkf7dU+uGLRaIDkMWCL5lnJO1Rd+1r
         pGgR+tdo0sSxyXg8CTGAtEXa6JSfuDV5bFvSPr0ojwUEbCnnH1DbKUYugyfqE+zpbp0T
         4fxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJq8d+oi0BqQVFvyM0rKt04ooQSmSc6taY4IvsxV8IqEF0aicsqdEqr0PB2ZzllMkIhBxiwiofGlRm9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6EMJp+feXze+m5clcwAc723Ok7urEWqoazgqmM7dN0BxmVLIs
	AaSJvzIpfIhjq+1DH0u2UUtmcQ8rrC4tDavl7gv56+OrNqDTBVubn7DV1fYIdzyCmJMZ59zAVDp
	VL05K+ZFwxnOLMTyCafGNPrXwkACpx32OmEzGsWA5vqeQZznEgdAMzso=
X-Google-Smtp-Source: AGHT+IHJw9ko2BtcVjE0Kpc25vlmUqs0Y33A2bsVGXQEK1thpAJlaYqlI1kxhQiFKP2rRdl69DFfNsMyuO+HJ8ENh4PIkKA3wZTx
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1906:b0:3d3:e11a:3a8 with SMTP id
 e9e14a558f8ab-3d3e6f3cf76mr57538475ab.14.1740821193620; Sat, 01 Mar 2025
 01:26:33 -0800 (PST)
Date: Sat, 01 Mar 2025 01:26:33 -0800
In-Reply-To: <6610cdb8-072e-47fe-b9bc-f4f5b9a79f8e@quicinc.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67c2d2c9.050a0220.dc10f.0161.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: sleeping function called from invalid
 context in snd_card_locked
From: syzbot <syzbot+4cb9fad083898f54c517@syzkaller.appspotmail.com>
To: quic_zhonhan@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	quic_zhonhan@quicinc.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

>  > Hello,
>  >
>  > syzbot found the following issue on:
>  >
>  > HEAD commit:    d082ecbc71e9 Linux 6.14-rc4
>  > git tree:       upstream
>  > console output: https://syzkaller.appspot.com/x/log.txt?x=14e3d7a4580000
>  > kernel config: 
> https://syzkaller.appspot.com/x/.config?x=8f2f8fb6ad08b539
>  > dashboard link: 
> https://syzkaller.appspot.com/bug?extid=4cb9fad083898f54c517
>  > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils 
> for Debian) 2.40
>
>
> BUG: sleeping function called from invalid context and
> raw_local_irq_restore() called with IRQs enabled seems can be
> fixed by below change. if it is valid, will arise the PATCH.
>
> #syz test:

want either no args or 2 args (repo, branch), got 4

>
> diff --git a/sound/core/timer.c b/sound/core/timer.c
> index fbada79380f9..5290c1b9f2b8 100644
> --- a/sound/core/timer.c
> +++ b/sound/core/timer.c
> @@ -767,6 +767,7 @@ static void snd_timer_process_callbacks(struct 
> snd_timer *timer,
>   {
>          struct snd_timer_instance *ti;
>          unsigned long resolution, ticks;
> +       unsigned long flags;
>
>          while (!list_empty(head)) {
>                  ti = list_first_entry(head, struct snd_timer_instance,
> @@ -780,10 +781,10 @@ static void snd_timer_process_callbacks(struct 
> snd_timer *timer,
>                          ti->pticks = 0;
>                          resolution = ti->resolution;
>                          ti->flags |= SNDRV_TIMER_IFLG_CALLBACK;
> -                       spin_unlock(&timer->lock);
> +                       spin_unlock_irqrestore(&timer->lock, flags);
>                          if (ti->callback)
>                                  ti->callback(ti, resolution, ticks);
> -                       spin_lock(&timer->lock);
> +                       spin_lock_irqsave(&timer->lock, flags);
>                          ti->flags &= ~SNDRV_TIMER_IFLG_CALLBACK;
>                  }
>          }
> @@ -805,14 +806,16 @@ static void snd_timer_clear_callbacks(struct 
> snd_timer *timer,
>   static void snd_timer_work(struct work_struct *work)
>   {
>          struct snd_timer *timer = container_of(work, struct snd_timer, 
> task_work);
> +       unsigned long flags;
>
>          if (timer->card && timer->card->shutdown) {
>                  snd_timer_clear_callbacks(timer, &timer->sack_list_head);
>                  return;
>          }
>
> -       guard(spinlock_irqsave)(&timer->lock);
> +       spin_lock_irqsave(&timer->lock, flags);
>          snd_timer_process_callbacks(timer, &timer->sack_list_head);
> +       spin_unlock_irqrestore(&timer->lock, flags);
>   }
>
>   /*
>
>
>
>
>
> Thanks
> Zhongqiu Han
