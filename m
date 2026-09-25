Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B7459AEE
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324814; cv=none; b=Rl4P/orXk3ScRNzWxNpKRX/NiGP6jON4F/MDxbjyBmPyLp2sN+lziiW7t06nMcjCxwOZYkB9s6qKvHBof4G/pDVTCBqrfyWDNFwEzhNXV0xo41HBRpBlKPXVPSdlsGnYK4iyx3AceOMjFdrhNRQB34mfD0je3GS5fCSolun92k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324814; c=relaxed/simple;
	bh=I0xTLJcttysm4OQV77NT0W7BUgmVg/f0JYMpVCJu1DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsEZ4yHUNN9KrRFBNRJMkZ8XoE/hv+gpGHL8LMxg8NXco1HdiV5BQN/R0QMqdJEx0W41O7MLpuca2s4i5d3//df4HYnP+Km7SkP200Ln6ck5mtrBsWv4j/2ABIQNk/bJJCAhObUFrYMliuaCE0FdeNSwOj828H+haVlYOJRQq9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYjV+kzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuHGu3Ja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYjV+kzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuHGu3Ja"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YkP23532318
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=; b=QYjV+kzXgcrgQOa9
	KvGgQ6r9+TItDH6fy6U76WsSBh4DCSLLC5RizpRJ1w5GMkCWRYyfsQJWMBuyacKe
	d9Pqb+LaynnIeZ7RrLC6eTSA+n/fUlCsXJOvFimE+U1w9Mi38VLbGsGf+xlMHi95
	D0DAkZPbVNxXgipU3Q+0ztfn7+TNR88cxZaC5BttQCXHFHLOZhrYvsIOnDbdodpo
	g36UdIl6uhBGv3qYuyhEbitMADplXyyNXVC/Q3mXuVrA8QyMax5lmxGaxMjH3UH9
	2KU/NzQ23trSgbynsEosuBe5E+CrGtTEApks4ggcvH9hxF8CjwAXQfgXpam4MC1r
	5G34Sg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kacsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:26:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9143947f839so3177936d6.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324810; x=1790929610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=;
        b=CuHGu3JaNvZDJjIKwFrqnmLnVzZ0uu+gonpT8/LSwY8Ymo196dfN0EwGqhfA1npLWs
         MHN51XDL0lH+adp9nZGKkwAbel/xcNZHnu3Mh2YmivVb/RyzsrZi5dDOC8uMefKE6KWB
         zOz7vLOKKv3MXnXcIsyRCF3lcsXFzY1O3OljI+XzbIrFaxH/7b/5G+OI9TKu4jOgvDkm
         DtHOcG/46S2OoAMuMYM0TikH33fRMFMXnhna8cprnuyoLUr42syTITCAYY59j9o7MDUZ
         yynMVBXcrheYNLg0037Aw9ypYWXSTUP9JvHjm8gLLBzCkes++yDBWuAMeeEneJIdDnr8
         FUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324810; x=1790929610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=;
        b=AjFIpBde4s/pfKFFmg6LGhV/lVCK/EF68LIW5HQCb7uVqLhCwj3fa6LVcVHAGkh23O
         DA9afqmUcY3SJPR0aMdXFgjOGIzK0AaLB9wjGa9rz3uFVrsI4oQ9ZjSTztnrxWggp7to
         qIf+rQPpoVzI7a5cmyOvl4+85XXCmCTlMuYwU4vxbrzw/mKyEyh+dSQVn6gd/o9TIf6E
         ad/YMxKWrhghxFvynXJNUz07DnMMquxGIfE/PsoPnj+5OXxVjexlHpwKoR6wiNVudDeF
         lXQuaig4tt2pIjWun8W6dofWOylIFIoMyYXM8C8UJzvQS9lMU6kXRBivCjwBn7Dx10UW
         e9zA==
X-Gm-Message-State: AFuF++mvRmkjX/e139K2MRez4NyNnA8LYHi3/5eZMswUU7I30EHNNTi3
	LRNbTWHcgfo9ck98zlZTy0SALNSnNPAuOZ59hjMulaCSh7hUWjy+qOWRqaz5MZqzW/F7AtZttO+
	FM4jc8//FGxHg9F6UGn7/Lxnxg5AAGdVso9Zbeqg1rqCTMG724SrUUbh3wM2x219Bww==
X-Gm-Gg: AYBFou1/tiq112yxnmVVLHD9jEfvmzTTdZ7Rg21qK1CsW3JLa6pT+1Cab0HgRiMbc4D
	9yq1gszbedv9rX2Kemf+i06NEcEqKn3DWyeEJq2E8EM0cV9Un77QBRRuRCMl2GTO6QSxAcKLi9S
	HbThHHgIr2eRi2ICtoUar3s/C594G/j1zupyl4l7mMBsqBPwiE6/mll+ziRGFWNRSWghCV7zS9U
	S4ToVhZ8AH4dG56uQYNX3z74aB8V3AE+GrapdUzwhUn7Fsq7VgY5cVX34uvDe6MoI2uoutxASjg
	Xeij5956UsLISiVQtyuX56nKCWc+AeH3yCC9M4rAslaCurZMv/9xEDRyiO3o/thlndbP0AWcImk
	/ZEw9MeLOKW8nCOTrQ/IzTJA09Q==
X-Received: by 2002:a05:620a:d8e:b0:93b:d79b:9a5c with SMTP id af79cd13be357-93c43d2cf3emr301266685a.61.1790324810254;
        Fri, 25 Sep 2026 01:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:93b:d79b:9a5c with SMTP id af79cd13be357-93c43d2cf3emr301265485a.61.1790324809763;
        Fri, 25 Sep 2026 01:26:49 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd786dsm692972a12.17.2026.09.25.01.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:26:48 -0700 (PDT)
Message-ID: <00ebf8ae-784b-4053-b58f-43c1fdd50be6@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-4-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-4-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6304b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NEDl_gcYw-WbHvIBNB4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: PvV9epkYf_6iyXK-jJ1sUeP0mEG1Cc1V
X-Proofpoint-ORIG-GUID: PvV9epkYf_6iyXK-jJ1sUeP0mEG1Cc1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXxYwUC4yL43EA
 sJDzSVYAX5yEvggK3x1UprLnO9oOhw4YWR0wqm4aLNaLSGstU7p16XyMmiQb8X3n+ozU29eMaXR
 OqgW9bwuUSGyNilTMBzx01qlmlVWSC6epXJbgwNqOv48j06W8WK36Ai8HKICGar2r44UoFVy5Gf
 47NV1899Grhzi0NhhqD9k3jTIea3X/Zt39P3svvemEvIJ4nYsJFNhmRSwADayZ78AIUD5xwX6rV
 dwbsOYah0HUmCZOZocABZr8rvEbd3fanx5EAIxAGWWKLfWu4vhyMUi/wGUtNQwIZzuV+iJPX4wF
 LFcyYSLn9XX25IwJArFLeKXnQfOgOYUbzIdyzpCM92k3Ud6kLejiVhFQ4nBokdRGQ4wwPBEiE8T
 JW2XD1Ikn8UbkXRgiyg9Rnk+sjRvKYe6Obc6daeQprADCAlw+eHDhi3tJRbRo6M04ESx5yL2laN
 /m6TkK5HmoVJbCjcbnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXz2ftYKi958ss
 ri3wf5nt1mLMVaFCLheLsQcsmNywwn0iwPmNfqk1gN+ShHj+rkLOw57L0ueVqDIhl435knChLAS
 Pez92aU5NFLNXoOUhRjndyBXOj43xJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The cs35l36 codec needs the codec dai and component sysclk to be set
> during TDM startup. Set these for all codec DAIs on the QUATERNARY_TDM
> path, gracefully handling codecs that don't support sysclk by ignoring
> -ENOTSUPP returns.
> 
> Based on work of Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>


It was unusal to see codec needing both dai and component callbacks to
set the sysclk correctly, it could have done with one.. but did not look
into details.. Or may be its me hitting this type for first time.

Otherwise it looks good to me.


Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>


> ---
>  sound/soc/qcom/sdm845.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 59cfa3b26cd4d..f0fbec9c8df25 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -407,16 +407,38 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
>  					dev_err(rtd->dev,
>  						"Right TDM slot err:%d\n", ret);
>  					return ret;
>  				}
>  			}
> +
> +			/* Set codec sysclk needed by codecs like cs35l36. */
> +			ret = snd_soc_dai_set_sysclk(codec_dai, 0,
> +						     TDM_BCLK_RATE,
> +						     SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret != -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec dai sysclk: %d\n",
> +					ret);
> +				return ret;
> +			}
> +
> +			ret = snd_soc_component_set_sysclk(codec_dai->component,
> +							   0, 0,
> +							   TDM_BCLK_RATE,
> +							   SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret != -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec component sysclk: %d\n",
> +					ret);
> +				return ret;
> +			}
>  		}
>  		break;
>  	case SLIMBUS_0_RX...SLIMBUS_6_TX:
>  		break;
>  
>  	default:
>  		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>  		break;
> 

