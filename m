Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAC46D2AF
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249437; cv=pass; b=CuzmNOegwx8ZZdWMFk7o1g8MTZCSUSy4S7uqCUmWvaVqB86nE1fIqzG/ZdmuDTKDcxjLCcX+RWJGfQX/4JSfLsRsxzSPqzc0/wmn2WwNlvbWe9mQUZMiMxX+93YioEdaMXKtl1SZ1UWY1igm9UFC1op/9hXJjpbu6YuT5vMpnSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249437; c=relaxed/simple;
	bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnEXYEBR5Zcm23dVbNNVes/naG4FH2hqZsTG5yO8dTJ8SgrqKpmfik14v8rDJFYGfAvRNPfwd1+A6Qk3T6pYaT10Xfn5O6Gu2uOBkgRy1XIoXh7/I7HaOua1OiiwSSfYGOEeNUUlyMi/fmNV6spAv+O4TcT78FOMQd8AFdSrxYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/CG5LUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZdSLXFb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/CG5LUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZdSLXFb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OGX2321941
	for <linux-sound@vger.kernel.org>; Tue, 1 Sep 2026 07:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MT95TXLpS8p3pbuJaaLjnBJ6
	LWQyjI3YRFCLnSR0/wE=; b=U/CG5LUpyU0Id0Nz9vRevwpMevriHtEySFK1ORO3
	sx1h1N76x4h10pA5D5hXi03IXLlyi3qinBsusTM3sYkwAEFUXKpae/ONh3zCqByD
	Sigc/ZtOKmdIsr9CPj84TduPSi3LFIjTUIDD5SgAe7i8gjj90IAXT2UzQ5riHHgo
	ZUYpaTJk+IQEe5+OHinLsFlyzS3q+AHacYjfFMahzYF9O0lb+w7SNiaGIm9DrMTs
	NUHFhs1PU8aeivtjpi60tFokifv7DgPAHmVWn/Awy7ViKzza5++rffdy1TzFK7WS
	LL+j7O/8mrw+ljJDTF1MhoohgdOrwuoBbf9UwQIsMDKnvA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchaspv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 07:57:15 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so6325507d50.1
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 00:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788249434; cv=none;
        d=google.com; s=arc-20260327;
        b=fc0doRTDzBgWNgUSBgYj0nOkd5Aey0dRo+gXGrJq6avP0ti0PbVEH8MfaFxFDC5d6C
         nZfLqLjGsgLCoxplGTXYTJlozotjQvz22y654CaV4W30fd9X0HHtrUidImJc3R1pF7A2
         IWcudketYxRP6HfM60HjH1riw+IGXxwb1NTiRJwZgLfs0VT2dGsfD3HcMLFvSM5Kc5mJ
         VMqAhhV+7rtP7gLNh/0u+9xum+gdjCndEbeMihA6/TFkceJBYbyK9M5IAKFdybA6GdIT
         PbP+IPLeKkL0h8TQXJfBrv4r1ajXo7Cw+FCCbhF/LdigvbmDVpg1V4q4O0VyU3ZXqUGc
         1NyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        fh=fR2mN2oe+KwBjthE6lZp9dIHhVfp6CuziXgjLtkNeVI=;
        b=EPkZ+5rg0xsSH1+CZwLPWNkojoBSK18BL8ki2xwR7WBSPB9m2iMY/SZUqb7XDnL0oR
         30XwYmaAYaNqkSL7VxYk9KZ669TyJuPjXlOaWMGc5Hyhf5D9UoiPIVpl2Ysz+XKTaNNl
         A23sT+ug5VPDshnAJ0eZmHCdzYInpRn0hew8lDsTNEwKp+hPPo3jXWMdFL7Jf1uFUiQq
         ZGllWBMfkuFpePGKFoGLAGueNISHPXBDtUplY3JewCaHF7QPMtHA2acKfN5CVrQVJwIT
         Uxf2TsgKvxwsO+ZxYTMxziLMxYcUGCn0FmRTthfLB6l7025ahr183kZhLwsNiPEHgcU9
         0xfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249434; x=1788854234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=FZdSLXFb/2APXS386Urmt0wQNBMp1BEGbJLT0ZVmmpMcJ6a0RLUZh9k+xJYh2KGGB1
         o5TaKxMdcxeJuUwtQDQ5dkVV4diBKlpyz3/uUAg8uuS3JLlNOsJpK4EuZ6nfEQUvIwV4
         Cng5a1S+3+paNOv2HDcYFQMekV7/EOSeP3XQyxewEWGiDyFVsH56sDT4H4fhht1FZErC
         CUodnbCQntmkfD9QcpVOjiSN8FC75kWoQPOqOa0w0G589xElwNv3u2xOOX/kVw9Ni7Im
         D/gDjTBWGq6hUX/7lIVgKPRyrQoqy4rJxsELm6Orc5n134mwjYr0+HV9vQwgMp0HXUxg
         19aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249434; x=1788854234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=gqsEhV/Wy9yBGb6CtS6ZyAyls0V6FCJ+m7kFGFOjPVA7iPZFuYxnr8cU+Wb1mtg6ds
         JnXBof0OGrKb9pvCWurpgFtdSiiPcUET8Vlg7jmygzXuailw5Z/MUhPuec8YzshYm8GY
         cwrtnQczYW020RCS+4aIw5jnbnFOTudK7A78EszRcOl/eTNptXq2xybVAqF2ry4qo7YO
         B9uM5v9ZboWJBXK3Wi7IauGFx4nCjXvq9XTCpUmqFXMjvZk2exMkcdXkjBkC2l/cTWN/
         vKf5bsjoR3eSJLa8NMfgxerOnT1PsbbZqy1KoRnfDuRi1kECBDBuufv4l7LncRR0eMkp
         KAtA==
X-Forwarded-Encrypted: i=1; AKwUvByzjrVWXTuEuJyNr3IJ9Au8kvACekNNIm4gRHsD4+9m+bda2Ti4gVJQ8qax0XGItxCI05Mjb7yyJXbTAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++noMuQju1jk9G990cQzAU+5IXZs/lAMSpDLFqeCu2985ulXI/FU
	4286zO49n9ICpn+Lz5S289IwoYovkHnrcmwIUeXnzrBO6MUhZ4ONSYQemfS1SZC3QAumFxJLSYW
	/t9619qBbuDVO8rixcQY309RZo4wByPk0+jq49RGMTG2E1dUnjs4SPdzCs5SfUswMWmBvSf37Pi
	e5VJxA/J1aeEPbLsVQRBM2ChRySPAi3rikZIRsx4/4
X-Gm-Gg: AYBFou35iE1AJ/GyPKslIeHESaw2l9cEJRy4CcBPF18ZJ+OJZqAFC3ZJipWp+LRAO+5
	DYbikAFVmSORDq7SwAhRTreuQ5Js1wSIs3ALo/LTv3ChypQGAEwmTFwr/0vsXHHDOOmOOIWxpj0
	HAeyhJc/EtKYrNe2jJ+pGGKBdqo0VjzaR8vQWbb3C4hul6NrFr9Vj0UEi9uA==
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id 956f58d0204a3-66e4c728865mr7583301d50.25.1788249434563;
        Tue, 01 Sep 2026 00:57:14 -0700 (PDT)
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id
 956f58d0204a3-66e4c728865mr7583284d50.25.1788249434062; Tue, 01 Sep 2026
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
 <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
In-Reply-To: <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:27:02 +0530
X-Gm-Features: AcwNN1XYMRVqJMDI8M2Ek-7j5XHLY831M1TAKp2IsZzjDOzQlIlkiRN0nFaiwDY
Message-ID: <CAC-tS8AHW=jobjaDnyw3BCo5SXZ3nSzuC1L8vV4aq-zkHuzDyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 6-39F3hE6i-ye17Uw9ORASCqqaJxlkZm
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96855b cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=nUbHkpXoBt4ruc41abQA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: 6-39F3hE6i-ye17Uw9ORASCqqaJxlkZm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfXyAfYRoc5BCBI
 J2LCUL/6flbf1E6WTjtjRWesRxk8VN5ohZVqjao7gKlrkmRQiIiBOSa/uynFCnyCkjYnrOvwHUb
 EmXSbVFAUi9v8vk6l/vjtQ0+rStsGGE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX3dN0c8IXBhIZ
 axtru1mkxQ/AV/iuUADiI3alFY1l1eTpVP8uyGLrN7EqydHDSYe05o9UPzZEQaq5HfC0uxQvEN3
 MEqeqH74koaXoLGnFsfSosesgnhX2c/Jgd11ztLNSjHfLyDD++Dh2ABeSH5totFQODczJPW27fl
 AhpaRA3OVgpYos7Tr5Z3V8NnlJym0NvEcDTqXoR84QV1fZEst5a+2l3WehaMsmvl5BGHFVqldjm
 aLR5cWoJ1B5KubgLImeP1+snnMuwPSMGyjSr91r6EZkI9EWxZOVsM7wNaTLOAxHbJH9G7QHFFWV
 0F7N+zQ6bVMiKygivpYEdd8TWCCAI3ocxUK9W0YF8N7OKZCHP8kbdx0SSSvMqN83xCLRE1KJoA9
 qAcDgFIhrs5VbUzRjrk7K58K1oay+XjC56QBKiOf7nkzzaFyHPNRhzJrxjcXVzjbgysl7qz6B4J
 DNz1iB4rDW9hh+0yMqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010070

>
> @Harendra
> As I understand it, the hardware interface mapping is almost similar between the DSP and CPU solutions,
> May be the no.of interface count be different. Would reusing the existing DAI IDs therefore be sufficient for CPU solution as well?
Existing DAI ID names are tied to LPASS hardware topology and do not
align with QAIF port indexes. New QAIF-specific IDs are needed for
clarity.
-Harendra
