Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAFE2E22A3
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566456; cv=none; b=Iqfdy7EVFXQB50bvISd9eba39g8S1ukXZgvClQ/kh38xQtVnJIbpRlZ8pL+xVTUrdLbFjuwR240MppDHEvADDdm+esd5z78/UCpF9zOOHqKbRXp8uHh9/uUVgfwhh1q/0NTDkvz1wwb1OWpNlcg4CDlwQ/jrkQRt3bjj34zbDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566456; c=relaxed/simple;
	bh=pLGvdgf4QfyYieGbUFa8iwmFMwen1RG1iVPCNvJAnO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoOi5OdWAoPwSBwjz+9HMZW5f/NhprC8WEiY5UioiL+YtxoxQMEgrgTxoivTjFlXypcTx/kZS+azDC2a3g6BxeuqC0mDEPkshg3ARkPlNlt0Tx8plKOJBsSt8Tt8kXDwXtyvLmrMXU+x6SnzZdD8O8Dlgiz+7WOXbvKGq0CVZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4oNfBVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggPkAKNr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4oNfBVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggPkAKNr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB6GLu1982236
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=; b=B4oNfBVpq/ylXQmA
	0CNCP0xzSZpw1lJLRdONJotcuT54bviYVwRPKSAeQFIwk7xExcbRhHEhDQGbftyr
	HWfYpy3spSSGmccuUdhmkKy9nKaoNkGoaHDVoXCGTir4fpDSP7qPci3b3A6kEbdt
	WtxQKkZmZqahv1/6clJWq1cyOip1to3EyKomFCOV6eLxA31JH/SIq5E1a6KiXkUS
	CIGbZ8voLLayYf89fVMV8OSK/aVRd9WLDP3oFiATYY+xKrrxOSPC7uzJbrcG0jJn
	5uncMXa1oUZGSekYOpbDIAnM6/+4+fnpdd0N5UHox9ON4k2G1G90S7BnvuMF1IpR
	EHI+ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqngqnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee168a520bso131926741cf.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566453; x=1764171253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=;
        b=ggPkAKNrVy22PNycfrI8wmGGPtt3T9CgtRYBaISb9V34PXq/qaULQKH/BQUJWZTzYA
         BPeBrMOksx5zd8s42dmhRwo92s/K2lmdfbeAgdnQpoSFFpJ2D3ONadnbUdgcXRjTVbsG
         28g+JN5oMcbHiXMoCsSEB76LnL8zDd/bFHwKG/WRSztwJWSTRd7SCEujWLA3uotx4fUT
         HqvjpvBGQiCGgs/DwGwKnAYKwsFg9iSNofEr9a2olk/M2Fa81rFr80Qpjeo9fbDwZfmo
         7HZwdYlMgjvCjNnNn/2zJoJ8NdcHp3Sotjw+lnh0wnOYuV0mOoEwDLV9xefYcEYpXi8O
         0f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566453; x=1764171253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=;
        b=F8n76hpozc/0fj2ssxUP3Nb8dJa0U8MnL2u30ghOUbTIZIKeZ7aj4BkcesnHMcCKCC
         AiqvglBYBnD9d7Cf2cFTJMaPjvgSJdHHHXS89x8CePmEpXa5bgDqGDbDT0aH0KWCD2YN
         Y7bqQjpeC2kR5kGaU89Y79rY4xzyNmV2el2L+UAKVBKt1yFjvMsNG58KUJivVCKmB6xS
         ef/iaXfWil7+M330LM3EoAfZHoVMqnUvYlkhtSH8gRD57S0CtHv4n/lMe8N12FxYJv21
         yLsjGaL6ds1khTzyR147xSzeCecRr7Jm+Qtv+bpESYttcuRWfwHzIDepRVsAfCnRMypw
         auMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfBM1JrgHjmFEuEW5ENJkRiiBKkOEAEbK7O8Su+js40BmzZXBqIPnRaMmJkUMzGFx8DhmsJ7F3DGl4aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylCxasKJPJFRgfrrOS49fwGEQcnXISv71nBRc4qb2oWuLwRxXp
	Wcnf3KFiEdfzn+uK4g0xIvjROLYBTewgHdUG3Gv/cVg2us8/fDBt0JhxcXkYdW5fcmY/gwGjVBs
	aowgDRXYvKNec9x7zUjDZ4i9VwjOp+Q0vOIFjITv2oU2OE4hlEcur1veTR1JQ5dM7dQ==
X-Gm-Gg: ASbGnctwuR2P1U/TizkMMczElJd/r0RIZi4wdtykgo7bw/cDnHDVJEhzlFxQrMomGj4
	2a0bKpvV0kXZleR6pP5vRLw8SZGtwSoXEMkqI/r0RJwglbAnSDOopl+/vrV3UEY+F2bnMv42xlV
	T2+27nqCxkOoM8QuIbuERtOoeF4BFuhqWJaKhECgH8sN3YioloxCy7/7Oh1rGNj3OydyFK0kI3m
	Xeao+NsqVqTm0ZdIwMLG+7dfw/u7NwTmZwgdmsaGbyxZdtbplALIpqdQWastk9d3ZH/iuuBf16s
	w3GRLN3Ta7vRjkq//NGQaFmO8r59bD+yIYKJwee6s8DmacRbyBhbZwyxz/Ze6sr6pDywfCiAUdv
	mck5YnCaTp9IU40C47RzORSRc0SSGyjbAlPXf
X-Received: by 2002:ac8:59c1:0:b0:4ee:24d0:454f with SMTP id d75a77b69052e-4ee24d04d27mr133568321cf.37.1763566452547;
        Wed, 19 Nov 2025 07:34:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG15CHRssyqgHoVeSwR9lEF8QcyqHmCrpLi1la1jDh5Mt6DO7neMAAecS8aIIfCeoz9mkLuwQ==
X-Received: by 2002:ac8:59c1:0:b0:4ee:24d0:454f with SMTP id d75a77b69052e-4ee24d04d27mr133567561cf.37.1763566451987;
        Wed, 19 Nov 2025 07:34:11 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm38607224f8f.24.2025.11.19.07.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:34:11 -0800 (PST)
Message-ID: <3d53b87c-c5ea-4250-8a95-4a422c58641a@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: codecs: lpass-wsa-macro: add volume controls
 for mix path
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-5-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-5-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX7wT6pcz/IV2h
 /a81kQcMJ2f00pFVMcP/AI6zLuVNxNFAA48sk4jR8r37jR5Y5U06EReiVPdw3KkzisL022Nkagt
 Io1A1QObNvrdOcXlAteD3eSyTd7q8T1Fj0toedXtoNopnQQjw5rKp7V32+D7WeK3FcUKdmUAbfc
 w0DT6ErXtecn53znDEOfN3wT8oLrMKkCLLD7dr4nRyxZ7yteDy8PunS9J9GCrbXRorVT58fuCPx
 HVp39ceJ5GgN8+bl3j1fSO/U4u3J7bXk/nakiP22bcidJAgqyoE406sM0xuyFfGA15Pv8FPjGYR
 be7hxry1HDSBhXZpKI5lzu3X0q55Hwov1qSrQoH4mv2I+mhFeJvTHVzrj6suTZ4WtVdi6NH8xjp
 RJAyXr+dT9NByqcggfGQNFo8qJIj/A==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691de375 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=wvWJiIKFnMKyShiGQoEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: CMs5ZFH6HLXltaVwRB3Be-4unWISNtCn
X-Proofpoint-ORIG-GUID: CMs5ZFH6HLXltaVwRB3Be-4unWISNtCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> This allows changing the mix gain registers from the default value.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 27c8c060cab19..2a814a5d2d1f0 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2248,6 +2248,10 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
>  			  -84, 40, digital_gain),
>  	SOC_SINGLE_S8_TLV("WSA_RX1 Digital Volume", CDC_WSA_RX1_RX_VOL_CTL,
>  			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("WSA_RX0_MIX Digital Volume", CDC_WSA_RX0_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("WSA_RX1_MIX Digital Volume", CDC_WSA_RX1_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
>  
>  	SOC_SINGLE("WSA_RX0 Digital Mute", CDC_WSA_RX0_RX_PATH_CTL, 4, 1, 0),
>  	SOC_SINGLE("WSA_RX1 Digital Mute", CDC_WSA_RX1_RX_PATH_CTL, 4, 1, 0),

