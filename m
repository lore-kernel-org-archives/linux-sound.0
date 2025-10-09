Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A40A285052
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998794; cv=none; b=QBV9v+2f3qnbopKArUY4+sNqRJZzOI6yf6BQqCHZbUMv2d5d2MIUnqyjVHDr4JSiNBHxAHXYDjX9zyz+zIvHyNRMLwqHkM/yVvtC1f3u6WmdDNp3THexjF7GSBVw8YFtF29XkKrfhvE9L6z3f/QmyoWLxvYoFQJoxfPfOYABDMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998794; c=relaxed/simple;
	bh=cO0b9ogySp4L6nxDCj4cXryCcCKh5pkNUODLEw/Qa8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpqwvFqDwZlBNETCEFfrKPA++Sbu5aHxRSTGjA1rh8kLc0C0Htx+2o1JtixIsjsY/pWLjbYKeujA09/tcDPfBJ0jDvNaOHPvHkxIYzeGHNokRkBJeHHcUDXtfo67dDCEuFi/QVze4EpCAZOTBeFmX4K5FU2Vwoax3pR6p1q3+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f99qQe32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f99qQe32"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EI6d023264
	for <linux-sound@vger.kernel.org>; Thu, 9 Oct 2025 08:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlgy40yETlR9CVmXoLlXfeZtV+8pqdLDPcp36HkTmWA=; b=f99qQe32wLL4gnT4
	vP4m0hc5CxVBnyTqJ2cT5/5LgnbLm1PxAgkq9BCp0Qj/qGIKI4v3wJjyf0L9gvnP
	TDB8tIhYIBkvxqRe6YOF8WBHgqzghz9BYoNAE5Iso/jjO/LUEq2+ArXVv3/UGG0F
	LmNOMXiKiIwj2qDUAjjEmVASS7h9SUTUAGS5FE1/2rJTgHzv3AlYy5TtqBkoPzBt
	2epOpFH7qHDfYtHhvvzZ9yvPFWDUV1y/vKroehkILwLkTJ0gT4LSjW/WQpjJkevC
	OvYmiE0eaTu1IF9lYMWVG4ak0AptAKKZHi/R9LnlGp8eH3Pe2x98Y73HZi6E7msE
	6evCJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m23ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 08:33:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so1053547b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 01:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998791; x=1760603591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlgy40yETlR9CVmXoLlXfeZtV+8pqdLDPcp36HkTmWA=;
        b=vU72TKhJL6ms6q8V1clb1dgsKR5oHJwfQcMI6VAjeiAds04cIVzggcLbbHV5jGMoo4
         KrgdUCGV/HLw347RDlOuGO679tMBZ6BPKVqzpS6Sq++Q7T2nW3MBQBi5Vdd53pxjbf8H
         474HPsEwr0KDAd4r4Li8N1txhwsSOzvlh2sFvmHk+3olmUWf7O2pDnYFxNonOM8YDvda
         YLJNnunTKSlIyWJNeuEu1m+Q1/d4v+zNi2xLuauMzv2b21cD6QtMFuZAyDntFpdDiccq
         V4qkHGTx5oZC11LtjmxTL64+r4VOLrHySRWLmoXJUFezoFFjL/kVGkbGDhJjAuFoI4oW
         z1BA==
X-Gm-Message-State: AOJu0YzTJPes3yDEQm4AODD57yV+tSq1A+lnOCtgld1dMgT/9l7Z+Eue
	HymAeqrWNrVD/B9LmsYLW49GyRWnlRY81pNb5sEwFCFTM44QMqiN8JJuhRhMhlpbU+1ikkpUwBJ
	hSDo4Q3rZjNTHxOXquvhbrBoiZyBtjZfDza3OpZ2OBxRzh7BrYZAleXYvzSQrI1vJj0cuI5zT9P
	oA
X-Gm-Gg: ASbGncs2nH/m9vhzlNWGnw84/KsR0TiPPObnZNRf7U5XBM5j7LV10qolRkeXfB/hlFb
	oLdII2DyRQKFtKnkDjZ0U/V0DjV6y9Rae1JU4Z3/SmkgkGce4KlmsjvD8tKlEbkyJYpg9YwoW8X
	yY+EELBw6DI0wuR2fZcRIE8aJXDbmQW+M4iSpJF9gaXi+X2CXD+xVr/wNqcZ61pf9HdwMv/bFX+
	XM7Ou/yx5Ipiq5arZf9oOb+s/g5QUbdGNZqfmiJ0gLL2EFdP+bLjw01YI8QwMYEvgPj5SdLU7X9
	OugUST+t8p944wTAm0IJzg4ei1tim8pVQxR03e4K6VnkvEdRYfVHXQX1/pUxSE3wB4uHTyw8rd/
	sgTBhea8b9q37WmCUjeVvf9nnUKQifKg=
X-Received: by 2002:a05:6a00:114e:b0:781:9a6:116a with SMTP id d2e1a72fcca58-79385ce7b44mr6670768b3a.9.1759998790946;
        Thu, 09 Oct 2025 01:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJpAJYqqdEqGRYT4f/BDqodMlOPzBvXPMErzTaUIGOMqk3iP5UWKryIOqgcOw/n2dpHhEScg==
X-Received: by 2002:a05:6a00:114e:b0:781:9a6:116a with SMTP id d2e1a72fcca58-79385ce7b44mr6670752b3a.9.1759998790496;
        Thu, 09 Oct 2025 01:33:10 -0700 (PDT)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e1fc9c97sm2100782b3a.62.2025.10.09.01.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:33:09 -0700 (PDT)
Message-ID: <974ac942-b408-492b-9e15-dce0d2d02272@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:33:03 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
 <20251009023341.27277-2-le.qi@oss.qualcomm.com>
 <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
 <93491a16-0585-4c24-8ba5-0e4222efb5da@oss.qualcomm.com>
 <b8b70358-7cca-458e-aeb9-fe9de8b51e03@kernel.org>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <b8b70358-7cca-458e-aeb9-fe9de8b51e03@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxAgnJQxR3t90
 fUwGeSTGAJSuDOqxogd7ZN/dmvIfTt9fVO+cRfqG9zIhewiiQmXKbU2CqhdU0mOmwy3zpGCtGoa
 ZxnY7plS+dxV6YM/In8mSgMzDQ78pJbX4dOclvPijl5m7OZJ9X0eI+7jzx3OzuMGEHRc1x5WAB9
 4kw0yFd3W4Z6WV6Ac0O82C4IxiJrkiQNzzRrD94aa9bNi5TLj9ivoqANTNRYnYxS9MbvB8mxsPB
 RpaK0YYLWF4TkjXdoMS67XlfXFXajj4xsB9XxLWK9nZhTJ67iPHaom2NxbcdxittI9tYU4mNLgq
 Q01mxOIh/yWn/QdYC5IMwbcQBxkVyiXQnCqhjpvXwSAFeRPrK9RJVnRAmegy3wRO7nTTQGpHy00
 ERQkYAnEztQ6ltdesDU5yYEz1M8apA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e77348 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3rYEZD2lxOpiP_6SFuIA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: mkevxWyyk9iKjUe4RP4OIEFC74aP741y
X-Proofpoint-ORIG-GUID: mkevxWyyk9iKjUe4RP4OIEFC74aP741y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 4:15 PM, Krzysztof Kozlowski wrote:
> On 09/10/2025 13:01, Le Qi wrote:
>> On 10/9/2025 10:47 AM, Krzysztof Kozlowski wrote:
>>> On 09/10/2025 11:33, leqi wrote:
>>>> Add bindings for QCS615 sound card, which looks fully
>>>> compatible with existing SM8250.
>>>>
>>>> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
>>>
>>>
>>> Just clarifying: is "leqi" your full legal name in latin
>>> transliteration? It just looks a bit like login name, but of course that
>>> might be just my western assumptions talking.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Yes "leqi" is my full legal name in latin transliteration.
> 
> 
> Heh, this email is addressed from "Le Qi", so I am confused now.
> 
> Best regards,
> Krzysztof

Thanks for pointing this out. My full legal name in Latin 
transliteration is "Le Qi".
I will update my Signed-off-by to use "Le Qi" for consistency.

-- 
Thx and BRs,
Le Qi
