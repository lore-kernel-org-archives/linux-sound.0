Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAC35FF58
	for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994655; cv=pass; b=sajz8lCkEN58nYgYUIs8kQ0cPU9ld38rCtar+Mg7wjGTr/KqXpS1wLencyxhzr3kt5MNI4lDJgEQEbKyFeNoBsvCYdNz1QOLD/sgwmWUIkysrLW7FxsllNvnWRKhnt9bB0mnm6R9TlZpGs6muifwGGALuetbqXYST8E9TU8GrxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994655; c=relaxed/simple;
	bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcB0SVybbY3HVV3IsJeoKqEbLKE2zkOO5AXcMVx+tPWSjaLG/zSbbr6K3wTn9v3tD1G6WlCZ4Kv7ttG4JXyc3xgKO2CUZ9bNIvHSka2YCr44GCG6sddy4QniA485qP7IKHUPxm/RXNZgl3OgrweoKJVUz/UtmIQXCWwtqY0nKD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3O2LrFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVihG0um; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3O2LrFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVihG0um"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T8025w164894
	for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 09:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9R0m/OtdoBNGH1Uc/ryAzaH
	BWvPsUBfW16dR7HZ5cc=; b=h3O2LrFRLjD+cR2dhW2tTnX8EG9JsdyMcU8Pzq5M
	RDn+8T6fA5lM+8fWIydv02iZ9pLjVIGqaYf5tiONU+ckgnqZKKl6A1LqeX3hcAKi
	daV5EA7nU5LEmirpW6rJmOzy34dHM4zDC2UkhPs861MXGodsn07PPse3IxUe42rh
	J2AujUuvquZJk2Hd+S+tJbDAeBoaIVnG6qjPWVeBrWTVKccJxewSmyMfd4mQO7IY
	CbJtbqJBrbK3YMQzYB9I6EwdFw1zIVDLqoSMP0NDWJFs44xBndqA1VxFsvIn4X8+
	zm+amfWEw2p/Lp5eC8aBLuooeAt+8kg7/LNT8kuk+xcKQA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgrfdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 09:10:52 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-855a66e5c76so43488627b3.0
        for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 02:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787994652; cv=none;
        d=google.com; s=arc-20260327;
        b=ANvKM6H3M0zD+soiENwMkQXvCylDIp+6J8fMv/IRL8ao7u1Pr6oyqEpNl9pm8r0Vhf
         xOSsj+t1OpDr7N1mKtZrwGxez2odWLNCUhiIullJFkeM85aD2bCN4ceEw51gCHxPKZLF
         7PVFGS9mNRrl8rs/btbqUHT2PQvhyNuDHjwt7I7TEGPyc78gvIL1dWaQfEqmy72+dL5o
         V9yaAQxhY+XJL8hklB7aMbV11shvLT9z1ScptGhPAZyH6osXt2p6Qx9JeCMVoUBIY3vu
         YGS65dBKkdt0kNGyZXMZdgkTEaf16lNxBpXH8KSGs5BuGJX/tra0noeFmWV7qyRjgvyo
         ooxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        fh=NcmDwYoKZ7m8F5cul3NwXPsvB1i3ZmFWvKL0rCC9cD0=;
        b=hSanaZeUns5fbHYD39dvjeRiHuwmfkazWKjsNEXegnF2NZxkKZkyZJeXlYe9yxjjVJ
         KW3dKvMZP7jIDVOXHrA3tuQKM9J0MfeGUADwelXy3O1vujw/9sfjSby0Np4pciO4dzRi
         Ry5h92bRUttgeYlYvHpfnXb+Rr/Z08kHAe0ESwlHcIQnGWoXtukb4zPm/Y0SBppGf3iA
         hWysU46Q9yo7Nsbo/N8ySza/DNy00NeOgrs5Hde8l1MZlucIZmeaU0kuwtomaoDmKnFg
         mnyvESkziPv/uAuHrLGJmQX23y07c7hkix1k+kbqXvZuNoXIkHd3IuK4grvBQngHhNCA
         8H0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787994652; x=1788599452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=gVihG0umWxbRfStRARpK9+Z8yf8/xM+QVg3Z3rP3v2hnRnvNcMpamK2JVtdH5uT35k
         +ORB4lNEenl/jqV4YTLMaJZy87XTmx0fVvD0PaEqptyIu9ypMLiN128d+Zc86tWS102X
         Vf3Hut5R5OcZ7NpxVUpMz0dA65A2F9myzLH+RCIYlgxR6t+H7R5/pOv8bSd0QmWO5M7Q
         8wyXbaYKBnF5Tzvw0nk/E2/vA172zyM9UOFhSKH+klctEwGeQCjWXqrzqcd+YCAfAk6c
         q8N99V5smpx3bTYrbiQSVpc9eoRXwTtWQNMk0yl50+p2onKpudW0Y33Gr7Bjm8VlClGg
         iZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787994652; x=1788599452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=sH/BDEshf96Fo1wQ2B2vrQLFqlqC+WjG+fQn/buy5nMfRNHuClAQrh1sHcPkZ0uHMY
         eZK4yamYUA3gj4qCZWsQ4neZSNDpga+EqxGrxK8i753oSlQAHYpgksRvMWL5pVw52mNm
         Jn3SuLAjNVWnxHAIUnjNLtwGrIARbEbkujbewlJjNxSI6q+kPI3dErgCAybQs3cPdJMG
         3zLTJHp1cwuuwCBYnv1e1fu9hePXylPmEEcX8wTKto8XZu3a75UuXr+Rw2rg/TMAzmkv
         X4CIca3G+Y1D5zivJ6mgM4N3oimTLgvQQKJrRgRjwJf74AC/MQafg7dwVWSs5NrZPqX3
         wJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7wQSO3waJXM4cOm69u5r7R5Zeb3mUgxWLZZPwsJcnpXzc+6IjMG8MkdsFOKT7Oyy59LvOhKZgkmRB9g==@vger.kernel.org
X-Gm-Message-State: AFuF++mIl9kTjN2bgw9AYfV3CTL+1KnK423uk1Be+PghtVTFOMhlF/Mh
	6F2XgVZwTn6MkTOHYm8xjmSPrKUP8sy17SssUgA+bibIBNmd4sOxh/VgufMhzNHuceqrw9hD4jc
	pcUG3AJGCV8Yk1jbgQyoX/w30NndweecoFgIEQ/K5IND4TLo7M3KwKvJa9CeuryPKn5tBwnZRl6
	nU38gPlQ2rEXE09Gi3gZ1ugiSmJVhL5J0OB6raZJFZ
X-Gm-Gg: AYBFou1ZB40iTGuAl4YzfzzIiJsyEzUIkd3qfUgPtaQL98tKuKko8guXkZgZL+Vh2lg
	Xz3SA34qiVY56FqBJRu4cqCkKHSWh9AingRccCQDSwDo3uybPZgbYI4lUiyXgJG0pFY5Vujgl+i
	qhLsrn9a1SNF5qC0C6uW/d024tiU1NF0HOt7z2shSs8IV0yTKuUT1qXkbwUg==
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id 956f58d0204a3-66e4c43b71bmr3308187d50.13.1787994651929;
        Sat, 29 Aug 2026 02:10:51 -0700 (PDT)
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id
 956f58d0204a3-66e4c43b71bmr3308134d50.13.1787994647938; Sat, 29 Aug 2026
 02:10:47 -0700 (PDT)
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
In-Reply-To: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 14:40:36 +0530
X-Gm-Features: AcwNN1WZTqtwCy398rg4Jah6gCzauP506o5iczp3wsP_In2soqp-bDWVzQ4xo1g
Message-ID: <CAC-tS8BjRPjcFYMjuvyB-9uJkYB=rNkTUtDq9jF6EzgjKfb_qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfX/G2vLYWvSfz0
 LVZ0LYZRY11FTI6qNEn70dlkQu2lZolVAKJ8gYtEv60IJdQulC0KinF0ISSlB036dx/Ycj4fjPu
 PKkE70lkX7nWi810rbBWq/J2I91XgGvR8ejXPIzoY2OTXIUFeuqX2PKqNyGIXQGIb/9XcAABl30
 rsWJbtHyJZDw76UwYFu9WmuCHk8UeIgBczZl6oKXO7y0mXu5Wk1iIsWYUhD+0m0YqNkD23eGmRO
 3WR/Q03XQAgXfky+rIpIyS+So0pDKr+A8MHy/vMrPRRvmDvy3NqNlql0jU3FUo4tOPvcZtxwgse
 qDGdcDwehzS0vpgbKwk3ffex+36WC+DBFuujGgye460LOkV8eYwxSqFVgKpqFRxWyQ5to/SQtLy
 j2VUlfSl1KYCGRJDAqqvJfIEG/Xr0jnO4DiGzP3hUYDi09gkNWurNscERBBYLbOoQmVCnF92d1g
 z7kEMM1C2XpUirRtvNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfX23QwKeH/vfEn
 8qshtqQpYjNh5nG3TQ3jgP4qs2XCyaWQ7GQln+2OmCbhlcBPJydfVvdaNdtoOu1YX7sT86JSX2J
 Mruo22rSJFYCYo9D8f/N7132092NFJY=
X-Proofpoint-ORIG-GUID: wNkSrT35LoNVupE_ax5T-7hxtlAn7wJy
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a92a21c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=SUKUb0CtNzGe3DbvoegA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: wNkSrT35LoNVupE_ax5T-7hxtlAn7wJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290078

> >> Srini, could you please confirm if adding QAIF DAIs to
> >> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> >> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> >> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> >
> > BTW, the dai ids are already added by Prasad
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> >
> >
> > You should use them.
>
> Correction, he only added QAIF clk ids, not the dai ids, Not sure why
> dai ids are missing.
>
> That also raises question on how did Prasad test it without the QAIF dai
> ids.
These IDs appear to have been introduced for QAIF interface clock
support in PRM SPF for DSP solution. Starting with HAWI, QAIF has been
in use.
>
>
> --srini
> >
> > to your question about increase in size, yes, this is know issue, i have
> > some changes to send which will remove the need of this static array
> > which should fix the concerns.
> >
> > But for now all the hardware dai ids for qualcomm SoCs should be in a
> > single place irrespective of dsp or non dsp solution.
> >
Understood. I will add QAIF DAI IDs in qcom,q6dsp-lpass-ports.h in the
next version.
-Harendra
