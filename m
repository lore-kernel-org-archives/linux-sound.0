Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB6331A63
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141016; cv=none; b=RauXBn0pmodD7S8K+65rZZqXwW5Ctnf/SBg2soGb3pwHzw4tf01er71DE1APCDUP6M+waTQGrnW/eVkIsKcNPZvG9xGWnLTXYVL/9vC0aQsxzzZBq3/8WYm4KaMpLi9fhz5vVR1ojVNfeRyZknDSktEnufut9cvz/hr+/g1hEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141016; c=relaxed/simple;
	bh=CT3j++ZpGDXY8wdafFXCva+5jnuKJ5HyNp2OUnXXdnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fg/I50S0CkeDKb9LiGhJvUnKafI3AkVlFqng5YLMjBpHQW7YifGqcdnd2gzKr3fRnSsb4y33oEEikOxBTUFqJT6tEFmo9cG1I3LelvFy5DIABmUP6yoUUyDFUVHTXwwRsK8Ua62hGsTOn0YW63C+9Fobutf0EDwm8oPAFY7uOc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gy69sdVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRfbqVNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gy69sdVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRfbqVNb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LoiF682766
	for <linux-sound@vger.kernel.org>; Thu, 7 May 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=; b=Gy69sdVD3lS7laZS
	/wp0O46q9aHxu6nX89nj8qDvQHz6HRUhwMUpIzX3vgS1tfWDRJogRPBlOw4022Dw
	SKN1oB0uCt9UYvZHAaOUV0jr/v26ppMRL0YGqtMtdxap30MVsXE3Itjd3kJiIIl9
	oUFrGPLOuqwjwgT0ofDP9tggROhfDsv7t1MDgiAuhujaTHSZyOt0gIt1ZpMO2L3v
	Zsb/3Bayptn/50bcBGrDnTTe24CidGIsJS9UwgZIpghU/0s8/Pt44+l3TbhouDec
	jXvUO2B7pQo7uDH6ImjgjaNTb6d9kOHN/eiTYb1HocISq9CcQn+z6FBjgD7aQiTR
	bRka+w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mharjrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:03:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62f3bea85d6so39392137.1
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 01:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141013; x=1778745813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=IRfbqVNbc5FSlh2dkNdmfZ7lBRQ7CAOXoGQOjwAZHAfMZu4fvVUvwZnxk6HAsaEl72
         xTzg1oNf5Bel5YJmvjUT4wsLLb7Oy0RLaDXFTpQzEudnmvT7l9NUvfyb8ULBxUZjYHN1
         qWPe6WG/ZhuO5cRqx90PqlGypw3zwUBNRs97BZAeONM/Q2ADR1AbOVFlmkhttD2XzXGK
         CFSYgt+eyq3ymYnDZeSGGlPLoIbpDYroZrsxoZ1ncl8cBp/hiPHKq+dJtKW+E36cAkGj
         y5WfUUpDwo4rWDMTwOnf5oGYUjLWcWlSnXkydSvQSCmn1lRltT7ROQcYNDgsLEWb5cEQ
         URdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141013; x=1778745813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=f3pYGRyHXGjGOA3Y/xTW5gNB6rooIVAjsI6fLC/mhV+yE2mOlToZR+T7LGRzqM3tjY
         kt/zAsOlJNEoRsvJPzw0iolUs6Pd8TAgory31c6bxXvUy1vM9gqxZDFz23h3EiI76ryA
         xYY1EWh1W9hZ/ZoVyD672gTeR5amLFY194SAPAq3YHvMjp5ypLPiufiMVDSNOfgrRUmr
         bor2WHt8UYtHnM4tmANdfsnyEpHb6mygqd4fslzfEc2OWn31aAuhUH0XxGpENBEDAWQe
         vQVUEDU0pkYuqsEsNPE1IDvwweIp1ol+oBLrAbq/OiumOxcyR63Ez7i2p9/Yknkb5Uzz
         KCQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7/T94fzFj08MXL6j8dk2Z2SfFbg/DxEiaN5i6kXAZZIYVO59Hf4jHosvYizRZH3Qv+MVl864qITicbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbcK+WOBRMLHweW/U226l1nalJZTuIEkAsD5lJaVDmnL1Kuuuw
	KUr/8yUseP2lTROBDIxQp7HLgWERonjfknjy/l/3PWhHVsRY0xqsTvFdsuktiMzbjZ5pQlMEE9o
	RJGAHYwOOoLu6WcOZ28gLGzK+/bEoiffvMx79ZTwk8UgMI2GL4ZUJS2ICHATCiUGw1A==
X-Gm-Gg: AeBDieukHj2ZE7SYuZfvTILxtWMtrBFMXD0fczbzV9Py5BMQ2tpqDZxjXO+e/RfPt0g
	rLqYxKDi6L5CpT1QiTy5QmRZrLyFXWoa/g67XgCCHfP2DFaGbsyd7cWcoBPWITbibOKnmNADzqO
	ODcGAiIO8d6OtBdOQN9sELvhK+WiVBlN9ds/SUVFPJ+YTCDWm40bdGQs7A+wVKSItdr3ZVyrILs
	pJ6dkU6J37J8N442D3UDY4/D9arb7lFECUdVZZhI4Rg8o1sbW51emKPXiwn7y5bv3S+bE6706UC
	pcVILoFA/piI4ERpn2yRa0Cwex9VGzmmY5P2bYRMnAdPccJdF/7FcmlugxkwcCm6T+igcjqqkF2
	xt8oQT09Sqko6R8Su6AIsOw7ZVpyDOj/CbK0yWTsbGRka5L99EnVQabmQF9uW3ZliBJhSjZqTKh
	k4tgpPmmNTVyocIsjIW3vnYIwu
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843260137.2.1778141012934;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843244137.2.1778141012470;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833e110fesm51608466b.46.2026.05.07.01.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:03:31 -0700 (PDT)
Message-ID: <fafc85f2-ede0-47db-9961-f34b2536a93a@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
To: Mark Brown <broonie@kernel.org>, Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool> <afvWsfgIz9Q-_cjH@sirena.co.uk>
 <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
 <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX8hsKdoZ88v8h
 W8euuuvFguP1/2YmfSmC7pR/8Vlwd0WgqYWYtrwo/WjL1bAWPNmFkgU+oc963ZXkM1V+Ot3YtYf
 5bv2LdENut6sVOXohIHEA1CJSt14e9PXFmK8NOUei4dNCoScGr32jjBqOWFC+5z/ptyfymapxZH
 Dy5RVX7AsGy52rA/6m42SZ9WMqg6KBixAXwxOshopNejxlhy+50isQVeYH8K1j4iMW5K59w0Nk1
 gUzc1Htu12g/Nz1L1QvDO36ow2nfwrLwZYfvu+U3fw29Lf70ihYcZgRZbQOaPPN/uk17FUwv7Ju
 yVJNU3hHUQbH1N37GTvI5XVow1/Njyspr8/TPWrlSjnnukWoIadMh4Nz7lZGUIOx2XOlayAq7yL
 xU8+cQkDUUSi+kvjQckBL8DgqzN2ExOiDBgaRjfEOTqUqxe+DdwF69qgrOMWcHUG7Rzw4UpePW2
 x7dRIJULxdWxm3KVcxw==
X-Proofpoint-ORIG-GUID: qK0ecitDHwg28Qi2BqD-T2w4EvkNXXfi
X-Proofpoint-GUID: qK0ecitDHwg28Qi2BqD-T2w4EvkNXXfi
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc4755 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=sFoG9ZVZl0XijMoWAhsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070078

On 5/7/26 4:16 AM, Mark Brown wrote:
> On Wed, May 06, 2026 at 10:46:33PM -0300, Val Packett wrote:
>> On 5/6/26 9:02 PM, Mark Brown wrote:
> 
>>> Please send cover letters for your serieses, it helps tooling.  Please
>>> also supply inter version changelogs.
> 
>> ummm:
> 
>> https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/
> 
>> I even Cc'd all(?) the lists, as usual.. Oh, sorry- not stable@ I guess.
> 
> Nor me, if the mail doesn't end up in my inbox then I'm going to have no
> idea that it exists.  You need to not only write a cover letter, but
> also send it to the relevant maintainers just like the patches.

(which the b4 tool will do for you)

https://b4.docs.kernel.org/

Konrad
