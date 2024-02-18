Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB13229
	for <linux-sound@vger.kernel.org>; Sun, 18 Feb 2024 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708242873; cv=none; b=GwUV2GIEzkg9hrHqQ2x282quuI/kV5/f7zSmO5zyX4u23VYrvxD5zO0i71GHWzD7l2Vpvnl+pBGNQeXiO+ttfyM/eaRbtQhxxa0DdDm/BRfj6GjqScFFE+qiBkjQvTwDHzyZq4hVygDKNJnU2Ep/nqt4wHbMQXTE++lOsQMMUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708242873; c=relaxed/simple;
	bh=4cOP/oBQEEDik3LAt/EfJ4cRr19Eors6IRjnRmL/xOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHQNtk68RNjilFskj6LGyVD/qwvceaQTzdu3oz6XeVoAFR47zUa6bQuGK7ZoLiVodbCXDUf711Jk2Glf2G2BS+4eeUQzrjxycguyO5aJFR25oxW9jYneJcqb6VoBCo7NhPC/B2QxpNT0mEyuwXNKTI1c4sAp8mCAr3rHQw/wpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWzFXJ6e; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWzFXJ6e"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d2e15193bbso1838602241.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Feb 2024 23:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708242869; x=1708847669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ2L9fNJYKMBNrnXV18Ja+6CS5sjhRFPehfcYBs4xrQ=;
        b=eWzFXJ6eqjPn+kg8Ls5kXsv65z6BtcN+mXyUDDuwnKtP4BWvodRS43MXElATd+0fgZ
         GupRXfEOYThtIL3OeuuDB6UqHC7dadd0FNpYU1gZd0YlV4+ZoTEKvXpJ3tVbujJ9f7/d
         z03tyL6r1mLhXoSYGYXelHVHwTUP8Wy68xcJNw1pwFqggD0mtnc5fhseNxud0pPIOp8h
         D//v6rQCxkGwUrD5hv83fe3vSE8YUUCjO5jtrxL09lfQ0RcFe38zN+oec1QRVOHmqd04
         glj+yng89YRblcDHBq3XCHhNMr8v/1w4I185xhrD4Yh8ktA4yflYG76QHgO5w8Ahgzo0
         jI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708242869; x=1708847669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ2L9fNJYKMBNrnXV18Ja+6CS5sjhRFPehfcYBs4xrQ=;
        b=iAiU8p4LC0aqeJxZidqnN9YQ9nV/SqwA9ik0I9RSkzgSaNaVIAkRjeGXneGJ2jN0cE
         Bim20m5TtpeacxQcpdX/re2QLipj0YukOE6NdGA9O6+afWk79VnRy1tlM1SduRaaFDTw
         dVI4LHJJNBW8OrqPcmoWaItNxkskWjDUxbac4qqyY4UnhplSDEsWTY6ZCOAqX7yrkz2D
         gOuIelgzZXbtcT5UjuXPFhjj9TLTqsxER+rYcSJdoehOr3VzHxhDSEHLxFv9gxqn/cVJ
         9UkS6zctpkmvipdhCeAHhipd+Y6mQ0c4kdDDzi8tJt8KwQjZT8yayQWrGWOW42HPjZG1
         nX5w==
X-Forwarded-Encrypted: i=1; AJvYcCW5LAMl7teQcMVENHDodhIQiIes6GoDwgS/WzJvLozIBl6vBxMQtF45HRGiZ1hSY+pMRiCMUZaVH07FbN7F65kAq9U/srnvpLFZT5w=
X-Gm-Message-State: AOJu0YxAuCEVt+m63/jdN8SJAV8AgSxdHMsscfoYl7NCGAVJjv2cCBcE
	DvKjdxylRLUA0kuFs6b0k1Kt7RBDhr8Umx3j0ud81yHHYcU9n7h0/h3KdPLYCtctoMM1F8tKvVa
	WnQszrzxksvNIlKecEXbUOgoxq9x/YWxuXmUUJA==
X-Google-Smtp-Source: AGHT+IE/Xcw/KWaPa1CbbhJ5cctVq226IFNKyz1IX3FmhL9zHqK32U4B2rS1QE4Sc0pJXJoeKyE2lsx2ITjjvfIL3Fk=
X-Received: by 2002:a67:be06:0:b0:470:3a99:f3c with SMTP id
 x6-20020a67be06000000b004703a990f3cmr2392342vsq.23.1708242869395; Sat, 17 Feb
 2024 23:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217104311.3749655-1-arnd@kernel.org>
In-Reply-To: <20240217104311.3749655-1-arnd@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 18 Feb 2024 13:24:18 +0530
Message-ID: <CA+G9fYt6riy6as7sS=T6iDxvo-pA2JT+N6SVbg8TWx4tOY8u5w@mail.gmail.com>
Subject: Re: [PATCH] [v2] ALSA: core: fix buffer overflow in test_format_fill_silence()
To: Arnd Bergmann <arnd@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 16:13, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> KASAN caught a buffer overflow with the hardcoded 2048 byte buffer
> size, when 2080 bytes are written to it:
>
>  BUG: KASAN: slab-out-of-bounds in snd_pcm_format_set_silence+0x3bc/0x3e4
>  Write of size 8 at addr ffff0000c8149800 by task kunit_try_catch/1297
>
>  CPU: 0 PID: 1297 Comm: kunit_try_catch Tainted: G N 6.8.0-rc4-next-20240216 #1
>  Hardware name: linux,dummy-virt (DT)
>  Call trace:
>   kasan_report+0x78/0xc0
>   __asan_report_store_n_noabort+0x1c/0x28
>   snd_pcm_format_set_silence+0x3bc/0x3e4
>   _test_fill_silence+0xdc/0x298
>   test_format_fill_silence+0x110/0x228
>   kunit_try_run_case+0x144/0x3bc
>   kunit_generic_run_threadfn_adapter+0x50/0x94
>   kthread+0x330/0x3e8
>   ret_from_fork+0x10/0x20
>
>  Allocated by task 1297:
>   __kmalloc+0x17c/0x2f0
>   kunit_kmalloc_array+0x2c/0x78
>   test_format_fill_silence+0xcc/0x228
>   kunit_try_run_case+0x144/0x3bc
>   kunit_generic_run_threadfn_adapter+0x50/0x94
>   kthread+0x330/0x3e8
>   ret_from_fork+0x10/0x20
>
> Replace the incorrect size with the correct length of 260 64-bit samples.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Suggested-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> ---
> v2: use a named constant as suggested by Ivan Orlov
> ---
>  sound/core/sound_kunit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
> index 5d5a7bf88de4..4212c4a20697 100644
> --- a/sound/core/sound_kunit.c
> +++ b/sound/core/sound_kunit.c
> @@ -8,7 +8,8 @@
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>
> -#define SILENCE_BUFFER_SIZE 2048
> +#define SILENCE_BUFFER_MAX_FRAMES 260
> +#define SILENCE_BUFFER_SIZE (sizeof(u64) * SILENCE_BUFFER_MAX_FRAMES)
>  #define SILENCE(...) { __VA_ARGS__ }
>  #define DEFINE_FORMAT(fmt, pbits, wd, endianness, signd, silence_arr) {                \
>         .format = SNDRV_PCM_FORMAT_##fmt, .physical_bits = pbits,               \
> @@ -165,7 +166,7 @@ static void _test_fill_silence(struct kunit *test, struct snd_format_test_data *
>
>  static void test_format_fill_silence(struct kunit *test)
>  {
> -       u32 buf_samples[] = { 10, 20, 32, 64, 129, 260 };
> +       u32 buf_samples[] = { 10, 20, 32, 64, 129, SILENCE_BUFFER_MAX_FRAMES };
>         u8 *buffer;
>         u32 i, j;
>
> --
> 2.39.2
>


--
Linaro LKFT
https://lkft.linaro.org
