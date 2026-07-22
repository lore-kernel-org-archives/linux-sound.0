Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B035AC05
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729899; cv=none; b=CxZwai5b4ZXchmRFHFJocWDtFdFBH6TVLPEvDhIwqYbUgVPrnG6flEmyAYjFxoRRDH03m7jvwvuxURT2ghK5SR+ieGbtdCIsQRZXQkn7eB6Ep5VujDD9S0iAeo2d2xiT4mzenZlhFotefGuDfLB0KfAikeK2tqvjvpoV2Ubk4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729899; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=geWSFxNuTDGtBTpm8UodVd40Sv9Dg2BLMKftUc1mEHkqXKJfD23IwKS7Mv0Hp0CsT5nXfEPFDh+FR2ec8hUogz04pxXCXKP9Hm7IrfgZipD1qBgUZxUrYMWS5KAHRcviM81NUdYNHwJiZIaNtIQ3a20CnuYoWSHylQlSsQe6qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iav+R81U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdiuM/5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iav+R81U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdiuM/5m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWvtY861329
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=iav+R81UnCP1OYhZ
	mxqeVxDuvefba52ZHzCQhbYd5Ju/zboK8KLJc8JYitIzTREvm5nAb9BYHTaue8on
	bxfEXkKXSc2VGnMZ39Z+JAfw8DCj1ps50oPg0sw9hj39fV1zw4YXipdey4QZPdk/
	vKcQUTabLsb2LVWcGuT67BqyL9+yt6hmodTMPxa6To6TMnaSUmZTJ523nlHGzHSM
	5Q+ya3TIeMDpflC6iELf9psSSqrNnjEC47eQZLLHxgsxqvJSavHUZrCcOLIYjFYQ
	8cGzQf5Zlw5hd+bE7lK0+/GcBg/Y9nORrfKDcuSjRkScLxU31qQO24m24kcIpsbu
	poD/aQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2jmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so6241903a12.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729896; x=1785334696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=DdiuM/5mOJ445FZT/megVWJcqSDBxtYaMYei/7h69m86PtHLEhoC9jRtHm77RRmxsh
         ZFtp7efeBfdOJR5L78+pIpb3puC97qtPsfQonN+VWI0VCTy9Ueoyrel6DG+JVOLKqQ9i
         Gjk+kktjJfhJFLrEeWnDhFx5exhKRfL/TTIopbkxVI7nK0/gFI65Ik9h987ik+I/JQ57
         osYT049Pmpq99VAS4eAlMWSLF30wjulxJKZq0OzFn4IVdVlc1i0s91cHiqqlHZhhV9sY
         rwScn3Ur/9FU9cPK2peKbxm3IMk724acAZoC6zRtJFonDfx0WkAW53sBU/3biIov6JKB
         mf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729896; x=1785334696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=c/ZfCWfPWS+IPSbAsgOziyXfD1LG9c0wV+tdpf2IyuB8tWxpC21a8gev/k394lPaWa
         kZ/UMJXnvRaP6tbpjJY0TU6CPaaZROVoxbdoK6O6S308kV9B8njmNvf68dDG3lYoFzob
         ls6zEROFvVeu5408THmfupORYuX9ZyHkfUNAX2Zq16J+6iuFSSOlZ++SoZT9DtRIDfFP
         DfCnYBuc6/kEllVY1MhFIbEsfwuBC2yCsJtnIuaaVetv0NsZbb2RLQSlQjRDATaekKex
         Fi9pB0gRzrdT5IPbaDrBnYZKdc8SOfA+BMaOOJJefk790jOu2nFqpaUPmJo9jsSU60bT
         BLww==
X-Forwarded-Encrypted: i=1; AHgh+RoR78A3nakEVt9MiefCK6oU5QheCm8SSJ+hd2b1k4vJIaKHS8ouvttoFh6UfcqL4/FXNEe0w5LXEmawmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6g7xbULMn1KOotLBo0uOzjUAkifOhIHNa94PSt4z363mUSbMh
	wyYEng1LuroZzHVy0T1nqeS2Tab0NCCNavR+6Jr4VQWyfsRngSVe9qudwKS3XNjyaQIt8zOcFEh
	DGyHmFUea03EUO9wWiwMb9CJ5gIynaNfK4nbAfptOq7fJc//8MyjJVArkNvuMN1VenA==
X-Gm-Gg: AR+sD12qbo1YXc2LDQjdgefJN8XQuEQU9YY/w3WxtEFtaDtAiMzwOsUz77b+VBRUO8g
	/cJZw0pvCcn+YU3NYS+rbFgOl4qo/Ync+jfg+BsYUG9pKSW6/pb0OeqW+1VCETsn91azzY3iba0
	JNnkL+OoxP9pnaZb9Psg2ZTjj67RM6A0F0bZl/1d1z/PIohCJ7KuHRK7xHiDZD+XwcjPJ+M9yik
	CZgrn+uPMx5IyomH/i6PtL1cUoBny167LxzAXiZyLabtvhXqQWFwvJXvHhjlluVMFqtDAKwCltH
	/fgrvPbXLXvzy3XX5W/cFzVeJF8KuMNkDnamfU77150CB89AAlYMdmB0CIXjrC8NdokRsVGUd9P
	mqyIyP7OT3A3+vW+56w==
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477529637.24.1784729896134;
        Wed, 22 Jul 2026 07:18:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c3ad62f4f1mr26477491637.24.1784729895667;
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm9953369eec.7.2026.07.22.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:15 -0700 (PDT)
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
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock
Date: Wed, 22 Jul 2026 19:48:10 +0530
Message-Id: <20260722141812.596004-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com> <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60d129 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gKnB62MZOYkCKSGL_1NjLFuT6ZSMls_j
X-Proofpoint-ORIG-GUID: gKnB62MZOYkCKSGL_1NjLFuT6ZSMls_j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX8G0r7U4LbJap
 dLStqH9WThCcxNvaHOisfAXFt30ttkHegLeElQweZNjAkp+24wjz3WKR+9o0YqC5pRXyCFL3aRb
 IbhInK+TKFGUbxJ+qzqfBzkRi//7rmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXxDCtjDJm3qsR
 Q+Ygxrx7d/OFTIxShVwyR39lfB1vFLdEVJD984UtipxGUe+uzlmGJxxUr7wJd9lGS6/+7H7cPzw
 p68fe+RKDoJaguj+ATQKaOEWnxKgqIoYVAfth4aklSyUjo7Iz85fuV4cgvNVtGc7w7K0u8cmFK1
 GQrH8DQWYMniFU7yk9NdJ15AiWOForDPiEMdW4EyE0ieZb45o/PZzTE347jzzQzSxV2Ko3BAvkj
 Xs4LKrCLB/fOAz4VD3O04t5XJMjKBF/thGgIow9/cJbOWhYji+4y/O+vroCe4Mzt9Btgw9Gqevd
 oOErXYm9PVcKcMui0oWxxXJsOGcmGE5VVHJ5+AaxU3grjidZ2Yl2OH8HXwS0vmZUxgE6mQc1aXT
 EQAXrQ5vGGh4kxNHl3kbqoUWRPQejQAiWZzCNpNzV6Ggz7G1VGqTYlhUBgZxmFeXx1OxHjlTDoL
 47ySaGLfYwns9inQP7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:00:25AM +0200, Krzysztof Kozlowski wrote:
> I do not understand why a clock controller is part of sound. This makes
> little sense and desription does not help me.

Ack, will update in next revision.

> Drop last syntax, explain the hardware, not duplicate schema as text.

Ack, will update in next revision.

> Drop description, redundant. Why would not device MMIO address range
> cover full block?

Ack, will update in next revision.

> Drop description. Not even accurate. Consumers reference it however they
> wish and it is not any business of the provider.

Ack, will update in next revision.

> And this...  [unevaluatedProperties: false]

Ack, will update in next revision.

> Node names should be generic.

Ack, will update in next revision.

Thanks,
Sarath
