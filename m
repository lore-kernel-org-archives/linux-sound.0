Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF63EA957
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095656; cv=pass; b=Za+LnpySd8zf9SJF/uIczwVCMwHc23AC9/cOexBY0UK+IMo6itav1Vwxp8uj7NauTS48aCgcB2wocBcUlRYWYlNtc/RpQGPvlok/YUs+Z32o7+0/emZPh6mXxrnlyWUIAt3GFcxXwCkvMJ6mb3sdiZ9fTdQT2quT4N/pNh/5l50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095656; c=relaxed/simple;
	bh=Y2IK0OrtSi3t5BcBj1ZtQzAjH+x9+HSC57KKssAwDLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7bOziQpu+8kKXOwmNOndnpr9tnbuoSdXjsc6+zEZSYUgT39A9Rg4oS/YGt1dN35QOC4odjdguq26pB1oWIg2apiaUUZE09UXv2Oee8J0Q0de70ApmiGcciQWdE797npQskuHPflhxW+/9vCKeq1x9DOXAufKi331ivsg2Vv2zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1JX9/Kh; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1JX9/Kh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853c07a76adso466652b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 20:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095654; cv=none;
        d=google.com; s=arc-20260327;
        b=kr1mVmCVyfKhsn46af1Sj1dtu1mc/mOyeuNkdE4xK2oKjsqyyftfoXBOjMBV8+vrM0
         8jla2lTY24kWQA+39cRexmQeraOupK6rX1OUfXk9X/eIVvZD8CMFoHNcmlGLUznAWigi
         Wvez8sywY+cHxgppK+Zs3UZ77IuZsvH42FfoxJ881ciyEYY+QimYR8Sn/elGgsYn28Mx
         D0QLRbuXonia3A1aFi68DmJgmWRa4bsBSyVdaUgaAr/YgjdUaiQwXIkBuKgB46FvMTpR
         8h9txw+pGVtZnYnGfN7gtW4qDVmPlMupHjvRN179fyYkm0pWlslYVXq+yRi9tg+TSpgU
         or8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        fh=S6Bi60OYu3imkAZdImkgt3LOnq+U25084AUFAeXCzBY=;
        b=CBk7aVjyJmGb70z+nLKDe3Yx8xDCIiX5uZV0Pkrq367+RrG6NOIu79LGisSgs2Sikb
         Nu4/RXunbXMQOOBo6jZQ101B/esdxkF2rquSTx3GwRRrEby0s/BS6dIeMqdybSFop2I8
         y5cbWh7+k7hgYsZa08H+ea/DD/Mh36jHZpoEe2FnoaBE0z1dJyrJvAopgqawST9RM2NK
         pbz2P14tW1i9wDc6sp7o5rARhJ2pK1+xDkcqZX26qVzVAZW4FgLwDoiModxTJfive5hk
         J3GTFnYimG3o+EjlyCPKCQlnIwfTDmh48lrcF0lfsg0EiWoEnP3KCk6DwDedJLrN6hMk
         Utig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095654; x=1789700454; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=E1JX9/KhE7A844Z2hPbzyQgfFOsw7m0hUvXmn6H4DJLeW9mw49E+B1rJx34F0dGB6o
         So4IHX+VMrCuvS6dnaez8PNdyvxVhM85MqiLc8odRBZicL7klrz9Reunrq35WSpx/NNR
         f1aZxYYw0wSUnL6EilMjGxa9Qigw4BtGqbhN+jM//HiEXed4Mm0q8kqUzaG3GzR5Zt+9
         YVRKoeJp/LZB6/dmjEZ7acDtaklg1YckCmSHjPySUOO90cIUyuRC3WB0X3iXoZ3KuR5c
         HoL6bb5TlfMOUUOG0sW6r32MAJ0OLNzyE6+JDBvnzYj/NulnYw56aytuai0MBDm2fttc
         M41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095654; x=1789700454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=OrvXITcAGmyGJC6/LIKmlzbsRLQa+wsJL2SaOEQc7loBUfKLM81ULts886R6rzQOBH
         X4rcvjz3enRZW4Z1P5IHlHuP06A60bWRcQ1xAIAc+ijMzKRuWcRF0J0lpI2vgfBnwVza
         32O2HPSIC6Bz0N9ywfHGvywRkWS+8qHeyOfaR9C03jBYbyECF9KaDW8Cfr2d/FTNXVh2
         loPprOHUd5agu//JCupDrtWw7+0Kxs/vFwx7kdqM2FWgP5m2P8cyTaTg/8RFy3vYVW2c
         SKnlU+QfN72+NKuLt7m84Tp1jFYLXMI2T7hG75asJGyJ0jwjOH74zE5tGK33PP4xMGCf
         h/+g==
X-Forwarded-Encrypted: i=1; AKwUvBztS9wk8CcTG5JoYOBDRn4mEHhii3ZAmw+lToYDQX5m/ZAGkgvhXGT1y7TnXOeixYYXmX60nzmeVVHwoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFvMZMLYhZ2DoYMlNNj3l70/8RHufxYaGqVaYQxRjFeCbJ8mVf
	0el+FJkEq0+JsNLqeW1F1gamhHq4A/eYLG3Y9I4Ulac3uAz6hoLH2RuUMGJcZ1hltIaZUN91rjj
	LCAu5PzH9vttb9RHoGpUnhSqTsQIybdw=
X-Gm-Gg: AYBFou157GvXgxGXMgl97L/WyA393zQKRKSkHmyhDWbS3Ft876Ba74kXzkJzTw+Zswt
	bam49FDpkl5ngrwtqjgQkCqxhF3LN8F1ZodlDXLh25ll4UhuUnxJBRKn6p4bnXAODk2xzJpLO4M
	MKtbbrSUFEG0XjGil/AeS8FzbxFuhSfyPP6zeDF6EpIGyc3X4igf60fPBSfSSxpyUkj1tQ5TqiN
	oxpWpaP0eB1IPdsNyD2kAXst5enRGGi3QtmURZDC623A+ulysKcyFmz1iWfWD5f+aJjkwe07EgT
	6UDXBWRp2YeaxFa7y2Rs1du/aLwTXRyppvjY8nxQPnoD1EjZsCxT8x6luUkQ60n/WIQwkrCAyjl
	Kt+0MV/TLtvFbBuLwad59d6w8+meC6AO3X6rphfRRv164gOMELq9hztitOU43T5dnceo=
X-Received: by 2002:a05:6a00:3cd5:b0:857:72f8:dc99 with SMTP id
 d2e1a72fcca58-86b328e7f63mr3298126b3a.26.1789095651223; Thu, 10 Sep 2026
 20:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910114338.142682-1-phucduc.bui@gmail.com> <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
In-Reply-To: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 10:00:39 +0700
X-Gm-Features: AcwNN1WPfGjfjTJ3UBeJ1SZL5IZMV3aP3IQW-IHMbnVy8yqXjU0IzHMcAxwIYp0
Message-ID: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Darren Ye <darren.ye@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

>
> mt8365-afe-pcm.c has:
>
>     {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},
>
> missing a Switch from the control.  I suspect there's other errors; this
> really needs to be tested before it can be applied.  Given the general
> quality of the driver here and the lack of anything constructive we're
> doing with the errors changes like this have high risk and low reward
> unless we're actually running the code.

I agree that these changes should ideally be tested on real hardware.
Unfortunately, I don't currently have any MTK boards available for
testing.

If these changes cannot be properly tested, I'm also fine with
dropping this patch.

On a related note: do MediaTek or other hardware vendors typically
provide development boards to independent upstream contributors for
testing purposes? It would make it much easier for contributors like
me to properly validate changes like this one.

Best regards,
Phuc
