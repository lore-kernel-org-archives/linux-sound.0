Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CA35AC05
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729927; cv=none; b=CX+oiCi3sL12zdSmDWIkoMsutR3o6KcQzxfJh1fvRKPhO0R63wM0amjEHExaSBCnppulWMv/XAsEZbveU8QnKQlTUZ93S8rXZKVJOR8HWiQPgzYMgt0z3i3vgZvVJngPYam2ls/4fSUJ9cUtbHuD/ZgZzYgyariJpBmhVx4pEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729927; c=relaxed/simple;
	bh=uMAoAmVmA75k4uja9IthJA6zpWfioazFl9+7uS90M9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpVc34ubkorJjjXfZLQsZEYTHfRQnCUd3kfBcrskUxGrg7rHw1ITm/3Cv3RUDoPTpGtLv4wNQs9DmJjC5QNoWvHhrJm6FiGCsP/ApnIxv+pxbq2Y9iK6Dp8k1d61EyOKpWPbe+t3V2dkrRQdCM1HpqqsI9HxUw/ReUVV1sMWJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or2/ckZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS6SynXA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or2/ckZ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS6SynXA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWXnt1027199
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=; b=or2/ckZ+qSLsojk7
	CfhlUJVCNesJDD2GUsadEhs2qIBxRBwLoTnbwMK/GTjihjopeael0Kn/JAL7ND4H
	STy7WZmLYbyRbWJraci8TSUg5mN2ufdtlmJ5DesXqLDAATZANMdkQBA0EKJ+SF2/
	+P1piz/Jmg5O0/eNJq8BPU4S1cZQESsDaqNdewzUBeG7Sxw4cqyc/j5okmszhp4b
	FmvgttjbInbobyskP42AwY3n7zUchAXptXl1yrDriCoionA0K0dKkbtSI/MYELEU
	OrCn/6SH7ogv1dQaPwehnznjvdfdo8Vg0J4FPcQURCL6hM838kCR4AZpvXAx+4xP
	so6wBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799eer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so22600618a91.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729924; x=1785334724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=NS6SynXAjlLeO9zFLC6F3DeqXNRpJqc8VaKLk+r+XpQexmec3HjI6DYGEGW30R6+Nk
         VE1CSBEzpH9UywxPFVzPCLfvRXIS4BTQlBSuRHwg7Cg71Nqvh3HwUtumCSotE2jSUnIQ
         XGkSSPz7CscfRDDUfE8tTR73gTNz2wafmklDtEgki7edqNGCjnQZuSWispXtivLZzm9L
         BOON7mbHwaUKQ0+TGwi7DYXDTU05z2dYx146Fo24t2y+QT9nBAW0Stoq6DQwfDbvyXxL
         PDDmsnj62wUb5Fwg+22ULqau9xfpRZcX0nE0qJrugkhpx/M0+yFC4b972JQZSNqw3QKb
         E+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729924; x=1785334724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIxpvHHV8Rw0FjxpGQS93XkRykIayd9oYItU+O3kyQk=;
        b=dtWi1KXdExlxADTLktmxDiQfbe5AFj+5eVMSidZINP4U/BkXZyF164ExnrsW6VDGjn
         JWuSoTZnmcwgJZPp2FT5nTgn4OZ+lNtLrW5ZjCWP/HE8ZLMbObVdb+qtfoz3LCBz2JFv
         sHX1IXNAzpyqxVBoU2KZiFmc2bLnuP9g5nOjVxiGr47X5S/oDXH/Y3sT+2/Fa2fQnBOL
         5zm8R9WDaYwCqFp/jHF4jQKSrfTSrfw8ORPMKvme5V1iRbRIYiN/YcR5DQMhLQF+uQoe
         dcn31iUSyKEcUQbYz/+nG70NiZ9e2xn/5T2E8eFfOLa6OVGvV9338+9CNk8iRsuKtwoE
         AB1A==
X-Forwarded-Encrypted: i=1; AHgh+Rpp7MHaQDQQxgldE/rq8M9IaJU4DUEnAaAVf6Fo49JzEJ0ac7uWuRRPag5LxMf9N0V6TNoO5YBXnHo3lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGV1gyWha5WBXHbBiDwkJOapkar2DeF4Ba1furBSNHHpzE/iM
	PUhZRM0OH7Nke8zEJETD3x3KWf3Ul1iL8N9heyHIiy43cnF22yJYRB0orjn6sLKk+C4U4g+fXP3
	W0VBr+CFLKhmqb7+dRY5fdGbKPNPCnpEoVPby6Xh+Wjghh4ji9nVLBUqNZsNTzN0yH+VzZPTdAQ
	==
X-Gm-Gg: AR+sD12SFSoIxa2/C1YC3SMZIUtzIVbu4BVZesU30jQBuPGyhrLuKJkZsjtkZeXx7wH
	pibbNgH5Q5rG1aWfZf4djQhIHyHUujf9PcsUtPYU0mNSWVuOT6m7Wuzsth85tMZVVzgN2m3Dvot
	W8uWGd4eRBFiujJWhkHHf/+qqUEgUWCsMvEpCLPbFkmQ4r5IRCFR0n86opAczOohDh47unZv6M1
	eO8Gz6BNZRxYgb0yRCiZcRvk8jS5c1CptgrbgQY+dDogFyjsQEqLGny4yeBORH19cZUQMcwD06V
	kvocJbrdRjvGAy5wPqeKiZtFpqb++Ye0OIP5Jk2LfbYbMsfE6hpH3jC8gLwcLtrjmWYy1mF0ETt
	NwwCUn6fCC8vE+01IzQ==
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406619a91.40.1784729923535;
        Wed, 22 Jul 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38e4b5f2031mr23406565a91.40.1784729922900;
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm19256670eec.21.2026.07.22.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:42 -0700 (PDT)
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
Date: Wed, 22 Jul 2026 19:48:38 +0530
Message-Id: <20260722141840.596101-1-sarath.ganapathiraju@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d144 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fneZuzUJNEn-4h4bZk8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZblGH8fHmT6oGojhnYdyDEyNs-OOeR9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXy4e0d0lM8Ga9
 PFHRHQbr4GHzfkWDMlrCaRCGRSQFHHHHjGa6HezaA0z3n5S+dlli9nwkkBIpvm82YjmFouYrmz8
 gAJSVxd1cmhN0jis99YJZQpNz1jr5ARvq5m1dhGCCBt6ww5VD+BH+p3B3ysO4Tk7eTYviJLlSQn
 48IawGk9DvPTkv0ibperNLrTH5phebvW54ZaDnuyngHX+vBHF3xhd8/egpJRw6bajx8Qsy0K4H8
 MBFrdCROCx5jxqEfXM1okko9Jh6+LT2nS256J/eNXNiZ/MXPVtOqFooXnCfdBpbmcIWuHpymoed
 RO72oZveE4IiNmWPkQznlDRqEXWdvjnlHDvtb8mMUaqX/nb6uvLxxRo3KcRnpDSF33QftiGJdC5
 luhR6H5IgvjnH1aj0pcqbaNkr8BR0du5HSRfJAmMeF+WXavpONJidOFGUll5SPNHZXJDbuT7qgk
 64l5uB/q+5Txp7e4zHg==
X-Proofpoint-GUID: ZblGH8fHmT6oGojhnYdyDEyNs-OOeR9E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX+tgcVpTGp4cG
 oK8oANCBL1Mo0Jq5L5FC+3YVDnhtOfcfY1tKJvgAAYpf7eliZw7BLpBxUKlOyWoMoPl/hrU9tvv
 CIUKSZXLixS0MY15sQvgyAlH1hWlNgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
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
