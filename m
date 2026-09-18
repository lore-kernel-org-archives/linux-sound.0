Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869DA432E65
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741228; cv=none; b=Ns+u1Ioscq+LE+/jrIOnpXp5r7togSwLg4Q4hbuLcwFZkLuUUjD6L5EMqmYaMJCqUI4LzUUPSZXRMd7WOqKtp0PfERHBz+9Q3vbPkxk3ccvDIhxwVMKfZzXRp6L3ueTx5yOV7vGNUFzQl44KCXUc9SYG2tr9MW+cZDWsFQaQlxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741228; c=relaxed/simple;
	bh=gJTLMCNpjxCPB/O/GnGRRpYU4FhUYAffCj2gOaX4u8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyqpDbsgraNc+A23aroezG6pFWlt4BgJB9vmT4mMhrptryk5XgGsF3P5p8SxkkUAKxtjObC8txjpQ9KC4s9MXLfUaKhbKECAV0DTMgO2HnJ5nHwbYwRehJjLiQu4AZJvB8hZHl8tFZmJCxtcZrOM7sQB6hcASpOeEJ+3ZOnk/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsrtoD1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGgLZcdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsrtoD1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGgLZcdW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOXRQ745828
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 14:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=; b=gsrtoD1oE4vbHlyj
	YPwx6i6qASESItiVEtczLACbXnj7z/2yGZm2Byj/2zQT3KFQ2D6iSoekt07Wlltj
	yLttejpJ+M3IVSKuKb7xJXiRULU196VIExn+Yb2sX12XCTTbPyQ4fF48nHvFQ5Oh
	PNbj6it5UC7uc+m0jHzEI9cXg9ZQ/PvB0Bs3RMIi0sYdDytnKnzRGR/jpl/G69nf
	mnsOlR1UFBikOT8NUmKAiD76N5bDLLlyBEkN2NRFeQDORgG+oIdxenYgu5CoOFxY
	JWJCLC31f+ChCsnwnXN95Pkapz7gV3GwT8KryyS2GtgebsqFNYa8hRZqSSw3/gWY
	fIDDzA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23919ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 14:20:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106fce784dso15637356d6.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741225; x=1790346025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=jGgLZcdW+WlEp46eF+hiDATS8uyXY94yeogJ8I0lkxJ1fnc0u5xMPLqWKV3j0qt/HO
         bPR/WP/7+mH7gtKDDiYEusnVibGNzCCX2LAt6/Ok1eT420lcKFGqQYetyi4e1Nt1bQY6
         PbvjjcfnHwlpKlxYWgntsH5pXC5UhtyoHktHDUwwH+1ndtaqQBtQuAHQ6pBuuxXTwlri
         O5xDpTsO2DVGyq3+FKkNTI8AU4dBjLp1evOlfmcbRRjnDuKDwYTYTzjMCFvHSoMh4F9+
         wBOCCAuEsU2XQ8OF78lrqTjWu5DfvNtsJZzJu5Dt67EkfHBwfLOAIzv+Mwe29gCQnF3G
         UK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741225; x=1790346025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=pBCOV08B6Sx2vZQ9rLR9dP58Pv6T4R+wckXsbLWbeRqZhBGyyoAgQbM+QYBO2zYTs7
         K53qYLLhKjwM7ou4XKpugl2SsthUGUSbhAeYDmlkiLplZvJTmLlEiJY26j4qfyOE5N+p
         5bP54KwARGcJUWAdhr+mo41o7JzJWmArbaoMjcP+9cyDcvQIX4RDQeC0P2//TfktSiEa
         vS9PSxqr0tmfnPRe78lkLgFxplh0QfTcXNnxR+G48nJeZLrQrNNU2wi67cU7LYMQy0rl
         tuzxhrJJnRY3mYorbGGl1goEGPPjALhHQJDg/v49C7iUVDIqlAZ7Ascu1XJEPq4mXlRm
         qzcg==
X-Forwarded-Encrypted: i=1; AKwUvBwSmoTejfWS7o7tZ0nHY0u5IoZj/95pNYPg0O4NoOGo7HZYCchBoifxoiIu6KX8lYls8mNcLt9InFq/Lw==@vger.kernel.org
X-Gm-Message-State: AFuF++mG7SaJx24JrLz0/yA8p70g+E2GKPoFjtD9YPkrnLHM4KB4ChXb
	Z2BXwbmL4cEAykq9HN/U+9S81zZdwpuo1jcjT2y2OtFpncA6BwOUImVQnXYwg3PZK3C9nn/UZ7A
	deSrajys3DeZbfezBemQMpkQp4Kf7oVCVSO3AafN0p2/wLZjkjFxbhcIjkQGUZyTz4A==
X-Gm-Gg: AYBFou2hptBpLnZ7Mq8u1vsT+lAFeurXftIKoR/SrJarzKz50Rxn5zzFuJt5X77yhn2
	hJpFmJH1G1kI2qIXHUz4Ul9FHXFXLVUeZvouQABOoF+3428gTV8sfp7dnl6FoiJzVtlhDJpGn9M
	JYBYiVkI2187S55eGX0SX1JlvHiBaNVSBMQm/HpkQ3cc9DGpegQY9Me8nTJLs/se1GXuPV7eRee
	atbi04HYgDZQ8PjD9syrw0WgLKmZ4u7xzMFvxVyJFNATlMceVj5fWNygj7pMz9Lx6SaGLgEstKP
	Ukizpurst79Bq6/7PYWk9+WsbWAgU2OelSrOCnrmXILlLZ6pXhJYE+6YGnBaWevrT++om86SWOW
	vlUsLfQsuYGH6AloxcLhPhNeI9SU=
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372714785a.34.1789741224649;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372707685a.34.1789741224091;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a1bb8a1d2sm62661166b.40.2026.09.18.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:20:22 -0700 (PDT)
Message-ID: <13ed4e23-1092-4e6a-82ce-b36c1a0016f0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] ASoC: SDCA: add
 sdca_apply_default_control_classifiers() helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
 <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX/sVubEbHxAsa
 +vCd/PXb6QXdgYuQy4yd4OR6m6WxQMdpw+N33ExzzTQZIwvHEsy0m1ox2jbiSSZTt547eAcOg1/
 Au+byvdgaHGPDs/7IBa7tYT/9xTAx3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX7llVHTbPVkGf
 OGzSmGnS83rYijvDT6SmS1CmDPsGvBUQKCYUK90oa7AV4qqEkTeWtTB/E3yoeCxKcQv4dXX5/RA
 ugwnJf1CHc9ycGT8IeJvVA2MRQEHZabiJJiVddH70omwOIsXpZKCCkXIBmEtpx6++IsyeX2/UTn
 zUbGN3Ky5rrpJyldKM4R3kIZQL84C31gFCDIm9Yy/yMtAts3CMoq+HTZIBi1/jxXN1U7ZZ3oI9s
 cRzLTq64iF1wIJP9nJjjR0UVgV+0URV/iCckJaYvpiOxTav8TuRzOwF4pXfoVSPqt97ikuFUsyl
 he/H/u+PT7qkF56D8wDR1Igif0W1WTfkDsKMgsUy4w6XfKeUvrxUAbLtBZYEEYDWy3wgjMGOeE5
 xxzTJKCprTlGApxR5jeotM297McGtUymKN7gmEU4veJn5BnsuNx6PBjcNcpSWSzs7ETD0C6usez
 +Qhx/ppYrXmon4WiuTw==
X-Proofpoint-ORIG-GUID: 2i4BCvJQMksfeI3NWyqLgyhJN875O0zs
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad48a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bNv17eZGp78-fAQ_3FUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 2i4BCvJQMksfeI3NWyqLgyhJN875O0zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204

On 9/18/26 3:16 PM, Charles Keepax wrote:
> On Fri, Sep 18, 2026 at 02:19:11PM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
>> spec-defined reset value (see 02d851b46b36) from each Control's
>> (entity type, selector, access mode). Codecs that ship static SDCA
>> tables via populate_function skip that path, so RW1S action Controls
>> end up with is_volatile=0 and get replayed on every regcache_sync.
>>
>> Add sdca_apply_default_control_classifiers() to re-run those two
>> classifiers over a Function. Elevate-only, so codec-set flags win.
>> Call from the tail of populate_function.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +/**
>> + * sdca_apply_default_control_classifiers - apply framework-known Control fields
>> + * @function: Function populated via static tables (populate_function path).
>> + *
>> + * Runs the same per-Control classifiers as sdca_parse_function() so both
>> + * entry paths land on identical @is_volatile and @has_reset/@reset fields.
>> + * Elevate-only: codec-set flags/values are preserved.
>> + */
>> +void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
>> +{
>> +	int i, j;
>> +
>> +	for (i = 0; i < function->num_entities; i++) {
>> +		struct sdca_entity *entity = &function->entities[i];
>> +
>> +		for (j = 0; j < entity->num_controls; j++) {
>> +			struct sdca_control *control = &entity->controls[j];
>> +
>> +			if (!control->is_volatile)
>> +				control->is_volatile =
>> +					find_sdca_control_volatile(entity, control);
>> +
>> +			if (!control->has_reset)
>> +				find_sdca_control_reset(entity, control);
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
> 
> Just set the values correctly in the tables in the driver, I
> don't really like this going back and fixing the tables up leaves
> the driver tables looking slightly confusing.
That is one way to do it, I was trying to be more align with what was
getting done after parsing the acpi tables. But I dont mind updating the
tables directly aswell.

I will try to document this so that in future if someone is converting
any acpi tables directly and then they need to mash up few things before
passing to sdca core.


--srini
> 

> Thanks,
> Charles

