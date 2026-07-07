Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5121188713
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 04:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398906; cv=none; b=quWaC6Dt83N0kRpafOBWOO9BMIDAY/h/f5uwUpT2/W6OkSYIwWAryngh5VcKhBUDUD0+fgYftScnT0S3pxkdTBSfV50uWX7eL8ycbWVOmZWtG07G+l8k9FAJoWDBbuYxKTKXku1oE5e4zp8Bkk0hjkj8YSXp9uDjA73YPwLVsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398906; c=relaxed/simple;
	bh=0ZDXcfZh/a8ozHKkJratTsK93XDJ1Omu/IMErKmyXOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDXiAWO26l8MVsY6OSiSQBhBNLUJkCMrn5c+kZujV5fNOLOwQa/5EtPOoI4n/BLNwk63+KGbj2fWhXNivvi7/UNVn0KAjB3W0r976qL7ex9yQ55V1uGfIJkpLrU7Ar3wsHpLVYun8BAfuzO5WsxJzXAPnvz2xZhzLmqEEwGXBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEUHYdCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Foa3/5TT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEUHYdCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Foa3/5TT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mtd2450302
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 04:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=; b=kEUHYdClJ6JjwNI0
	L3tpe27LIP3BusL1/hwEMnHLchU+QzLwjmeNryYtxVOTQgNmThgUaW0Rch1MU6Iv
	xgWP3QaKoz1JgOPJXKLd6yCtDpQbiiduduRotxQqCLQa93cObXcVJ7PAOX0xL4xz
	1fxIJxfXb9c+QC/SwXo0vScd/tIN3tkjRUx3a1iWXw8+3ZLvHYvAG2Q9XVMw3crK
	SXG6kwcTZlFjw7htlACrFnr57Su50XC7M7iVCCMUjRXFKj9vwFf7IqoV86HmNdSB
	0mWUmDca54VEb9XPWbUEvx0sd8lcnOY6aig1cg7tvenc+LLIFeSupo6s8hacQfh4
	NPIl3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su7047r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 04:35:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so325984a91.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 21:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783398903; x=1784003703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=;
        b=Foa3/5TTIUMtkVOb1gdfp7DRex7NG5Zgdw30M319CQaDClRinAbsJDNB2dCdb22zWR
         d2vOXOTIe3UHQRrz4cOHT1u4EW83BwgTQ9nx6KUEo4c5MjNgR42qlxFxQKQt/bpUtzP0
         wpmqAcgCwMhbWSQkcMtK9EqRxKhetmT4FEdKq4iAga1S4riAoKCwPpDBIrScrer+QVEM
         To+HRBjV60K/Oyg0Hq0dB0U9D0evWnBrZSLVQjIdAP/Qn2QvNZBSvgWhiCWvMo20CBKk
         8VYXFLxIgEauhaeDzHUBNpOOCWsfrWo448fo2Bd9qyPJZeB88taK8aspUul1yWyFYZPp
         OciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783398903; x=1784003703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=;
        b=GsKQLj8m6Mt8EIoOcBT8XCeBgvfWJQrRZUWuyfF5lAn9zLkEiC6MdFJBlRL7t+x9pv
         Z1VRtiD/TkTCn8YomL+wVBgVCppR12EPDoK6Z7JMzldqeGTHtaoszpBSpvoXitxzb6r2
         aqDuL9WOGgP2L8dP7jwN8e61bBNR5LerxXc0HnaZklWE4SXUqEqOeGZrONYKEhSCLQjW
         hbpwSAz+HqKo7nmvghPR/+6DxGa/jArAG/ppsFgMvE/FL82nC/ooHBluuNtzKR35Vdpl
         xJtBpsyeD+kCTK+Dck16v+BfZvsolv/BxYvsyVhxKQhNgbInHLxkiqwHpeWIqPDCKKm+
         lHSw==
X-Forwarded-Encrypted: i=1; AHgh+RosYbOEQGpJfPMdov1gljHIgzXMCL0ItGYcvpdbZPVRAFWcZjgR5XsIpFkdww01ihKq3QzYBFQTmgDR4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoiMoLj2xCZRjfbwCHR+wvGEwv64ua3TgBiomw0y7Bjc+5CAh2
	uj0FgH9zXOPOf4ix93u63eCYQrO9QdxJndxB3oLg6ZYCewoZw73otKCVY2AcaJsVHavQ8lXXPt8
	T2ER7muRESTGwPBc8PY8wPrPV4olBrpYgREuFChDlj3lgXFXJub5b9/Jb9qtQsMpHxg==
X-Gm-Gg: AfdE7cl4wnNezTIUzp8QMPvRFA6m4sR5eBGAFkN3+IxeHpoz9/EVX5dEwPEFomhjaQy
	nVfMES8TYpZ/MXFpwKurL7Gl6GqM4ohWdIpEOpdWoYpbQHh3Jl7atcG1M3F0jCwlwkvM6ppaUf8
	vdCQno25jPPbX29IoojGzmIcG5a8pJKBx3HooAXkPB0exT2j97fBCO5NVy/mdECiZFrcia6pWn9
	EYZiK/bxSn4G3xtXp9g6ZTGWMbMwCTiGv7be6s1QJbT+UuzhxMIZklNW0YR5IPzSLsd7uUjxJR9
	xfRKt6dKQIp7X4nBr5e2JNP8ZjAMX525Xzdc8xnaK6/N93NQ+3gY5yKngHuwYy/PqASiqQ2Z8Ux
	dgc08lLZHjSu99Bv49MGuuG6qHal1OnsIfr7DLH/6hXgoMjwekQ==
X-Received: by 2002:a17:90b:3e46:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-387d7750f36mr1478173a91.7.1783398902882;
        Mon, 06 Jul 2026 21:35:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3e46:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-387d7750f36mr1478123a91.7.1783398902332;
        Mon, 06 Jul 2026 21:35:02 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm4147256eec.0.2026.07.06.21.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:35:01 -0700 (PDT)
Message-ID: <966a4aa9-ba4e-4f09-b151-29a77db4201a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:04:55 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW
 stream DAIs
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MCBTYWx0ZWRfXwoxAd4f3CmUE
 jfi1sI14S/WgwbWEhuz3WbkIfh8G7iRbVqlsLsU4Dgb4xpZYNz5fwVkmG0zxgGz++zLe8EaemNQ
 fwj7Mx7Vi6Lxiaf5gZ0nFew5RirkOwgdaZ9WuQcMF1AvsB42qdl7VcFjYt60IjYJBkMJGU2YbOx
 syLZVkVq/g67tRtuz/EysFzYar6OzVobvt1xzagw1XnwXG4pH0LZyJySnVO1hIStX5mtRbB4tjS
 5Jsp0vfUttOlgxadsPOG43O1lxh7THgLueQq1nMiMGd20gQpPJt9H3+1TFPtMCgb+y93MJTCWyG
 DzPguCbV38XuVcPNuFJj68r5+S9Pd3yhXIb5X5uSLVedPRMalvn/bnMcL4ZEgtUAKuKbf7kpqcm
 Oc64U5fNkn5ny706PfcIBr9sYXa/ykfqNAKc64kRGUhYMvjWAZNlucNfSmXxqrNXshW/0iJIRQB
 IlFqReo7hBc99eOzRTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MCBTYWx0ZWRfX/S2zN0vX+PsP
 pmZBb1ZQXfGgSDUKgZoxsWAWPaOqauC9AMxnYHyMoUB5pLg0SijIHCZgN1+ov6Efva8Rxdfya1e
 UYU2JrvGtxIYk2FcwaOXxtkxtyyjMOc=
X-Proofpoint-GUID: KRm7aJV138F1lpsxWeHYSx06F0WJNRAF
X-Proofpoint-ORIG-GUID: KRm7aJV138F1lpsxWeHYSx06F0WJNRAF
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4c81f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r7bdlasGZOuuhPoSvjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070040



On 6/29/2026 7:59 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/29/26 3:16 PM, Mohammad Rafi Shaik wrote:
>> On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
>> SoundWire master and its SWR slave speaker codecs as codec DAIs on the
>> same link. sdm845_dai_init() was calling set_channel_map with hardcoded
>> wcd934x SLIM channel numbers for every codec DAI on that link, including
>> the SoundWire ones, corrupting their channel configuration.
>>
>> Skip set_channel_map for any DAI that implements .set_stream, as that op
>> is the distinguishing marker of DAIs that own an SDW stream path — both
>> the qcom SWR master and SWR slave codecs register it, while wcd934x does
>> not. This confines the SLIM channel map to wcd934x where it belongs.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
>> index 0ce9dff4dc52..509d7a551397 100644
>> --- a/sound/soc/qcom/sdm845.c
>> +++ b/sound/soc/qcom/sdm845.c
>> @@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
>>   			return 0;
>>   
>>   		for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> -			rval = snd_soc_dai_set_channel_map(codec_dai,
>> -							  ARRAY_SIZE(tx_ch),
>> -							  tx_ch,
>> -							  ARRAY_SIZE(rx_ch),
>> -							  rx_ch);
>> -			if (rval != 0 && rval != -ENOTSUPP)
>> -				return rval;
>> +			component = codec_dai->component;
>> +
>> +			if (!component || !component->dev)
>> +				continue;
>> +
>> +			/*
>> +			 * Only wcd934x (SLIM codec) needs these static channel maps.
>> +			 * DAIs that own an SDW stream — the qcom SWR master and SWR
>> +			 * slave speaker codecs — implement .set_stream; skip them.
>> +			 */
>> +			if (!codec_dai->driver || !codec_dai->driver->ops ||
>> +			    !codec_dai->driver->ops->set_stream) {
> 
> This is totally a hack.
> 
> --srini

ACK,

The intention was to apply the static channel mapping only for the 
WCD934x (SLIM codec) DAIs.

The existing machine driver logic uses hardcoded channel maps which are 
only applicable to WCD934x, and this path was unintentionally applying 
them to the SoundWire master DAIs as well, which is not correct.

I agree that the current approach is not ideal. I'll rework this and 
address it properly in the next version.

Thanks & regards,
Rafi

>> +				rval = snd_soc_dai_set_channel_map(codec_dai,
>> +								   ARRAY_SIZE(tx_ch),
>> +								   tx_ch,
>> +								   ARRAY_SIZE(rx_ch),
>> +								   rx_ch);
>> +				if (rval != 0 && rval != -ENOTSUPP)
>> +					return rval;
>> +			}
>>   
>>   			snd_soc_dai_set_sysclk(codec_dai, 0,
>>   					       WCD934X_DEFAULT_MCLK_RATE,
> 

