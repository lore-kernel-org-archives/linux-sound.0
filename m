Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10D495038
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056956; cv=none; b=V8TW92gcPynYxKefjPPO84hot7Yr+5g/nmY26Ec3D9UxQEYJafprXNBrgtNevWpp2arubo/O8z42dFzebuSfleUP95cccKH8fQEbbqCOQQtGjE5EqfCKmTZfzVlqKDYgbk5QJclwXtM2emMGN16jaNlbKWRXcWyNXP3S67PrhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056956; c=relaxed/simple;
	bh=UTGrp+lZOAxLFmkLKsLGysXMTNUwZ9BjO56kp90DTuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfIrVPo6EI0JPFrr4kDLEBI9Bc5NNrey4L8i0gGFW6yXOgHFRxbOIZOPDtvPKniUrpeMMVfiaqIb2tdRDc5wGnYHk+PhXrHVk1H4ynhemNqMOyQYOlqnwl95TzhwEG9iidb6PpdJOV4oQyIFwZFLIDdo7N13IoVDuWZ5WQHOxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHJqr6rJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHJqr6rJ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a02551822eso634019a91.1
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056953; x=1790661753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=RHJqr6rJLj0ADth1Gzp5fs7TVlYaC7iSRvFWsxRrSNeRF6snO6Up+q95yCrg867gd9
         tQ4uKmHVb6DER5yYJ5H4pIBlmQ7nN2T2nY+y+1k3rJI7rj1O/LPvgk0Kr3W0gzv31vdD
         shVbdE/5qVAHh2Fvojwki2cvkqBVWU42VSP0Dh+ESW7hTCdZDGkoJXPrlUnU9VYC7OBx
         w7XXdC60ihivG1UepRyAtbd9Z7dr0JY4TLT0Ncp7TzXDeeQNCoj4nafLsoYPwoW6Un/l
         RaJF+obAZuhob7uMBCXhII99hMXCrrh05xN6bEHkwkPOxenCCv3unmuuPkoJ3kfoTbrQ
         AYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056953; x=1790661753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=yiyuzb+KKpmeZvaM+qpxrg5H84ULfQNdYTXuSxQxK4Rnr6Cjptg+XBd3nCFXiTrf54
         qKOggS2zLthF4U3TUtIczO+KBzjlcYWd6A+XsVSIArHa360EXbF3FJnT5WteAE66y2dl
         schauSN6ZTNIOuwEFuIHfaHyK6KWp6l3OYaIKmRkc7R4o24gG4yLi+JC4WxRAEhkH/lH
         I0GdGfVrcZh3DRLJ7r1iQhTHvun0dA+oBQF/VdzISTRRVbFvmxB52fjflI3dqIv1avwo
         PhPD3124GKmUJA1p/Y/zsxO6MQtDAUxUtvIluoVYwCpYqJ1Vqr1GrlEkv7wsIuYaGj4n
         x6nw==
X-Forwarded-Encrypted: i=1; AKwUvBxaIxYALkkYD0XFlARKyVUVtaXc4L3XOhKDMBUY5dv9E+7Br4P5j1zIijW1opYXQYuubQx3vVdyL/nsmw==@vger.kernel.org
X-Gm-Message-State: AFuF++nlyIGj/KXI37uUhV8A05y/1UYZfs3qWMo/hV7x36AgTqenAYO9
	VzYsks818WsgDBeSiMLG2wyNpSLTfDZAYbyyKdPrlRDHU/KiidVLMiHp
X-Gm-Gg: AYBFou2njkqAe9iEUkdtyv6FQfR/S3WFOtQaqH2tYNgA2y9KUAuWNCMu2a/AIBB7R3A
	rfO0s2+Esaaz4Y1iukk2hM4MvaBhrIJlaWm6FKaz6gqkL6kTwreubb+7+qChpML7ZPWS/ci1ATo
	/tDwyCyGnBZiBJp3Zwcjk8xjV7v/fK11+JXSMAUiBz2ca4u2temq5Iuc6hONK1gVecx5kb2GO9y
	YsA29LPyyAtLyQF/7QlV/j1FGfDdY0i/SSl28324PNwKRUHXMPsaB6DZ+Kzu+l4p+cPexRG1js4
	bQbR/eqBGtHv9aCNIt7szz3Zavouirbm5uvmsGNZLS89jH9MEdJvYz8BAKNmHLRZTTXi8uObv61
	S25xT6VLQCYZs70G1JUR1w5k742f2v5NOyUrVibqtb33vkb4Xnmn9qqbPAOetR/NLEkliH5psa/
	XyeoMuPgx65lZAaAl5phYhuOBsOuoJCSZLEGsa4HN45SfWPCB/aYNep3m2pKDVHW0QNato8uBEp
	qOZ2YcReRnoVAEAQW8=
X-Received: by 2002:a17:90b:3fcc:b0:39d:e78d:32d2 with SMTP id 98e67ed59e1d1-3a0730cbed4mr111836a91.13.1790056953102;
        Mon, 21 Sep 2026 23:02:33 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm3366245eec.30.2026.09.21.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:02:32 -0700 (PDT)
Message-ID: <976f828a-bf48-4788-adb1-7204c27dda60@gmail.com>
Date: Tue, 22 Sep 2026 14:02:24 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
>   easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   easrc-1 -- ASRC1-Playback / ASRC1-Capture
>   easrc-2 -- ASRC2-Playback / ASRC2-Capture
>   easrc-3 -- ASRC3-Playback / ASRC3-Capture
> 
> easrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original, including IEC958 subframe support on the capture side. Update
> the devm_snd_soc_register_component() call to register all four DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

