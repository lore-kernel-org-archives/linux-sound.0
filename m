Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2D321019E
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971347; cv=none; b=mlnJaAbW9B0YQzMAXJgjTTf8EmiVlNKIEH928bgpB3W22npmqv0f8YLfb95WDTcYBJJJhMjKP7LmWW8jG45XQfqdJLbqIqtMdg8qciSAtlxDRIIum5rq5pZ3r/Z3z1fTELVme2nTr0y+IIF5FI/G0jpMiPGE/mSSJCmTn2S3hjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971347; c=relaxed/simple;
	bh=V0bd2YeG9y+zp8acJGrcHch1eDDvrpqFqZQw7v49GGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFsZx/vno3030ug0ZzmTf8pybDCuhE3ezC4m7gYp4c7dp1fKilf6iVy8oxZy56PBYac+D71OU8fsNNHSOjEEQq5Rylqb4vOJfmdTMdXHHT4iV+eAQl0HYhRlHT9A8LyNDhXCMUkZO1oL7HcJRXSs4i2kmmsDlltcuU8TQYsQYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBTh+0cc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBTh+0cc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAKN5r009409
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzuzpebQuiCUmAzs2L6YCgPs641qaIn58unhv6j87lg=; b=fBTh+0ccm1R/JmvX
	diuVbb0dJZo3q/4msMn9YktM4kbmgtH3AqRCHguNxlnNkO0a4vCYlUN2Cc59kQ0w
	BLmdb379qanphEyQN7wlKXvpY2TZT3RRVcp70JZuIwUjqBagmG2v6kx2xZizeICy
	uLWdtXG9geJGBXFKZ5V+hhkuMB4sq6Ij9YGAG6cClE7pR0rkfC5GDPnFNyvCEbdC
	YPBcP3zfdnY/yh1LQ3yGtOKAudclz893+4lYegUY8bj0QOio4peCxJ+vSbVRgrQT
	aXLqDAT+4v4WEbvny4Qngo4K5Ij5B4PDr1H5I/zE3WxN60GOBkwn3Hfw429ZUbnP
	uFVikw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfd1j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:42:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c6f88fda2so111405026d6.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971344; x=1761576144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzuzpebQuiCUmAzs2L6YCgPs641qaIn58unhv6j87lg=;
        b=bNRfRdhjU2zmY3WIaPZJLYQHpu3ELF+lEC8hvS0DgCU0cE4cWzbOEMqWGZ0mJ6N6AS
         lD4L6E9vJiVwKYrZdSfQeSFFQHVZBOV5ZmeJb9qgCsNe8mRKrzUwB18r8lbqDCpyv5pl
         WxKuLoK5Ahz6Gngi/b2+7/EwgfMNkl9u/I1rQmWCf+TODdK2dEl/f9Bn5gJX5YvIQ1y3
         ntWdGMUQ/B40HlZja+K7LAth/V1ey0O8fnJeKrEhSVu2TS9I1iAUn0QdF1ocFCXqDHwj
         n1ZYHnIiix/LVBbgXV+n1L8c1pdxD7K5RmjbnvjFJFpSHoULKzj2ksTrJHtj30nh7c2c
         COwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/VE17tDqvF31khzBzFThM157Ih3Pe1BIihSliazoTlyisffYqTOOXzEC4a1LauWcBp6vNkpgoHdPX3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+1BE0+DKL2ck4n27kAenexK0SJ5M+w4xTwGvdZ/EL0t8Tqon
	4ZfM2LkUJFfNBn5OYPgKkwu8ckan6I9mpDPvEoL1xsxkwxU6E7qZx4NnZb4xl879DFWlAESkoOI
	vQpHhRxrfeRKwhQG7fQLzAKjpMpz6YymLkDuMOp70PhmYZ+X5nw7M/S91605EefEszA==
X-Gm-Gg: ASbGncuqDejT6ob+r6mxm42xaEYNrlbTGtCRJTfCVoPjelkt3lw4k65wMz5dx+HAb0l
	ghT96jjq3i1DQacY/gj0s3tKer712L8ZWbqfuV993M8LgKgE80gtg1/0Ey+1Ay3S22QLNhYgjgh
	jOl89lIydxKvOaE+zyO9/E0gcIOtXXNcfcRygyFb0ilH2INbf931b5hTIheePUmV0KoIDrsoiVH
	q82rfS1x/JU2EYIALHJ5/6iIC8+GhJmsly95jCrsh+3cuWL4feVmrE8nO+CfqD3AaeifS3E6Spt
	fEoDRd7GYhB8yfJvZRH0yRMIT0yCLjlg7DplFr1CD/8xxnWuzXIZQ721tEIxrV5dVcgt0uf96qy
	CV+hDxyntdWVdBUf+2Bk5LzJwpg==
X-Received: by 2002:ac8:5706:0:b0:4cf:1eba:f30d with SMTP id d75a77b69052e-4e890faf914mr179126921cf.23.1760971344131;
        Mon, 20 Oct 2025 07:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhtyCSF+YM4DeIm4/Qr3TrxytiWpj9q3AAOl3feDFL2dnbHUTsqqQ/KVurNTcsRVplFSTreA==
X-Received: by 2002:ac8:5706:0:b0:4cf:1eba:f30d with SMTP id d75a77b69052e-4e890faf914mr179126641cf.23.1760971343580;
        Mon, 20 Oct 2025 07:42:23 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-471144b5d48sm237038165e9.9.2025.10.20.07.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:42:23 -0700 (PDT)
Message-ID: <97afc64d-b384-4edb-9665-a5d654c19771@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
 <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -8djep99FgXf4FSeID1HcIYQJaO6STFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX0Th8eab8V7s9
 Ns07EQ/xSWwL20GATIXgsMoRJQDTR0CkdcQCHQcznY0yL1GdV8UxYiCAW/78BPpsWUk4up1hv6R
 8tsb66lZx74gPJfbTxefp/iIZGjWhndBeQsr4YehzJYParlSEOGRvtGpFt+OhUonqaxH8dFcFYY
 GH9XdRAk6gzMVXyrPZVTYLvxTf+Rj4rzdumsAH1SGpJOpkda2UdZ9Xnj14+caX5CjChXBrbvBox
 qd/5LGT2EX1MCNO+rA6nc0sDrRFBVI9EnUVDInloxqD0tYaBopaQEIPKASHRQ9wJVjKCtYGzKX8
 LXUgRVQ7bOLKpZNr9fwvU19gqMKQuF4nf0wkypPuLxutpzMBU2rnZH9aaPDzG2/OeN+DrjyqhDx
 zhnW9LMPus0RQTpy2nAOocPRVi1+yQ==
X-Proofpoint-GUID: -8djep99FgXf4FSeID1HcIYQJaO6STFP
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f64a51 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fPukrFknxGqXpuPaOycA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/20/25 3:39 PM, Konrad Dybcio wrote:
> On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
>> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>>> For record path, multiple read requests are queued to dsp in advance.
>>>> However when data stream is closed, the pending read requests are rejected
>>>> by the dsp and a response is sent to the driver, this case is not handled
>>>> in the driver resulting in errors like below
>>>>
>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>
>>>> This is same for both write and eos.
>>>>
>>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>>
>>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>
>>> I was also reporting this error months ago.
>>> Thanks for fixing this.
>>>
>>> FWIW there is also DSP timeout error on Audioreach-based platforms.
>> there should be only one for SPF get state command.
>>
>> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>
>> This is expected as we are checking for DSP readiness and it will
>> timeout if the dsp is not ready.
> 
> Can we make the UX better by adding "bool timeout_expected" in the
> path that we "want" it to fail?
its not that we want it to fail, its just that we might fail, if we send
the command too early.


--srini>
> (I have no clue how this is tied together, this is a high-level idea)
> 
> Konrad

