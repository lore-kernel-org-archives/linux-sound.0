Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C601A262D
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537622; cv=pass; b=pcao34qoP3asT/xVsh70P/xXizlPYzH4Qv2kyd1zBinOoDRvgaAO/DN+YzQ/ee+AffDK0/1cKdVdr4fg7za2uJmP1djBLvGL3suNzb8aa8OluiG2LHqdmfAELGkiKAKyb10SDoM5FP4BmLtsJt7hN0nY63eHjVM9omg8bexBE5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537622; c=relaxed/simple;
	bh=JazKb1s22fdMLXLs1H1wbAz3+xYEpc8IfYlazIB3pV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFuhp8MfM01ajgB1DFvoSR9Z539phKRcHczIrkHiGfn2dED33EvAswy6JYOVJ2C9ZnZ81pKdOqyLuWAT3Q++4jE1PGapsaa4aPXCPTI5Uy26qwXsM1jEx6VRSOWcjpB5tFcUXw2PAixoMsp4zbFtaS4yw7hqhBHaPGogDR2WmJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUN2dO8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtJNrubo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUN2dO8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtJNrubo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R3wqgQ008582
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=; b=CUN2dO8UKvOkbLKq
	QNoEuJQnmdY+wm7J2fvcei1yniWa04MtU4lxg6+2KJ9BrzUZ19bIG8ba/RyZh0Xw
	Kf39PTr7/AEj+CtK0YcVhjVBKuDwKd5KSs+3L67hssSTOwjV6A1HIrt8OI+Ny+G4
	PtK1pgRGxipU1e16BIgV3esM66fFIbTKuHdeaSKDp8AJochexfpEY06fR++6bXxW
	gNXMHQVgU19BYH8G3W4UUn8TML0YZyMYE08/I+xWQX+hyR1Ttd7P1CCkR08H7nRI
	gNCvlIMa4nDFi12dg9Dt39Oq2pJz3l3t6dllfm+pannAutgGKFLLUWtsoYlZHGan
	wUnnTQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734846b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 05:20:20 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80c2f05f24bso21628537b3.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 22:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782537619; cv=none;
        d=google.com; s=arc-20260327;
        b=HhuHFdrk98Hejr2eHTQeVHhJK+M3gLbJVTSmbx+9W7OQLkGhrUdSSFwWJsKfiqY/8P
         tFAYdJ1SRVKsZzPi/VPMGeaRldfNTdapqg98H5DOV64zn912PryBFmN46Ddpa3+YPDQa
         5pKCZ3YjDHb23vn8pnroM12pLrkRvCGLSwidjuS1JMgqoVz4JvdoEb+svENJf9pis4pD
         6GDnnwG69n/jhyEFPyw3yr6vcD2L7o0O92FBg8hwqn14EQv2bedId8NYwzlaYkJsODOg
         Ivdoz8+58doyZqScTtHch8WKNnyy8OR4O55EVqN+EZxc9nYykfri1kOz0cXw4NIhSQxe
         F1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        fh=7t/P23yHStLhpvDSkzk/gSpIRXEds40RLSPmKoxITeo=;
        b=K6o+inMRpLmNHcRxFx1j1vPPXYMA59saBSyIu4so/rfO/oCFn8yTauIhlM6/sEQANF
         mgCjyapey8cpmFqiuTbFx3dBYICSYO8xL1SbULogTa23WyroyouqU5LJDkMJto3nhJ59
         cKVWkTiye0wxxqvx7K0qBcxG1c9VstbEg2bBHOct3HXXT8KAlW/trfzqzQYFNJG6ybAC
         vZs54m5y88UiXA/P/mNZURU4USMa/7o53rP3uiVcY7ypEAy743ltdVOxQchGdhi/whdb
         r9pBnwaJ1Kk3JXA9Gtp3umyaz8vVfhu8M5Ti7ktatkc2zlo3pZZ8PEipi1tUwmOlxxYk
         jYOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782537619; x=1783142419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=FtJNrubohWxtbJLGKWeB6JNr+RjlPBD8NJuJ/1NPC5b0yn/W+A0/uMxHygeiMmz6O1
         ynhS+wlWSVhdNwluqrG9fMpjp+kVxqCsM/ElKlsFbgFvZG6SWi3ZpC6eZzFlzdf43VB8
         bx8zwGUn4Ch+uzDj62I2A3SwBvUfDg4sU1K1BnMWQYbbMz8foEwpXjs5zl3Sf99SHQ9h
         7nQnqUKCuA6kBQTLBF3HZRWDdL2jcpdoY6eJECxTc/dvvHKmQDcD0qMDWZYd/bV8//RZ
         gahSs2LZ8z1wuW1Xg5sjQpcEtjPXf5Bvagw42atfZUmOTQ6XEcDv0VgC/9UTtMWL3xbJ
         nnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537619; x=1783142419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdGyk5vANDVKEdD2SQN4LRHwUsLGHTmniZK2ZFoCodU=;
        b=eucwxHwxoFcIcFpxkmXVWpDJCZIhugnayPba1i4WykId1RjYehBLQ3wGHLZpgWeWU4
         aIqRhxZjTYXi3m0JULXRgVaplWRPS1Ur/9wglh13mwu1cQjqvKwwquhRtue/mfa5/xrU
         6AJt3CtovY/jBq9e/H7bwHD8+fZgJF504wTW18SmQvm5Kxulj3YtPYRAS7GUR8IAM7or
         MezxY7pB3PPjb0sbsro8bDzdgw/9fYXcbMQ/PBfoY9p2Ue6vY1fCBcokMYHTUGxM6pS9
         Svgcqnmmr691dOnOIsA9X4NZdnZLjWRfHTg8T9AZxyVn9SiaSm8U7Eo8pgxb76rtxgSm
         z7sA==
X-Forwarded-Encrypted: i=1; AHgh+RpExPIPCSD7NEGpVfAuTwsYp6/JyTbAhfsv2d2+dVAxoO7YpeoOrIyb9KJJTfIMmJJ3pRXuUKpJC9z9lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmYxdILt/ZqOJXq4sLCHFjGXVKBguI6sSsyBMhc1e7Qz+wTbj
	VZ6Nf1MeavJi0X0/3rDjj9RLOjF9JyHcnGwt5oxEKfCjaXomID/7a3VCLqluuLBxbNzeEzan2u9
	6Xrpi6jE5p1lM9sdO/IDAAuUNXrSLJWAuqLt6Ec4oh8PPadN21UfLum8hbZY2uzkxZiX2sshLYs
	Xj5Lh3J9gFxwx4DfShoFDmT+b+O7bTHH2oFMGzRL6s
X-Gm-Gg: AfdE7cmAZQh9gp0gY7o6K1G80QP8WRWrs2ntjPJEMsX5x8mDN6ZzY8NqPEN2UsQ42gE
	qIICRYGf4Elaqage3Vk/X5Hffns6LmXhYXBh179FngeVlpB6lj4O3zQhnq5rffmxqujjNmNacKn
	WysqI7p22RaAGwqms4fP1qxDei+hzvpW6PMapFJgWdhk1YW0ZI4NbOWA9qPg0PSiT6t/B5
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id 00721157ae682-80a686ea671mr98741437b3.13.1782537619519;
        Fri, 26 Jun 2026 22:20:19 -0700 (PDT)
X-Received: by 2002:a05:690c:9b12:b0:808:f9bb:3848 with SMTP id
 00721157ae682-80a686ea671mr98741307b3.13.1782537619163; Fri, 26 Jun 2026
 22:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com> <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com> <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
 <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
In-Reply-To: <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 10:50:07 +0530
X-Gm-Features: AVVi8CfSGk4Ur6-NpU9JcWCxqSlaeNXgt_0c45dTtL9eqUNe3YnnYSnTGt5mpbo
Message-ID: <CAC-tS8B0+w2EOp4nMOq=egP_rLHtdNQx_SbjyMi+N+2axTrO0A@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: K1EoJUB4ZY1s_Ytvudm82z1boerGz-4U
X-Proofpoint-ORIG-GUID: K1EoJUB4ZY1s_Ytvudm82z1boerGz-4U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfX58qy8c8tCxVE
 PvTKa1BdTCdsbx5FajWu0vr3C8gPo5bDqNG+dWBoyp+/AMLjtOn8sYGXHkIHHoOpVwQoDLIcWoO
 VTNDsCHG5lGLn7aiMdrwEZDXfVGQS80=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a3f5d94 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ic5Di-vIGvb2KEz3KMEA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA0MyBTYWx0ZWRfXxwWVpnoxIHQR
 j40nhpBRhztKgYHMRf1Wl2llaEJ/Ac/w1rtPOMZbZ+8tSLpxTfPXH8Zr7ZV46RDwzk5l6M5NlXv
 KJDbKoadKcFeWJ4G8UiT9NK6z22HoNwxvDQcrG4nebtcDWsem5cmuRaQiMaK7bU9wsIN1upZ0PS
 dz2JQmZYkezrWIp5BH8u8/CJyWjv4PzP/LCxpsGgSJ+vvEwQHG8rcvr1t0FZLHCR/TyKARSzdMj
 UuP+3FRfBfYu8urUGy+N0/JR5aUe70TLguCz0nh73VghjiU9vnT1k1qyrzJbqZLEIeY6Z2AeyHl
 X3/eajjmpSywYBwoy1qjX7RA+96+0I0M0q2ha9Q7qjPEQyuyk/qqiArJGPlld+pzJhOYpawHOf2
 6w1yEwX89QweDDe+4wNNVYuV7I5uUViZZZn9PVrkP2zEqf8OA78lbhbzJxvzy1WIkfhAHpwLIZh
 InR70+sXeRrrpDNDBzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270043

On Thu, Jun 25, 2026 at 5:41=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/24/26 8:59 AM, Harendra Gautam wrote:
> > On Tue, Jun 23, 2026 at 9:18=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/23/26 2:26 PM, Harendra Gautam wrote:
> >>> On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>>> +      qcom,qaif-aif-sync-mode:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (p=
ulse)
> >>>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) syn=
c.
> >>>>> +      qcom,qaif-aif-sync-src:
> >>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +        description:
> >>>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave m=
ode
> >>>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> >>>>
> >>>> Should these be boolean flags then?
> >>> It should not be, the intention is to define explicitly, for better
> >>> readability I can rename these flags as EXTERNAL/INTERNAL, Please
> >>> suggest.
> >>
> >> Are all 4 combinations of them being present/absent valid on shikra?
> >>
> >> Konrad
> > Sorry if I did not put details properly, I will be correcting in the
> > next patch. sync-src can be external clock or internal clock, where 0
> > means external and 1 means internal.
>
> What I meant to ask is whether all combinations of qcom,qaif-aif-sync-mod=
e
> and qcom,qaif-aif-sync-src being present/absent (set to 0/1) are actually
> valid and should be supported
>
> Konrad
Apologies, the correct sync-mode mapping is SHORT (0), ONE_SLOT (1),
and LONG (2) =E2=80=94 ONE_SLOT was missing and LONG was incorrectly assign=
ed
(1). This will be fixed in the next patch. Since sync-mode and
sync-src are independent controls, all combinations are valid and both
properties are retained as explicit uint32 fields for flexibility. On
Shikra, the validated combination is ONE_SLOT with INTERNAL sync
source.
-Harendra
