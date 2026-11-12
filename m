Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524372;
	b=FH+OsSbxZxIvkRqvsmiljmzCmPcnliLF3mEsw3jrGHbbA7oI7LqX3lTA+QRJi9yAT/iB
	 Eqg2IgBS9UBj8cSjcDwIG9AHr7OZcJ92fawcwf+ypwWvmMrzjPGglczSt24vyQt3uLzJi
	 +U79FxiifFl53MTGTp/45IwknZSXSRsMJdK1EL+nvP23KsXEAScVLsrKSC2Lg1qG+vWnN
	 q80tFGyw5IjYm2Dz2ESs0hQ9me8bpO9Mlrz7R9kDMauGUNTKlxzwYMiN0E8iJ87wNp4j8
	 tNpmyW4GPM0bZmzq6iYw2S4/OYZL6R8i6oHz517BwHjDAxvVJbalABh8PjtCZypu7jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
	b=WCScM0X0LvXuGmWQaKj0rbQyjpfORtAPzwhtTVtw6jS70vJzAtBsrKgSTCjRC7KnFntP
	 vaThZ8N6+0lOYRz63VFwKbHViA1ewfAu8qrAtEyYX6+sc6WClePFkRm3dQhpc64Vl6+hv
	 AQdf0ZT5td63uOloqo854EsZtJZOWcCg8h2hUdXuA64U8jS0O83rI9UsbmsgUZdSTaV0A
	 W4Z5wJ0+gCpJFZN6iaa4Q20g1yvETOHImkf5vwLVY2+C85p0SwQAul15Zod8si7RAequr
	 7fVtDZHak+x0DVePZiov51QuK++1cNZJQxQBWBnFT3Or59lNy3/x5EIA4oUoS3CCbjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DTd3rU4s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BF606D594
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 22:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0BF606D594
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DTd3rU4s
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c0bd676eeso288325d50.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 14:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524371; cv=none;
        d=google.com; s=arc-20260327;
        b=Fn1QXXCZiKu/K/G9yRx7vWakQA1WHOux13BPDL2XqVLPjHgxRyzYXWp6HdxoEHTwW+
         lF3W99qtQ/mspEM9q0+tSSiDemmlIZcdHiq5+x81sxl3oZq3Tmvw7a8nUOjkiMv3/GXc
         jR7E2LlNMG7IPxvT8W/Sxrq1r/gu6RZW1IKU2fXjZRm/guJHwGLmDRoOXE3ytCSaS9M+
         C4EtNztp61OuDY+pUWGxR9bgn9UhToH5in0K0ko7zgDm+u1uNBiT5X5Ik5OwZG17CX7Q
         W3V2+/5ZSnHNGoVqaoe3EceugbdryI67izWDW1h5SgQooDplsKwRwFm0zsAwf8rGCVW1
         GtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        fh=/oP4OgCh4cJ9ZJK9usCokhPZKAk3Q3a/ktGzoYSYT+g=;
        b=RCMATjtlq2NDNeuO00xBITXBNI9+Fv1bgfOxOoK0jStSXXHXPZaVaGJM2PD57i15N/
         LwmoRthhWj5zvM7SnrY631xGYGQuFCRWngkaMhoOSbSRx7Wt6PnU+G+WCeC3MtqVXN6L
         T8NgVrXS1tjLOS9RDWjvg/461ddDYN9y04jB9epq/cX3UgX1+sP48LioIsTf9IzfhJoE
         2b1/ougdnDMjhEKyaEkQdLfCWa9x/ilCPvS8bpwc27uVsMd7nOYQVqONbfJaz07lfv4C
         6cEW4PvRJIp+EQpdgaqbBftRpKA9V+ZJsvrmSM3VcXjqe5zpWPLoBY+pAFqtS3liR86S
         1oRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524371; x=1795129171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=DTd3rU4s5R6vEnmm1kWd4icC5YWmEubPkPw6tcqK5VA+6jF/jAlmtSdVBgXx5VeMlp
         Uwng6NAltw4+Tb1pWu/POb6MPpQq3YfzQJ54AS89PNJ6I7PSOJkANgiHlY/I78UxCspn
         vasN//cHgbqd2u7GLqjePJlMcefE5X7YLTw4W219h62l9Kj+TCqUXvuFCLv5DPk7yMuB
         HtDMpLGpO2qFk2WmAL+y6K0SqSoX6MopEO8ttJjMHDfbYLCJv8oRgNuCgnA10HvAn8K4
         Bu1B2/2AEmGzmKJVBiozBjhB9kea0JMGPn82g2jrponWHdaziIopGdd20AKYJTqt3BVZ
         kV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524371; x=1795129171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=rPLmdmPr8WZitRS50K2ug/n+7TQK2rNZWa3aIdmRxTKNi+CAW4zSijqs1F8yl1pUYY
         ggiOdXe6sk6yKK1ffWnTnXgb8kKFd+497f5qV0Qz0NDxDOEFLyAiCAaKNVmzKGysHEeZ
         0ntdD46UdIKfsa+vXDD0e0N1etuSLTXExHqmDpFgLyQF8Q2Wew+t75fzR6E6dScXATCl
         qQvcbomMrwIyN83dWDNZx8FwowJVmCEz82BiWud5PEWwZG+CklSSks0gj1VIAOU9eFTy
         GeR25J1dsNCWYbh1OAMQh1K28SCjNqiKYa1uQWCVEQ9tKNal9Gz/3L6fUNLqSFnMMU2A
         9GBw==
X-Forwarded-Encrypted: i=1; AL+hErH2+rs1BGAtBUyuP+PjUFGGF9jDT5xmz83W82rxU3fvqa0ZPnUzaGDgg8uSQ8bwYiTnELt4/D/Y3czZmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HMbVpmAI9Uhywmk2ape/fu8ViWSAZr8z/qSdcWYbZ+qNacIZs
	eEYVVR2lNapD5/hxXzL3fFFH4b/2QWMz/pIuUuS3pNRXhDtFZ5ck9Heq/Dcal6sOZwnNkpiFSZV
	QESsRxk0CS9BjinjYjcrwOzrn1VvaA4A=
X-Gm-Gg: AYBFou2ivty0YX0h+KHS+JLWVDvj+OHKDSS0lKC4uPkqV8OhKt6lum9FYPBSTgUuoKp
	4xyb2TP6B7nxb2XObXmS3MOw9IUl7NKqyA4EFseVqg2iNlEWyBeyF+RYjgsQ2azCbW4ToQp4kRX
	dGTVVVFj33OSQECeZi88pONq0iMsMNovSMLAaWF/1rXo3huC59KarbXeN0BdGimcfty+iANJjXl
	v+8yD3oRQFXJ4BBI7RioMrjmO/wffcVPcGA4gPHf28DWvwcWH8efDjcO25lDRtoi3NKUKfFJIDh
	boMmZXlTYoiUZaKQMmGb/wwngN6GfBpELuh8B8q4CAaj4w7dGkg2uQb4BtabdCKMHhINpyyNXqB
	dL6RSMhg2R+f3nJyChPX7zPropOHDaPKtYtrjiDhXvIrZLvbSCQ7OnuUjXMOZDlxo77QDyVBT9u
	ISQVtdFOOA+pxZEkM=
X-Received: by 2002:a05:690e:d83:b0:67b:f64e:b323 with SMTP id
 956f58d0204a3-67d897f316emr491608d50.87.1794524371234; Thu, 12 Nov 2026
 14:59:31 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Nov 2026 23:59:20 +0100
X-Gm-Features: AclHuK86E7RwyUwDuKN1XBLuFvJlmfcg53qNUpHMBnQ5zRn_8wYfmQuNj2Yj5C0
Message-ID: <CAFBinCCdqpb-d4wEThYCLLEa89eqUNycxn7BYHMq9a6nTVPL=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Currently a mutex is being used in 'struct gx_stream' to serialize
> access to structure data. This was inherited from the AXG design. An
> important difference though is that in axg-card dai_links are nonatomic
> so callback functions like 'trigger' are allowed to sleep. In GX instead
> dai_links are atomic.
>
> For example, starting playback from userspace with
> 'CONFIG_DEBUG_ATOMIC_SLEEP=3Dy' results in a warning message like:
>
> [ ] BUG: sleeping function called from invalid context at kernel/locking/=
mutex.c:316
> [ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: spe=
aker-test
> [ ] preempt_count: 1, expected: 0
>
> due to the following call stack:
>
> snd_pcm_do_start (called with spinlock taken)
>   dpcm_fe_dai_trigger
>     dpcm_fe_dai_do_trigger
>       dpcm_dai_trigger_fe_be
>         dpcm_be_dai_trigger
>           soc_pcm_trigger
>             snd_soc_pcm_dai_trigger
>               soc_dai_trigger
>                 aiu_encoder_i2s_trigger
>                   gx_stream_start (takes 'ts->lock')
>
> Fix this by changing the lock type from mutex to spinlock. This is safe
> on GX platform because all formatters' functions only perform MMIO regmap
> calls that do not sleep.
>
> 'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
> trigger runs with IRQs already disabled and stop can also run in IRQ
> context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
> 'spin_lock_irq' is instead used in 'gx_formatter_attach'/
> 'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
> end up calling 'gx_stream_stop' and therefore deadlock.
>
> While at this also improve 'gx_formatter_detach()' by moving
> 'gx_formatter_disable()' under the spinlock guard. This makes it symmetri=
c
> to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
> formatter callbacks are called with spinlock held.
>
> Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface"=
)
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
