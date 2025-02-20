Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796661D5CDB
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075930; cv=none; b=LyvxzCw1r07CGMHYnd9F1IISXHkfJQgarzZziBGsD4Umsg1SAwos6L76xgfpCxvaF5hVp+J0rIPJzGf9Sotp0vXPXcooVUDh30B9teKL4PQD9HgGmgdjQnNv2z5RCuYVJtC5vVne5uQHbiA3iswWu4ZQizuQux6yYY7DL5NiRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075930; c=relaxed/simple;
	bh=zwCbAmV0UrBlFPKO7+y7rUPu1f/T2W+am4nE33G3l4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jN7NtgAj99464/18wqM5ECeKhDxPM4b3Oxv4JQU0PiutqYSVyZhtB9JoOKYIGg5Tvv458M185CaCI14g5UwECBzCeaCmuWi8BMkXzYWz0cM9ii2zobF1n0/oxZEsB5mCCKNR+sousKaFgmiGlhf/qIJnGFz+gv0wC0Cm8wq7Wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k28nTghD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k28nTghD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KGEmMl001819
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwCbAmV0UrBlFPKO7+y7rUPu1f/T2W+am4nE33G3l4M=; b=k28nTghDKXuyqiXx
	KkyT59ePUeNrjQW7JPaOD90jil7FKgGl2iNr3YCcZZY80phoI4Ym04lAwGCUTVTn
	kfKXuCueHEiPDwU/iP1YEeM3ueTtu49Gjs55bkyNLRGi38IkkKvBEtpKkMIJyt9w
	yE0iGlNI8uhbfJS+MOho09d5uj/odOkHohaArbxj7IxFI4he11rJYS8yYW6xOgg8
	E1+VIDkm1XJW5RbpxnLiPpkZPolztS/PTXIpBuaSfeH5j5JSRPgRErcKTf8Iat3o
	o0ZFD9MGcqTRlj9oNuvk0XwF6FoAmO8mHuYb7Lj8kno5FpEclD5ajJDvKdF8pViE
	uuI1cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2f34s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:25:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so2530490a91.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 10:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075927; x=1740680727;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwCbAmV0UrBlFPKO7+y7rUPu1f/T2W+am4nE33G3l4M=;
        b=uv5kOx/R0SNZZrNSajKdXGTModDpfcRurl8pVJXbGIDPx9mfvl1Q+I/Vi2JzKBFLDY
         Dl//wt9o1LU920JTeF7gpr9Plq3VeVRw8bVGdmJlwEZ7Ti+qb9Q5NMh8e49bBzjgACiu
         /xl8OubXW24wcNhSJ0VzyQ+zMTUltUtuDk1qsP/rCNkhFJs1Eb+jKxe8SwO/34rBdxZN
         XqOWGKD+DuLEtYwNk5ROl/omZJ/SVL225E8STLqynPKKZG8nBKTQOuXonqNJvnidnEw6
         aKb1JX0M9gtq9n6/v7SMMKVVOwsVgesk8133JYOk1kAOfR22b43CGFq+sl7WK/UGqVXc
         GFZA==
X-Forwarded-Encrypted: i=1; AJvYcCWg6TwHZn1/dIZubyn+5ENs7FE1wCK4lcWtHDuNhnE36v6ZDtxjdk1/9NJS021K0Sil/HWbKTNe18xDkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9L36P+Bp9pb6rxciSdxbfu9UaV8ETZuqRXHmRak8dhE7i5IS
	RmvFj70nmAXEBkWsshoMlLcpODmXZSFOmZNMNnXG8QnACU5ChOkLji7uYuzQLJ87Bk5u9eIk2cr
	DpdlD3Qw9ka9hqUGnmEVMDtZAHVYZ0lDCSjfMG1ASKInzY+n8quzFSxnZC/4Iwg==
X-Gm-Gg: ASbGnctja7NCBgLFVIckTpdJL46t+aUhq4CRzVSIGQvcQBQS0G2r5+jft/oMU8BYbYJ
	g0ZWaAUozNjcEC9ZXuy4Q8UuLhRnt8Q+Wl4AT6oM3vckcEW+LVtzaxfAQV0spySUp09bVTpeZnT
	CCyTg0P6Km7gUzVAoOMglSvrCPer1tBGpKuiLz4r7jeWekBQgB3iAxGCM9Vwcoo/NIVJggUazG0
	IDXHJYvoJmUSFt/VqKQNiCpLY9fy6hN0eAFOvhVWQ5wPFsRUrUO65mklfaiaOMksgowKhyMKvMH
	qfMPL075d+2PsGv5OZ69M2+b2S5PcJ0mHuJZmiQX8g==
X-Received: by 2002:a05:6a00:1946:b0:730:98ef:30b5 with SMTP id d2e1a72fcca58-73417248ca4mr5086325b3a.5.1740075927596;
        Thu, 20 Feb 2025 10:25:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFckRaUzuorR6iq3G8vZw77O9EGpXw2kTJ9r8K+EpTbyO815b1qt4EuvJSSauA6JfdjTwccw==
X-Received: by 2002:a05:6a00:1946:b0:730:98ef:30b5 with SMTP id d2e1a72fcca58-73417248ca4mr5086286b3a.5.1740075927240;
        Thu, 20 Feb 2025 10:25:27 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7340f6357d5sm2453160b3a.165.2025.02.20.10.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:25:26 -0800 (PST)
Message-ID: <14f2dbb2-0f8c-4b07-9d9c-17688691a189@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 10:25:24 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] ASoC: SOF: Intel: hda-sdw-bpt: add helpers for
 SoundWire BPT DMA
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
        vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
        pierre-louis.bossart@linux.dev, bard.liao@intel.com
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
 <20250205084531.158763-12-yung-chuan.liao@linux.intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250205084531.158763-12-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6vlo69RnhVS2v7pB8Fx223MRMDzrj9rr
X-Proofpoint-GUID: 6vlo69RnhVS2v7pB8Fx223MRMDzrj9rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200127

On 2/5/25 00:45, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
...
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
> +MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
to avoid this warning.

