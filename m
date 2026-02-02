Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAC288C20
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051684; cv=none; b=ra7DSawpH9Uy8xptn24s88TCBeD7PrgFIMv5TjgHaFnuNi0BhCxPP3Q8duEr8ZJHlzlOQpNkBN0dtrkP3NmUhor101BV3BapHsp8PezM64a8bq6QgdGm9eEikgOAS5XZhw1eHPO7/MwVGVNOC15+r7gbW+WXckK6eiTO3AVCxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051684; c=relaxed/simple;
	bh=LtvoHqnysD1zGYNutc4CejPWz9ZTHU2Nh66lqyyYhTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4hsfn2OW6+PmCJhQwDm/khSKsv90SvmEJ3O5acm1ID+HArFxxI7B/mEMjtWFZdKK3fsj6VX/mGB2ddRceND+2tJ1E3OqNamIsroBSCCW/iYEgxoW3rGd9Fng1il+BMeBycX0x7EMeLC63xZIxtNrCB9VYI29mnL9VXM3AhPnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3YfkSIh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3YfkSIh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so4819326e87.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770051681; x=1770656481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ppJ+s5yD8OpOfsCawBEF1Fn1W+ZwaOrmnxykM3fGoI=;
        b=G3YfkSIhgpO2DU7pGKspLuJYzH1ncijTeXopmA1zaZD39svyPmkiPO2U9CsaK5U9D2
         D93DPWFHBmb/471NOQnMb3sB1K4b2H/Ltg16VpdxU/lABZqtgcJVcBT7jZI/0UWGbp7Q
         9rJZ7zHbriluKasGCIdpmqnrlwGajMucu6Y8on7gG7wGeXEhZsjXW46hFxYJDZsp2rao
         woAUGfVLZxGIR+XkmpannAa9ZcMlT3jxCDDb2PqgY7LZhOzlvt07NpL2T97heEmb2K3k
         YR9cs05b23hgO06w4VIijpl2gq3ud0BukDbAiRxRblGSvyACVdi4iTmbl5upg85QFdXt
         kZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051681; x=1770656481;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ppJ+s5yD8OpOfsCawBEF1Fn1W+ZwaOrmnxykM3fGoI=;
        b=REbkEEcv7CutL2WxhhRot365w+fSTG+73mfiv3mr1ZROpTTjx7Natak9Gf5l1NnM83
         u7BjvnIIZuFDy/SPRIKbMe7on/QTO1N6suxiD4dtQMVA7HVF/7WZpr+l3OCtjinzwKO8
         vDKaUHuQ6QNEOQpsnrCkpbQoj9TmaNTwqwiNhzmvYyJNq2rxjJ3rbaCzOfHFwALPZW4T
         7vrWb+FbN/Ux3KAFSCMQIOmXruVReLIieH/1oHy0T8TtjKb/WPJ9v/hqO9HqzZSG0JIL
         cxb/oGPucMyWKIzngJxYg4+Z8WONzxeEkZrLwmAV9gye+eXIcJCf5NLQmjaxWZQaPmv6
         gh7A==
X-Gm-Message-State: AOJu0YwxFMrQQpywaPBrD5UTVuwE/fszkGOlMTc83fpZ6HdZ/VbUZC5/
	nDP+/PFCEkBoaqPVD2k34ahk0Efgt6HuOTZrN88W+sZ4z9QVFmmyEBBX
X-Gm-Gg: AZuq6aIAZCUMoZLq9/XGxwlhGgM3Y9yTCnROH9JfytNOITZS8RRqU00bw+hRGYoSXNW
	ZdIxG5VDWTENNT2MacXoNtOmHZzCrWGJJXdPn24IwW4B+sOGpUyoHNJDaTEYnjtoGhpXPB874Zd
	vEXon9cSOnN5x1A+Q8qTGjCMBybS8EqlM/s3JHrt1FLVERxhX5wFjf4aCw1DqGReDO6d23KeHpu
	AarIQsY07y7/nrzDu2beGqEOt0SvMdbPh/BaQ5ifX7fKSFYWJyxPkobaEp9Xrmi/BeJdpKGSV7l
	PP0JfA0zeL8bAcMC5ocAq0gqlOFW/t0RXzT4hgPU9MK7NJdfrnW1cu5uhFr2gPkad7Lb04hU4Im
	SozOE4oT7kXipOh4DycrYpzrivEvtXc5X8sCBu/oeqb9zFjyOXAcu49P12Dy2DA2qovwB/kT+J+
	w3lAHkYZx0M47wIp94uBnD4YyPKxZwLQOhMfyA06KVISlAZInOiog1sDZ78K9EumPmMK5NsL3dn
	aAIiP1krzXA3kVEU4Gewmp92AsQE5Cp6+Il
X-Received: by 2002:a05:6512:3192:b0:59b:af7b:9ac1 with SMTP id 2adb3069b0e04-59e163ffc29mr4714394e87.4.1770051680463;
        Mon, 02 Feb 2026 09:01:20 -0800 (PST)
Received: from ?IPV6:2001:999:700:7c7d:ca87:d71e:154f:6316? (n7ka2o5f47ode54rg9i-1.v6.elisa-mobile.fi. [2001:999:700:7c7d:ca87:d71e:154f:6316])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7033sm3618294e87.68.2026.02.02.09.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:01:19 -0800 (PST)
Message-ID: <d7ed59c4-2262-4cd5-978f-e9e5c0e8a9a9@gmail.com>
Date: Mon, 2 Feb 2026 19:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: ti: davinci-mcasp: Add asynchronous mode
 support
To: Sen Wang <sen@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-5-sen@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260130051045.1898892-5-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/01/2026 07:10, Sen Wang wrote:
> McASP has dedicated clock & frame sync registers for both transmit
> and receive. Currently McASP driver only supports synchronous behavior and
> couples both TX & RX settings.
> 
> Add logic that enables asynchronous mode via ti,async-mode property. In
> async mode, playback & record can be done simultaneously with different
> audio configurations (tdm slots, tdm width, audio bit depth).
> 
> Note the ability to have different tx/rx DSP formats (i2s, dsp_a, etc.),
> while possible in hardware, remains to be a gap as it require changes
> to the corresponding machine driver interface.
> 
> Existing IIS (sync mode) and DIT mode logic remains mostly unchanged.
> Exceptions are IIS mode logic that previously assumed sync mode, which has
> now been made aware of the distinction. And shared logic across all modes
> also now checks for McASP tx/rx-specific driver attributes. Those
> attributes have been populated according to the original extent, ensuring
> no divergence in functionality.
> 
> Constraints no longer applicable for async mode are skipped.
> Clock selection options have also been added to include rx/tx-only clk_ids,
> exposing independent configuration via the machine driver as well.
> 
> Note that asynchronous mode is not applicable for McASP in DIT mode,
> which is a transmitter-only mode to interface w/ self-clocking formats.
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
>  include/linux/platform_data/davinci_asp.h |   3 +-
>  sound/soc/ti/davinci-mcasp.c              | 487 +++++++++++++++++-----
>  sound/soc/ti/davinci-mcasp.h              |  10 +
>  3 files changed, 398 insertions(+), 102 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
>

  static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>  {
>  	if (mcasp->rxnumevt) {	/* enable FIFO */
> @@ -230,13 +288,17 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>  	/*
>  	 * When ASYNC == 0 the transmit and receive sections operate
>  	 * synchronously from the transmit clock and frame sync. We need to make
> -	 * sure that the TX signlas are enabled when starting reception.
> +	 * sure that the TX signals are enabled when starting reception.
> +	 * Else set pin to be output when McASP is the master

In new code - while it might not match with old code - use producer
instead of master.

Otherwise it looks nice, I trust you have tested the sync and DIT mode.

With this nitpick addressed:
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

-- 
Péter

