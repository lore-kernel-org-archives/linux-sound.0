Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C322FDFA
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751142559; cv=none; b=Tx1SMDZpts8lH/StA9Xs9fw249X9yjPnq+J7rFZe27CwwXq97xfBshoUwba6nrXYlpwegdU7shsfEbqy0YQAIz/HMtnAc6XljHl3tq0VQTHgJcKMl2/U8sxkB6TAu7Z7V6fsCSKoLrcZwSVBJWhm4xP4/0oSBDhZlW0esHNkVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751142559; c=relaxed/simple;
	bh=T0wlQmFGOGNhhDM4nvJ4qoj2HQjX26q7iV4fE3NtpmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2PAiSelImk8gNxiM6u0bZT/p+MtyWrwHEm/Ff2IOqgdSB+WOMOb6xsT0kGEtQ11XUA1UIoTKNyZErFCdLyE0XqBkFeGcrBPQF5m79IDsoOVY6r7ZOzwuZ2e/x5gOXraraPOnmeNeBOspG6sAuLFOxiVsW/aKgv+JuYg81yGNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glTvALRN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glTvALRN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SIv0NF002590
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 20:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvO1X/5dXnlpiXoQEi7OXT1hkUPrG5XDuzBKZt+UGZQ=; b=glTvALRN89kwe7ZM
	C2efvqcbMGvOhH2MfEqjGczEMxxYUkJW+Xg83zIO1Z9kTWcCqMFHV5YiFJUQ7/Iu
	alJKmnrfCZ2oDfCQ7YtRqTHa6xM8z7qbmE/7e3fxvk6sdbPp0mU72XhE5re0jL0W
	Ewcb7rFOjzVveZbHONBnc8TTpNPyGwjHH5eY6btgRogIpp7eZtT5NTs+pphTwOcq
	l5MFWyi2Vb212wbCnr+FB570W0r5jjHrXLN7H08PK1fh48RGcMm4Tafwn5T6M9kZ
	itQ83L7w7v2HPZw+es/xwPhhQBweJ4Y4hx8RYp1Xq8zVuKRH84s4oEE3M7NHTWP7
	jXgbKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s99682-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 20:29:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38f565974so744378085a.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Jun 2025 13:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751142556; x=1751747356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvO1X/5dXnlpiXoQEi7OXT1hkUPrG5XDuzBKZt+UGZQ=;
        b=BQTyBQyCl1kBrfnpuVLG/dgWv/a1Ub1HHhkQIp3tMegrQV9y6KIL2TBzkQa0l4mhvZ
         I6wHgddD9XD2yuhxXpJeAlBPm8STwokBZa2FY3fyLrZXddee2bVkjHoAWe5Vs++41onr
         reSz2x9h7rMWU3OebZOToT0j9hnLpdEkxNFSx9HARJKN78+8DKp7WJO6JkiPt9dp/XJ9
         9qUN0YcEySiKbiAB2/ZD2i8X6dPMVqatOhFTBOBw9xzzDq4jvbCmfB4/e8x9NXmoIB+M
         gpvtAZfLYhqkWlX5cKYPoB+Y6TTpiQU3m9Uj3zeXyLWUn5drThIxPLFVzAyoQnm7lCSP
         rqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+br6dcpxbKukg3iuRQ5wxbRHaQYYDmgr2zTjQzo1N2Yxjljr86ovS5THasZfvsiKBGcB44EE5vg1YIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwysLaXedYlfSwJuyTkTkfK7dcbx4qoM5n4Xj2c2BfMiwOqXS3
	7YWDO/Nq9w8SfxsLTSG7Zn+BYo8Eq2TzzQD84O4HUPm1VocSnFVvvbBxHNlW72QmlO7fy3GLvX3
	dIoDf5xoKixWU14WQQ7BWgV0FxM++19JDY1o9+2VzDzyAR+rCSypu/zAfSksQD7XDaA==
X-Gm-Gg: ASbGncutvCwmBcywzyffMAgWJRqgEbKndGpDzKSkVqS+cuMX2M41ZUEoIrCdKvmhk/9
	f/E+LS00q3z7Vt3GwhI5CdM4rtNvjLGgdQVlsl4y0tiV94aqlmj8+OT2KXuyPF8cEBbbJmFml7k
	TSnnc6Br5f3wq2BX1ApmIguncsygqVt9QQLFxhDI7XUv5cohPRlfT8wgYR4Yy3/xVlC0cai3NpW
	JeF2bp7+P41OqKkBzIOHwWMZHImw71LGEDyroBFfz+bnLRIlWUWMeaEQVQG6GTkYjkWkjuckSiq
	n0959tKdjzHkWWnuEbljD1Ae9bEF5WWo0yyGL1J9hbLzK0jn
X-Received: by 2002:a05:620a:7005:b0:7d4:4484:751d with SMTP id af79cd13be357-7d44484b5a2mr1010010885a.18.1751142555710;
        Sat, 28 Jun 2025 13:29:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSOT3Whcrl+FmVnNtmxpGh+jILg5Cpxe3LRgOlWJS0A3oiXDqVWEhKK+QBec5lyQ1/s7BbIA==
X-Received: by 2002:a05:620a:7005:b0:7d4:4484:751d with SMTP id af79cd13be357-7d44484b5a2mr1010008785a.18.1751142555201;
        Sat, 28 Jun 2025 13:29:15 -0700 (PDT)
Received: from [192.168.68.102] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f23sm6248787f8f.11.2025.06.28.13.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 13:29:14 -0700 (PDT)
Message-ID: <4d003e4a-220c-40d4-bcb7-0f0ce3427b30@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 21:29:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
To: Vinod Koul <vkoul@kernel.org>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
 <aF7ZEi9qQxshnWed@vaman>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aF7ZEi9qQxshnWed@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6860509c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1EDcOeGehylbRtlKsWcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3u2f_zvFw6MIFPyurG9RyWh8TuSSpC9d
X-Proofpoint-GUID: 3u2f_zvFw6MIFPyurG9RyWh8TuSSpC9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE3MiBTYWx0ZWRfX2W1oRwgBaxqw
 ushfKIJ4L93/tlF5tAyC9n5aparCUsDc2BKuEAz196Xdnkiu9RU9htMv/u04A5N/JVwK73w+DOy
 26qCyN+DZQ5Qe/JT14uVyIPnWFajLmV3OYBKbwMs6TPqHCPBGDv+5FQUzQesS7CFfHWaP/ZYHR6
 MwK6n5qJJNak66EEncNS6cUlYGQ2nQmNxp1G74heIo9PLZKiL3J3W/cT7V9qEX0vsfhQPIIn4EY
 tqlsIyW97WtY72apmmDtZj9TBnI/P5zXsWqVqHd2GOrdXvde3vnNy9aT6+5k1ArGS4aqzW8bh+1
 AwtgENKrV8KxhDVkxV4IMVOAiCY6YMkJm1GhUnnJ7CzJz7Ayg2fxtyaJodklTF8Ry+4m6/VgM9Q
 5z581/CFFInUGTpHlAmQrGrDlcKLsOly4TUhvDm4wY0+tRqEkSqAv71RpbE/WOBHToSBzetm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=812
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280172

On 6/27/25 6:46 PM, Vinod Koul wrote:
> On 27-06-25, 16:51, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> There has been more than 3 instances of this helper in multiple codec
>> drivers, it does not make sense to keep duplicating this part of code.
>>
>> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/slave.c     | 6 ++++++
>>  include/linux/soundwire/sdw.h | 9 +++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index d2d99555ec5a..3d4d00188c26 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
>>  	return 0;
>>  }
>>  
>> +struct device *of_sdw_find_device_by_node(struct device_node *np)
>> +{
>> +	return bus_find_device_by_of_node(&sdw_bus_type, np);
>> +}
>> +EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
> 
> Helper for single code lines?? why!
Two reasons,
1, there are already uses of this kinda helper in the current codec
drivers and even for platform driver has such export symbol
of_find_device_by_node().

2, sdw_bus_type can be made private at some point .

--srini
> 
>> +
>>  MODULE_IMPORT_NS("SND_SOC_SDCA");
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 2362f621d94c..84d1a101b155 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -18,6 +18,7 @@
>>  
>>  struct dentry;
>>  struct fwnode_handle;
>> +struct device_node;
>>  
>>  struct sdw_bus;
>>  struct sdw_slave;
>> @@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>>  int sdw_stream_remove_slave(struct sdw_slave *slave,
>>  			    struct sdw_stream_runtime *stream);
>>  
>> +struct device *of_sdw_find_device_by_node(struct device_node *np);
>> +
>>  int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
>>  
>>  /* messaging and data APIs */
>> @@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
>>  	return -EINVAL;
>>  }
>>  
>> +static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
>> +{
>> +	WARN_ONCE(1, "SoundWire API is disabled");
>> +	return NULL;
>> +}
>> +
>>  /* messaging and data APIs */
>>  static inline int sdw_read(struct sdw_slave *slave, u32 addr)
>>  {
>> -- 
>> 2.49.0
> 

