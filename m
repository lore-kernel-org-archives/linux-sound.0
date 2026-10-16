Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED72D2495
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112544; cv=pass; b=rdn+RZPj9DjJtUQN8dURbt5C678FsEmL+ps044MLX+VoS9tIa2CwPxejyivhytYeW05WS02fs/YouFSJFJgyiqIx4ZQSnF7CioNfQH3HqDMkytEYyUcrpLhHI+mW/G2I72eyGfh34O4L+l890wwI/h5SQoHxpnaMMAkzV39/LVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112544; c=relaxed/simple;
	bh=wBL4SL95L+TQnICvrDYhAddbR+PbmE/yJ9gkoqY22Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0Nyclfb7A8Nj+XD4FDwlaDbHPp+DttjhpKA2vTjVBzykqiUMg/QvCUxMobHKW6+GbIYNFPsZ2YBH7pj40pqS68Skqm7jzbsT5mEzdFLpY695HeSY/daGFYychyzuSmlL8XmR9xFzIMgDXqB7mGGZwuH981wbhPUGsGJkyv9GJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT5brC7i; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT5brC7i"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0d5ddafbcso13381447b3.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 18:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792112542; cv=none;
        d=google.com; s=arc-20260327;
        b=YBOscBmZ1wWFVB4MqJ0SBNbk34uxc84fqbPEyiQrbDZZ69Tr8KiGEh63ZMzgmKc8zg
         6iKNXv03TDaPQdpRuvAiQKbmuUOwMovbQ0UB4IjIRXk8QwGGHvsw+GgYMxd7OOnCZpA3
         gkbxrdp596/+mhbi2oEuVF8MeJ741wPB2u8aYRFc9DkpUBkSYfn5LPOuf7IrzrN6S9BB
         KM/LR0976zlQuggi0SYYkULdyIQ2wEeaBjX6AKa+rUuGCWikIoqb4EHHj4tG3s1u1duR
         bcs/trPq6VuKcoLk+jJqWGogduEn9QshVqd+qerXeU2tWcaFOiuFJs27foHdCVfNWr0j
         8WgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        fh=NAKsjpXEENwCDxtJSPE4Utcfw5l+kr5R/nC7TgoDwbs=;
        b=Nl+WfDI2TrGdQR8Jqa1BNPRJxXxE44msIns9TPg1uZ7xJIXPDu3OS3NZkX+yWJVjMj
         usR8gJLjmNad0FCjeuOd5K/ZfoaGvkA8S1+dsD8PYvZA6x+n3xqAw2UguZZNRTVemxwj
         rpIJoW/yZa+JoDAnmWT+XWlUvcbwib4GyAGZhVkkzltpJCYoHa2u0NlI9UpDL8UTLV4v
         Z7tQ+ri0h/9rYyEWfLZaLvKernt+qODf5bZrQhs9YToMdYk4RbGNjVSkMCiUE/x2raTC
         8rqxYyyO4K8BcN6Z9Ibv9Cla/yAFGFIR3vKzYkGvLTZuPYKcvr7yE7bKbGJPG6lm1N9e
         iANg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112542; x=1792717342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        b=cT5brC7iOfTtQBvFyw4dnHmYWOoEB7Dt+mHjGTLshQCn8QQDwCEixuKLA8E+Kx37PS
         FB2JxyhUAtNSKDSE6D+ekborYkACTNrfGKd6RSG1vup2kXmpM43K7RiYOqFEzrJLeY32
         pmu1pu8WKTiiLh/+xSmqH/nYT3xCLEEm+oo7s40UJyn8hm59j0unxyqJfIXJ9dbUQ/ME
         QLoBcQaUqcGsrqPquJI1hGPMtM6iWY5JTNDQH9nFpg17kvT3CbYwh1qlFE6KOKMrvkv/
         k52EKqcELFrqoe/YPm7xNwZxRPLlfNktEqLer8a8+KkiHApF0BK4GhweDKSvlaiUIxVG
         wNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112542; x=1792717342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61thaWeZT91miu29wfZjfnsN1VP7QHc+H0c4ZsXVYAI=;
        b=2lfWwciJa/KpXn2jgQ+uaZGJP0vcsK3ytBlcPTu+gjGuY9NYhMifL8GorzsXgk9ern
         qDJJL7QfnIYNSrWfihwxpQvDi1Z3h6jKs7Dp2p7YLVj88YAv+f2gtlyvUSIX4A0C7y8r
         HFN36bLHkRkXBMUPtfRsePDBIx6aAqct98W1sDKN16SQn3rvT0cPVjqk9IsBThROvjXs
         RGwb4kmC+/fZK2t6swj3v+LjLObKCutMz4JJJDA1MTuSqpEpDnF7YXSjYdEql/vAiOT4
         PHXOW85H73MBE6BXlj5jkxhnXO7apuldEWkAJuMFS07Crgl+F6ZbW4h69Ws8f1V9pxs7
         +Kgg==
X-Forwarded-Encrypted: i=1; AKwUvBwBWGc/E8qEELS4DryHoucqWXlPm/7+q6LzncClRWHPJZfgtAAYr+VLIlEjHkrUl8/KyNio/n2bB9/E+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMqs6K6IefmO2FQgg3URoamfMKKHL+Qn0wH53Yevp9oqa8mYFX
	6AtNHjnVEGOe1XH6c+iDr6pO/d/5IDDlAitBTfCrmeW2aR8wasmxtDTkauyA39vRjg/XG4P353B
	egLgjT5hmEp3mwzCgmGIn2p31Qj5uhJ8=
X-Gm-Gg: AYBFou1bWXe+xIo8yNNF5lgrzA9nEhqvRiZNsDQafe/LgSNHOX/s5b8V0eGnCpQoPTJ
	40RpEKlT6X6Irac5n4slI4q9uEkMkNLsSfcb1QZLpKqYElkFzdwRVandsZObuneL+VFfl2GGU50
	lxmvDt+GjAHDKoRuqReMGJsd9Bk4MCRHHzXXPIU3a98uIGw3pqfzCdHHVa/a8TIwqeN47G2tyxA
	ngCwPYNwHj4tTtYcuTJ8KKMlA/+n7mFkpPz53I1bkzuhdmVzQCH3NWxSAoglpIq3P3W1ln+QqmB
	FiYGRN2VOLolm4JqMNAbS9upIrIVOo04h44doH0NLFsteolrzaTGf3K5JxBAqu5q/zrEcpdLM0M
	rdOgswzv3Q6c=
X-Received: by 2002:a05:690c:2605:b0:8b0:cf3d:7b19 with SMTP id
 00721157ae682-8b0cf3d7ef0mr21478237b3.32.1792112541667; Thu, 15 Oct 2026
 18:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-alsa-pcm-drain-wait-lifetime-20261014-v1-face1209fbc882aabda2@gmail.com>
 <87a4oe7sp5.wl-tiwai@suse.de>
In-Reply-To: <87a4oe7sp5.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 09:02:10 +0800
X-Gm-Features: AclHuK-9sZJHv-N7sDN_4DU5rI3kpYqHnyhFgeQYS7zeI7kbuFwQvs7XDIngvOw
Message-ID: <CAFRLqsVKV7X665-HOu-SRjG4s+D7QrRciiD6SVZexAnS7pffgg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Keep linked drain wait entries safe across unlink
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cassiogabrielcontato@gmail.com, cezary.rojewski@intel.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, baijiaju1990@gmail.com, 
	jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 01:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 15 Oct 2026 19:10:29 +0200,
> Cen Zhang wrote:
> >
> > snd_pcm_drain() queues an on-stack wait entry on a linked playback
> > peer's runtime->sleep. After sleeping, it calls finish_wait() only if
> > that runtime is still found in the caller's group, since the peer may
> > otherwise have been freed.
> >
> > Unlink wakes the group members before removing them, but the generic
> > autoremove_wake_function() removes an entry only when the wake succeeds=
.
> > If a signal or timeout has already made the drainer runnable, the entry
> > can remain queued after unlink. With unlink performed before DROP at
> > final close, the following ordering is possible:
> >
> >   Drainer on A                       Final close of linked B
> >   ------------                       -----------------------
> >   Queue stack wait on B->sleep
> >   Signal wakes A: TASK_RUNNING
> >                                      snd_pcm_unlink(B)
> >                                        Wake returns 0; wait stays queue=
d
> >                                        Remove B from the group
> >   Cannot find B; skip finish_wait()
> >   Return due to the pending signal
> >                                      snd_pcm_drop(B)
> >                                        Wake traverses the stale wait
> >
> > Use a drain-specific wake function that removes the entry under the
> > waitqueue lock even when the task is already runnable. Preserve the
> > ordinary wake result. This lets unlink detach the stack entry before
> > changing membership, while keeping the runtime check around finish_wait=
()
> > so drain does not access a freed peer.
> >
> > Also hold the existing group lock from selecting the peer through
> > reading its runtime fields and queuing the wait. Releasing it before
> > registration lets unlink perform its wake before the entry is queued,
> > and can let the peer runtime be freed before it is accessed. Release
> > the group lock after registration and on the no-peer exit path.
> >
> > Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
>
> This doesn't look needed / fitting for the latest code?
>
>
> Takashi

You're right. Please disregard it. Thanks for pointing this out.

Best regards,
Cen Zhang
