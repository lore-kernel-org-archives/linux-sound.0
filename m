Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642837FF57
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675248; cv=none; b=HLaTC7gRgO0Q9vj4CeA3wSyQVC7S0wYss3tYA2FX4n2FRQkfY6iJXFjbbpla9nDnmJNqkWqGRia7fY4z+uWFiun7VPZJFZiEJQZ0+V92ytowqpsV/wUGaBzSp2Zqnrwv+CEiCLkDVJ3zer4AKvid93PYY78IK97vJBlT1D0efmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675248; c=relaxed/simple;
	bh=KE8u6LRd9CjKfhNT1A12csPMZoYyQswGAVMslYJcMx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiQx8pUs5gFAPPnVghNoobq2L0gDutZFv6NOiVV9H19k8nWfqqBTWz7Jp1HdquaGU1qwn+o5CknPvjbcG79LdO5hF12o15As5USq9GfuZBmXhrbkSTkN2iAD5wogcQ8ft18y07sBUcZbsIfqh7SIInZzZag28zopBg7f8/72CnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv+DZGYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJcs4/UF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv+DZGYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJcs4/UF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Wt1Q1532102
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=; b=Qv+DZGYi+M5mMUQu
	3RDajgiimsyvngMJQapk71K1yyeg+l0y6syyuSyoyXx/kFXR+hFuaHFzK9ZT0KDb
	WJcjmlO3Ha9n8buSLc4txP9PxnCMrc1xqBun9t4zaGypHqTh2KT/2XjlfEMFb4yq
	jvreu6pUWrWNZOKHlPc3KqsTKIG13YL1T/yYvHBSG31gnsInRuKe0mSaS3FFcoPt
	gVKDwTGAa0GVspX1Fi2fkV/REfzfhwRCI3cmVt4vIFZ7l8KWStOF0yPdjXMrq6cG
	EgAaXelsR7fCmfn1Pe0ZRv0YnZa0Jp30F0EsKQOA5C0tx3LjMRMxvegdH2NEl2zh
	4F62og==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus0j0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 08:54:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so1361279b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776675246; x=1777280046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=;
        b=HJcs4/UFblyrYGkG31gTJoAqonKT/vsjU/SOCyDmfo+/5ob7f4sNnrK8RGPeSIn0Af
         69Jb3RyfFXRRXIdq0HwAdItWvYVNqUEQMaDbFqhsYkoxqJc9osK1p7EA3pICf+33lUzr
         KMQY+5zAS8Onmsb03ffbtZ2M3e078g5+f4bEhxwySasxGzAGzsN8uUibNFEu0OvktNK2
         +9c3mhZMPL2lfnGDuiKr2SkLfbxkRIY0fK78cgYvb8QtcadIWEttkeuIdCZqxj2+kSdL
         lbjKTC5B00QYSM4IK3IEWq50BcNKwxSIknLVO4GBd+OkhoVYWHAQkibB/Km7yvV0P+QP
         4uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675246; x=1777280046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=;
        b=YnHIDmnf8i3dlYOrKXvHkLHDbljXdITnUS26tpfcKp4nP1hkURi/iOQ0jmghulbs6w
         sfPfl5i3h8YlqoMsofhCFzxoNcmWUlNu5APUdb83qV1gclr0/ufiIqF9t7PC+1Ib95rQ
         SUnr3xLytOK2NPyL3MF42Kogw3ZoFu2dcImtIrc53ybG/HJg42OsxLWJA82gpdEOC8fL
         kT3c8xv49neOFQo38V3IhdX7YIs/ZqKEd6LkJIvNAboHeWFkNyc1BZjeYVKNFvfBUHgo
         SG/IagtNjhyTR4uL429zpz/pYHPPacRsv4m5OVS3qHOIZVOmeFO/7jyvPpxJrNoAOkxY
         Aytg==
X-Gm-Message-State: AOJu0YzPPg0fA7iBWVSp3Gp1lbHCp3dFCm1QUIA0fAOwWs1k028X/eKs
	hPaOHpC6RBO0lkm4tewjwa0BRijSN3vQzDI86QfxX0KMoRYmLrw6qAdUwjjWP5k1yVgm4xSfeDj
	//c02Tm7p+d5v082ULfa1btZGlwQU/kmK3TIfowWcfrI3qi+aJRNz8F21qvg6hMDAJA==
X-Gm-Gg: AeBDieugDunmPcWZa+f9ZtTHAgbMt8M16I3ndaWNJuqCpd0b+0O6RRiKEARpcbfnSxC
	G3Ze5CxQwakwIpg16oYnISVJ/60Y/JxOS8gTIDVvqAQHSHuAYu7tsvQH5gCafzU4si2fRzGoucR
	kxlrQK26+x9kqIp3vQANb6qFq3XezqMPSbAk7KLzdPd4GJG+OORP+5YahnUSaCDs/94LQvKeQWV
	huvJUj/NhVkp7kfH+NdIMgdiiHpO6vWz16Vfm2kFlnrzyhSK6FLA4TbwRW57ZJB5JwkaIpmHWbQ
	y7P9hcI91h9tUf9prmHMFK2q1BaK9W6e5bow6OcXnLw0rmnQ6XYDW5Y/YFKhwvQbQK3hpPS3K+W
	F+iJziGh1wY79EBgrZm0FHnbOrPuFqDSBBbY75P9ycCXkEezIxgb4bKSYnZz6
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr12392279b3a.26.1776675246130;
        Mon, 20 Apr 2026 01:54:06 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr12392251b3a.26.1776675245615;
        Mon, 20 Apr 2026 01:54:05 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm10997069b3a.47.2026.04.20.01.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:54:05 -0700 (PDT)
Message-ID: <8b971e25-03d7-4596-a328-b8998458b57f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:24:00 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
 <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NSBTYWx0ZWRfX0qSINtVRays9
 JRzc/TG2LqHTM+y9hPoLzHhPYVaaysFkxPBhHl68t8k1uWXNU6f+31Pr8ZqfHTktDLEICceN5FE
 KZC6C08Ah9B4ENfk8Bdt+1ifriLpCJW4DXW7WvGttbuDfQVbwNT5RuAjCwIw9jFxxNCFKY3+ZJK
 XXP0az1efketbLfMZ4iGc8g2OnFKJqJzDF/6ZDS/5sWzozKlfljtHZFbNMqtOfafEfQXOMTa3SP
 12JdeNnTBprgMXnCH+HTffzYbq1iGbul8Tgi9BG+QqG0V4CpeX2INvg4o8lWQNCMfLpYXm6q0bz
 oUoCTI/9K93vEm1TE+3nV/S72olFZr1JhplE3YuyOzCxm7O8p9Znr6/2VLRVSKlqca7i9Xh8U/W
 qpXMOBFYcjikAPQiJS7TrCCPpY3XfDDjnXdWHkt7QtcRviMnPVLYXyyoal+j0QcZ8g0VXa1g4yt
 DagES0h2mljVD9M5FxA==
X-Proofpoint-GUID: iEPDnaMsB_BE2SJIxB8PiYgNfCnAO9Al
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5e9ae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UFEU4FUi6niC1vJbelAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: iEPDnaMsB_BE2SJIxB8PiYgNfCnAO9Al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200085



On 4/14/2026 2:16 PM, Konrad Dybcio wrote:
> On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
>>
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
>>
>> This ensures clocks are enabled only when the WSA macro is active,
>> improves power efficiency on LPASS platforms supporting LPI/island
>> modes, and aligns the driver with common ASoC runtime PM patterns used
>> across Qualcomm LPASS codec drivers.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> 
> FWIW I have mostly the same comments as on your other series
> 
> Notably, msm-5.10 uses 50 ms of autosuspend delay for the macros
> (100 for VA for $reasons)

ACK, will post v2 accordinly

> 
> Konrad

