Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AADD28DF22
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451497; cv=none; b=kF/lARUJXdZpkxuq1XXd924PLRdxF98BwIjE51DGR/RssrhP6sKwOH/+m3va19n1SnzDL77WSSyg1a8h+BcSDDBgcHVa1SN02Q3ES94zVHm2GBBWuPbVSit6sbJt005I4df0rsVN+8Qvfv8MutNCFfzbkZHQekeN/4VsDdLqL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451497; c=relaxed/simple;
	bh=C/ggDr2U3zgPwsBNLbn/6E0DwqeLz9NmTk3loAa748w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFyZbv1dsIXvL0TaaznZ71tgXxZ0Ji90g+Ed7+1Sece6rwZ057qejSEBAe/kqw4QcaDfQa2unxyV8KZh+AfBJqUWwpVQJzCRCpYiKwKebm05fYsG3+ffT8VhLeRlg+4eHJ4XCcrExzDQ5BbpwmaBNBToX+2ykWqpsBVEfc6fvKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdQJuX77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdQJuX77"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCl72R026623
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPuMK5jZFsmnypBiTqJe5zYuFHyiejNpkSdvHBAX+qM=; b=IdQJuX77asAFx/L9
	V9dExB1SzToC288lqlo7biqGHva3PbRcVejs7s2klOYoNqPpzUswLaVaayzdourC
	f6ZBK+R+SxZqnUn5Ivaknt0kqfg2JtOeZxo7uF/KKOOTQuLiafB8hKLkI0iogjQQ
	dknU9bBD9+wA5UrUfhfiHB9EEvyeqHEk4cOj69NWgDBDI1RQIH2sWhCGotCrWnzv
	KDurIHQhb6gXzv5nT9qzCsrDs2waLDJhpztub/2/TSRRhljzR+YFYKD6IFgoDlM0
	4IPOs66w2VZhjC+l7jUSxSKjwHmOlH6Ofq0CbNQ4IEUB4egVfCEZN6ATZFL+5CBS
	2xiw4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek2tu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:58:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso124201385a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 09:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451493; x=1749056293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPuMK5jZFsmnypBiTqJe5zYuFHyiejNpkSdvHBAX+qM=;
        b=QrjAhqEGynifRXdw5lN6h6TKR3tJXi1eiEA1aDPw26DIwEVG5tO3qZ5EhwAnojRpA4
         586oqk0I6LHw+SchdWc9pePFBlysmyMjmk/e/zhSHunR5aQ9WtcUoc3/Vvposet8kIiX
         I/6V4Aba7nDiPzbLvbavEWmNQdA/yaa1MTW1iF3WP1SZXZxtW/kewg7n53K/clhtLDkD
         VM+dcVtJXHYDRaVZcu4hi0Sn6Z6RvqrpkMmLtRw2P+twX7Mskw3KMlL730eZuZjT8t13
         swbBqgDPtyuLsUMv+W/U8bYO8PhiKdQoO1sJi+sFDMKnw9TiBUATnLCI2beoKOjkamb6
         YOEg==
X-Forwarded-Encrypted: i=1; AJvYcCWRhov0VEEhEc3zoDcFBsiQ2ZD1oO+IAU0hjCQJ4QL8mZw6YTn8h0b9YQxk/OO1HkGOZGy0KWTcQDTrIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOGyVD73NUpOKAa/VnwK7grW3gNGaJxyMVYP7aQOlC29v3Zpl
	MfYi4OWaH5+JYcyo7LxWLNLGihzefz5IQL59fuh7W907PYKr+zF8thXAJa7NoJtmoNDoqN+DSlI
	CRnmKh+X/C/qnLN9uQ3I9I+ndTDXuNTh7jSQAzxE7ykLZmwUNov/wVBSv+uEHnyL+Vg==
X-Gm-Gg: ASbGnctXOew4d+QuRvTjibFnPmVb4S6+pcjK8u1RHzj+2yOqz9Pa2+3/EZHd0uBs/vy
	dyVzMB8phiA0m9NfTM8yL9AnUzeXTqYLli3vFScaCR9nozmmLLYZuuneUkj63FmJJnNrrdBkzUX
	nBa+JjsfwKoOtEL4Y+LUwRtdzK2+kiNvNmEnOaaaPmPaT1bxoC/HIhMIU5S/a5HOTAnRpNu37SQ
	b5TKLfJsXj37FJmVoPdjD+BJRasz/cWk4bGAYJGqk28XzfXB6FuqPgHyaKj1GGrPJKVt7GhGZnO
	XCIr/EU18gcPbxfi3MxViGlP8AHZQpgNSSE3QjYiBzmxikuHBZMDBIq2R1AJjnmYiw==
X-Received: by 2002:a05:620a:3198:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7ceecc09f86mr921829985a.10.1748451493048;
        Wed, 28 May 2025 09:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkAjuwttwsySAmNXr3cyWyVH5nivsVuo17QQGa94DXhh90c8s++PqJyE2HPepyHAHWSRNEhw==
X-Received: by 2002:a05:620a:3198:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7ceecc09f86mr921827385a.10.1748451492681;
        Wed, 28 May 2025 09:58:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b865sm135090966b.168.2025.05.28.09.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:58:12 -0700 (PDT)
Message-ID: <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683740a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=RZIJFy7CuqSkVLaUGaMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZAEsTERjAw9xm-YAWnPEIQBTJfNe-slS
X-Proofpoint-GUID: ZAEsTERjAw9xm-YAWnPEIQBTJfNe-slS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NiBTYWx0ZWRfX/U6s7RdVj1dK
 X69P8h/HXrDoR0i8pDpfVExJfSLuWu4GctZo7/VWGNGXBiurusd4ktXF0njcBCX5gEKk9zBY3BU
 dpIsVR1pV57xAX2uc3hy/jiv56Nze5f0ZsnIgCI+fBSkV6o3TtDMpAxx2Znsga3tCki3s03JMiX
 xFce3TpKJjTIDXoClnmeJVwu0kwGRSyzzNZyxdgrw3dBWAM45/2LPqe/1PJ+dOkQKh/iStOugUG
 qAc7z2bEwGh31N0cVHUNNqPDGrIm13DAgHrVWAgKXoCxUECC3y/8aj2ETQhnZTYX58QV81JJM3a
 H+jorwsX1EQB6ZSrFLgPh5bY8dVstG9pbyB+UjUZ/P3vo6UY1RfYeDTDVPArffQl5HqDla5P6ks
 W/wsCfIDqaGHamtkRT8yBrCl/WR1jbX6/ZgrNjDhq18w1+IuO9oIkqqWzt3MgxvKpk4XZcCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280146

On 5/28/25 4:37 PM, Alexey Klimov wrote:
> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>> and evaluates it as a SoC component or block.
>>>
>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> @@ -23,7 +23,7 @@ description: |
>>>  select:
>>>    properties:
>>>      compatible:
>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>
>> Why dropping front .*? Are you sure this matches what we want - so
>> incorrect compatibles? To me it breaks the entire point of this select,
>> so I am sure you did not test whether it still works. To remind: this is
>> to select incorrect compatibles.
> 
> Thanks, great point. I tested it with regular dtbs checks with different
> dtb files but I didn't check if it selects incorrect compatibles.

Maybe we can introduce a '-' before or after the socname, to also officially
disallow using other connecting characters

Konrad
