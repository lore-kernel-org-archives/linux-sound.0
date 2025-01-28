Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D56198E65;
	Tue, 28 Jan 2025 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080421; cv=none; b=bBSQpbdp8UiUuF4EFel4+HS0Gz/g5NPd987oP0l52FJCOF/DU7kXs0cImDrAdu3RXlVJhZXbtrVDjLIP2Y/wyVk7Lvsy7FNJkkFrjfYrnG+UMjv3ZrmysjFfdTl051o24VoukqR3o9OC9eo2QmqXSWzaGG9oiX3Q8zkOi6sz60c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080421; c=relaxed/simple;
	bh=72CqtFa0s+S+ehOLzrAZMzUPN1XmE6QGRWqZ2UIGtHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJOpK0liesiowvreuthuz4mPbvJLY7kO9Xk48OSjyi4L0+E7/4Ng4f6Zwd5WblgPT5vLuwvHajfZpd77RPTUty/DITUrJ8mCvvE07skCQFXNjMWgrhsf7ZYzEash/JjQunk2BLl4R9TOn+X/H6wYMTlgnGDSK3hYKR+tEgP1zQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSFsOFHE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSFsOFHE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-218c8ac69faso10898265ad.3;
        Tue, 28 Jan 2025 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738080419; x=1738685219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72CqtFa0s+S+ehOLzrAZMzUPN1XmE6QGRWqZ2UIGtHM=;
        b=DSFsOFHEgdGy8MkfDHFMm2fzySEW7q2bu9e1G5P+moD9mYYtOkBBZsZuOgTi9Z4+ko
         DJXHhhSR4pV2QH2Rt2QkolzPc3mXVvIlxj8rX+/F63alauD88BIkDjNeQyPydhYJ3Omw
         VzLZwbtk16vdMI29DZK+zGh3+CC310O7lOB0/IFBDoZNqH9qoU7H7GLQZ1Ml8ALM/92y
         L8hCX+N2UVK3EfJOjGTy45CWM/T4p6SU6NYsyE5vsWR/IJWjCF9uGxNkX7J69HimhwaD
         IGq+XzYXt8BuZbXdTwUhULjSCRM6jZcEaQmO46v6gKjuZUmP03zEoDhzwK0HxaxVd7cn
         v1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080419; x=1738685219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72CqtFa0s+S+ehOLzrAZMzUPN1XmE6QGRWqZ2UIGtHM=;
        b=btuPeL/Xqg1WnZnQxVH0p4kJGROLq+EcfIUAI3w9aK7CHOlbpMjq+EY9BadgEhP76r
         1cTMlNAWIXrAJPh+ui2LehnPDX7vtV4opa0VfMpqYlsIOOLH080txG6nOJ/8LNXpAkOg
         XkQBdgy7QXAliuU7vBsVoRtoHlEk85kLLfsFIN00M91zVIQNdroeu/uiCsVqbUI8JKsA
         8LeWH2Hf3aQp2fAWvICUStmgdOmzPc/uwb6kqivNAAYQsbOm6BqWdt9PylxOiSXjvTt+
         m2B7YgHI2Nnh9PvLGzL/fUVxY/3PdhIc60eFRVTTH0ieSeKAMvoPlFtQubk94P2ceP8m
         XO4A==
X-Forwarded-Encrypted: i=1; AJvYcCU/ikOxkzXSNFvMUD7jd13JS2bNtJqhJIMZzdJ+VtFzLLdGpG5jd3sTlrg18XlwYuZNEINFl6cWUxC3coc=@vger.kernel.org, AJvYcCW2M14FGlwZssCqYeAWjncpcDODxyBgNAiovuvNzQpndExP6X7bZTSuqJfXo5qA9t1XNgbBPqPAzaIpfho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdhweb366oxlJuuM0hQ95m54WHMVOi/b46xoiVNLPnnZFn9eB
	Ui+eRAl6mTYajlUkeUFrnO4TcaivjnLheZq9PgIanuW2HGHqIQrmS9xo5wG+ooli3Qx2r5gSWGa
	rxgiXZRjh1v85ZbGj+f5179Gu3w==
X-Gm-Gg: ASbGncsBgzYStsegHJ92uptaWWWLRQisdD0otuBNlDTml2n017nRIxOlTx/Z5Vy2oyq
	CzFYATxCitNMq79WSOd/CtpKmBa2Y0q2VqC883OgYdh/TZe5HOO1upHJkYn5pQ8A3xMgXmPUGkw
	==
X-Google-Smtp-Source: AGHT+IFMhzzha3ITVYsP3UjSge2V1Bhreq5ulExaRKLwNbPslam3IiBQTLNZlKZXmYPKirsV7ph/yQTVxYWMc1Egq28=
X-Received: by 2002:a17:903:2449:b0:215:5f17:4296 with SMTP id
 d9443c01a7336-21c35553894mr250622085ad.8.1738080419489; Tue, 28 Jan 2025
 08:06:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127160655.3119470-1-cy1yang@outlook.com> <87zfjb9y4i.wl-tiwai@suse.de>
In-Reply-To: <87zfjb9y4i.wl-tiwai@suse.de>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Tue, 28 Jan 2025 10:06:48 -0600
X-Gm-Features: AWEUYZmuhiXutR-P_T3cSad0D7C0PwHFJltNiJ9JsAMrUDUxVPjK-5EoSCKlA4I
Message-ID: <CALGdzurXfO+fwVJ+JR5de-KfsudeBYdYkYRObBtU3mMq5vN5ug@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: use new array-copying-wrapper
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, pavel.hofman@ivitera.com, jbrunet@baylibre.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, zijie98@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

It looks great to me! Thanks so much for your help!

Best,
Chenyuan

On Tue, Jan 28, 2025 at 1:49=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 27 Jan 2025 17:06:55 +0100,
> yangchenyuan wrote:
> >
> > From: Chenyuan Yang <chenyuan0y@gmail.com>
> >
> > This is found by our static analysis tool.
> >
> > pcm_native.c utilizes memdup_user() to copy an array from userspace.
> >
> > There is a new wrapper, specifically designed for copying arrays. Use
> > this one instead.
> >
> > This is similar to the
> > commit 3e91a38de1dc ("fbdev: viafb: use new array-copying-wrapper").
> >
> > Fixes: 67616feda99e ("ALSA: pcm: Unify ioctl functions for playback and=
 capture streams")
>
> This use of Fixes tag is misleading: the original code is correct, per
> se, and the original commit was 4.14, where it had no no
> memdup_array_user() available (introduced since 6.7).
>
> So I applied with the drop of Fixes tag.
>
>
> thanks,
>
> Takashi
