Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CA2773F6
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594001; cv=none; b=UJy6vNUtkXfwQIzRL+s9+jrzEHasLIy0lGDxveHG8bhcTXHVi75LpFA271d0YB1oZ/8BTZRCax0Y9bPXXGUtJ6LAfy5EUevISD6xosPTceL8ICPSWtFyzEt11h18olblMbN9P5En0o6Say+E+bG13c98hY1PKLGY8nqYJ2b9+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594001; c=relaxed/simple;
	bh=Hh4zqDBDykKthP0a9Qkz/GP1EmZNegjzXgRnEmjrO48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+cRjij51WlVORmaUg7HLUeN6Oo4AaabCbcTHItCJKjl/+TXXSJY/CR6qiiYKqafjhaoslvjMSU+d1WMmq2MGJwMfWL4NPTvYrQHjycFNp1B8btyJWA9SW3pm0PvlcejWa2UD/64q//y2D4Gz2tXVBPZnNTgB51BwLTRnu30L78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcujlAtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcujlAtZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J8pGdp014365
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lF3KpHtHPJ+/F44JD02kWVd9YNd/W+c8w7yaqsK6GM=; b=fcujlAtZZIud4xK7
	tkWFi46svrxqPkKZyRDOwaCNQgHXp4Ax+tW/LgmByuwsrHgcQSUEDc5L2A+YgHkg
	8PHv2XlWSR/pnsuBA84WKDxfOGSNaAn8PQjMy5bnG+t3AouWhbxRu+qTkFNg+gjJ
	MrUpDb34kzoiNieIZSPuWD9niz9zSjr4KdBeS6s2iQo8aW7lD3roAeqKco8Y33XX
	d3ilFt7H1UbunKRh8in1iNKxXgz6qetg1e53Hl433mvj6oBYBrSNALIDlNhs2VdQ
	rZgIV579W/QI14NZUm3DkgixzQB65CaWb5i0xrkHiE61/hOtLwakYGbaJBRwY00G
	Yg5jsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagytw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 08:59:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b28434045aso31608691cf.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593997; x=1756198797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lF3KpHtHPJ+/F44JD02kWVd9YNd/W+c8w7yaqsK6GM=;
        b=P98qeIo0NHsrXBAy+P6ADP71YgtBpFOXdlFtyz6FCcw/rY74vBKn+hpTvtGWkiUjS4
         gtWtfY3A6V6Ghza04+B5h+sB73Cw+NOl7g5/MvvWA4VoqL/M/AhHHyKooxLutgAKgciR
         SnTD2JjrL1tQ+zf29PehuB6U+D0Y0LJc5Vy6DGz99YQom3KuNHspFE+J+D8paLmv0LBK
         rITyx+zBKWeVa5l7/5xMYFY6+BWz2bheDYJ+7v0dyWZ7wHt9yVkd2RqM0wV/QHMhygvu
         h/XRcVn60Ui4d7jEk3JR05KcXf3J1e3cSXcp/YVKKPrQEL9eqW5P9GqtnrBV0jMyT/Yh
         vaug==
X-Forwarded-Encrypted: i=1; AJvYcCX8XiSJOM9fgw5Ibx+xSrcJXmXU4mv7LTAUygQBKocNjoH9whJDJLlWlMlZ1HcLDJ86DqD8wLGS8H3j9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fkLU3kpK/VbukH5ZDJZJzDzE44vwkuH9yW478FI5MQRQTh0D
	y9JA5TrgbjXCxTOLGHy8U+61JEQ79+/gP26zngu4+L1XhMpkPOy35PgShF+3bndUZer8doj8RPg
	LRMKq1uc8Imknm6aL80d7ygMR+hG93VbjjsOWLpaUPrQSKxDZRzGmqGSjZckr0U63jA==
X-Gm-Gg: ASbGncuE6w0EUtXs48OORQQBEctTEMsp1zIHy6LYYWL/+eyIiif5vvd2AJNwXTMf0+L
	MqvA7vSoI3f/pW5rXCZaNbvMUOxxtBOCF7jpF7ntnyIk13r7UXtqAUa78TTlQhopLHnF9iMs/l+
	6J8HRjscJWFUzdqTJb0zH5jjydb/5LqRy9OkfcyjuBmyH6TXqSoDF+5P1IEZQgGsjznMSbjVKWd
	yU5OFeszQlHjN3MVQRetsTGO9CL/BJ9NUteXMnHElbBkENaoaeZ7vf3y4WrHcfb42LSjR1tjfzl
	LJ9wVDFfHR8PyswAyrIwmdVwNqIJ6P/pIhQVMOz+Cc4CIJFHMldUfE3L9296WShzD+g=
X-Received: by 2002:a05:622a:1aa0:b0:4b2:8ac4:f07b with SMTP id d75a77b69052e-4b28ac4fa75mr3985181cf.77.1755593997463;
        Tue, 19 Aug 2025 01:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3agWwtfi7Ws7maBTenpB2FNs804ZV1OVplC/ref6pFQ7oAEtBb3ow4VsePNm+lOViOGFM3g==
X-Received: by 2002:a05:622a:1aa0:b0:4b2:8ac4:f07b with SMTP id d75a77b69052e-4b28ac4fa75mr3985031cf.77.1755593997037;
        Tue, 19 Aug 2025 01:59:57 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm216696595e9.9.2025.08.19.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:59:56 -0700 (PDT)
Message-ID: <e0907e8d-19fa-4ad8-ba81-cb9ef4e78a10@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 09:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] ASoC: qcom: audioreach: add support for static
 calibration
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818125055.1226708-4-srinivas.kandagatla@oss.qualcomm.com>
 <6d137f07-d37a-431b-ab38-5f3087d9b3b7@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6d137f07-d37a-431b-ab38-5f3087d9b3b7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a43d0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BXQ6yQkEz0_uBQHTnLUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dclLsD9069uGpOUBieA3UIxbDrmE4RQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX84QniE+U0Os3
 4dDihkllj1MF8RAkmF+nZYUfJjduQaXu7U2rTkS+Za+ppg8MPb2bjLe2pvxzXw6cCOD25kndLp3
 nmEN6sHxxfSw44D+1Rc3dd3Dy1jJT5j8a/ruTNUxjTXAK8amo/cALZxgQRb+AiSnX605J6nrIKt
 PoQ7Ey+ws/fzLUhydH+C1mK1Jovs6iNkMw1tE5G0jjIkU9CvmdaZwPRqDy67cuaGeuMUvZ3MVS9
 J8hsnCzRtL42f3rugl1cYeWFI+ccRovCAasIEWVUju0CZT5+e1XMpgHY7wNAJkjnta7o0ot/OMS
 fDV7r96jQEA+TtU49cmealXlU5XSY7B9viTnBs6R3qqrQbUpuu8jh4wtBzoRpLiH7Ax1Vnyod/F
 h7rawOt6
X-Proofpoint-GUID: dclLsD9069uGpOUBieA3UIxbDrmE4RQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

Thanks Mark,
On 8/18/25 7:52 PM, Mark Brown wrote:
> On Mon, Aug 18, 2025 at 01:50:52PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> This change adds support for static calibration data via ASoC topology
>> file. This static calibration data could include binary blob of data
>> that is required by specific module and is not part of topology tokens.
> 
> This breaks an x86 allmodconfig build:
I think
 #include <linux/types.h>
is missing, Will fix this in next version.

--srini

> 
> In file included from <built-in>:1:
> ./usr/include/sound/snd_ar_tokens.h:243:2: error: unknown type name '__le32'
>   243 |         __le32 size;    /* size in bytes of the array, including all elements */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:244:2: error: unknown type name '__le32'
>   244 |         __le32 type;    /* SND_SOC_AR_TPLG_MODULE_CFG_TYPE */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:245:2: error: unknown type name '__le32'
>   245 |         __le32 priv[2]; /* Private data for future expansion */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:246:2: error: unknown type name '__le32'
>   246 |         __le32 data[0]; /* config data */
>       |         ^
> 4 errors generated.

