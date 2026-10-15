Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1455452B1
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078552; cv=pass; b=O/YZRDtvOXZCaLi4q7dYtKgKEMMm17FJvQtd5+AgbzADcFLH7txBqHbSGJxgrr4dMoOQiwLDbO7vJQsjCBwEIp1O6f3HUOqKFuqZ/zamqPhigyUWmLZxokFTgSRzxCEKg8f+mvDoH4lTzpZTmFZJ8GkoNpOO1UhG/hZ4yGYeNzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078552; c=relaxed/simple;
	bh=8tCMJ+7e6cvuGkvB8JAFDQBw/BIB2edtSCv0VjFkKpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcZE1iETcaeElHotbeO/rGLhs+X+QOU9nJHHmdrcIato1U1o+wC8I+kvSa/iYN7+OipTr/9S0eMDHuSVow7zwi4XPMJsbwcDhysZZOkGlsuH8ptTO31DHY7wTIeqLNl7UYOGnSoMNHB2oGJNrnafzeSmaYh5pnt6+xd/XmgED6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFh34z1Y; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFh34z1Y"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ad98c3fb15so45527647b3.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 08:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078541; cv=none;
        d=google.com; s=arc-20260327;
        b=NPGySYNxk9J9pUBxoMl1vlhP6Z11OeoPzzTWZ71SgO2lsw36tOiPjYnbkpCCpeO+WT
         SnsaxC3DNwr3j+IDEKI61HcySyboTWKMitGAD7tNvOjW/+R1/KUCxcEBORgfkaY7WNXv
         loxTeGqBjaximH1ZMBZ3/b2rXF5ZcCShxORbV2jnETCobuyZV22aVwncpVfhJGfKxeM0
         qhcuERhTkZDS70GEHw5tUqnJ0yVs8WcoAjmA2gdqQtjEmUwjOjok+BCctg1saDhjaECF
         kcXJG+yvksIXAponcdwlSHiRZLc/wNoZQXioAoSvFuvYZmaOPb73Gy9gX1Kg/aASRfP+
         69pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        fh=3SiRHeI261Qz4TB/JXNYoLWC94cJ8lNZODapIweLpZc=;
        b=CVwUXYyzGnJUbpepCnXz7fvnAHo1yCfjQ9amMDU0WLu46LpuypirhJJSy0cvmxRC3A
         Fnr/3kCBEXffihEKd7TaJxJEIoDabR9xUlrvGBPp45rNkDGhil4nkb1sdtCvjneDyp8F
         XvnmmA/UhIy6p9cjzdW1dEW/5nyeLDck6AofewPD+yR1bK+Y2oRqMLTCnzOZm/P19aCh
         JhIg6DSBMjV17dbgqaf+FDO4Wun6vk/m9bTrY0aBXyWR1+YWwuLB6ukV+tlprzOF9zrJ
         Sa4PlBSx72gtLts+UNQUbZGUaOXwoqnrSM3NANeXxpFv2Do7Fv0NuAj2hZKYbbB4/5bc
         RqFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078541; x=1792683341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        b=EFh34z1Yc3CxbWL3G1N9xB9GK41E/XE8KCfuTFrDUvSd3X/MIgbDe5nQ6hn6kuKrcg
         msUDv6NkyoEdEam3jKPdm6edcW3aX63WKc9Kpa6i0aP9XSjKz/mpnidMS8mf9afxEgHc
         mfw1ipCu+1nlqXcwYtTJzznRX8HskVU5Znu6JohgtJjxbZ8RRiJQKas11uZnga9XtoyQ
         tpc4+YzR+jjbdVwxDw2dvWNlbQhYtH4QtydStOgrqyIqtnOfzqi4a05WWOL4tPD1Jwr9
         3+MM9lWtSCFtrhPrEn0NGixCN/2NH9uIgqsfuWE76zzXvx19YJAjru4zfzdoDgp6GlSA
         EQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078541; x=1792683341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9803NfCmeXmOQXfKm7bi/Kku7vL5xpYhTF2JaBKJP0=;
        b=FxV+AEzi9MrbQr33YX3FQxStfmCl3Bd1akVsUPE3kEVfHH3Zqi7j7gHQftCx1ZSsqq
         IHf2x/3EXPBtjIsFH7hqnZj5Gizj5Wf45M25zDrAJXIGnysJ4786GliysWz2sWNXLT/D
         Oh0t/eYNEFmChs4AOuVZKJHSm6EiuAyHh5yhZf8BtAgTwtVJA/VXxdEBPQa3k+0eD7D4
         a1O76n7kqchr2NT5c4iY+xdmyNg9lkgnvgJQivMw14f+SKp5jl3QyXP4yxicL4OCgBxP
         WZsX0LM5YzK289PnU4bnB6/ngVB8cPEWUUrdE0T9iXHFHFMriBIizyYkh/I64dqknjBf
         1b5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwho5Iym5rR/JGT8lQuVfzGMjcrAWsJVbhmR2C74CyDsBN/+Zbn7qudE86YBIZhHbNx0Whdc8z+loKNww==@vger.kernel.org
X-Gm-Message-State: AFq9FYInpmgaWpf+QBL8viuKzInGdJSq7BXSDWd00/L5qP/2YM81IpqJ
	6wJPumvZyONd97WP6kXYhqzRMXJ5GQ8I9TcSuudoLHnKdLio1zibFpwE0/vpmEoA770MYRJ+Esv
	igF5ncyciPMPe1A1uWfdKKZs6mCAhHxk=
X-Gm-Gg: AYBFou0UBRa1YpcrddRSY2i3U+wYMB8Dslwyz4cjLfHS2hG4vVMUqQnodU7MdKRTLQC
	NvpP2gafv5Dz+9OtjshxZvB8gvMyAFNRDYgN1sdgN64lJPPiEB5+Y6c/WkRBeJ/04MZMi5jssmn
	zzhmR3uSIN5FZmHq0aNZEOYr8B4t84oMRKMGOWTAOEV81eCMoaSLMmrYQecNssLMY9MrtmF3JjO
	s30DeNuqpf7Vg0fWl9Z0jxDOYcmAD7OCEH6FTkBkqiOSlE4uoKC4p8YtQXZ0jcj4p6RiCDVNjAD
	tnYUrGGCn8E0CV41OoLLiWbBAlO5cGe+pgMtGqCCNvD0faFGfflvk+bSew==
X-Received: by 2002:a05:690c:9990:b0:8b0:cd2b:a43c with SMTP id
 00721157ae682-8b0cd2ba992mr14814587b3.53.1792078541372; Thu, 15 Oct 2026
 08:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de>
In-Reply-To: <87qzhrmnz3.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 23:35:30 +0800
X-Gm-Features: AclHuK_eycqSwROe97zxxEkUuLQ2EqQMdmAcg7LZi_wxsmSqn9aHYMRQWbevAEs
Message-ID: <CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8815=E6=97=A5=
=E5=91=A8=E5=9B=9B 15:18=E5=86=99=E9=81=93=EF=BC=9A
>
> The patch I submitted yesterday is such an attempt:
>   https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de
>
> Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
> latest tree.  And now I noticed that there is still a potential race,
> and fixed now.  Will resubmit v2 patch.
>
>
> thanks,
>
> Takashi

After read the v2 patch. I also have a minor concern: is there still a
lifetime window between snd_refcount_put() and snd_refcount_sync()?


Suppose drain(A) has pinned B's runtime, and close(B) has completed
unlink and drop. Could the following happen on two CPUs?

  drain(A)                         close(B)
  --------                         --------
  finish_wait(&rt->sleep, &wait);
  snd_refcount_put(&rt->refcnt):
    decrement count to zero
                                   snd_refcount_sync(&rt->refcnt);
                                     /* sees zero and returns */
                                   ...
                                   snd_pcm_detach_substream(B);
                                     kfree(rt);
    wake_up(&rt->refcnt.waiter);

Here rt is B's runtime. Since wait_event() can return on its initial
condition check, could the final wake_up() access the embedded
waitqueue after rt has been freed? A holds its own stream lock at
this point, while B has already been unlinked.

Best regards,
Cen Zhang
