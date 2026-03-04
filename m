Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092833689E
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629872; cv=none; b=gQRsqPdNnbq4i3b49WOS4aN7Qy50WrCFyGFjQCIQKLb3OWep3XP1B5TOi19N+DEKazO77cbivVyU5LdJEt0XW1GzmdS/ByJfDQ2IwS6ZPoYiglOmL/f+OFoillp+TMBN6mwZSy9xiIy4hkkprokfxMXprBBuQ4bz309UYgZzZMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629872; c=relaxed/simple;
	bh=R7NNq0TYpafNVIR4YBQJYswkPA7OfWitp7rnUJrG5Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jooB5xIPl/ONHuXtEqR45GkvpEh0/caz0riePS2IeObk5cvEqc6v1CgWbwvkkosmJtCDYHTaJdLgY2TPVD98Vz1kNtedASUifRRdef8eDE6WmxWjSPMcwMN6WdnmB43cfqqRcsXLjE0gUByfrsCx6jRpC55ob1smAv/JnrRD8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4MADDEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahD2t2fG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4MADDEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahD2t2fG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Cb18R957024
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=; b=B4MADDEGUiKPawTq
	pYH3SaK1KQkMvMfEpEF/97MNIUQuZ8OwXADe3zKNg+wBIWa7ABJ8V8YXuUgbtBXx
	ty5/mYQHzmfau6Kt3PYIRfwRn99+dgQaN1a/YmQN3vc/h9IL/7v4NV1aWjnM/d9E
	Apsi8Kb+2Nux9su0/gfPWzbjryJakZ9N03ic//z92NI/3EVcT7u0KQzh0t83XUzV
	dLNCo1FtmVo3XLbNnOkJiFEgEJG4Spq/7JRe/5qGhIaaa3ADwVDF2v2uAZBU2Y4n
	VvEQzeiXlZLl/9h7KCag0phfoT+94lsv6DTMSPO3D132u6FE6ZuC142NTLzOvMG/
	dFbb9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgaxtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:11:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899edf01747so296201586d6.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629869; x=1773234669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=;
        b=ahD2t2fG+VQ744EimdGpQW/bJojdlXJqLbc8IyAEFIGvvGIi/5uSdwBHr9TjB4yw0D
         DaxAg2dHtT/EeWu/0lixIJnRX4kr8wyN64/pmfun3hkPd7fmDxWhGTaP2+HnL24zkVSY
         u1W67vYCQGAP37rXLV238fgM1MpRVOZIJcyIloXcYZMtEVp+xYiyjwlKLuJ2qddieffd
         MOWPFo220xiy5t1HGR9N/Lj+qZw+6zsKVLVS9dMQfyitC6opI7VH79nbnhgKv9EqxK2N
         PAp3T41hCvxwjibFD69oRxIV3W+5ZoMbfUikKxw/KM2NcKNk0F99YrA/3k9QeBe32JbN
         zyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629869; x=1773234669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=;
        b=vZxDUbl26Y/Rmin6nBtlfjvsp9qWpmYUnxIqH0m2fYCF1GzA/Dkaik3s+ihoEeAKHz
         uGaGTb+Xqf+wLmzVJuZoY/JtFiq0L+SfYQWk3u+YqFouuZLRtZCBx+/YOKYaU6LNhHSM
         SEOklUwApy9sgzxy2Jo62XVACD+7xzNvY1PW9VkjW/gj1zUmF+gQP7Brmp+5Lol0Yvgd
         cVEIB08K4+gTFrUAwBU61pakDpVb0JJwKWgMtj+f0Pbu5idduOXiUrj5HSpxJiwkvqVD
         zKtd1FDsmylTAvQJhe3PAP0/i7c+4qPYmcNpYT+fsReqAMNK8H5Wl25beWjmWbRNC8gz
         W0qA==
X-Gm-Message-State: AOJu0Yx/S47FNC/Z07D4NMxJWeiYRJKAdwS2mZpELESsjP5lrif5aCM2
	7VCY8gupy41MGyfj1JvTpwBOPo3x27ohjNRTJWlG5w6OGlaOsW4KyYNJnerDc1iUrnvLiTHYwlM
	yUw0UwDzI1zLVJfcTgesRIqcOdtm9+RZoNt/zhoilhu9IxQVma1J3r5WVZZlLRKDf1w==
X-Gm-Gg: ATEYQzwQbf7WmCE8ghmAGdiybI16SsEBnJJ1a8asy1XuY/I4bM0MCXYG3FwKFapIZUg
	KTRhKt9VMWTSyzzSSzzqtomat+9CnNV/F8kYraKFISgyV2qkxaK9CwEv1KXIw4aibDqA4/qNyjF
	9FCjC2FZ7ebQGmxTmtRLoYNQjjQWC89sl08X167/3i5HNJZDIyM/4s8vhC7sVrGzzhvz973Twvn
	aSU7viOeBq2N7GBbYtHzHozfyMg3+3KKEFTxnNYpE/XPE9xrrh1Xfft1va0uFE3JXuaNScWKfIk
	Ld4eUYYu/mC8xokBAY6Qi9mFnaoeIMweqZQhCvpmKqw+N94fOugqOqNpke0I8EgN8o1BvF6tB84
	vi/8a5BcoGarjiGV8VhjABvwGTMcz/UTb9vUt6cG0Pjnbjx6P
X-Received: by 2002:a05:620a:4892:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cd5afc7fa0mr214196785a.76.1772629869352;
        Wed, 04 Mar 2026 05:11:09 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cd5afc7fa0mr214192885a.76.1772629868823;
        Wed, 04 Mar 2026 05:11:08 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851883a012sm98913855e9.3.2026.03.04.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 05:11:08 -0800 (PST)
Message-ID: <968169e5-59c4-476b-b656-cc10049dcfdc@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 13:11:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: qcom: qdsp6: Fix q6apm remove ordering during
 ADSP stop and start
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNiBTYWx0ZWRfX8Vuq3md/V0Qk
 5XCh9hM8XbE8Md6flLm9ZpStNroZsMItBfEFmCx1Sq6YALYGFzFmZ5WmkNftoXra6wq4RwZ+Fu6
 U5INHDFGyiC9RC31lkPLuS6FU0J5rRyocngQv707RXVEwU5WGG5ecEs0k13OG+L0PK8xUoIOuTf
 fyar9434LQA+Xy8O2rDzESdz3pWsV83O8vl8T7ektUKvaAjDcyCOfwIj1u5/5Scx2u7PF71OIVW
 Yz9dltbuxs8l6wV65qKLYD9rsYBBlntkIWFcmS+M6f/a6L9dujwJKjzjWwOHWgqJw/OGUbeRXuI
 re/7Ta32izyW/ebkolaIGNOqk6QajMPcQ1NC84u0mZAYHqALTfb9zJMdAY6+3jRX4VPXCYjpx9S
 n4aaHqjul4sRyG8j5wikNY8wqoZzLYn+o5zCtNMAeO7Vvqyqyd+IxRWeCj0EHvLHCF+rZ+VGP8z
 iSf2ewPxsoicXqWRGcg==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a82f6e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lunvCU_K9DOFleREHiQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: J1vyZd5oTzp4DNapMG6H_Y9twkYi6qlo
X-Proofpoint-GUID: J1vyZd5oTzp4DNapMG6H_Y9twkYi6qlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040106

Thanks Ravi for fixing this,
On 2/27/26 2:45 PM, Ravi Hothi wrote:
> During ADSP stop and start, the kernel crashes due to the order in which
> ASoC components are removed.
> 
> On ADSP stop, the q6apm-audio .remove callback unloads topology and removes
> PCM runtimes during ASoC teardown. This deletes the RTDs that contain the
> q6apm DAI components before their removal pass runs, leaving those
> components still linked to the card and causing crashes on the next rebind.
> 
> Fix this by ensuring that all dependent (child) components are removed
> first, and the q6apm component is removed last.
> 
> [   48.105720] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000d0
> [   48.114763] Mem abort info:...
...
this has been an issue for a long time, hopefully with this patch, we
can get the card rebind working audioreach with all the lpass codecs.

> Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 1 +
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
>  sound/soc/qcom/qdsp6/q6apm.c            | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index de3bdac3e791..168c166c960d 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -838,6 +838,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
>  	.ack		= q6apm_dai_ack,
>  	.compress_ops	= &q6apm_dai_compress_ops,
>  	.use_dai_pcm_id = true,
> +	.remove_order   = SND_SOC_COMP_ORDER_EARLY,
>  };
>  
>  static int q6apm_dai_probe(struct platform_device *pdev)
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 528756f1332b..5be37eeea329 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -278,6 +278,7 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
>  	.be_pcm_base = AUDIOREACH_BE_PCM_BASE,
>  	.use_dai_pcm_id = true,
> +	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
>  };
>  
>  static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 44841fde3856..970b08c89bb3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -715,6 +715,7 @@ static const struct snd_soc_component_driver q6apm_audio_component = {
>  	.name		= APM_AUDIO_DRV_NAME,
>  	.probe		= q6apm_audio_probe,
>  	.remove		= q6apm_audio_remove,
> +	.remove_order   = SND_SOC_COMP_ORDER_LAST,
>  };
>  
>  static int apm_probe(gpr_device_t *gdev)

