Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4630D3ED
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526702; cv=none; b=DsHGFuaTSglztRPvHT4C6AGCKdz6Rppvee+zSbGcW2n961X8EkqDz89qLSCmWeM7PqmKoZ9kQDRkhSbbzc7coISLhjXpHWnVMOj+HB8/Z2ku/BXO+XmQW0HGavX8bwvl4jv4luJXv0LLJInx/OtTn2/OkGOYcEtdgVnGzN+JguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526702; c=relaxed/simple;
	bh=rCY7+48PTkAn540OrQ61wjv1+BXj1jS0fk3ADRA/nqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksm3nv7v0P59tMrYFrr108gjwBw2Ww815KcbPXc2sy5icFrywzI04UxN3wXjNawSCxkiHVQA+5AUsv+t+sJZOiAG9XEpZ2V2m5WU43xJREhsraCHPa7Twv+hK1Xxr/YSkJG24S4CCOrVmUDlyKcPeRtZirIL4vrIoBFrVLGcoDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj4wJ++A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4SaRm0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj4wJ++A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4SaRm0H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HYhR1598744
	for <linux-sound@vger.kernel.org>; Fri, 9 Oct 2026 06:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=; b=Nj4wJ++AJBKvafj7
	36sQsQxQuxtaZbp8bb2yzXlY2MXYJanP8gNDkUYvsE6JGP+yHihygc7EvOdNV2Na
	qEU6Ov1gqEei1UIuYuo9fNTUp0fxHWVneHFhIZB7MDIpwb//rYXmKQWQUvRQCFsS
	vOPkWhunL1aChSmVhB8Qfk30t6CURg+GRip0mBUUpFG4mZUFVkXzRXTA4jlfy8p5
	Ov1ikNuMTN/WaS09IaGuWR0Ij3YvA4LUqSaSp+yHbWdvCEp06GpbuBSDfKeWGpAF
	jPB7C7g4MbzyVimmRz+m4cQN74VfRf+4A9m3IACyT2uevUBM137hy5uCc2YgeFB/
	lE3oXw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufs0a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 06:18:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso9047726c88.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 23:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526698; x=1792131498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=C4SaRm0Hoc09ZYcBUd14GJSTy+KyHJgJkZiAdLSXrz2h9xFq1qqVL5CnKSf8qzHcqg
         wgRMdH3P/lwQ9RUgo9tPfXf1Bkg7PCVNqABzRghcKXqWWnnD7+vmMllx3gPosQZDPN0G
         1mWJTVH+yXFh0RcC3FRlRzCqR9zaDtYmVsi7mzuRnyFR012JYUz5NxgBXrPoMZGwwtNC
         oDgRvsFD865Y5ir+Z3HViXiD4H4CiEnEKoVC67+a8bbFVXImHTBUEQ+y1NhaBOcIqqa2
         3H7fMQPdTSyZTPJsK+TOycUVoFKQhT+X/P0JC/PK9FbJpZA7BPA3wFHLd6AhBNij9x4a
         recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526698; x=1792131498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=Q7PjQHhlKzLJOnzJqOSHxO5IijdC7MRsMcSPxvZL+MYLEEY/ioGampsOWAKMED+3my
         uWwWpbI6HLTe2MoeJZWNwfLLZ7rkirUSiqJDoi8F0Iag8+XqSDfvCBFgvdO+bHB8xxXn
         x/u4giHgIl72BlIbFlx8QYuaC8LS4HqIi4J4IYZEwj/j7oBGmZZisx3NqkIsFHtzhW93
         bqabzALTjbUl0NqGpOYqhCW1zJRfelRZ7/Npw3WFDz49b7NjaLXImRP9QcG3lYg5f8xz
         qhRKfIRUHMrIBqOIDo3bCua55WFRUcMcbRj3Vd7C2/oIltKLF2parAd7OKvL6G1mUm8Z
         eFEg==
X-Forwarded-Encrypted: i=1; AKwUvBwqdmmhxwCGyhMq8OLDOdJoOw4E/PpNnZ6k/nQ3228Hfs02ffR95bf/+mHaCZ/5tk42xFepnotoO6o0rw==@vger.kernel.org
X-Gm-Message-State: AFuF++msfE5wgod1VzZ4X26mZNggmHiKrCGYkSeJgAUaCmqL5uqzmrLk
	TDRAie0xNBOPzip7baFl2BfLxV/XuFF8YvaHhd3sVkSuJDkgYV3YLkKoC8NHR5Nrpu99OxzcL/i
	IpdOJOfIFGjxkg5OT7InoiyA9lX25PSDwT8Yt16AEcey0Mq0OLYw01ffd8rVWs/iy4gEuWSTxEQ
	==
X-Gm-Gg: AYBFou0UVuFXzDFMEJfHGDJJVd1qe/TN1+dvpWSaF4jqWWazeMMse4OAEiNNwOPzoAw
	4QB2XaeolXqMzleHE1Fw9WZCiPdv1degFuwKGTeHfa5LxqENo4tHV5dlhciyrhPZquj+6+IX61h
	6w8atGKbHT5Q3qoxI2UP3edDMoboVI7yoVzuSQzLr5bY1icVz7wC+w7Wg+zk2Cb5sNDS8o6F2Ta
	ETTzrhRNBc0GZhcjSgANmRiI5Tp/cmXwdlLkp8cj/ZMVW7YPFiowF0WDBD/UfuYcb04Id8wgTt9
	Cq9HQwBiYj3LmDde/YTotjbcveCI/h7Fu62pusLgryo252p+Ez924zyxW2dD9wLoIomvF7dRfj0
	ZktwDEKQuTP2D6VodHH+4poB+u6okCjjLCUs1PA==
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097311c88.22.1791526698132;
        Thu, 08 Oct 2026 23:18:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097280c88.22.1791526697566;
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm7716862c88.13.2026.10.08.23.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Message-ID: <394cbef8-e993-4741-819b-bb074d4c0d33@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:48:10 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: qcom: Add Nord audio support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8872a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5CsdgRGpw5DW-Y5J6h4A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX+qcz4zVzicTI
 A7ILFNIGkGQLdHrtMdfPN0xGMKjsaAcd7Cv2zE2WFHMnUhgmzHdQL3Prp6w0qO4P51pQHkjmfoM
 c2n4BS3FaEc01ZZZUPOVaMRwYW6+8EU=
X-Proofpoint-GUID: tbHGBBdPX3fNXV2JtvGrfPKdBVK7ZPlW
X-Proofpoint-ORIG-GUID: tbHGBBdPX3fNXV2JtvGrfPKdBVK7ZPlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX7hE2tNwpeBJD
 gLf6Zpzs+jE1EyMvuvsiUoZHUp9ibyTuwEOIHddoigZfAe3WGGgFIQjHf5tCpgYM7GVQwgxyEzJ
 PpQ8GgEM/AR709qFjvLAllGZpLCbwcW3O1eiGGj4A27nslLuQoxdlndgTDCNmYB5tCB9lauSX72
 dIvgPzyJwvVJIwBGftLWxundXs59EEfIxKkMupUJMrWMapPc6qWqJwDTNKUSxgvq3zd/UDeK18l
 7EbDYd7rwNVmpHrjUc9Xjiqsv1b3E/OsSBGDhYbmECh5SA5WpoeFIn23iId0lPEIra4m9vs0w+m
 OF+9eo8I15ot0cKkYkrkxwu8Dc2fXTh0KAHv6Noav5Qh2oNsu6XBt4IiepnfyQlyEfxxJ2cu3IQ
 g0CGHArFfD/3eBtNU6MhUzxFCnvKIhX6CIHGDyZ37JpkRCFXmgASciIIdQ68cXwMCxPYVgMi0e4
 u5AiO9mUYuI7nc8HlVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024



On 10/9/2026 7:20 AM, Shawn Guo wrote:
> On Thu, Oct 08, 2026 at 04:36:40PM +0530, Mohammad Rafi Shaik wrote:
>> This series adds audio support for the Qualcomm Nord Ride and
>> RRD boards and includes the required machine driver, device tree
>> binding updates, and codec improvements needed for the board's
>> external audio codec configuration.
>>
>> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
>> Compared to other SC8280XP based platforms, Nord Ride requires
>> board-specific DAI format and codec clock configuration to support
>> the external PCM1681 DAC and ADAU1979 ADC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
>> - Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
>> - Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
>> - Added TDM support to the PCM1681 codec.
>> - Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
>> - Replaced LPASS DAI IDs with QAIF DAI IDs.
>> - Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com
> 
> I expect some PCM1681 driver changes in v2 to address Konrad's
> comment [1]. Or do I miss something?
> 

Thanks for pointing out.

i missed this since comment in Device tree. Will fix in next revision.

Best Regards,
Rafi.


> Shawn
> 
> [1] https://lore.kernel.org/all/d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com/

