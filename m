Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2F21770C
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971083; cv=none; b=Nr1SHw2HyHg3Lr3afGVHmS12g/0pIEtxKJeUlF0Guhw0GKL41yr6mOhU21ztAu0kz4cRBXm4TZoPtaAOqRWJsNPndwb+0eNAKmIMTQSx8Gi3vqS+OFNpjbK7ClMtQy0v3UotjISVMNbbc7QLu9g20SzaKdSrooeZele1I+vMoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971083; c=relaxed/simple;
	bh=g7vm66uFoBWXERlnSFU9QSzM2MNBZ6eB9epOObSdlZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEuc+beAkiFw1nEWhb4vA9Rg38vnxoY+lOZg4k7x1hf8X05OtqBQ6Iir+9liLSTR1kR1/r/kmARwtf4Og0iD0KnYigAivMI1ZEmKsCWo4Jll1qPOOAjycOsSNtEAOqdlRAM+SIzeIEuX8aZ+cuepS/aoxJfzTrsAkAinlpfop2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwygVMAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwygVMAy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBh8vU023057
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3UWjAiIBrgLau2Sy8mogzZBA0wuWkqgwhg9kzGevk+0=; b=FwygVMAyWc+zuQTX
	Hv71MGzGyRMmHDvdinBNXZdut3E5ZuYTkSPocn+IXkEkuCSd97ehvd00YK3/YsOO
	cNylfGudOSyUN9Wg1wKS/GqRIG4/JcBFreXLwCaY1XzqJwIbfKBK4YCEv680AnCI
	SreQmRw4pugK51j1wkuX0xfOX9IJMYlRpEPYM3bzAcC0htHXvs8AZg99nmsF42CO
	jtVjAdxMgSZ1uI0gQXSj6xPwhU7zqHKU10ZSseXPjrpF0gxwKiRIiW7ERqyiMSD2
	PmtSrMNSAY+w+qCgMVOygEm63B/Jz7cepvEHz/DqLgBVOEakUPwFrGN3cOkGYYco
	9tpXJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hw3s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:37:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78e5b6f1296so134529606d6.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971079; x=1761575879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UWjAiIBrgLau2Sy8mogzZBA0wuWkqgwhg9kzGevk+0=;
        b=gVQLTuV1/BHap1CKnjqBqt5MwRYSRk3b80B9zmpmfOsYBTeB1BiKdJs/00Ey9AEWQ5
         +ydwAcveOLCNf+x0Uf3NKeU6KZGWG+BtYONKaAQ4N6iaKgq0Ha8hcONoo52I5TR7+BhS
         0AfP3g2EgDiWmJa9OTudI76FpvgFaBdPLJ2N7g/FiZy9dFP8Z5WQHYICcc5TkC7U4xzq
         cMtM9wWLCIY2gL+x9ixJMaUZC1vOVPB76EEEyGFruX6BdETLepfW68jBBIVpBU8C+6fF
         BXElAQmBdoso34tu2JKCxxdcpdTNbjwPK8AfcFh1/vzUTajumlHAHXdSGtlqKPObnBqN
         hVNw==
X-Forwarded-Encrypted: i=1; AJvYcCU8NhYuPmrogeg+ZybwOTJ9O7lSXQAKvtsdxpab0vMjRmTTo9k0juLHv+rwqeK7Bmb27Qdx7ZpeknZKQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/M4BFfVsvyYL5+p1V6a+x3dfCvB0GYsRGkwXmt0Ht8u8JUk8
	3oEA7MFcT5C1hFK/VhHJyMeLfA+e2/MDKAqRCLXeaiOpHohei1f7ggHURYCMMoUNl67MgeIynOK
	YpBBBQS52gNmiiO4mXrYL/pltYFIh1ywIVJLpl7oSPuTuH6f7hg3a0T7hxmkClxnywlKWZEAYuQ
	==
X-Gm-Gg: ASbGncvnyZbIpoy9w88i8RdfL28KroM+6rCKfJ7M8A8MmU4/cVwggBr3vLTj2iYNJwj
	DVLjvCDehztVGIiR3oxNvnXg9whosUDJ8qobOHfzPnbGn28mBoXqmNipCTeSKxtxU7uWddTyg6o
	UApNNcExViaGHn3GwbeLiDh+keJjJQefKUFeKT2XFd0O1pp+31QBkSWjF3ahnBYhmSS6xacy0xE
	EPRy0unURwdf3g6mGYKdqE/wAhyjON3gSt3wBABevs0peMXMAhg37tTkdVvvci1EEaEY9oy1yud
	jRYT4b7YcBp9CrI59/A/ZL3ZqHpjl4p+A6HyMcsLMRAIZ+mXeLo+0t762JHbMItkw7ayX08ebiB
	3VN/Td9/sVBgngQNHkduFg6NQJQ==
X-Received: by 2002:ac8:5988:0:b0:4e8:b979:c7ca with SMTP id d75a77b69052e-4e8b979cc56mr65036291cf.18.1760971078974;
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1lzeMW875NTSCbMzwfc5cSS58/qFqK7T2evBfqjYBnU2AF8O4gAA+d8fm7iX72aR+ZS5uhg==
X-Received: by 2002:ac8:5988:0:b0:4e8:b979:c7ca with SMTP id d75a77b69052e-4e8b979cc56mr65035961cf.18.1760971078497;
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427ea5a1056sm15657051f8f.2.2025.10.20.07.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:37:58 -0700 (PDT)
Message-ID: <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX5huoPT3ugU2A
 EFrHYyvBo5GdXNCnzpabYezc9/ejNm9piwv/bSdA+Q3k0McrUikk93RgxA8aFX2TF5rllDWsbq5
 JIBQR3dOExvoyO2bVeHdNs7Z/PULyPGxCfezIXdTpxApGXjxjccS8e46g9yzIzt7wvcG8JOXA0s
 5BovgG7U68HeM1L2Toh9/WV2tuR8nM62CaUehjy1UbEpX0IgW7e/eCRJT+HRn2QNneFVZDMWHFg
 ZtEvQPXm5NtjkYa7xFe0ybj2zi1oHVE/3omrgr7FLp43dJYtnKGsyoIQ8Ua8577iUF636UpnogX
 ttyoJg0bUO84Rk5WHijdTPBIFk/1uxQFPcWSng1fLN0ZlEJvwHSnfEWcVGCehQ1IEouPlY0W2eS
 WGpatka+EfhJeAkUQjNBCgT0+4DFZA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f64948 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dtEi0ryFqlHHO-XquR8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wHGI-oVKEuSRDOkbSQp-tJ7Gb5Xq8aHV
X-Proofpoint-ORIG-GUID: wHGI-oVKEuSRDOkbSQp-tJ7Gb5Xq8aHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/20/25 3:35 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> For record path, multiple read requests are queued to dsp in advance.
>> However when data stream is closed, the pending read requests are rejected
>> by the dsp and a response is sent to the driver, this case is not handled
>> in the driver resulting in errors like below
>>
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>
>> This is same for both write and eos.
>>
>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>
>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I was also reporting this error months ago.
> Thanks for fixing this.
> 
> FWIW there is also DSP timeout error on Audioreach-based platforms.
there should be only one for SPF get state command.

qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode

This is expected as we are checking for DSP readiness and it will
timeout if the dsp is not ready.

--srini



> 
> Thanks,
> Alexey Klimov

