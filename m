Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA43C196B
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849948; cv=none; b=RGhCRq5SrbEHnvMFK8SIzNKavmSJFGisfBHyHHJMZR00MUcfEtq16GEB1jrvun7zvmsJv59hezazUrQkKwhDOgdLLviPNIRIPCrBnQ/hg3sy/r8NX1WiBFqJhwsq+p3CGiYjxmGY7nAga8X2nLBkup0NwAWZ6dEYou/JbJQWPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849948; c=relaxed/simple;
	bh=SMiz56oW2fSvTvIHDcMXaPFCHt1cROs3MYO4h60ENTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOnhssMQWAYI3P7mn0HC5E221KN4ZGQOOkWPUOJ5PBAJ1OhV826IlXKVmdZQVtpUpXcrMZoisz85pGW9iqfnRJu9lbn1aSsSQhvXk/iWp9zakMoKAcMNM0IQd944C3eAyYkUqwaVcD1PPxvOJ6vbnosW30SZt7eIajvAekkg/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLzzZh5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbBBx4Ij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLzzZh5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbBBx4Ij"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M59ZHD2000982
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 09:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=; b=PLzzZh5ZZCnulpYS
	7A8aQkStUsSYkgNyitb7NtAAmxndtPR7pWYNvMhw+H5xng/VS0ryNUB/sXGvPth3
	iFK9hnwV4N8Ww8EOuJaO+J7rjGF0YzLZ67ZmyIh8LpsWQoG59euUBnglU0vxdt11
	/L5be8gJZbKrbelGsJyjsLqCenAHvinmNuc8DLkl1K+kcoWmyWdLznR6hMbCzMl9
	hP9f+L10AgMyembnjRaVMycJiaszpe2XDueL99H+MlkFtD6tuES+7DxXKcmkFqoq
	wwitPdA7lA4BTbmDNuRpxUmI4X2iQpLAMvnesX3Wh4VD3vJxpO1nGJw0WpeXtEXF
	A1xChQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfasy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 09:25:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50de6db1eabso13051351cf.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849945; x=1777454745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=;
        b=AbBBx4IjuADdn2c6s79MhgYPBF9V2dmxVFjYfIpVgPBj05T0qixQVCCSDFGh+WffXa
         Aagssy9afS4hZ3jOpWDnQkmfYl8dMi2uasHe+XLEpZS7BZyWEVCr+DRHC056OpMEosOJ
         rrsSVZfi+7erm6PNyQHjTv8CckoLALlyut095OXUnwngL1l9Mvl5a3QYx1BuP1m/DS3A
         VTd68kGs5QGc8ePfgdWRLXTmesu0jLMRvtWQAErOzfWzqDIumLX0UWpJTOWKrp4rfZ3L
         edc6w2I4U1u13mNxDQc/ul0LpW7Tf/L+IH7+U4bR4iZyLwBfNnD3puuFvt6amkYNt067
         ipcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849945; x=1777454745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=;
        b=Z05RrQv+DL6rVz5RVTtQEmhnDoJ+xW3ufCcFF6W74UlkCGx+9Nhtdn4RAI7TXGApbo
         nRVO09eYb+Au7Vk0Lvh9G55Nyp9lSiJx9Jt6A15d3i8SeXVz4lz2Hp+09rnzKZMgPXfx
         W0YULZM2QYk9oOgFaB628IKYuo0IUqlym8us3k0wfatZYD2WVC0GfqC5Tct1IRGsOTPF
         WouNjQwAaz+YgzVvNvvse9/r9wrvY1rHeZK/NjiuOQUV9wM9X1DZF+8w4UtOKX4WrqPP
         UomBLJoGIpeM2w3GHccVhdvMbM2Ieuy0wdH0XXnDFom9qtPKJ+huUa5nJ0hPTGLvSnFO
         JvRw==
X-Forwarded-Encrypted: i=1; AFNElJ+8Xl6CVzOKJ1WcdvBjPWhuMRaa3Rp3hbE215R2cyjoSNYcQ8Ip6ZWFLQ8+3+fEAErWbKEzTACy/Ei2KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6k6Igh9pyMEuzaRxZFiMebsK48+NEbCwuASUkWgFl0ZiC0Ie
	RjikvVQoG4WVAUfzMq+G8tG0llH1m8ssX4+yCbks5QH3rWi+EJXKAT0PhnMt03NJThkNMDQqmMs
	qnGUJ4e0U1Kr1igzXrea7H7dxPRB7Ky8u7fTZtIpoWI/KiuwE6LnZiz7H0k9OXjtOFQ==
X-Gm-Gg: AeBDiev5sEF2aQVFa9IlbHRrFM8OECGF+B2DbQ5EoRYwmX+qw4UDRkzVB4/a7KAxiLN
	SX2x+7/GqL1jYEcF2bJ/YS9SuyoDa6hiOH55flnFUPtaCH5kUu3w77YWs5eCaC0ao3ONHuLbCWh
	taCEkCYFPh9VM7357F691DOG7RvyH3pnbP//aovCrBCT7LpNsz3QYe2XFx8TTQaMmjItJ1ZCIms
	w9kxHE8l7mR1DJuNiVzEg8MxnBLN54NSb8vGIiKfg+zTjIeprMBnuKFaf/709koNFWD+/OwAtfG
	nmS/B+AM/H8f9ai3/uR6oSWyqVYbj4gU0RcsaLY1QXUhHom8NALojN9eAgZu2VCb2gT2qsL1nIY
	QBfGWb/oQdPiFKnp39Ut3KsbAIw0GJI2e/MhyqstSPEqAq6zSVEBFcvhKXAOkS6rhrVJZqwp8Tg
	0wthCuGROvXcZJaA==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr99405051cf.8.1776849945016;
        Wed, 22 Apr 2026 02:25:45 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr99404951cf.8.1776849944551;
        Wed, 22 Apr 2026 02:25:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm533701166b.6.2026.04.22.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:25:43 -0700 (PDT)
Message-ID: <1d479cf0-673a-4cea-8ba7-7287456a8f48@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
 <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
 <11f2596c-c9e5-46d3-af6b-1f6b09c2db78@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11f2596c-c9e5-46d3-af6b-1f6b09c2db78@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eAQeUyXy0WJt6R9_ZrHhHJwMwQoxgRTp
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8941a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hF-cSiSp27aMdzgguJAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfX4u/wzbepVAlS
 NgV6PuqqEbP94LhtLzhAKu5DzwpLwPE3h191v0VTvUiU4bNi2md9M39CNxusVrYN/oFkFlDlYsF
 NQWhHH8qcQTO95xvJQg7vEx43cD7cfJfHKn4MtB2U0lX1Hj8GeEnnCutgV6yE0C9zQu1qfZYlLl
 J8UlPKbf63ffP0nUhZZMri+FwmMd8k4E72JLX37Y/Tvfpm/UnIALFoLKlXGcmQDeSJFCzf5tDXa
 3mM3KCQMccDD0rTqCZzioC0u6d2zkOx1DAmcvey9evoIWpTkvfMRyy9S6MiYQSP9VG1s08tOs20
 N1h+PfDvP7OokJj0OSohO1UtkIpsF4skam4f/cBkEMX6O0uS4ZvHQxKkgCYIOeRGAtx4PrRFxxo
 PKC2V5X0qYwAjbLFazr6fzaEpBFECs3GP6x3kZq9seY1SfTtdqrZKxWDzUv37Wh+u/zbvri3Jpq
 350MCPXcS8dxJePJYEg==
X-Proofpoint-GUID: eAQeUyXy0WJt6R9_ZrHhHJwMwQoxgRTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220089

On 4/21/26 10:55 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 05:58:42PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS VA macro codec driver to use the PM clock framework
>> for runtime power management.

[...]

>>  	va_macro_mclk_enable(va, false);
>> -	if (va->has_swr_master)
>> -		clk_disable_unprepare(va->mclk);
>> +
>> +	pm_runtime_put_autosuspend(va->dev);
>> +}
> 
> Don't we need a _mark_last_busy() here?

It was made redundant a while back:

static inline int pm_runtime_put_autosuspend(struct device *dev)
{
        pm_runtime_mark_last_busy(dev);
        return __pm_runtime_put_autosuspend(dev);
}


Konrad
