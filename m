Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA191391E52
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366852; cv=none; b=FyFTjST5p4sTL1Tj+zqgmT0x8HxJqIiSOIjq+3strdaMK3x3Z+q0L/f1hQGa97WzGNnLz+fd00BPjuOJvc5w/khxddFBenrockF1J0CNxkYw+OOc2/xkJPA5pSNCQ3b/mKIk+sBUYdfZjn2dpr6IESQ75H5cOGAZ+/MuSaqJ/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366852; c=relaxed/simple;
	bh=zMI+4zCyrb7LQgeE4kh9a0cBbmnln2wXw7smUdJGXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt7XHwb+oTkUhPkZL3hPlFb/nhaApanbWCQbtVb/TmbWUbKYSK0+u+1jstW+3SXprctE0fVyGT+zCiwMZXXr4ZWHmT8Xc+plJrxpL+Yto7KhDHggJdI0Mvy56vhY34a/OcNawedwf9EEzF4KaEhhK1NTaLOnGwXjTy/U0oDCqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPy+Cw5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FX7y++Lc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPy+Cw5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FX7y++Lc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWTg1873388
	for <linux-sound@vger.kernel.org>; Wed, 7 Oct 2026 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=; b=TPy+Cw5QB2vpNE2i
	5NgyeChwcjy5BH5Kvs3fL1GlKecMT25SK1OkvkoG4gJZmI67XYjtxOSXKkwG8suz
	vtqOuHAisUxjRc0EgL9XgVdyxKJirjBe6+KJjDUs31+Ujt8QPdqIiM6aKSKe9J99
	JNyMTeQoBU0WnyXr1HzrPt3KcIt6iQFEefR6243Q2srU43UuPROUpuVzZAeJtUzv
	d2lmM4Z3MRzZo8ZiOScasAY1IRWOyQRC6tZw8bbBGcMRwT751Q6ELACfjoJakz4Y
	oe4eoVyZD+iRrk4Fxwqdg9lhtWJw/q3ED4a4tbr4cj2Hv0MYd3T9KCz7E+8r/ozI
	vhduDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8ru7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 09:54:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3596609a91.2
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366841; x=1791971641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=FX7y++Lck37L97KppKD2VgKsAGsC6LC2mXh/tSK6hk/ozJ0t9BIFk0hCmfiYu3PuFx
         voJ+lXJHtGeZKUOtuleUSlLwIJ70BJ0aSjmXyN7O+bTRm6PvInleDf6Lx1uvqnTUcA+p
         tvtSvCH068QVQD9dbxnUTvYQyoTaLVMNBMJt9oHDq8M3p4Cb0z8OUmoVmQoNz9gnexTi
         8jZhNq3LxreWW9q0IIuYgitaaSvnUe9/w94fCgBwTqk5F2jGTDBfQX6Hev+WH1Icxy0D
         XKmoHStuL8yMz/VSxM+1ftBR9feMNENEbaXsw4FIftHbvJdnzh8L03lwX+Myvs0SxetR
         /8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366841; x=1791971641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=ACbWjZVLoOmNjb465LFOIgS/a/NsjQsjcOEZOcEEfWvuuHFGOPwBWWPhVPcz0yet31
         fwQ5dCkGOkUj9CAkiXr+kIAHbScBg1cBWwdvtHl0RgbfcONl5Vwf1HTf57XyKriF2URh
         r7R0fkXY541TRMDXqMwSS+DAexUsm0wGN2VbQS0C5wAf5VgDIzsmI2Nu1uYh1Hpcg02s
         3hQYgL/hTm1gEKBYVUu8+L5201CgFSKvVX+5AFWOgC+4WSzb/fP5cYz3h+3JbMcIvxYD
         xLeAnUmnGZVNcMmL9VUk7gBpGCLyNcucYNid89+ln2gupmjlx3DQDXAhtoNoNF8HLs4r
         kErQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqS0zkz6UQ70nokvwlFDaqBk8M2gNPxZj6dN8ZdAcRRhqosFCg05LHDRHAVN/G/kZ84fo1rhV9KKMH3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKErc8HWllNx6jE1TNw4aavmyKkN/MtCfA1XfGsfpBJZg0oWwsy
	xMJUTURuc7sKSoEBtjYK7vP0/gbMib0a2f+q56V9xNpg2EwM1RhlRmcDWtCVwhC8wluYxU3wEE3
	nULNCi19Wx9y1O99WfxizDexapP+BRtGCBW22cw06DGUrwT+/7abYrOj4ChD6s3m44g==
X-Gm-Gg: AYBFou2CV/aQuejQBiHD0vg1A3yOcTAb2u7mZKhOQ9Q24FbSsqYaRNxKowVk74myOLB
	BJ1McnUW+OFuGnbka5GvibhLOcNvYHxVSdKrzvtjP+hNPLQos4PDm0r6S1pNLqvTtc/THzTk0wM
	nVeHenHde40TI6yygrnwWUN3jZ/qwaFMc/AjatV/2ntIiAw3mI/Tk58Cacb2/oQ6TWl+JQy6N9/
	RnXXQDuRIaL28SduskKz8zJiawTI4d+mZa5b1VEvJIv5O865JtQejeXDdEqjbFEbMQ2DdiQULV0
	pBFKSllkVUwt/+AyOpKtX9dS4rbUMClzKaRcOD/3WdzfHx11cK3Ff5WkGukWiYzT5VKgG5w/U2H
	vB+U/rSl8spzJiEeANgx5CEBkkFc=
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437330a91.0.1791366841122;
        Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437320a91.0.1791366840551;
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a60e5166sm1300131a91.4.2026.10.07.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Message-ID: <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:23:52 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ajay.nandam@oss.qualcomm.com
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX/SnmvJbnWzwv
 lMSKRhPqx9/OfPU+B30l0ETC6ctWKsnZ9WLmsw7bPJP2PLAO+VuSRKea2gnKHFiirOk7dZB33Qb
 mQjDePmqEnnwGOKg3Rk3Tak+rRUL8SM=
X-Proofpoint-ORIG-GUID: jKwnqUr2tbI9Mt9uDiaXcA1D7I9u7t9m
X-Proofpoint-GUID: jKwnqUr2tbI9Mt9uDiaXcA1D7I9u7t9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX+Q2F4hTTeF/P
 0XHOiUNIc/pPmcZEDT/Y32HHgsPppG7oLY46dkMAOVe4gjmNNld6hUwUEgAEA69Alt9TxktTi7C
 Bil5eprKWFD1kQPgvOA41ZRDYC3KYHvSNHEJMXIlX3GRQ9kilLyNmtggcjowg7UUHSl5zrLQpkP
 dvjqmE9z5WzRuCp9kHktezHBIUkvC0NnjBl/Lvmfc8CGMEtwaydwvbKgPkGYUtRslkd8C+SXTNS
 WyeKDIjScQ1HvFfy03KpUguCOOncc18EHqQtdq+3pAnXbvoC4qz20jW3sNuaeogTUtcbk8p7ym+
 4Z81BRxiq2XAUyMs6GidMqDhHJvMTY49qNmtvY8hK5SCO+18gZXZiTRG52wYkyn0EoOEXdoz/Qt
 /13MJm78MFbIuPmxn4KoDIUnhe/l7GailtJjSIGDKZmh4Ufg7keXf80G8neNA9DWu4jtf13w2mc
 hUPr9iEByR7yCWxaZ1Q==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac616b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TAThrSAKAAAA:8 a=Krqe4lgBS7SFU2rUEjIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-MC multi-channel controller found in
> the CIX SKY1 audio subsystem.
> 
> The controller moves up to 16 channels through a configurable set of
> its 8 data pins, each pin carrying two slots. Wired-out pins may sit
> at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
> and cix,pin-tx-mask. The driver exposes a transmit DAI and a receive
> DAI which can act as clock provider or consumer independently, and
> streams with fewer channels than the wired pins narrow the enabled
> pin mask at runtime.
> 
> The driver registers the dmaengine PCM helper, selects the audio
> reference clock parent for the 8 kHz or 11.025 kHz sample rate family
> and keeps the minimum functional-clock to bit-clock ratio required
> for safe clock domain crossing, with an extra margin cycle when the
> bit clock is sourced externally. Runtime and system suspend/resume
> restore the registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +static void cdns_i2s_mc_rxtx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on,
> +				    u8 pin_mask, u32 strobe, u32 sync_rst)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK, pin_mask);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE, pin_mask) | strobe;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, pin_mask);
> +

This patch has the same build issue as the SC driver patch: 
cdns-i2s-mc.c uses FIELD_PREP() but does not include <linux/bitfield.h>.

ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_mc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

After cdns_i2s_mc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path also calls 
pm_runtime_put_noidle(), but that will not run the runtime suspend 
callback, so the clocks enabled  manually above remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effect.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
