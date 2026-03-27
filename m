Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5B30C63B
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621134; cv=pass; b=byObXA5Q6l4+pPGRPrpMX7HuySHR7i6KMWcpkie9RYPUVoXPRiR4Uit9Wn9oibY6516Q58Zb+WTT7ZxStbXn0F2g8A3eXSlCM/K7MO+wKuncvMrzmjT8rKjFSTF85BqSqNtDo7SU81WgYYmPfGYDO5seCP7FffSU/3QZkIdGlXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621134; c=relaxed/simple;
	bh=XBeNYYAPuvTVLfkVsUIH7at1IDW3xkmATRGk64v9ems=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sq2Yk8dleuAz6ndGUcAxMwcAUqmxz7Pxw2T00jqE8vlgnbD79bwwbRsdqeTRrnkf0YssR72L6pDOBm8VjPEpZLd3lph6WOEXhX7tFau9K9tdpiZPAgxwQXU8ggQVTzA98mN7spbzPCKGMrDJ/VpZJoUDQf0xQtqVA+/rTCiWb9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdOOhDVs; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdOOhDVs"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64eaf8aa893so2226763d50.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 07:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621132; cv=none;
        d=google.com; s=arc-20240605;
        b=VccuEt4FdaTx6h6YqvZmHuM0II1jux3HRkcSwnhhiHpLQjvWpCnUFk9jjqYmdejfN3
         baApJMLmawmgij2yRcMd5gltQ7TvR61GE4je/By2mXLox/8XesX9lbJtCyFMjMgNgiOX
         wJx0vD9cT4K3Ev4t0x1H2OSVnizg4rMoBkL0PJL/trVdbvXQasXtNas/4ij8I/ShKlr4
         zhR7AkhpKC8sOH/zlmS+4NeZ6ZpOcyVE8nOO4EYTnrufMR0YLPHykExwWx2anhNfEEWT
         2OkDgaO1JgBYh05YTzUjl29bmJiG/OH8pUvRYoKmzDU+Y4IF5eCncfMTXPMao+GT4/dc
         /fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XBeNYYAPuvTVLfkVsUIH7at1IDW3xkmATRGk64v9ems=;
        fh=CaAh8Wq+Kv8Vlx/MFffSQgq4Pjm5aDHrIUR2OXXsBoE=;
        b=fAjXQfmQfAHAzCtWUeL/2ejOPSrgB+JM8xHW5gCM0f0i4flx2OGwiwQQvvgdtrHghi
         9o2ZrFbN+dyliUMdxUIYaBIOnEYkc6qFyzTCD5CgkHCcOeQcCQ3o3LyyQqTSda3NcBse
         6KujP6nVo2Wum1RxrWR88WirdYWXMz7h0Gv2E7G6Z7ho/VcZ8lWivIzyES36QOcwa9jh
         5AWX6j5H4D+12I6g7tjJe8i98ZAuon2G17+Ble4VAtRJoWEevINrmSt0q9nh1OWIvdTm
         ROe7llWLrQ6WMoM7rH0SC58ikRjpFuLBxWq4kSbeqFni3Ocddpu6Tt3tjCTtbtH3DK+c
         ortQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621132; x=1775225932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBeNYYAPuvTVLfkVsUIH7at1IDW3xkmATRGk64v9ems=;
        b=LdOOhDVsY7bavNkRLtlLOv+XSgwGyO60kx4bNMSRUxnveeDB4WdRLsU5ADkodNf5OG
         AzCHWddaw56SPz5STyl/Zo+Cp4yHuqkFY1OQ89L3HrzLEkKmRVfQ/xepw8SpQd5ISdi0
         lFlO+OPouK18Gu3MtnttfxYR5imiAjjSaMLvQfXht+EYpw5MjDDObmDvm35A32GlmNN7
         SLh5Uo7bI6Q1XrlXPz4Goo416512nctTcfBwLwbwRWWpJ4R3qbtinC1EKT22XZm8cWXL
         hT/6XgukYsQ2piLVpObOE0ji8KKnfeAdotCycPSK8XUCI6yAA2LNFaR1VJeT5uuBBXiM
         +V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621132; x=1775225932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBeNYYAPuvTVLfkVsUIH7at1IDW3xkmATRGk64v9ems=;
        b=F042dlP1Dt/ZTV4G77V61G7leBhgFijPa2bgIV0l4aWg35pwhsjgP05rq0sYE5nsDI
         /at5ddEcUXmmes5oxkNnaGkElNh+cWOg+4YDGlzqnjKOFZuK67mr1fTsShQ8SezvUkCB
         ao9xBCS5JVh5D2xfCSeRqJ1dKzupLY0boUFoHwZn7/xHsmI4cmQVeKCl5NlIZj9U2pmv
         KxYshqVB0xb/tiGxnUNs3i09osaNYWsDFAH9iXJXhYH4dYBeAHb6WDXuEbg0kEVIVrwa
         vGV+ICwb6xcTDXNWPVof3nP3CXrBIq2HHoslThueqq9CzajwgAaeIjq/A7gnInULJ6/6
         aMxw==
X-Forwarded-Encrypted: i=1; AJvYcCVDdo5ODO8LtYk9vYqSRu5n79qTbNZ4vb65QkPtkz4dcOztCDbEyTxle3T+OYXaQBYZ4mr4ImwNjDOO+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YySt334+VHj0GZU+4lVail6WQkomKUmmgYjA3FACfux0fleMLJE
	QvoTw2if765p84ohrpcJyU/T8UrDQcvbJFsAdGXEV2t0o5wkj15k+3E/7AgxPrYhlHzATF7NDQg
	Jti0zwfcrBTMyEqZ5DE5sbXTvdwts9Fk=
X-Gm-Gg: ATEYQzxl9v67jv9HCJxvS6qgAHP3F3rD9W22C4SP6Q13Xs+OZ2KfIpdvmqDjmwmfm/1
	ocXAEsGYO6DJP8JZC3s9FJqcSWYgaNMzKwpDRl50eu92F8+6cJ06xQw35hobZSssPgIFS1ZnBlW
	ybRqgiA7N4TpfgLOQc+BvcYxL6LOSKkgXKASCSxFXuOutJhyrs8Ua1NUJPfIfSonnHGcqYh3Y+5
	y5IbnUml5UgEjyjfi6y0hz95dQTrnhHADT9Jb4P6cGa8jmTvuzQCPx3esFwX7VQ2l3XCnHP7rek
	0W4ldQgG8n60Xq8TcJqCXddTWYPSj3FX5HElF2s=
X-Received: by 2002:a05:690c:dc5:b0:79b:e346:980c with SMTP id
 00721157ae682-79be346ad82mr15997857b3.12.1774621131864; Fri, 27 Mar 2026
 07:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <877bqxsin3.wl-tiwai@suse.de> <20260327120149.18076-1-nonameblank007@gmail.com>
 <2026032724-reveal-oblivion-e2db@gregkh>
In-Reply-To: <2026032724-reveal-oblivion-e2db@gregkh>
From: NonameBlank007 <nonameblank007@gmail.com>
Date: Fri, 27 Mar 2026 19:48:40 +0530
X-Gm-Features: AQROBzCKNRLstHR6F4FP-syhuDsHhOD5gFeylEfoElrad0J6z27hgVliAz8oEkI
Message-ID: <CAJ9UwXAYD2PwdBnt=hFKkbKUTm9kY8zXacAgE6zXDKOLhBKmKQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
To: Greg KH <greg@kroah.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, stable@vger.kernel.org, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Really sorry about that it's my first time and i wasn't aware of such case.

I changed it because of this,

> >
> > Please use a real name or a known identity for Signed-off-by line as
it's a legal requirement.
> >
> >
> > thanks,
> >
> > Takashi
>

I apologise for the trouble caused, and would be mindful next time.

Thanks,

Sourav


On Fri, 27 Mar 2026 at 18:16, Greg KH <greg@kroah.com> wrote:
>
> On Fri, Mar 27, 2026 at 05:31:49PM +0530, Sourav Nayak wrote:
> > From: NonameBlank007 <nonameblank007@gmail.com>
>
> This doesn't seem to match:
>
> > Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
>
> ^that :(
>
