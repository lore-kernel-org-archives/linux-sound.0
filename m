Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75281175A5
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751437; cv=none; b=t2+K2v033znNNsTuODHY2X/21tdJgQdXgTZuof+Qnt8vEvaY3n00e9r1ywH8Yb9R6e+GyGiMZbLBiSbED/dQQssd5qNQYjnq5VHq0N8o71u8YbLbkkTx1+VVJjV41MiagzaHOwtSqJh6PpasU1mleFose8n6dNOnvB3sxaLo5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751437; c=relaxed/simple;
	bh=6K+hDVKgR/A8gG7Z4rZd9s6ZIUJSqvT8uo2z7D8yeyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV/dktMq2SHH+Ekua5YGPE9oeE5cosFrtrmgkaFY1w7WbwfbhrMxAtk+BtRSFLAgmBDhKsUCHlnRq409gVyrD8aX9WZdk3VH0ZeGJih0YC0fFEz18zm32ZYUWL3khKlGiql+wjWEsItHu0JwI98t9nQ8SDNCn3CRq6ubCfbfyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElqMUT5K; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElqMUT5K"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12a747e7b2fso1672018c88.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774751435; x=1775356235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWoEFZeXzAfHScXSbUpKdtpd/rRPYmJCJzi67lItf1g=;
        b=ElqMUT5Kg9wUpNjLi9zQuCT6eY9nCIKAKahq0xlhnLgGoB6b0UiF1zZdFL/4+X63fR
         Kpj6zZ6eBoR4tcYdhBe/fcO10NXFOg1f/V/kGQeTk3nixl7UXVke8bllXdV01R5yfW8d
         7moJC6gQhfNm+X9a0TdZCd7OcI0B9rT9EWUxZwMtWviaMyCsUezAA2hBscZ6aqRtGhZT
         2Jb+zviV85xVN955NCOHKGG3t7VbCoIOfyajsyA6ui+a4ZWP6/G/xh4bKmewGguKwFcD
         tb0BtBUxWfobxYY6thFEQve6nXI64O+yD1c9gNB0mOmq2cwGlvz+ikS2SRigMqGv0dQD
         clVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774751435; x=1775356235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWoEFZeXzAfHScXSbUpKdtpd/rRPYmJCJzi67lItf1g=;
        b=dNv0BaA9zSr6VHwD0cH6uUTgDt95hpUMPsZGmq1Wxgi00c8x04zg7zzkE4EPuiEQMx
         nYT3UiGwuDLbOMifY63wHKFBZHeIB85TekKiM9co4nP8fQKCKF1ugSQL0uB9CixM2QUv
         HQjtJP+LwxVYDppLCYFRe64f+ciKVou8UhCcSbtvS1VJmrM8oTEjbbspwDU0KTQQXf7W
         VBjtJx8kaxl2+mByX9sy90QuCAZmTakS4QsvPf9OaSvE0xtHK3DBZ9YNPe6KL77dJEpL
         YAfWJtMs90DhidAVKsGIlAtIajQWg4JX7uGiq+yhIXbXjd0S+M0hd3lzedekjozglY2i
         ymKw==
X-Forwarded-Encrypted: i=1; AJvYcCVi++6NZZawJPIA5KmsjB9Sa0SiEqChSVgvPP0/I7vv36BPXHYkAo/e5vpNe4pSCpzefGnMkPQGk5QH1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2chdy3lVFq9V7kvoDEv+dRTPcdbxGKlJzHI6v9O+HXmxwznJv
	iEnvQ2ObPocm7zOxnM80iGl3/sdE0Gnd2VnV5mp4t1houekV6CadqGVq
X-Gm-Gg: ATEYQzynVOnVfYQyYr1IE4L4xfEFY77ZgCGnDNfBxhfKV31RvAJRUoqAQMz44rZr68B
	uR0YuRNgbyKlYGMvmS8bZcoYuyfxhfVgOFMGhEnfR6Oq2mSGB4AY8Yjp0qn790pBi3NEYKXABUd
	2DQYP6QTtzy8Rye0oG7cPLCNLFfXPW/QjYaptnCyXGUC2n82G1w+2lSZwx1C8zqzm+pXwHq63+0
	RTeAgeWPskIxjfI70ec2+T3m3cX4HT4KH7eUJW11NxNP4xK1V3vUyxUSWLBxXuyOep0oUVT8g/6
	HF/d4IilOkMRNV+7Nr1etQKM/IBb1hy2Jfd0KephqUSRgmXHCuivtqwknsm37Q+fy8E+ikcbnSC
	Hoqr1948naPxe4SgnTzyQG6UPV/HvNRC2SRBtlipBEtqn4BvZ5bT9HIPwimZra86wJEQud2z4cD
	/3ZBqQMnx/kA==
X-Received: by 2002:a05:7022:ea26:b0:128:cc34:35fc with SMTP id a92af1059eb24-12ab28969fcmr4416692c88.16.1774751435424;
        Sat, 28 Mar 2026 19:30:35 -0700 (PDT)
Received: from geday ([2804:7f2:800b:214c::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cad88sm3748024c88.1.2026.03.28.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 19:30:34 -0700 (PDT)
Date: Sat, 28 Mar 2026 23:30:29 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Gilson Marquato =?utf-8?Q?J=C3=BAnior?= <gilsonmandalogo@hotmail.com>
Cc: "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Message-ID: <aciOxZ-3YSnmsxlc@geday>
References: <PH7P223MB0552EDAF94ECC3D28F066E90B355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7P223MB0552EDAF94ECC3D28F066E90B355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>

Hi Gilson,

On Sun, Mar 29, 2026 at 01:34:16AM +0000, Gilson Marquato Júnior wrote:
> From 37071560173aadb81a52ae2ba1587b6581e1164c Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Gilson=20Marquato=20J=C3=BAnior?=
>  <gilsonmandalogo@hotmail.com>
> Date: Sun, 29 Mar 2026 00:22:03 +0000
> Subject: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>

On first glance it seems to me you have copy-pasted a mbox file into
your MUA instead of properly importing it. Please fix and resend.

Thanks,
Geraldo Nascimento

> The HP Laptop 15-fc0xxx (subsystem ID 0x103c8dc9) has an internal
> DMIC connected to the AMD ACP6x audio coprocessor. Add a DMI quirk
> entry so the internal microphone is properly detected on this model.
> 
> Tested on HP Laptop 15-fc0237ns with Fedora 43 (kernel 6.19.9).
> 
> Signed-off-by: Gilson Marquato Júnior <gilsonmandalogo@hotmail.com>
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 6f1c105ca..4c0acdad1 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
>  };
>  
>  static const struct dmi_system_id yc_acp_quirk_table[] = {
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15-fc0xxx"),
> +		}
> +	},
>  	{
>  		.driver_data = &acp6x_card,
>  		.matches = {
> -- 
> 2.53.0
> 
> 
