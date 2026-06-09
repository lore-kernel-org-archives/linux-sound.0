Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E834676D
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018600; cv=pass; b=JUGDGYc4M7wV+1wBxJNWbwVc5dTQzXO/CUWznQ3A0pcL2tP7hipsVSTDRM0VpgIq39js4z2JUsv9D5CCvBSIkIKCnPMeDZzODSsQQPYRuZzr+VSKWqU4cf5LVJrNYaZ123hDTXrm1BYgcNAxuMA0j+gczWrxEjIqR0SpdbOUsOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018600; c=relaxed/simple;
	bh=MBntVYICsjjFyQUFOBnA4JyR0smWGFhnYlKxqD5Mt/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cG/Q3Ue+mfavvLNyMoT0WyvsfD5evK1aI0VZS9uHx9vwkDHWRysrhZzPDjBrA0pI8gK4HR1h1PonJJyPysk4WA0YZc1CShkSMSwfX5XMTpaGDJ056ydSakdkFHEjQRRpF1mBHJLutAkYIqG52LsRl3gb8OFvxUrcBtLynZRWcFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQaK30a/; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQaK30a/"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137dd523634so8921761c88.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 08:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781018598; cv=none;
        d=google.com; s=arc-20240605;
        b=goiHTU7dfoIlUQqZd2Nh5kDGBPHVcT+5/3h+bo03hNPy3nC5JBmZlxFmQlK0uMV3eq
         Cm5KQuHTRwLjhBbcWeulFhFAJpZI9/xN46UL0lPMUhqv60Dj1HTHLOY3LCvJ8oJ74kie
         85wlD6f05Z8pNsZg3JVmUQBQtRmsHU58bdHvTM9AmJA3HYk+ZEvf2/sxopVOavvOww8f
         LNWN1R4Qw9iZcGjbFi1iYlbzQIGLEsbvivetFAea4Y0+mR8Fa5KsD+vz59m17yo6opXZ
         dK+zYH5jGBWaLScXJTOWw+da2CSpHXm/kTyJ5KhoWR3uBD/l+EUJEqVCmWHyhCZqmxtA
         +Ibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jQuVUqhk1bUav7pFN3taXOxuYfDLONeYOwY7jfnlFKI=;
        fh=uGmLW8dDDF7B5HX/S9bAvOITIeZpPeTRfEs6fD9gZgQ=;
        b=cYaVZvpmZVoyEs0TQxCIL6qudN4GaaxTyV47K6wnIzLFgIoycIF97GLdbAB4hcc3qj
         +GMsx04huTKyMbNiI1JHiPP+SQNscsIeGjr9qDlnuF36Kq1lG48rdVo1AuUCcJGsyjGw
         e2S1mndP2R2YEfGrjWusSZuHjZ9HsLYY8VuyrYyBwrbHxVPiVjMSAcLcmghFECRxSdCM
         lE0Po3M3X2oX/6fYE1ZEiNlwLAsHB4d5BHu/4sA0OJrsPun9T2h/BCVh6omzoCE0r8VO
         xEoxedneYwLqkBg1W4FY8l6nQGbKIACNXsK+VAn5l/9GqTr5ypMIepJU0gxetCnEm1pf
         UfQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018598; x=1781623398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQuVUqhk1bUav7pFN3taXOxuYfDLONeYOwY7jfnlFKI=;
        b=YQaK30a/3X24PI6gG5l+2yhQu6X8UQqW0Fg8lDO8dFqlX2+NmDq3vuZtS8p2jy6MMJ
         2LOBRlf/hhBVz81oL9UVckHg0g5fxKA54MBkHqdk65+hYQq+FGB9jPbbXfx7zXDk7FpD
         lbMMEFl/n8PGrAWRv61axr2uwsEzWj4FxJqJHp3bEc2xkzi2nqWKdSnUomvEGuM7xlPV
         CMiUVyT8Ec2WXHirbgqHGCauOxPPBbZCPT2CPf7+V/Vk7PlNgaDTbtrkfueCg0r0ItD7
         NoamVGfxHSVtwZ81zIqbqQLeCKc6h7qHjIU0eyXj6I27C4z/MtJu7yhyU25JP6yU5wwl
         eKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018598; x=1781623398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQuVUqhk1bUav7pFN3taXOxuYfDLONeYOwY7jfnlFKI=;
        b=rPuvc6G0Xzy/IEKoAPyrkKScntAZqN2clAyJZnUArgwxBIPA0anQwhjBjwSyRKqmKt
         9LlxGxAt9FoRkLMqdlhKELNJA1rM4CjKO/UdPdr0FLpGe5idCMem+FT7XddAlThGNgvL
         k3SrYuU4jNxWwX+9Ud16WIrNglZhQtxeLZbiQaamReHRySFd4jN+RjDAXGEoS3iCUGNi
         erKX8dbuZKmu2ygVFnTG20GlyNT1muUgom/h+rv6wucR1++eHyQHfPSLaLNJfb5f9FjD
         aumRSJfYWP9sjBCQscQ5WtVDdahqWmTBltyM7sU96rpDA6//0Isd3i4/neEASIz5gK4r
         N7bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yurX95zYv/uGpS1/qKympef7E19wZf/DSXFFr0uA7aqre48ETMsk5UH41J9ikH6rnvysGrVgd6oLefg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBT7Xu5oQCjhDyUDuSnmSyVgtvGNH2gpnuvr9iFBWqZ0UIJpH4
	pqEdXWrlktobrp0BlB/bTcq4HDZYapbyy6NWMxHCObawgis1JmM6PDJpQooK3SlXagKfN6D6o9i
	pjrr3RzfmHATjuD7wJv3QK6RgzPaaPB0=
X-Gm-Gg: Acq92OFj0xDAJCjm5YaAIAD4Muj4Wjs60WrCQpsWbovfJkBIi4aPlXGGw5uHS1e2SSf
	ReQJB7KvMuMQX8KX+w6wEDIMyBUKrql2nPm+qNYFjXYmadobxa75rRcTbNMDYJVjimrgCQwhpRP
	OiAAO6BkOTFRFyGYWSFShJUK3pdYOUS5rz0P8NUiKP1vrxE4G1k16BZSaKoMYwDjE7eTpgmBV6K
	GqG5qrTzqEsQQnP9lLysI8Wk9AMk26Z2+BFrJb8/XI8AE7GEZzvH2W1EzAXHT9rjg/frBRik1VN
	V97nKUNh/uU+6Fa+csc=
X-Received: by 2002:a05:693c:2d8c:b0:2f0:5605:466e with SMTP id
 5a478bee46e88-3077af4c0a3mr12330527eec.9.1781018598215; Tue, 09 Jun 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605051637.1442529-1-lgs201920130244@gmail.com> <87mrx9v721.wl-tiwai@suse.de>
In-Reply-To: <87mrx9v721.wl-tiwai@suse.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 9 Jun 2026 23:23:04 +0800
X-Gm-Features: AVVi8CdgqmG7SAUvRHZwEWVbg3AY-wJFPO6lMYMqtA5tuwdnHUg7sSngZ5Tr9RI
Message-ID: <CANUHTR-aV34zpJ4RPeSkkz=KhY-7-wxLmqnfSPbhwVYgmuFOSg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: keep linked runtime alive while draining
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Christophe Leroy <chleroy@kernel.org>, Mehul Rao <mehulrao@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Cen Zhang <zzzccc427@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Thanks for the review and the pointer.

On Fri, 5 Jun 2026 at 14:24, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 05 Jun 2026 07:16:37 +0200,
> Guangshuo Li wrote:
> >
> > snd_pcm_drain() may select a runtime from a linked playback stream and
> > queue a stack wait entry on its embedded sleep waitqueue. The function
> > then drops the stream lock and sleeps before removing the wait entry.
> >
> > commit 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream
> > runtime in snd_pcm_drain()") cached scalar fields from the linked
> > runtime before dropping the stream lock, because a concurrent close can
> > unlink the stream and free its runtime. The same lifetime issue remains
> > for runtime->sleep. If the linked runtime is detached while the wait
> > entry is queued, remove_wait_queue() can later operate on a freed or
> > reused waitqueue, or the stack wait entry can remain linked to freed
> > memory.
> >
> > Take snd_pcm_link_rwsem for read while the wait entry is queued on the
> > linked runtime. Acquire it before re-taking the stream lock, matching the
> > link/unlink lock order, and drop it only after the wait entry has been
> > removed.
> >
> > Fixes: 21cb2a2ec581 ("[ALSA] Fix races between PCM drain and other ops")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> This should have been already fixed by the commit 88fe2e365872
>   ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on
>   linked streams
> in for-linus branch of sound.git tree.
> Please check whether the issue still occurs.
>
>
> thanks,
>
> Takashi

I missed commit 88fe2e365872 ("ALSA: PCM: Fix wait queue list corruption
in snd_pcm_drain() on linked streams") in the sound.git for-linus branch.
After checking it, it addresses the waitqueue corruption case I was
looking at.

Thanks,
Guangshuo
