Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E843822BB
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329359; cv=none; b=bv5QSn6fA56XFfMdfcEmeSzg4nScXQruNRM06XXct4116n7TUSBrjLA/MvY7Po1D+pP1ZPVqJjtVpSC8NtM+TlKr4TZTg23kCDXlEMjof4iSGQ2O5mLVNQA4ZXQ1c+WVzQOpjo/j9dt5MHs5fBVMBxAJvBO/agHJf302WhipUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329359; c=relaxed/simple;
	bh=2O2tLbCSCtHBMYey+e7A3uPt/HONNbOYonSDFLRuS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2Mpk2EbC6Hfe4hyPnbgIa0SS3z+trUC43vweDQywE7/Kx5vQ5rkK50T/F+pkg4jW3CV2UIOEURwDVef+zbkw/orDiG6dFa2cxDxUvnHDNNKQp9aMdfpG5j1kVLA/Lbzsb9oCle9zfcpfHJrttmPOFPwQ9px7boYQ7HG0Ae1noA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY2IK87W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aO2f6a0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY2IK87W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aO2f6a0o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YNSF076984
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=; b=iY2IK87Wvd1cPHXj
	BEIzJxzXQgF5YJUqKc+O0//4SjcTUqNeqWB4IZqatIxHAQUhcdkNe2HuxeGqkQDe
	AS+DXJdRpQDmiqEGLhR/SiAZ7Aa0iGD2nXTcGkSBcY5EEAv37Xg+YmlgItF8227m
	I2i7Zl0caFKUTYvLEQ3HsiA+xisvHR/1XNAnGzqoqj9wFWgMzDW/29O7s2Js/s8e
	3Mq6pKHr+EhWE5WyhB9JDvLKG9mOA13findwrYj8S/figRWE7Fci4zyxyThj9Kod
	xROgMtRfPZwRJ51q3dUbzh+XdSzSGOtelvkO1/7NQu/LLsI4FnOcRY46bVOzNJOS
	EBfB5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpawst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 06:09:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1071323a12.1
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 23:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329357; x=1788934157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=aO2f6a0oMeu/5b4v2er9puwoGM4kvphKFpAmoQQliEkf02mhNxFHqs7pRI3gWQyx3+
         Hoat+1BAR8tuJTpwh5AypjilVsTEolw+16odcce5nqK9FckNjij9uLaAgxSfpvPVZMVZ
         zZONqH0OlbFPgf3ET3gsq6xMp+9G7Ldhyg7xrxsH2r4CwjCXnc5MNVExLLYIEEZf8P1o
         AX7B2kXUqqyl04+jKImHvVGE0H+19mIOb4K1QbgNQoBw4/IkDheF4KupcXO1L7BvHuSI
         iLREw88Fau8HjGxiWz3YvGgBfhG0wPUf8aGaE6r99l41UrUCq9e1zzCC6df+kIUrXyiK
         VK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329357; x=1788934157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=O0Fijup3sqRVEwBwdHS2VmzFU7uUfKEv63b9oByu887hn9OabT3UuYio6LeOSaRbfm
         sLnubN8eRp9OO9WrcKkK1Q42yNlOb24mO3/+2KBJuTfi/SgYA14DN8jYPSuGEYR7M4s6
         AlGE10lkca8Fiz/DBddZ45wbocVHRtNFyeyFTXT7Wo6soEJwQ1Zvi4bAqVU0zRu8+LTp
         71Of5TyeI+344XsvoNOkqBMBvxIi+BffkdepO6wavuiIk89uNiyjnyYOwt2KQ63qtYRa
         /WxlYz1LHlbHHlKeG/prnGLrvY7dMRol1IabdxWWao8wcdgObICQVR/1RFiTE15La63j
         6ajA==
X-Forwarded-Encrypted: i=1; AHgh+RrBcuWt3G1HOsuhDHPKLSTcMoAnGkGNylKM8cd+1Y3CVoTr47gdVZEU9js7y3LtjtaqaSzIXOXA8mOZfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kW+MaExtgD8Va1KrgokQJbqHmBOi2rnQcdXJVX16mwbLJgPJCd
	Qe1dTjPH2lQHcK4vGGKTIqB6uwWmT8rXCOHwmxQJzXdhpAZe7sjL751AyrlAc+GGsnAHDhE+X69
	UW6trDyB+k/0NvYuWCBEiLTX7rHKTGr5SwZfvbA9XyPFOl1STWvvN0BtLI2LaXGaqcA==
X-Gm-Gg: AR+sD10GaQeun3JmD1qr94hagklkdpMzdr2FqEdfHhuVLHnUUQ1PlKJtq2StyuMPv9h
	U1HD708+oqOhux+bFV5NDU5W/FO5PZkl+xFvcSn0EF3lXaxvkF6JfLMVlaLQyEcQkWbbpZn15cK
	Q9b1t5t5oPcHlPdmI4NnKPCaWqSKLpEQ4nMgLrBJ9uHPYZ9Hql9EvXCkLkPRjjVPhU1UH3zW5G6
	yjjdFTqEwNTUBWbQFKGflOG3dxzyAMDpE+4xLteqmrvuNpJpM1PFG7ggtz9MaJdNYeQ9fiXqPIu
	uiPQmnHcPji9ctuWQWp++41td317SQG7bpsi7HevIq6Vq5Ic/SSfaBD0O4VWMpPEGDiNCpob3Va
	GAKjJBYQMx9VyfCmF6MwJU0kf6lF+
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428626637.0.1788329356444;
        Tue, 01 Sep 2026 23:09:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428538637.0.1788329355930;
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm3257660c88.8.2026.09.01.23.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Message-ID: <942f0a0a-461e-4794-a33a-9c820635eef0@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:39:09 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
 <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97bd8d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bKA_SWDmMBWY0RPQJBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: sSdZwzJ3ieLmpXkDSspEQp9VxdKjxDL8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfXwWE6hzTbpX9h
 2+Lt2yxCMsMchRBplCdk8ejPnYPu/82a4+48fczDNqYaNUoUk+Q8RrOOCesniYm7uKjYUn+aE70
 n2TnPkC458uZ7t1xzXlUQUpeM7f1ebg=
X-Proofpoint-ORIG-GUID: sSdZwzJ3ieLmpXkDSspEQp9VxdKjxDL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX04kEIO6JLAE6
 DdxfsFx0IHG7+x7GmqIHI7ussQmbUOw+psc/R6Y7VwvlTCr1jUpwkXFrz1NQR9YEA45gD1AXuMl
 l/dCY9Jg/DSnUv+y/iE9lgxEBjogn54dXsC0gdZ8rhUHGw87EtYqSK3QGN0ZLloJdmkPK+/3jzD
 jf/6aaC/be1IzIwiwkwPduX1QwPcDDyIbyv+tpupTM4WHIerd3JyrBZGxBrEkpahM2DizvNk7Ux
 CoriD3luwMgbqAw3l+Idy/p1yW3t3u9+SMnK3J8G8x7ezgXOXsdrnyUBgjxS0fIDc7WERSMS8Lk
 CmPbzdCongYsujfTJ4LUTcgGAvRlHw8oxeLLccUXiJ/aX9nFvHd9yH4B7b8osll/+SBKNIFBWb+
 vua5Hja5ECMnU7T5o0gIuAHMoOywTj+Hio5H6CAdQ3Xo1FkwBpP93J23HzigzU4cLdTAyutXryt
 osp9tE6tZZ42kxCHVZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020053



On 8/27/2026 4:22 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:13AM +0530, Ajay Kumar Nandam wrote:
>> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
>> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
>> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
>> reach the PCM buffers unless they are explicitly SCM-assigned to the
>> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
>> does not function on these platforms.
> 
>> -		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
>> +		if (pdata->has_reserved_mem)
>> +			ret = snd_pcm_set_managed_buffer_all(pcm,
>> +							     SNDRV_DMA_TYPE_DEV, component->dev,
>> +							     pdata->reserved_buf_size,
>> +							     pdata->reserved_buf_size);
> 
> Does this do the right thing if the ALSA core preallocate_dma module
> param is set to 0 for some reason?  I'm not clear why you would...

Good catch.  With preallocate_dma=0 the managed-buffer path defers
allocation to stream open, but the reserved-memory carveout is a
fixed-size pool that must always be mapped upfront — lazy allocation
from the system page allocator would bypass the SCM-assigned region
entirely.

Will switch back to snd_pcm_set_fixed_buffer_all() for the
reserved-memory path in v3; the carveout is fixed by nature and
should not be subject to the preallocate knob.

Thanks & Regards
Ajay Kumar Nandam
