Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554DB2797BE
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828204; cv=none; b=E8wupJsPCsZgYVeUNgHiGXXyafqgFMOFvzsPCAFEwekvXBFvTaZeWrhtgacO/bFxseL9nIkpxOz0Edvtb9Zl+lssMK7mpAdMtybXwlJ+HAgl+ph5tg3J86MxgHy0WCFauhOu6i0biK8bMzzL7+cX348takC1GFCQCbMfl7+lyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828204; c=relaxed/simple;
	bh=HUwN6R/4tVh/ExqTefIAfV1dIeuXHTwkllgb8kq8E9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nlPzW1p48qMvcCA6KAMmpinTml/i6ZuM8Jj4s5cd4Y1/pUrVuKIlSkvDjE0Yjiqkz1VnGYHbEkMwoeVDwrtxWSuSs4dzfNYdnA74ThP0Sc9sT61DL1vfysj068dA/DyftLlG3kGTH4wSaapZLsvTnNCehABzmKkljpUR4Zq9P+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yVbJ5/nL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yVbJ5/nL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3fa528f127fso4450208f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759828199; x=1760432999; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=yVbJ5/nLDGDGB0gHUZX6JErE+oFibZ1DRbAU5cZ4Ge4DS+ZE6IabjnOre0qc7LCKU4
         P8qHWW8lqpeu11cyaU5LztBA6SjQG9UfMXj50WIIZ53G2i9znIANs6zoqZJ3Rgaqgqs2
         mckBF4Fejz1DLrLTnnImiPwTg6Z9wK5FSoXcRmXI7jf3Rj/XSgXcwizKGz3wpbht2rfE
         s44JAjEND8FOOsfDWYsXwn0toD1u9PvO0FYS2gj25L09vWHS/G0Vlcs+F/LLLeUnRt19
         xuPoRfMdrcJ9S+JP1VeQcepJnC2bCJenMKzQX6wAUqd5HENItOFQa8F9dX2ZttrJtLhi
         no3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828199; x=1760432999;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=EL0tFq11rBqbcnb5OsyJBPCO2gf0HvJPoqXDP1l660HkOlMA2VJzGhKXOPi58sv02t
         BRgmQ8/DKD365/eIjjL0LneAacwwlkyJOwO/RowFqyMBsr/S/kqMlFQwHvS3VwGz3L/s
         yP9KMswphXT+WJH9jFp+Rep1jza3tGiIZJg5GxqASR1TaSqszCVoxe5lWAtYWE+nZX09
         Z1rsm0eQ9dm7wk8yjWARdCx3j/ppej9KdWHhiGpeR7yogolLTHbPA4EQ1TbVZrBXAs8+
         PXKAnf7MXPvfeFREF7/mxCW+R5V8wRLj6TaHWcdgLodXsqcfrpW8Kl//h7lHASwWRQiH
         wzCg==
X-Forwarded-Encrypted: i=1; AJvYcCVj/Dycf6FF2XkICZSqdR59o3k0ot1C8QRw05o8VhOZwThUU/BZFsVKFxoOe6d+oV+lwNMJam6dBc6ZxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYQGhCDdP0y+nh0x98//XCCKjr7MmlnY3UbIdIbqRDhJUb2Bj
	GQWED0mcLGecYQcVx/EzBzVVmxWFcBgzSCWXphJdn0wUq6esrdw0hJ9NGtv9wgP+RXU=
X-Gm-Gg: ASbGncthsHx39GG2AyO7gVw3eTntG3B58pXP7CfjSxXWhGUyjcI6z30JlJxFB3dQNxc
	U9qEoB7URqUaS19R4z/JVGDHKvDKC+3aM2hevSP04NSy4XMORhkYZfS31aD3yz+vOVmni8KtS7e
	y79FbvIpsiG+vJ6/ZfWelrSz1FCY9JXbMUsKPh6IVek/hkWEfIR4kwCs/qplQEIah+j/j/rOyny
	FUIrN3wkeDAS5JH0exBW1HO3k15SGrYZZUqKoNJ4ttivb50jEIlrx6GJBq/ZUg58DaRoEBxqScL
	eqsQN+NclOxgz6pZjBXEnqDoqEs62nleBSj/+bDSByys4Ij/9sLCAVEW0BCK6TTX5YabaPgFcSZ
	Tznf+X0ONCiCFcV2UJhILvkhNNRioURIvmnTjviUnL/pfYA==
X-Google-Smtp-Source: AGHT+IF130TGahKPPoII82+V1/81eeS1iNZCVCSTkdS9QhSxObU5gtpJPCiviLrBgBxmw1J7M2QzJw==
X-Received: by 2002:a05:6000:26d1:b0:3ec:db87:ff53 with SMTP id ffacd0b85a97d-425829bf154mr1925989f8f.12.1759828198634;
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:513d:7ba9:7d81:1c37])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm24412592f8f.44.2025.10.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  vsetti@baylibre.com,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
In-Reply-To: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
	(Valerio Setti via's message of "Tue, 07 Oct 2025 00:12:19 +0200")
References: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 07 Oct 2025 11:09:57 +0200
Message-ID: <1jplaz3wnu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 07 Oct 2025 at 00:12, Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org> wrote:

> From: Valerio Setti <vsetti@baylibre.com>
>
> According to I2S specs audio data is sampled on the rising edge of the
> clock and it can change on the falling one. When operating in normal mode
> this SoC behaves the opposite so a clock polarity inversion is required
> in this case.
>
> This was tested on an OdroidC2 (Amlogic S905 SoC) board.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Tested on the libretech cc s905x (GXL)

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index a0dd914c8ed13616fbcbc0828e36418cfd255391..3b4061508c18047fe8d6f3f98061720f8ce238f2 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -236,8 +236,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	    inv == SND_SOC_DAIFMT_IB_IF)
>  		val |= AIU_CLK_CTRL_LRCLK_INVERT;
>  
> -	if (inv == SND_SOC_DAIFMT_IB_NF ||
> -	    inv == SND_SOC_DAIFMT_IB_IF)
> +	/*
> +	 * The SoC changes data on the rising edge of the bitclock
> +	 * so an inversion of the bitclock is required in normal mode
> +	 */
> +	if (inv == SND_SOC_DAIFMT_NB_NF ||
> +	    inv == SND_SOC_DAIFMT_NB_IF)
>  		val |= AIU_CLK_CTRL_AOCLK_INVERT;
>  
>  	/* Signal skew */
> @@ -328,4 +332,3 @@ const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
>  	.startup	= aiu_encoder_i2s_startup,
>  	.shutdown	= aiu_encoder_i2s_shutdown,
>  };
> -
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20251006-fix-i2s-polarity-d744338fa223
>
> Best regards,

-- 
Jerome
