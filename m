Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480717;
	b=o74lTwzORkOLJCzP7CJQn8juB9lRMDQ3af9olc9KfB+UgSNqXI0qHChtKzT4vVwlgU8A
	 hR7vXuz7LbYLJHUdOaCGKbCwTY76F1pDYl1Ws/6n9aza7wkEJ9Qc6pzoPgC9JngBwKSvM
	 YLOw8Y6yxFUa7oZrrx7MNG1CLn+ZvAFWmpUW993pgpUwluEVrIJQpgA93yb7/qfLmBbd1
	 vlVJvKtLgTOUix3t9TwTBaEgjh5I1L91D8tLwYWLrFYz/TuH+nL9bhwRL5StRZGQN7pv5
	 NcDMacYlm1P3VpDhbe+szAbzLIwBzysbFJkdU0ZeBpja7sXqBoCXuwxg3N7sslO3nGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXg29oI0BzMp9Wce8FtHMSF+MR/+HfdO6N47KyWprp0=;
	b=4g3XsKk7wY0cDnmDgz7WuU1s83IfN3r7EdeihsaMeTB91j5G2hTwAv5mR3hs7gaWDAb9
	 ywhQcqQtno9+sx8lLtrVGNhb3nb51428xv/ZT/Wr+x2JVZX6TCOQ+saRJWaZhllkBZR4m
	 zTSmXZ+om1KWL1yBVAh1rW3wxZE3iqWDxFFweCJRDFWWP7Kk9sFaFLNf8a3fBpEll2sMR
	 ATpSkdIThQSm8jY2RFi/e1Q4U+1trJft609lRYTciLkcQk13tzVottOLf2+HREtEciHBT
	 Etm5WsDFv6gjPQHEdk7Bgitoz0K2HZlXeBcGR4cYEMkIr8VMv8ICbd5a5jnPmZwGpWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2Y3gNdl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jut2JykM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95926606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95926606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2Y3gNdl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jut2JykM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t6Up185928
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXg29oI0BzMp9Wce8FtHMSF+MR/+HfdO6N47KyWprp0=; b=F2Y3gNdlDoYAG2Xz
	O5R0doyZP2cg2KtNO8rz0yNUGuQ3JFKJmzVuS9PjkU8vDHuaxP6BC9R+gpjAfrN4
	/vKvpu9yhhb6LoNSWjXPxbSWo8uHtUg5B0neFEOtdEPatSpvL/h8XMCbJeoppsGz
	SzIWalGdoQH5ryX8v+TP1t6uDwoQ80sjdH6+IyxypSK8UZkFuMx/xdZ5Eg/8p8Qk
	ujgSetVeoBDc/QdYpbfa7Qq5BkouLTKPKOVEybjNk6+Di1bNjivvvGJ3bp+VOtjg
	7fhJ+aPWXrzeto5TiqsVAL5kuze7b1vbBA2LauXT0vHUZErOnF1lCZZGy8kl7L8a
	x3STAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsbm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:18:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso996880685a.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480715; x=1793085515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXg29oI0BzMp9Wce8FtHMSF+MR/+HfdO6N47KyWprp0=;
        b=Jut2JykMUxV/M7c5jRsMtDUgcrnyCjkXCebJSbExQUM17lmQMweXthTgXEh3in2nOc
         aaSlK7apGZC9bSJj748fMcO8h5j4a/JNLsNUmz+dEUfoSj3gBS2Bzkmzs3xc2yyu/McZ
         S1jiEx+gRNHoHXns854ZuhAwAR9JjDWjv9geLSyoVkzjLy4wj4bIIxnBrpesMWUv2525
         SkN3n4FNG776u10WATuBQx1GYaSM8Qvh4bKpf1I7cmE7+4wG6sVOs1oa0kY0hL4Gg6OX
         X5nDA23Z7YFcITUFkeYOx6cmzzWkO5iMmtfGQN27PXJlHCE7MxjTyg3JxpQRGsrrsUhT
         ejOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480715; x=1793085515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXg29oI0BzMp9Wce8FtHMSF+MR/+HfdO6N47KyWprp0=;
        b=UfpFNxKuo61Lb4hI2rvWSqtQCNen1cOmodsB3cOg2ii8+GmORPx3jYyzxIVKhqaIq1
         4SZOyVbMdn2Y0WzrKBBThyesdo7RtIL4YjTfxjuKnlR9Aiwdwq11KUGJ67p85HLxsC74
         iq50nbMYLaxg0iKyiQELn9cHMJmOPfvhJhfYLpcXeOeDVNVE/tonmPCTe1sPWetwO7YR
         BD+xHqKQWTvEIhSORXKCMzGdfrJtBQM3qENO39ZC0IKWpgoM4MT5T8J2sxKSXN/nIVPT
         vBE7Xry1KhvTgbYT2ALYS/lNd2PoNNxgVnubrXjR0J1mesG2DSphfbW3j8MZ+Srg0UzH
         0AxA==
X-Forwarded-Encrypted: i=1; AKwUvBzLpkqa5UU6DacEWho2jrnh8fv2uOeJ70Q/N+78sbbQklHHxcP7ruQQLJ8AYG39+TWByYA+amPh1Aw/QA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIh8d7/zwVDeu/t7lzKceMs+s641gGPk4HtgcsEntN/CdIdhpqb
	yFQ453xrn41FGW/Nn9bAMuppF4lyd8hBp6BmM96d8YnDy26/UjKwujTaal2DE9mLI5/aPZxezd+
	WEyQqtHcL589zt6iEF/Jvt03uHxzdiS4cj1VLwN+2JrFQ+JJhLXd4REe0FI5qiAFjUA==
X-Gm-Gg: AYBFou1BBjRgllLeiGY8/aZ2uIhNJNLWvsA8L9MEo/JH1P++IdhxRzyURS0ikfjGALU
	shQlVvIHCHAvpjyCXzDOVBQF7V8VkhApeMqOb2Yb3OzLMxils00CGEudmDHQnx0YxK9XsFbIl6c
	7GYui69j6iogbMO03qWLO5gmSz7UrM+nOC4AdHMCYOT7pt/+w0gX2IrzMhO30g2wX9BxO8yxZ6U
	/x36wiEdz+vl3Cn2Ejl6DkF5Dm5/t8slIIs1hyxUojTvK/Tf+SrLkwunInX3mSxro2GevrPnvvT
	vcjCscyP3AQN3i0y2xa2a1VEVSdgPlPOW2EdLFHtqawborid2KEyceguQvgpP3yfatwjXKb6geE
	mrhZ+D3ktxhFv72/4hlKN+ge2gA==
X-Received: by 2002:a05:620a:6e93:10b0:93f:34c9:9248 with SMTP id af79cd13be357-93f34c9951amr881009485a.22.1792480714873;
        Tue, 20 Oct 2026 00:18:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6e93:10b0:93f:34c9:9248 with SMTP id af79cd13be357-93f34c9951amr881007585a.22.1792480714420;
        Tue, 20 Oct 2026 00:18:34 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc8e98sm54686715e9.9.2026.10.20.00.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:18:33 -0700 (PDT)
Message-ID: <d9ea53e3-134c-4721-85ca-ebced0c772f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:18:32 +0100
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
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
 <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F1V6a_Pu-xeMUUe0savguw6oqaK5d4Yo
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad715cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vVX-E9A3s3TWsTXgiVwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: F1V6a_Pu-xeMUUe0savguw6oqaK5d4Yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX7wue7jeLvCUB
 WR4UXYyEp2Q3sLn/Q0dC/rGWYxrEKda+HLguZCNOnQg0i/vnnoYqh4lpmmvZBW5OYap861/dw8r
 JSOagAgQbbQOHSl7bjBatpf5RCds5Xfk9QRHJc7qkZ3/4ir8IzsYZ9ihetmM8vTZJWI5LtlygJr
 mM4edxSVYiwp0nw2rPfJPko9dnISVgLUsi7RwC5bvgk33Br5ZbsBr1axLTFEeizaFs2sHZejMCT
 ePRrZAK1XVhL9C52l0xcpGwOInhLNksk7putBc/g793xBoOxtwEjVefH1ueZ8nEPB3Nb8P5GofC
 Q7hy1LvscpTTgMScsFvVBbpZ/M7kWfsS0zAzUbwn6AtfJMXuqPEIt9OqrV34dAD2yO9fD0KX4PK
 mwMrsltIUxAHgRfDxPfJbt82xIZljNsXIeCB+nPsrrVZElb3gq9ag8nCMpuOLm7/wuFfOLg9Ekb
 RU3RE0TKxb93b6SCGEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX+It+fPBt2Hco
 Tln+9fezf22v+eHKnrym8jLrrfe604d3fxaFugnXIDnf3LoDfiQgOt424G6ElMwjjx04rzVNfmC
 8gcMNMXpq6/nK0ZQEriSHtAYRfGyfus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 5:19 PM, Pierre-Louis Bossart wrote:
> 
>>>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>>>  					     struct snd_pcm_hw_params *params,
>>>  					     struct snd_soc_dai *dai)
>>> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>>>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
>>> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>>>  	struct sdw_stream_config sconfig = {0};
>>>  	struct sdw_port_config pconfig = {0};
>>>  	int ret;
>>> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>>  
>>>  	pconfig.num = ret;
>>>  
>>> +	if (class_function_terminal_is_pdm(entity->iot.type))
>>> +		sconfig.bps = 0;
>>
>> I think this is fine, as you say bps makes no sense for a PDM
>> stream but I might need to spend a little more time working out
>> how this all propagates through the core. I guess my concern is
>> if other drivers don't handle PDM in the same way.
> 
> It's a bit odd to rely on bps when we already have a type for the stream
> in struct sdw_stream_config:
its the stream.c which checks bps without type check, i have now updated
stream.c to use type check in this code path.

--srini
> 
> @type: Stream type PCM, PDM or BPT
> 
> 
> 

