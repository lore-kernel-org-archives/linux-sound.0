Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B858566C4B
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998334; cv=none; b=fm75A4iGhexSbKHJ8LpGJYq/oLF/FYfUtMyxKZwPihZKVNh1MO8wPp+WFXZJ7hkAjRr3VTCxD8FFpZ1qfiKnS0S2VPFEw/zrMH3XTMe+qA1wfrmf5Rqho4SEoR7ACkzRVglNep6TOgwxyM4ClZRzcKoJ06NEbX9ABYODY2mWpo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998334; c=relaxed/simple;
	bh=+A9h+HrciS1jUyM1n3Niv63g7pLYlAidJxXoLzyQlhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIzNBbvp5o0PGAL33vE1LfYk0OZ+Ro0HbTuJIxeMcQne5gSVh6WH37vVNdp2NhB4fJBtbknLJ+CSqb4zmtd1k8fk8dtxZyaYYkpTJ98EUoZ6w8teT4i28gsI3cU+MWANLm2XMFCzvaiPMVdvCE/UmnqeYOgal6ZSso0JHUOs6MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDUHVz2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhRpQB76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDUHVz2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhRpQB76"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb08D905379
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=; b=gDUHVz2X2N4nKlK1
	9d0GfbuuRhKnWi27WLFsjAk6144T6WQv4gFJE5vaspnGCxv/NKVLvoac51xnLLNa
	WrOF9bWbmyYvznGq87RYwgHAoyehPSo+IdczmyjE5DG+uxM1G2gpzwJooEtRVtFD
	nZF+ve/mSOeAKMeoVQ+NOyfLpO2Ph6IgP7JqenyWoduoIRsOD4wFmBYvUxZqXxwU
	niKX0iOgAjSRqTSBOjkxn3FrIoEtANSyGMplhabWpHmo62Oh2HxhKQHhpuuDX9vJ
	6YkcZ7fnhKbc3kR48x/j7sd3u0ryq18oyaGjDzmlDOSLQVUwXsWUFqk2bvs1tHJz
	T1fC1g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2rtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so16995921c88.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 10:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998325; x=1792603125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=GhRpQB76q1aBvFFnEueN+OM9eARweCITah2zPRdys2DIexZIes8tQ6eD9sHg2AinPc
         MKf8elNjCbk349e2GAGmsmKhtQABOXiUsFUVLXlbbTaNFvQmx/RTzo1N5BpsTkjPkeAu
         kjQiA9JTILly88myNSC47N7TC4yrhcv7ErzQYEzFDnbZt0Jrk5jl/1IQtElwLencTXZo
         jK4mSeoPJM+yd0B4u8T0tl1IkK90X9ulfb/nEycLB057CGUsah8nrCLBBG6C+eYz0lLx
         iGP9T11OFFsoC3hwLrRQGVbwEWiicQA6/ojZu/6C+LZxKrEG3lpnwCe2bH7dquogDdpN
         mptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998325; x=1792603125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=sg44sMaBjpSovHkDFqZjxb26evLCZMiKH3ikQMKX+eaQKyjDu7GiifavZWYByZM8vR
         HOOtPJmkqIiEq3qYfqpHSpasXJQifAjGJjfpZgSTq0MNo5p5jfuAEj5q38cN2nJT/ybv
         rl+x1xXMD93HCqKpCpOMRzDIBSYBuiz3rOV2dbxhPp/yJy+1TYWrsCIyBiTI+4jCeG1G
         6oSM2gpvA+txu5JhyG2n68qbBou8yQU2jN4Go67ICaNh4Jh1nW9cudGHLV2BcNNXVQwT
         Zdy4p+8p5D7R0XGuWu5rAwrjsr37UL4yIpMIgb5vxckOMmF9GGo1CXGE6hOLJ/R7aZjn
         Q2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0f3tDbe0zhTVuslRYfolbEC7fggzj0FLE4iOqL3rG8C7DjTrjdFrfxzSNLbZs7DuiCTF2THZB2RRKjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEZ41jRPF05/3Wk2iwaCEMgV9PwU57WfsvSYGfXah8XJRbflrl
	guqj5MhbcMbEVla0g8p1NcSCWoQEKXBjKSQrse7Ky96LsqkkMB5TS8jpjvE0zbTKxnn74ZZ1EAo
	cDorsoIjCQ1P9kG/t3DAPmpdIIivT4Yv7qb3IRguqQY7hYl6uEbuuTYL6T8aViBiEaw==
X-Gm-Gg: AYBFou3Vvi90vnfeOJOi+O82MVg7f56PCPhQkMlkn93PSeggRUR8/DS9m3Paj9NSNop
	iPeOD5d4MYChr/X02NmeduWg7wup0u3j6zA2PGGMikV9FQXbs2gApNjnO7xyHJzPh/SsIx5tSwr
	9cGQv2tC5kIeXel9n/CyjnSO0qQehkyIHVchn0fQCXMLg7j9GBoOrWvUGGKn+H6iaTk6/F3/Idd
	kysDC5v9P6QkidNnJq+VcSo/+FyJtkHuVARkXi1VhhCBn3zo9vhdFW/9E81G8E6sFZ30ClXRPMy
	ol3CD25rTPQUnajQtHDKDZ6Ua2XnsbMB9392G2iCGdVi8S06T37by6wKVvfO4EQbtfIrwYvkAXa
	TMyBHJCFpA2I5frNOf5CKzfIERPAY17CWakJE7d4=
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483840c88.37.1791998324539;
        Wed, 14 Oct 2026 10:18:44 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483748c88.37.1791998323154;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm62844317c88.9.2026.10.14.10.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:18:42 -0700 (PDT)
Message-ID: <3c40a4f7-b191-4a04-8886-7578fe3baee2@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:48:36 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the
 PCM1681 supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
 <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX4fzNDPI2ocBF
 EkoVyZ97c4RI0Ywp34DLeifeEQWvbL+Cz+oxlYb9jS2t/QmWPNaptD1uttbYvmkkjJOi+5ooIG+
 39OM/q9vVlokgQadxNfn6BUVyQwWEwg=
X-Proofpoint-ORIG-GUID: N3YCKENL8utZeVsyAwIlo-vbHBlfaPQF
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfb975 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EeIf7S6Bmj70s5Vw-GQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX8jFEMblkF8Vl
 x4ZTAQrwMPCtECl6Kmc1kVlaD3Ljv0CxT4HZikOYVQejvpYvVyf//bw5oNpWx+yvNIpg3wWm93Q
 RN6rsfw4lZb+BWLPWa4fPSdlEdW4ndKgItDGTth3tttKwuWUZ+NyitT/gDIOUIP66OCjPVqW8Rq
 phIRAQxcLiV5lad2xRVyM5heI7feNzKBAItbLbQzOGOhhb2jd+5c1pSJqH35eJH9b75PqYcm0P1
 7SAPKb0svYJoz/KEyGlOug+U0p4vm0W5PGK/ikdboP2J5H5BFY9T7OolHUV/kfqHBTbggCwUh/a
 S9z8wGb3X3ePo2v37xxXI01xsuMPMnyrKjbeQX2RjsDvlGG5GQVprp6UJ2sTh81n7HtqM9Cp9Pb
 OrcBQAhMy8+FgHVVDIAUM8WNFSx5GEk2GSPKRSKLILp245MFKK6a7353Sgh3B3JMUdZ8RE63HQy
 XsSKpSQSftzVUswniyg==
X-Proofpoint-GUID: N3YCKENL8utZeVsyAwIlo-vbHBlfaPQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140068



On 10/12/2026 11:55 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:50PM +0530, Mohammad Rafi Shaik wrote:
>> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>
>> The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
>> digital supply on VDD. On boards where these rails are switchable, the
>> codec has to know about them to be able to power the DAC up and down,
>> which needs a way to describe the connections in Device Tree.
>>
>> Document the VCC1, VCC2 and VDD supply properties.
> 
> Property names in the bindings are always lowercase. Please see DTS
> coding style.
> 

Good catch, will check align with DTS coding style

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

