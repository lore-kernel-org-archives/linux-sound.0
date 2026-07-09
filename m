Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C85128466C
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581056; cv=none; b=c/5WjCbODYMFbaQJomdwMgb1P/sAVzcMZY7H6jDMdC99H6+SS0relabKndoiAwml9sXsyD+p8ZCyLowU9tf+oYACV0BPI2u1CR3f/gSNnQmJpNjiR8SJoclfmva8b4DRithzQXpSngUAYPncKnpTjsKP6oYHkmMfdRt+vOT+IUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581056; c=relaxed/simple;
	bh=wmtnvbryyjiJzl7SaPnq48PVp/YEJcRWLDkO8/ccom8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/yrmKVSzJ/gYDJBhHgChh/SPUXseRd0cZgg8SWWJ9z3Bywn46WOaqkZby9QrR6LivOk1vvcOoli2xdTCxnApzxCHZ+RcOTd9ZQx+AIfYVve/WtcKzrxq7ajlxDpKPZ25qRME7qp8x+7JFrdUc4uR4TGN6iAXtuCZykt4NveVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDkLfVkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkhFxX36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDkLfVkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkhFxX36"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669604uG712305
	for <linux-sound@vger.kernel.org>; Thu, 9 Jul 2026 07:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=; b=cDkLfVkhs527DKJU
	O+QN/w2/USalMKEDoO2OvN7LhZkn4A08fvN3Aa4WLtaVLgeb9jzNu4HcB504Svp8
	ZeY0CecU3KyyDLGKdu2Sg9kawbJKIlpPIrJxjlvLcmyTOEk8rK8GDcFDVYi9Njmi
	RuAmWrGQQpare53+2AtVABajcnO3zCXSlbE4npwK26xPjbPDNPGRrFGggmY0sTys
	Ys6boID03q/P1TSN2J+ywReB3fY82v/k+ZWRT1bSBL2yCoCIxohpvn1SCOLNrnRn
	UbKZW+u7HifHmpLinegVYX+zxVL+in0fmZLzwaOdSNbicIffADcFLnfdWY4lsgpH
	QVzgPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgf4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 07:10:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so10582185ad.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581054; x=1784185854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=KkhFxX36oyBAqMnLPC8ekaiZCvKW1Eumslxptaj35bz/x7n3Zo+fH/6nvu6uJ+hVkt
         FbpnA1/l48wAq/laR7VhXDIjUhljZJ9m4SBYRKpGrgKFoAhlHheVfWvwqNUZtQ7J5vqY
         LfAcxIZea4W6qmTZu1tOsMGK38DS2KBSkOokcq7GCrOsE3pokm94W+7V9L/DiKYIrtOT
         /aizszIFgx6o+tqFpUNaZCJJoxI2ZP+uKvCpo0qjvOu0gK+aMgpffIkOlckitbTMkRZY
         1cO5sSzskmM5Fh0cunZgJq/VHrKbVWcxD6AIAn324JqnV4IHAVp1sGTU5CmT3hanvsE3
         6mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581054; x=1784185854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=M1uBqR27dcEauAPQYTDgz2zU0GKfMALDg8YW2bpZgGmsMc1PA2gcPwcvatsb/kWJYQ
         ncuJ+VIdCBsqfj+Wr1nyWLJ7vjrOH9TGsehTpDn8/PVrf35gKd6EcqIdc3KlQ9nQ3oxZ
         ueXUHNPsEIAdKd1VX+xgrvWBssBcNO7DMv6KrYrh2mtY27RKFRQtWtVBIwQNL1viVghR
         O1QqwXMYTE3A7dXKrmyx1zgGYpXWEvYKHungDbriEueUTe8p16EVLAz1moMnQz6mAt3W
         MvGTj9ZmTm030/mF6W2u8V3o9WhGEQ54dLhRV0rxIZlkw22g3luuQ0a0b06cAQvmZQCR
         xnUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4B21w/oOFhRVgze55eYN4FXDBhT99CBjIe7/y9d61c/eI0EFwfRwfN0pDMkTNxVlclBsGyJ1amk6F+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLx9yxI+VQF4xwwOEiysNAjTK4ZyktTGUN2nBQphKvg4c2RF47
	g8Tll2UTCeJyS0Gj1Zuv8ZZdjPOq4mno4Si7EKHrIwfGCcPflWMmG8GAIzGS1R/96QBGFKSalBq
	u+GPyq/49hvxZeh8Gf4mR3vq1HpyYe2T5MW+8wqCrg7rUHmrNUOwmwreeZy2H4n4+RA==
X-Gm-Gg: AfdE7cnyJYNYhj2/aXNaqzGEeoP3XozOoLzbji2tcr/jxFZ5Ft2mkOaNV4KN24LsTP5
	ExxSs+8ShecGlZSMlgkESqMyza+/TwELg+NkuYuEkq4LSXylcIfp0QaoQAAHTDsuw+3tNx5uT+x
	hPUh2zhHQxa2SXtFrGuzS1qe265HUr+JMUrU7yrDW2BF3bZ4V55z55DlQ/K/Jn7XyGQ4/KQIfai
	etm6PSvLC12IuPoi6wFO2R2dku29+z5GFAmeXgfDgaD9/ZqgO8bS8etKCGwZnUBwot5egCYqfMB
	hgV9wKXYxdWu41VjhK1DwR3tGMReiq+NR3IosQL1ipukjJsR4LtRLmOazJZS79g0kwLpsAIJ7vR
	zMOYmfVQMS+QAulBd4x2lyrq2JLOeq2ngyum+k32qbWVvrdelmg==
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589395ad.6.1783581054353;
        Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589135ad.6.1783581053936;
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm39237515ad.49.2026.07.09.00.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Message-ID: <355e8208-467c-47dd-8a2d-63de6a44abec@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:40:47 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfXym6h0aeS7iIX
 xRSnr3iXD8OaAOtIfKy1AkkrOpRlotE1Fb+OnBcwwq2SfHa2H+WE54xL9rtNS8BZqCvoSp4ysJA
 F3kErUh2hCwec79flZHi3xigW2v5eeruaf05Fp3wF5rqfmF6qZ2Exz8OkP81dyfe0kXN9Aq/+Eh
 qp0z6dhbVmQ/WHbq9//ia9VqWt7AfUd9A1t162uZBFYBczYlfYKkqRcPmTLGL8+o6aaND03KU7N
 8wDMFyiGG2Mh8IBSw/qBrc1QaucCIYCKqWI1e5NYKo/c0wKi+iXHfK1+qjqnaf9xFgw1WtTC652
 8mbE8h7ws9yH6lX74pJGhOFnIo6mqyJcMJoYyw2+pzUTqruDPVOxToqlkhucNQW3uJ0ywBTXj42
 7gNpXj7sB8iAJhKu+E4SghYAgkkM9pAvD4EgF/4+92nIkxdm954sIlz9oQIdIFHQ6w5Ki3rp3fi
 hIrh6gDkf4zw8yZiTyQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f497f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q1EBz3ZnqiQg-LZ14swA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX9BDPiBLKahJJ
 uU18BpKonfeDCLoWkKXPUM7NWnHcWtQPcT/a6PXoZzoOW3ciZEPaEgYsE9bPGMed8CQ7yH17aBE
 OniIsXFTfV21TVFPkx8IqPI7YagGWHg=
X-Proofpoint-ORIG-GUID: nIz-UrY-lbc9SIe_3ozjSgoFhDuklgBy
X-Proofpoint-GUID: nIz-UrY-lbc9SIe_3ozjSgoFhDuklgBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090066



On 7/6/2026 11:48 PM, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 06:50:08PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
> 
>> +		clk_set_rate(sysclk, freq);
>> +		ret = clk_prepare_enable(sysclk);
>> +		if (ret) {
>> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
>> +			return ret;
>> +		}
> 
> clk_set_rate() can fail too.


Will fix it in the next revision.

Thanks & regards,
Rafi



