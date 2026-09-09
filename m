Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B89556BBE
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957414; cv=none; b=jZO9guM8UJRqLMmZRErECO9IijVFJXgBcfX5qUezS8pmdBpuWD1JYJPu8bLWbJKgwbwjgYhU0JrhDvK05DoPnaSDB9Y9Xo1KB9rjIhDHnc2gag+7O0WSQfTkutpUdpGuNUMTYY1S6fwM4Yfn3J5HSpxc2GXGbb/tfOHAtcy6+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957414; c=relaxed/simple;
	bh=YfjAvPdBKbnXD2YuEdHrU87LoOtJEmtm9vYNZ/tqQ5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2qfqgLwc0Za5WYxaRxFmh2aEJKrSfa5XHhLIGlqGz+O2p2+7q9l2s/eYvfkRgPGvLTM38RTyk4k9v6OOf7cnGWV5XvBwJDB9nnupLUdbu/XcmqRKkB/5Z0WBLVi5w/9JKy2LSWWrDq+DD7KSh+PaobEd8QAon4QS9d4q38snOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SddxUvqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOcsk+7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SddxUvqf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOcsk+7m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoWfD2698532
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=; b=SddxUvqfrGD6Mnch
	t2iOhzG5CF0NdMjBsBKY8LMIs+nOEo+OzLSscn9QcwEWrjRe11DJQYn4pyDVhW7V
	cxQ6fqVEur11yuH9Ew351E87+BYW51MFbsx4Vb53iB7J37NsQTd4wObnYmQs7aKy
	AhnlOXUevjKmBGvijpOd4604gtVH1MrA96q6Z6OZL1AU+kGnsEep07qLHi92rUNZ
	P2Afkv7fjZ21B0k9q6VI/58iJVI/GqiVsCqYPhhSiYZwkGVJReWN6JMSjHDXrUst
	DcSbuVmEKgXSyk2IrQ3WtQUnwkBySJyiy5i0t4if2Jh9vWifgQ+5ZI++mIFXjlip
	KEPSJA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh057m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 12:36:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso3119096a12.3
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957411; x=1789562211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=;
        b=MOcsk+7mdgcYAUiC3pfY5xi4wAiQPYWbz0lOqCpHnbwMo4zXMMVhw4HmhmSDaMK8FY
         l0cqbEtepMUbDACLLPW+0oqOWiawTSOHS7/RCCWBg2GsZTJ6gyep9jE8IXOoAahOV+hb
         VmwEvPlfi06CCRZQ7SsTqG4SHo6z67mknU1YUm6RDjGq4unnz3sGdJTSbR8QD2FcWOec
         SzTQU+GuqI5HXdhoK7MqAC2zRjhlBje69zL/P87YYGGQ4n1sqSi/T7f143Pl1UmHTdDx
         WAJeHZZ88NmRUC1CE2S00YFFBq9vW0t+bc/N96kblIhzsx/UncQhbeIU6WApxlkFQ72v
         KTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957411; x=1789562211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=;
        b=FyVLU3sJz3NNPOpAo9nvoLizsKDQuhq+oyhs55mF73hz4FzWbfHSA1VN6E8VX2gyDC
         x8VZOyLIQ2sMipz60Bwbft/NbKInBCsDeSJfmkLhKrSrIW7yrtXWZaocel9AsNLiSATT
         pb/ks919ifXkBOL/8hyYPeNLABXVN82gMNak6k8dRD4xc06X/Wml0eYxa6K/hZMomAYo
         imyP/zDJgfQqoeMk3SInE+BHhrqPUSlx+E1HxxoW0cqk3Qt17gQFzdc1fXMziAJYn6aN
         0sWwt4gPfqAzXunTPYGD9p0eH8J3Wrs+dOJN7nbG83cEIfGBDUvpeRArRZfO0yYzE0Z4
         cVuw==
X-Forwarded-Encrypted: i=1; AKwUvBxHNYRxmELPtqOArvPOjMwDemEPffu1kPsImWJZ+04QKMc91ZWJtyjbxXHxxVAgqKFknS3F3PvIA5qTvA==@vger.kernel.org
X-Gm-Message-State: AFuF++nvKnGvYXnEJ9NDjnpZpVqJzVINUNxueUJZVJpUxjt4LxbpeUug
	OrYlQdtOY4hTIREKlcq+8s/gQ3qHsLQ7iyStmm9hmbD8qnWoWrDXMwT5kGZLjNKwbJyFV+64/LA
	vG1T6wWN6Tdccst5Xk8z4zHDSCMUok064GZXfgXEngvomKx9X2wpt0TDd1s/PC3ZNH3+Nt/zeSQ
	==
X-Gm-Gg: AYBFou3BruvdPlekUfFBPmYNuF83xz09JOm0Jwc+tK4Vj8tAJVghBGKoV8umjiFuSOE
	ghDRhZL+jcPBMiJbILTU8Y6lCeO5I187V5OzzOL+AKCDrx4lZcNFmOcNCOjLNAyf7NjjAcEFi14
	OiwkozGBO9ssTWdnnWoQBhoceORG3jtmW2c1FqWbTqx582P/TJuQpdBuLUNQCvJ1ezippG4QudL
	9GCeOB9+1XhAbGsC0uMTuwW4La7um+8uBlrgzAPsS16WUqOAnXki1sN0a8AgrIfmN/OKuIGgTn+
	Z11w33hlRfVgDNoDD6gmrJFV9SZW9B02poDcZX0ntvZ6yWYKUGNrAqZNQL58DXZscCn0sXunKLk
	5EBtaZ4vuH9Y9tBD737654EE+t2Mwp1CfgTj6SYc=
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr53233782a91.11.1788957410331;
        Wed, 09 Sep 2026 05:36:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr53233708a91.11.1788957409748;
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm44440757eec.17.2026.09.09.05.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
Message-ID: <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:06:41 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX46/m3D31SKNo
 05glvqn74DCopQLne+JIT3Osz9qOeMTqbe91MR1Nalk2BSB+1bsDqwl1emNx6aXPCFpgoLrymLN
 jpiJto3WftLZhPZjE8QLmfbUZ6bY3KxIZQzKBRtz9mNhWpHU+zj/uBA+rwlKL/sMas1AUD50xPN
 YmlEX4sK6soxR9dDWE1frhTGHpPF0X8uZrEi6fY9gC8pCWK+VwFlI42AsdJDSYNYvuce1GpKO6r
 yHi8ZJYKLXi9uL8Hcm7epiDwOtDeIZs01R7II8q62sv5h/yayDpQ2blRJF+Be+qmmPNOiH6gSZ3
 XnvrLnqU57Gyt0Ko0pSPK14bTPGl2iZrKTyRERY3txmFCCl7Ahm5DSmNhIeUmxCD1MlIV2kH9My
 lsfTU/06jxWyhUAoF22QnyrpBgPf/qWGlLakXggCvdYg3IoSwa7aIsT+K8AVyv7sxaUZq6We7yK
 Lv2lei7CI2QcadMkRww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX6IQCsP0kQavu
 Clt76hrVxsxECeBrrsKKWf67+TkXLvtGyogzl7n0WPfS/ZSn2UGpihobM1ODhwazcHDl0xZJIqb
 V5hz9fSg1l59PN7NK+0c1uyEI2hYir4=
X-Proofpoint-GUID: ShhUX86Xml4sd34SlGXgXonAG3QXiKjW
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa152e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sozttTNsAAAA:8 a=4itsqHrdGYRd9sU1pkYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ShhUX86Xml4sd34SlGXgXonAG3QXiKjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141



On 9/8/2026 10:56 PM, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
>> The PCM1681 DAC requires the SCK (system clock) input to be
>> present for proper device operation. On platforms where SCK
>> is provided by a controllable clock source, register accesses
>> over I2C may fail when the clock is not enabled.
> 
>> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>>   	if (!priv)
>>   		return -ENOMEM;
>>   
>> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
>> +	if (IS_ERR(priv->sclk))
>> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
>> +				     "Failed to get sck\n");
>> +
>> +	ret = clk_prepare_enable(priv->sclk);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret,
>> +				     "Failed to enable sck\n");
> 
> It looks like the device needs a delay after the clock is enabled before
> the register interface is available (see 8.3.2 of
> https://www.ti.com/lit/ds/symlink/pcm1681-q1.pdf).

Thanks Mark, for pointing this out.

Yes, based on the datasheet, I can see that the device requires a 
Power-On Reset period of 65,536 system clock cycles before the register 
interface becomes available.

Although audio functionality working fine without this delay in my 
testing, I seem to have overlooked this requirement.

I will verify the behavior and update the driver to include the proper 
delay configuration as specified in the datasheet.

Best regard's
Rafi.



