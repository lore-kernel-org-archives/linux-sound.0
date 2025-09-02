Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA515B0EC
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815770; cv=none; b=iQ1xLUHspiGcbEc/zD2a5ZWBK0aj0iIDV8lnVu6fSZgbRw+MR5Nmo10ugMwd5Ys+3IjsC6h3ig+CmPR2RHfN4m0x6CofjM+2tf8vuudA7w3YSXBzTihytC0IcJcvmv0oFsT4F8Qg6jkWVHTBB4C+YLRj/WwYU7zz1im3Ijg7mNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815770; c=relaxed/simple;
	bh=F/DRPIY1JzJfASVH0+5DxM8yvCWWP9vValqVHMMfJH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8lGiFP1N/S3itVooitVRaN8/UPbOMHtidYxnF9opVaBEM5p9WHcmG9S+aa030qthnwRKlUu234GHqqOyUyXgi6cMTRnWre/a9fiIS39DkvMz8S/S5P7aVt/WniyhQGniZ5nUL3BMb+JEG1mV6ydudEQKnjizbP3/g/1QoRKJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7kUuleN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7kUuleN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BC8m1012365
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyYC2IjjKnN8kVstgOeFh0U7UpsX/qMCfNZKVjJEVk0=; b=B7kUuleNTjCbambg
	E6+nJnpWkiq6RCKODUO9LoHekh6orQI0Ewip79L+QK1sniuw55Lx7NJ6Hk53Y3nJ
	j5nNfwX++wWRIC3io5BIriM23tjh9o4j1Fa6iJcgZZoGC4gkKIPeyJu0L7eJzFTF
	9V6E/6jLyHatrmSQa6sTI2QhYiFiiP2hYqBgbnVXuH3ZQc0PihSSFSuJW6oYOpHI
	7NsQdD9r768db/QbaEuCK7u76sIgHhAyljt09LcTO0t1UyuhIIVsSZjCzZTyOfzc
	YQsZPsKa+iGjCVWmmlirsYjN+OU8hQvgYhR/RP+7VT1ugWCk4Pa46LxL0kAXE9lN
	7a3RUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffmnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 12:22:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b30d6ed3a4so22870211cf.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 05:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815766; x=1757420566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyYC2IjjKnN8kVstgOeFh0U7UpsX/qMCfNZKVjJEVk0=;
        b=oatks57kfFqsVIqQNZSVvoQiBi88+5nTwiHQmPaOjZ+zxtv7/6kqlNrQvtPOLC83Sj
         NcjEK/ftixby7cPR3JxK484MFwIqSG5iQagd14NnjDHXv6+1S9vs2E/SLAvuwq7vBMOT
         HDIo2LqbZmKF8wSdmnERaY8+faKg8Y1vQcaxA1DLR+m51Dm0m2eYZ2j5Ca0l4hTWMdIX
         FjTofHR0cpT1noQNggfmPFvU/xNtdLvixZ79rCD533FLP7dXzTWwb9RJ7pX9oVN+Tail
         wHPw9NW1k9Ffjt0CthjFFK+FPwztZUM3vah/PDqkObqhnI9hlsgBCw7tansUYhcmpzlS
         9TkA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMBt+GSzsG0EExqJxUzUvqDIFi6HZle7PNNPzS4ebpHsf5qE4lU6fTfae5UF3u+Ck6u1H+HyY8NeACw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKuGIBdT1/tkPisJ8/CRWTBkA3CLhrtr5RNzq1Rz6jmwN2m35v
	Wh2qLIkPq7ubjNIX07uebsmB3rfRzkCBFMN4ceA+rBOZX4BWu0ddFAqpbdUJ2RJXIImyQoi9XOU
	GKehzDy56eA4wWpG4Oapy2eOfUWICfMLIcXzue0a1Dy4bRaBGv9KU9Zplgvqbg19hPA==
X-Gm-Gg: ASbGncsgXEsYlYHax9oFpli/yFNW1FIdISh792F9bSrVWoXA4UMQZ3Sm/dEm/e4NvKT
	5MO2jbuGi3XsQXHT2CM7FiKvhBLi8TANYQPWuDqO5q6sOt7+c8ffQTty1fxcGAk4K8bF/E/HGry
	/buPkapksrnQCGO1AZ0p3lwIQkPjtpdyyIxY0bk0AHqriUaDhDhETjzCmcBBRvYP1kmofMEiQXK
	n+dCyz5yNZEAbc4EauyzE+UyuJQBpmwp0GgQSHB/8kkHjNp+PX6BmDyvCTjm7nuWiAtotHWVAjC
	LlnyQH/ccQRj8O+xswOJoejrlVZyORhKjas4qzg4PqtCfXOkK9dRRJpZHXuWzBvRMZs=
X-Received: by 2002:ac8:584b:0:b0:4b3:e5b:cdd0 with SMTP id d75a77b69052e-4b31dd84920mr117886181cf.79.1756815765396;
        Tue, 02 Sep 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAh8031gbB5vrQHflTsJQ50ZJLtuJxT6ch2hi1H6NNi5Ygg7c2bWKWQ1gJUJqXwKchmELMmA==
X-Received: by 2002:ac8:584b:0:b0:4b3:e5b:cdd0 with SMTP id d75a77b69052e-4b31dd84920mr117885681cf.79.1756815764723;
        Tue, 02 Sep 2025 05:22:44 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7efb79sm197449345e9.9.2025.09.02.05.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:22:44 -0700 (PDT)
Message-ID: <5bd88696-476e-4a80-ae89-35580203d13f@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:22:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
 <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3oFMzv8tasGw
 s4CNntq+kpHeOxzQe8wOItTmittz1iTtZN0YGbiW+kYX0EYvAInhMFbUtIZGdQYrw8iqQBthV7H
 tif4aa70Oj/uW2cAoYthPUACpXdBwlk14QxkbG2Yy0w8NLtiyv7ow693l08ZTURyD3GyM9tqpAC
 3O+6SIpmIX68w/q1Xr8U6POah3ifqZofTzKuLi2Chr0b7+3+OVhvreTu3xd2yXC5kQ2SmO7j57F
 yb1T270S8ODHNUAatTTR0MvJHvmaIxLeUKl9u9AcBbfjM05P1h7pGVkkbChOIybtmzo2lKFakaH
 O3xd5Y+8Dgm9/BHbZM89c6O58xDZuxcZB+3+zrH1pxnWUw/F4z0U05gn+iUUmv/ghNd3NRs1eoW
 MvynIb9u
X-Proofpoint-ORIG-GUID: qxiQWLyz5DmIu0NYU1Uoq09ipVzSW6oE
X-Proofpoint-GUID: qxiQWLyz5DmIu0NYU1Uoq09ipVzSW6oE
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6e197 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1ucdiQ-pe5FtM2g45dAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038



On 9/2/25 11:01 AM, Konrad Dybcio wrote:
> On 9/1/25 9:50 PM, Srinivas Kandagatla wrote:
>> remove read fifo depth field parsing logic, as rd_fifo_depth is never
>> used in the driver, cleaning this up would benefit when adding new
>> version support.
> 
> The last sentence is mildly confusing> 
Will update this.
--srini
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/qcom.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index bd2b293b44f2..7f19ebba6137 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
>>  	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>>  	u32 slave_status;
>>  	u32 wr_fifo_depth;
>> -	u32 rd_fifo_depth;
>>  	bool clock_stop_not_supported;
>>  };
>>  
>> @@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>  	swrm_wait_for_frame_gen_enabled(ctrl);
>>  	ctrl->slave_status = 0;
>>  	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
>> -	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
>> +
> 
> But my grep confirms this remains unused
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

