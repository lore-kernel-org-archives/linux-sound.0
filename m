Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D563B4EBD
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851873; cv=pass; b=mcLDQyLkWQ/mfBwvLaeFHwFVspTaR3KE5vbA2oucl22CJTqgDaH/SGLog1uG+OV6MkuHBtgh/upsDbNoxqffoi5EQsOj1Erl2UK2riPZdwrGQ9R6nMk7QX5gufvd2/jRmvbgBmBsxfeT/wFvQS2FNZs/FRF/ma6EvD9xiUwFbNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851873; c=relaxed/simple;
	bh=l5tldTytEQtl+FyZc64Sr54w73j7K6MXM0LNVV34fZ4=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4hXf+49+a7rPRaxvsebLI+3typi8P187V6zJxQZPnIllIzKsZw4eXYLO+XxoV7BhoYdf5AzGGcfHG0SZ7TGE1L+3b/blCscoaAQbguuYlCMWGU77NVN4Cg3d1TlqXmOaJcjA2tDEvfnEfe+y7CgVMWETGGpd5rgzHnDvdL8sko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl3MMVDD; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl3MMVDD"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664de4f80d3so2696542d50.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 13:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782851871; cv=none;
        d=google.com; s=arc-20260327;
        b=AGr+/y3e40OPBuEx5k/1pUT7emxiHznMBAxuIfIFr4/hJhXlu1Joi/ecJis452+ooH
         O3kYWemG3SrWS3XEsZrjIPFMn5JJl/PEZnVXzXzP9oMoayQIImGtGHUnzQybBnfRx0OV
         N0uRyMG8gNErKbLu7CL+jE3N9Z6u0mG3VIu4K0AZxooaPx7vQvKAIWM5oGOOIOMKb3M3
         MzVY7TotWot9rGpZ14mOZE0F19mHFfUViNtz7XhTRmTlKL2mpC5hnQBD0oCfl7lPx1Pu
         3ZbYpx6HqmttgEvnHwDJfYpOlDal7VRSIXUhhcIXzMCDyt31Gg+D9DuTrUhjBiBq0rg/
         IyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=l5tldTytEQtl+FyZc64Sr54w73j7K6MXM0LNVV34fZ4=;
        fh=xdcCJ4mX51KNBo2WRcTJTgOQ8ppN0G4CjAPf9eAy/aQ=;
        b=JULVzhimScYesiCVbIDAHYZfxQjIxxMZvW7x5/pwsdC2prHVKEy8lD3NVgeE4VBcSA
         kuxsq1kmHAo6HrcoY13+al69SnGgY/V2bFY8C3uk4F1dmvRenh5dl5teoiDIyF6iUyWI
         VK+umzP34V4/X551JXgbIM3zQPg7r1e06OPfYeRL+rOrFxKZrb7qO/bH/68GQw1Pk1vy
         KV27GMAKKgfg6Wx/uGNKl73dxs4aSIZZ3k1eVlEe+PXI1jEx1DkslGMTggyDhDGwIObE
         iTKOKCxc6QHwKSE+jwWO4Nw68qlpsMKu7IfJ9GDO/PlofbmR9MoMifUTmmk5AwVFVTTm
         fSxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782851871; x=1783456671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l5tldTytEQtl+FyZc64Sr54w73j7K6MXM0LNVV34fZ4=;
        b=Hl3MMVDDo0s5Mea8YExF6NXupACjpVPKJ6Hf5s6TtKxulHtA7CBhZQ42jBfDyGgwme
         qs6hCDdyX3kfdjQymBfQ2axhZupRIFJg1GaSLS9dDc0rLy4FlWItWEQuL9OEvJWk8lOe
         H2WcDaDWOc45rlocBz0iOsBKOurVBZQBuWRJZjkKjhUfD6ZD4E7WXy+thDzEy9go4VH4
         9OdQVYQy2xOshbjhQiS592nCxnEPpm5wzlSYYtG9JofHIr9m13mggpFiSFpntk7zIfJ2
         pU2+Sml8St0RX8Zz01/i2p7CUK25AqfvJXLNq5u+dlXbm+pLQzTZvXp3kDXHrv8gHDHk
         vBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782851871; x=1783456671;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5tldTytEQtl+FyZc64Sr54w73j7K6MXM0LNVV34fZ4=;
        b=MHe1DDmuvDvH5Lbi663HG6n8GVLxSHJPWDdYEoD6hJXHaGrRYNToG4TgKdxqxwXfTS
         T/7a9Y7nOcqY9nnIPVwyDGrKnP33Yd6Yx4S+W4vrTwhNZNc/OLrSzihPY2ZEzWbLU2bX
         er1OXAFc7rcbvIxsOqBAALO5rlRLtmDz0AdAnPVUVyx1ejUTD5wT6QrWkseuFX2vMCfu
         Oeu+CnrN4+BlXTLY7J8xTavxgIejo5WAsKrGkxBCjZvCJh3baee1pjOVLGvxMjhvGo+a
         tmumy1Z8CLfbIHGm7XWpAlMmz4JNjRh5WRKV9MNi+4xRnaGAfkqJeAznUQAipPO/nOeB
         ntUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYWmsgHLxGjmb4+r7SUqKVo5Vqfy5LOwd7lYL3QkZpXApyPl9C7NGqSPXINctBbguo30IPQwtUAupbMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KlAQB2avSg7Jeas6jU87YS93+UMzSKNmDnZXpitVDgm12b5b
	j4y6AqimZtrNNqcobNw3hVrvDrNg9Qe6JTKmXKjWji5PgFE4BQcVDyjuFy7dmuFTmYEMYxp9cEG
	i0aiebMEFZtHCoe/9qV9nGP81bfT0xEI=
X-Gm-Gg: AfdE7ckaivyjRm7KYyP5MnN6TGa2CZcPeV1ztebpLf2+e8EndRhu/DSSYBouOw8h2xF
	3be5LjTBkqHei+j6Ol60CHoXJSHSJq+OSyAk0RquAzBc0rqz1Xg68HZPQg5IIArLRa8PFaXutGG
	QA3L12/g/FG4eF40F46N8zCvT049uBevwzN1vLszmvnDT1n6FjxDCp+w/iZ/Gfg3WYMu+oU12sb
	EIWSWn+AUH/N5O7D0lPcGiiVIJR71LjZmNkTbpmMn3PP2o+nIR0yNIcc4fWR2R5xCmQ6WvB
X-Received: by 2002:a05:690c:350e:b0:80c:2365:8750 with SMTP id
 00721157ae682-810d7cb4526mr59921047b3.18.1782851871438; Tue, 30 Jun 2026
 13:37:51 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 30 Jun 2026 13:37:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 30 Jun 2026 13:37:49 -0700
In-Reply-To: <87jyrgw71s.wl-tiwai@suse.de>
References: <20260629160232.29158-1-alhouseenyousef@gmail.com> <87jyrgw71s.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Tue, 30 Jun 2026 13:37:49 -0700
X-Gm-Features: AVVi8CdUW05v_MgZcWLkU8Ic4OyruNgLlST7mvgb6q35xfiVJon_zKx2s5AJz3Y
Message-ID: <CAMuQ4bU9o8oH+RJWW39=5kqiAetDG1N51Tbc6SQzzOzhBH9a-A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: scarlett2: unwind notify URB init failures
To: Takashi Iwai <tiwai@suse.de>
Cc: "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, Takashi. I missed the common cleanup in snd_usb_mixer_free().
Please drop this patch.

On Tue, 30 Jun 2026 14:23:43 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> On Mon, 29 Jun 2026 18:02:32 +0200,
> Yousef Alhouseen wrote:
> >
> > scarlett2_init_notify() stores the newly allocated URB in mixer->urb
> > before allocating the transfer buffer and submitting the URB. If a later
> > step fails, the function returns an error while leaving a partially
> > initialized notification URB attached to the mixer.
> >
> > Clean up the URB and transfer buffer locally on those failure paths.
> > Leave mixer->urb NULL so later cleanup or retry paths do not see a
> > stale notification URB.
>
> Those are released by the common snd_usb_mixer_free() in the error
> path of snd_usb_create_mixer(), hence no need to do here.
>
> thanks,
>
> Takashi
