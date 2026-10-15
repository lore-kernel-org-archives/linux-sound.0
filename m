Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD850AC08
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057306; cv=none; b=VuosnmaLQZWCJ7aknYiEUuQVUCHueEvPbPlk+yuLz92wr2rzUfq9rFOt9AF6fFP1no5zWSwk9kuHqJBYeO29JLXqzomwVMu8yewTDamRiCbDXmiITGHrMeXPBQLshQTtkgJGLGQ2sV4D3KCrILBjSB4/VEMKeKs2zcW52VeMZGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057306; c=relaxed/simple;
	bh=/Ki9vxfgBvgBX6HMaaOOqeTsD5E5MN15hzeNl0k9Wvs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IWMdcZKPrHXvpaI8T7JuTXm1higc02g4WXyYTSpQJRT2CQOCoKVRZzYiJ0UEJ5LrPZ5vjJLVd2QKyPfD8/FeETq3QQFSq/SbLm9L1eSvrZTEgtfJVBW7LZyoO7SMB4bUo+eWaRLLgzDK/Y28Lxb6daO1Aaznmh6PpoCBhwbP6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkDimKSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HN2lBJTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkDimKSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HN2lBJTO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8Ic1j841683
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9YxpSlQU607R7PBFYNpJRuziVPWV8fW0AEQvrrUjfY=; b=VkDimKSlLvxCqb7D
	oL+bwQOmNl6Kj+j2iryG28z1iSMdDG4HBaXsrAlfBip4pSI5t+4NrwBO2VoTGOfF
	ghdNlLz9cW90WwKZEp+fyGTvVru4N2Z79xy6cqwncjNnzQ59C1BywZXWGQUeEFnX
	AnVJ1LsjEspbPgbWmoJcG38CF+TqFi/dnT6ZJhQZi5wm2HVpEJSt6wdVzl2kRAPx
	x8gW2Ar8eqhRdTXq5bdoLe0r2d3+nL8EOauh3VbGFp5RiRkjf4iaTVmlYkQ5fnG0
	JQmjyj6p1e9Us7lEULSnaq0AJMXbY9cI0nVQBf/Z8CvqDssu5zCdZrwuyiMGXF/9
	GINZaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wubv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:41:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbacbb996so819676785a.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057296; x=1792662096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9YxpSlQU607R7PBFYNpJRuziVPWV8fW0AEQvrrUjfY=;
        b=HN2lBJTO1tTdFJv7tH4C/yfjrwG7NH+K3lgrmVp2NcuOsExcel44lcP2QzLdrpj7dK
         OBBxDacVuaeAwuWW98guEAJ8McFBjK74fOjWwtY/jo/xjO2sk/rTgmmZtuo8RcUh7bGm
         zc5Mt8eG1xKbiRMFEmvKbDcBNeUi3HicWQQZCZ5kUucd/uNCXF4aqDm2WyrN+47EH1SN
         NNFHiATKlAQvL862Jd5fbdSPovnKIkLHwCc2yMUXLyoPZiVAUQtsufVzJqm1TWHsZemt
         ks6/2fNLGY385q3xJSYHQ8YYz4g2h7i690SgZPZVNVPRbWO0mlZaLECqCTMFD2Ii9gv6
         Wb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057296; x=1792662096;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9YxpSlQU607R7PBFYNpJRuziVPWV8fW0AEQvrrUjfY=;
        b=khRBOixlITyoAEkHu7kOrbLHpvZQ+w/hAF0qKsoUBUXdW6d7bxp1Kbad9fbOUNOCP0
         Y8jPZ0Lj2eeE3AhHrRdyBDWB/Nr1d43PdzwFhcPD2YMUZ8VPulp5wHBg0SGUP4g1Zm7m
         yTxaB+BV8trbmrUUqv32YZBhY5wW8ljO5v/zRoe2QmzG4iLw/c6oIUe7vVQiiaZYzmeh
         1FoViZPLbQ5uEnvtgiXXjRMtKutrQ+ii3RsuLEUuE26xraow00cRlZMU/k9e8AbX5Ctz
         fpDaiz/04n3WdxObfA5sYPcKsV7icAeQ7qL7NGEw+fmG99JoXPWKGaIq70OUqdORnFiR
         tZ8A==
X-Forwarded-Encrypted: i=1; AKwUvByggfoVjCHMqoE1l49Zk+GrFhQMVcX8f4odR6zu61HaIbCs9E/CXBcTiUi2oYzLwKVuAumyQV5BHTmq8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEnKjQyUTJW2qGK6+bGSm0lnm3hGihA6SmXDhPdWjuv33JOEr8
	OKkCwsQTzE5IeLGviO1JhOMrWEVDRFqnRbR128dseizz65sJfa+O0gDViLe5ZCwRhJM0ssQQ42D
	YpBZu3oU55lCzSqgi6qX1VjpQdU/G0pKKyehu0V0+Nc1AuN1aqdt0WE0vcmbcFUgoTNKzFcLVWQ
	==
X-Gm-Gg: AYBFou2gDujFr9RG6lC3U6gaLcjPoCHOdDsNUSBfcicDEoGv6emn36j28+NrHu5W/Jh
	HHlxnJbYURDAPw1wAJLnnVAJiFDUV67l0S8caXpqIx++O6q68+Tj4rPtJClCWbZb+QSwzZ6z4cq
	JyY6Nc8sOjjKbXXm8CNQKn+uwV13HygnnZO5TY2+K+gClJ3UeWFTYlONiG56jV88X31uTb95LS7
	8KSmc02nZKkU6JFoQwizAjJP4H8SfDh+Cgrdlfug20Drr4ncO0AntfJZcSutSxJcmAyyQcpNm01
	LO1DgKQ1Svqt3mjQJ+qNbAPle75ZNQ+pR86FSAcMpkZ2m9vZ3jLlp3YlQvfFLF7lDb7pNjbIk1T
	hGRjnyzt/x+bUbVX2x7m0LMSFoQ==
X-Received: by 2002:a05:620a:17a9:b0:93c:61e0:81fb with SMTP id af79cd13be357-93ebd259f1emr2986080685a.46.1792057295917;
        Thu, 15 Oct 2026 02:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93c:61e0:81fb with SMTP id af79cd13be357-93ebd259f1emr2986077385a.46.1792057295271;
        Thu, 15 Oct 2026 02:41:35 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm17447742f8f.43.2026.10.15.02.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:41:34 -0700 (PDT)
Message-ID: <11b37e65-7fc0-4ebc-b4cf-633a40af591f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v9 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
 register
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-8-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-8-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX1VKeUHYbssX5
 PKke+qgZx4pBPWemUM4gxjUrJkmeiH4V1369j/CihmrWsPL2T2NqjFdKfXZa8ezzx0VpSUFBuCM
 LVVO0KZmttvuVpqJVCIARRFvLna4HjM=
X-Proofpoint-ORIG-GUID: ZzqxRhny2XFTZur_1ilbvUOm0u51ykvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX504Q1XmJX7UC
 UY6TSo/hKWwojUTRAcyIfX162fW4mxEJnpBHuXc22uRfVy9D8A3KYW8dV6Sv0s9A9JV3Z8fwWOf
 sX4Xk0VoaeO3zSYMY4iUh678Gj21OUw/yCDzweKzOSdFN9QPM8D78BasbMknuMXexA4p9uX7nrT
 gbtudo7A3aC7zNprccA8ZJ4/oJKTszM9Nk8lRYQjKX50LHEnRgCToygyWMtJF/bmy+LmtHs5uWp
 5SfShicijQuLCRzcCwEEFhPc41ZmK6rKTGk6Uro6FgmUmtv5KJF93O0b18jrgGVqYLbrM4LHkGT
 ZS6QW6ppT1ClKw2f2nBGiiZCd6S81tr4Adfc2mSm/9/QcFLGrGBkj6xF8nLZ3lRfA/pKsrWlixf
 0b6FmlebiHspIa7xjE7A5tM4Gefs5iF50meImMFI6JT8N/Fv5ysL5uUPILUxAYOOJNLJz9GXRj3
 BM9yKASgvPt723vXB+A==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad09fd0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gkgF6A8l21KXIE36n9kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZzqxRhny2XFTZur_1ilbvUOm0u51ykvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Finish the QAIF PCM platform support so streams can be registered, started,
> stopped and serviced by DMA interrupts.
> 
> Register the ASoC component, request the QAIF interrupt and add trigger
> handling to enable or disable DMA and its interrupt sources. Dispatch the
> top-level IRQ status to the AIF and CIF DMA handlers, report period elapsed
> events to ALSA, warn on xrun conditions and stop the stream on bus errors.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qaif-platform.c | 421 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 421 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
> index e24c4252825e..facba3be2d8e 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -35,6 +35,14 @@
>  
>  /* DMA CTL register bit positions */
>  #define QAIF_DMACTL_ENABLE_BIT		BIT(0)
> +
> +/* DMA SHUTDOWN_STATUS register bit positions */
> +#define QAIF_DMA_SHUTDOWN_IN_PROGRESS_BIT	BIT(0)
> +
> +/* DMA shutdown takes ~10 bit clocks (~100us worst case at 8 kHz). */
> +#define QAIF_DMA_SHUTDOWN_POLL_US	10
> +#define QAIF_DMA_SHUTDOWN_TIMEOUT_US	1000
> +
>  #define QAIF_ALL_CLIENTS_MASK		(QAIF_BITMASK_AIF_RDDMA_WRDMA | \
>  					 QAIF_BITMASK_CIF_RDDMA_WRDMA)
>  
> @@ -462,3 +470,416 @@ static int qaif_platform_pcm_new(struct snd_soc_component *component,
>  					    component->dev,
>  					    QAIF_PLATFORM_BUFFER_BYTES_MAX);
>  }
> +
> +static int qaif_platform_irq_op(struct qaif_drv_data *drvdata, int dir,
> +				enum qaif_irq_type irq_type, int idx,
> +				enum qaif_irq_op op)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	unsigned int bit = BIT(idx);
> +	unsigned int val = op == QAIF_IRQ_ENABLE ? bit : 0;
> +	u32 per_reg, err_reg, xrun_reg;
> +	int ret;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
> +		per_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, irq_type)
> +					       : QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, irq_type);
> +		xrun_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, irq_type)
> +						: QAIF_EE_RDDMA_UF_IRQ_EN_REG(v, irq_type);
> +		err_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type)
> +					       : QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, irq_type);
> +	} else {
> +		per_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, irq_type)
> +					       : QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, irq_type);
> +		xrun_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, irq_type)
> +						: QAIF_EE_WRDMA_OF_IRQ_EN_REG(v, irq_type);
> +		err_reg = op == QAIF_IRQ_CLEAR ? QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type)
> +					       : QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, irq_type);
> +	}
> +
> +	if (op == QAIF_IRQ_CLEAR) {
> +		ret = regmap_write(map, per_reg, bit);
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, xrun_reg, bit);
> +		if (ret)
> +			return ret;
> +		return regmap_write(map, err_reg, bit);
> +	}
> +
> +	ret = regmap_write_bits(map, per_reg, bit, val);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write_bits(map, xrun_reg, bit, val);
> +	if (ret)
> +		return ret;
> +	return regmap_write_bits(map, err_reg, bit, val);
> +}
> +
> +static int qaif_platform_pcmops_trigger(struct snd_soc_component *component,
> +					struct snd_pcm_substream *substream,
> +					int cmd)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	int idx = data->dma_reg_idx;
> +	int ret = 0, irq_op_err = 0;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		irq_op_err = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +						  idx, QAIF_IRQ_CLEAR);
> +		if (irq_op_err) {
> +			dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", irq_op_err);
> +			break;
> +		}
> +		ret = regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, QAIF_DMACFG_DYNCLK_BIT);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error enabling dma_dynclk: %d\n", ret);
> +			break;
> +		}
> +		ret = regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, QAIF_DMACTL_ENABLE_BIT);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error enabling DMA: %d\n", ret);
> +			break;
> +		}
> +		irq_op_err = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +						  idx, QAIF_IRQ_ENABLE);
> +		if (irq_op_err)
> +			dev_err(soc_runtime->dev, "error enabling irq regs: %d\n", irq_op_err);

We will endup with DMA running without any interrupts here, error
handling in most code paths seems broken.


> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, 0);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +			break;
> +		}
> +		ret = regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, 0);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
> +		irq_op_err = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +						  idx, QAIF_IRQ_DISABLE);
> +		if (irq_op_err)
> +			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", irq_op_err);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret ? : irq_op_err;
> +}
> +
> +static int qaif_platform_pcmops_sync_stop(struct snd_soc_component *component,
> +					  struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
> +	int idx = data->dma_reg_idx;
> +	unsigned int val;
> +	int ret;
> +
> +	/*
> +	 * Wait for the DMA channel to report shutdown complete before
> +	 * clearing its interrupts, so a fast STOP->START or suspend/resume
> +	 * does not race a channel still shutting down.
> +	 */
> +	ret = regmap_read_poll_timeout(map,
> +				       qaif_dma_shutdown_stat_reg(v, idx,
> +								  substream->stream,
> +								  dai_id),
> +				       val,
> +				       !(val & QAIF_DMA_SHUTDOWN_IN_PROGRESS_BIT),
> +				       QAIF_DMA_SHUTDOWN_POLL_US,
> +				       QAIF_DMA_SHUTDOWN_TIMEOUT_US);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "timeout waiting for DMA shutdown: %d\n", ret);
> +
> +	synchronize_irq(drvdata->audio_qaif_irq);
> +	ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +				   idx, QAIF_IRQ_CLEAR);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error clearing irq regs: %d\n", ret);
> +	return ret;
> +}
> +
> +static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
> +					u32 stat_reg_addr,
> +					u32 clr_reg_addr,
> +					enum qaif_irq_type irq_type,
> +					enum qaif_dma_dir dma_type,
> +					enum qaif_irq irq,
> +					struct snd_pcm_substream **substream)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int reg = 0;
> +	int dma_idx, stream_dma_idx, rv, num_dma, stream_offset, array_size;
> +	u32 mask;
> +	struct snd_pcm_substream *ss;
> +
> +	stream_offset = (dma_type == QAIF_DMA_WRDMA) ?
> +		((irq_type == QAIF_AIF_IRQ) ? v->wrdma_start : v->codec_wrdma_start) : 0;
> +	num_dma = (dma_type == QAIF_DMA_WRDMA) ?
> +		((irq_type == QAIF_AIF_IRQ) ? v->num_wrdma : v->num_codec_wrdma) :
> +		((irq_type == QAIF_AIF_IRQ) ? v->num_rddma : v->num_codec_rddma);
> +	if (!num_dma)
> +		return IRQ_NONE;
Who is going to clear this, you will be getting a strom without a clear.

> +
> +	array_size = (irq_type == QAIF_AIF_IRQ) ?
> +		QAIF_MAX_AIF_DMA_IDX : QAIF_MAX_CIF_DMA_IDX;
> +	if (stream_offset + num_dma > array_size) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"DMA index range %d+%d exceeds substream table %d\n",
> +			stream_offset, num_dma, array_size);
> +		return IRQ_NONE;
Same here?

> +	}
> +	mask = GENMASK(num_dma - 1, 0);
> +
> +	rv = regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
> +	if (rv) {
> +		dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +				    "error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(reg & mask)) {
> +		dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +				     "spurious IRQ: stat reg 0x%x status 0x%x mask 0x%x\n",
> +				     stat_reg_addr, reg, mask);
> +		return IRQ_NONE;
> +	}
> +
> +	if (regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask))
> +		return IRQ_NONE;
We have already read the status bits, If write fails you should report
but still return as handled if not it will be marked as spuious interrupt.

> +
> +	for (dma_idx = 0; dma_idx < num_dma; dma_idx++) {
> +		stream_dma_idx = dma_idx + stream_offset;
> +		ss = READ_ONCE(substream[stream_dma_idx]);
> +		if (!(reg & BIT(dma_idx)) || !ss)
> +			continue;
> +		switch (irq) {
> +		case QAIF_IRQ_PERIOD:
> +			snd_pcm_period_elapsed(ss);
> +			break;
> +		case QAIF_IRQ_OVERFLOW:
> +		case QAIF_IRQ_UNDERFLOW:
> +			dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +					     "QAIF DMA xRun\n");
> +			snd_pcm_stop_xrun(ss);
> +			break;
> +		case QAIF_IRQ_ERROR:
> +			snd_pcm_stop_xrun(ss);
> +			dev_err_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +					    "QAIF bus error\n");
> +			break;
> +		}
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t qaif_aif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
> +{
cif and aif handlers are 90% identical.
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct snd_pcm_substream **ss = drvdata->aif_substream;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
> +					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
> +	return ret;
> +}
> +
> +static irqreturn_t qaif_cif_irq_handler(struct qaif_drv_data *drvdata, u32 status)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct snd_pcm_substream **ss = drvdata->cif_substream;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_OF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_OF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_UF_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_UF_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR, ss);
> +	if (status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA)
> +		ret |= qaif_process_dma_irq(drvdata,
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
> +					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR, ss);
> +	return ret;
> +}
> +
> +static const struct qaif_irq_map qaif_irq_clients[] = {
> +	{ QAIF_CLIENT_ID_AIF_DMA, QAIF_BITMASK_AIF_RDDMA_WRDMA, qaif_aif_irq_handler },
> +	{ QAIF_CLIENT_ID_CIF_DMA, QAIF_BITMASK_CIF_RDDMA_WRDMA, qaif_cif_irq_handler },
> +};
> +
> +static irqreturn_t asoc_platform_qaif_irq(int irq, void *data)
> +{
> +	struct qaif_drv_data *drvdata = data;
> +	const struct qaif_variant *v = drvdata->variant;
> +	u32 summary_irq_status;
> +	int rv, client;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	rv = regmap_read(drvdata->audio_qaif_map, QAIF_SUMMARY_IRQSTAT_REG(v),
> +			 &summary_irq_status);
> +	if (rv) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"error reading from irqstat reg: %d\n", rv);
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(summary_irq_status & QAIF_ALL_CLIENTS_MASK))
> +		return IRQ_NONE;
> +
> +	for (client = 0; client < ARRAY_SIZE(qaif_irq_clients); client++) {
> +		if (summary_irq_status & qaif_irq_clients[client].mask)
> +			ret |= qaif_irq_clients[client].client_irq_handler(drvdata,
> +									   summary_irq_status);
> +	}
> +	return ret;
> +}
> +
> +static const struct snd_soc_component_driver qaif_component_driver = {
> +	.name		= DRV_NAME,
> +	.pcm_new	= qaif_platform_pcm_new,
> +	.open		= qaif_platform_pcmops_open,
> +	.close		= qaif_platform_pcmops_close,
> +	.hw_params	= qaif_platform_pcmops_hw_params,
> +	.hw_free	= qaif_platform_pcmops_hw_free,
> +	.prepare	= qaif_platform_pcmops_prepare,
> +	.trigger	= qaif_platform_pcmops_trigger,
> +	.sync_stop	= qaif_platform_pcmops_sync_stop,
> +	.pointer	= qaif_platform_pcmops_pointer,
> +	.mmap		= qaif_platform_pcmops_mmap,
> +};
> +
> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +	struct of_phandle_args iommu_spec;
> +	u32 sid;
> +	int ret;
> +
> +	if (!drvdata->variant->alloc_stream_dma_idx ||
> +	    !drvdata->variant->free_stream_dma_idx)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Variant missing mandatory callbacks\n");
> +
> +	ret = of_parse_phandle_with_args(pdev->dev.of_node,
> +					 "iommus", "#iommu-cells", 0,
> +					 &iommu_spec);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse iommus property\n");
> +	sid = iommu_spec.args[0];
> +	of_node_put(iommu_spec.np);
> +	drvdata->smmu_csid_bits = sid & QAIF_CSID_MASK;

Can you add a comment what happens if the sid is more than 0x1F ?

> +
> +	/*
> +	 * The DMA base register only holds the low 32 bits of the buffer
> +	 * address, so the coherent buffer must come from the low 32-bit
> +	 * address space.
> +	 */
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to set 32-bit DMA mask\n");
> +
> +	drvdata->audio_qaif_irq = platform_get_irq(pdev, 0);
> +	if (drvdata->audio_qaif_irq < 0)
> +		return dev_err_probe(&pdev->dev, drvdata->audio_qaif_irq,
> +				     "Failed to get IRQ\n");
> +
> +	drvdata->qaif_hw_configured = false;
> +	mutex_init(&drvdata->stream_lock);
> +
> +	ret = devm_request_irq(&pdev->dev, drvdata->audio_qaif_irq,
> +			       asoc_platform_qaif_irq, 0,
> +			       "qaif-irq-audio-core", drvdata);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "irq request failed\n");
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev, &qaif_component_driver, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register platform component\n");
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_platform_register);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) PCM platform driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");
> 

