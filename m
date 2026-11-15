Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776655;
	b=ixZM3PdT8GwibyvgoowaaUxgbR8j3U/e4VmkjrHzE9vKtaY1UkcRrstUCJirHGTiVh/G
	 YwIPY1L3Uj+vGcBtCQE1kdSIVYw6+sA91CzHlxzwTz7zA63IeEoATFN4Cip0UVa0SJTgG
	 u2xud2o3e9K+j0UTH/ipiUpnu6pNMHjt/b8dp15fE5WzXXY8VsT3QM+H3HpT2QVCsjl4Z
	 cNr8lq7UnozEjh7htpAzt5LaRFYdObPpV1Q+ofqA3guc0i5Sbeqgs6YlJkGkRGMhLwCIJ
	 Zg8LCQQOrHEVPSWJgxmuuSJ7OAyyu4xle6osDuialyo+1Z4Acq6bBmarGW+DQuHR+fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
	b=bbl4QonyxHYkc2CKx+6lUT82Q042L6DSzHWtZpc5d2KsX3gP1tmba2xkJCKOjCuCn/4M
	 yj1kBM/iy6PU1kxfCQ3u0YSi9IxDes8713Nok/YalAFPb186CmEnkdykaHqh89y4CfBxt
	 FrUayHOBNqSsuC7nmJY9NvW+nSimBHprcKqvQabjSbzsL4WfLotkPPnEvjno0wknGxnTz
	 DetOzLEylGKT/VwtcuKzyIgvPZqaj+S1jMotX0OoyJAXtaZ7Uz2Os0jRz/eD2e8bi20/0
	 6Nt4Nkp1sCww4O4r4aPzXSqRRTGZmzRRjc2kcDBQozZox/US3lB7DQ1S9S+qfKS5JJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C2606A332
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRtRA2940199
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=; b=hXhbcREU6EwFVDDB
	Ac8Vq/qFfizpEk/cik4MmxFQpCXugF+GlgkILLWppwGilyRz8fnK3e++71wVN7Zq
	pPnPwFjle7rgE9KBYeE3NWGOtNccZhbYTL8qP4hq09PCSQGupbcRDLF1HUeqIDA9
	xbblNuUZOCKEv3ciOHVFa2fwZKaU5Spa6NBHGecpSv6IO2QKJFuIgX4RICwmcDa5
	79GwDYzfn2kz2k6sNBOXSFQfyMaSaylcIopDsNYIS2iKIwqJsyUBzMq6FgqmpUY/
	Ce0xE1QeiZ81fcTIL/ZDAHTX7vZyfCjcYxDLjOCU5iRq2QvofjZMFXKkOsNp86Sk
	sJd9dw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwbqku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907de400a6so492979241.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776652; x=1795381452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=gbbohgdl4ZiKWFeaQxrHxD6Qook6v29MRorFw8KuCHOI8M80aKqWbg3AMPrs6ao2Tw
         OZC07Hc80Yv1ytjdvza8NG20LDJh6+B8xM5Y+W4Mf5s1e0XY//ygCZl5UcnYnp/3LZDw
         JXs9k70pxgbKFpXLbrs7D28fg3p/99SOw77I4VzOg1CSSg8N3YwUiKH+j2+HJVaE+aq8
         rIumeBmWO/eAllqTDbs8dYLXjxfm1nEEqHJa6ugqn4haGPIxKHgkjh7BGqvmrTGeVckk
         6CCWmIOY43pNwFnVoR/OEP3Nzvk7iiIsaQF0uq+MOulzP7QsQcaRrU+TC3Ntlfs8F7bc
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776652; x=1795381452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=X/Xs93p/Z6+UQeD5pkGr7zAx6g/WHHH6r3f/NbTKA6UOA6OaGEutOmI8NkB7huzexU
         kukRQO701D4Yw3Vz3tQ36omHsC11+R7g2Rw8YhjX3/wAC8dgjHS/Hi0Y29wvrqJfDrp6
         emKjmzXe0zJNT6CqdKXFhtLHsJFxv/c/d1MRfd4fK01EAR17BBsVCaISt9EBXLzY1iaX
         yW657vL9AHyZRJHW3T9y+Mg3eGbvVokVbd51Bg4BH8muKBABYZetN329E+FMN2V8qzSv
         5Lku2/X2aFtaGgY1b24S3ZJW4XKemPrReMQ5YXE269tBqkSGtloSS5cPTrcMxep3+hJm
         jqKg==
X-Forwarded-Encrypted: i=1; AL+hErHLiOd1f2tAtR7w4T5X8wwRTuU3qq/hK1JdtnKQP3bsU2hmLo19Ki8iGKSTThYfB07SeFucC4ilFS4nrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8t7nZae92J2oaQBaGq1tjbTjHglGFpfonWULD9SanhqrheXTG3
	EHzLyHxm4kPYXHb7RmgQnoEoaNUBfAI+f11H5wL0ELfyycACZJJVY27ugE3+1t09bvGPsIyGPQn
	HpSh7lH1iCH2QKHqLLnjcaRQe7T9iTjwyUhJ+HHK4bEQqCW9dNIG00o1Rw8NauJ5ZMA==
X-Gm-Gg: AYBFou3rFmHJEIbZOojwGGQEjWojfRIL2xHp6F2pni1tEr1Yj3wWyfHa0qlF8Mrd3h2
	wqpRx9WBNZbD0oL0oW7SFXUhEfUIcBqO+rJSYfM6YxywyoMxPpV1WUIaiW0GRSHXs/KXwh7myW8
	3JA+s7JHjlPKBxBXo8gbeJCT9aZ6Q1CEFH3BXqCBRVPkshFRE7AB/iqy3HUzHwYK4YcgSy3Rp5j
	n1sjQE/YImm/kRYbpd0mJisuultTrQ2dfHb1eitl/el51mt/EE/SOvfDoGgA55ic8loQhWtdfJq
	ETUV3x1t+xKv7kIM0jmrt+sNi0ZLRBx7JdbXrLxdD4sBwgwC59Xbp0aZXlavdW0TaXAw2O+XAoy
	uvbQd4Ih2TVzMboAO10fj1pAzd8ZrTzSzv5CBHU0wanYUnTjmft03Elf96Y1m1M960lhLrJWOpo
	r8
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883011137.34.1794776652400;
        Sun, 15 Nov 2026 13:04:12 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883004137.34.1794776651917;
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Message-ID: <85e400f9-eb56-4d8e-b791-ad00cbbdaea5@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:10 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX1QYHMmPE5qGo
 z2W7SMtXdyhG/C0e13R+HEOOydG/lRucalYcQO4fj2BwsV/BkqBzoeQwVOOyr8eACHBvp4t41ce
 rRGYw4LlP57WQ4C85FrvOGYBm7HTuHEul/FDjHZLLeFUzWCc/1ISVx6TDESi8oTCag6UZQ+2Svp
 5JSpEbPONIK3/aQ4qZR+oXVI0TYpOlgeDQyaX01ls/hbzh3/fQR9yVXalbF6Ht+OEdf2H92QjK2
 cFTCulGOlfkUg8rNmvmTKGtH9HrHbKtL6+Eog4LjypYepnTxWWy/0cSps3SrSnpjyEu58MtRfcm
 a6+kAFwLKTPN/UBedyey4bzela4sirsL9MKa9FuRV/g7tWDBe+cUheXmMfRZtDXl6o531LNMBWe
 KW3lm7qSj8tZORY9tGECSbrj3Nw4Syahflpm+2Zot48OKVQgonB0aM/6B1om8NCwUWhfG+XGTUc
 Qh6cm5aX7/gf2O18sdw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa1e4d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xKiGHf8qJV6DUAaYMh8A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Z3Zk-ZYVPHW4lDvlc2IfrvQiXHubL75h
X-Proofpoint-ORIG-GUID: Z3Zk-ZYVPHW4lDvlc2IfrvQiXHubL75h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX8sbPasH3b//r
 EnPOAS0Aiwp6hy7TzK8qdIYgDmUou+3Kt1blYg5BkLc926HkY44qje+7mDlJN7dEk1ap1PmvHe8
 n7QzG9O+E86GV3TYRs3RCCRmDO8aSUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the amplifiers' V/I sense capture running
>> whenever the speakers play. Putting the capture codec DAIs on the
>> playback BE link ties the two together, but the core skips codec DAIs
>> whose direction does not match the substream.
> 
>> Add a multi_direction_codecs link flag. When set, the core also calls
>> .hw_params and .hw_free on codec DAIs of the other direction, with the
>> substream direction switched to theirs for the call under pcm_mutex,
>> and sends the matching stream events so their widgets power up and
>> down. An optional multi_direction_params_fixup callback lets the
>> machine driver set the parameters for those DAIs. Links without the
>> flag are unchanged.
> 
>> +3. Optionally calls ``.multi_direction_params_fixup`` so the machine
>> +   driver can rewrite rate/format/channels on a per-codec copy of the
> 
> Probably worth mentioning the ordering with regard to other fixups.
> 
>> @@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>>  
>>  	snd_soc_dapm_stream_event(rtd, substream->stream,
>>  			SND_SOC_DAPM_STREAM_START);
>> +	if (rtd->dai_link->multi_direction_codecs)
>> +		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
>> +				SND_SOC_DAPM_STREAM_START);
> 
> This will update every DAI, including CPU DAIs.  That will mean that a
> CPU DAI could be flagged as actively capturing due to playback or vice
> versa.

Correct, we should limit this to codec dais, will fix that in v2.

> 
>> +static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
>> +					   struct snd_pcm_substream *substream,
>> +					   struct snd_pcm_hw_params *params,
>> +					   int stream)
>> +{
>> +	int saved_stream = substream->stream;
>> +	int ret;
>> +
>> +	if (stream == saved_stream)
>> +		return snd_soc_dai_hw_params(dai, substream, params);
>> +
>> +	substream->stream = stream;
>> +	ret = snd_soc_dai_hw_params(dai, substream, params);
> 
> We flipped stream but nothing else, if hw_params checks things in the
> substream->runtime things will get confused.  Usually everything is just
> checking params though.


I think the documentation should capture this and the codec dai that is
supports multi-directional should be ready to handle this.

I will add a comment about this both here and Documentation.

> 
>> @@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>>  	snd_soc_pcm_component_hw_free(substream, rollback);
>>  
>>  	/* now free hw params for the DAIs  */
>> -	for_each_rtd_dais(rtd, i, dai)
>> -		if (snd_soc_dai_stream_valid(dai, substream->stream))
>> -			snd_soc_dai_hw_free(dai, substream, rollback);
>> +	for_each_rtd_dais(rtd, i, dai) {
> 
> This has flipping that __soc_pcm_hw_params() doesn't unless I'm
> something?

Yes, this needs to be split like what we do for hw_params, splitting
both cpu and codec dais. Will fix in v2.

--srini

> 

