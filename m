Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793952686;
	b=iUC4jr9id80gM1WEPakpgFFtVfHX38kvjzHxy7N2gRwQu8xfhzpP/AuNmTaqWdtpaLwN
	 LfIMkM8IAc9GDJd/nmQXXUlKWxsCu5c5g3udqJwOAsrAPOVyU+15Sds3tvvXeNVJoUnQh
	 WDwcllLji1k0/nuxitQBHAcftF/isvjAqAJn+7pKbqu0hxdFdIvNyoP9nLyOM7lPg5AKa
	 It7IqVL1tWEE9o8G+B/vwkugNRrzNnQOEhhazgKThzy057ZWp/uYttzxb1UL6J4ZEYUId
	 iQdwejuSTpmRYwu7Xpq4MU63L6gsqCNX/6kThYreajCvhiwT3Clmu/60sAZKwDPi5tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mMPTq2rAWnf/kQ6tPnG6zscZhVPtWF/HNtxE6dpXGF8=;
	b=aDPdEDhH8UXJx2D8diwpvBB3flwapeWJE5NeQQ5lWAZNzpEil9Xu2yIDFok3hFtEFsWW
	 gzn5Uy+FBZXtMnbU3/ZCz5KmUufGgNC31zjn84HqCe7yevB9fVQkAF8egOpl9VGIelNf4
	 aYiey/t/OcJmFlaVl4GY6mY9CeUJy3ry/GMk1Blbt8V0qiKiFMKV45R0tV46ywAUSC3SY
	 mSl/Y2vMGl9OCoZUcA8lWobg2oBTHaO+dTLzwwIDFz/hVnVvT9+EmMGWHYxzpaM7gwYl/
	 L/Vd1iszFeRUhyKEL3rV6ESlA1Z6raOX8QG5PqutvuVM/ksAKJg7ZC8SEQUnQn9bRJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk6o1G5d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6D9606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 08:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wk6o1G5d
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso135777b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 00:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952686; cv=none;
        d=google.com; s=arc-20260327;
        b=V9bBmzHnTF0/7bQhWWlzEH+ix1+t47NsKv08FnWA7tE2k/grJu/7VvjqwlZGwdbqhi
         tQRgCeCHw7q2PiTX/ZPUklZ+DyXR8QUQOJQYEFH+JF/qk8lsdPLVBCmy2MwTpKu1MFbc
         Nc2XtEjTkyOf+qunzFbje+8+pIzclXyg5x4K+YhPr7m8F6g/YnByIlPAjqYPExmxlLqF
         yx7Z4m0SqVLgdece1LRBHQs70XFb6kuszfHSyHNNNoaeLRpY0CbtkEowInL9IP1S2b1E
         T+kUIJ8HI1JU085Bwmh3wUlfnVBN8qydUuan4DXlucjZvSj4i6KRkV7Ka8CU6Afkln82
         dhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mMPTq2rAWnf/kQ6tPnG6zscZhVPtWF/HNtxE6dpXGF8=;
        fh=3mI+E67aJ6nBxho9ZwMiPoI/62vxY9QJb95ftw8oQxE=;
        b=aGNkygrpOZJL6XBJmcMEaCWsV2DxTm8+PzECQ3xdH9qNWxukgDfJjGmfiWz1ERofb1
         1nojzajsM1WN8e3Ak0VziFV7GvlkaczRFn4mIztQfoxD2IsKvBC2i2TYGrv3FJ1MNomb
         qfcjVmM4ivrm5FSQHmVVGpgtw+NJLPurUZQ6le1FyTBDkr2TWosYog/ZwqB+e0p3hg/O
         oFrTy9r7mw3e8WpDPxCcp/1pwm6kzDBWDEYYmsQiQgddUwpckt0ad/33wZLdhk3gHkL/
         q+YONWYmCR9aU0FTb4vLQRdFwQ3JJh+3kOpOMcgy2BEHsDfAexXaM6nhrXTFPJ9ZbGaU
         dAGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952686; x=1794557486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMPTq2rAWnf/kQ6tPnG6zscZhVPtWF/HNtxE6dpXGF8=;
        b=wk6o1G5dRqsZGiBykrZvfhVD/3L38wSRCVZPGlXG+W3T/4ceBDfXqBSdl1V6qko5Ro
         WhPwYUGoeeS5R/bX+Zt2lt+URBJmLoEiQP51uxc0CAyYFmcnJx/zcgElf5NW3agqV8V0
         fuDgeRgvlttQ4/JNcBDcJvSnFkHHQj7GUeZBUOXmxEFnv6ajt/E3iNpL2L+0A+yBw7pH
         ZQrN+84PHNfH+b0lMztYOI79Hs10E+W0i+VUGnZhAuTewQ3Mt9FIkqNAoQEq7Eu8F6Br
         JB+aUKS7eNblFSx2qfEARuXi/EgFLkYFFJW8HhN5mPNklu9uy6uN+fR9+9kcG9sG7+pL
         QvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952686; x=1794557486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMPTq2rAWnf/kQ6tPnG6zscZhVPtWF/HNtxE6dpXGF8=;
        b=AYjL1cODIZGuvObkG9AUKP3eazyg+wb3VgVeBNfmkFVudp0kkt/+VaXncZMzq50hpN
         xEdNEB0WUQQpVwDsaZgcO9sAEoxKP4rcVnhsRBgIBiQpHKUks3vA6cJ+I7/RecWiapal
         HAzLpFZoNNr0/w1U25MmSTYNa5AjswayG2PppM3o7hS6OFgM/OfcjJ1mnCgjOBrJxb8C
         OSKrChJi4X7P5AATMtWFxWtT6ef+rMNq9t1oIjKz1/lo8o2wRHTkQVmc9HT9ucgMqecC
         o3seytra6Y6DWVe+wmWc4xqKtkyF2kXbRug3zG/ygW88jWJIleeHZv8VXhyDWaFmhq2U
         2ppA==
X-Forwarded-Encrypted: i=1; AKwUvBwg3YwuV5faGbyZhkf5eV+e7I+FWuiWE8j2WvRHrPDAkAnmgobaYR1LF6VeoepK3pvNMYSe1Yek5pk35A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hzzli6rVrDRMq0rltv29u8lS9UZvkBBcP7tRxagjNe2NwLq7h
	MMPtX09R/2xMggOwlIqpLI9kG6HXnxZ4Q8BIpy1HqUDcWbqHv09YJ779q+tuvliRbBFUIEf73h3
	GJhoapJBRUT8eOd7CY3vvc+VIjE/bxUqYwvTo7hA=
X-Gm-Gg: AYBFou1X4s343sv45uSgoesf4YhRWqBMqLu9zkDP6u3h0mFwUuFn9cHGr0/p9DCx6/V
	ogOP2Ktq84bMX1RAv+sTe6wgP1OWH5gbMP5fcrrr9dbNZ+jMGpqMeTARoXteGbwLqWXpOW11s3l
	6uAVPN4EcucwMmf7E6UFZtb/O/wP7eS9QSJjdUGBLl1LTgjr2nOBwYsVrqj1qu1rABx9sdKLlqd
	cqYfr7hs9ZgwbNPJ+wVTezMhPqKRnki2UDrbInfYWe91t45jgeoegoZ68rvoWWfCuR5XrB1r8QN
	7pEpBVLvV5IY5I4fQKRXWQUD79wbOoJESzgASnrW4zE7+Mm+9/O5sW1VIne0NfVxJOLcH3mUc7Z
	M5hL5HaLOPr+4wKw+BzuPN7t2wR7InfobaTXN
X-Received: by 2002:a05:6a20:9e95:b0:3de:79fe:13f with SMTP id
 adf61e73a8af0-3ebb2a24b32mr1923939637.38.1793952685788; Fri, 06 Nov 2026
 00:11:25 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019222827.131120-1-festevam@gmail.com> <20261019222827.131120-3-festevam@gmail.com>
In-Reply-To: <20261019222827.131120-3-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 16:10:55 +0800
X-Gm-Features: AclHuK9BON26jND-T88AH6CfmTcQHmPG90FZSZ9g1z3qdn6lwu_W9UH4o4MKkfk
Message-ID: <CAA+D8AP0nC15n_VG9izAAC=7-3PoSJzkGW31QsNz9MuSAokVVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: Select sleep pinctrl state during
 runtime suspend
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:29=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> When runtime suspended, the SAI can leave its outputs at their last
> levels. If a connected device is unpowered, those signals can source
> current through its input protection circuitry.
>
> Select the sleep pinctrl state after gating the clocks, and restore the
> default state before enabling them on runtime resume. Devices without
> a sleep state continue to use their existing pin configuration.
>
> The pin-state issue was reproduced on a custom i.MX8MP board.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a135b3da37cf..ad21bd3b8a5d 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1959,6 +1959,7 @@ static int fsl_sai_runtime_suspend(struct device *d=
ev)
>                 cpu_latency_qos_remove_request(&sai->pm_qos_req);
>
>         regcache_cache_only(sai->regmap, true);
> +       pinctrl_pm_select_sleep_state(dev);

ASoC core already selects the sleep pinctrl state when a component
becomes inactive
in soc_pcm_clean(), and restores the default state in __soc_pcm_open().
So should this be a duplicate?

Best regards
Shengjiu Wang
>
>         return 0;
>  }
> @@ -1969,6 +1970,8 @@ static int fsl_sai_runtime_resume(struct device *de=
v)
>         unsigned int ofs =3D sai->soc_data->reg_offset;
>         int ret;
>
> +       pinctrl_pm_select_default_state(dev);
> +
>         ret =3D clk_prepare_enable(sai->bus_clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable bus clock: %d\n", ret);
> --
> 2.43.0
>
