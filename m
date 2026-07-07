Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56B227EB9
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411576; cv=pass; b=IF4EYoX0Sbo/P8bLSfS+5xCjiUho0YonDMfJQekrm3q8XoZCei1bppd90r/ZiooQIPwWe+ivnhlNrjw0sqCn+8zoO/y2ZNrgtPmkk3I4CVU+Qk8+2ZSTFqZ9p1PAUFAIftoDfwOQOuESOtoqaP9oL9O/b5IRAQ8KM4anMQScv38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411576; c=relaxed/simple;
	bh=7IwkNskJca1I9seQIX+TbY1H2q3x1M+GmzR91R5C+3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUQp/SA/2ensqB4Zmw3SqK1uykhojZhl7tdjtoaXs7ZRc3xIaLQTmFdrwDUC0w7H5/+7TZ93sFT8bkRVmaoGfCasYJ0F38KZbhzVFf5irzW257ZUt0t+F1KdeVLqgAwsRitvZzFc/RsR7kIW8rE+HGkEMU7QkL0sdAdQuvCVAA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgr2hzA2; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgr2hzA2"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2266746a91.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783411575; cv=none;
        d=google.com; s=arc-20260327;
        b=WWrsbZqW+mee+ACf9WsPUpOgQVlBP4Umc2HIx48cIoMlCyAXpNfvpXLI3PImgxOC5C
         NOEB1aopt/+6joe7oXYCzIx2kK/8wJKmva8XNbc7qE8SBRTCa69DrgiWGsAkrq0npVgA
         vqisBiwKpUG8fuK3RDX4sx/zsif9nGmpmwQQ+w1rgicGrGgwL7wqRyCkyhjKvlz8qvt5
         AUI0lugQiPTiEk2FuMfhgQF/d16yHYGXrFo6alYzjRfjpURzNn3Ph/RmsEhXdsdCY1aF
         xBpe0aV4RJEY3hfXazOSohc9YfDhesCGeMlZiCVvKb85cIk2TaixI3wSGcZF9v3el8Id
         O90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ejK2VuDU8oF2SdYlVeASEpmI9VMUuPAk8gB2enAK7Rk=;
        fh=l6Bt2qqq2exJG97mbuYmj26pQxNHUjG3/FoRB9GAljE=;
        b=sNLXBv456MGBxUI/bgcT+vdWi02+3wB2UWqxS56sqgdiIZgoKfG8GOQu0ZnaCmFl+Y
         wMZQGPqDAKGZRXX3P80nHX0vVSitTy7ZIaGc423Hf08bmIFqH6LNEzdyO1pYsvHC/VUh
         idnV+6md8rkASQ24kdQn3OojYHCCzLIOVY8Te98wO4cGKZnCPFpCv4W+f8bZgV/Ky3f6
         plcZVn/YHKrCSJFBfSpXoL7GFOfM4o8AiTOh98jWj43BVqtlSt8MUWhxsXs6nTZ4P+ng
         SzG2ekrZmypyzhWmND8c/wHzdNT2k89Uwv9YUgyQ6gV/mj6z8gANZtA7nYu8K52SvwRS
         6LeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783411575; x=1784016375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejK2VuDU8oF2SdYlVeASEpmI9VMUuPAk8gB2enAK7Rk=;
        b=Lgr2hzA2J7uuhr3atMKHQwYxa/dvnU8m0jFkb2RpYI684ErCzdYEiHctF6QIqPvobj
         kQ3c/IaJJbhn6V6frHx7qUceu6zUnZFX7Rhw2zbJaQEoChK9l39vAq9Bgfr4+K7x/V5u
         5IKbcxPW2itIJCVEbpxbFiWbMC83ph5+wyR/XHg3U2U4qMpi/5LPyq7bQVg4ki1rDC6D
         isHQ5nYjqiQmR0ukSa7yp13k/zSLK0xWAkXE5WtTrKXakw0N2QHWROaP+87MtV3SI5Bk
         YBSUXbD2RFiRd9DA95BrNkC4jmq8rZorYIPREGS/BHm8Foa4S30dqVu5xUXUjVTFkh+F
         fsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411575; x=1784016375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejK2VuDU8oF2SdYlVeASEpmI9VMUuPAk8gB2enAK7Rk=;
        b=hzkjdUl3vgsjklRGVWrZSChDC+hYN70c1rFhyuDDjGFRdS4kW6OajLeUwUdj8Fdiy3
         Sy05o3TAAIR4iqA6ejgmZK5fJLF/YOanxpgpczAiZ2NsgsiXcKWY6i3w7hZH/baaSGDR
         PJyMwgx/PmHLZos8ebzuVt44Ws84S0OGtlkPGkd7hDvyPiAPPrSBJmUoTZsCXgcoDO+R
         cm2giDc4A+QE/sgF1eHoLAiAOG4J6QYm7lDocopnnc49LRpqiZewTTp/Dr2pZ0268wEL
         JoXw2SzTxAzIBjkntLuGwfSnM3B8D7hFaJIu2AtB8McNDdTEW6xPzIkhUUuz2NeWp1+Y
         mPJA==
X-Forwarded-Encrypted: i=1; AHgh+RpgdfJ1l4LYU+KmnEN9ppcWUNOUtz7TF4yjiOg+qH83uTXwbZpucTlEDKyU0qmgxEJZNlrHCo2wgyXe0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcQy73YXq2iX2kdwVh3ksWylV1vwluOZNuNOTegCOvfFkZGls
	UkvZ290b0wOke25MjjT0UqffMjc1B/japPultrUoWJZ7ch6qehGh0rfxBHzNRyHd2CMPvzfLWVX
	WaKTj4l9ueqxH8P4j+NCvP2LlzMIRVkM=
X-Gm-Gg: AfdE7cm4Jtl2kJYsmIuilAwGRO1AHmh44HA8w6rcePYdVlivhe1jWaW882847hn7JHa
	+UpZ35ifkfa0TeL9np6icsRgmDxW/yC6GyHPn8T/8uT477oxVjZe3tHRBcdKaeGPKqRt/oYdA+m
	24f5RCktcp8bdiiKIWbkxDcg7tdx5Z+7t5qeW3sb2114pXDpeQ3B46h2Gm+6Wc8L6ON5lXRZeP2
	f0C/PZz2Fvv1rlInqIirv0TWhar/eJatMgg1WcFjMP2ey1bZ9oAfgk32SnWktgKMQvWOmf1fyDX
	9/IWOKtM8R44uW7ZKjxKAWHwR40=
X-Received: by 2002:a17:90b:1d52:b0:37f:d9dc:557 with SMTP id
 98e67ed59e1d1-38756ce150bmr4813837a91.16.1783411574947; Tue, 07 Jul 2026
 01:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706084950.49331-1-phucduc.bui@gmail.com> <703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
 <CAABR9nH09_u3qNKaN3_epnYXk9rErQ_=Jy7dcn0_mWj+gfb0Kg@mail.gmail.com>
 <83d2a230-71e8-4a24-9dce-363e1b230b54@intel.com> <87jyr88d12.wl-tiwai@suse.de>
In-Reply-To: <87jyr88d12.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 15:06:03 +0700
X-Gm-Features: AVVi8Ccqaxd6wAP35suN9fuLDcyE9970y3ycesxJqkcQDh0LS3li_rgUTQtOtSU
Message-ID: <CAABR9nEB9-1h7n9WJzy-iAjsc3SVvyy6VWWUEdndoOpFB3S5dQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get failure
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
	Dan Carpenter <error27@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, 
	Mehul Rao <mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san, Cezary,

Thanks for checking.

> A quick grep showed the statics like:
>      85 ENODEV
>      41 EINVAL
>      17 EBUSY
>      16 EFAULT
>      14 ENOENT
>      10 EPROBE
>       8 EIO
>       6 ENXIO
>       3 EPROTONOSUPPORT
>       3 EAGAIN
>       3 EACCES
>       2 EXPORT
>       2 EPERM
>       2 ENOLCK
>       1 EPROTO
>       1 EOPNOTSUPP
>       1 ENOSYS
>       1 ENOPROTOOPT
>       1 EAFNOSUPPORT
>
> So -ENODEV looks fine.
>

I'll keep the current -ENODEV return value.
I'll update the commit message and send a v2.

Best regards,
Phuc
