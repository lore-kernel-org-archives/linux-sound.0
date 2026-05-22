Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F73B47F5
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456329; cv=none; b=EQEkcseSSWK0kId9h7bVK6Ig5wG2ai4Ww2IMLPPgKT1PLQr8qsVEYj1e++IfWGzoRmytnnJE6+3UFsXsq+X26EXUm0oBOgih9iIQV5lpI5W+ubufFljOUt0zjnpEvA38fET+n2r8yBmimU1i/0Gbu4cnmdUlhS2HTN5ZRdUXFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456329; c=relaxed/simple;
	bh=y6oQHJn/KR6BxGOLf1FiFdBougOCwECGoDPfiREwbO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUQ3G2eeP9YdAxMVVQli5CJIZWhw3jKSRUvC9DUd0JyF+eD0zimmBOmPbspdW9gzSMru4xzlxbo6yC5qoYhawG8O/RgeDiqbTkwVhwjJvTdyWv+bcPjkh+MLfW+sFhpjk1jDN/7+qBCCbHRQCbvHL5HE11uARzdV4AAZoIS0OCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIp5WXRC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0Kfy05u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIp5WXRC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0Kfy05u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8RZrG2765100
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=; b=LIp5WXRCwBHwVWX2
	Lr26Q1YZvP5DIZ89Uqh1tC4eG0haeQ5P4exYD+xI/i88in7G0xhja7V2EslHHXdV
	PRyfnFdi7YWG6plKGRavK1KMzmz6gA5NzKKGHUCtTg0ePSlbuaCX7pCYmMNFTiOi
	n4TFYahwanIxi7CL+F27F4dzjtQsih4rWBmL9A2guMys8AyQyJU1A1mwMQJ1D/f3
	bvLIzHbwFFOB/6NhgRv/WVDcd+RGxrxYNThwQlapKyGmfqEXI0/ZTA0Ezjx27oGJ
	0vv1hdFCPIfHoHjEe2/ghRBqeNlqZYS1a7X2yV4w9ab+W5MgHoYvbge330xe5Zfa
	x8eigg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7w47h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:25:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575296be5b1so553870e0c.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456325; x=1780061125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=;
        b=J0Kfy05ubNJ7BNrt6GHdoFdYKsaICX/iSr4ozyVItMMcWsROjNq9m8/sgnM9RrtTzE
         7PCJZLAOM3isuayV5oyeFrfFzwA/nni8PCo1YS6WbaR3iQErY1wdUs1gtUJgP+R6W0L4
         zL9XOuzbA5oYCBZAOT47L0UH7p4dN2q2OOpdGrcZpPrh0srN9C6JBJqnhnPuMeDQ5jQN
         hGzzncXayzPNI8BozgfzLt/2QViHP7wL558HHfr5WG7LbgVkAywtT8HtO8N0LmM4Vo+j
         6QmNmc9RqE4I5W9fmcXAn/6cU21oAkyNf3KLwtuWzHts+uUgVdUniUlmJ5LOfV1ftYF4
         z15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456325; x=1780061125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=;
        b=qeiOg8VHwoYdNWxY4rI5DECGc4y7TiXzyC5Iln27tg3di36K4ys+GWD0qW2cDYpjck
         XKzmgQYrOu6ODMFKpqES1j9f24yXBbXMSjWAcBfA9c90vlSGZeJv/zINx4ZAGgpbHk2n
         VUSFQlNvqhzUh9jLl+h2xtB9Z9dVKxKg+JLwsmapcFnYQlaCBKxIBCbT0adGmDM1HVba
         1JfmeZogXNEC/+OdyzLluzqg6xmzuZAMZoaM0Wn1SHr+qq1/1rOPHP6zMXGLX1SWg0L0
         mmdNHiZcYS6YiG1JLTdFHv5269tZ9bxqxBt8Xrwo7BrS+uzeAkq84i9PB1xI7tZ7ZyQI
         Qb8Q==
X-Gm-Message-State: AOJu0YyZWkqIgL0yJk71+9Y96+p7yfQpCob3zFPpqhkEuyh40VUPcmbG
	3HqC8nRtY3LMajkUALb9hBiBL4BmGYoKhe1ZC/tE5W8+c5td3Csmh6IuD5ALJ8eDuzjKR/fdD9s
	bsySUCeaF4U0bGGJJq8GVaib4/ZbQZDU0YZQCdJxm7+mIhL7mf4bKtz2mBLeOE/C8kL58kxlEWw
	==
X-Gm-Gg: Acq92OFHazZcxSkMV/8gGKkWNHe6l2Eb8PafwYNzNUC4FFOnHWGE/sJccEe/526o3AA
	AVv1Ja4CSsJLrXdiHziPGbr6g6vccUq592f6U7PwB523bXTzSbmVBvcqZm8/cPR8PrCyyWJCgfB
	1i25Tq9l12eMANbXCWp5o7BFg47FzlekzyHGiGr7Ll+yxtKWlbYKNCdRMMJ/b7vjbbylaBF6blg
	QKIstKfnB9XK66Gg8qq/UQLLbQOq08QrtkWasw8cuD/N8PUtociDCmwUENHn80UIPcaiRWqe0Oj
	L/SBFUXJXnZ7pv9jfttbZX31CQdQDJowbAKHH2C+BJLSH2C/J5c4n/v57tt4jdmfBRbrKX6ZqT3
	p+S2hIhRi7PK868pFC7u2KvYhSiQia2qcKW/xz9dUZRc1dnKImkqwLRDS
X-Received: by 2002:a67:e3a1:0:b0:633:13a:6e31 with SMTP id ada2fe7eead31-67c8529284bmr476483137.8.1779456324794;
        Fri, 22 May 2026 06:25:24 -0700 (PDT)
X-Received: by 2002:a67:e3a1:0:b0:633:13a:6e31 with SMTP id ada2fe7eead31-67c8529284bmr476469137.8.1779456324197;
        Fri, 22 May 2026 06:25:24 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d334sm679898a12.2.2026.05.22.06.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:25:22 -0700 (PDT)
Message-ID: <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a105945 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: lz_NLBeGnR4ULvEmOFrW6GA4B6N-7cLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMiBTYWx0ZWRfX0zoQF4e0M2e4
 IUSbYxF91RjDXhjrit5lSzq8+9EuBnM/B79nEtuFYyIhscJp4JZPdDkyTUBTFS+HXsuOSPWM79J
 xsJHtLPUE73AiCSu7DQhuzwfZtvgcy7+h+NgGBBPd+WQfxQD5auUtdP8TVZbj8jOeqhz2UBXgOS
 NWks5gb8KpHM70F84kaJjo4O7uoYOpLLokAmngzhnZ8vULmEbMj8sCfdcxsJniA1gkcFZPS2jkw
 x3oMJSyWsodE7oGxjrOJ9q9tNzmwS5oWLOm4neQSF7OUDBvpH3AQPOcS+O0morfFA720uw4ZyF+
 GoJEQcKO6LaZknXQM1ckcKLuPygjRAbpEw56xTc7oPQr9x6F5sOaLWf9j5lzmh3Fw7FW0cFVHW7
 dqPLt4a56Sg8askDtJYfgQppHVKEbVxQ0MBB2RWtLSdtohFqxm7FoC0MOqyCmm99nRBx+eF+qJ2
 sEG8THOchsSlpWMNBDQ==
X-Proofpoint-ORIG-GUID: lz_NLBeGnR4ULvEmOFrW6GA4B6N-7cLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220132

On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Keep the SWR gate runtime-PM reference from SWR clock enable until
> disable so autosuspend does not gate clocks while SWR is prepared.
> 
> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
> available when this driver is built.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>

You added this tag, but was the entire content of this patch sparked
by Mark's suggestion?

Konrad
