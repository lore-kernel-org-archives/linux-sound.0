Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1102773F9
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783912917; cv=pass; b=NKYOW+oX0k7XlUN1jfrPBdsUsk050zOWJH43uep075lAwkSDzkraa85/gW9VCGrFOspryfmEaMj6q1wAxqu2KJFeOvRUHz9lRqmzzaWTzU6NhmAV1XdcMg0UGk6B41AkuKAWWvoeOkIm1Pip7zSIjgIUYdMFPdWlBo1MOVmsHBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783912917; c=relaxed/simple;
	bh=UIGqGtglHC59Nxfx1FhvxXxMc/luGIbaIGQycR2kNBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMF91q4H0Z+H323AVyz9NqBrROK8Bdx+UBuWF0xFBIPEc2o+PRhmgR3EUIHw5OfrZ6pALeqMbvfk0QkRNJbYK9dkFTobXE/zRRrBGiH+xro9GMrl32PSQQAybj6SOApEJzdvr5rNlx+gd17VLPQeGhOiS/RQTtt3cQQ8YtXmTJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2Yd3lsW; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2Yd3lsW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so12140115ad.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 20:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783912915; cv=none;
        d=google.com; s=arc-20260327;
        b=eaw+xBGEcX0PWDpXM1zeCTYqT5ZPkDHM/nuauzFHOsCX2fNbtsmcyGLafe9AKKF3jP
         DSogJGu2OX1M7B4/B+HCC1VlL5sToKmKOyASNHjE5smuMZJ33zxLsxfTmF7BGVOcoBzx
         Uc2J3Zeo9ji8kow83vQEp0PV5iklQkWsEatcmaAVkNfW1XOAcB4O1/2wBaZNtzupJb4/
         03yn1y3iVnTbT+j/Q22wfYD0un1MI2ZYxEzgpO6gsYy2z6TjHHEjvm1SMrtDxCN8nlMs
         3IK+dIF+XDnnXG6Iwe0E7k/gX3Bq0iY+bnXX5+MSh3hz7zgC6LT3mOMB4kzsDY7RTebG
         UP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSFFP+nKaR0576Boh3573ftrq0odrZqheyrYVqgy2zI=;
        fh=qaSZk833dcyfd1/rOKinJd+GC8azI7a1u0ZfxbAc3Ps=;
        b=hwY1sy/HJpe2aHXdsD6Q/mrRcbTCjHEOwmlac/WtZqbT7Ca7AE0lIR2Wm9Q+heh5VO
         LeDz49PoQY9kjCU8e3Fy0bxklRtvEaBbREhpvgt9LmAQyKjZd4At0jQyeDb69jJlm//f
         u2m9UFeNv8D3PbU8E1Ve1ul++ce1huOyWzZl4RX8GfUlAM+a+91GbQmUAZK/aUSZp5SR
         +SYLXaXy278M5sWaMkfFZMMSkzdXLkU+145elyGGOzgwRsXmZlm+2GKKcrQ9gcp4Bs/p
         rpbnSbnOuEq8paa88UXIYu1Nd+Hj5EkNEfWdocf5j5uIvkMDT0jufW/mDE4qebGvLStT
         yVyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783912915; x=1784517715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSFFP+nKaR0576Boh3573ftrq0odrZqheyrYVqgy2zI=;
        b=G2Yd3lsW6DLm8rohYLB5pUGt82YxTaL8amobsmzqhIioMFKHpsbMv8Fj+4lE75trFC
         Xd3ePqO33yRFjz3wxRdAc94aE9Lt+sTodm8oCnK990kwjQXNnjABqoOXTKWuXchGiKu6
         3qB00tYluqdmNr1Eh4URGtSBkrgIRQUj1poGlaq3ZzBxzu/aPp1MLBEK2WXFgSFfdRTz
         1B+7Tv51YOmRc055OAltUfM8izZlyyew4GE9A2OkoQneAy8RK6V2IhvGWt11GccdiR4A
         gyrOnShoidufwlPv3o/168EMHeGydZkoYaBfes2JgCwMS2hovYHPTaGlWEJxq8M56s4z
         8rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783912915; x=1784517715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSFFP+nKaR0576Boh3573ftrq0odrZqheyrYVqgy2zI=;
        b=tVewKrP3v7trM3r3lerpMHkimHwA9YMwevD9RxRLmq+Cp96w3s+qvjwJ2FqGC9aa8z
         DtUR26Z44RyfYIF+4TCvGiVkac4zqpnACWxRpvoqZaCXjcmLl57x1ER+igGELYkcL/Ei
         7653lHiWec/V6uoc/nqUCpUeFgCQ+s3tdTF+h3901sagQBLwJshubr7J+JHzxN/T/IWV
         Vktp4yWSAW3fZsq8RL9lJphfXSzV9Iw37n5LWr2Xf9yXKWLNIWs3mM+yjHhw+Ph3zrwX
         TEfWuTYZ/dl5bxDh2ruSHk4iMKiK2AjOxL9tQgB4IdUmNn/xG1iX1knsdxQ9BEWAhD5t
         D9XA==
X-Forwarded-Encrypted: i=1; AHgh+RqdiaOVHWNK2Gu9X88n+wdBLQcT7Rf45Oz077Z6iJ+BjHKilUoB5Ca8JJLGUbv5pjdGeUDhB76SdRLE/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbi/jjQSF8LLJoPn9Vhv7/G5JKNmr/pamdsm297tW2hDxd1U4r
	fAboPYzcAIp3sjFzJqMbeKjiFvdG/CAZMxyhjI9S471QyVxpG9h3f/DLlmjVo3rQ+pDX5kkfH7j
	wEeQ98VpfiGeFIuqcTnylq52e82I8Wy8=
X-Gm-Gg: AfdE7clWJrYGpIO9x1HkWC2qtzkchHgCNqjaT/VYcAoVkKgNUTs7XMafpRdVtd6kDlo
	p9AuBLiU7fWYIchpBgq146w6MyXc5wkciI2nCyXRWmYS4MlLYxw4AiH78+GaL5ScHWVMhn50Glt
	xEs0ozT4nT8NwD3FUnQlPwe0EQrcRJ7h368CwDVFefHA2CIYbon+f/DNHPuNookHF6iD+qBMH05
	FieWo9SO2Yu+YyYNfKN5UeEgKbiRs5/J1RLpH1PanHmBObP14DDR2B2qUqP5X6rTvLlfoqR
X-Received: by 2002:a17:903:b07:b0:2c9:d298:6c06 with SMTP id
 d9443c01a7336-2ce9f0268c4mr76691645ad.25.1783912915142; Sun, 12 Jul 2026
 20:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070835.3749817-1-chancel.liu@oss.nxp.com>
In-Reply-To: <20260710070835.3749817-1-chancel.liu@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Jul 2026 11:21:37 +0800
X-Gm-Features: AVVi8CfYC_2UaQWz1pfB01RpZjLtZ5yJ4xkwVm543r8qOjus-QVMl3YHjma3FUk
Message-ID: <CAA+D8ANi1LKZmFeZ8bFd2LovAoaL-RrcV-6seaV9DNLGMcB59Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 3:08=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> When the BCLK divider ratio is 1:1, fsl_sai_set_bclk() enables bypass
> mode by setting BYP, but never clears the bit. The BYP=3D1 value remains
> in the regcache, and is restored by regcache_sync() on the next runtime
> resume.
>
> Since BYP=3D1 combined with BCD=3D1 immediately outputs the ungated MCLK
> as BCLK without waiting for BCE/TE/RE to be enabled, the clock is
> driven prematurely before the stream is fully configured, causing
> noise on some codecs.
>
> Fix this by clearing BYP and BCI in fsl_sai_hw_free() taking into
> account sync mode and the opposite stream's state, so that the regcache
> holds BYP=3D0 before runtime suspend and regcache_sync() on resume will
> not restore bypass mode prematurely.
>
> Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio suppor=
t")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Thanks for the update.

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> Changes in v2:
> - Move BYP/BCI clearing from fsl_sai_config_disable() (trigger path)
>   to fsl_sai_hw_free() to avoid breaking pause/suspend-resume cycles
>   where hw_params() is not called again on unpause/resume.
>
>  sound/soc/fsl/fsl_sai.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 9661602b53c5..d232c8f53061 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -808,6 +808,8 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *=
substream,
>         struct fsl_sai *sai =3D snd_soc_dai_get_drvdata(cpu_dai);
>         bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
>         unsigned int ofs =3D sai->soc_data->reg_offset;
> +       int adir =3D tx ? RX : TX;
> +       int dir  =3D tx ? TX : RX;
>
>         /* Clear xMR to avoid channel swap with mclk_with_tere enabled ca=
se */
>         regmap_write(sai->regmap, FSL_SAI_xMR(tx), 0);
> @@ -815,10 +817,29 @@ static int fsl_sai_hw_free(struct snd_pcm_substream=
 *substream,
>         regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
>                            FSL_SAI_CR3_TRCE_MASK, 0);
>
> -       if (!sai->is_consumer_mode[tx] &&
> -           sai->mclk_streams & BIT(substream->stream)) {
> -               clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[tx]]);
> -               sai->mclk_streams &=3D ~BIT(substream->stream);
> +       if (!sai->is_consumer_mode[tx]) {
> +               bool adir_active =3D !!(sai->mclk_streams & BIT(!substrea=
m->stream));
> +               /*
> +                * If opposite stream provides clocks for synchronous mod=
e and
> +                * it is inactive, Clear BYP and BCI
> +                */
> +               if (fsl_sai_dir_is_synced(sai, adir) && !adir_active)
> +                       regmap_update_bits(sai->regmap, FSL_SAI_xCR2(!tx,=
 ofs),
> +                                          FSL_SAI_CR2_BCI | FSL_SAI_CR2_=
BYP, 0);
> +               /*
> +                * Clear BYP and BCI of current stream if either of:
> +                * 1. current stream doesn't provide clocks for synchrono=
us mode
> +                * 2. current stream provides clocks for synchronous mode=
 but no
> +                *    more stream is active.
> +                */
> +               if (!fsl_sai_dir_is_synced(sai, dir) || !adir_active)
> +                       regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, =
ofs),
> +                                          FSL_SAI_CR2_BCI | FSL_SAI_CR2_=
BYP, 0);
> +
> +               if (sai->mclk_streams & BIT(substream->stream)) {
> +                       clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[=
tx]]);
> +                       sai->mclk_streams &=3D ~BIT(substream->stream);
> +               }
>         }
>
>         return 0;
> --
> 2.50.1
>
