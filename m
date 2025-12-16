Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9484330674
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892427; cv=none; b=COvqZHJpoyacz7Fk2siGjCXScyEoRzNhuqRxdN5pSUi7h5Qu1HilVctNIkCw4qNwapqHC2jGHFDHyQpRIGsV4J7oez2+QnKTMtnCpTRlQg+FDAzkPbhR+LMly48lNBH3iVqTRO9kPPimazk9wAU1m+UlrAXuNSij2sZPBy3dpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892427; c=relaxed/simple;
	bh=tH8O8McX1jE7R85v/p+bItNoelnAJR44SbhrkBJoYuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKNpABtDfOZvpFxmCbIL/lAaNrzfpfCFfJXYCMzuLxpPNQl1c27oW0zjratvNYxdenfnoA+cWUbZReon2uRqh+45G6fHLDEzN5ykBdqbtwUBTUB6gJGZYSatsk8/lAsgOdqCl/9ABMviovkYaOo7FKN1wh/ZvVtCO5mjgKkIbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4qZkNPp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4qZkNPp"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso5684472e87.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 05:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765892424; x=1766497224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ee4Zz0D9ytcS7H682D9wvk4H4KdC+3KAMY2EuDrq4c=;
        b=W4qZkNPpzN0d2Wx3cQnxnRffeaGyPCjpQgm05Zan9MdYN7e54oFWbMpKHyrT4k5HRF
         J+mlwKx+EiOEr+7S16P7Yutfz3mQ5gmv1tU7+VqFgIsr0j8psCrWZWj3yhfJwSxJEXNB
         1EhgQbaSZqeZFwy36uozdGIGOrJ4qV/LuOw9PP7zh4Y0wEUj0SLr//DfAqYfo0dTZcDO
         sfJUCU+mQeRBbsiwqjEvnhpuTyfYxMYfCyTCZbZRL3xqjtjTjLH0/tQ/Jnhg1FMtRhA5
         ZcsL9Glk/DZDbPnm5idAjzaSwJmHhemoIn7iAttS78A7/pGMlMy7N+MMGHDVpHQqIVed
         Dgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892424; x=1766497224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ee4Zz0D9ytcS7H682D9wvk4H4KdC+3KAMY2EuDrq4c=;
        b=Pc/m1Jji/XE/dSNkkGD1vRMqZG+Nnl6L8F7SE3cFWh7IT6D2AoovEX4wWrMgs/ob27
         ISwUpS1ABJJbYK3rpF0c5KoVEXDaP9/8WBBb7HdPVu9jA5dSbjxIuSwvAth1ZsFsPZdH
         e4qFNVlVCAWtTEyT3bNxbgWHTOAiBLiGLZWMlyxMaqy2cipuup6a1RVk1EOGBKiMUpsX
         7axrC77e4w5Q6C2zrBhMYXD0lVmK7nE7c//2RMs+Sp0VnzCPhUXFpHxX+xwP7Suc/g/F
         JdetX+t63chxcM73OQDlVfdYst2Xko7cyq0XvziNaZfodXLlmBXuqUlXxKpEZA0AYY5x
         RIdg==
X-Forwarded-Encrypted: i=1; AJvYcCV1HTig+k5CJqdT4Y7PXeXdFR1H6lr+JgmzvKRKnY3lx8o4G1ljTTTZfjKH2PZyRbJs715BYqBdr2Mjhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvWwrwJ0dygVWCOQOG6JdjJ1CKBRIHMRjyjAPcsoqCWa9SX1TF
	YM5Qry1p/0lrJte5ghzVsmHZwqJpgKNaOdXoe8Lw9+PEEkWOS5OQ4L5dZth9WCPs1BDty9bEVro
	jXSp0DXlyQCFx9QkL//GL8+r3m4oBfCI=
X-Gm-Gg: AY/fxX5HiFKcNSft3zOkA4a9LBdAqJZlswScb1FOw3EHGMW/2b7zOWEjYhYd2VI1P71
	u7d5ss1agHWEEYG0eMP+O8A/AoF6mip1bkuE/Hjlt3xOIWMlZkR0mXMkLA9ZPiW9/xlHmGF4dTp
	rwRsqkDXYQiSB23tgi6NNhoWF67lqEMsKO56j8hl2SGkkGBSowtnqwxn3kP3OyCKnzcojo3je09
	ofM1qYpnEQ1pklRC6Ar9GKWV2BrSOHfwQhcXB6UhRBHfTwKJKUh4mH/An41CTR6CRtna/exdK1u
	O24BlhEPNYjbXKPOLcEAwAaUjA==
X-Google-Smtp-Source: AGHT+IG6PHKV93VLlDgo3F9ExLDBvuvEH2IBl9c0XAav+v5vKoNk/HgkxZLxn472r/mSjzFUQm2ILxTteHPp2+/RnlM=
X-Received: by 2002:a05:6512:2207:b0:594:2ff7:9d29 with SMTP id
 2adb3069b0e04-598faa33bd2mr4880294e87.13.1765892423460; Tue, 16 Dec 2025
 05:40:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Dec 2025 10:40:12 -0300
X-Gm-Features: AQt7F2qZF3f-L8eLmpiAwAAP8lHE9tMfxenOhSlQvdf4WCcx_Deg76JxdUu8eKI
Message-ID: <CAOMZO5B1Wf0zmOA23VNLrNW5rsB1at_qHoMk3ytj8aU8eM26Sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Dec 16, 2025 at 6:41=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> this series fixes the error regarding duplicate debugfs directory creatio=
n on
> TQMa8MPxL (imx8mp) when easrc is enabled:
>   debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
>
> This is caused because fsl_easrc adds two components which use the device=
 name
> as component name. Debugfs directories for each component is created, res=
ulting
> on name conflict. Fix this by adding the debugfs_prefix for both componen=
t
> drivers.
>
> Before:
> $ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
> 30c30000.sai  30c90000.easrc  HiFi-ASRC-FE  dapm  dapm_pop_time
> dma:30c30000.sai  tlv320aic32x4.1-0018
>
> After:
> $ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
> 30c30000.sai  HiFi-ASRC-FE  asrc:30c90000.easrc  dapm  dapm_pop_time
> dma:30c30000.sai  easrc:30c90000.easrc  tlv320aic32x4.1-0018

Thanks for fixing these error messages.

For the series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
