Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883A19F12D
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860717; cv=none; b=ZoAvOF/GCaAOsQZg4+EJH4ZPoGCEcfZcFg9ZFvlIAQGUmutniQScCCwWasRMLbRKl2QKIJlB67Xu5je+qKR/5px5TMoFe+AGZByujsyhdGONkfrsnB1QiHzvNdWhbz/oWqAk6H3JHr7FZ/2BALgJDdmrIXKxUHosZuabZr51b4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860717; c=relaxed/simple;
	bh=yoJyzRpSCCIReS9JjsFWUlo+3vKaeWCXo30gNMnXofg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9GjKB92gVEdHdwo7jgzQlXGmlw+EHyTE4Lu+OfAlXffiQt3aeph4hHTQNgXg0lV93glQFhtvNCYTKuhhP/bA4PnN9fJ5HeiSEvUFeAey/fCrQ+r3oZRy9a4kWfm/Ctnjibx6YnxeR01ceIoBWVdJtaMtAZ/MDvju2aeWKIUFi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue3Nl992; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzpy78OW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue3Nl992";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzpy78OW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFERjB084000
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 21:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=; b=Ue3Nl992P1vXTS7r
	2Kr9PRYarDt6PFsjHetNQJ5iXRjWthFw7vUr7/Cls5DA3qkatjX9sLs+B5ulKmt7
	2A2DApK7uQ2OJdVT00r6dNjs6P09QDLkZzTGEo0l+e3/qyXn7Kg7IaCjKIJW2dz0
	VlBMNhr+J1rWFYgJhC4QWZCCcGno3k0k40leCOUM1B2Xzdzg/3agIZ2Up6gN7enP
	WVK1GhbbDq8OcC736Dxxkn+O8Yx3pUUWkLJb6Rov6Sb7YNfCdEMYSNKKT4VgdcV7
	WFeb0eKJlZRimkoWzqt8hPs1cDc/JYvWUsMqGkdiktiCXzZpK8/BWdNie4YvCvs4
	i1nr2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ag3930t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 21:45:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78efb3e2738so32497576d6.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 14:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761860714; x=1762465514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=;
        b=bzpy78OWKx/dBbU9jXd7xVIkn9EqWIy3tfc3nvjAVHoCXSRYCVxDGfBQx4WyjyKaPg
         FqytnF0WNlB+w1Ru5sK3bSNslSrqvrCmWnjb0h/qlPnetXpK/xc2FgpHvB2pa1lBSACS
         hFMR13yNtT88mZchubyidy6nkzNcv/LQCKeH+OJUp3MJivDztkUCC52YhKlG0ZWWWNMX
         hiqNu1s/e1EmOgjK3oWAf/S72NFJmXSv+gT48B2BjilGYMo8oXwPJCf2FjDr7OEhSJoj
         /rbvqMY4YNCT26jxG+dhVo+cn+BzyRnGRxPPC6RWEl0d9isXb9JPg9o+mWBCSR4bwAqY
         9JWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860714; x=1762465514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=;
        b=ZPVUD7K4S7DEFG3eZa555t1lJOmJfjF8MW+FG06n59dUrfHpjlv9uwWAP2TWyNUvXp
         X2LLryg3d/QjmoS0dve+9gYqqHdzLeP8fBTtBRHkg2INYJXI+d4LJw11ChWVQBQz+SIG
         UdBAt8B3ypcu1DIxVNyhIk4QQCVZrZFfb0oVCcz4xiO3sCISX/7LHngJ2XQU0FZVpj2L
         D5zMtaAkZX/T+PFeyP4juDYA7b+SlBOC8X1TYIUEjgIOpR+sl07oo52ZGUuMcm/TYsUC
         egGUtejZKJb4JEQZF17jiZv/lrMHuVSUlauGe0+7VFH83F5ZjuEY+b/HSbes5793GARI
         rSEA==
X-Forwarded-Encrypted: i=1; AJvYcCWzDmi7fro0K+4lizzcXiP6tOq3YU9eQzVc0/uTuXIQBFkuxt2kHHtaj10MPTRSQmnNSo2vapVCPRkM3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9GZvKQbDRyH1IP/c2/DbDtmZVIaFS7hheB7fqAOmqj0gG3nn
	2H3wUuEVNti8eAG/4yEsAWKT7HrN5ebnqUWB6vzXtaEgqyG1Rb5o3LU6Pct94e1oEclYxqTzPX+
	b0Jw9iCDsqst8IrIkO60mS2ZPAxUUe+NHtqrQfbVihI20zwUEIxiqKKfQtToRFExVmw==
X-Gm-Gg: ASbGncuzpHEqUOcpVcm923Zz8oFThQ1pHeaXqNoocegvVhqVoi8G2rvbz7nAkkO1zm1
	5BNQYzEVmkT1ocTzjU/N6Y7B8UOGYTiS4uPkx1imCcj3uX7l5jniqEYDSJr6dstSeq2+40K/Wvr
	Yr/IZzAHjgTKpm5Q3/hzAbKWO/vxjbcApmz2nrV9FbK741HbG8FT1aPmD1HvXD7MtTaS2Dw+c3I
	WoW9xcAJfZ1tGUjssgi9I+U3t32WcuO+POtXq2o36a4zGON935f16Hkkpo58x6M6lWNchr58yvR
	jU+uV5s5P9utgfuzs+Syok6eJRKd82s0rQkm3He/4GQJ7jTr3BquuRFq3xHtKb037ZqhCB4UaVF
	pHhm+lo1Cgpjhyr47bnAo2yrtjg==
X-Received: by 2002:a05:622a:5a15:b0:4ec:fafd:7605 with SMTP id d75a77b69052e-4ed31004db9mr15213011cf.60.1761860714361;
        Thu, 30 Oct 2025 14:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH+HqEuczJpMlpDDzdccuf2/KSeYvFUepMCMr+zEaProU5CUwiZbOCeHQ214hDIAAxXqCQ7w==
X-Received: by 2002:a05:622a:5a15:b0:4ec:fafd:7605 with SMTP id d75a77b69052e-4ed31004db9mr15212691cf.60.1761860713800;
        Thu, 30 Oct 2025 14:45:13 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm34225050f8f.6.2025.10.30.14.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:45:13 -0700 (PDT)
Message-ID: <d51f38f5-ff04-4dc1-978d-ad8ee6908836@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 21:45:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
 <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4MyBTYWx0ZWRfX2G3i17xT6/bD
 RLwIFs6FtyonE/Yg6vKPxH53OoIWBNi6iCIkaIgXQCJylZT61/aZAQid/1wkArHNYceWJJ8tvvE
 CArrrMe0Zu+tT0zT/oqYiCmgadbqLvVGEc6vIU/weCAKD3+SrRUxke/WN+9JG7UaGUkGlH6PaPT
 LIX+kL9MsQEG7N3OHGASmml6ZDoSCUl2NRYrBODVxoIw8osJck5fmZToPV97CVC2pi1gMdGAWSM
 GgEeCTMalbZMgU4xqP9dlwW9PSgi2jnBgjE+V9w5N2CtNS8j4+wtbFm+SifNxhjtSEEmAOe9v+g
 JcccBUH99Z4+uqXg8arYh0H0JeOJzgIvl/4vlchmH6eNe/DFbmcrFeqTNXVf+dTNcZ+kDRrnsUy
 vii6DLQxL8Vfu5sJsA91F1YYPQRQTA==
X-Authority-Analysis: v=2.4 cv=TrnrRTXh c=1 sm=1 tr=0 ts=6903dc6b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cZRtUSbEUlCTYNoyqfMA:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: nXeaO0pN5m0mrzM2RyVaZo7LP--dIIiY
X-Proofpoint-GUID: nXeaO0pN5m0mrzM2RyVaZo7LP--dIIiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300183



On 10/30/25 9:03 PM, Alexey Klimov wrote:
> On Wed Oct 29, 2025 at 2:46 PM GMT, Srinivas Kandagatla wrote:
>> For some reason we ended up limiting the number of soundwire ports to 2
>> in the bindings, the actual codec supports 4 rx and 5 tx ports.
> 
> The reason is quite simple. The available _limited_ documentation at that
> point suggested that there are two rx and two tx ports. There simply
> were no better docs.
> If you finally got access to the right docs then it is good to fix that.
> 
>> Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio codec")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> You should run get_maintainer.pl script when sending patches and check who
> should be put into c/c. See [1] too.
> Here you should run smth like this:
> 
> get_maintainer.pl -f Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml 
> 
> or check with b4 how it works.
> 
thanks Alexey, for the suggestions!

--srini> The c/c list is not full.
> Perhaps this is a consequence of putting all Qcom audio related things under
> one entry in maintainers file.
> 
> Best regards,
> Alexey
> 
> [1]: https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch
> 

