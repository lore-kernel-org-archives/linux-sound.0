Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995579;
	b=Pb6r8MaJswdj1w61J0BJSAdAim8QviCHSGvEC8cyvOp1sPRK3TqmP/ZckpKkM04wmmpB
	 g4O9GV5qgoOvCRKJv6AnyKYFW7FBy+xRs3WGO+Hw64g6w/TIkGmxsNAHUbUWw34sTmSXR
	 +oyaW8nJsTYbiJRC9qOop0I4lpKK5GU77PNY9iIf1KmA7cNgXVO1tIlfHcn8yq47etyPo
	 7yD/rA3RaNhbGxbO0B2mdQiwYBtj0nxU14Z0oGQyCR18MCcoEiVDo09KGa5/MQsSuJl68
	 6UcwCbU0jL5+qLmTqPFnggHFT8ot5iqfpn3VKgwbSNxUgfp6hHDWAABdtWqs0Ar8+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
	b=O3Q+9M0+iOqYOJwBTv1399F/bsGQbP0mOuB7kMFeHlWNadBrcb65Oge2yCdX8HiiLlzm
	 cxbl3KAQMzno2PLad+QvimuHsx8mbN5N1nvLL73z+xLd1mV6EKyIEt0ce8+Hhz8ymbHCV
	 s2TxOHLLoSj8zOS7Gebik628j3JYyFPlPE9UhCZAWiXNqTqGz3u6os9fMd4gLbjJhoJMn
	 JH37M6FXHLnmQoKgXqmP1UKuoqKUk/+ozinIY3Kxb29WU2pmcWPSOctHv4sfgAswXtIoT
	 9cpHnNQqbO2cyUSq8qaE+H3ixU/zD4l5fczz4K1cjp5SrDAmG2zc8Jg7mshCELceQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B89606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B89606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b2X32206271
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=; b=ZOVpBaQG3lHZACQt
	k2AEhAHWHF+RCP/KHzisSwnkMwidWXGSTuvKMLUdHjjkdKEWUz/LCez58/+8pdpF
	HFIeL27TB2Y7UYHaeobbMWLdgvTaPGxp1uJawsItekSBDj9UE06l2GNayaVxDQV6
	2vBy9k0I4YuzKsxDk4+e6WpU4Tn2dTOywwhIix0FZStOsYzpU5r5/TNpTJHbuKqr
	fX16RR1xE1T4ZeoJX0/nuFeSTF3t1Gi7uK6c03kyVCjefqLA4OL5QyA4O9RDvYja
	NwFozqxFJ6P/SssQlleWF1B55UeSn37eeEiy7erE0O1ELNNbDTtOtGgYAJNXzOEf
	w6NGmg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrun19a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso4650085eec.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995576; x=1793600376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=fHvn2QyZkTr7d/2p8SwxYpT5h/S8FNjZYpi7iOgmkpKOPNCjStqRB1xGI2LoOpsStz
         eWsKUtQQaU7Arkxz9Ofan6K2Rzzt9CEOPAs0rCeZpymyi31sD6tuUhFRi73wknyCl6f7
         WedR1+n54tR7SpZONJ0lEbtL6aqBJGsAlZ3IctYvOrtLqQ+gpLxAg1UppI7wiZPHNC59
         AsCKI2o6c8kJtnPGjWyKC3LRbmfEuGhynDFKpYbIJr/vOSztpRhSXFTgD/Kz8iR8677F
         DuxNVqOSU++HOdu2i232+4rF0oWsNujLX3bFKldL17GeCRWygsuCVLr03IAdH9shpzsB
         8d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995576; x=1793600376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=oa2k5oKVU8wB/mqUtVpFE3F+fxKtkQV8x1Dmf7H0wg5DBm15MEK3ctIlEGtiZXAGne
         LImmbqjiqFzEnsPuEgW9l508VuzbYd9MI7toLh8lfalc2ovDQcC+hRVuc5qLa+cRG2w9
         dt2LXVINluQEUjjcedOs/uVyOkSyCY2tuEIQL0XwsK3cRqWdkf+a2BRqHkFQXQgncaTr
         a1efmMChVGl4iygEe9zW4EzmRl0a5Yoih1YiblMKihC+bfHZqsk8cUc1s6jIPIhW0xzW
         kuk9CpiwFT8t7qfJ3Udpahu2zUseKFM+XWRYg9nvx+Crf13enQXRY05/ADD6CzSV5iFO
         NWPw==
X-Forwarded-Encrypted: i=1; AKwUvBxzXYYJn3AtU/a1SSFA6tht51gJ7leFM6K+j0ZTY0rhIZhd7fvrCi2cWk42VpVuQkn8j8EM8YBwPci7/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWmOVWnGD1q73YbiVNBlp5/AJ78kcNo3tfjybwIjTsA2Mx0Ib9
	hUBcLo6wtcRNox7JnXls4SDL+gA52prDGaxoUpf71siwuI9f7W62ACwJbHJzPer1iG/guSavGSL
	xjFt3f2v+F5CbqnA9c5Hp/jCHcYl7fSKrWUWAZEqJ9YqASBN/sFY7kZLiRcO2yv6D1w==
X-Gm-Gg: AYBFou3vrSu7UjQaxnemusmMPY9SO0LnRJIg1rdSBs2+bBPw5GpC1KfydpZXJ/6ev2U
	6tcAYGc24ayjm2FPD3Xw6f+BcG/P0sYDRGmnNtEE72ZX6IH6QSpq5qQd+WjQYwym65Q0NW3xbKp
	UcdU5G9CzjbmpAKcPShJ13CEgNBWUbQ0Y7wO1hJ2+mOYd2uCkNKw40dgwQpN28+HkI6EPoL/GMP
	MN3zyMU8hd4Il0hm5t2TC2HNMoPDWh2VgaBa38fQA/d9UjmpMBu3muTtJktUJdlHYokubh3gRG0
	Gr0ltXNW37FWjgxE2tBvsL3v2bSwccAkULMeZqw/W2ccsisxMBKYCQkZ+UL92WM7IQAjhTWuZb/
	sz6XyHUVcTefuddNiu42BuzfTd7iHK4LBb0sn
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931977eec.17.1792995576277;
        Sun, 25 Oct 2026 23:19:36 -0700 (PDT)
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931949eec.17.1792995575594;
        Sun, 25 Oct 2026 23:19:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.198.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm41844315eec.23.2026.10.25.23.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:19:34 -0700 (PDT)
Message-ID: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:49:29 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfX8MRrTUOFV3HG
 VDU7H74aX+4iBjcV1r7RmWyxU7o87zSu16zlNwvMu7nTwgq+chkYQ6u1VxLFGm3RYw3tdZBAHW2
 X+U7p0DcX4KO9kj8vxUNsJZN276oqsdmX2p6WUT4SSmVKBIdrdyUsxLbh5dDhr113T0qlmD7Ulq
 zIDXJ2swJzTSXcQ3sv36aQuPwMb6+dH7RzRx5oIf/Bu4/mVu12cDU7PzuOXBFVPEUwfpNmB7nUB
 VO0lvnt1lSsLFGwgG/Q3Uu6Xa0thSWaBtLKwsaeBOSJ2iSaUoqoL3dhmYJwcYH5s2KQzD8MH/ND
 v6uKhyut0nTlMc+6xffzIDYhzZ+pxmnNxMxX/y/hXi5SnGNaZBPrQwqvJdrxYzJLwCwTmj1IJsC
 krNCW/SpxCe5rJiDOSrx93Rpm8WLfL7sK5zBzSTu/xRxNzF56t89wXy7m0JHIjnAg6MRXLmwqvy
 oNm+5v75rnBUeyieRtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfXzG9ZonW+sytg
 hVy60bwk30eZE/s/qbjIAGWALGfkxJRkBfogy+9Ux+3X2jQRUkpapFyoQFi4NJTMCxQ88F1Ra1I
 dg6KDWhAQF3XN6z+0yKhJOnBUtL7t4s=
X-Proofpoint-ORIG-GUID: 8jXLTso8n8qSroAtbrK--yLQrex2O6pV
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adef0f9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=YdEwHcodOreUj24YWHnpAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=nP5ThTwYepZGQzjsTqgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 8jXLTso8n8qSroAtbrK--yLQrex2O6pV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260024

>   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
>   {
> -	if (num_channels == 1) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -		ch_map[2] =  PCM_CHANNEL_LS;
> -		ch_map[3] =  PCM_CHANNEL_RS;
> +	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> +
> +	switch (num_channels) {
> +	case 1:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		break;
> +	case 2:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		break;
> +	case 3:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		break;
> +	case 4:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LS;
> +		ch_map[3] = PCM_CHANNEL_RS;
> +		break;
> +	case 5:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		ch_map[3] = PCM_CHANNEL_LS;
> +		ch_map[4] = PCM_CHANNEL_RS;
> +		break;
> +	case 6:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		break;
> +	case 7:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_CS;
> +		break;
> +	case 8:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_LB;
> +		ch_map[7] = PCM_CHANNEL_RB;
> +		break;
>   	}
>   }
>   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);

audioreach_set_default_channel_mapping() silently leaves an all-zero channel map for unsupported channel counts.
Since this helper is exported and callers such as q6apm_dai_prepare/q6dma_hw_params/q6hdmi_hw_params() don't validate the range.

would it make sense to return -EINVAL for unsupported values and have callers propagate the error?

Thanks,
Prasad

>
