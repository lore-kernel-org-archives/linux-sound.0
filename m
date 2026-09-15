Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDC37DE85
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505718; cv=none; b=VC6o7viA9NMMe5SDk7OSJB1QupGLNATWBfaRKojpF8n+/ogyXV8ni9hykKZ9fhkTrizQEcK+DZ99QkRE8KRvXkZWf61A6AQhsV1WkglJDXYf4fOmIILqVms8XDcD5hkOXYiDIzGRod/nDe9my8O60CCMZFx6hiiAy9dYM8N+nGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505718; c=relaxed/simple;
	bh=nWwyXimLBtMoj6umo79waqNeVJC0VfX1nAwqyCrRPT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqWGWdOPRF574rx84qfBVQzajGALqzxyhLFaQLaVVwQ5MGJQlsDN04ss5J2HtOMlkzsxoX8SFF89T2VYphDP+TXw7TviWpZX/1cn5cAuLR5LzIfWOGqkXplXXBjicOpS9ocU7jFMQA9R/VwIUEmdo6G4cQNfi2Ukma0XHaJp0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk1loSAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPGArZ6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jk1loSAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPGArZ6z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItgMe377391
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 20:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=; b=jk1loSAY0QTqTUuO
	K2UdAsHHSk7TjeFtKaBb2PGr6yT7qNlxm4Th6LCVBR4VTcQg/umst7+Qa0Kx7KG3
	QhQq+lHGjpcbSSyCkU7QXEh2Q2hCnDRRewAwQc4MzG6tO0Og0dNVyLLRuIr820tw
	2vJ/AO9aDdVrYwROGcCKqENwpSxzvw8OoU4uReyqURxXDWDQ9cCyusqLR5yHeYWa
	UImvxlVUCVJwmPmmHYZmyaKdD6feNPTQ+gaeukB2G95Ggc4eszuN8eQm0TOmPAWa
	gSjFl7p4mTC9ZJ8Gy4puc6MWDsIT2CFykEfolUOlZsPKMf/3Ztu+dVy8tbLGrQNX
	YFBfJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ruq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 20:55:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so576321785a.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789505715; x=1790110515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=;
        b=IPGArZ6zD1VxEZ2jks9s++/uis9/3Hj1g5YtGGAlJ34xJfhK2ey2R6bYNVPgbLygY2
         5ESle15Zr/n/r/zFQE8XuwxD4A/B5M++r0xBropvz55Fj54qbbsUmncmpQN5SpfvKnhE
         SJEgrbwQ6TmEiVbmQ+y06vWxEHeF6WNmoiIcx7jg3JFZZo+YMpdIoK/bXNVmA3zse/aB
         Sn0rtgFxstpXwMOK2Hx39dmldKYqcyuUjs8lPl1v1p4kh6ldUr4Y/9SsCRlq1ZggthXA
         yde2eZnzq+R4MutFtGnLptyHQzYsi9/UhFuN8PnnKn/ZEOc914cShf3iSQMMj0CjQTY6
         VDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505715; x=1790110515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=;
        b=af+mmY9q+ApdyE2hVr3aqcbNzpF/P1syCxUhV2OWYomMTa6RTFVNlNY3UHZVgalhjV
         HFqzhhNyHQRyiOzr3amYbG1z0R9amzzUk8TZ1Z6J8rIztgE0qlGzKFqDgy1C1N2T+xJg
         lN3giHjDW4x40sSSZaIfwtqKEkk9XLEW3V7Q44xHH4+8Kvpa1U1VXtaU/uoHleidD3Ol
         lJF0gF38iZxTaB7yHcIRcdGhugooA5IwiO4YeD1v144LbPM95KvBwahI+tSkJEMAnLdo
         9RhyoZ+Vo6oST1l8+Yoxzd/rZ5JRWl2EsXf2PDGtYoUR+35/JrNwtFx1U9/OXVKJrCJS
         czoA==
X-Forwarded-Encrypted: i=1; AKwUvBy5xcBSbrMny/h8wqsvX7XRHOPD1AFOaZnaxw6+XcwoI++QStCKBBj20Sb3sbbbezrOOhbyMwmH62VY/w==@vger.kernel.org
X-Gm-Message-State: AFuF++lvH46MKRsIHN5NquHJMV3Zm3xp57FX6RJrSOUHjrHzD0v7ywF0
	K6Ue9nvWYOfPyXFPtFxoLwwy1UaS7ishqD51NeLeLtF+6zTQX3Nss3PI5ZaqkrC3VTKg2J2/jpD
	jd7wf4CsNUrWtSDmqRwi0TlBXPStMkzbGHI4eggaUhnSaJzLkiuHXonhUZcz0JchfQDeLqMrRTw
	==
X-Gm-Gg: AYBFou1hBW/on6TgoSl3U5ub1vxvYCdXoFWFajhdIbzr8R38D30dKrzI3PmMCqQmyw6
	iL0hs5ZAAf+C9QLZn5i4u8TO7kov9PsHJLErLZkEPF7Dq+ZThPNK7in1xaNADZ/TwgjzcNkd3+X
	tehWLtUFp9vD32Nyrb+dLfP0NhKlC84vbWoynSJulCYziM+pjIYu7pglcd5v2wFIxne7JhDgV09
	aeUyRKYJF0DZZwSAeVLlpcwfTT6XLnyOTpQw0paXh70sZdxkd7EdE5AYk0PHZ3LwXvHoEurwBc5
	WX+FEBuPumGt6ADwv55DVW+Mh9twXq236Qd+BrMVJ14twnnmcBpKXiAcY+r9vtcJg3CuJzaxHQF
	LrTdueVbcakFsOcya7mtKr1/4ROs=
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr391361585a.38.1789505714881;
        Tue, 15 Sep 2026 13:55:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr391354585a.38.1789505714334;
        Tue, 15 Sep 2026 13:55:14 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm24753515e9.7.2026.09.15.13.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 13:55:13 -0700 (PDT)
Message-ID: <783b1fda-b75e-4f4b-a059-b0914a795dc7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
 <b906abab-c252-48d8-b185-5acf3f94b381@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <b906abab-c252-48d8-b185-5acf3f94b381@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9b0b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B_1h4dMf_IzxQDtsNzIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: i_WrvNAWz4FqTCfmwWR63q_yFfZZmKup
X-Proofpoint-GUID: i_WrvNAWz4FqTCfmwWR63q_yFfZZmKup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfX76dYSi8ahooD
 2pOncSFAP4XjC5VRPhp49Yiqhq5tsQvk4rDbqdghlih4sc+pmp236EoCxQeDiN8I+eBxsirSH+M
 VNbXJbVuGcpGq5/UuZKMpwbjQyNg1MGCysxIb3+urGHrYP4oLgGXygiWMDSTB5e40k0DS61oLlx
 RqAsX9nkwX+fTXOmTW0obdtIwAi46wH2LRZ9VZyMtHygGyuXniohuU7IUoSAb8BsRb+7PUCTZPL
 cn8TuHW/k9XuNG6fxVXi69p+uCNYhwGHdH7t1kkc5klSOKfFmF/75K5WzGmgWncl05a+nva14TM
 X9HQhOBGNKCIzqtU0+YiqawesR2ACMGErE8l2Pko1tmZrNCTz0ezNIDGMnTmHDICM9FpUefxgKX
 sG4Q5Kdpe2+jHdZgpbe8xX7J1f9WrThFM234u+uXH98shbxuJDPYkQ/UBKKSTltQ9WyWPDlJRvQ
 95bPMFZCnZkXZZFnyaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfX1sEi8xBKzZSC
 0vJGuop3tDJSG19vq7dN8dKdclTla+2rCNEae1l+2QBd5aYOGq30P/qRmlQX/1hZOMqyb1hiDmH
 tUxWhY+ptBej9MLoWRKgp4RrnDuu5eQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150304

On 9/15/26 7:46 PM, Mark Brown wrote:
> On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire. On ARM/DT platforms without ACPI/DisCo firmware
>> the SDCA topology and SoundWire port properties are supplied as static
>> data through the codec driver.
> 
>> +static struct sdca_control entity_ge35_controls[] = {
>> +	{ .sel = 0x1, .mode = SDCA_ACCESS_MODE_RW, .layers = SDCA_ACCESS_LAYER_CLASS, .cn_list = 0x1,
>> +	  .interrupt_position = SDCA_NO_INTERRUPT,
>> +	  .range = { .cols = 0x2, .rows = 0x4, .data = range_ge35_mode_data },
>> +	  .label = SDCA_CTL_SELECTED_MODE_NAME },
> 
> Do all the other controls have interrupts, or should there be a lot
> more SDCA_NO_INTERRUPT going on?  I see that's defined as -1.
Thanks Mark for spotting this.

Yes there are 57 more entries which do not have interrupts we should
mark them as SDCA_NO_INTERRUPT instead of leaving it zero which becomes
valid. That we make it inline with the parser which treats no property
as SDCA_NO_INTERRUPT instead of zero.

I will fix them in next version.

--srini

