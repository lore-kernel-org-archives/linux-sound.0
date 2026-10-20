Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478254;
	b=ayC4ohwGQnUwvkiGTG1PEZyIZErO13HEWzHS6fweNWzxQjpSwW6yhPUTfQ9gk2vdHcLC
	 Td6zOhtuU0RCD60Bqii458DiZCDP/TA4FuaZfJ0hkvF+6fvKN7KTIcNDR6sSBuoch1PFq
	 ihnymX2uUwTDZp+JzT1hdJWgoCu2uX2H3CclgBcSJ1ycqbwGHwrEFH2g9AVbix5cSciyL
	 PZgkfHHxIsKNKFhFMNNPPsLMP/NJMczqzDxqYtwapWQGmvRra7i0arqwUF9U58Y3QamHv
	 SJMRwLCNZhsE2JJFFns2IFQ9NHTDP0zbJe3q6V1GLpMPc4H6hSd18VlfBkapbB4ud8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
	b=zWJ3DKroQkXGWOHErBM1u7liKjZQL+JdjoIn5g+rip7URYUmQZjdN5mKbwzTDDgoj02R
	 i/kUOlvIuZQVEhTD6AVTbhroNm3rYTyacfsJc++uhLR86BucZBK+lhKqtp5Ux4Qu1AOyI
	 3FIaS/Bs71cKTeVEv40XPKy+GV73ZBHC98iUkkPXHzzx8F8qa6SJsYCi7Jm5X0jGrqsI9
	 Jlf3SPM8/PB8y9eTp+N4ORucIVszFaTSsgjvJI8WXt0AzlNfBQShY0eF+L35gu0+ExgRV
	 70CyHOAnU1oJOZbOhCtui7oIR3DrWw3byIzmnAbc/z6S/6IxpU0YTW153zwvhAOrrLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Hc/kPQ22";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISrY7ec8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C460A2602
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB9C460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hc/kPQ22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISrY7ec8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBjL2877675
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=; b=Hc/kPQ22WkzNYqHX
	LUSP2d3mZ2SIDMy+h1KWfkj6ZYX2dIo0iHTATXCu3cTut1qM7lyyzMjL1ArhMPkm
	D1MVX+yObTqSzih8zfFqsEoNmwnm1GfWWe7yj5gHYHdKH2C6vmsNXLD3TdYF8LME
	Yo0Rnwl0MmJGyuCcmTibxasGLKFVmcQrszrTeoLRMBiGRCh29wzf62WujLhVJmiE
	IwzZHPEnn4eOMNp22CaFkf47tMtQr5wuisDykYXNE6S2TDU8E+FOby3txGI454pI
	4A1t6I0u+qnxUiTcPo7brWpA90qxOAjbBr9b/LR+Z2SuF+/kaP6x5WJN7mkKsKH7
	8MD2Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ps6p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so980914985a.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478247; x=1793083047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
        b=ISrY7ec8LxQiWuc2N9xovB5OGQG2N6beSz+y336Ff6ZG1Ld1iLM7oJxTJtonSii7j6
         rGHb5+xZRlLCrx3OSCk6yZIgpoGn0twE4/WXn8eAFQqzZHpc5Mv1uKkEZKcGPsUo3gdS
         vUZWtjgmB6tZlBOgMP66h09voRlqxZX+pNRF5qtNrkjMsJgtzWAgqYbGP2ywfRGsHsv3
         I5B+FIXOAs+PwDeZxzpYTA201MwNn0QgxRMhGkdnhk+75IwaMh29wTNT9miI1d1CLqY4
         KxAjSW0Fp0V7uamjsIuL2QeHMWaUxrSZ1yBuQjEdGVqLnzgRxeksVfuHEs4qIs1mpRni
         4k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478247; x=1793083047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkeJ+qlF3OdyfA6H4VacvMWg7dys6I2xj2MZMgj3Yc8=;
        b=qC6NLJegkCaQbP/Zc/2JUadHZ5AvtxGQ8183KaC3bjefVTo+dql3ngZnzUjjXzvtpv
         BfD+jf8R6HPbIqd78rWU+8vO+5ZlA+swzaxvD3TthefpDnVO/d0CpjEsc3c34t9uauaY
         juxZOMIVRLx9CZAA+psDG+ISbuV7OfhmZSTJukQRs8YLMjneisWxkueM3agf6wT+1kPE
         gyF2uVdCFV+QhhusxLCJYIQu7JgkhKlIN1iQnK9lrh0v1xMswPJN3dyNRhKQ4ZD2nBWn
         r2Bsq1kHLUtUL2LJ6zKz9e+13/fnyLGcLNxqJeovMrGlp5yfGAh+BBqwSmBCRYw+Gwfq
         cgeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx9JH+geIhy65Aag1uS+Fe4Cym4T4S3Q3mANmzuUipWZIXsdrnJ0pmTcVvqvnCFcHOrngPV25sW8j9WA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7UAQstAfTc7eW3VdOUGqq5AsgRj0+lDc9WZLRiLskKR9hg59V
	y4W6dYDkzgrUDbIf/7flq7+Iq5xMSLBgeIkYUxVMLxGM8jpyHyddeV6jYxt4ZnX8UoergJ2V/jo
	Ldc3VGmlfZj/vkU3FRf+glLjCpzurt+/e0oVMyVcWn9JV73m8Wc4uXfG+jekwbhg1TQ==
X-Gm-Gg: AYBFou0E9NLMi9gyA6eBIfcv/G5TOuVHdwyjI399F0HYD5+/YvSDj2XPa6Ryuzp6IFD
	ArE42Ao20Bcz0D6xl32BH3ZNaYoJ37zs26A/k7hzUnFcNjwJfy7OnwAYbG9KKwg5eeG+5GwKKii
	14L0xZ2ZwsZzYxocfF/mWpO0QIi/qwEgoaeLchjFlKJrB9EEGrhXy2MZF6nTRasgru2qG5PpLil
	OuKrSlL1z6HGvakbuUWEoUVjiDOHqUKr/WRI4b1BTSuDlRnvJPyYiwgTppxkFEDvLVhG8T3+V34
	JONFoYV/42sJ9WQv8x3CqO2WCdkN9XKYFO/1Ir/hlQLBEFhOMnNykCRTUtDiKNI0cerzFMF/eSk
	c9eNsug8a/w9BsSEDePzVDbkl9w==
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1717290285a.66.1792478247219;
        Mon, 19 Oct 2026 23:37:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1717288985a.66.1792478246827;
        Mon, 19 Oct 2026 23:37:26 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm4079204f8f.16.2026.10.19.23.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:37:26 -0700 (PDT)
Message-ID: <5ace1d37-f480-463e-8705-e52ad7f34b0e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:37:25 +0100
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
Subject: Re: [PATCH 2/4] ASoC: SDCA: enable pm_runtime before taking the
 initial reference
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-3-srinivas.kandagatla@oss.qualcomm.com>
 <atXXQv+d+AGd2VIO@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <atXXQv+d+AGd2VIO@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad70c28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cEVFgFB53M-sojWUyRkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX3qQStyJpMCvc
 6efTKbqLOgSfZ7tzZiN3gx0/BWjdHQJ6wktlih54rcIVlzVtIeEnmHcTZyIJWQyQE0+q/DECCtx
 PklDK4cLDVfxocqUh4DerOOszI4cjJrxFTqLlDVNSy5pzVkI/QvH/vRSnYhrhV8eOXSTBkYcyEQ
 5a+d4eNIGQOpPi1qUqmcX9K5E0wm3CKMJWPBSFIPPzoNGFjZergml+6U5Tq/ny26EhDr5ce9z58
 g/MGL8FGE+z4Hf0vF6nYk+oDt9D8U/+MPiGSpalx04PJAc4HZpgl+3xzcvJRpadv3+SdmnszuMy
 9FEQwLwYru8NaWV5moFyKPDQcJYoX4zQcsPaSHt6g5+LM5ycfyeP+VpuEKswpDb7IyswqWj7v1L
 SSMQBgN8LtRmmcy1VpT8iG9zfVTCDDZEkJtJiYVLXGwoEjo+0Eo9ukD6i/Fac2C6oV8qYJ7RLIW
 3j40MRhxqOuHjuStPQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX+AlU+Q3KtCxt
 +WcpS5e0icxUOWJBdDYznixiRhYOMHsartLSZHJ+EdHG4kNlm79q2A7G7zhqHhHt5KKTCv2jBJi
 tHHDU1ZRI5tHZHoznByms8DPZmjnhKY=
X-Proofpoint-GUID: D8PfA3HaV3mqmt0fCQF6iA-qiFVtTJDI
X-Proofpoint-ORIG-GUID: D8PfA3HaV3mqmt0fCQF6iA-qiFVtTJDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200026

On 10/19/26 9:39 AM, Charles Keepax wrote:
> On Sun, Oct 18, 2026 at 08:23:57PM +0100, Srinivas Kandagatla wrote:
>> If devm_pm_runtime_enable() failed, the usage count taken earlier by
>> pm_runtime_get_noresume() was never dropped. Reorder so the get only
>> happens once enable has succeeded.
>>
>> Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/sdca/sdca_class.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index bcc660aeb739..3361db188046 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
>> @@ -194,12 +194,13 @@ int sdca_class_probe(struct sdw_slave *sdw,
>>  	pm_runtime_set_autosuspend_delay(dev, 250);
>>  	pm_runtime_use_autosuspend(dev);
>>  	pm_runtime_set_active(dev);
>> -	pm_runtime_get_noresume(dev);
>>  
>>  	ret = devm_pm_runtime_enable(dev);
>>  	if (ret)
>>  		return ret;
>>  
>> +	pm_runtime_get_noresume(dev);
> 
> I think it would be better to drop the reference on the error
> path. Doing it this way round there is a very small chance that
> the device auto-suspends between the enable and get_noresume.
> The intention was to keep everything powered on until bring up
> was complete.
Understood, will fix that in v2.

--srini
> 
> Thanks,
> Charles

