Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440B3D9029
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494407; cv=pass; b=X2pPtDGGV7FAZ7CNcLFPWZ7PUYy+qkN2cKhtRFKczLiAb5KnjxuOtoWkfLvZ454DPonO9rA4Ef687jtzpx1KI5d0IETYedEdf/6E+lewCim3QJvRWAaxVKLdPFsu8/crxewcTScIQMgFnh47h3z+CLNo1HROmbzWiYN/MMUDuo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494407; c=relaxed/simple;
	bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEW1h95dZEQO6HgKk54NbHGRTtASp8aLvE6utsl91QD/8JKq1n4HTZRPzW8xHyiAPDN+67med6ZBD0cOKecclZ4fUg+6RwMo8u98e6/6vbI8F55B4M63TssBT8Ezcae6DGIeWZWPn70fYD3vUT2q98pt5lK6hEM2EiM26P2cE3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otXpgKlV; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otXpgKlV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b5e18f0439so507048e87.2
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 21:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788494403; cv=none;
        d=google.com; s=arc-20260327;
        b=WqUOSJ1oUDsL7+sj32QEeHvZYUpDjzEL+1dgDWcifCpudPLOPFrEw6682TYkmZ5SqQ
         9JigIkyOl9MQOUd5DOPwbYvYMQQBzSOs3YfjYG+7GrGBhmjSxI2N2C0pVKPMZVVMnDVs
         kM0W5CtC02jvxnEOt5IGbChA3UTLeAVd7gSQb+cg/UlhvWrYjWoi4h7BoBC0I+p0qAu0
         KwryYUdrSrsMJU08dvB0vhUQ9XBbbhf4Ul2bPz4ovV/Pcw0aatYU5+XCWl47A0ZWEIGG
         QT2ohXXoWqU/ulqrE+xmRee8Q8DLJQWIu4iCGIqJmyVvcpLGbjDYrd7d9eaADj/loBCk
         ljRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        fh=utNX0hiTpiEaFo2oLAZCO9Its0O9+5XmT4isizlrDDM=;
        b=QLsnpX+x2N8xXd2FXalGQV2Co6SSeXJuNjqhpLysplp9RiJyOAVE30gB+0aL0JJIfF
         VcQDUD2peXmC1uecfCPO+WFsQJsiNrgRlFE9EaxFVufHFd299h90XBgVWBvXTt64nlb1
         Q5uubj7sz2ZG8m8njd5ijzfjVmmRVNshG9biVT0ece98x7goyRzipMH/HQd+73VUIGfu
         wrv/wd8V7uUjFk6sXwBLN2N+a4Dkv105oMDbntI3aVqsGrbW3KUL0tEz22uwIPmPTckt
         dGKNJHNBsA2Rape3fKSRD/2ObJPQmSVObL8yMZvz9fBSWRtkymnznHKUEaFZKoHEt68O
         zcCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788494403; x=1789099203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        b=otXpgKlVkymNQc925O1lD/lsKCMQ+FWBz9CFHD0VTHjgDbLyQEWVXAghm307p6P04P
         NVivmGGl+WMVPi82Top7UgE/+vGO1D/g+0pOPaUhKO+B4X+uXqM093dch+MsSPEv+OJk
         8lnaES4xxXUg5Ambwe4DL5kE4epjp235y+Efhwi1v2XOao0vpQCqg8HBXH4qRMBIMERF
         qP10YttU0abyXXh9VcUvqykKL90r5rNsbWmRfUzWQ+lJgbW8UuH7+Bq1tqNikgGWvBQY
         8AUmBwwXZuWyHn7HrkHZbK4rISeRPEv76jOfOp3VCvQ2pQ3dU/1agJuC7Vs/WaZLPpH3
         +PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788494403; x=1789099203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        b=c13bvyMOyYRazDjYNax7MZxrT4cjv4ffGSbkSCsvFK6NKm/KlqXWdMd5EXnd4w1B2h
         lQBffVXhtR67+8bEkcumG0tAIAql6yKHKnCoB+t5TzoOvWxbps0vsh1BCLw6Zl8MMAU8
         9GqmzlhBeO9U4cGcdStw2W8W7i9BkXCUCL3kDX6f1khGrCK3SK+psQ9+dKwn4trcsyaA
         5sN0ajxrBtmZ/5CJYUCow1L6xkLZXjPu2zPAZBpWZMLfV1g+0TmRkJ1tmuY7zZqe/6Xi
         UQSN6uBGG6jALH0SZLrlT7svATC/xJGPUcbYsq/JHj43QC/LmaNW1ZeI9JFOzZgwN3Pd
         HDWA==
X-Forwarded-Encrypted: i=1; AKwUvBxwUn/8l+P4OV6/Hgm9iBmHdXLlWAPTh5R5/FWAy3/uzbCcJ2c6rFYdLkIt21RmdtPl2j34CRQGEtGczw==@vger.kernel.org
X-Gm-Message-State: AFuF++kOeQyR2d0WUqM1FWHsxd3CBM8A4NUDUqVB3yHhB5u44oZyMojd
	zZIixVpdSXWgqDB+AY27+AFzabIdgDPjBg6BGTo5abXap8U8Cm9N3mPpBFpd4m59yn9PPWA+HoW
	6kcdFmJ9Jr3gwtB3T7je0UVWO7iqok7UgETihLdY=
X-Gm-Gg: AYBFou0CdlW5Za/Wz0RbnqavVonYU2sRkZvsa62r2NznBBmomKXCJQB3LD0gZmVYBFp
	Aop73cqnQ5C6zSGNLn3vLD5UbV6kuwqf/C0+DslSDfD6EtX0YmwenxIcW8mST5aUVEXMbris/2B
	8gWfey+n43MW/QZx+glMHJw8rlZbWMvrx9uD389E2TDcBKp5HwztHpSPsxIWx0RgKycXhgamvF9
	Gc2XlxCq3BOU7/UGeai4lEC4Br47MHbhjutuosxVfp9T/B8CNjIOTP1WaA8enb2pwDCNEv5BXzk
	4l9EkjLrO7sFSNFA7Qb7KfwJSiEoaaD0rZmxQ33FUmhUcKGJt2IRLXiRnA==
X-Received: by 2002:a05:6512:3406:b0:5b6:183b:d216 with SMTP id
 2adb3069b0e04-5b6183bd400mr238592e87.61.1788494403087; Thu, 03 Sep 2026
 21:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903231641.18536-1-hhkieu@gmail.com>
In-Reply-To: <20260903231641.18536-1-hhkieu@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 4 Sep 2026 00:59:51 -0300
X-Gm-Features: AcwNN1X0uovzUyaqwk661Z8ri8kFZYFzajo-PGzk-Nkz45p8WS6ROgDm4XS2Pus
Message-ID: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Thu, Sep 3, 2026 at 8:18=E2=80=AFPM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> The Pioneer DJ DDJ-SZ exposes its audio interface as USB vendor-specific
> class (0xFF) rather than USB Audio Class, so it needs a quirks-table
> entry like its sibling Pioneer devices (DJM-750, DJM-850, DJM-900NXS2,
> DJM-450, DJM-V10) already have.
>
> The device presents 10 channels of S24_3LE audio in both directions,
> fixed at 44.1kHz, on interface 0 altsetting 1: playback on endpoint
> 0x01, capture on endpoint 0x82. The unit contains its own analog mixer,
> and each playback channel pair feeds one of its physical channel strips:
> 0/1, 2/3, 4/5 and 6/7 feed strips 1-4 respectively, and 8/9 feed the
> booth output. The master output is produced in analog by that mixer and
> is not carried over USB at all. On the capture side, channels 8/9 are
> the mic input; capture channels 0-7 are not yet mapped to specific
> physical inputs.
>
> Implicit feedback needs no quirk flag here: is_pioneer_implicit_fb() in
> implicit.c already covers vendor 0x08e4 with a vendor-spec class
> interface and two endpoints, and the driver duly reports endpoint 0x82
> as the playback sync endpoint.

Are you sure is_pioneer_implicit_fb() isn't returning false and you're
picking up on a generic sync ep instead?

You should double-check that function is returning true or false because it
will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
set on bmAttributes of a Isochronous IN EP.

Thanks,
Geraldo Nascimento
