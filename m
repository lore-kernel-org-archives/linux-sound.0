Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA735E1BC
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729932; cv=none; b=QFScB6Lyas/qmh5Kl7aytJVrCX6g4FxIsXqHRogHOeQaI7+p82zJI+6Ecn2jzR6Qci/qOXJT6nfZhAkGCpIUHV2hzjJnTjaDsxpVtHowWpM6vUGPbgSq4N8uBxs/+p/WgL4WknDMijuBwKP8BYVerTNIc5yxhZZk9UIR5CrdtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729932; c=relaxed/simple;
	bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hQeKmM1PkLTQeCI/lms1s3ZlJU7x/tGvIGOTHXPtZjlhYZeHxuIF+5MAeukaToBFtGCebJCz4h57Vu0nDjw55VMYU6P5jEDxIV6l3lrZ6sDqiS+/6oTK1Fo8zXVzrP1/yTAa/+f5361Yyii99HK4a675DpLzlgljrjIRWYdJPog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBsYYn0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=befWHXya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBsYYn0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="befWHXya"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWORJ2029964
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=; b=QBsYYn0kVccuhlew
	PR/hFDKMjbZOZpxNuV/SsThksPzvnPiq09vBci9M7JKQOuq5O4RhTHRQDuq5MR0X
	wJgdBxZ+MCRyMhd6HGf36wV8vKgcEv5HoYlXC3ZrFxqs5X7dmLIhQwARfjnuIX8L
	F44DmSminONJbvOCij99Ik0J5znHXxaWPyWhYtBbF0aWhRpZ/lxRZ+KP5/jyVMAX
	L2075EzUWvalRzUwLdBQ09Kj99rwoPgpAnAh9Gjsyi8blHnMlYqKYY3nledOh2Sq
	xgWq7mtJH3jh6svE548COJMyx3lPxEWiPXliObltf0oec3/QdDHh4uhSKvgfBUp0
	8u4QTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83a08q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso266680195ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729930; x=1785334730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=befWHXyaDih8uH3PoYgnisEg/fnXHipcCKRC+XU8fzPzMrVmV9Di1adyhogWq5CZWa
         mxMi3WuL/j3Cl+MuB8jzqIS6lF4DmdP0hGRasI+Dn+doWAOTqaESJQn48uLHVoD+mvAM
         jA3U41Zc3sT4UoDxNtSu25GCfxyiZ1xlzJkPvKDgNDVK3124pN6kvII/murpcuj3TTqf
         Vj33R9rC7dgiUlX6MRWhVrptPsS8OxaPtKMMdVFerUoFYWFvmHdBA+O7eyRO+mHz9bM2
         9GGsQTyY75IKBk/SACFFQ7+pCqyD0BOTHIi5ZmxXIfJMQm2OH+RUfe+qfNSPcmTlDbMX
         pdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729930; x=1785334730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=paITXzgK+l7UNM3E2rvbpn4AmOUMP/EKQtqUVLG/A5YCRTOwEQYzw06HJ4Gnnv+GDP
         S9s/TW1viHNcOHkkq9/KMshJVedA6eCLuX4YFmNqumGvWOb8J43Lm+BQqistBhmDuxOa
         oPbAhqloAHOLFOT7z5u/pKk/YRepsZcrEgnYoaBJu7lgCXh5jkH9ufzf1kS0E06hnBzW
         ZvrNb0yUUFzAChonP2hNpWGPXbr9l49rEQtS7yXeSj7e5RWbIH041rRtrqsYnkgPTB8v
         577+u/XffpoWJXXogW6eguFPTm3D3LrXm/+IbEHnGgR6IQ6MQt8EtAX/PBe9QQpjMFND
         56lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5wDF6xOwkDgU4Bdi9IF8Vd5AxavCy3QPiYomltnzOqoCXyUGKmL22hBYO1EwKpmZlC/ch2S7cUZi6tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61STieMpqeY+rqqK2ov0+rpua9sdfNuoYu7sND6kZPRANEoLz
	VNgcokeNArPXs8pf9pxnHUgeOVSoWtcJnulmw3ILkHYAZ8TXCuF3yov0SGTXJRwFKQBy2XGYWsk
	viGYCeaPIGZ8LzlfgwGVsmaWe+Uc1JMshCcDFgj/DTVM6cNy9fS0dH8sIhm6HmDUNkIOrwrAxxQ
	==
X-Gm-Gg: AR+sD13cTpEo6jXf2uNiXXzQXTz/e9dGoTUwZcvdTooOzJBa+iiMfa5k5TrEYMcmfg7
	9homjO4GHNyJAkpZBAU7/zF/D4gUvTCX91rMOf73FaJsSHud2PZimmSpMBle5bK2kU90DPsafI2
	vFivbT4bGaLdGFS6vBdZQE7PPdEtVBoJpquczXqNX6dCUE+Mrki4zNZ+kpownqQjGC3YDMZRS3/
	d6ec2UQVj0uzJvWHjRkoW89npmPKkgvzlfqs5dcVZhAXWAbtI0X1GhpP+EMihfZJi74pRT5RorJ
	2jOcpeITx+ThlykgCeDdAm/kSI38n5CMojDTSF7TgcWbVQSJq+28iGWJ4pNDibS9khhuooGNe9W
	e0tpV8QaIEyjTflvsyA==
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139885637.15.1784729929812;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139833637.15.1784729929226;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081978sm8899001eec.24.2026.07.22.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:48 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ASoC: Add LPASS VA CSR heartbeat pulse clock
Date: Wed, 22 Jul 2026 19:48:40 +0530
Message-Id: <20260722141840.596101-3-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-outgoing-bold-tanuki-d4db9e@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-3-ae200627ad62@oss.qualcomm.com> <20260717-outgoing-bold-tanuki-d4db9e@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -p_x7-xEP2vWc1mdFUg9SzbzxF7Rn8qX
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60d14a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4euMmpHkiu_tE4R6rnMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -p_x7-xEP2vWc1mdFUg9SzbzxF7Rn8qX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX/vJFn4U17fnY
 P5J7HtztvjuC1YEOQtE4GfApNcRn31iucrTD6rh07ci0p/ewDT7XMPpTivpUrYJTzthAeW2rcLk
 GwkfgT06Zez3Cf6y55a6Op5d7+QLYR+v7BP6BPabRUOOv74+q45rqIHD90kNmwJgxOsMIqguPSN
 33TJ8q43FI1SJo/RfJWlOyZPM0EgRkMqb5hauki2/OpsJB9doILqGz/RI6IFrFUtaXPIcmpMVo0
 IPkYfAfkGe6dK3gRBkUMQeijZqBKbW1q1qVl4oOTgOdcbOx5IeMjvhNYdkVxCF4SqTyLu8Wb1kN
 J4KsJxxIDlD/agVECE9CeVFkLpeyn+LWqWg6qJbQ7xKbl145OoLEKRMp5bGmjZymcJPuOI+7dBF
 d9wOiqjHCcn6OwXGfTwdNm+r6EmJ8K8BDxDhA3KR+hfE/Zj7cP66wHpT4VeiNuhg5DGqjq6QUOX
 U0+QmI0bff2TpQr/idA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX/6Z+QtPqfm1B
 +rVu2EuWyBOhgGcVtblno3V4773Fq5qYcOXZZfnqdAK5+9GDtZbmMwUDcgx9ChGt2gY3NdZ9BPV
 vei9TkZJGB8UKY94+7X+vGng+wsKWDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:02:41AM +0200, Krzysztof Kozlowski wrote:
> Why a clock provider driver, which has nothing to do with ASoC and uses
> nothing from the ASoC, is placed in ASoC directory?
> No, this is really wrong interpretation of Linux subsystems.

Ack, Will Move to drivers/clk/qcom as suggest.

Thanks,
Sarath
