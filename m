Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3931E37FF45
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050915; cv=none; b=o0NCGCF+KVQJ18Y1vyulCbvigFhUckEHRyHuq6rywYYicTVefUVYORFLlxBb3fbA7J6N1U5ZbQcNUQW36150G0CKrnrf7qZjeObwVDIFoLw6l1TT7paSpQWJA0Kc5tGiNR8Mm5OZBNfK0L4n9SQfolPDr30GBkQQAYsB6ojeYpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050915; c=relaxed/simple;
	bh=9nc5Yb9Ey5V1/5wY5YpYIHYPLoHq/9oLwfxwaQMf34o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZxOQ6VwuCZvSUrvEoYcjXyQzowfCsxyBZqrASyf+zoP9FAPhhxj86EVeOftTZXCw9I+4lFf4fU4s/Ue1MXX0FgKWy4Py1+CddCv4sTb3Omj3FyVZXQU4Jq2PZdJzkoXuLMvToqOQUM7LRlfe2E6ObFb8OPDFC4KykTNgoiyDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On8twFI7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On8twFI7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e2cb21520so979556e87.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 08:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050911; x=1770655711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6So5Xq258WzvuB3Waej1vRyM0kWGAajf74EAt3sWHG0=;
        b=On8twFI7EU2/S2JDFowvEq++EKhZw3NzRavb9TkkW+8Vz40EF6Z/xSdXAjjktOnZuB
         dgh5j4oJZuMMnh5DHSpq7Xnej9kngirIPoJoA/h8PYh5/LZEWREFB5QZWpZ+szWVP9Tm
         0UOHml6xiJeQViptwzUmcyTEoLjbyO2R2ByBjwbPkVQK/QKkurQII8DaESXsFH+KXIB3
         oSLAeyqwls+VEtxefDelYadTUiZU/6np3sNvZaFU7QGjuVsqZ9JBCbWOru/TjbGOTmmg
         qkbOB5Ck2xQJKHLnIVEXLJNAaWXtRbBwilYzsDo9BsMCqHDTUp4MUZ/weof0FAnYWILu
         v9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050911; x=1770655711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6So5Xq258WzvuB3Waej1vRyM0kWGAajf74EAt3sWHG0=;
        b=mC6uT54FeHQ0PLyouzqwAiBD8PgQowGOhptnSBjAwW8q404PDtTjT4LEdkEPdgCspl
         ySQVzRy2IvaYC+03O1EhUkfT4QdwKER/PwmLf+hJZf7kE9lhd/9dIy9TOT7DCCiaZJRc
         va4MsKl5WdjhL9xHM25rBcMP/9Vlcw1Xvl7APHLJYsu6mndDjJaCB/poqhNnyAkXFnIS
         8fLDWfsdJ87un1PORZ5zAHC//UtBfd9n+w2MLG+5/eJ9qlHybvV0BuCk4aP3MYIINmCw
         r2ru9Smkp5K9T6nmkKH/CjsxjT8szf/fOc86OjIQJJdXAuQ/ymyBEYHy5ISSPSclPmpg
         NN/A==
X-Gm-Message-State: AOJu0Yzcf8wzOkEZ7kVpNMJ5gSmc++00gJkZ53JTxgoQ0Cjz5zGyxwJp
	9OTxpBYEmwyiyyoa1wwLZJhfvDGe5uo75aKc0oBZZCvpL+lXSOnCNwna
X-Gm-Gg: AZuq6aLzWo/2gItY9moe0OPxRgPP1dKqLbiualpVcH+NjfzBRn3KYexXBPOOgNv64/f
	T0GK+nNX4qonG0hQbCjVi/rBMO3RsoqRGXCRVwnwLEfJtVHUrVoQBwV6P992LPv8pdSX2khhy7r
	ZJTW3n+KpZ34H3PbUs/xTq0WPNjhOdNr5sAMWP1zUQKBhBozyZzLQOnGpM/U1DL2OSDT/Bf8/ZT
	SPooRnPckhbNEcSBQadiZLbu2FVDs4bJ9Bu2op98jE2gDshuG8eHUJZNJfNzSfTUhRYdzObyqyY
	FObbtlzxmRbXUfvk6riEvhh9MNvTX8HoQTr8QJ+xeZyxEmEVZ0FVFK7uULYVhrT8tkZBqWVUtq9
	Wtg9x8yGAi7ETAm+ncob3bsV0HlKqoUbXhKgxk+/Wwia5WCg7/7vTugPvPLl3m6IwkGTlWkyhFj
	UZLCpTRsURQDTXb6UJFOShQMqBALshiVvnhqiZHiVEvVV6x/Klp4TgSKkN7rXL3rFu48ttDDivB
	evDVoKUFBzAElSISmiQRtbfB3srk/LfLSMKk0C62eVSfXI=
X-Received: by 2002:a05:6512:128a:b0:59d:d22b:8d30 with SMTP id 2adb3069b0e04-59e164329femr4784423e87.33.1770050911061;
        Mon, 02 Feb 2026 08:48:31 -0800 (PST)
Received: from ?IPV6:2001:999:700:7c7d:ca87:d71e:154f:6316? (n7ka2o5f47ode54rg9i-1.v6.elisa-mobile.fi. [2001:999:700:7c7d:ca87:d71e:154f:6316])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bc9b0sm3650331e87.91.2026.02.02.08.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:48:30 -0800 (PST)
Message-ID: <ffcbbe3b-3a1b-4986-8b4c-b0f7e309ccbb@gmail.com>
Date: Mon, 2 Feb 2026 18:49:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: ti: davinci-mcasp: Streamline pdir behavior
 across rx & tx streams
To: Sen Wang <sen@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-4-sen@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20260130051045.1898892-4-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/01/2026 07:10, Sen Wang wrote:
> Simplify the mcasp_set_clk_pdir caller convention in start/stop stream
> function, to make it so that set_clk_pdir gets called regardless when
> stream starts and also disables when stream ends.
> 
> Functionality-wise, everything remains the same as the previously skipped
> calls are now either correctly configured
> (when McASP is SND_SOC_DAIFMT_BP_FC - pdir needs to be enabled)
> or called with a bitmask of zero (when McASP is SND_SOC_DAIFMT_BC_FC - pdir
> gets disabled).
> 
> On brief regarding McASP Clock and Frame sync configurations, refer to [0].
> 
> [0]:TRM Section 12.1.1.4.2 https://www.ti.com/lit/ug/sprujd4a/sprujd4a.pdf
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index aa14fc1c8011..4f8a2ce6ce78 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -235,8 +235,8 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>  	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
>  		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
>  		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
> -		mcasp_set_clk_pdir(mcasp, true);
>  	}
> +	mcasp_set_clk_pdir(mcasp, true);
>  
>  	/* Activate serializer(s) */
>  	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
> @@ -311,10 +311,10 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
>  	 * In synchronous mode stop the TX clocks if no other stream is
>  	 * running
>  	 */
> -	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams) {
> -		mcasp_set_clk_pdir(mcasp, false);
> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams)
>  		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
> -	}
> +	if (!mcasp->streams)
> +		mcasp_set_clk_pdir(mcasp, false);

I'm not sure about this, but the sequence should be preserved, PDIR
change first.

>  
>  	mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, 0);
>  	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
> @@ -340,7 +340,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
>  	 */
>  	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
>  		val =  TXHCLKRST | TXCLKRST | TXFSRST;
> -	else
> +	if (!mcasp->streams)
>  		mcasp_set_clk_pdir(mcasp, false);
>  
>  

-- 
Péter

