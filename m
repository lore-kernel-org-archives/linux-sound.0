Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F31E4A6
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013598; cv=none; b=GmQt7A8qBStXsTOcRegXvs/iLYGjKVu/L1n4wpdmclmb0TjAkH0Mmkd/ac+3hpxGt8CDLVu8Kzv1N3zakWSTS60KA2uZb+D+hZ0rB6F67zBi5zYF9gp1m+gBopqEEGfFVnAzkf8W9wNBnopfAv2b0RgS1iIRUZULykq3Hmx8yy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013598; c=relaxed/simple;
	bh=Avjc5JEKY4BtFG45Sfhy5z4Vhuv0aBII8xkoLLTxJP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9fg+WQerk5xJVM7ts0IpGWLMnZuGSfHTGBVig/4aoJjwTRCEVzXD7SaZMY7+RjJ9kG0EhRVFP6LshAgnRQKKenZNBs2lrFr6p34ZQCry4u75fIzh0nq+vtKkhSEKJ5cbPNyjyV+JmBod39109kx5mkeJ/V9WjJKRceupKow3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mQkUyM9Y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQkUyM9Y"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so1478133b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 May 2024 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715013597; x=1715618397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Avjc5JEKY4BtFG45Sfhy5z4Vhuv0aBII8xkoLLTxJP4=;
        b=mQkUyM9Y8YVs/1b7/hXYxUMLS/jFJT4X0X7XwYbObB29PpkoZgr54EX6H5wfHS8Nbd
         R6zc4siBPpOlmFSUm8U8g3vEZFfp6n14sExTG+4IUD80nh/40o0Us3Hcl4fHKlbVRWEB
         FRsaxeu2GB8EL8yAiUUqjyrBOBeWCqgeG6ZlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715013597; x=1715618397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Avjc5JEKY4BtFG45Sfhy5z4Vhuv0aBII8xkoLLTxJP4=;
        b=dmHcEtCzo0XpqlsuZFk/ayWFWOAakSdhZxPLFqY2qz4eBdyJYRmF+7iGR3oWHDV0Sg
         VxmbtR5X+PhZJgKJS9Dsx2MR4flbUhNRgQq+1SoQQXevogKxoupAWgOuZ2QqqmKDYsg/
         p2npjyFpWHCza/vhCZ7Y24PXlFHaLO/C/qmmoalwiPRQH0mcC8B/9MgbE2e3qdYxSgVF
         dukEyAcpMLgK1RJTTCZQijYEMNmiwuc9Bj5EeQPnODmvmc5h7iztK343OJNUl5PsfELC
         Vdh3YHO0HYRvziUi5tldhh4dsCJY6ymuOR6SaYV9Aah7h3dyu/2N+WgquJfyu8c6X4o3
         dTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV8GmoomOEwOkrZA+DxcAxLi3xpc/AnHFaVGnWZkQmt7P/1GYTagIwB6pOUbSEKzzepTd1gDc3y58LHWG9xLnxrWfmpSmDU1AlFIs=
X-Gm-Message-State: AOJu0Yy1X9zEjSNxBQ3RtaIteIaY/JVp9Q7AgYPGtDqldP0DgLiSvPIg
	jr7NlSCiWfMgvtbIl6YBKSmIQ2xRZWr5njwXOcSIdEj7dyOhNq7N2vDsPRKWDeebnhWyuF1gdC6
	xG0pNtIoBceWBEW8Wi4SF3HKJk7yt7pmrGlKCTZddpmZVxPI=
X-Google-Smtp-Source: AGHT+IFtiZzUbdyJ7EHE9NaQYgST4cKZ8ciaJgk+hpp60dVzju5sNO9t8ZOCNbclU/AMAZqCL+aHIjcP+r96qaWsJVo=
X-Received: by 2002:a05:6a20:d49a:b0:1af:88ab:e86a with SMTP id
 im26-20020a056a20d49a00b001af88abe86amr8476635pzb.40.1715013596588; Mon, 06
 May 2024 09:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430212838.1.I77b0636d5df17c275042fd66cfa028de8ad43532@changeid>
 <83e218f9-29f5-4f35-bd0c-b298e3bb9e8c@linux.intel.com>
In-Reply-To: <83e218f9-29f5-4f35-bd0c-b298e3bb9e8c@linux.intel.com>
From: Allen Ballway <ballway@chromium.org>
Date: Mon, 6 May 2024 09:39:45 -0700
Message-ID: <CAEs41JC-vJaMHj6fzmNO=-bu5oURRA-u565sN2=yzBeVtKb=4g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Fix Azulle Access 4 quirk detection
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Brady Norander <bradynorander@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Mark Hasemeyer <markhas@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 2:46=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 4/30/24 16:28, Allen Ballway wrote:
> > This device has an audio card which is quirked for force SOF use but th=
e
> > device does not support SOF so the card is not usable and audio can't
> > play through the HDMI output.
> >
> > Add another quirk detection that matches the Azulle Access 4 in the DMI
> > info.
>
> Please try the patch "ALSA: hda: intel-dsp-config: harden I2C/I2S codec
> detection" shared last week.
>
> https://lore.kernel.org/linux-sound/20240426152818.38443-1-pierre-louis.b=
ossart@linux.intel.com/
>
> I really don't want to maintain a long list of ES8336 false detections
> due to broken ACPI tables.
>
> Thanks!

Unfortunately the above patch didn't fix the issue, nor did I see any
of the change logs in dmesg.
Are there other alternative solutions or information I could gather to
make a more general solution?

Thanks,
Allen
