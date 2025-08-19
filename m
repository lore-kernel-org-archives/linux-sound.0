Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B032A3C3
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611096; cv=none; b=NMNJWH8pC0CR1LX4wvMgfzl/xfArwff6RVr0KVV3DC1UEJV9kUqdAfK4Hzn4wPmdCHwrRpAGp5YTsoOHmeKRQmaBSoOLNBOhK/4LVjpofBH4iOU/sGUIum0w0O+K0G3kSUD/xbqEBqn8kTA83NQ2SYag/0jE5m0994a+6AbBM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611096; c=relaxed/simple;
	bh=AYZbnwOPwzJWkM+k0OVBmKQh9N42C+v/pYFfjHMLRVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaeSpAeMK8vNcWNUPNsELJLMJMa3m7Z+NiZQBpObN9/bv6DpJRv/CPaSaPsa/h8jCAoCbBpYDqEBISrChTnC+4Ld5kRMgkR4SK0lHgoMvPCS9voJqw0GV/cdX92TCUqAkaKwAl1H4MKFxM+eZxim/w9Rc0ZGAZkDnPpRnlCzOvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCJoZEPA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCJoZEPA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90aw9021786
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 13:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKkqlT9s5AsaZO6RLR2Htiq0L1b+P8/Jn+4+PCx41u8=; b=LCJoZEPA0r4iImFr
	6lqcGcSyDRHxtSf5Wj7D7YzR89GkKGrwZ2Q9bteGEnCbOvrXHXxlrEX2LIJeVrB5
	qp7gvxNok511+XgHciddoxcrIQsxWxY2C1cV/TnY4l5ciDBCHLliBGPgalEOLxbC
	CWL0MNZQAkXO0h9w6p2INoEjj9/6XK/aYlkcXuB0k/JOUO5MBGvenyOMaylIp2yl
	gvGl8/oispfm7a6jCFR5aCUdkcAy5w3ArmvqfR/E9OUxAHQc0NIexQuDkXZeLv00
	FXZp0/dFep7lT+IiBT9H0OLYWM1h3o89InSqwZOZDqGgNjw6dSqwNQwAHgl4LNnO
	MuR+ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71ckdnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 13:44:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f534976so173190166d6.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 06:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611087; x=1756215887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKkqlT9s5AsaZO6RLR2Htiq0L1b+P8/Jn+4+PCx41u8=;
        b=KlNuI+uBsjc0qdFFEN71VYiFlNn8l2J4an3Deskb/g+FtyTDPVSi8VmYFNKGYuq5fU
         Lc5AFQphwyEFXXLf/afkHYRUFRXBkhpJm74n5zIjRoZYdamdN5LoimFNtdj33VjUTTMk
         lifjKy4jxXzfAkF2klyo6sJYpdy2UIjLIWGXcCzNFcBGPnlVihjG8CzReHxbKyJUK9Hb
         i+Tn9jn7/AHSHGkDXY4bG9u289dDi64GujHNG37H4cxrDTi8lU16/czBwQpDl692Z1We
         sJJglZKywomaiim7WCN7H9h5uI4T0juU0ArIgU/rSCZsAUYaOurJgPvb3EyrVFgd+2TA
         sjOA==
X-Forwarded-Encrypted: i=1; AJvYcCWRIbPIzeU2u8Bfg+dt+Rx5Ba5PeF2Bc1dKnjPcuKQUNMfzbf/Wvn0zdMzL4/UU3IEXD0K9IctD8c7HIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXBd3kkFI8Od2ovYO9Eu8iuCw2kw8FHRMhSPmtTxTsjBHG8Cc
	UYpSBVPcYPf3yyFeo9cLEOQxxtDs/D2Vc5STOcnQgApCADo7VmT1CdpdDZxOBlqMuzk/fuQpvz8
	d/qjLOlik/IUrPfEqDOQQtObcCmM6PitBeo/NQmr6pRXOdhrBXDMut6vbpc2Zh2MS6A==
X-Gm-Gg: ASbGncuyJdErh9Y5KuTRB9xiCFAJLm7v4iIUAoSohqFejUSFJqqMYaxtQoKIXFQcDhl
	e2DMwMXtpOH4mBxoIowTX6y+EmI0GMONyNZ9FMK1oX++tw9E7JGbRPKi/4Oc2LJBVqfKPlXutnM
	VBvqpRSGCCe8rbSwe6cm3lI2/mb0LHFqRK+PMzqoYihgBMEPrA4ZqGT4CkN4RDGqdDGavtQcy7T
	ZPKU1RzU2CVDdXIzw+bKiXW2xzieOd+wEIS8zG6YvUYIZAgEOg7jDbX6tnVTFIjPavhh3ZzQIJZ
	C5mMzh6Qgd+Wkwi5kkOxZ+Oq7SPRrzry1mp1Ug7al4V+yRZneoBHVJ8L8p+NzY9jspM=
X-Received: by 2002:a05:6214:5004:b0:707:5313:eb93 with SMTP id 6a1803df08f44-70c35b98573mr26058616d6.37.1755611087181;
        Tue, 19 Aug 2025 06:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKefw+kYHsABqfVxmU5o4qliGwOTNEXsA5EmB2zAtUTekLaQCS80bnjjzt29xlDNuC7G7m8g==
X-Received: by 2002:a05:6214:5004:b0:707:5313:eb93 with SMTP id 6a1803df08f44-70c35b98573mr26058196d6.37.1755611086524;
        Tue, 19 Aug 2025 06:44:46 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c07496f432sm3787926f8f.6.2025.08.19.06.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:44:46 -0700 (PDT)
Message-ID: <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Rob Herring <robh@kernel.org>, srinivas.kandagatla@oss.qualcomm.com
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H7UL4EWzToePw0_gD80r3BlmVl46bZnm
X-Proofpoint-GUID: H7UL4EWzToePw0_gD80r3BlmVl46bZnm
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a47fd0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lVDL77IP-BOR7NVgOTwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfXx3UztTmRcq2V
 KT0XIC39u435tyeDYi6GlIQWfQ+lUwYHssEdOqZ6ZpoozMwXZ1wJ2xsF40CO+PozMwJU3QuQWMr
 kNzm8S9Y42SQDkuI4EZcO6/H90oXRio1ubXgDr6PVDYOxzZCNePlYGHC5nq4BUKLAtLfEbF2kjP
 +zf4ToVkbGDK6g/7W0P6G4/hQ7JrnBoySR9YH+OENJElOloLeNZFoLx7vJptlgzJ2at9h4G1Q6T
 f4ukGYRrMjOW1F3ROeDRpYvSUnOLYQLjP7BKZYGhZtTU2QcaCpZ/3bgFgHFnIKIKZIg3zqcxSfs
 p6CnBJMiz7isKICsb+lvq7CFZ6oHx2nBf2y6SUOTX4eoZVHEkEs40r7jH0ckr8aJSl5ZqrSrvou
 klHyyGuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Thanks Rob for reporting this,

On 8/19/25 2:35 PM, Rob Herring wrote:
> On Thu, Jul 24, 2025 at 8:28 AM <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Qcom Slimbus controller driver is totally unused and dead code, there is
>> no point in keeping this driver in the kernel without users.
>>
>> This patch removes the driver along with device tree bindings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>>  drivers/slimbus/Kconfig                       |   7 -
>>  drivers/slimbus/Makefile                      |   3 -
>>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>>  4 files changed, 831 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> 
> This adds warnings to dt_binding_check:
> 
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> /example-0/soc/slim@28080000: failed to match any schema with
> compatible: ['qcom,apq8064-slim', 'qcom,slim']

Will replace this example with slim-ngd and fold it in the original patch.

--srini
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> /example-0/soc/slim@28080000: failed to match any schema with
> compatible: ['qcom,apq8064-slim', 'qcom,slim']

