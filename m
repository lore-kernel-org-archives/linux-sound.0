Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480643;
	b=rKvo+nQ5/A9rxHcVBCNEKvix8XCPy3h0vOlmOGyuqVWYbY6Zjg6wQdJjcHS9zhcBkegM
	 uyNi7WPrutcE44/Ji0jmtMjMAxEy/QyUpYe3Piat6uwz+XzfoFMKLk983hhcdmVnQqjVq
	 5smHkrzDSC+LxOdIRsVi+JoPYkGAm6TWfb9DUUPhJ8d5LdhxlCG8n65HPk2BdtB5WZ/Tb
	 2/L/fwf/LkA1O5Nz58wGYt5wOJmWisito9SAr5BYVMzOHUXKUE5TYQMLMmOHF3a+oUFP6
	 wAy/PtHt7R+7Jai4ZcLAwx9g4R+BtVxYnyILve+7D9LBEjyF9fR0ZLGRER7TxdfwY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
	b=Ie7Tt5fqyGHs1q9be1DDEwFFZgSgk1+QvqQGpMiJV9yTN+36Hb4hVIGkedmbtObr4lOX
	 hZZF8WzS0B+/+aZkHp+gnQX1/K8J2R5fR8TBnXb/ElNFVT7nrRr+bVx7Ki+yNn2nmvnHX
	 Ch7GcZUpk5qjwdWwY26G8EBKP228+nT0Q67oMP+9DS7biQbNKF1uNXpVrqz7kAWI9lsEj
	 wmEOsC/a9Yt7RCcETRHn+auLg9/l2kmXn/WLRWjNtnBTMw+5BPTCKTy0O5NrPybbgXHuw
	 GC3l+lb2or+RvMVyi2GI+74df1eJOCYDDuNyNTFy4sAlLzBiknp6CC9f9Ie7zBarQxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ar2wM1oj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPT8LlrY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5F60A2603
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA5F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ar2wM1oj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPT8LlrY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAgn3485726
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=; b=Ar2wM1oj9l/xMfdH
	6Ld3lzpHxDj4oOkoxQXeiJKZBqc0aZ7Xs0f56igKT3qUV9/OGwCj0wMrBUMAzrKR
	RzUmiDm2QpBrAsOcuo2L+jm/1kgg2dHxvmtjKbcNbW3blBkVqV23j+okw16t2Jbe
	kFW5mmtCkQzYpolrdNo2TxWYhE18k9ixFXCupN09bkch33awGEElY4jdcC6HEcwI
	8RR8mNsz3HTaK77mdPvT8uFtpboqYPHlty+X6QjkP9bIehr4uyfud36puvZS2qcm
	79q8e/h/eifuQTBnYQuKkGE8WL6g44zU+JTuOGreHGwUEfehkhKeKbjA/7k35ksk
	fyN2XA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1b73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:17:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so632049385a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480642; x=1793085442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
        b=PPT8LlrYnzDynwTtQelIwzVRKgRCthM4hXe7BhPKQ7sqB9P4tl7mXdcKL/Qc9guz+K
         e4l91u0njn4chfWFKvzm1qxlmq+TIvAOAQed7uN7eqcIAw6TkqI71r/EKpzHYqNl/pPw
         q6UWHpneJ4EseFzjp++qbyF6WC6T+RNag76QsSqQRaD8PcmsFIg2DCjlZGPDLcL2JCMZ
         iMd4/ZyipWwuJBrbC8PFtoj69npimgQtSx2S9/pts+PLO6lBXq6Qp9hi2L9CIrcYziGq
         tWDUDk1Wvi4Ag1N5TgMhqr8VGPRdogKWBDuRuNiuVNe8jtOqMtwJJzhy3pqFdKITJyg4
         +Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480642; x=1793085442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
        b=DB+Sw/RGN6y9RPiylwU05midXwI+oiLsqrAjcAV+uGYOC4Y2hv94RImfppPNHteXON
         YMiOCPeRqcAEPeOOYex3zylDhZrY1zsCLTRRrdsRmr8jT08keUqLCPfzDjwi08PEpuq9
         9lbQ07ym7LMGrr1WySbEoyl7mb3C+ZSV30iKcJwxgfJMYQYeT8z/UlHGvIuRC98PIbS4
         I4TawgrRNZQblFnC5HYZRHSSjA6u0hCFW5dknqpZHchVTdj+xjlBZS9U7Qsal9JSqJvp
         qtxqNJWKAA5kl7fXvamJ+39LtWkNEf1OM4Xg9B4SZaDL+446Zyg9BSIUXo4Gd5hZHRNi
         D9DA==
X-Forwarded-Encrypted: i=1; AKwUvBytLMX0p7H3ScZLBC6fw119DZ1pM1ssTQwdTfZI7wFUQl8tPAYwh73luOUFzlOYIUcCBWkLoDfEjsnOrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGvbuXNce2sUGYAIlyx0hkuiEtv/vEkf6lH7KGsUviN+43Ra+G
	abxyWydBFS1DEyeoJgogQEBksMbnhAtDPhuRaLnx1spIHiHxao1GkJOwLfK0sWzS6JJ+C0Egpb0
	uLgwpWqqrX6FHGLkO5lv3PXVoe4wrgk283FRbixHgDsrUs85TxD4Dm1Qh4stl9gyYqQ==
X-Gm-Gg: AYBFou2StRFhlGYTlyw6XnTk1K5T5O0GOWkJSVvWDsjE5TDEKd3OCwNcLT8Oe/eQWDn
	5GmycSgSjwPwrFcYjacBLvbD9UMS1gQphzpa7pbe7QVbe+XdmF8TrsnDy8dJL/nbhevR5dCvpAH
	mEY+LAf0shDqpGALp89o7QriA0cG0rpvNWzecTv7sHubMDSCMMa0qCZvuqjhZAzP79NyiMnGtQg
	aFiiIHyVn5iZ230iCO4vqtT6AqExC8ucDKoYXCfmmik5+PZ1T9FnGlTHgZstqrNvYvjhgfT8svZ
	HQpyOBRYChPI5zMohv9/eXmZsFUnVisFgAgy6PVpawh16vz4Y0PB6SCvTDlLsmK9033T+yqInsf
	cyiXhBfwKysS3JsQfjcyYjXH7iw==
X-Received: by 2002:a05:620a:a2cc:10b0:93f:33a8:8e99 with SMTP id af79cd13be357-93f33a89085mr890510185a.13.1792480641610;
        Tue, 20 Oct 2026 00:17:21 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cc:10b0:93f:33a8:8e99 with SMTP id af79cd13be357-93f33a89085mr890509085a.13.1792480641137;
        Tue, 20 Oct 2026 00:17:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbf12sm4264944f8f.1.2026.10.20.00.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:17:20 -0700 (PDT)
Message-ID: <123d6912-5b52-4d57-96f8-cdfa016ebb11@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:17:19 +0100
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
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad71582 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YYYObzUzO3kg1-Zf9dIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX4mg2an3oDk5D
 fklpQ72/cF8lDCTcYpWMWlH73hEGpVndGDE6KvDuFWQetJqJ+rFhx5vMkwcJodl1B+Mn7X83w7G
 U4ynRLyXm37dnheHaqyNght3mBEOhT8=
X-Proofpoint-GUID: DwiidR8HJoKEdJFyc-HanIe3sulQVLwi
X-Proofpoint-ORIG-GUID: DwiidR8HJoKEdJFyc-HanIe3sulQVLwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX4KHSYLraxRcX
 QKaLjvvMn+UGjcEVIAIBrv2ffjZ3tb5jIKwL7R7Pq7BUCw+P7x0UKh9rAnPW2rAhvE+l8jX3xQT
 mQZlWDGgg/FX3daAwLQh0Ur3BiAU92EKM+iONtbe1112gSfA21Z4kDb1ddHxI7Bc6SiGUs2s6lv
 aB59Fa2n8Xk1MK4YF/Oa+mjO6UsiGrW3ogAHPOBJ4wMlzTr8QzYlPOpKHbyNySZLwWM6nAt4gkI
 8msqhXxRDxDTl/Ixj+R2KmfGXZNG2J9USKjm7k8cws7Qig+cQR/BY97Kn0Fg/GJhGYdPCwIpw+B
 S97+eojUD5PQJz9fT3KXpYFP8qieW/xgxRrwqM6f5p6oY1dYkoqeyMZIaGovYlhC+pBXrUDMmIf
 zWYw3W5S5AOIa4lcL+gxxf4vSQ6FZZPjgGUKcz+0E5SUB8RjMKCUnBigpWDgvXaCWYPs+mrFadJ
 xNQa5STd06odc5kANQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 10:02 AM, Charles Keepax wrote:
> On Sun, Oct 18, 2026 at 08:23:59PM +0100, Srinivas Kandagatla wrote:
>> snd_sdw_params_to_config() derives sconfig.bps from the PCM container
>> width, which is not meaningful on PDM data-port terminals and clashes
>> with masters that declare their own view of the wire word length (e.g.
>> the Qualcomm SoundWire master hardcodes sconfig.bps = 1 for PDM).
>>
>> Clear sconfig.bps when the DAI's SDCA terminal is PDM so compute_params()
>> or the slave silicon drives the per-port wire word length.
>>
>> Assisted-by: LLM
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 13b70f0f0dbf..acaadd12432a 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -126,6 +126,17 @@ static int class_function_startup(struct snd_pcm_substream *substream,
>>  					 substream, dai);
>>  }
>>  
>> +static bool class_function_terminal_is_pdm(enum sdca_terminal_type t)
>> +{
>> +	switch (t) {
>> +	case SDCA_TERM_TYPE_RAW_PDM_MIC:
>> +	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
> 
> I think this would make sense as a generic helper in sdca_asoc.c
> probably taking the function and the DAI as arguments.

v2 will have this change.
> 
>>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>>  					     struct snd_pcm_hw_params *params,
>>  					     struct snd_soc_dai *dai)
>> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
>> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>>  	struct sdw_stream_config sconfig = {0};
>>  	struct sdw_port_config pconfig = {0};
>>  	int ret;
>> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  
>>  	pconfig.num = ret;
>>  
>> +	if (class_function_terminal_is_pdm(entity->iot.type))
>> +		sconfig.bps = 0;
> 
> I think this is fine, as you say bps makes no sense for a PDM
> stream but I might need to spend a little more time working out
> how this all propagates through the core. I guess my concern is
> if other drivers don't handle PDM in the same way.
in v2, i have now set the stream type correctly based on terminal type.

--srini
> 
> Thanks,
> Charles

