Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E4C34C9AD
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217843; cv=pass; b=nIIFw2+TK7yBkvZkITMdxxYiMlqhdCSphDI4wfOQvcvajU+7aUtDA0uEBTBKtAB51lJehQEtbRv7677bfHuzqyaOr6OZB6GK72ybfeoWSjacewCQon0k6yxN8IDOqBQZfkjqDQPV1qXsaaySGJGm82q2mOaQETZLv8jJrvd+kI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217843; c=relaxed/simple;
	bh=KqJ9tR9MwbyLMUZlwEX/xSNTx/JemCMTpgM7qmlLJYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu4EbwXIm8iT4Xbt7d9RmOCPQ4hjyMbZjGoZQiNX+BiRDIZaUHreia7uHybwpdmfG8qOOEbwQDAiF3JSHAMWMTHZYveVcWo3GNxtx4t+rZwO62GrMyhNWds5BGwp2ReQpbW22L7zk22TE2Jt6ZgM8C2vqgNEADWHKPGJtK2hmsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYB6eHcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggeBtpTY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYB6eHcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggeBtpTY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXm2d3668740
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=; b=aYB6eHcqzB/b/0pG
	nCdPspOI0ZMFcQSsHfco2vgglQkoGteLxesnSme7Z77+46aCDsq1xRp3pbzErHe8
	Ke8KsH7KR8LjCqQqB6Y3m7f+fJ9+ouOz1rlkOY6JMxzLKdgakDtZTEokfXUhifhM
	iL93tuIAy9aBWYEPZHSEQ579O2tORdzxhJ6IsrbTUkALg+x1f1QCI+WZ5eSnSI7r
	61AWBmlM09BTX89DDn/LwhPjGypY04JS8iqxbBbmL8nuvL/YA1xk5UC4rDMZke75
	+orAQ3ZSGj+u5qnbjYzZaZJJwug1jQ8k6fc61zHH+tCVwZqTbAgZWRtIHaHj+t7S
	76kkMg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygxvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:30:41 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80533a7a4ebso36393277b3.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 05:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217841; cv=none;
        d=google.com; s=arc-20240605;
        b=CjD5AfO+HmGvFDud1fJsYVpu1CeXasi2m+AwDmTOrmkH2JSD29q0ZK5Cwye/U6TWdf
         YZ4J1g0nfL517tPt5eXki8XY/NRYA7TpCne4vxHLAU51i/bNfFicLT3vNjTW20aURhkt
         sBbL3rHcrGaktwNBGq9hkWYDvlCyVvQ86D4Ej73gmZslXbYtP6Al5T0D5cJG2I4cB9x5
         B+Uq4DT83ZCMvTqwl7+MKt6e2uKmb1DJ1ehOONDeUn4IaiXPcS9jkYX4HwfAnlf6swjx
         MWOXGx/qh0pac/YlhzryZkIR8KvqUwKNlDR5/wgJ7sdAxvBcIJGipJilzDgUdXeedKB4
         J81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        fh=lVA6coZ/RVktwsgi/7yhyL0onRajYR+H/Bw31OB9d8k=;
        b=gKRbPjVUjDUmMR6lbVfjVviR/bSpfutzpc+C3wKWA0erlkF0PQFOk3M1ipSSVFVms/
         ++K5b3eElr6G1c9rUwbz5LIJg16N3i5pQr9HCoj3rUhW8IMLx3Wj8dpO8Tiy4EsoX8iQ
         8ODxOphQot+0yDgVoeOx79yOyAketFYRbPSZ157FEOF7x6N1cx5P9HjxoIUo5uY4DGOw
         fzSLpa3vrNWC4xJeRK/fwm1b/5xvxar8q8CB3wZNXlQKJx2wfzxqox8Ilyd+NiKUzQ/g
         wdM4PR6dcR9yHjhl+IXHjObnKdhjBzvfsslPkNWqQLLvL4u3n18kHjYEptQUN24kAXvT
         JoCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217841; x=1782822641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=ggeBtpTYgHSNWkJBBiKVeQQA5o6sY0u8dtaacbZYesSyAuPpsPW11hmsR8ela2uGNv
         /SXB9YdvgAEDQFLWCyr03I8p1M49j4TE0YW5jacat98lDvBAlgpmqRANL3jeLrTbYeES
         j7i17oP/ymyWtUEex6d1aff1NJC1UWV2/w/LLaJRJG2fW9GrsLY+DtU6XB1TmWHN0Cx9
         RVQrcEireIPx4Ibmv3CqnKIJrQks1fZ1ZR4SJLDvYaC6SoiZIsrEt6NScTYYEM85GB1h
         wH0V9CHF8GajMGcuORhoIuJwNzbriPTs6lnrR7NmTdX59tVoIm5ET2RaftFSwX3o+zdL
         D9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217841; x=1782822641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=ZSDtzHT5vI/QS9VKKa7g2Ann0xxYscGZxy2RFnktuox9iVhPWsHr1wGBku0QxYA3BW
         oMrlJYpcgr5bCwNsvHH9ojWvNkZEeFFFm9k8fjZui4oJMs86UP4h0MPNvpjYolE9MGNR
         j3f4ZK+4XDDoyNiTUzAEp9t0NNKhzSYx7xoT0gKFXmCb7JJyjTe+i1sgM/eRBBtT72CZ
         BmPvsCJVEeWikTX1GgIWY1fYwVrdXXijQDYmljBDVrOsmlnNE8A+1lW2jAnbH7Hrr2wn
         wfukMiYKXTJ8WEoMk8EeGwXFNRM+U4KG5tv2Sq0XGir7v29jFb6a4tyJCb2rYm4u1hh9
         j22g==
X-Forwarded-Encrypted: i=1; AHgh+RqwGzr99+IBi8h3b9yTzYkMZytLx0TV3zhMjF2PT5pq3HG5pKAY+RZPhfGsZFbllpZijcfDXayPHpT9cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVf/zE35+7Ah9LSgOvAdIdPyBHOH4Q7l7JX8S+tflD27U21Ldl
	9M8uoyIG41EJsrrMQ/V3JCpSC7hSSYjB157VhC1KaMxbnyiSS4BtQXqCtClk+LUBqgKLXLbtUjq
	Xb8Ov+kgIfXZHaqYg601Yj9POVGiZ73VLajvwWKf4WNwPn1NIuYgpwhUjC3kxV7n+WiBqxdrr+r
	qYtsc5U/QPHWsYa+4KBJNDnxje3HovAKauwctkSlAd
X-Gm-Gg: AfdE7cmR6v7Bz2ZktLGl62K4chK672IkIMulnOqT/dWbBSVgPNSg+Z8Yu4iMtEUigyU
	/TFxtcKZTGGjleZAtFrz8X3fVSS1ViCGSPJArdXy2adQBVcxLiIUcAuQyph9VkLYm8wWTaXgc0/
	O6Z/RHsTQjzqgVyAef+CDGr7OWZAqXh7fOJRI8NOFmmxKl96EJvvaNEkPlaIYk9CKBlzZA
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id 00721157ae682-801323710bbmr187404927b3.28.1782217840738;
        Tue, 23 Jun 2026 05:30:40 -0700 (PDT)
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id
 00721157ae682-801323710bbmr187404447b3.28.1782217840128; Tue, 23 Jun 2026
 05:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <178065883033.3171433.8446753794680185025.robh@kernel.org>
In-Reply-To: <178065883033.3171433.8446753794680185025.robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:29 +0530
X-Gm-Features: AVVi8CeP8QNIhESCYgjuAS6yT63Uj8PaIaSkaRLC7VCSJ8oFpUWf6gegnGmTHYI
Message-ID: <CAC-tS8B6xFMxsZ=Zqw8Ox+YLLG7XfY1WTDab4aZoopXuRYScHw@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfX9gXh7U4lKcwQ
 hzg8J9AcVdwpxsJbAkn0vtTQ0PlunrR19t+L7etZAJgACI8FAGT8XRJxQ5ikFcL4iU9n3rrTC/Y
 WXsNhEVhNmP4P6nLjS0PtBhHI8hqXQ+khS+HPlhoNuXmDjBHCJOKzTXM2RL5KkReyovADJqH0kb
 f0PUtJEkfSd4qvdddgB2eGJbLQIAIQ+Aez0xrN1F78fPGgxpJPKPnJ9bsv2aIOc+6lIH79LOuDA
 tHC3vP4wptT4LpQXNpOMn4tEpu+vLARs06YhdIvrNRJhIqxxNnCwHlcJbvY4vQGm2fGOdP3foL3
 b1igIodFY9pfqAjJ7b+TJ3wzdVBe+LU8/H6zZ+I535yEgucrvzh4fJPpcJMhEmAzvAtDVHESaWB
 kTLO5ZhtpHhyhaCI1KFgnB8lKw+Nt4pZWygQt4PKslknGbIuYMvLYGBRNU0Ee+f0nVYE9smXWsZ
 v1BMmFBjVFN/D3dv4aQ==
X-Proofpoint-GUID: 68X6BoQyHR1eXb2W70ObrPF2gV1gyayN
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a7c71 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mfCsxB9_3l_S4IKQe5AA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfX2ptkAQA+Ni2a
 ajoRKCgy2dGYgKmARr+M/PTybfUo40vaeoeE/ToAT8dNafwQdM5FaDTXh9cvJQGv7lsjAZTvHiW
 PBf9JXZIeuG/JCc1ANb7JjLgPBkITFU=
X-Proofpoint-ORIG-GUID: 68X6BoQyHR1eXb2W70ObrPF2gV1gyayN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230102

On Fri, Jun 5, 2026 at 4:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 05 Jun 2026 16:07:28 +0530, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/qcom,qaif.example.dts:28:18: fata=
l error: dt-bindings/clock/qcom,shikra-audiocorecc.h: No such file or direc=
tory
>    28 |         #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/binding=
s/sound/qcom,qaif.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1662: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260605103739.=
3557573-3-harendra.gautam@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
Thanks for pointing out and sharing the steps, the dependent changes
are also under review,
Will mark that as dependency here in the next patch.
--Harendra
