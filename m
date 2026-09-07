Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033954EA394
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792352; cv=pass; b=S3LQRm3Y2B4NlZvNqZGU7EiYnSvU4rs/Dyn8atAsKheCabOZBng1YxFqtLoT+XyQb9tK1OnfbXLHPxGoce6TOF2F0pIj9oCGz/U65rjdSb5/pyUwMyE1w7gR27lNo36qRdmu6r/hwXBtHAvMK8/Gjjskfx3s75+VGMEkwULfINk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792352; c=relaxed/simple;
	bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZb9FShpE8ZKqmqjY+x6TFRJMkAuvIMXCpGuy/hM+e3sJza5BFF3gASPjYhPakIvX/4dK3tgsacT2wUfAvMU80Yb8b41+MUCaBzUxBiX76u8TqTTIlKgYX8z4htbyC+qxvexIkfyfPv7uZqAJzgFYpvLc045T9x3V1eMufxGThk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsCmWEf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YM65IR9D; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsCmWEf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YM65IR9D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DeGnT3606994
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 14:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4KaEx79l/Qo9EXLcB4JmwpQu
	z9/m4i42cFxTh0FVROg=; b=HsCmWEf4i7abXHZFCxX36UJ/9JBW+WwyXSLb/io4
	h6c3l0meFY4K2wrqAPYwPDPhN0liIYKcNmOIacP64rf0ANUhS8t/RGECdChJkO/f
	E1lR9F5KZ3anF9NnpI1PbFk00h25NRbBu3KZTXIKZviecOxgLcFrNryH7X/QY3X4
	QN15qgqVLNttQIjclPIyjVyA2hXMv882k4GG9Tb2kr4VaTdk0K3zQvE4yj2cLKCX
	hkqFT6NfIbbDP/8Dq1V7DI5lVb/kOVLU69oTr5RRxzqpOUd7CXfpPR9HeYGcUhcD
	J03VdSEIX3y+UdzFXHcSlzwGdq575M4hfwBJ4LPdu05Q8g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxku5ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 14:45:49 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f92d36b8bso3862558d50.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788792349; cv=none;
        d=google.com; s=arc-20260327;
        b=Wbu/Bd0/Uy0EywbypvbjWgd95ipmvIffYeSllzdKRv0CfAPMtSCtLAq3daX+5+cWqc
         7Rcp3/bnq6uGy6jbl7gJiTxVaNihvyZrGQ68S4jC+4/t1PlnVeYH6t/FuvR/bbtcZ43s
         dBF3xSQpdUgMooOp0pwh4WYLYP9sjWJ4GVZwfIkgVNafHCb92BKHGSP3TgAKBKor5aNH
         +ZQX2BP/hEUtA73xX+jP7CRpZGIW7yibeZkFeZKRYjHdaC68ClH9VX/waHg5lHZxh5PD
         dE33HmtwPM2DEsfQPTGxpKPoRRcyj/BCSvlDxKHnixzNVEDrH9oDQk55A/aP7iXXRtDZ
         cb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        fh=i6KYJXvQ8h1iI1YZ/khZ9B/+3KEXXeDUIn8P/0+5b5E=;
        b=YW3pCRyXRjS/EanofFoaTVprDA1ggl4zEZHAnCNZ/RbSt/iXtwi4ZKKD8Hgmy+D4My
         Zmzba+SqWyq3IG/O59eEcarPPFRt/u8NVwTFYWOThz8f3FNZVCE6Yf/Orzz5pv6z1bP0
         W7yaKfHVC71Q7jsNy/emOLKSEmooY66f0P32XUlnFTRB1t+oaGF4QIA46qxUwiOH2ms3
         diqI0KkpBKg3XKUijYeOaTa2u6A8WP0+nPipWi/PN9ynkZwcRmEj6Qs6oK6zBE2u4RcL
         vtkkiTci5jDL8tyz2nxQiI1bhDFv4NH7MENkFcnKbdh6IMGpBbrCjbUcXocMYRqLIATs
         7ypQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788792349; x=1789397149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=YM65IR9D76itaEsSkDc6MtnO8OBf+KAtWCWSU9V6cDeKz3JerNEqK+oqWLyv3lmPLx
         wEQR9upS1/g/rU8SJ60RPt59r5/1GqAsiETS8KrumhZYHFhi5VFIro8J6/5Vx9WvsPHl
         BsamgCCbPWAQU7gJwjR3jYHeB3ZdCAv3SqKETAQUeY5eTVXM5zgeArPKYUqwhDcBdEHR
         rqMDcM+oqEF0dxlPCKEmg2g0sJrytgRsPXBQsG/mY8upuuFgjYvRECmjoECUkk6aBOvL
         2vA/LsCOKRk33dKMuK3/NJa3VAraooVvuGJcPegF+hXfMEdNkYEjTt3Aeq3/bF75pqKY
         WQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792349; x=1789397149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=joZ1s1tKJXbCt+xcI2MFMSBLQUCB/FI3r94ZwQeVy4QoC782uqVAWDK/Bx2toYbIqr
         VXNw76E0Ytpgp7/X/ziAapxW1UGZJHFnK26q1+aeE+ZcV1RgutKhzYk72jBRybGmLVsZ
         Ggxc0NBVNZqJoFNvY7g+efmeoltgx1aerCDsV4yBzQN25lTuNVUQDtSSSAd2I4QIoKkr
         T/MLg78qrDCZykeEWX1qIBoOOAYPO7hJ70eWNrWk/B10mHQ7KyJaOb6n0JecnRuxJ2bL
         IcY1SbJW8sWfzElqYiSTu/Cf74CaCnhShzSHH80Hi1O1X/2opKl5NwcfYpq2JF34+/8b
         dHKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcSRYo2N+Tbo2jniKBbJ3xPFw1xKEs6ZB8Qhu24ejPtLPlkx5//Bq4OQoMWSs4zQIIQf2qZEiGwn87qA==@vger.kernel.org
X-Gm-Message-State: AFuF++lzii5B4IbxWznDDERRKY+L/XUm8YlRwctnJuMbDbq2gjU/eeyp
	AV3v/4dFkvDz8b1oC1h/ndPHfGL5K5AKZnaWhqymP9pzb8x40ND118YCX3V1sPxGTv3qc8HuZmW
	P/MzM3bQPDEdfWpVeMpw6mbD1IYsdmPVWM+0b9EQjxPT7ZjmOinInZSqMjvc1x/M9d11tUoXyrp
	Tadrf31Wl5hcELWZBnh5DeZBb/aNPCvP1sUD4i0fz8
X-Gm-Gg: AYBFou1LDhyxP5nnsGr9n67QiMRVW0d9Le1pJSVeWTWmpF4LWRU2HkgYzGe2bKY8eNK
	6Us2eiHX7YrLB12zMWWkbKVxvh8iNttsNuGneN5KyUqv44ppBzMxG4xwiLCvj7/5ddE+PyEtktq
	dTjb0/tMyPJRldKbZqdNS1ErxsXanwwss2A35EZwi3f7XVXoYmwQheK/nU1w==
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id 956f58d0204a3-66fbc1754c3mr3690292d50.30.1788792349387;
        Mon, 07 Sep 2026 07:45:49 -0700 (PDT)
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id
 956f58d0204a3-66fbc1754c3mr3690226d50.30.1788792348076; Mon, 07 Sep 2026
 07:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
 <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
In-Reply-To: <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 20:15:36 +0530
X-Gm-Features: AcwNN1X7F4Saf6Z-HB7nxKe8O53d3EFKPM70E0Ja_RmgPGm_qltV-8Gse5aESAI
Message-ID: <CAC-tS8BY_th+qa2DogXSZofkX8KaPJfL6iphX5_TX37NXMA5AA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfX9CwYXikUbjLd
 Hudt50zGVIgLNSJXSTuybIVXWmtPV34f5zv8VZM3dNqcAUKvj3srOmB1rByihC0FP1tRNVuz9OT
 5KfbTXGp6OTSO7hJVWs2Jvk6dCIwwImsxG+Nza6ZCOwmKUJH6u7LzI6oqQYA1uYbxJkb92oOqLc
 IlglPFhMxozWMm2WvWxVwoN2UWYnvkxpzuf3cbDvYfCR/gp+c7ig1wpmNBSRnp4lDwsgsfy3Cnz
 deU6esm2lXsiFRwPQ8Y/Sej9NviPR6eKzaTRtKiid/eXdoXm61mhZ5vyz8uzPhm+VKOL2hgrQj7
 i+8Uaf3NsE0Re8bf7sM/1fsen6heEdO+LZTrjOOodqEaNUz+3gmDH6dr6HIGeHaKRyvb0c1GphE
 T81V4LO7n5Wwb7fMsHoJmDPqmjeiQ4qVNYy65VEL7mf2lluArwhj6V8PnN6E2YFKH3/QLFosWqT
 4LMtdHN3prLkLr8ulYg==
X-Proofpoint-GUID: K0OnWpTbWQ0dCe0jaZElGsgOmZepusiC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfX0TRtOPCRpWcj
 rQPUE1j/8IBo6H4jj52UvFJxB2kJNbGf41/lIycwill9NHanjhzdofoja1bc7ynaXgPGuckSqWs
 y9nxtYq7JAIeiDmsMVcxb44/Va9baNQ=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ece1d cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=emP4cCs2JGfxw6IAegoA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: K0OnWpTbWQ0dCe0jaZElGsgOmZepusiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070163

> > the binding intentionally allows subsets for future SoCs or board
> > configurations where not all interfaces are wired up.
>
> If the board does not need to enable them, then driver should simply not
> do that. The clocks are still there, so the clocks are required.
>
Understood. I have already raised version 5 using b4, Kindly review
version 5. I will address this comment in the next version along with
other comments.
-Harendra
