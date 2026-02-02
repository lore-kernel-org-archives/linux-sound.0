Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F53563D4
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050473; cv=none; b=NjBzYHI03F/eHmFDFe6timGoJeSEdyh7vv/+gFOGOBuCyEluJGbLdFbaAN2fvUrYU7a936nGcilCdiPgIt2ohkno7Fa3MZrlQqXHB8SLJZcA75OSQYtQabEmDshQWNhgNNLvHOLLygoZ4fuISGQtO32Gi9WQiLotfRyNnBQRe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050473; c=relaxed/simple;
	bh=KShGaT1qgrVmzBvsExwPDJ7IJ5x4aX4qzzVujJIQm3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7A65s2GccnPASWNXu9UIEGkE4WCsFsB3Qd4t5OVHjYs3NLIOVROktWgLyfKt0fQCcpTeBrBKcBLlfh78nnV9+md/WJZEvqaYRN2V4iu8w1BF83Z45RjJ8qF35ICEd7ovDN7HhUaHc77D9kSt9e9EtEg8DEGGhrjJbQGkA2aYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcZmKp/x; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcZmKp/x"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso4880566e87.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050470; x=1770655270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKZpya53ePP94vNtf7vtbWwSUdhjwrNT/p0Fq+u4v78=;
        b=bcZmKp/xQAozATxueY0J8buk23c3urSljaA63ltTIIcyOmYM6VvBoB6cHt2RXe/kNM
         UAYdl6AVgY+1qXUnSz2U3ZcY5lCTjxKlrNbiTHRrieRD69PKwEwr0uiGA073XW3ObrKz
         y1Qe9pfx3RDfNyK17mi1NIozlGhu/fF1X0GIxGp9rp4N98C73JFF+6/0O3dOShEM1Wf5
         KFtdjU5NtrzT/lfFhsymGt7viooTN30f+iPjwRfFml+OZ+S7DOpaTIyrzCL+VGp3OJGi
         U7JmkB1wyiN7MdGifEbfs9wWIOWA+nqAEV3IhIU9m6wQntXB16BKh7KmwvQmalym7T7T
         GJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050470; x=1770655270;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKZpya53ePP94vNtf7vtbWwSUdhjwrNT/p0Fq+u4v78=;
        b=JqKokj+X1HOsbljBbzA+40XO657h4/uZHbDL0nOQC8hW7tJ/ad3uveJBIV3LM5qtb9
         l+595WLZsGp6OMK1pNLwU1YRltO8WESbqO8xUj/s/L+RwuhHp1SIeLm6NiCvY5OSGmth
         MDwFD+4gcLKBbNazx5vH3/OfRAujqxd7zNaxOPELlK9RbiXRa0sqTL7QEakoZ+7OcibD
         QmAateSkYD4eA9k7JGpmuteZymO+SFNbBuBBNLSBLWpMABDj42/EBVZlyLxiXxNOnyhy
         BTFx8tsNaGBywQMwoXLyan9/+1VSzm537al4t7rl2H1bzaz1w4S73ClzKV2OsOrdZxXp
         trrw==
X-Gm-Message-State: AOJu0Yzp2n/XGqkBTnwJMlEF/DSdV9JByVWr40OcKInP5L9iik3x2zki
	jM+vHSeNIKXAgYwDOEF2bvvpJSj0TC+b/ohxQ4QgE43nxaVaeAz3h4Rc
X-Gm-Gg: AZuq6aJlZAEyiOXbNA6Jrpv4blsO91YTz3adoELbyVAybl9Wh9Yey1kB9DBWNPszlnF
	Jdu8CI3JTzWCFOApzgbW9NkxPi4gPbilRocbjkSQ1s/OCQDynVzGyNpVlIveTnNFSGSmt7vAJRp
	ynI4TOIokpqbZ0oKSgHQJWv+TunFBcxBH9FqcGHvIP9Z+8hdoSv9RjkeCv4uMYEbfLrNywQyxEx
	gxujcyvM7GhHku11zo+o5lmrlmOhp6OhQV6lEHV4mUC0O1vtH3eqTnMcAGHLrdQ96kZSPj+8PY4
	UjPro9VqJXhmMo658OxKOeM9UoRT+ESu4d56ZLR9g5lCO/eulk+qjROl7nrc/v+9eJLpdWDnGk5
	Vt94/+pxKNol29LUGd0DY8r4hsGavPkX6bqUFfpFbAzRY/99K2NiL5KZsZ6cdcwP/dt34ZP6L+D
	jewAmd6nIMmL7gq1H4yYnpKQrVrNG1hXQCyHILySSuwk1FK/fnfAOa7w7NseN0PRpBEGvtiyeNQ
	QZhmYhuOsXhQaOiCDch7dv3vkNnsJPeRiGWQOQS5EDeTkw=
X-Received: by 2002:a05:6512:3f1f:b0:595:81eb:5368 with SMTP id 2adb3069b0e04-59e1643285emr4848977e87.39.1770050469254;
        Mon, 02 Feb 2026 08:41:09 -0800 (PST)
Received: from ?IPV6:2001:999:700:7c7d:ca87:d71e:154f:6316? (n7ka2o5f47ode54rg9i-1.v6.elisa-mobile.fi. [2001:999:700:7c7d:ca87:d71e:154f:6316])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074889fasm3676714e87.30.2026.02.02.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:41:08 -0800 (PST)
Message-ID: <eec4df22-f664-45dd-a8e9-97c4714ffaa1@gmail.com>
Date: Mon, 2 Feb 2026 18:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: ti: davinci-mcasp: Disambiguate
 mcasp_is_synchronous function
To: Sen Wang <sen@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-3-sen@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260130051045.1898892-3-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/01/2026 07:10, Sen Wang wrote:
> The current mcasp_is_synchronous() function does more than what it
> proclaims, it also checks if McASP is a frame producer.

True, the naming was not too precise. It is tasked to decide if the TX
clock needs to be enabled for RX operation, which precisely when McASP
is in synchronous mode _and_ it is clock provider.

> Therefore split the original function into two separate ones and
> replace all occurrences with the new equivalent logic. So the functions
> can be re-used when checking async/sync status in light of async mode
> enhancements.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

>
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 621a9d5f9377..aa14fc1c8011 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -179,10 +179,16 @@ static void mcasp_set_ctl_reg(struct
davinci_mcasp *mcasp, u32 ctl_reg, u32 val)
>
>  static bool mcasp_is_synchronous(struct davinci_mcasp *mcasp)
>  {
> -	u32 rxfmctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_RXFMCTL_REG);
>  	u32 aclkxctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_ACLKXCTL_REG);
>
> -	return !(aclkxctl & TX_ASYNC) && rxfmctl & AFSRE;
> +	return !(aclkxctl & TX_ASYNC);
> +}
> +
> +static bool mcasp_is_frame_producer(struct davinci_mcasp *mcasp)
> +{
> +	u32 rxfmctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_RXFMCTL_REG);
> +
> +	return rxfmctl & AFSRE;
>  }
>
>  static inline void mcasp_set_clk_pdir(struct davinci_mcasp *mcasp,
bool enable)
> @@ -226,7 +232,7 @@ static void mcasp_start_rx(struct davinci_mcasp
*mcasp)
>  	 * synchronously from the transmit clock and frame sync. We need to make
>  	 * sure that the TX signlas are enabled when starting reception.
>  	 */
> -	if (mcasp_is_synchronous(mcasp)) {
> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
>  		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
>  		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
>  		mcasp_set_clk_pdir(mcasp, true);
> @@ -239,7 +245,7 @@ static void mcasp_start_rx(struct davinci_mcasp
*mcasp)
>  	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, RXSMRST);
>  	/* Release Frame Sync generator */
>  	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, RXFSRST);
> -	if (mcasp_is_synchronous(mcasp))
> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp))
>  		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXFSRST);
>
>  	/* enable receive IRQs */
> @@ -305,7 +311,7 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
>  	 * In synchronous mode stop the TX clocks if no other stream is
>  	 * running
>  	 */
> -	if (mcasp_is_synchronous(mcasp) && !mcasp->streams) {
> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) &&
!mcasp->streams) {
>  		mcasp_set_clk_pdir(mcasp, false);
>  		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
>  	}
> @@ -332,7 +338,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
>  	 * In synchronous mode keep TX clocks running if the capture stream is
>  	 * still running.
>  	 */
> -	if (mcasp_is_synchronous(mcasp) && mcasp->streams)
> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) &&
mcasp->streams)
>  		val =  TXHCLKRST | TXCLKRST | TXFSRST;
>  	else
>  		mcasp_set_clk_pdir(mcasp, false);
> @@ -1041,7 +1047,8 @@ static int mcasp_i2s_hw_param(struct
davinci_mcasp *mcasp, int stream,
>  		 * not running already we need to configure the TX slots in
>  		 * order to have correct FSX on the bus
>  		 */
> -		if (mcasp_is_synchronous(mcasp) && !mcasp->channels)
> +		if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) &&
> +		    !mcasp->channels)
>  			mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG,
>  				       FSXMOD(total_slots), FSXMOD(0x1FF));
>  	}
-- 
Péter

