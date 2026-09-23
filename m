Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12872EBBA1
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146025; cv=pass; b=G3Y65aq10ASt3TQmacVsDxZRsVb9kcdbMRos+YmAxBJjuG///HWccoGF3HcKlYk9dr5kxGZFcKoUfmmrWIPc/Ys0FlnI3L1UHqCbyIVbn2xo0iIJdzJIXl/kVv91zEkmUrqi4qDn8GWG4WcWiusB/HWwioTm8MBBjVUxggD7utc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146025; c=relaxed/simple;
	bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERZUGmIYEKZn6A8XgGxzpvMM7Pj8ngYGL2wmkWRFH7fBnmP6ppXPbe61r92Kzxm8qqcpo/JECWAzoVPNOfhX1qhLv7G34LIlimT35EmfvDJfEA0tUk/aPquezDmILuQ9m/mPY+6LJKL6GW9Rfh1HWiQo+SgGorxwPoO0t3NW+Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0NI+ZSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu7617uo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0NI+ZSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu7617uo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iXjt2571476
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cd+UFMshbHHucxt9icv2dTeV
	fo16suRl9lwtg+OQtVI=; b=L0NI+ZSJlV3Fd2XeEnpmo5NEe25PmSIOXXdpkttX
	IVOndk1jMctIIuvuK1SG1T2sDsJos7ZGj3mmMSlPNsCLZW/LZQlFQdTn7ySN3kO/
	B7xnRuauL9/BvkQgzsM2HnCcLbD0IahICZKJuBikHWiHzWo4N+p2AXRy8nKUHJYY
	+K5lRjvKzhb+gsphYWl7poiskWTxYq13PhH0XmJpT1RRXgKk4SEUhYWUDaxCZbew
	64zvE/tWlrTz9wlj1eDBp8XkvVsPiXA4Nv0GlKMvUOmOfej5PoHda74iJ5P/nwTg
	rOV4itroE9Yp2Bxx3t89ZIW3itiZSEhuZ3QMJR4nVNmhVg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux862yqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eddfe28b4so15340127b3.3
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790146015; cv=none;
        d=google.com; s=arc-20260327;
        b=eznnW3jzIH0Gp9L0B3HlRSGF353susgBQ9XVqwMWTqv+9hCuLg9DKiGQFY7nMOpl/F
         Yzna34iCxztfBDbqVvkucbnbq7K8hqldEmFW4nODKCnvEoPG7+FlZVVTovySDgAnuLU0
         ZfQe0zWeA1Ld1xS0p5yDRMH6sZPR17e/bDY9/BLiatc5rtmxGSoqsTCNFADF/X8w+CC/
         3k61pz+7jCjxf7nzYrfdlhupT0ZlCxokTfZhSj3mJzRo8m8OolU4zPfoA0Kl6qKV0W2k
         xs7v+uZohl29mBw6AagEjmcozj1DUHEzWMo14fMfs/trHZRSev91IqSlkq2ju/py+hbX
         2oZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        fh=O204hD2sDpLg65cY8KpZ0dr1+4S6XeB3CSe+Y4FegiE=;
        b=M2vOfUURhQ4zfG4ybKIZ16sJXAC5UC8kDqDoWGHqhjvwq5l+AipWbAlvNDm/yM/xDo
         o7FmJrs4lyI2ZhAVGuG+NQCLJpBFmy89hFJtY5AJ/4ccpzrWHmFZ+RSelGlg9E82nruF
         oSs2cYOvw+xle0a8S7kxmY4SCRmB9I1QWRqLi7j6ZS1PKcnN1tBkwlneGPhf1NSH49FU
         E7HbDO1RSKGnIrZwV5x6fwGoetabKK4oVy5/UGC/2WWW4BXd8xrJkFWWc1yOLcOE2HpA
         vaxdJA2ftGxbh9KikaM7xXdajPoLk0+1qgWNWkTw/dQBdHYfHvox57ZZ9Hk+/WeMFiku
         HuzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146015; x=1790750815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=Hu7617uoFzQUVQWB96mh4fqXtX6fplDdYJ9oWJJCwCqwH1aElCs5v4S9h6LXP4tB6m
         g5RQh0hJ5JTurFvE7HKh7aX2XArEvOxO1S7LkElg92rnwjefhAuvMw3/f9YRGh97WIwj
         TP3Ue1Ui2uq7zliRm1ppy7pES2+NttBzmk0jEqDK6q8g6q1IzDDhEly3dPqXu/G9MNJe
         PTHCvjhk1UjpEUWIqAampIcHrrOaUJOzfzaSmP8VcFS5RaOkE7o9pSaabKl/F9rEaXMV
         KJcnIZBMaHqVHaUIxrJPcNkvEvznZbxOLZli7WF7LWMRQlZ5fPMEuWOvIiscObpzV66k
         u6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146015; x=1790750815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=WXi2qwljknO2jiw89GeuqVrX+IkWYz/6CTvgl+9qq94+63/QGQjTlp2MJvkw9P2N2X
         jjX5tJK/ayJ2UiyE5/7QVrzR/B/nm49WxXHqSM/FWUomzCVqk1CimvyruXq1/hSRSKIh
         E1ucShvWF4fREVU/MwzgekYqEaNnfaOQBKN3WpImHpOxOFulc0LG0Ajz4WB5YB60nbQf
         P8nsJzKoznz55p2fdpPzZv4CKldRNyEGLa1VBpo3MXT5cRyUf5+m7AoJBbYECjHkxEoQ
         ZuyhWEQxzvMg7bzNm4stDyqQ0QB+9+prwCtKXVmFHFllYEIgmnfCuhlXiai4TUDF7she
         SuKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvfz8EsOZuSYcJ/OLbYYoJQBbtT0ItiixyQey1+rpUV8EW1zeKjLkiLR6SgfMRptQa3leIKJvKEZNblw==@vger.kernel.org
X-Gm-Message-State: AFuF++k6X1cS5zvL0PVqijY1Z87Ub0wWlv1LNv/VW84mER0MNpZ9QocW
	hBwCqAdCOMNWV7z1I9qb5NcVrri49kY8y0Qf/f4To/ZRKie2y00WfYLSAcWs8NUMZ0NUuW/uufj
	2mlo2w3HUjCWHqtZkO7F9Xvi+6dFPzk20ATfqClUFee3W2Ie1MghOqdfI4T087B/hUafh1ij0L3
	uy1zd5f630niMi39y1UlW68Wfw8QXaTKzFOHedI4LR
X-Gm-Gg: AYBFou0b+ED1j6YomRvcUPeQ6K26q374fMxp5+PAj+xB+7+9izEXjsiZRflUCAOkPqa
	5r8I/fKokkvh6fxnx5HxvYVpEB8JXJEVBKeZBr3ztyTX+Xd0j+DwUb3I+WTJxlHO1NNyzIUT/2k
	WMfb2jwQiQzb+R57fFL1ApgbPqp/F/5all8INba0Vu0tahc9++Dlyv7P5q5A==
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id 00721157ae682-8a45afa5e61mr11724867b3.42.1790146015230;
        Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id
 00721157ae682-8a45afa5e61mr11724697b3.42.1790146014877; Tue, 22 Sep 2026
 23:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com> <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
In-Reply-To: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:16:44 +0530
X-Gm-Features: AclHuK8RmfarfYcyic1FK0k471Xfoy9CjVOJ3A0odhXQDN9UmnemC72i7Itidw0
Message-ID: <CAC-tS8DO3SpVLapNr-VVVQdqQgNMmd8oX0Fizg=sqSs-iNQ2nw@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
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
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: sHvgjpuxmiBO4B9zALVDtm747OJxwAON
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX/YuRD5z1BHJc
 Qrf/p6cQ5yjf+6Bt20zmOejzOZZJM6Vat4bOoXV/SUGVb9vSJ6ciUEFVwaKUFBW6r3feKDDxowc
 Jh1R5cTEprubH2fDW5/iVuy7coXr0tM=
X-Proofpoint-ORIG-GUID: sHvgjpuxmiBO4B9zALVDtm747OJxwAON
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab375df cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U4cKQ1tlMYw-BQMU8JwA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX2ErxsYQnmSnU
 7cK4QGM3ToS9PCwi4ecUSBuryGIdeVXD2/+SHHQ34021KGzSSsT8bkH2iAtrKN6e1gbcDe+yk8Y
 bjAtzHDiKy+lU/Y4OSZfbWMDq461IvStsaK/Rc1OE7gZ9R0DMKfzeAnUPf6e+qusezhFNclt8N8
 anCA7EAc64ZeSPVQOCvWNdMj6DkfFR6S9N9DdJ44ibj94iBWUzhTKuoNAjNndMBNBlhxRtD2vTc
 20FxPBgnuVysHKbIfJ5a3WCI/kBo2StpCizYcjqGu+m1p99LqeK5YY/7qZ5xt8JnBDV5D+EfeW8
 X/m/KBZwbPo3p/1SPSJTXUTAT+dst2WuPd0iRUNfApk7gpicyQBCuQYn1VprPuG26cVLxmqwc+D
 fEe9B+012Oli8qk1okyuEHy9PJQTmZN/0PP1/GT6n3XwSmKAdxubIskcrDF6pB02/CVu2UD/Hum
 EAZ7WxfpA87kT4wKlSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230026

> > header for QAIF DAI and AIF interface IDs.
> > index 3a99703dbc4a..f08c20c84c60 100644
> > --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> > +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>
> Please drop this DAI ID change from this series.
>
> I have posted a separate series for these DAI ID additions since they
> are required by other Qualcomm platforms as well.
>
> https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/
>
> Keeping them separate avoids blocking those board enablements and allows
> this series to remain focused on the Shikra-specific changes.
>
> Best Regards,
> Rafi.
>
Sure. I will be addressing this in the next version.
-Harendra
