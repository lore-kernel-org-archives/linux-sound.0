Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAA3E173D
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552839; cv=pass; b=HogPpSaVtsOwWqGHVP2I5b916vZpE/HBmh0E+XZUMvJWlw4ZM1phphmr5GDefBqOs0WHKF8wdC55Bw8NF+ygiwRH3sDV4SQNZUhP02BWAmHv0oDd9oO3q95EA9P0K/foJHNOyLugwgWTHTBfaRkpCbgKnju36JidlBpteUn/vBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552839; c=relaxed/simple;
	bh=SIm4RSZUKrJB5nvKh8RCyJ6hLv0Z2V2NmQ/YE74MnLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2DivozbOw98o9EIJy1MJgBe5bpqj7YXtNUJdAhlunkQwwd5lC6A2fWs+CVQmZMu6Zw/+0ji6X7NFPUNUiLhXnSTCrpAzHvoL1OxqOwVuI5lPM/S5wMb8HlDLp/iNjMdZ8yPQGUimUDToV/5IwwABWF+GnqGXZ9a/I4z8Yml9V0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvOYRIIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nfw+WUF4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvOYRIIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nfw+WUF4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RKlP866815
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=; b=cvOYRIIL5TeL7uZ2
	3x8v4ZZUVR/pK5c8mUUaS78Kno2WULoCJ4hSvUlisvCoQwl/hgNH1jB+GBgIDnRQ
	4loT1E+CXJx1CYu77EYYTdNXbqiy/M6FETMe382xCL3u0PjRV5jf4KJx2Km+P646
	lEkPFvR74fiYG/pwSPYlEbe5vAWE0cWh4nnvV1QPhTMeDwSakSL79R7b8uNVxgcW
	SorsPt95Wlv7EEEZadUi+3e5IiUsy/Vz10bB185I37MSAAK5/nISN71vlvUjS1Yv
	BXqid1KbKspGeoH0WzPCMyxAyg59tqVF63K8UsubDet79AXvhK/WDOfu9S+8MG2/
	kAe2Lw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwm2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c7115a286so3967454d50.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 23:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552835; cv=none;
        d=google.com; s=arc-20260327;
        b=EBmLSWbUTQro+vbHDuddCcxOAFpia9ATELfx5K9rIo00G5zeK6dGwUXm581N8Az8xu
         S0X7NPIHnsK8Dykvaww2uz/3bIuB9fzIAHro131gcSBfaXBMncPEA+PtIaZQhJDeUMY/
         943BRpAWxRoj7yFp5aY4QI1L9TAaPPgCcw0nzIRUlu2m5gghbQiTr6AAiZMhylo2A3oU
         2n/F4o9/BmImro8UgG2VLWjUugdRtEAZyhoFsrr5X6oAHrqMwhj7UO9zXVO9QbBIPD8f
         u93yD0OSLiOdvZj1Jl13cb8sM5fu0kC3l1OdYch62d4Wqxj83oDGzmWy7YSj0VEQJcxn
         SL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        fh=EPMA5RbIBKVJTcTaW4C7fg79N0CGF5SUonP/yfov3OY=;
        b=oij40fRH/jZYrvVWYFFYWJzHjshHBtxi44ThbVI+vk5yhg1rKxfysxn8jlnxO27igW
         rtLzYPnG3dl/4OpKp62aGfVHeHCSfNSF/fpTLgBK5/Oe3RV9jc5p0/IrZBIfGYO1v+N+
         J/zNiDpd9FwP+OdfIUspRcu3sLo2Pu/eC9QQpg6FNn98x/DAxLPRvqLuh6ep6bo5qzP1
         gwwbu7OIz5e4PGKKvQx1jzlAOSfbcUd3py58gs0TFEEadVDTJKTY4889a6mEEuMoXhtf
         F+0+Wrevr+tsJ/LO5NCDfTecHw0mdlCLMnfQJ/92/IMWhW4yvB3AZFhbjMTJcFIRLHu5
         LhLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552835; x=1788157635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=Nfw+WUF4lXHOozfI5WKEEF4feDFMgTSmw8B+sKMdQ8iYdrqJoFoU8Kbk1WDWDyYrQF
         eEtuLD4vvuAFZYGZzDYKlolNbagDV5oo67Eu58PjEq/c76nfjuG7K0TI6A4muxk9LuKf
         MRT6jcXFnMduIS/R8uBg+Wk7p/a+x8+RhvBJsXDdTHWuUBOe0AAclHKtPwbimUSuESmL
         GGulQov+v10ZjwVIyWotqbGmlY+HiWvQ7tcfP/hVX52aShJS48qLnWAIb4FnuNorj6/H
         wlQOeB09MpK6ZdQs/YuWO0b+tyTs+6KVK84hLsqLjQ2whezIKOpRDnRh3Zae7wW3pZKc
         Uurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552835; x=1788157635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=kIBnxQmqzi/eYRZQeoyjo/cnDPGYu1q/CfM1yFq2nk5fL7JI1SnkE2VKMw+B90ZTUC
         yOkKyQncCDxNqE39azm4VloBwRCIqzlVopxGEM+UV2S4nXtIF/w5GfCWSRhbOyWjyCWY
         v/t1OsjYch68OPS9JCKfoXPSxl0eiZOgtWLbXN3j7DJE+jHC9lGzmYnQ5mkO2Mv/o+8u
         7B3bDTRH0u7+Ui2vA6pQg5fLGDL0fLiZ73ThuDenUCFaQbYtl6Qeh6ds0c32sBYF/IzQ
         wT3++IbZk4KzYxme6Ug6EsWhQiNRP00TIiSeSp5w1XcXp/gUiW/NivmTXjODfM3rvwOU
         7/Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ3n7eEDIAxCcK+iOoP6Yp3a1podIkDPxsrd6U+HySGoe18I7RW5OvRglcdvLNXGLfRWV09+O4ykSntA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpfIKyIkw9xJ7MA44wwdfgIRv258lh6S6xjsGZX8cbsA5ZhCuJ
	v8kLEBK19xoFliOnottG5pQQ8MwyKq5En6LOstqlN3ylIcXKqfNrIaRhbGL6BwZuaSyUWCseqqG
	aGbJh+A0JTNIb1jWiquZxlI/t5pefLylv9sR/e87R7dBCLK6QKgDTySnUy61h6WckxOd4C0jVan
	F/MC3+WnJ83do8Qq7o31actK3M58Ycg64mGuZB3+jm
X-Gm-Gg: AR+sD13Nx52kcE7nkRrUB2/ZgF1T54sAObOdQWedDGfojHxothwJheOlBj+kZ7e5al8
	d1tyd6N9aawwnE0RYi9zCsUr9WzuQrEYDX0ob+ukCM+bOaW3SWcmjJaydpFEtMDbcWsamJx+Um3
	ncw8/tQc7XnCMDaYFFzYi3NfLhMLUhBtRrR2s1pAAJW1BuaUS7rRAl0PSzfcI=
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id 956f58d0204a3-66ce9946b3dmr7444540d50.52.1787552834903;
        Sun, 23 Aug 2026 23:27:14 -0700 (PDT)
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id
 956f58d0204a3-66ce9946b3dmr7444523d50.52.1787552834533; Sun, 23 Aug 2026
 23:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
 <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com> <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
In-Reply-To: <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:57:01 +0530
X-Gm-Features: AcwNN1X2QbYM_Ej9zVogxycYXkXw60H3jSbidIvKHElg1_jCPW_I248pR6I4-hk
Message-ID: <CAC-tS8DsKDWzsnu310GwCabAzJ8mBGS8wO0TB3m-FajwcXDqvQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1prCE0e8lRQHchkdxIrUgLl_mRUtT8n-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXyQlbN8W8w+Nc
 No4uDTg7IOFzOojgAO0kJf+PVcZvFYXyTkmi0rleWCA4zp25dI4VJVuenTa/dh+UTM5GzTXRDny
 iMK49uoz0UbI48IPDFWZJ9+x80AoKGAmKZYeItlzLs9K/eAVQ4wC0kjbTtGTUA3vIBIW5TOYv4d
 xBPKimrterpfgb8VR//wGvIn7Cl7bpIzwn0brTRWnDsLyWVzip6pyT8tfbxhCNaqNjO7bs94Sa7
 qwq1/z5AwMxQV8FdqseUpcvQhGXwoqsl6eENex03RMkNkrFwIIpY3LajTARoxA12/iktkdriHJ+
 /6923cx/woqM4z911AjwTuM8cPNWlae1AiKcuqJG1IT3MJymrFW9NZUf8GmBr7X9IZs5y9mby+s
 UvfpyQDi9iJSZ7D7hhTOHnWGjCdhOCE01p1TSX54zQ5TAjMdvwZcajW0pkYjTwy9o8ZXrCmqGJA
 eMBP+LXw2e7cMuS8JTA==
X-Proofpoint-GUID: 1prCE0e8lRQHchkdxIrUgLl_mRUtT8n-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX+q91/eRCqrM+
 Au9MRgFRRlTLwQOtUT1ko7WR+JJ9SYs4tY58IsIm6V6subh7SpUcyyMfDXxTnIiousbUuIPQvrE
 P6z17O7IYYsiaWzIrA8In2FmwjiScHs=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8be443 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OOiOEqgzfLA5xCD0pTIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 01:04:23PM +0200, Konrad Dybcio wrote:
> > On 7/1/26 12:57 PM, Harendra Gautam wrote:
> > > Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) cont=
roller
> > > DAI IDs. This provides shared constants for devicetree sound-dai refe=
rences
> > > and QAIF aif-interface reg values instead of using raw numeric IDs.
> > >
> > > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > > controller used on the Shikra audio platform.
> > >
> > > QAIF moves PCM data between system memory and external serial audio
> > > interfaces through the AIF path, and between memory and the internal =
Bolero
> > > digital codec through the CIF path. The controller needs a binding so
> > > platform Devicetree files can describe its MMIO region, DMA IOMMU str=
eam,
> > > clocks, interrupt, DAI cells and per-interface AIF configuration.
> > >
> > > Describe the single register region, one EE interrupt, the required G=
CC
> > > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interfac=
e@N'
> > > child nodes used for static PCM, TDM or MI2S configuration.
> > >
> > > Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
> > >   support on Qualcomm Shikra SoC
> > >   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-=
7ee6b5f2d928@oss.qualcomm.com/
> >
> > This should most definitely not be part of the commit message (which
> > lands in git history..)
>
> And internal review (by tools and/or by people) would tell that, so no
> one ever reviewed this internally. Neither our internal tools did.
>
> Best regards,
> Krzysztof
>
Addressed major comment, will be raising in next patchset.
-Harendra
