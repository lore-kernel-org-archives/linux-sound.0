Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193F83115BC
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 21:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765255; cv=none; b=eT0HByE05OIhPivij80S9xmfI/yev2fzgu8vYnoFoiE0J5QVNgvKEDiQosC7X278yC3iQM26OKXLcF0PQK05kez9IV0Zrl5cM7gm7Q49E9uCTMuz7VrWHgIzVgbS5kZ7v8iIZESgjqIt1ZDoikojMqUB9BHBizpX5POJktOtKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765255; c=relaxed/simple;
	bh=M88bPIZ6JBhfra4C0yG2FP5BgCRpCg0pD9q2rJygXxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cM5p6AwtPBhls+Ioz9fR449wMWti09Cqzh1joKivcfA75Oa3ASpAGFeSe0Ge11adpI9BuwCuqJ5r45FzaIjqjdJCzd/LTVSzQEE7zYjKBuALp75Zk4rrvNqPoqHXuqNmZldIM3RV9kf3F8zrQeukF6hp4AFoXbJtqAf4o8g30DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnH5547L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixcoDo4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnH5547L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixcoDo4s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKErYi2116539
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 21:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=; b=LnH5547L+sCuvqss
	4wVFVEyWtknBP6UMoeA6NUIkR1iDPsWYZCRXGUtQQ50ruatV+Bs5ehbHiH7F0O38
	AOl3qHdWlHbdQm4eHKc0N8UAak8hbnBbvYyUD810ST6UINfXyo+adeWmbW8FVAxG
	pTmMk8NCushBUZgWkWdEKIjROjqHGrDItubNmNxsIQHYP74r3f5IFp5vspLxxp2x
	YnfH+KlQ4uRye9YT+z+utXR0FBTI6zEj5FhYR8QflZxpuEz2Y4SG0TqDygvYble/
	SNUiv/PlMOh91l2TTywPetDxgPM6OmvgSEHzBzhOZgHT6IjG7Q9vGEE4ezF8t9is
	TVj1FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2uuh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 21:00:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so233161685a.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789765252; x=1790370052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=;
        b=ixcoDo4sRWgaVQ3xVOW+vrQm8CFMKmcljTSeAV7u00+qLOMJOkMMa5ZqC9DWf+boDR
         +bikWbHz544s2GHE++o+z7Xj1OFn2MFqvuReEgn21bD6RFrkVWA889S65MgQvtQZd3KJ
         vYKHAsED33uBUL0pP+JN4/MZz5OyVP/ol2r+0HXJOBqJB2VVjKi8kzTwywWU8O2Sjuk9
         aLavAYa2nfcfWF/pvRc2HRovxN2d2+/16wLVS4uFmSBZ61lZPrjLK1ztlWnm6jz5pDIL
         1JfEbebu9QjnnNkdAvcwJND8+0rdeFLbjeDAg8ZMLuRg85eJCC4GuvYn7D9r0UwKnI+A
         1DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765252; x=1790370052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=;
        b=xwEnM7OboTlxiX3vfQKbF44bc6NFTWj5SeWqY48nOAHqWClnwW3HW3y94qNWTZEPRu
         A11BptYY5KyAfaGZEH0yPyePsWGPZ0sMnH9N3ptEQSp3OIq9pPD6iZAH3uUVPu/EFfIF
         PqMLNYPbZsGwTh/fsSxXgOUWn2yr05te3j6Py0NDCFEvx3BwbUG8V0MTy9egsO8UGVNM
         mwNRJi9DKJg6VY1z3hsAMNgrp9KVn5i+DgV77epgugK5RpptGi6+IKyHL44HAN2qZrH5
         0ZpZbEhGTTx5U09c21eGqhLjZAwYN2mnAy1qnc97Iq4QzihYGcTUEbSvRRqb+XsclgyB
         tM9A==
X-Forwarded-Encrypted: i=1; AKwUvBznJCVHeD8R1NzkW/8b0jQWWV1HTVMf5Kg+PPUDerB5fMqVPzmnZyKnNZ31Pyj5QUzpZpmtrsNahcV8lg==@vger.kernel.org
X-Gm-Message-State: AFuF++mguhdgSuiWjpYXc2PDC3bAIQVgQ32+YUum+1oAc+nse+Kk3EoV
	UF56BOtRHzVOkZ3QJve1TQH+wvHFpcntRQBE+aL8XpJmnmUv5aJSsNcbnZx7ZvHCAaanwDbjVRV
	m3yBL51vAyBBhDUL39xpAC0WVeNGOAUVwschklWk/+4sRxAv4g1MydiNxHVJ6DJ0/ztcP5nyukQ
	==
X-Gm-Gg: AYBFou094wusgV/WMzH0xV3eEv21CXQ1fKI0JkxePYS/qTo/knJpt5yXmRMXCL9glSN
	GBg7ZygYMkSWBXznPlCdw7bolCocunWDTa3hm47igkqmQDtV9FxyNwMIHeiTHohRGFhJn8MfX04
	n5miiTfRq4X6istmY9GQf6cV0eUBmlu5uJuPYqbbHqVUqeZGJTlND6urFX0VsqtgqMgLrZ/mWfj
	GvAOCq5ogkL/52ZONQ+tttJIsOcmzuafR6zhLYxUNKi8tnaPiXye5C4EMO1v09+YhmH64OhpFok
	EtVNgPYZNG6CxVgVC/xgTt2XqIn3Bj/xT8XMG+jKD4Oq3AcqnoTs0kMr4VJ1SfTvYzPWf1wVSyH
	ECsy9UUTY8ovfCdVqtWoIwMLX9d0=
X-Received: by 2002:a05:620a:2b8c:b0:93b:d79b:9a55 with SMTP id af79cd13be357-93bdca3b4bemr505546785a.54.1789765252003;
        Fri, 18 Sep 2026 14:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:93b:d79b:9a55 with SMTP id af79cd13be357-93bdca3b4bemr505539985a.54.1789765251390;
        Fri, 18 Sep 2026 14:00:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4872456325esm1556457f8f.15.2026.09.18.14.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 14:00:50 -0700 (PDT)
Message-ID: <d9f7507d-442f-46b8-95ed-05a6ba351b84@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:00:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM
 interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
 <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMwMyBTYWx0ZWRfX6SZz4LLCiVJv
 fLqeDB4lFAVbYDbgzB3pH/H8lfDPrXJZh61h+oAkcZuCkbRiitQC7eX07K/SE1ePqmP9cZJpN/G
 TmIN8TGDED2ptaxRLURxmvJdSZ2uI/8=
X-Proofpoint-GUID: tnCApq1q0NeD3BBHVauIslVj_j6uRfiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMwMyBTYWx0ZWRfXzCChPGsevkfS
 zhFsSZDIi8k3TCoq8QrMcBY6hhQBgtC0DpHTNjsXn7wGzJz+5z9hc4RbL94C4TM7lyvtV3XOigY
 Sm5yH7dtq7mQNPkfEpWVfgBV2FKr1z7v6keUMoJglvIIpGLH9zoGosMu4o7OFVxXzPVyazZGneg
 yby3CS+Bee/speg6XgZQkgGX8sHhwacMJqwyibRehrY8TEWASC6HQt/IQ4KPt0jIejWzeTJHgSb
 5wavSzJpNYZWZXJoN8abV2YNJE3EFlrBlVsgAax+LqIdlLcbispYw5dUAGZK0teY51kODAjnae+
 83g8FiDKWBb50plOGzcC+f7QIVSPPmNlRhlkuI969GpMjEBga5EDfzzQCc2P+hhSbWOzymPcQvd
 sZoBQ+vn5tGd4SCL0CRRnhqA7e9hNhgBtvT3RzlHR1Edu16MQ7qzu/wrv8nT93t9NTYGwFqKkYn
 n2JKNFYhHCaLoHjQu7g==
X-Proofpoint-ORIG-GUID: tnCApq1q0NeD3BBHVauIslVj_j6uRfiY
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aada684 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C9_n30b5a7b0bi08pjYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180303



On 9/18/26 2:31 PM, Mohammad Rafi Shaik wrote:
> Handle AIF MI2S and TDM DAI IDs in the SC8280XP machine driver
> and extend LPASS_MAX_PORT to accommodate the additional audio
> interfaces.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/common.h   | 2 +-
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index c1deac109f24..18171656408c 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <sound/soc.h>
>  
> -#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
> +#define LPASS_MAX_PORT			(AIF_TDM_TX_12 + 1)

Only concern I have is that we are now bloating the array. We should fix
this before it gets out of hand.
--srini

>  
>  struct qcom_snd_tdm_slot_cfg {
>  	unsigned int tx_mask;
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..0876b9be136d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -260,6 +260,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
>  		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>  		if (ret && ret != -ENOTSUPP)
>  			return ret;
> @@ -296,6 +297,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  		}
>  		break;
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		return sc8280xp_tdm_hw_params(substream, params);
>  	default:
>  		break;
> 

