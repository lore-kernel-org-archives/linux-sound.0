Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFA3816EF
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768893297; cv=pass; b=tQTy9RinIFK8W5+XXVLbT58WcWO9Pog9BykNNGVA8MVbM1lRf4WfaQgNG3MvgatGd8sqqHMhcfvKXT/nh3COiyXIXPEPw7bjY4bxaY0L8OVlVP8rbo+KmnNh4Q+FQYeX1RVLyFXzcBqeXKBwjB6VdPOYMJlECsHMgqFZZVi1bog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768893297; c=relaxed/simple;
	bh=2apavE+c+60xBpwAPAfHfp3nJczltL44E4xnBaDErHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7/esdGU+6h+iTL32zq8Jhjq+uBo4prL4oeLNIymmPpDZK2cbtBOVRkvAxAFrAFgJKG1+o54ldMJw6ghxZcwvmQylaIWZM5lAQGGXX7gBDKYroGz4c/4FC76+JXjU/mnjyFORuFYBtDOPtyw2Kmy+5MV7Y6TNDCorrKVQmik4zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ30QReI; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ30QReI"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso3377947a91.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 23:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768893287; cv=none;
        d=google.com; s=arc-20240605;
        b=hFVH8i13lW5UMLbFBtg7N5JT9/zHXOO+Q6aHASOWa51WZ4HICXpA/T9qfxiLznEmbZ
         Ins+urkbG3JbWTtn9y9nR8yN73KvjDOFy8mTkwZksrZnO4DCOnCFwAGAqGESIZrD7Ory
         L4JDJHUJd8Yy2sNrPeTBenfaYmeSA/EMvDgi2Y1wjWji3VFWJiHm5gZONQz4mJ1vjtXx
         eZVouJLaM1mIwtpKczj/Y6l1YDjkeN4HJA9IcdKrc65hwQf+Qq5mW4G+YbW/p1RjdHPm
         9PeA5Qve7hQupuWguGX+QZDGU41z+8afytTNIdrEF8VJOve2mJhcCo7ylK6Z0Rt9LANo
         fF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        fh=pqABKud+Igz4TUavMTJMPI2o9G20D80zWSe56TJ6+NM=;
        b=MMKyqt84GXfLGAVmEcLnaIBRp3wKL1YbKmDaFqg2indiBMhwYcAD82w6PnBz4oS0jp
         Qb4H3j7UzAO91gmb09CzBpVTHvh3aT8ML09lXGzaE0zraVTgq29yEQvMTxInQq/UhDPi
         mkMcT9lQyn4z1wI451spwqDrjfQML3e+Hm3tHKYyNpPYewVyj/K1xeUptiFrYmm0ps6j
         KD1Wpj1km66FG2WKalVv1TvlTlIWPvxCmSBCRTWLgCn2kNUYlEmdRoXGWUi6CH4tcjYT
         EdaL3h7AFlAotZ8wfAnB20G0JOBfjz6nEbsh4OUQd7GC01ImipyFQAfxerf7XV43u47K
         hOeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768893287; x=1769498087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        b=CZ30QReIxGPh1vn06dR9YnceGBbGHK4QwHyPbs5mgcvyNUXfi0Zdds6vJ16SC0ct33
         p85bho8nxBpi+9q6OymOVPn4ItfSTDbOrvBJpISLxBFxE6HYrAtul+Bo00l8lG+BF6Bl
         KvG8wL4hmxK8CCTERIU1kvC+zyHqppAj1eUpGbkjpQ+zOAlwSvcsKkiaaoVZeezgHNiS
         jdz9zhGG2w2jtgM/8yKlmwI22hxHsSC1cAyh8Yr66JBdEcK52jTV413ajJLP/v24sqUG
         b2DhGBOKTg7x1CjsrBRU7xxh4UnHA29oFMbVjK8GhMe/8tgQVMHTM1p11PcePn1y8Lgq
         ayHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893287; x=1769498087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        b=pitLXYsqy9sWEhY9RGoSeWpLiR9QO/GiOnwSCZ4pVbZMFyqOoEZsDyHzW8BD+GcWVn
         D9CGnAfi5CapBGxDGsojYSMsCDgSOj3HiY7bSQwXI3We8mL37x3rQQgiaVAKUMz6elcp
         ClTuWbgm1NqK1I4b+bZeEk8mkT03fpnVTA9o9Xb7/Fl2eOXIv2UeDyduA0iZjxkUe42l
         sbkm40tJdH6yXgdzpINsLX/NoqsVIohNdOqQ2GwJqX2Jjk62HO4YMu7o6+FMFLVd+iiG
         GiwCmflJp2j4z5QxngTlahM56O8CeLEWPNKH4DE2tE/roG5KAx4CyI1tdDO4qZkIcTBv
         9uUA==
X-Forwarded-Encrypted: i=1; AJvYcCW+OJIzvjjzxnTR9DDTRY8LTLmN2dykowndhENLfsWyp8g0S2rmVMg/QipVAlMxuPne/XOb/PDadlWikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBUQDp8Hd2K6iiWawkuqdJisgzvoRefAsbTk0sLXxaujqXvZn
	tCDBibFzwuV25jQigAj5oNBqMJZhqteYFTThIhOE/GOnNU8mdmcHfUtWoQvmUTrCG/DwxDkj/iH
	dna5LF/D7p5geBXzWUtjlAKEYPsglfdg=
X-Gm-Gg: AZuq6aJ2eXwmGwxEVSgA8Eo2hwFZngzKLsOOZZZD0SfeJIq1YzAept9yKJMFxEjSf1J
	x6UsiWJvruF9hLYTu+rg5p+NbMa2H5QH+7Xw5y3NqkZXZkHUinOzdjhvyowJvepfJucF83C+Aam
	d4df8Sp4Mw61AmUgn54dU4KEzkruzP6aXGLF85hHfhfEFVYcQRBYMbevPRIK0g0qs6LFT+6SrsE
	AZAp2nQDdw/xTJiLqNkYO/ZzkCsB7YHvnDLtgiRt8DrthrQ4I0JQ474NovuU7OBvXkp7/Q=
X-Received: by 2002:a17:90b:1c84:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-3527329c737mr11291662a91.36.1768893287413; Mon, 19 Jan 2026
 23:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118205030.1532696-1-festevam@gmail.com>
In-Reply-To: <20260118205030.1532696-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 15:14:35 +0800
X-Gm-Features: AZwV_QhANuYAMbdvOcsvLwzcsqnrExKdw3Lq6AQB2yvSz6Q2_jO2O5XyvjGg3fE
Message-ID: <CAA+D8APZ6Un4ViiO0PMDdUhnef6ny7BtJ+DUVL0d3qUkNVrMjw@mail.gmail.com>
Subject: Re: [PATCH RESEND] ASoC: fsl: imx-card: Do not force slot width to
 sample width
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 4:50=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> imx-card currently sets the slot width to the physical sample width
> for I2S links. This breaks controllers that use fixed-width slots
> (e.g. 32-bit FIFO words), causing the unused bits in the slot to
> contain undefined data when playing 16-bit streams.
>
> Do not override the slot width in the machine driver and let the CPU
> DAI select an appropriate default instead. This matches the behavior
> of simple-audio-card and avoids embedding controller-specific policy
> in the machine driver.
>
> On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
> playing 16-bit audio resulted in spurious frequencies and an incorrect
> SAI data waveform, as the slot width was forced to 16 bits. After this
> change, audio artifacts are eliminated and the 16-bit samples correctly
> occupy the first half of the 32-bit slot, with the remaining bits padded
> with zeroes.
>
> Cc: stable@vger.kernel.org
> Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-card.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index 28699d7b75ca..05b4e971a366 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream=
 *substream,
>                               SND_SOC_DAIFMT_PDM;
>                 } else {
>                         slots =3D 2;
> -                       slot_width =3D params_physical_width(params);
>                         fmt =3D (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT=
_FORMAT_MASK) |
>                               SND_SOC_DAIFMT_I2S;
>                 }
> --
> 2.34.1
>
