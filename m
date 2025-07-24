Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279372E4260
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367139; cv=none; b=uJ8QMDB4r57Iu8R1wTOpe54pNQNPlPNjbXylGDBs4rJmP/uJlKweWAt8qqzsgHZX+HxyMPF1nVTL6AXd5/UTYNtDk1yNQfiAjtPVmR7gxIxWY2evkNogll/z6BbYltvD9pWsBAcYIM66Pc6JYTY60QGBVBGB+xXtD3IXPUqRtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367139; c=relaxed/simple;
	bh=9TwUxYBs7bG8dOsoIWLmLiq180yfoOqGlaYJu6O6QU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvHmFY7ll5Ujpci1C4iNXejmenbvRJCS9k4KRtCLM632ggKoONXk6xD9X/wjmPqFOnp5xaHVxzWzmF/18GLTTsX0xriftYs5LDduxrDwQZD4mehU+Th96Iyaam0Rd56HH4fZrdOuDWGIaiOWqMzWbwfbEiqneZal8s3UnaBrakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6NU8bc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6NU8bc4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9TdEJ022193
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=; b=d6NU8bc42r2sWaK2
	kA/tOXeNoiGkbiv9nIYRNRRDyeCSSFBc35bKBjfrs0Q/qUL/uf4WW6xdypnO6lY8
	0s0s569UZMo+xbhw5Gz8M3UyJ35k1wWjiHI/fHgp3HFybJF7XYR4lgcJjpissq11
	5f5ITkyhPMB1QNPRhIgZczHxpidbWqoYFP+Loj8TXK7aPiNTwKwnfxUoaREDiG/n
	MYnytMqXPKqq+IbXGjO6sg5XdFiRNnBYSod3cS2g8mmt66hKMGjUdLYViF39te9m
	bcvrauP+kZQg3bQRPk4heQR0e6nJpFBpQwLE2ZjfeyY4PHtxdTBuJ76KzS02KH1y
	arNWaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kkq2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:25:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4f32e54fdd0so237649137.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 07:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367136; x=1753971936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=;
        b=sGUfweffigQ779WnTmDQX17XjBYMm//QtZJVXiYkWOXjECKlGQ/mbYfFv88HBCgX91
         Zs5M74LAHRTEVTvnpacJHZhaoZi0JRvOsuQxEheJr4TZohg9vOsfCBiUlyAvjT9sOueX
         NGliBqdFyvh8F2aVrYzK+AaBUtnqB3S6M+pObcpwfwdcy8euuRjscXIrFxuw+kuR+VW0
         +fmJ3gGKgetHv4SW7Zg2JT22AXLcOhmdR/C7YqHYrumOmuYH558LIHri0Qng6+213gcJ
         FKR29iIoM3uwP/nCoPh4f95KaCrVeTMPqWD2CpSgqeYuViBbdsblNWsSc2ji3lOPcwLY
         ET5A==
X-Forwarded-Encrypted: i=1; AJvYcCW41b733KdIwEh5WH2tHvn5DMpsc3uxg54h2oZOG0cU/UbWFu5wZog1HHMa5uHnIHarAIfMRF26/Knurw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGmmaq8ZEIyymLTw3nZEurV8/4W87Bkv0U3slroTbGUVaxY0O
	Lqq+5wxVWmIs+Ak5sDs8Ar5aJY1C4c25oibEQJxE91xgQSdgIr4yXExXonzwc8Sjk2frg5aB+PK
	8ZbrF9WozNIUgR40QR9RY6pUEtKlRfQGqg58morzB9BBgZRYTyU64efKw8r+lG7toFQ==
X-Gm-Gg: ASbGncu24LZYUT16bsBY/JkFGk6DicAHY1dACMdeXENDENYNObXrNGRgm44E/169uV8
	f3y/XHjAtdszd0pPFFov+M96IExAm0BffLcS4cv5h4aNitk8razgqQ7mKfv6h5QBBlO4knB/ara
	SjwZwlO2LGE2qLDfXSkQmfhznWNDKwIY9aYswJbD3U5N1HXSGHUxgr+5fP1EVwHoGTleqNoidMV
	8iGxENFZpNC5mFBEp2IScVYwO+1pGn2lJ2GT5WMtHL138OxuMgLmAj4Hee5K6TFFb/v6DbmO9nj
	qf+SGtV5S7V8RH12XT4wwIA0CQooOD+GVQk50q8EMjYhOIlRle3XX3VsnTkHcqTXwqs=
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295858137.17.1753367135914;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM+il14E2osq/m06SZGdVqsUY0imeh5XZ9qO0BRDLCTsWVEfMc4K/24znXseOfaB3Lj87ixQ==
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295805137.17.1753367135334;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fcb8aa6sm2378331f8f.67.2025.07.24.07.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:25:34 -0700 (PDT)
Message-ID: <e2d7d66e-bebd-48da-b61c-52fe2b74232b@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:25:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
 <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfXzwv+TclitcMh
 TQ/7OA0JGMcaq984hGfZlYHZ8+yc+Qry/rn6piTbM11ltTyFX5fU4USkyeY4BftN6txrdmsUigC
 wk1w/+XGt/4Ab5CMyxmx1Z6CRJtYxg3iUtm7X1ftdbCslz5omBFl7KyGY16y4RDVlUtp7Pa0OBz
 s93D6QASXcumAJbTkMlE1ygTPJOhyHo4Uswdlm1BL3eJyLsunsW3fOvSxIwdyBOczNkz0thkBK3
 UjqCw5ltOmjA6XQpN323QsX7UAusOn5oB1DzcoPU/2uiqR2J/MgrvK0ZkWq/G5DMXCVwZTU37Xs
 qWoEjNrtx1WTSS+RJ724cIy7xsJIFuVzlw044KrfAitp209rb3WA2I4Y5gjRQA0Gf7PA5OupvJf
 I2fCLb2Fdy3DYkXJotFY4HL00eNrkC8c7Hn+I/iwXX9/TsryfD2stBtndvEQIrDKlrkn0HCk
X-Proofpoint-ORIG-GUID: Uxvl31r8QCTXiQaKlfI7mnXYCHZgS3Lj
X-Proofpoint-GUID: Uxvl31r8QCTXiQaKlfI7mnXYCHZgS3Lj
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68824260 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=A88rw-UrIt9Wtq4Cu4sA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=869 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109



On 7/24/25 3:23 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I think this should still be @linaro.org, especially looking at your SoB
> chain.
thanks for spotting this, I think so, let me resend this one!
--srini
> 

>>
>> GFM mux driver for sm8250 is totally dead and unused, there is no point
>> in keeping this driver without any users. This patch removes the driver
>> and the dt-bindings and headers associated with this driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>>  drivers/clk/qcom/Kconfig                      |   7 -
>>  drivers/clk/qcom/Makefile                     |   1 -
>>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>>  7 files changed, 472 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
>>
> 

