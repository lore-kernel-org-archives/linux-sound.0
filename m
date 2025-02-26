Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181261E1DEF
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558750; cv=none; b=iZXBcagiUOZrSBaQwBRUaIo6zaH/H7D/RmQc14+25Gu1TV8pVKRXR7H1h9ivuCWzciSzrfj1K+o5pj1Yi7yigSYjim3rCTchqi8609PAbiGYkyTj87eODGeQ1bcbDKGCIlKQYKipchZ8yZYksPFWjx2IslKrMshROjxpJXpYO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558750; c=relaxed/simple;
	bh=c9lrfePZLWGL5V+Mx7keS8Tu9OarsDgCH6OrZFxseP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7OasoFSz7Pn2prZ59vchkqhgBHDOrZa5DrcdH1UL8cHY8hNx85PJ6menuDxIieMdHLDq25TtmKod0HlKsHdI2yIDYIijDeMPyW6TTHqzraLjueUJIZ71MDed+gueNTYzrI+P7qh9VLgo0pIeVL3NiOBk1Dw8xM9zpNHQc7+PAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmZzHhVG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmZzHhVG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1023405a91.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 00:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740558748; x=1741163548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9lrfePZLWGL5V+Mx7keS8Tu9OarsDgCH6OrZFxseP8=;
        b=QmZzHhVGRgfxZQ+S7mEg5dfzVtRohNJmS7KVwBpvIC/vqRRVor5Q3HgQISb8+keoPs
         DUHwefbf/lY0g8KRLJNghxMSQ81y+5L2updP0jggxJJ+8l6y2jEi+nucaOAMk74T37U4
         ABbohsJ3BoQzmNvfCPPSko/T8Z6q2l4hlmBsRQKIYRxaglJ3kjM56F3LSIIIOO2vSYx1
         FAbqW3nsM0ym+erZgU18SdbrvcXRpko2B1hOS9eq+AIE29FvSDc9omfbD3w7PKTYggcJ
         wGf+cesc3kHdFjVIa0Q2MEPh+Ug3KynGvSRl+xfBe7uWyGf6tvaSJjbLfQkc3PFHqIDr
         tlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740558748; x=1741163548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9lrfePZLWGL5V+Mx7keS8Tu9OarsDgCH6OrZFxseP8=;
        b=UWix39G9iV+HlQeM73G3xU+k8/E2TF2+5k1sW+cBrztXKaHJ7Rx3l/WoMlUehJOdfp
         sPNbU8BUoord3/gbm5Ob/6eTtDtU5Z1/3H6Y9dGDegbdkEVdAULUB7g7vAZD2dFcngdZ
         ewcZnstCC03jNkynPeQa3u71DVZq6NtYQJOkEwAZQWsc/iTD6Kh5fB0bDJx+JQHfPKJL
         3AJhCtliW+LsaG2cY9E5oUXcx92LLKPc3o54F1mepxG4vEx8FuKr9uQkAoR1EaTcQyQp
         Abxgc5iYVHTbRjdhKUcoF2ADtD2HGFZDbXP6lMghnkTUlD1w8yoAxJpiEqYAMc3u8GFS
         +Abw==
X-Gm-Message-State: AOJu0YywBJ9F8hssuZ+uMmBSMjbfuIxYYhDsiQG88W+xZFHlqK9DRscW
	/3fIIF53EhjTYqOOF9vfsrgxkIJLrw0oB5UHN7KEvOfyXEUPtohq7u0V5WJxV8dSA+ojhUacaXP
	vLeeDdWiQd7cPTcz70ni+XsXbVgkLKAht
X-Gm-Gg: ASbGnctiMdVJHAc+UbB0jexwDK261rqeEbDBgMMKzAiKL70oRGp1Trr+YeiVBM+/KrD
	PaluNxal2azEZvnuec2SrpSxiLHqw/bw8dbHh5rIOnnXr+X6/LRnbXwLh2CJuDB9eo8gvx+29Vn
	2SgjTD
X-Google-Smtp-Source: AGHT+IEwh1JAPwf8T6PBo/yiQkexUZV5jC/3dVVHoIwvLK5AzHY35ggDBlxI65cjzbkpeoJ6GiuYF725ELpeUKwbCE0=
X-Received: by 2002:a17:90b:51c5:b0:2fa:2c61:3e5a with SMTP id
 98e67ed59e1d1-2fccc13d8c3mr40535672a91.10.1740558748360; Wed, 26 Feb 2025
 00:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e59495a0-c015-446d-83f7-5f09686b0bed@googlemail.com>
In-Reply-To: <e59495a0-c015-446d-83f7-5f09686b0bed@googlemail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 26 Feb 2025 10:34:04 +0200
X-Gm-Features: AWEUYZllbaJdQTD55dz3NF4-jbAahY7bsp7AT08fpuBHBUVntRXscxAllTFMf58
Message-ID: <CAEnQRZBUctOoF0gMtyJuEiWVeW40XPxu9vKjAs3dUfLGLxiq9A@mail.gmail.com>
Subject: Re: Added support for Presonus Studio 1824c
To: Amin D <amin.dandache@googlemail.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 5:26=E2=80=AFAM Amin D <amin.dandache@googlemail.co=
m> wrote:
>
> Hi,
>
>
> I added some basic support for the Presonus Studio 1824c Interface in
> the same way as the 1810c is supported, just with another USB ID and
> renamed the functions to support both:
>
> https://github.com/blodone/linux/commit/4fcb586c67f322d983ca3c28759e9e2bc=
9ced139
>
>
> Also this is my first commit to the kernel and my C skillz are currently
> limited so i did not try to distinguish between the model cause it
> worked instantly and the model name is displayed correct in the sound
> control (ubuntu studio 24.04).
> Connections with https://github.com/magillos/Cable work and only spdif
> and some advanced functions i could not test yet.
>
> But i think if it's supported more people gonna use it or try to get all
> features running if some are missing.
>
> So should i make a pull request or is there some code checking and
> validation needed?

We don't do Pull Requests for Linux kernel changes. Instead use git
send-email to send your patch.

You can watch Greg KH presentation on how to submit your first patch here:

https://www.youtube.com/watch?v=3DLLBrBBImJt4

or the Linux kernel documentation:

https://docs.kernel.org/process/submitting-patches.html
