Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631AE514751
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681820; cv=none; b=CRVbSfi3LqjUtlzI0t7mMhl49S1luA136aIAHg0acCSnz7Q/eXoJQn5P5pPCreyFz3RxWTy4uyQtjVj1CHcWJdWhdYDXWBB8Q1+0QZpTQSMGDgY6FOcBCbxUigrqVIHiw0C0XDJqdf4aZa2acVPzRyw8qcvTQRWSVWduzy68FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681820; c=relaxed/simple;
	bh=zXnsbRUpJLdDkFSNdTwSTBWPW2RKhE+1cP9ym8jpSU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkxzevzH6/338FKUX7s35de8eZmqwUiToG4lD/oskqUGVgpf+XKKXO2XFnQdDsaGpkORkU6o3JSwdz17WmC/tvYDEdA8xPfn0R8Hc/RZDJNGNCBV6dlTzoRK+WsnmXESqXbqByjOFzEI4uOnHJkcFkPdd2nlmnn3W2XorfIhp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plRcbAVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T12mp6zs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plRcbAVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T12mp6zs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAijH73655170
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 11:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=; b=plRcbAVgQ6EaoeBA
	DqCfD/SlIt63TkQ0jcIYB+FxoroofNmn4Ft+ozWjZElKR0uEpnk+bcI8mZuW53qg
	G5k5sG0SZz82R9J8eamxXKFGAp7vg4fBmI2EhXzP8JEXpvbpEEbx+GtFwzh1egpp
	K3jbFbfNYaQFgJg+EqryYgHvcxhISJAQY18L4f7yR4YZzUvUDcmH+lr8yGe66kTf
	SlMEU3Eoii39cd8hqDf6ebRM3Rzr8Zyf5tGX5DrA9VoObsb6itZAQVA9fK8dXZI5
	hHdcJV0q63dT69EU/CoOyk3pj7G8KsGcBF1T/zDI/BfpK36OQCpSqtGeFUMG7Fsu
	fd+n9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1g85v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 11:36:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so44664795ad.2
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681817; x=1791286617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=;
        b=T12mp6zseqQ4eFb9D9ls+WDpYVOpO02N2cqGioPlw2WZLMm4S3SOBHsfyFZRvLlcQm
         wgu25zdV9PwCJuWPbVSpvN4kVMNvFD9mmlg+XnCBzLfgd0fRteB4yeNCAZ5z3FEVj4nG
         lVeg+1fhez0soAm3Aky7UV7/Xrjvtao9u8yhdxM5XEx3Pps7JPadY9TibRDHCCumX2EJ
         4Sh5oNWCqiR7nTs/3WQw7p84OheRvg67EuMVAj98n121gk7S7pd0gRC0fWrLVzJ9mzP3
         0Vdw4AtoDoG8RqCeB/9uXGCad8z7CEFPPWJoiIzDQuObKgvnxJyMwQOM5FQUO8y+n4Gh
         hDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681817; x=1791286617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXTQZXvyvmSCkCy/r9CFX47tXuGMoFqofSuvA1lJ7nA=;
        b=lyxCDr4rHyjJdx+WbEQrZ8qzWd+h+Xby3xX4oUL9C03g843SD/8PteDSL7TlY8N0bZ
         2AuC6EqctJRx0b3OR/dG89iqG8CLChcsF/JPc4qX/fqyMMdEfgyclBhSVjFFwWuStrYM
         wjKM6D0ApHo6f6Fue8s2PZu21CtvJd3iALLaKlms7K1htwWBUhFbErfOfwjTG7SaPreo
         qgBnnkDGWMHRobDQb//qvYR79B8PD67SL4SM4b/9AalGhOncdsT4PBpQYXbFWqTjjFiq
         4wA6L1WiRVo7nE7WpsBGxibnQpssWBRoEXnLDiJU9ge4qrxRJz2YrwsXiAuXriT3LkPA
         RGkg==
X-Forwarded-Encrypted: i=1; AKwUvBzAeD5n8VML6q4hrnf34jrlL+8YwdYwDpc2TK71CVN8YF9nyiT1ahm6dAvqZY1KHA35Yy/1ys56lFBC/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLIIz3s4KlX6qKxm/psa7eJRXZXNQ9h8iRYQMIr37feBsS1SQ11
	ZDAt8PQT7sfbDWKoaRYju+GGhWp3MBduu5cORkc7115QWFjVQKD4dmej1RcD1WdJm6O6ZbYhDxA
	u95t+1YmTTmx6HOpR0GJRIOsiY0mW1gM6TLqh19LaUOpxA2xLKk1AOrFTTyYOA7jBZQ==
X-Gm-Gg: AYBFou2e2EEYk6If/8VLY82Uqyrvi8af45+sRfS/d6UkON9vsmFHuNW+oOEy2hN1vCW
	DE62+OOF/aV0un0tJqVQPA77XYVyt+R3CV42sKl3jw5vSn9J/AFqKO2rHhgXM5+tiNQlsVFEo3A
	tGN7/YKBS90bsTyA5b5u9E5KPJzkyi5ZxLQDTrE8ORi+dhmFKpxtHhk9xfh5oI8pUV2tg683L0S
	rmhVhezSJf5KH8GgRBdPcqa2V8Xh0tBkCw/Cfr25yEztem0Rw1xxpQ5HAWdnPoWUr26XFnZa+Iy
	kRyM+F7oxXCgHi+C7+JmmSCfQvAHGM2QUmlS8Dx3IUME6Qa3rjZ4HG7pwqS8pZdFEJiS21kqFCa
	pHgeXKZ6eGjMzCOIqrtHKF1JSx6Q=
X-Received: by 2002:a17:902:ce84:b0:2df:90d4:1185 with SMTP id d9443c01a7336-2df90d41ad1mr113254915ad.10.1790681816837;
        Tue, 29 Sep 2026 04:36:56 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2df:90d4:1185 with SMTP id d9443c01a7336-2df90d41ad1mr113254625ad.10.1790681816300;
        Tue, 29 Sep 2026 04:36:56 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90c03890sm55353715ad.0.2026.09.29.04.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:36:55 -0700 (PDT)
Message-ID: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform
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
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX4Qw0xgX11WfY
 3ZG6n6nzWxeja6f6U1F4OgPfd9OeUpyjeTld52Hr6QZCeY9P0AH1H7BznZVTw9sQl+1h/hItVAu
 jH375M+frklqk3lDRzEsvfOKZxPFxbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX1Uov4BDix8kW
 RCMaq1Bjdqw5u1l8neuUfR2ZNfl316JT+ivek7ZbcBGkaGNlGw/ZbHe7ywbrXLQmqArvpLpchLI
 lxgnceURONXikAtpEywvuOgwFT+uVyQYZAz68OXYtokp/lSQiEz4q+4HEiaMBEintU5xRTAzldc
 oxWr4xNvmNeB/UuYKUOUueZmAcbOaq0Vx40A8waXijjjz2KfbPCWitXbQENae+E8PLYB9gzHwgm
 gpJZypmgqISWvl6PRV1EZR+4SKsbKt4orPgOnuUrkwkMCh28fL5uWSvAtrHffsDp6+vDoSOtcJ7
 FR4j7SBwVSsqXbHPaQLiOZ8GH5DRikBtObjfjTsVPE/Wz1yEhVWmy1JSY2Cj57JFW2t1rBMMqSG
 Dl70uJ/gzyRnXE+ZHt0Te0WfGCMYzfZF0rBKzX5LXCd+UrnAn6Ofd/seDJNy+5wsCxXlXYKGL0g
 QNzig2eitAQxaHDiHSw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abba2d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=drLfthholnaMhx7I328A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ce5CFufasqp8WbUMKx6ZUiZ3dFeAMHL7
X-Proofpoint-GUID: ce5CFufasqp8WbUMKx6ZUiZ3dFeAMHL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_update_bits(map,
> +					 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACTL_ENABLE_BIT, 0);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +			return ret;
> +		}
> +		ret = regmap_update_bits(map,
> +					 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +					 QAIF_DMACFG_DYNCLK_BIT, 0);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);

Should this preserve the first error while still attempting the 
IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT` 
fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret` 
is overwritten and the trigger callback returns 0.

> +		ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> +					   idx, QAIF_IRQ_DISABLE);
> +		if (ret)
> +			dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> +		break;

The QAIF programming guide's STOP sequences describe one more hardware 
completion step after clearing DMA ENABLE: wait for the relevant DMA 
shutdown status to complete, then clear/disable the associated IRQs. 
This applies to the AIF RDDMA/WRDMA paths and also to the codec 
RDDMA/WRDMA paths.

This patch already has register definitions for the shutdown-status 
registers
(`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()), 
but I do not see them used in this stop path or in `sync_stop()`.

Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
example with `regmap_read_poll_timeout()`, before disabling DYNCLK and 
IRQs? Otherwise a fast STOP->START or suspend/resume path may race with 
a DMA channel that hardware still reports as shutting down.

Thanks
Ajay Kumar Nandam

> +	default:
> +		return -EINVAL;
> +	}
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_sync_stop(struct snd_soc_component *component,
> +					  struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	enum qaif_irq_type irq_type = qaif_is_cif_port(dai_id) ? QAIF_CIF_IRQ : QAIF_AIF_IRQ;
> +	int idx = data->dma_reg_idx;
> +	int ret;
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
> +
> +	array_size = (irq_type == QAIF_AIF_IRQ) ?
> +		QAIF_MAX_AIF_DMA_IDX : QAIF_MAX_CIF_DMA_IDX;
> +	if (stream_offset + num_dma > array_size) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"DMA index range %d+%d exceeds substream table %d\n",
> +			stream_offset, num_dma, array_size);
> +		return IRQ_NONE;
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

