Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E6422546
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339150; cv=none; b=Dm+SWa+zPh9QJvUD8VXvtfX+wlOgvCcj2Jc6agjVKAyz70IvZBA47LUrO7ZCZCRoBaID4MO3UsI4rI8Yd2FVNn5WJgbM3RSw+DuZX/OnyPeH0BzoNGz5D0g30OylzEJnAZit6G6XZSANDdsfAWJE4k1xcuX8iLY1/YAvmsJoK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339150; c=relaxed/simple;
	bh=3/3NupMV0lpEENgIk+v8OcFOLiygURUAD6GMHrRKatM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGCq9PH6tQzIqJ5xo6RBG/wBfuiB5xUssy3v5B6UEBRa8t+5jU+a2cxyiHJGBwHoesJqPefe9D9FPpjPQY2G01NCei/gzI/lCA3xAm+o9b6T0QbHpP6FMzcVtMw3Aj2SY6iLAcPvBYWTo+Zxc94uKwDbh9C+GIlDXIT/llGQuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImHEXVpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exZusrO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImHEXVpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exZusrO7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxKpJ316483
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 11:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=; b=ImHEXVpwZNkclAUP
	yNYErsS5u/DDuiMJAu9BDkRy0enCmK9d4vr8TejeYiCZJijalj3aJWFtZkM5NqXS
	5KuAkPepLzZ4nFyDF8xEtlFn8VRdYeC1TBEZ7hd57qzWEvo38FhndfF6jOJbZ/A5
	ek8KYgcJCLcmPahUgrxM3d/F/o3CQFVVy9Di9f7avaju6LBqMZmpHD7ej/ZHRjLN
	9ztUo9tYWJYEceKReD/U4KPlVJwLFWp7Bo71zOE4h0tbZJC3XdACGzsnmf3l10XO
	sDMxal/U+9wO1JlOJ/NuDONHRCAIz9oiJeDUoqO2z/ugYJjxiQTJ2BRjZ4NWs8+H
	+rsVQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h3pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 11:59:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso19754351cf.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339147; x=1783943947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=exZusrO7NqWgJVvCj3kSoGGEo56imm2gK7XcZLVBROTGKecYQUk3UnAYzuC48+Lxws
         qo6qzObL9569T3yoTAjPORkBu1xr6Mw9xvMU3eoV0FWyd96CjSJEFwgzRZzWCC9p86Wr
         m9UPR1GfT3LkocD+ItASUhiwm9W3RuzQwvR/HDdrwFNup6YSzPJwgN3/1fskv+bLJfiS
         1llniKS8Gr6tXIT19cUiTRxY8v2nw+ZndHI9E335lcDl73qE3t+sVH6RScsEYHVV9Uvn
         ZdOWPo3R2OK7aaS0yxWRK8fWcD9K2csO1kslrl3oMYqyUciUCwn09Zo2x1NAmoUHMrBA
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339147; x=1783943947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=HBYxyYmQjxwHoKdvhpZimITlqj0KBNE26jemWNhsmA+D0W9KcVhLsQTI2LRSLN04fp
         xxfCiVfibEBMB8gRDR8eigatwmrs5XjOL8xIrU75PxUsxTeefcC9TgTT+EIwAjAqWOAg
         ssBFRQnbIJod1vPKuI9b+hbMv77TV3P4tkOVZzFBpj42CkfBbc6IYAhtJxc+yZASKu4D
         IKoZs4XuLKfziG6xSA8zaxfpaEXg7F8YV8LDB5pPUFOsf9G3JcZ8pwcvqMVolOnRxOS3
         d22AfBhvO/B+AzdE2ZQV3Mbzym4a5MX5VWGGI/x+CY8txyY973USOFcv80LPDmeVAHP6
         o13g==
X-Gm-Message-State: AOJu0Ywf+9u3gOho8KOKsqz0yzV4JlqSX2p5zshnW3Vzqwi9H2YdORA7
	Ew0eC4DWIuCqjZVBD9+LihsfqTSsqNGkh0rL04Hxr8zwpHRwOX0Ag1jVmbw8BjwlRFhcIcN/9cX
	5e2scGBhF1yBYblWb/WEtpVLzBWKcqbPwP/VqKI2XVoUim/1wqBW2AeH/H6QSLe8nUA==
X-Gm-Gg: AfdE7cl81osR/QBmh6vZ4boCwCEYEtr2fRIx4n9yGyOcnqz+oFkBKZMPybLkw+K+mnO
	yNN2c8PEsrERAKqRuEfuQv2DJJ2jcg8WceOVweK5RewMy9QN2QnAp/oUN25so+54gbWCC4zMMuC
	3eJM36upP1Hr2Pet095hDKtr2nRp0xAHJik8wBAlN9UP8FbtsPcx7vKlZ7DL3K6ytk/5eukYO31
	rvZeV/8x+l3Y0dzAz5EWpCi5h8Sltacq6KlKdn8c9wPSucbBDpOEi0nwAJvsaZ/QMpkWfVvMRX2
	ISr/z1qfV1R9m1ULnmoEu5OGnikX3NPa9hyKuahQB+qxJlrrK+cSRXSdrK1LlADuD/hioLqZ014
	fIAZDTIuAPt3sjmZEamrN/qYri6phRjB8hbk=
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84350151cf.7.1783339147148;
        Mon, 06 Jul 2026 04:59:07 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84349941cf.7.1783339146652;
        Mon, 06 Jul 2026 04:59:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm3830222a12.10.2026.07.06.04.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:59:04 -0700 (PDT)
Message-ID: <54f5177c-4373-46f5-ab32-fcb452e17a9f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:59:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
 <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX8L2PvaVfZTsq
 yGTRsYAsVRb7EwAcK8+vYscpK1/l9Z2LlOTMtydLJpLyTqDLTlxtQuYxSuwUgTYq2Cg5Y0PiFZ/
 zRZLzqqwwEQzQ13ckpZ9e82JxveG3FM04Wss6OYLMV7Uv0d+Qns/8QJNbeI5S6iuIRf/gT+zjbb
 o8kr0oCJCGd5rEShqh7wChDyPyrGDz3zvokZuv3Ajpt0WqTnnjaWUJ9gezwpammESPvQXR+bXZh
 LAmrMLOAlEGiC1UNplTy7PkpuSZ/2e76DlY+jTO7iuD8L8b5z0xJuDeFT4/vnKKOG/q/3Rqjd+H
 VOSTl7hqQZxtWdoIjvWt/qW8+VOCac1ieVi5DhSxXUHe3l68OCP/CqsGmzg77KjFh4/JwNbYn6N
 8h3BvMrYFk73KMN+FjsNlt4hWXsRrFgw6niU8gJv5f+L/WmCknMUrsBxPZNltrm2AOs98cJVal8
 gyjDNpQMWZiryk4o0oQ==
X-Proofpoint-ORIG-GUID: PeEte1HuC0U07NDZTKHBeCt3k65bQGCG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX9mdMSrDacIU6
 T4oeTNM93ee/mTnsf01AQ2N+gcF78l2ZyiRHcbvSS1qpVhcLBIkyrr1rJ0kYGIVLOk8KzdRuun7
 GaTMsXOwEPweDy3oSsWqdMwwO+xbais=
X-Proofpoint-GUID: PeEte1HuC0U07NDZTKHBeCt3k65bQGCG
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b988b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_kqV_F9lkCdbSKCJziMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060121

On 7/6/26 11:17 AM, David Heidelberg wrote:
> On 06/07/2026 11:14, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.
>>>
>>> Inspired by commit from Joel Selvaraj.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> This looks good, but since the binding is not YAML, it introduces:
>>
>> failed to match any schema with compatible: ['cirrus,cs35l36']
>>
>> so please also fix that up
> 
> I did :) bff7fad1010eea6f183fb110b54171cf8700ef8e , at this moment in the -next.

I didn't run git fetch at the time, you're right!

Konrad
