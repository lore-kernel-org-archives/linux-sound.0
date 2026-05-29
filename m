Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BDC3BCD21;
	Fri, 29 May 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046514; cv=none; b=gF8CrFaxA7sQvZK/YkfKTenF3AFCsDGepWqZgE1e3Nqdsp9lLNhyd+8NbGydtfS/LF+x0dAjbeGfqIX/6KEIaDqH56OF0ThwcBezkV+5Gmky8yqvkawr+Caq0TvqeftAo38kLF5fnsc1kpiH4QJDpIN5RRK9Ifb8k+F3JNLKbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046514; c=relaxed/simple;
	bh=Noamqn6zfjS1zp50LV+Ze7iB8DfoAawei9zA3VWezAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvOXTsQvN6B1SFW5mpoqgLD+kx8BSiOTdQNG2C+iSGjTSdt6l0w2rdb+MrW9ibP7mAdVIEiMArLshk32hIxWgNWCCEAG6cfWf+zem0eLSg1Vfj3h2UBPE1pAKspTWqb5og3kGXViu7CqiQB3yNOce9FOYrQvoO1csfjaz5B14K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8/wX8ya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8/wX8ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A97C1F0089A;
	Fri, 29 May 2026 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780046512;
	bh=URAm25BpcfH+MJ/3jqio7OXT3NwLezv3H50Eqja7FMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j8/wX8ya3tGZwfFrg4IWB9rdazMJOYKxTcKmcuiUansaIfmt1zCT5m8LvZeFiowr1
	 zmdPNQtpvTWPK3iH5EGcOtwLZcMK7qaLQ+OjDx3Etn97TIQMcppNIPdLRxRLvlJMPC
	 foN6WnFuskTHTemkWNj3uMqAkKzqsjMYtOHEeluWDs74IhuyYC7H6FgIjJhUp/VdnE
	 SI4sJU2VHkGIYUlnI+O/YRMEQhDx+rrtCOgA+pJKtLET89DYXVcwdbHaqjOb/vioGH
	 nB5q6dyOaynMveMT5gXiPzDClB9u5sR/n6s8aapMTb7HlHmzx7+hk13Qhodd6lzQTq
	 1fQPTUVFF2ySw==
Message-ID: <c5591024-0d8e-4c41-9e35-56689fa94731@kernel.org>
Date: Fri, 29 May 2026 11:21:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl_sai: Fix 32 slots TDM broken by integer shift
 UB in xMR write
To: Chancel Liu <chancel.liu@nxp.com>, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, stable@vger.kernel.org
References: <20260529085020.3727790-1-chancel.liu@nxp.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260529085020.3727790-1-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/05/2026 à 10:50, Chancel Liu a écrit :
> When configuring 32 slots TDM (channels == slots == 32), the xMR
> (Mask Register) write used:
> ~0UL - ((1 << min(channels, slots)) - 1)
> 
> The literal '1' is a signed 32-bit int. Shifting it by 32 positions is
> undefined behaviour which may set this register to 0xFFFFFFFF, masking
> all 32 slots.
> 
> Use 1ULL so the shift is carried out in 64 bits. For 32 slots this
> produces a zero mask after truncation to the 32-bit register:
> ~0ULL - ((1ULL << 32) - 1)
>    = 0xFFFFFFFFFFFFFFFF - (0x100000000 - 1)
>    = 0xFFFFFFFFFFFFFFFF - 0xFFFFFFFF
>    = 0xFFFFFFFF00000000
>    -> Truncates to 0x00000000
> Behaviour for fewer than 32 slots is unchanged.

Why not use macro GENMASK_U32() instead ?

> 
> Fixes: 770f58d7d2c5 ("ASoC: fsl_sai: Support multiple data channel enable bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>   sound/soc/fsl/fsl_sai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index d6dd95680892..821e3bd51b6e 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -797,7 +797,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>   				   FSL_SAI_CR4_FSD_MSTR, FSL_SAI_CR4_FSD_MSTR);
>   
>   	regmap_write(sai->regmap, FSL_SAI_xMR(tx),
> -		     ~0UL - ((1 << min(channels, slots)) - 1));
> +		     ~0ULL - ((1ULL << min(channels, slots)) - 1));
>   
>   	return 0;
>   }

