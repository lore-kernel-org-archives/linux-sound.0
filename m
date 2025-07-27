Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE861FCF41
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753615519; cv=none; b=lgEPwzz4QUgpGisxb1Lp/AIYjPQ8YLOKtMLuu3n1B6dM+bTzXKGsV8JSQj6baMznjgYk70sMJZgOA1PY2bUkTuuUOjRa95voGKhz/leemqoszxTKzMg0pfxnmwX6iVXTgG0dMiUu3f366cnV+jqRcFjxHxKwCerLBQ+7AVepOjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753615519; c=relaxed/simple;
	bh=mpicCbPyy9dZQR13RfrXUc9e1M5HBHhRY/bkK7x1vjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLLSaUA+yt+xW+4ExhR6mr36hnorY967JVBo9QqM+mKBQgJWUmghrXlOcLzpMaIcFrBVvnsc6Cey4+NwnyS2JAOmE335bkldyw3NrvtI9eCcSrQA+FKIduWCHerl5PllzwZ3uJvd2blmhIEmuIJmV/ArAQlxyI25se9IyFnKaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q89WmYfw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q89WmYfw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R4oK6L032132
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfJKZhMSNWDE28vPZNyTvcOOnTgpUT1dF1tLEjH+ZFc=; b=Q89WmYfw4DOBQLol
	HXZhb830aRzwUa747kEC9YifTj/wkA3q2bIZcgwtVvfdoZZHKXDmxP6bkDv7Z3ZP
	Rm9/MDUmfHojmgAC0IQ2WT04PVnhLq9TKKm5r249awK4A6PLE2y7Is+Fjdj5hG9h
	OYsPMsrDRtGAxJ9zi4wvX+rjhgsxfLZj/DteH6LL4+8KFj0GpDmhIOCJkMg++5vv
	IwxEHkLYGUEB2MkFpXKrrkMaoG5sbsPMaFVZTkE1QfETKUaOe8KydM9/H1hS5l1N
	E6WU4E/G6wtdzc8uj6i+ZWk41m9hxkGAio3xb4kQHEbLMYHMZFi6kV7iDfFapILK
	JVaAXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qhxr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 11:25:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70744318bdfso10211676d6.3
        for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 04:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753615515; x=1754220315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfJKZhMSNWDE28vPZNyTvcOOnTgpUT1dF1tLEjH+ZFc=;
        b=GaW+AvXU77Q2x5CuJPvFkj9eQapCPW/tX3EwLB8lXvYUR//J1bZ3813F27F5YLhI3Y
         zvMUapiTifkuJKCeqZ74VTNfwZhFcNlB951oiB6q9IPYXKPBo/ROEZIIVM7mZSPQsNCj
         N2rf2mnU6pS2mlPt7+8AyQtNT9ke23RaZMl7LdKlzG6VwyV5f0Z0iRD71HmZ4iJy6FaR
         uA8TJiEdgEhupALmImqzsynyn9bz2+s/2/8sJFu5p+F1X0czqh6Y4tqOrOxC01LsoSzP
         aRd73DXCssamlRAq9gY38g5gdCFLU1g54cJ0Gqq2cV6zbUO3NAl0pN6Q1U6j3r/88Obu
         wTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUUnQri2Lzj11AjPQoW82pesVZy3HsVxQRzqbc6P3om96PRjVo0lLZpxYP6wLHB2+DXOuHpoirP27j07A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ5RxUa36iuibAX+Odlu5cUv6mTjnvVIo+NcXm59pd0hgKaWH/
	GnUm9C3BG0c1lCKE6hU0cUYSKBz9m9KN6NJZkfIKvSkoh0qaENAifiSH+3rTVyRoq1OBiTyuwiP
	lySaJrlsmEFhSdD7a+B24uWQ+7VJfhhi4q/c64uEEor8vJj0CX0wSCSEQgLDvLI13Fw==
X-Gm-Gg: ASbGncvhmtQGQrz0ikXBIQlPhUAsQ8Zsbq/T+YHYjMyCZvBVfCQYTgE3HtVuMn6pMzM
	3tb+QzaHYTPeZBxOS1hOFD54giiHtodSgzb0krm4s/7k/czkZGQ9cKyW79AAIhyNt6rfQBRJXbW
	SQYXCOJVmDD5qdK/b1dRngIeElNZa2zD9Ediy0EpFowW8k3ZdarmgCXSaWytQrBKNvL1wAijHQO
	97kwlEF6nls/sI67d9of9yZoscOyHOOgOAVPcomMmOC/pUccn2t0FPbFI544ERnOlMJKJuYbGyO
	VXrB8ezVerTsN5cpOxwzOC1IuHH1A9u0l0bH6zcE+PsfPnfyFldiyutetvJFfNd9ygQ=
X-Received: by 2002:a05:6214:300f:b0:702:bd34:75c8 with SMTP id 6a1803df08f44-7072049f3famr99229096d6.5.1753615515316;
        Sun, 27 Jul 2025 04:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkCofJ/1O0p8bOeiGbSGwSMF+ue6NzNwSlWHo2EXq+Z7g+oFlTe7pN+OBZy9EjswapZE4S/Q==
X-Received: by 2002:a05:6214:300f:b0:702:bd34:75c8 with SMTP id 6a1803df08f44-7072049f3famr99228736d6.5.1753615514814;
        Sun, 27 Jul 2025 04:25:14 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705c4cacsm114650875e9.24.2025.07.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 04:25:14 -0700 (PDT)
Message-ID: <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 12:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEwMSBTYWx0ZWRfXyY9gxPMOCDSW
 74BTygCAqZAfoMT/mfaJ1j8pFivYJhq688ZZuvK/S4AbsKz8N1oomA2GDh3L4D8i2htZchCjl4V
 ZQdaCMJU432t0fZaXPg+QJseVSQ/N+GbvWhEteGgf4nosWqj9EtEJeCwng8ab+vq2an8SYJircK
 wmNXV1nbxuzwy6KiMw+N2ZSkNvb9Mo2r50vD1dq5f6q0X090G4St6gSRCfEvzgWEYWMNxmciia5
 Orl7qBXNZlPStmGXkEvydQgX2QOIb9GXKJlroWyqGH61Dlq3vZkMHgXIpov3E5PGXhHjRlRcxs1
 2Kb4OSEZDiYzbdqagPIfLED3kiymthpXoVMOlmgvX6alFnkJsSMAP7kog+aqb8j+nRuYmPuNoXm
 p4SnrHI2I90TMTwv8SR2BDeKCXRDIVO0SG7L/Yx7Mw9+RMydYeYi6agHH7g3wbeouFcs4ff5
X-Proofpoint-ORIG-GUID: lnrK1phUCLa8XrR4ovzlPEAFUJdAOpwe
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68860c9c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XE7kxn0J_hhxY9Cja4kA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: lnrK1phUCLa8XrR4ovzlPEAFUJdAOpwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=681 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270101

On 7/24/25 3:24 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
>> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>
>>> Qcom Slimbus controller driver is totally unused and dead code, there is
>>> no point in keeping this driver in the kernel without users.
>>>
>>> This patch removes the driver along with device tree bindings.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>
>> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
>>
>> +Dmitry, does you computer history museum require this driver?
> 
> I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> the driver would be actually useable there, I'd prefer to keep it.
TBH, I have never verified this in full audio use case in any of the
qcom platforms. This driver has been unused since it was originally
added in 2017. AFAIU, no one is using this lets remove this now, Am
happy to take it back if someone has managed to test this.

--srini
> 

