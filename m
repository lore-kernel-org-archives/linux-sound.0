Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB0A22FF22
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760644023; cv=none; b=uKnduqjJF3TcdpmQNkPM5/fv/LTsLlRwlyMUa8SCPfU4oxdV+WaEHz9HniIWY7KlIIeP6kWhRSpZWWoDPQaQaKLEId3aNabvFon7fj6JdaVq3nl4ATJD5OamJbql4P0A4GsXzvx+zImE1RcTtXsU2zCa1BvGUM/bpBY1wBSCAwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760644023; c=relaxed/simple;
	bh=jvlhrPfLoaKE+znZnAg6r8knLdLXlgFcqxHMO0uJA10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5r88Q4Vr1xNf7vaLfWliAjFZvjOaSA7hRq1IC9RPkJidgiFvfGv9xFuIakbpVnR9KtOK6AjhZ6gHoj48xPi4kg0W9vYgqolPuhAENAMMWQQ5mFxtDtXMhm5oOaaSgmtG1DeNwnmvpYrlyK0Jwf8vpPg6zcvqrJ1gSeqgIRQq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLNsYwwc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLNsYwwc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEsoce002553
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 19:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQdOp4yRQVIe5mJRI1HmxzqE
	p3FgqjRI7/wz4aB2n3E=; b=SLNsYwwciUb4CPDEmwwkxK3V2+EMXcPwbbRYAt7C
	9kwVHqkfGv78RLnlLs0ADHupW1lFhQxftN6i8RPPPfXW6/F72v0JjeC7UWRqMwfW
	4qSuFg0NWlZqbUyejdiYPeqkullZuW1RWlJuj7HS3cYTFJ2s8GP3DutUZQBLz/Cb
	PC24Dnpf83tYLYjwBb1tVSTXABMqTPIzGR3jHRq4Quu1ht8C+82si+2kGgY95Nw8
	bEJMsdSsGYVnzK54xJHJt6ioTGH0J3EEHXwhhqRR/79d5fTGrHV8c8aOozFurxIN
	cpO+xt6h0pU2d9I8ZPnnWLWzb+aU8gbsoY2pfCnPzKFZJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd99pwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 19:47:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bcb779733so416622a91.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 12:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760644019; x=1761248819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQdOp4yRQVIe5mJRI1HmxzqEp3FgqjRI7/wz4aB2n3E=;
        b=lGbyxUJgyMupEk2SSYzneV+ufa2Vy0aEwFtTYV80LA+zyvBmnhcVhlRVKuSkrELGci
         1DACS9q5PAjbE46zSkLF5UNCJ9nonJ6JUap0wmOgzh0B1Qhsmx4ZwhSSajNFsATfg57Q
         XUUqkMdors1vrnjS/p2dNhj2rASjGFcAFxya/XrQ9V7ruOf/PGQE5DbAxueSdSRK5E3h
         DofPvDNytp1mxTXEZygTjnmrVRE2WsrtBz5PWMCEC1Et7CALVebnnR17Dd7Jag4YqZZA
         qjOtZmhGzIUWipi5EP47rqojYphMxwRfYIhzWPPAU9CCgddG2OQ8Eg4AFf8/mN+Qe237
         mwew==
X-Forwarded-Encrypted: i=1; AJvYcCXGy2I3rIoBEM6RRGMCOsEIZI3dRM7CwrzMl7ibdxJIZ3R9g31R1q+4x7D6ETjldMNL/Gbw6+PO5rSqGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/FSFMdjz2roFtMjcI4fiZ9podeUFE969hNx7HB01DYRvUTWL8
	ger6szRrExFU4aKRTYG1AAoOXZMMB4dY/0J7tvHIDYqECDn6C0YGZp6b6YkWaoAL/5R53NmFCKw
	d2DYRqmUCCv1W4JHk/KfA0R62m51aUiAWnEA7coUYRk6o2CO9gKTCDuZNiZVLXlTgWd4S6ahgfh
	/kvUNnFphdzSx3mp4IirIhpVn5PHbKH92WA85gaRJh
X-Gm-Gg: ASbGnct/2MDuwGmxkTJQBF9zWog8sotFAyCLEa2IwqM96Gk8hFhgOwi7jrEVDf63Ttc
	ndpVA9hPIhhSjeHA8Wd0yjDsVdqFlPISzYOHwQ7eFiNBdynkKnLowzH5qtZzfKRd5rrJgmpyydV
	SFsr2I40PirjBfeOyAkMJSefhgfkZ/4fopI0yOTlOTp2D7DdzBzOOKV6gB
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id 98e67ed59e1d1-33bcf8f7280mr1059343a91.25.1760644019432;
        Thu, 16 Oct 2025 12:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC4rtVaiUiGDeFxR64+47ex7+DNGbOtDuTWAbWJtoo82PY848HLitx3BoRsLxEASeMxNul/mWzFeugUy1bWx8=
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id
 98e67ed59e1d1-33bcf8f7280mr1059315a91.25.1760644018924; Thu, 16 Oct 2025
 12:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org> <b0d9cec5-1162-476b-8438-8239e1458927@oss.qualcomm.com>
In-Reply-To: <b0d9cec5-1162-476b-8438-8239e1458927@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 22:46:47 +0300
X-Gm-Features: AS18NWCyJN1GPmN84_CNi0rIoG2E5eLZy2zgaxscoNNGFNo_QUpMlqJ9UvpzP-s
Message-ID: <CAO9ioeVcqT_Yhvz-RMCucLtcpa4xCLrA+srM8Vy_ZZ-650ZQnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1 soundcards
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 7EZ_OmqNGeWPgJp8V0EHn8McaFsx-PaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5ToyS8zHX4Zh
 BtIK/iTIiyRe/0ORskO9DeVy59DH89f5o3P3CA4c8XeWOzcRol/bW8PDY7F+K83TZrvFRNa7ZIr
 uuGeF5bZLHGKlxwk+aWTo/DG13Wnt3VvHpyaCdy3b9+n96ONb8lWUONraOiRdmPqnrY74ih88kH
 /QK7VqHsqWFMoJe+/R8JYlhheZpPeVgRVTcWB92DsVccLE/Al0CiUuZQigMu943GgADhn33jfFK
 iZqaXwrwKDq34yMUS5zt1yBEFRpUmpyuPcI8oAGdNod+e0hyRi3ffTgqAK9Gfjl47aGDfX6MOpe
 8H4QIF/5DnFu+PIErxOr9HHQx4BWUdQ/WuF9uypGfxfZaqS/JOgOpBrOCKfg5P6zww3TX0a6tWv
 1kXxuuD2UgVSk20+KGJllnHcqJq7MA==
X-Proofpoint-GUID: 7EZ_OmqNGeWPgJp8V0EHn8McaFsx-PaC
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f14bb4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=HGThU_-lZqIAk3PbLksA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, 16 Oct 2025 at 18:08, Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
>
>
> On 10/7/25 2:26 AM, Alexey Klimov wrote:
> > Add soundcard compatible for QRB2210 (QCM2290) platforms.
> > While at this, also add QRB2210 RB1 entry which is set to be
> > compatible with QRB2210 soundcard.
> >
> > Cc: Srinivas Kandagatla <srini@kernel.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -21,6 +21,10 @@ properties:
> >                - lenovo,yoga-c630-sndcard
> >                - qcom,db845c-sndcard
> >            - const: qcom,sdm845-sndcard
> > +      - items:
> > +          - enum:
> > +              - qcom,qrb2210-rb1-sndcard
> I don't think you need rb1 specific compatible here, unless there this
> is totally different to what the base compatible can provide.

Why do we need to deviate from other platforms which declare
board-specific compat too?

>
> --srini> +          - const: qcom,qrb2210-sndcard

Broken quoting

> >        - items:
> >            - enum:
> >                - qcom,sm8550-sndcard
> > @@ -37,6 +41,7 @@ properties:
> >            - qcom,qcs8275-sndcard
> >            - qcom,qcs9075-sndcard
> >            - qcom,qcs9100-sndcard
> > +          - qcom,qrb2210-sndcard
> >            - qcom,qrb4210-rb2-sndcard
> >            - qcom,qrb5165-rb5-sndcard
> >            - qcom,sc7180-qdsp6-sndcard
> >
>


-- 
With best wishes
Dmitry
