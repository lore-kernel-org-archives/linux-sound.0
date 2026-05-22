Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB8233956
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454532; cv=none; b=gCm0OnPbCoLinuub95h1iOhhT59nDenTNbUKO2HtMOaprujGIOmqpnfZUU2n7igMNtox3Xo7HzMOPOOhVIIw7f3cHlU9q4vGr3EC8kzCrAp5pMMuCUKDDdstWhUJhtqhzJ188NuPjzPLGS/VoW64UJw84et1N4P6Po268qzJGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454532; c=relaxed/simple;
	bh=u8mby+ACV+TL9s2LmGmx/0ThG5WU2JXLP4YTWNGA65E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVODhxzkq6Jp/MoELvxtzs6Eqrt3LS4/wMnc1e4QarSOUFeQSDvSRZ6hweCa0yA3vDKE7MuQQQd1GSO24eZhCHdPQcO2I605gPTApVIzpiyIxLY6sFCD1vypGokquJKOK734hA+kllp0C3EYyfQRaAMxRhoukuW+n+l73LzUfhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzqNSWgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLDswXBY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzqNSWgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLDswXBY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8Ww2Q3532229
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=; b=TzqNSWgvN/dh7B5l
	YQ4fT2PVuWWQgv9gXTGx/uFmq6v6Qh7wfrF/D08CTEm4w7Rw/qG+KrPI131vk9Qy
	r5ZxQ0QYx9kRN+3TUJvV6WIIVd5u1J/B2zghNLPgtDdd3drhjjd9/1HGzd0ifUvW
	QJ4bP7uhXsxTkkd6UeG4L8PY/DlQr4U6CwLETqzg29udZyJ2EvfuMLclCNo233nT
	lqRNkwMa0IruFx0wAczCgHPqOULIXGLTtj83WXiERlR+nnTOwpe26eWvvITKKA9Z
	G+ROjYlZW5NmezXwNR3KeiXts/SfANiGcvKPKy+T34O4ESaxZSwwC7jVmXpVqHHd
	Sh4YSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw3j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:55:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so54334535ad.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454530; x=1780059330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=;
        b=ZLDswXBYnu7EcM/aYNagK7yqHmaCp3ZgUKKy3zqHIBMRIJEZKsdu40Zf8PNx2OdgId
         WZMOox/ji1ufvzE61WJUVoWaIYaOI3r5gd2XSLBUHn56aJJX8vkaG4SUQ0NuMoyEBOin
         uxfNVi4XhGUnUvrkNV45ZU1aYvsMR4FnT5CuUVqNjV9Jgy+ACzXK4l8PH90nWWHmsRLT
         9k2+unLYaTf9NwzfQ0jC8Lo4w5UPRKbcL3KnJzjYjCqc2vC/aZODA5eA+HWtc5iAFyHi
         90QmFmy8V3C25WDCcgja4Lr8/QvhyVtDH0m7XGI4QrmJSiIUYmmc8vn9qxbG3YZ9aE65
         huDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454530; x=1780059330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=;
        b=DNwfzQjsN5BJiLzxl179zVGbNl54ZEan2h2Ihs6RJv5vIwAxaWLj4mrLsKJUUUD7Bi
         JA2+HO7LyaKur4/lmzClWsq1bVroVgBShjJpvqYiORoSLDCyvQvxN9VheREAy8AbdPqv
         eYaeBeUmjm3+Ir4IKIidkcgybbFbYrUNpw6G+MYiASq7e3pY5Tf1IOcfDtNg3N7SbcAN
         7Wk7ctz54uwxZDLjlShvSud06SedJHxM/y08Qksh5voMButg/8mI04qh6PfN7waH+M+6
         cupa9/Gcgrnsg3LruukWMFzFOpR8jamzgKYX4QzDRg+qvQ30z0Vn9OCU6fVznWZA0QYo
         5Tig==
X-Forwarded-Encrypted: i=1; AFNElJ+Ec3sLlSBJXI/AAgvu0+fvmW/edzbUqH/UID6ouFMcHroCx908oMLBlNOUjqlEpnH4FW7SYurSmLNanw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZi2Iz52m1UXm5gn6BUgOFHQl64xmD2v8z0pAI59TAV0TJ3dwO
	+CIcza3DwVWuivP1I2FFg1krC8egc/f1zAwRqgI6i5fum22tmwq/DxGwfbxruerPZL/jhptpNO0
	5caDICFasSP+wIGGrx2gpM42C50dEN0Nsa7vAUZsnv7t+Wf9eUCN77nKT+2eS/RmipBh+Ou5WNw
	==
X-Gm-Gg: Acq92OEKfgyWaoXBTNTBC352mDtgkwQX4aeXnIU618XC9HHUz45sE4+G4+QsWODfsrt
	Xx9Rb2kFfcqQHvVoPAzfcP4ssaj7JVZdEIpLsKCHu1c6OQUvH/M+psGo4mmJ2+6bkrIAyuzh4FU
	Lk8ymJnraME7qgpQXvQpGpCC8yovZjc9MpjgWviwHREkzCIq+NMd2PKOVIbrEwg46WfNL+f3IxD
	ZzuXIJ943zit6L53cbjr0AgTjJTr6wsIc/tnPxFHHzpH8bQ69G2Mh+RIgIvk6oxKD2tnfHSA9iy
	aLh3mD2PaYcuAYvCsLrTtZYwPUs1/JceBEqXQRRvFWSP4z+Dwsj0ufyswzVcEGhggWS/XXIqBIl
	stt+DDC4VZEjqIwnqhlDi7fXR1lfx1Yhx9nq8gsYuqfFuSe0CBw==
X-Received: by 2002:a17:903:11ce:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2beb062c567mr34301745ad.19.1779454530126;
        Fri, 22 May 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a17:903:11ce:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2beb062c567mr34301395ad.19.1779454529589;
        Fri, 22 May 2026 05:55:29 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b5886sm15757695ad.20.2026.05.22.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:55:29 -0700 (PDT)
Message-ID: <4f0dd486-979a-472f-8d9b-37c1f10e3850@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
 <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a105242 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jzy3uwMFAPkgEWCbuqQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 34p4Csqq6QOfYXURlzOXdfNs0sdb3S3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX9O+GA/Qg4jb5
 DU09xpi+IjhyaVQ9KDEm3uozZ2J0HqI9UBJN4rBAFTUD9Is4PQnrgW4KD8mN4BWvq/lNe/PGI3c
 dfv46uhiwhz7uxCNMVjzlxFqcd8wcsfJ6vMBOKWQzCWnjKHinhWSVLAXcdOMS6WNAIqxpiqrQGb
 iR7eF2eOnMzgHiTPcbPmxijaqxwxgU/kG1G9L+LeoC2eBYED7TfTQXtQ3j3/seaYHyCSKQNHT4/
 XGSl9ObHzMW5JtqE1dwvE7e6dXW3JWy/nF9H22+DSOzvMkiPSVexHkIeLrpWErbvF77OSAP14D/
 bBw3iQ8Irxr/U8FzmMVgdtq5Oen3ekFWmo+I/XqGF6tMgBvgo+M0/8vBs007zzPLe62PvUMJhA/
 yhcInC9qS1TRV7395QJgbRgLdlT3gzZzFVyYEkK3yO4BWXqj2UrgNOXeraZKimwnlq9QmLYW+D7
 eWhflt2jcywh6TVDZcA==
X-Proofpoint-GUID: 34p4Csqq6QOfYXURlzOXdfNs0sdb3S3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220127



On 5/22/2026 4:12 PM, Konrad Dybcio wrote:
> On 5/19/26 4:33 PM, Mark Brown wrote:
>> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>>> for runtime power management.
>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>
>>> +	ret = devm_pm_clk_create(dev);
>>
>> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
>> then none of the clocks will be enabled, the driver needs a dependency
>> adding.
> 
> This goes for both the drivers
> 
> I don't think I have other comments with that fixed
> 
> Konrad

ACK, Thank you


Thanks
Ajay



