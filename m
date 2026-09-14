Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1B45FFA2
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386221; cv=none; b=T83145o9Qtt9kmUKKyin8BNqFXFjgQkMRuzu8hCfzfJimYKiu93hHUBLjqZg7lRNL12RDuG6OwKA7JL+ymXFYXBfBZ2H9Os22Y6hV7l+KPjQfIewQOEOkMCsFTi/IGwQ+sgUi8QjGbVIG6+WcdQnu8XM5LKDNWBLEwVnow2VZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386221; c=relaxed/simple;
	bh=prf7iyPR2XBUzqid06V0xM477LySQ+Us1jpo/hyezos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTUvagxt3/gAjAELpqgNoksvzUQxwDvmJ806E5ECdSUPDRqUFJMNeV4l3EOGyvviJRG544/OPxf6DITVENFrHcw09vTPR09FbNG5dABtxiIG1RpaL3s9ZhATSYZ5SyeyG5XEw9EWeb8Pkdnh6iJ1YWY25E/dHBTw16oWVo104K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQiv9K4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igXcE64r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQiv9K4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igXcE64r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLIB4032470
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 11:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=; b=PQiv9K4Y+mb/M20R
	mTuwQP0lvOso/OMWbd5kr04iCXIwsljRo716lFzKRpGoyhhRgztKYLu1w40+ur6y
	pPQhGYbHfwIcEqWvVzm04H9Io4x/aTsTrqRg/mvKr8y1IVpIaudKwY2CE+iO+j0b
	AO6yyfjxEw1KVkGWjNG+t1t1KPf8ac9GXVLD1lVLYvXX1alwGQQgP9CayM6YVbZ1
	Jbhp598eMDDUD72c5N42fmqu1qVumo97YXfE3XCNQK3oQaZZ1r1um/f7QeTF/U3d
	IiXbBeoNMnyLvCqjvYPKElxvUa+Au/xv7ai7/nq+gIgvC4oesuYqGWY53xIg/Fag
	ePBZTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8cus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 11:43:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so591262485a.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386218; x=1789991018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=igXcE64rNIWJaoy5j4rC2WYRc9T7Zt+KYB4snusciNqodiRoJKMPboCRbIm+G8Ke8P
         Q2KrZs4j6aVrcJHVmdvYYVp+/uaJqQMrEckdtmDcOboLSkpKqsYyeDtT4J482SqaglTI
         +X0zIoDA93xdoO9irp5YtfcwdHbpi09hS5GzPX1YsulAZzEHPej8421FPJWpevF0vVoW
         bZENt8VFD+LyippUvHaDqZXYDaM0DHdPppetm4ehzwpXGvpRYSN2detAmvVuOWdcJtOX
         MfmJLMRniLpX/g9nuPZ0e1QpQsdIekKmVC/xvarkLzSVCdEV7GC2rWTw/cPX/FXooZpM
         VZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386218; x=1789991018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=P09Yb+H3XgQaN8wF7Yy8hc9ZGPtC6rQvXl6KeoTmdB4cB+xCyk3pjnVv9opMkrDyi5
         L+tSKcc6F1uALffiJBKvhQ4MGnk367f566N+ESsW2rUwkKfOpSWzbjcgD5PL25mWdMkI
         ZzAun/ZlpWLQ59rLcduKKOv2GUFJ20elSjvrwEeuCfvOsLxRcv7ybYhWhAhpooFq9fz3
         OBIEgMCPZr1RpY9u5C334/uKY2PLZqHs1LdnuhDaJjf3UYzFQeapIsbh6HtEXsCSX6+a
         HXdJw5RTmcu32srA6LSwZgqFNIbb8neUsBoEe6LLaCDSdEoT0TVQ/YUb1x5JI6JzJYYd
         MSGg==
X-Gm-Message-State: AFuF++kfSan4TPR3MDMzSR7bi7XvZ1iwYMcMfUjU1TXLPeU/Re2GtTVo
	UdTJ2M4x069vjrItY/vLu669Bji7QGqUz9UNqkyUmhXoKAyqK2xPIdnZnLgG+LjlKv8GecTg0/L
	6rMtcgKVkOrfXkpmdRbWjIHkpS/e/Y09F2/8kV7z/1lrlGMJHcyLKjfn21lUcB8LcPQ==
X-Gm-Gg: AYBFou1ncoxldOOOo2uHXv806aQL2KfokYLv/9Rkll6yaE6sw4Y1dcHw/th2sr8T/e4
	3kri3VA6V2c0Ntx9jCkrFW25EDcyvhvPLcEtzPk67V43AryhMt8XNGcP3EH351hDT7bpoMT/yTM
	lkkmE3yrdpSiA64JfroYIZcjovRw2w6T+d+gxFu0vmB0BvnU//j8GjFDmFC7LxfnUdaDzzMrGha
	pBiwXMq6GmbXqi9BzZ5D6Xe5mrMmi/f2cP94vHCuM1KCn+zqXHSxfjToxmD1HttFLsB9x88lXOg
	iMH3meavaTYcjLk8VvlFODPgYAL0ty3zrs0I+pbuJ09t4i9XdgBFW8Ft1jknNUMhFDQ7jrqMlBC
	u3RkpcoyidtsUGGzq0VqZI0FT8EA=
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297216285a.4.1789386218130;
        Mon, 14 Sep 2026 04:43:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297213385a.4.1789386217758;
        Mon, 14 Sep 2026 04:43:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm413973466b.1.2026.09.14.04.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:43:36 -0700 (PDT)
Message-ID: <4063d65f-65ca-4199-b1b3-4eeccca225f1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfXzp9FMXiFiBKg
 Dj0D4ZFRPERS/+x2FWIVeip/EFs1OrCSMieo5sPVdmDr0I0vgYOxhFf5dFlCTjPLfXOBfvOH9dB
 sa+OB1EOPEE2SrYm0tHxvIsbf3aOnux5vKSyjCOFq4ndgZqz3YLzga/mU+PY/kWdJRfb0d+Vheh
 nm31+1l9Zh8hJnl0hw+uirpZARySVbGUTVKdw6SmIgtgPf2T7YzEF+CaxZ6xWJuv1aPObqUshax
 QUfBwEPkBRp4qyIMBIxcFyes8TT7/+G0AQPDZFuBLNZY6d2Dz62RHBmQy7hOBsdbfiCz//2dI+t
 b96jIYU3Cqn5D5DqsofxkVYJo9ApowxFjYTmd0SKmyhskEKwAmlUjfC3WKIcdinw8uQA5e3ZKBC
 RyDY4M+sHQebxqfAjMvKjidsF1z16LD/KJ1+9FmDqlgOW6enHT7oixdSkoOJU5OwBxtm22KhnAC
 OronBaYHc5jFAdLTGdQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ddeb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ObcvWzphOAATiYgTaMIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: B_SC9Cs6JL3dgoqZCdxwaXP_k6c9kzG8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfXzIXhexYMgUup
 oF+pHn273IgCZDduo7s6LOJ7LvEAThMc79YcPmMJXLqagj9f03uofYB+INmwHfHDlkJjNgJA6xp
 bwoH+Xx4Ed/AYSt/lnuS8KFB7J5BMQM=
X-Proofpoint-GUID: B_SC9Cs6JL3dgoqZCdxwaXP_k6c9kzG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140166

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-macro-common.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 10ad68201..573b2145e 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>  		return "v2.7";
>  	case LPASS_CODEC_VERSION_2_8:
>  		return "v2.8";
> +	case LPASS_CODEC_VERSION_2_9:
> +		return "v2.9";
>  	default:
>  		break;
>  	}
> 

