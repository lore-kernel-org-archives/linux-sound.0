Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049E383313
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783490993; cv=pass; b=Twlup3JNt7L3K7PYTn6jTAazZoPDoJINKsAxVJutWv+Cb+1R+St9BaZMWBcmPKcxFCeRaucAvL+UUS+JhgBKN/JNCyjPO0e7P0K8QQU22rB6ebodjGOj4DIiaWpXZhdrtng5u33MuIUosSzH1WQUP/XkNBawPxmK7oH9dee/stM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783490993; c=relaxed/simple;
	bh=d5ewuD+/xNzD4Hw4w/AQNiEVZqcRDqcX+QLG5n/9KIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/cNTIug+UVEJwFQa/xneCCQn/52UCx9fyV+oQ1yO1MoJrDlurZy4ryzFFSlaDUseUOKb98MglwRH5F8tcn9fhU/5UU8JSRKJc/lYY94SsxO11sZfwaqnOzVE/A8oJugXsPcOc9kSFGaSKnTKTIwtzPJcoPsDzlNnoNVMEtY5JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZapU0sFR; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZapU0sFR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845ea8924fdso356527b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 23:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783490991; cv=none;
        d=google.com; s=arc-20260327;
        b=VHYMdbZaVzp34vFjK33Xm9JFeMcknp7UbfCh7/7v04wARa8aaVZLgnGxTlDXZDB5Sd
         bZBhdlDOlNoC5NWHTw7gClbeE8aRnev9RsHWBNyguDnQIvVuTVq9IqradqL4j1R4r8gM
         f862H/zRHuCmeQLVBUQhlKisMYGtUldrDiSwUJlHfolWi9SxXE4p8/N05UkycuQCkyUS
         +lYoPZAkvUQzZOIhXPRTXNrslD0rs0lYNA1PVZs+RD+o3ts17XoVTFms0U0KwZvNADaV
         Zbl4/4K7/4pHU9YsuGhr6s2+MEn4e9Tm6Yo5cyQdAXWyW6UEpRUjaSrJ9qCtYWDX7j7y
         flXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6WiABXxQHApvBVwKO6vN53M1XsHwehs6tIssYxEtas=;
        fh=7ntObOLelvVg05DkZMfY1QwfeZZRJzz4JyHEGDIgv7w=;
        b=MHWJK7v/ekGVigqZGm9LgwBrT0S7uOjPbzb9D+ZP1687FJj33yJWRZeKF60xAtnwkp
         JOT43JtA/xfZqjLtNsIdGcUGaHuKWhw1j3zQVz6vfjndFfNVpDH8CxKTxrpy2wLF2o7g
         ftLGrqTZ9ymcMB/7/17VCdqCMN0Fz0PgDSVPR/d+2SbIlRnB5a3ZCfz4jStt5wWpObfp
         s1ZSe+q2iQm6XHPOAHdqVZAgrS/PmRkeoAX9aQ/1gL8UkZ47bMxyOTHYUd+bnCk6ZQTp
         Qw3xQC790BlLOZ56JPa9crkOxyN11PEebYPBQ6lDi+GqQ6pnD83M3NohhCoh3CCF18G/
         EyaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783490991; x=1784095791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6WiABXxQHApvBVwKO6vN53M1XsHwehs6tIssYxEtas=;
        b=ZapU0sFRpVCiLY0LxFbeesJI+4/B0A5bpJNBPvi/yFFfuX6YKy9FyUvE02xrhI00y2
         5OxtqAFQXulWxLPkNJtSZRcsItUdneDpnRF0DHeFbW0sL1M8aBhTKfoBFkXJOOokeJp6
         zAYjY5ZfnZIRUMgE0pyVdXk53NsRZqDEfJqBK59sa1rg4oP6Fws3pMDOsssueijSHvrb
         HAa7B/LVkBSrU9xi+LKfhPOLxpKJJGC+UtJBBp2GH2wz3F6IWEHPwA3UDLxln+bs7pf6
         2R+/Nv923Hz0XjmcH6KBT5oUsXbW9kc9MCUhT4rZ8ZJcgbRzZQQmc5445NR4rFrN7JFM
         ZU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783490991; x=1784095791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6WiABXxQHApvBVwKO6vN53M1XsHwehs6tIssYxEtas=;
        b=rDDKGe2JxHc9hRjrlHZGF4BLph0WgFFehGHegE2cHXGCoEB64XgSkzWen4v1jJgeo6
         1Q7F97DHnRRAI/XhNcTEf2uB+8yfqNqDnniUlWhXqQHXKL7BgjsbbiTaKILupSn8tpyL
         BrguVOmAyKIpHbEgqqTmfJd4KRLim8NfxCIp1oBDhy+uDmud4nsN25MgTp4PkoGyRc8L
         n3+Ls4hu8zlsvq7EGG6dX+5iNy0sNkRArEv2c/DA1VMr/wGqCXmd94KjHbAp0o+Mop8R
         AmoQ7ijWsJGMsdQ0AIZEeM/G/kpf0xQX9EJmFjOGX+zNWKJ49SJd73zDUA6Dqhr8iQe9
         ud2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZIhSVQtsh31JlVisIJJVhXP7AzQruOyp20EYtIYHJk5UC6V9+WFsM1wTTQ7NkzHsAhQUONDhKwmaPfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwkwom86tppLH0R2VSQZaYoQWZ3b+S3EzODfANRXfgbZmuwjP
	AwCV/g8eZmarH7940YTgxQp8jUr5A83Gub+7qyzcqULougpsQVb0fus+visounhk20fNLSMGfsV
	EjfkLRu22PAbGAGGdt4bqBRlrHFnTn+M=
X-Gm-Gg: AfdE7ckt8/qHFEX553JiYsbFIZc2CojvoWJg2hJakvuNsmRLFfZgQdQXlMVYTsrLwFM
	k3CiOQK/N3iuV9gzirdgcguzku2uAAXr+F7r72OxY+y7lja7ce7tuZqAYeWFmLI27zLi35mhwvK
	ulST9iH4ycSnlKIl89lLnVyfPwF+lL7pKJwtNGR+dby7wTJQSUuzei4Vq1waCn9A0sH8Rw9xpkl
	5pCttuiEAyZCDfDwRYYdJQAo9iYaCgt7QvNCylGw86mVnQGxhVXIMWzGpoxgWzvP2FWBC3c
X-Received: by 2002:a05:6a00:3d06:b0:82f:776f:a78d with SMTP id
 d2e1a72fcca58-84842ef95c5mr1196100b3a.19.1783490991269; Tue, 07 Jul 2026
 23:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707084648.475743-1-chancel.liu@oss.nxp.com>
In-Reply-To: <20260707084648.475743-1-chancel.liu@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 8 Jul 2026 14:09:37 +0800
X-Gm-Features: AVVi8CfkA1sm1EIEJzmk8wb4_nU-sP-VL7lj_LgjGmnoTrYF3OkVV26pmapXYaA
Message-ID: <CAA+D8AOoO98Zi2+GP4He2zhSLaM=aKZC5F0PBu70QTFGJnp2Pw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 4:47=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.com=
> wrote:
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
> Fix this by clearing BYP and BCI together in fsl_sai_config_disable().
> Also clear BCI, which is programmed together with the bypass case in
> synchronous mode, so the cached CR2 state is clean and regcache_sync()
> will not restore bypass mode prematurely on the next resume.
>
> Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio suppor=
t")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_sai.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 9661602b53c5..4c0626d572a5 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -847,6 +847,9 @@ static void fsl_sai_config_disable(struct fsl_sai *sa=
i, int dir)
>         regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>                            FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
>
> +       regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
> +                          FSL_SAI_CR2_BCI | FSL_SAI_CR2_BYP, 0);
> +
>         /*
>          * For sai master mode, after several open/close sai,
>          * there will be no frame clock, and can't recover
> --
> 2.50.1
>
