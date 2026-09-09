Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5FA3AB292
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935627; cv=pass; b=LKzlPyvUQGRbtSgFhJdevEWui+Pqmjs2qY+pDuRwBdjG5UacqVwtToeKdtwQuQ8CcB7m9i+DxLl/zDaHZdqnpDMEj6Ke6vDJXZfmJQM96tLI5KjGs55Zqam/aDmyuRoEvVsjnD/SCj6YiR6MFzy1T169nRoGysC1LnnIOEKFooc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935627; c=relaxed/simple;
	bh=18Zr3UdkPL5YGneMwhBfVyFM5vzCFjokkjS/4aofckw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnjxDZuEBNXmOUJIvQfd96V4AwmYYWB0EpenPgzdhe+GXntwIBmnlzzVv7vfM8QLZ1t+pwUc9S1EsHXY2lXPZxUS+Q3ylgb9xxtIMpfxO7Ubb+RJtsXuULQ0wbmzypVwEPVw4aXormBPkZOkM3Fe2kQl74VQkrMZvmbfRlz3b+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zb3O9jTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+UmiBp5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zb3O9jTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+UmiBp5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893qnSJ163329
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F6ybEqTWr7PTGYwKjzBDvKVQ
	3R5C9k69c4zwqDv/bw8=; b=Zb3O9jTDa7TD3YF5CyohMezRJnRYfRROVFjO9ENt
	a6+cMTTOzkJ1jdnqKiEf4Snc/tZb1VvPHpMi4wYl866F0UHYbF4YCyXeytCHz+OE
	5aRd8+iqX+8qoq9kQ+6FrjSWtZab/I0T9Eg6Ddvg+zt3xZHqjzLWqaSUqaLs+YB6
	rC7hSZxYkdmMFAnWj2FYW4hTuXobdP3fxpCvrNvos35xcqov05tUdrMVI7bxSW7q
	91G/1/N600LxVgYa8hf78A/77fHItvLIcIyv4EECHJhkeF4+ATf46nvVstzGOiYU
	cYanulIdjdx2rvpJDarP9ttc2t2DLJlgN9dwPk0EsBlJqA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjyxm0hy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 06:33:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-853a9c4c99eso59300927b3.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 23:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935625; cv=none;
        d=google.com; s=arc-20260327;
        b=XgTWMj+V3b2slBpp4uX2smspYI2ssGa8puu6hfWiw3CvqEpXVhDSsaqDTnbnODvIWg
         6Ub9K1w5xKb7D9N6O9Ob3iXrM/yy7gT+XDR92WqOK2dVVn+LM0DqgC2WcdqPoTG9C3bn
         OWyq+Rtg0lDyuUC0PiY10lh4rtC2TcOv6T1wlvRpcgSXNG9M/75kY/0MnnY6u81kyLM6
         KZJbvnXEzR00dGpSzW6e+2+jaaaMNIOQy9iAqjzCc2l0VNbcPLg6mBzB/9a0q1nc2myj
         lQq2RbSeT3w83YuNcw4LIjuJ4p3uaKrjohla9IJLyt9kMbF4CC717Hn/qdpQRv0Xq68g
         2RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        fh=azGhubQNHEF4rvPhTPjKl51zQLOl90D7LNxwUe2LpYI=;
        b=IbPADNdQQu1Y38IQ7NQIcIBiWf3F8XzHPXtl2GhiMsR2KaQaeIN8kO/rodO1GVHYO3
         RiNrUgZ4iXWHJE6qgQxpY8NOAmvywE4PbUQSm90098EXbFbQ/zaIfRBCm3vtBFx7QRQZ
         OlQGkF7HmQaNLeQZ6KP1lBd+Kx1XJgJGTC73bo4OcK+PY3O05fp1yePH0IaUu0y34I7K
         qJdHkvk2qwbcep/2xFmd4hqgVzr2lUxNjOjuSdEYI0BCWhrkuxDIhG2BoRvspQqgpulK
         XhI2bofCowJddO544sg4ezrwheqbEgPTYFRelxr70WTOTKdgjh9MUwa3iswBxmq+Z/zb
         xqxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935625; x=1789540425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=E+UmiBp5BRAVIODiR25zkv7V9V5Fkeb8NFapeLUY5tC73bEleyocPmiNJZMIXuFxei
         OZlJXBScH63McmhsAsSZNbNbG3ImsgyoL2bfsJyp9tbvMX92K0trrOfT29krlsEmEuk8
         jG2OCcL0+yfWdBeYwIJBq16a//EeJmeOATum8ikS6zfJkID+yOzFXaZh2XiPs6rd68u5
         dG/BMtVAt5QJ4n3Eg/Sle2Xm78hq8JnfRghQ2Hojno5S02pcgDB2WIxu/pzPhBhOWOje
         CNL0Q8KOZ2GeWzfz9FhHdUis9+U1CIgRUc7a/F3iwrvUchtNvdmp2/jD2OLynU7DI0tK
         DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935625; x=1789540425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=jMCvD6udAncjtVPIH692KRgt7bB5r9kI/pzewe2VXQeFUWu9EpCIJaVRB+K74zrbcY
         or82v0qmsVXUuR5x3BZjUtL2O2cXrg+wPzCA/sDn6t3ybEifLifd6Rmu+aO7O6wtevbB
         QJTSVPHDCAibk6XLQMAfg6KPaO7HjktYDn6ZdnhYi+CQl0ybtRL6AT+DhvWJK5PGZqv6
         PE70Zrrtmayo6L50rC1pAOv3UaHz4f8LRi0K79vYzbe6Rfk1IQmvSWsrhqcolbDJECg8
         8i3YfudJOW21aaQVtc+wUWvJbbLLeIwX2WGVHjLQlJP3gXkVVMDwNvlc9HHbuZ9Glmvl
         B/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBylHfLzhmEy5yCp2eF1Fe26TiOhv+eO4W6KosjJV6OPUVbwAYWKW13NBFa04wL6Y2w/FUSE5DADbpedOw==@vger.kernel.org
X-Gm-Message-State: AFuF++lhaXPtMhL1fbDviLVTLboJEhdSKCoXdz2l7MCbPTpo/QFBUEdD
	1gDB54/V01O0ReScWfacsehpdb1+Qc4Kfirji1Y0LAtVs6SxCq9asGIaVBfYyK5ZkdrmPrSCDi9
	gpRyoeRzOcs9bNN6JW6oXX+xdk8c53jfURFHTfKfEOaUbBUWSkGotrV47I62AsruS8kE4M6ImVL
	UE6qgMzbVU+MT08PRYX8I1eIO6UO4+I3dKVwWTCJuz
X-Gm-Gg: AYBFou0Fckit3Xv7FNJFmEja23PAjOxf3CWxml7CtSmCkceL3yVweq4v/2QV4YxH1kF
	tYGglV5GITaTOKFjKRdl8jRxybIjN/vOcjIAttTq5rvDYE599BXjqcMS3DQ1njRY6zcsu3wxJBw
	BRQYexFgWUjRr+VJ+Uw0v4HW16lZylouqjXXsa1cSd1H18gg2gy91wuX0YQA==
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id 956f58d0204a3-66fc1be8c6emr6652747d50.54.1788935624906;
        Tue, 08 Sep 2026 23:33:44 -0700 (PDT)
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id
 956f58d0204a3-66fc1be8c6emr6652744d50.54.1788935624539; Tue, 08 Sep 2026
 23:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com> <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
In-Reply-To: <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:03:33 +0530
X-Gm-Features: AcwNN1WQUsj5OMuHNikswDVbQA10l--Mx-WHy294kAjPi8kkiskKKrtmL0NvCDU
Message-ID: <CAC-tS8BnLzKrtz_rJ-ScQwbfcvFuj5ptOBzXgCSCgUaC_gUCVw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX0Ku+iRy5Pz96
 983+2vF6TWOSl9g6Kw2ohVjgl3Nd9v+/fDgascBKKusJtBv5Eo9i71DpQVYEdDbx+FhKrncgAVY
 xAzWhd0JSiCfKmGPs0D86+V5ynYGWa1vsQb9xjkRQCMTRWQg6kD0LEUtX7Ur8m/E3Ki7kFjoHMu
 ixroHKNd8Y8rQiRlZqKAwuT4Jd3cGfajA/JQcvTGdHYi21ZergNeDoFdiVSaI4ZDTvaDfklrZyE
 61cvADA3n4claZluy30Cade+00fJ2+Igp+Ruj270iloYm8QSfbhKAOSShB7A4dG3coI8Rc9/htJ
 nWVYZ1C4PRTjDwxRKlnCKHLYz9HZakZpAYrZpB3NPI9ihIq7HVcvuR1pmmFhLmJU6KCUqca2QSb
 kWaSoSWL6oLX+wpJxJqJcBaxMUjnJswJXx1fkKaf4pTC9yoz5jBe86vtEvtoJAxa2H58t5GS8II
 wdX9DcUSu18BMQ07mgA==
X-Proofpoint-ORIG-GUID: XvG7F0Pe3lnnl0TOOGn17RlHbRaWqbL-
X-Proofpoint-GUID: XvG7F0Pe3lnnl0TOOGn17RlHbRaWqbL-
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6aa0fdc9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=-dXBdVp_9Me3CGyqtu0A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfXxw17rMxtEbow
 fyg1BU6aAbx1apAL8dNqNC30iOmziTr/0QWp0lV1qkkLK84Y0ohkpqc7Gf8CPmhNKyOQhW5MvM9
 cArohihsa1XqpuXPqS6+pf8bzhTatjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090072

> >   qaif-platform.c: PCM platform component. Handles DMA buffer allocation
> >   (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
> >   pointer/mmap/copy), table-driven two-level IRQ dispatch with
> >   period-elapsed notification, and component suspend/resume across power
> >   collapse.
>
> I didn't notice the suspend/resume support in the series?
You are right, the cover letter is misleading. The driver uses runtime
PM suspend/resume (pm_runtime_force_suspend/resume) for power
collapse, not PCM-level suspend/resume. Will correct the cover letter
description or any other misleading text in the next version.
-Harendra
