Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B726E1FAC4B
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971207; cv=none; b=khjVpSdpsKJCfF74pITbaxPsptv/fc7dXd7CXxo3vU/6J2SB7scVpoUa8QTMI5+FWVVXO1h7Cu3GFug492BNUA6kKnPTJt9rqskSpb1zoNf60bMn5HSaHd2IuoKWUFF1/39CMaRccc7TaxaWICJIa9+M4Cbx91RTWrSFvNu3HD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971207; c=relaxed/simple;
	bh=IKm0z6iO1hIaheLCdQScebPMc2ctCaCdPFDDsMKTMK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZrfozfhd2Ri/JuGryYdzq5HtjZDKqxEBQHbDwcTZVBIibpc0bJFKXERswfyqdUTelFRijg85eMiMVssBmRMfcfS0YBAN0BNLSgfl/MicVjB6tSNV45Izv2vNJm4cjKWK9Q7XUKNmRDB9Sqinuu81/muz11PVePDWVgjC/ovx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrYSO5+O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrYSO5+O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBDxlB025907
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zu6f+vYXQ3o69XdqhkZydYNTKJw9PQzWWyZv/yxYgk=; b=NrYSO5+OddTicNM8
	NDpvdGDeS882JLzuYd/rX6sgk55YMSvvn56Hxviyl3Jm2/YRmW9YX+0nM5mNsV+s
	+VEczKS4S8mGLpvqaUvleE8IJhTy1Be+Fv1VMG0qQF+imN4ovukzGtTKb2oJZy3T
	At2uaEAHaB2C8XtWm6m7PXiIlhZIRbV8DnDZF+1y2Rkz6ruZoiFejuUScODgMmZM
	zyd1e0cWMd4Fiq9ImuTB5kUf43/vBbcSyJLI1qFSEuSxOo7BIy5hjmvp7rfz6VUJ
	8wRU4R/+ChGz1ao9nqiaIUGmnY34hTXnF9eRIgJ3vG0mYQgYLJMn7ofdxR0LMddv
	69ydGA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w2pj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:40:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-850553dfef2so15817936d6.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971202; x=1761576002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zu6f+vYXQ3o69XdqhkZydYNTKJw9PQzWWyZv/yxYgk=;
        b=eA26l66ALaCu2Xq6jhFII/+HtwMvKHCw76IcnzK8XvT2UHRE1Tzo5r/Yn2pVrpS/iT
         qdxWgHNhA+gT63Okj8wQVrODLo3M/2KLq2VUIPWyl6tBiYzVXPGnKI4Z0pb4R19iuBWC
         lWA6n6qm4odMujS5F2Kltba4tS0EXwR1U3gAg0ZT0530xHcucBU5x0ZDTOhb30MGDmCv
         Kqd69FFK7tfh11E06JZEKrN4PXIiQ7ay9YTJGjrkzGtw3J7bf8/u7/JzN6Je1/g7JPsT
         D3vpTpmP58lYq61e2OrvSqLl2amy1k2T41/Eavv0V7KgH0SGOzmbQ/4qf+uE/4PmzRxV
         EAfw==
X-Forwarded-Encrypted: i=1; AJvYcCU60bCLuBbqOozYHd+O9oxz6g72JwFdAmsbjuGcLsw7Q57T7ifFXLz5ICgLgftrzJCKAjWcwOGBEZNkMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYcvR+FdHpt7GVA0qY6Y9DfpHtB/hycapWuzv8p7ibQg4AjZ7
	8woYzLRk/ilGvpMxjnKNtUkpg1B8rE07UbTLGh9PyvSaEwv+KAIV01XLIbqysB83O6lvv72DR5p
	CT6q3kTaxz2UnrK4X3j5chG8ji52Mbq6ClPYN+PmwYu64OLe+2H7dAFqegNX5YAquVg==
X-Gm-Gg: ASbGnctTfORVInscwZMibMZSENJNnIFmiV35nRrRWZ1pwcW4mhFeUxsk8SGNR3Hhs3A
	obIwkbTHrHHohxcB19MUPOz/bhMRw1YXAVHkXb1253s+YcJWIPXJzD0YNl/mvqHEpcQhHX9IEJI
	Y2gY4H4qAgJnoS7FRU+o6jiblDHAwERbsEpy9YSEH9ZRdNbIGmMRm66j7F1vbhq96lR9U39iX2S
	vXmHWfhmN3RB7ZgAEnfBMEXcoA7h8X0mzzspe1fkvmHxAHw3LeQgK4bZiu3CVPURPp0v3DQNzyg
	xs/2FZ4KRYCiggROXrULHlbWBgNkNl1yehTMwdZ7+4x/oB82eoMmM/6Ds0LscUxPykpeDCPlNAT
	7kA98RGk3+wqCCVrkHMVA0G4F25KJBfYB2UrHUmDzcn/jjzmI7NtgiBcp
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr120394521cf.4.1760971202326;
        Mon, 20 Oct 2025 07:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzno6zE7d8ywaNnHDQb/mNOI0HSKIv2hIac/LvxNv4AS9Wp4Sv7j0diyZ/CVmZsJCO7Mn8DA==
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr120394271cf.4.1760971201756;
        Mon, 20 Oct 2025 07:40:01 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e89713ffsm809097366b.36.2025.10.20.07.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:40:01 -0700 (PDT)
Message-ID: <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lCM7ijqd8cD9Y1BGg0-uugtNVHGyr6Fk
X-Proofpoint-GUID: lCM7ijqd8cD9Y1BGg0-uugtNVHGyr6Fk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX+oOCcxNF7w1i
 d5/nfYnYQ1gUjqly2vewhI/7iZEuzH133Zy7DqztRfx/vKlyz4bZOp2T+O2jJ+PsKUUW+TnMfLM
 7/OaXiMMwNffyYFGFaDGLSsu4sOPuUfHMQq10NCMrQylimnuKQK9gBVTfsfEEB0cgoZBb6tQq3S
 UqHZHHnraF2SgVSIt8PlxwtUNekkBDDLWUBxo3TQ9TD/8hpvDW9Ybe8rDB2JKvphMd7ja6idx0M
 O/XtOZ3svPbsjwjgU2I9bnpW7CUNbDS06mEvc01sZ10EAh+fJhe81zD+2bn+UNK1vvXC3/88e0H
 9R4bzR+ywgAeXMEkBzg15M7WfQIk21dDDiXKBD0s3PDWCK6psdIL+ESEDyQO7lxz35iBDPU/8mC
 SG8VLvaNUMbQJX7+siyksyPOrNzI0A==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f649c3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iwlf0Vfv9nm2vOHXmi0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>> For record path, multiple read requests are queued to dsp in advance.
>>> However when data stream is closed, the pending read requests are rejected
>>> by the dsp and a response is sent to the driver, this case is not handled
>>> in the driver resulting in errors like below
>>>
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>
>>> This is same for both write and eos.
>>>
>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>
>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> I was also reporting this error months ago.
>> Thanks for fixing this.
>>
>> FWIW there is also DSP timeout error on Audioreach-based platforms.
> there should be only one for SPF get state command.
> 
> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
> 
> This is expected as we are checking for DSP readiness and it will
> timeout if the dsp is not ready.

Can we make the UX better by adding "bool timeout_expected" in the
path that we "want" it to fail?

(I have no clue how this is tied together, this is a high-level idea)

Konrad
