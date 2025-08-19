Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B211EF09B
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612177; cv=none; b=tCcq4zWTolgEPKhLl4rweAG8bWuAVp216pq4eKqbzoZSdRjowjoLSruADIqu4H/vvJMyo7/CO6Cuwr9xKhKEmLnubHup7BnOW8gEOYm5h+axGC7dXGsO0A9fhHpGyUuwT1s8U7iZ/pYSRn0rBD1BSeLQq2Js5yKBgARSDWBQBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612177; c=relaxed/simple;
	bh=n/er+JpBwNunf1BeZu5hnyIXWJRrp9ScBTyqXPJHl+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqW94MDZ5iFRphM3/dpdIcC//hZ9LvFecPkuexApfZkQ6MlGZurRcZJAzSuXcKAP2tFYWCHrZhiAb+Coo9FVdJTyvIbMa/CUU7I7E99FsTyj0Iob+tCCcJNBhrP/oKz7VZLqHANEKpXrlMylU8FdbGZd2YX6kIHtSo7Dio+nx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=RhH9S0Xq; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="RhH9S0Xq"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e934b5476a0so2125302276.3
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1755612175; x=1756216975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/er+JpBwNunf1BeZu5hnyIXWJRrp9ScBTyqXPJHl+A=;
        b=RhH9S0Xq1lw+f9Nkwiosb70tI9VaXuzD+CcYJEGynx+Q5FKyN4r3CYz4sBvK5WbsN/
         DFdPN1rPqNq3ieZQeXY7dcMdPm1WakaxVE6VIdLRmtW3lhZYJLbYxr8V80FXTiwim0xF
         JOixzptwBmF1nO7FMgnJE9nSJ8Dn8bHn8OC8NCXA/xiVVCvK34Q4Rt/+ytS0XsePswyx
         oY6XtN8kWe0MZKqnODDySZ2QcmdkJSV3jrC69sBYv3E3hrYVmsRC1pz/jkAZAMH8X0mi
         9m+cXhNEDJUch1BDDNifD5tWwTSz2DUXgcnULOPsevxTla7y+RXBNjRFjNIKJoheqUHO
         ECRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612175; x=1756216975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/er+JpBwNunf1BeZu5hnyIXWJRrp9ScBTyqXPJHl+A=;
        b=dK3QBzYQPtfJQb7UiyLdgvlqmj8ghwm+fgbyLQd5ltGMW+m/9TyE5LsqEhzr1pBC9t
         BDLnaD+xab5RPN46Wi1oiHTT7PeykDLhZwU46gxJi3QvIS9vAUhFlLXCkYU81IeoJlwG
         eCfAHSm8ssQejz+SI6CJjPZTXjksfwobTd9i+BbB2hiEIQsto4igxYerwZM9YD4tDmXd
         HKe6p5y4fqGmNaAszzTNXiybUFSe+2hmTG+sFiXFlqBKuoRcU6ivhZcHDAYQ36Wqtcal
         XzqHpku1SqTG/uk/8PDcxeKiV8DOpkfYrH0y+98elxUABiXRLcw9/3SzJr988cG+I9mb
         khnQ==
X-Gm-Message-State: AOJu0YzW72DO0NL4jSf25d+qW1SZi+wAEhpa2bpxl427/hqJLSM2ATaQ
	vOFagw46ExwGuku29TZNiAN2g1ZG/nFBVLmx4MertnrPxH2c828MyX8RdfAEK7QCYNzzQVkDc/R
	rypSTBlddGhMaWn2QJrMtSoQ1P2YjNaERBXW0VUCvKA==
X-Gm-Gg: ASbGnctTJqazt3dX2a+Y8LV4JDvsTmTZcab4ATaRXprJQwsg4VSFoEOKyijb2YVq9SY
	WO2CgSevZtLLJnEOskLMCLgsvtHmHUnWlK6ntxviugsp3wsE8VMe2VJs8xsfZU5L51t4yRsnLMt
	KHIoKZErR5jfGm7DI0rs5FnbG8Zy8GtvvzvQ2qGqa9g76BD3QKGhFQEyhoypmYV7xzQZ4K0eG3i
	dr9gGGW
X-Google-Smtp-Source: AGHT+IEV7zy43O/Np4Z9/aTexwXPJ1/uRcg5JI0lSsS47oDgvuQEdTNl3nMd68GPurpe5TOtKUqF4jem8irL/bIe12E=
X-Received: by 2002:a05:6902:610f:b0:e90:6a88:ea9e with SMTP id
 3f1490d57ef6-e94e62a62d7mr3533330276.24.1755612174729; Tue, 19 Aug 2025
 07:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810030006.9060-1-kreed@kreed.org> <87349yxrhm.wl-tiwai@suse.de>
In-Reply-To: <87349yxrhm.wl-tiwai@suse.de>
From: Daniel Schaefer <dhs@frame.work>
Date: Tue, 19 Aug 2025 22:02:17 +0800
X-Gm-Features: Ac12FXzLKI8uBvmhqo33pdSyp-sc6_0_qPMtzvKMwLl1MpGSaX-7PeQbd_DLCVY
Message-ID: <CAAjcXz7mdgPJ_OVXz349D5Ahp6Q6yYs7P7zNwaecHTWzHHSQzQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add Framework Laptop 13 (AMD Ryzen AI
 300) to quirks
To: Christopher Eby <kreed@kreed.org>
Cc: linux-sound@vger.kernel.org, linux@frame.work, 
	Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

I tried this a while ago but it didn't help - it doesn't enable the
headset jack microphone on this platform.
What does this do for you?

Thanks,
Daniel

On Mon, Aug 11, 2025 at 3:11=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 10 Aug 2025 05:00:06 +0200,
> Christopher Eby wrote:
> >
> > Framework Laptop 13 (AMD Ryzen AI 300) requires the same quirk for head=
set detection as other Framework 13 models.
> >
> > Signed-off-by: Christopher Eby <kreed@kreed.org>
>
> Thanks, applied now.
>
>
> Takashi
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux+unsubscribe@frame.work.
> To view this discussion visit https://groups.google.com/a/frame.work/d/ms=
gid/linux/87349yxrhm.wl-tiwai%40suse.de.
