Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C12D6E51
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566428; cv=none; b=WGc7Cc+xvAJ7cImzuxEOsqy9pfzzHWyPcavOIQwJy2YhMPmJK48F5kGNssOYcb9mMesY65hXDKE10zZ4cpfmw1uKsHXMMnEcUNRanE6Vrq3lqlBAA0rjIX5Tib6OlYK9sp/ZE9rC8z3FRlSVHHLqYiZCMBAHFXCu+IsSi/jC/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566428; c=relaxed/simple;
	bh=CBZQZs7xv6X2kFv2IfVFnqy0djw3Av6sZemZObvjki0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tN6lM0NY0hxocH2lpiZNk/137P0ohpZn3LGsYLtXytuSadCtbbRAUXHLnqxQWBsGgAUI+O2I1vxy2x0/DvH3OATMBZ7vcQRX8Ze5NZj8POEjdy2NrqbQ8n0KVNf6Y852G2cMkSlP9WBWeB8sS3AZY+L5118h9DSntb+C12unRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCCo9Jov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sa5jlmC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCCo9Jov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sa5jlmC4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB62Ct1981575
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=; b=iCCo9JovqrVKL4u+
	EUNE3hthiibLg4APRqdYhoynMybOpzYLUX6X7+zcDrwMWbxTjC/Mbkf5wb7TljYJ
	Ju4Ts0kHvv3+boPDqFencc8uRX6xC+AWRQj2Jj2N2/A2fOfONxvQrTg/ciM0frty
	ElZznIG18bqjoYUMzgqYOTqaNNWV+mR1sKV2UXHhT4fLb1XnU20+A3TtjeuTCdez
	fDD9HJLoa6AvXuXPHky4tT6TSgBcmbSgjypdc4hn+NhUnT1vHXIYU2P/cyyZGEeI
	a1cprdoWIf5tEjj9V62vTGrYHoITG7qX/h9Nvy2xTIPlZR6xTmaZRxavEuYyhyMO
	kSTc2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqngqkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:33:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so1347518385a.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566425; x=1764171225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=;
        b=Sa5jlmC4OWQBAxe7HfEdAm5kgmtAOtWiu8d2FCA1TvjF66zAp2hSsDrhdeTsFotkyL
         IAFwnT+VIWWeN5DlzG3H/k5P8K9nrt5PHBAeKZlprYmYHqm9j+oFpevxjKaMT77pIhLO
         6d7T89Hc4VDsQ4UqrVBAZVMuEDSH4kMFzxziEdV0LIhtfnm40JpSE0QyR9hk7VTWfGKS
         vHb6VFzCGy91UoOJKfGCFJ3qltRvIjX34hT/CdsVSS6zOC2krwRTUm+AoR034zqn7Jsk
         B0tH+mknX4ThbqByWqDVoHuzhYQNeQ5DOZkEwQjKbqqAtz8uuceI2PBwcEJvgV0bi1hN
         qcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566425; x=1764171225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=;
        b=Pm/EZqHtan9j+qYU/tY+qaxIBrQZYsokJxmTkiSnQO3iaLfit5jam9jxsaci32XpLL
         D+YopMdKPeYistKSBIEnT7VcqWS4BPaHTwNihEhJzkqZ+2OOEZqKWL+78bxufeL5TNwd
         pZXQplfJ3hVIIQuR97rzVbwabatTTygwcbzAsHT6fNq+Y+dg+hchOuXSg+UamI3e0muo
         L+DHf0Pj6L446TBC0f/X2Hs0wB7AamHcE4c9yTHeGNLFd03rAqpbZwZntVz3YfTd/pKB
         1z/az6S+i/NRClFy49INtTf/GoQpttk21fSgQhfBu+LGhjd5u5dFDMefZZbLv/qqY+jr
         ZYxg==
X-Forwarded-Encrypted: i=1; AJvYcCV78XdRfl0/rQT7/gEqX86nHfVNafWm7/XYZxsaXKfQnL2Gt82wCV7FkVx65/zU7K8BUS+zEDGPe8ypxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztYOQilBYRB+McfmxLhqsW5Ip3IX/hWbBE8RmUv/w4AbPN4lfV
	exjZWBWGMhLSjEnjuy+AVfEgRYrL4r/cZLeURTa5BcptagbFyjmnmWSPEUIe93r6EJdfTrJHHxt
	s3YDhjCkj5v9e6ApSPFaeaxRi9Wur4px+SErAgJzYLMiw8wTxYzW6X2iyDHRxJfjMLg==
X-Gm-Gg: ASbGnctHHxo6N5eEaynYNIXyT2o/zpzcJhosJXCwk4NGgAhMEW7ZNiDc98Lm47zt7pX
	N8QVwcxes4WtsgZt1vTqiO2GuNZzJGffKaKxamrwZV2ShsY5bIqrxFbZLuUzFs9iMUjmDySxPpN
	ZAcUsAES4ezx0vcQV6yPfe0duMe/c9CTtym5xvVswmwb6jwbvVkNSIELLfHW0PMJ0nn8o45X7bV
	Dc0EgmE4sV0QUI9hIAnDC732FPyPE0PhtL9t/xr9t3NuwUsivdsTRLoMy1h3dcg+P1wMQ6aUbwv
	TXyrRYHkl3j/rz1apTO+VLwOfAXoAHwMY+eTe2rK/qWJ5rGxQ4LfvbKIf+6qQ+3G9q2m2Z41f9w
	eaPpS1CkZDOnvNDzp7sReFPyGsDcv1YW3Dddv
X-Received: by 2002:a05:622a:1487:b0:4ed:1381:7877 with SMTP id d75a77b69052e-4edf2048d6fmr329639771cf.5.1763566425097;
        Wed, 19 Nov 2025 07:33:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHchlSRaRHTyobQtmeeRcR9FiTw+LF0isQlciqgDdX6FujnjR6pDwb5sSRpy+IUBfurVrqqyg==
X-Received: by 2002:a05:622a:1487:b0:4ed:1381:7877 with SMTP id d75a77b69052e-4edf2048d6fmr329639061cf.5.1763566424579;
        Wed, 19 Nov 2025 07:33:44 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm39745372f8f.19.2025.11.19.07.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:33:44 -0800 (PST)
Message-ID: <257ffaba-fa78-4daa-8d6b-e54542c5891c@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:33:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ASoC: codecs: lpass-wsa-macro: remove unused
 WSA_MACRO_RX_MIX enum
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-8-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-8-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX1sWu+e2JL7jZ
 5jrtyIRmgEP99OoHRNhZI8I6O/5E6d9slcdsda54AgmKXqznQJfWRbeelRfv+qIKyAvz3aIoGiE
 6KIjbbkV52iSspC7ReC1bux2vrfh13cgtHurB2+sGtQECdkiZyZM/ATgcLhUiZjognVufxEJx6K
 dU8MQ6cT4Y2WF3jOHHszkqpS7389qi2Pskcpulg2dMR0ltmir/6rGhCRgcfu113vkzkQCEomm+c
 QTEzdS8BejimvG0uAVcL5Hpm4sXAzZR+6bVO4EWSbd4lBdWSk8vJmg9ddOeQdFcdLScYLgGYQH8
 wzTNeWd79dgCf313hP1NdNxVPxk8yP2LlfdA/w5b8964bGG7+K7FeLXHutynrigsC0Mw1aSLq8K
 UfVV2jdErJEzTRegJyTvbUEnfsrTiQ==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691de359 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=sJkrBO08HKnthcKKufgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: UO0uFJhNImLp9iQu2qrEVAPoPUtBNeoe
X-Proofpoint-ORIG-GUID: UO0uFJhNImLp9iQu2qrEVAPoPUtBNeoe
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
> Minor cleanup.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index f02153108c275..694ee3ceda986 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -297,8 +297,7 @@ enum {
>  enum {
>  	WSA_MACRO_RX0 = 0,
>  	WSA_MACRO_RX1,
> -	WSA_MACRO_RX_MIX,
> -	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
> +	WSA_MACRO_RX_MIX0,
>  	WSA_MACRO_RX_MIX1,
>  	WSA_MACRO_RX4,
>  	WSA_MACRO_RX5,

