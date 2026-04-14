Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CDC2FFF8D
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156471; cv=none; b=Hhx8gaIbLIl6YH3/E16HONkA2HgizZd5pkGcd7EcKtxzRAxoPo83kK2iLjIW3TzVsceFBhT6fJ7Rm1RMpQfKu0inzOVg2xH+6RrTTPiXWbsrkMPre14LCGLCnkIf1lGPuABcei1KReOXQXjpeh9walRLtl5kx8yYvH1fqrehFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156471; c=relaxed/simple;
	bh=zDuF56UTnKqUspicas9JERjPRQ1J93IdhBgV2MtRI2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YK8lW8JX+UiF0FDNg1E21zOJcyf+5Gm5xDfdfa9MmtoxQsd3w/pxl39dvt/WZHtF3F9G9jnM51F7LimO9uXb2bcdZLThxnfNy/hgAjtCyysJRT8JsaF7TCSt4Winn+xysfKb9o6mZ+LbGl7fqcdzxMta7+Tc71HS9Lo4kD/1LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTtu98d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmJqZkzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTtu98d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmJqZkzX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6YPm3967190
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=; b=cTtu98d/1VuPhWHj
	NC9vr1vhxgbxc5Knw8RjUcY2NOpls1XUHaOLHNWSRwo3nLswKSQzT1il1I/k6bxj
	ehCyYZ52G/jpuNwL17d1QjctfhDg2440BR/yYB/2+i2nPVelMvppYw4f4FhZRj4L
	P2dcChcMoPcPKeMLN5vfj968iDLrWsfN6y0QVAFhg7QJtgSmQzpFkrBAuRSz9F54
	V7yd3IGp9EvocAqygQfKmiR9UixG8pB4hRDXv2eF7heTVxZdEIsmhJUACMaLq5XI
	qDT0xm1MwH17Kpdgaw1yhfxanFxCuKKhb3yEDR4FWikdza+zRnlzdhf3vkAhgwuA
	3Dru/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1tne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:47:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca281aaa4so4891746d6.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156469; x=1776761269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=;
        b=SmJqZkzXd8tl3BxBn9Ewqplnbv8uiPh3afSS3yRowVsC6fcDHJtBiJ2hHWECtSkIK5
         1PLcdVDxy+WtQRb8/6R77RAIeuuC0OVmxTaltAdRzBVjZpvuyk98ldX8dkIl0ZKNX4Uu
         vZf+59Uqrj2P7v0hcznqkxymH25xArZOqRWh3BcBQvXR3mIehiZPSH68Bne5/lun9LyZ
         X/OKV64Hr80CL8h5qCEf2aJ/qC4S2mSpFrc/O7vm/ygAsVzpZm61tGAvTfugqHwRyHly
         OdxMsXXpwU/9YpTCf0tq5J4UHKjnbt1AaSFJijNclOU9UrOCsW/koOa6tF2KGFQIgzkv
         x9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156469; x=1776761269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=;
        b=rVU8/3PJlQI/TYTokHWeZ4p7OJfm+aU2XOZyFXvVhGbEqz+OrFMn93/HgEt9+hTdct
         9FtwM+qFO/SplOwj7r4Ip0tK63H/cwtq0L1w+uFDiycfkOQsQguQfN/oPHD0MKnEKL0Y
         onNp8olrFnHoyn2nN6UuBcCbomwvqHFWtCoTLeL09rZjRHVQt3pUfakzvI/4oFViQIUx
         CqztJIsWEHEm+/NTZyPK08NIdh0QjHo1vAsOWoykk2eXkFlAs2+fNFb3F0hOtD76jZkC
         6iVM2c/1AXMX08iEebKV90BDWRHIhFXPT6xqCZN6oKOdTYEUqQX8xCX9NiaBoFmdsy7v
         ftZw==
X-Gm-Message-State: AOJu0Yys7Hu2XQQDp44CzfOp1cF3SbeCgKpCWWZ4Tk4aM3VhF67K3ffE
	nrJm29rY2CYS43+H1IRINEjkO+8x/vsr0N1Sd8yq0IOvqkb44qn26vPkXcDyEeN0rQ1ctl4iHx4
	5BbTd3F4y2EvMlfwVqoXQbqGJPofo8ckJNgqKc9b02krCPkyyTtTj+gvShmrgVXdKjw==
X-Gm-Gg: AeBDiev4dGWIBclcp4UylfqEYwolCB7vC7ATcXtD00HMBr+L56X5fHLGx5mh+esaTxr
	UcvElvIzjISjEwcQQifbmutu8G5yVnZLnrvY4FwxOJl8gb9Js1NrrKlDd5lw8N1OJgcIRCXv9RZ
	gler+D+tthJ+hzWQIxKOlpmPuyvBLs/AfHbROo8H/6oTOUrryOYv+uU4UCJFb3JPQQYw6tEApY5
	d92zucu0ebfDjRj77nOz3ehooK5zHAeePTmRA0nvYhFrNmkkA5tEO4tDe2iQ2wEde6dHdkZVw4q
	aE1V6C8h4ee+p7fLwv3/LobdHzUOIEO3IVh8zn1aQTB0BIgetyGB1QNzLGVheNpeClel5n3Npd2
	us7pOHzVQSpF0crhxxWRT4aqlGr7qlpCA6yBcC2/6eeCC4eHjWHePcf8EKVZ33NMGWU4afbV+La
	tfQ8vUEqicZYgc8A==
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr187977716d6.5.1776156468983;
        Tue, 14 Apr 2026 01:47:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr187977466d6.5.1776156468530;
        Tue, 14 Apr 2026 01:47:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1e87sm378834066b.61.2026.04.14.01.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:47:47 -0700 (PDT)
Message-ID: <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:47:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL
 clock rate programming
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MSBTYWx0ZWRfX1XOxSJnoqWMm
 wk+Fa3e2zIHjWKDl+AfnOd/fG19r5jIgS+kR8iSHWqT2sHuhsUAAmfU+TbsXjMgsKtHPl4NB+K9
 AfddbAYSP1ZSLwxQW1bBVzWJyXsbIKY55GsIMDCVMuS9I8arzY48YZ4qkctXF3Lyjpf7uzLM01j
 OZtfTwSRphWhBQhPIykiBGNZJqRtyeFKvrDSodqeEtoYC+ji1vIKzYvoqHNAwYGPMF8s1zaHoR0
 TyoqyZl4ZH09RO3l0vYnQXhkOwr4aTugdVocyu6OseWY034Au0zGP1JfNdwwuvCJrfT5CgePiWD
 BQrgGfdtQHt268z697QB281n3jvssb4tQ3lcFY4ogKi1N7cXd5g9j7zYxnp3iRniz1gnW9NHoDS
 TMqJg8+w329n17K77akwEl5HIHRtwS5rr8OXfva3YhuGA7UMuNY/K9DcUvTeebhJj8QNWVeIGC+
 b1SUn3Y1Iojc7tkMc6Q==
X-Proofpoint-ORIG-GUID: cBH1EPhl5p6HN524k_Z7GTJoUDe_OTnp
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddff35 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JHmcoMBqjwvyAgHjIWMA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cBH1EPhl5p6HN524k_Z7GTJoUDe_OTnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140081

On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
> The NPL clock is only present on some platforms.  When it is absent,
> wsa->npl remains NULL, but the driver unconditionally programs its rate.
> 
> Guard clk_set_rate() for the NPL clock so platforms without NPL do not
> attempt to access it.
> 
> No functional change on platforms that provide the NPL clock.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

If you dig into the definition of the function..

--- drivers/clk/clk.c ---

int clk_set_rate(struct clk *clk, unsigned long rate)
{
        int ret;

        if (!clk)
                return 0;

So let's drop this patch

Konrad
