Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5713A7F47
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560332; cv=pass; b=MPgxhTuxCA0J6itJ5f/vwpuCWBtAi4KNP+GmtwQeMLICAJ/xELmPhBaVMs/5INCZ+AEE14PhwZOmAeB8EImTfVpuzr3X3YfYkTECYGncfYiSb0hYkqKMGjhC6h29r+lwjua7z3/ZSnmI2yKehcQm2UQCcgMiVoTp8pwI81q3ROM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560332; c=relaxed/simple;
	bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJYOMuW2I8hRFeKa4K4FrF6kjNdcTuMfJtZxQ9SAa0hYQlvQiaZr+xWrOGbJwdElsa3beCwpXT34H7nTDCV5Qa69BN28tpIiIt0oOp5/lG2ugKNFEbWxIVNsGcdQNCprVN9neHwoV76S8ByzGQouV6xNNmP/WOvO1C/uU7ByhaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAJwJ2fH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch/dNEYv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAJwJ2fH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch/dNEYv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCsY3066900
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=; b=iAJwJ2fH561V9pOv
	E6dSfmmr1qGjTpqQqSRLdKecJ5SNx5MSh7DWN4t3qtgSvuP3EK4QDBvmWyY1P0IV
	6Leq34ru48UeDrSKGCi41bLjrtIiqVshbAU8ak5qACs0Qrbi8eNZjFb+sNaBExgs
	WJ2k7qYrEiEcAIG9hwKVE8TJIEKvX8mJ8aG6Pz1ko78xWuRJTUx2POUYobPhsz2D
	ZAhtIy/g4Y+xUg2ORsybLpEH8en9AgKTmg6WcXtyj13FL2M9aqTbQH//xDEExnDg
	CfcYc6KTNkNsEfwwFI8JwcS39uAdRJOoT26kutXWXQ+RtVD0iP/4wex3dVxVFuoH
	B7pN7w==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphpa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-821167f53cfso73261407b3.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 01:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787560329; cv=none;
        d=google.com; s=arc-20260327;
        b=IrDLpPc+APYWqzQwpl0il5cYXZbVWdvNE1cueyBtuHssA9o2/DuZDuQpWdsOYr36Nn
         NO5cuOFbPEz4D0lfaMNB695Ka7F4A+050sHJG998jzL35ACc4pUTVVAsEuuEMGYHcaMf
         TQwbnPjss2rjweifa7jbdrhdwYBC3UeYpFOavjIWbhH1zsPV4F2wk2JLaVK7qz7+gWMy
         Gm+0PUkj5u9edJrcYAQr2CJQuy2/+CYH7u9uP/uCRtKXH/hPwrNp/D/i5WdJs0EQ7Xp0
         WGwcGReUeRoF6uJotIqpAuWspovvco9ZploDVztrR1IlTQsirv+dMFk8amzrfls9ZePg
         hGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        fh=O4FTOR4dhoLZLLSEV+njPOQiGP4JzTpAiKEPY+5iB8I=;
        b=TPZxRiIY45teEKDIKsiWAZwxahpIcMa16gs+vsCszCn/z9jLEi+JTWouutalMv6Lz6
         qaHOnVOso5mIXEg78b8p46O8tBTjx72irQfe4vngbwDMKQKk1sqJWxqiyXRAMiFdjx08
         TSGnxf+P6R3Pzz7ciyiuBRXxcSNldu2Qm2SnTRXjzWdIvC5yMznSWaAwtnEJFgcK7S/L
         fa4YnTjpBZXI+8gpqNUzsSyEt0+tjrZFJHqOxZryJcUacRbR4K2kgtbydLTE022S3zI9
         rTef26c5NSc1BT5K2loEupQy3trJzc8FB0L63sQP1VqoDrY1GHtR9K0F65Rrs106NSix
         dIOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560329; x=1788165129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=ch/dNEYvQSSUQhqivtip8NZuorp8nMEc+ksy/ni9fwVnonyPEimzTQ36UVGiNpuV1T
         wUueNVocWb3YHV7ksk0NUIgMscqeXNzxMoyxhUMW86symiZLNbZaIzselibINbcIN974
         0tH19hKcmLF6FCyZE1m07WkPa8ItxQGTpllsYYr2/jN4qhZLmm7jG+g1aAuaXn1snWTB
         0qiivtluTKfFdp3xYa85jg+Zs18lNWTHZDxG2X7eYeaAk6/GdML+zducmO6KKVuN1drn
         d/sucb0gE1K+3tgKKdLkehphdd4cSCu7bUBd+JikKq2qkRv3KhhW55QBO8HduWJy8HEP
         hIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560329; x=1788165129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=X5qj05pKZP9gz8wwP67A5oSN8StLJB3HZh3AiZZYB8V/DoJoZF31s+8ex53jP5rDf+
         1Y01URNF6zYA/Lcp6ZwIPIQ7g+q1C9AdkJscYjLpqL4h9rHjNW8gIyDQN5pNtB/VWgyg
         dSvhXd7UQ7bmGV7hvTI4PBUKG3fq7A0VqteFjJw1f9pmptPsRMn/m9KzkcxVl62SxXOk
         XScfgXmMlIMhRMbot/7CAx65EjdDzbBF3+gnp1ZtPI9n4XUENgnKfpR83XwBklFxDROV
         +YrXt200NV5vT9iv0FwjQs4t9PSwhp1JdtcixxmKXeHGXFjL+qLSyeLxSZP+2fbhqDLe
         zBBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrbs2XgwTHqDnOMD1KcpL+sYbIaB+R4VOSGQNrkfLGQvC2Pl8upE297oq3lO+q9jFm9/EgBESromssBrg==@vger.kernel.org
X-Gm-Message-State: AFuF++nPDsGfQjcDxCWbpKfZkrNFnwk5Zwjb832z/+x4cDfFOS2k8bvg
	IV9yztCwj3/Nb6/NFpK0T4fdMQt3Q2vcIaH1MxAkU/+QX8STaF9Dp7/9roaL24RvD39i2toE+cm
	J+4nYB0CatFvv/aWIvoycHu49o0MH3HOP4OqkcGw8mH5LWk7sGBXwNmWVL9DEvZAbMROYS5iJ8T
	SX/R7kkre9avlZnVoaPiRpCYZhEfA7Xi91ky+opuuB
X-Gm-Gg: AR+sD13U5SS3m8EKhExnBlHm982K5K46RyGAMWwN+3UKXkH1/UKOmUvI9nINGX/IjDG
	lkB946JbAJNqdm5WB5frFp/jzqq97uQODQk2/fr8FWd/ha2gfduJorQtru6B97TlMEDVVGI/sJd
	tDUxU3YYAJCFA+QVHPI5cafx43ay+Jc10nlkN82eXUUdio/IaAVDRWr3KA9PM=
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id 00721157ae682-84c97c883fcmr68344087b3.14.1787560329245;
        Mon, 24 Aug 2026 01:32:09 -0700 (PDT)
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id
 00721157ae682-84c97c883fcmr68343627b3.14.1787560328615; Mon, 24 Aug 2026
 01:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com> <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
In-Reply-To: <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:01:56 +0530
X-Gm-Features: AcwNN1WlNs-6qzytO98tphr2YXd4fChtRhjYjtP6PBN0OwEa-gIZgJvnzverDeU
Message-ID: <CAC-tS8BRZk2EM_mP0aTMqv1uCdZ3haVbyhDZwTZR8abhA-SJRQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfXycxGAeazBkug
 2ZnLu1c2pg9bPur8T/GtXQy7Md7p/xUo/uKej2n+3I3O7OO61icIe4P47XqhIBAC+vUy1i2wJEd
 k5UlkaIyCykcPRSHsccxNQ6V32e9hA7mxw9q1K/EnbyevDgIS1TdxZLykSv04lyWCQUXyui6g0z
 y27ajenJD9/Tb4uhRDhJk+lmGq0O6RyHDLOvg0C643yYa+nXJmEx+T9P8Gu5rQobhDUttm/7NR/
 y2Ozyyv17rllICZlIWTsZ36YiAiQhnL3Z+hrN2tZSFp+gdfEEIS49GXAw6WDe5hCCVNEODEKovC
 LVStHJt7SwvEnqbk5lMbPCv9Swcvuq7mSt/rOnC81xksjx+eA+3PDCmdT0rjzZVyYmb4Np9aWej
 JZtMZ/DVTgQRkx/q/AjylOjeDrt0PM9Cn6HLr0qq4tSAALWjfTKskllt3G5Xp/lnLFCvG+1IqQS
 wTyZC71f0upnYWYHmEw==
X-Proofpoint-GUID: 3jWKd07sLztjvgCvEHCTXmHdQ3se-btr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfXxOs+N0G2ebsP
 +pk9CkscIhKoZF45JE3Yx59JhmAGSGRtiODtVy6SPPanmkYW95xpijd25DGaT4pXL9imflzK77J
 wJso/7tcUxrws+lNn0w1Cb/J001yOcc=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c018a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=bgQE8YJmYTX2oDi9gDgA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 3jWKd07sLztjvgCvEHCTXmHdQ3se-btr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240074

On Mon, Aug 24, 2026 at 1:52=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-08-24 12:06:27, Harendra Gautam wrote:
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>
> Commit message missing.

Looks like due to spacing, commit text was ignored. Will add in next
patch. below is the content of commit text
"Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.=
"
-Harendra
