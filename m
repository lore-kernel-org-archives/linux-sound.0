Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BCD48E0CC
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588315; cv=pass; b=bl77vzJ+Or4JqbtwfzpXqtLp5hYuVVZjysFAO01MQPBodelq//rTAw05ewoboBogmPSFQ7TUA+1N8m2fzJsOLcETX+HPDmM6xkFP8avz0CMVPxTdwmkCnq8eN1Ih7xTT9zFfnICEVNWHjAGqWFXY2FtSrBQ67wgcwKA2n/IRqfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588315; c=relaxed/simple;
	bh=/RX3rQHRs9PtVs0cxd9dcGbugZQcOH3eLVd4N7Lge0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUkaZRVjLfTM9v+7ermmMoBQ8OLdtPz2lhTTJNbWkMFem75BVmkJPOLFA8Qy1SWhIiTejxZP4Yuj6G1HoYGg2XmCQCBtZuuvILhcS3a4wNR0jnRdlM7VK5WZQ1QrW4OiWxfWWcEhS8zYd8x5sPBH6eu5b0o5xk7frWmiZS8gEOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwJD3Va0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxj/cd3e; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwJD3Va0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxj/cd3e"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M9xb1195737
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BPiJa4wM+ql2ke3koOa4WOH6
	Ghoz+qC0PRzupT+f3yw=; b=kwJD3Va0p6p5enT0D3F3QW2FS+/bFJnN68ccCr9W
	Q+1+DSMYW14B0hTklTg+c6mDONXWr4OqWLfUVM8argAU8VcezIUI0s5s3ABCtsgP
	bl2b++U5ziLih/EyXrczhdYME3yJAb1iAzf0tOm6U6Vrrt/v5kqqgIrh4z/X8N92
	RUqjIOBDLzA+opLFdf14PxwCBCBAkHw4grj7VjPBka3UBeqJUZV9QKgoI7KIWfl6
	E8hOANSrM3RyFLSDLlmvArez18dtXrYQMLjF6JlKY1Qk3pxWwKjs/1t4A9KeERzC
	Jxh1k2i9CWC1SbHAz60ALxd2Pl8gJ5wdQdfHLrQfnSlppg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0wnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-85da2b96c35so39130207b3.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 02:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588312; cv=none;
        d=google.com; s=arc-20260327;
        b=eioDPUTMvyJyfD7xiDCdjVD85Thq96vPVT4+Gw2GE/ETN0K1nPk5RrMWi4Qyjqp5bV
         ZmQvFnBtBZ5ACho6dXF2caZNNXzl+tA+29LGa48PVS8XLl80Z0lfHJE2B1XzbloAl0sj
         6RWAEf2dQnecG6Ds4ppZSaXysHFCYvxkmvpQsnYV2yHc9sVwZP3wCYwH/fYYP8GO1wbK
         4d1G1NS+6d8MCGKY6KKNCYGgIcLQCTeTD1gAG8HjXiDWtmOeji3X9uqYV1N4djZzK0k+
         5DSMQbI9jV2aCtnFRH2Aco4VOlihXVBxgcDUn22hjUelPZJvdZGeMME1TAYwOwogbKoF
         c8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        fh=Jc4XjAYsxDV7zdiu8fw4svw9Mdre3lF0wOXVKUkNzmg=;
        b=PqYRXIWCBkxxrd8s87ThNxFfzoxZFB19sJmWN+2Nf6cINcXLep2mI4ioQxV0gaj+Pk
         BjTEHeh0iubGylAvZrn8VOUikQrU/JnuaUCNi9rwNHOABuJvEL792AXn3yMSxeyHBhh5
         SN6Hij9mEC4DGAOpZz3rNROxTicXxsQ9/2dgI1RG3uLZHYEgT01WLXmG8cJbjr+nO+gX
         wJyx/ZE09o6CDK3lsCqqUMrT8Lg6WwviAxoUQXsKzWZpzGJWd+rkZG06h3ms7pY9GhdY
         qzhJyAW9sRviclWtTnhyMVN8UALLnwRHQh3tVaqxr/ujdgN8Xi9FULeb5eY6qroTYB2L
         P68A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790588312; x=1791193112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=Bxj/cd3e11QO/RButch5Czc30+iQc4YBze6Xa1XufUwLBohcfiocW1+Cd3JCwDjMbs
         XTiKKrase7Efj5wCi1irQgSaKEttPeLRnDDz9wBZf8N/tYj2psfr98BwWCralCECJ9eG
         i+yzTF39+OjyG0IBDYZokRVXf25OzXVZXQk9xGqRC19bsRlUrdt4e7KDCShZHo6oE+4N
         CqX7SYu0C0yJ0AsihW/SaLq/mba4+x56sh0DxlsATAI16yrsJbF2vvUqHKgQsGgkxuf8
         4F7aaEkkY/8mgK8A0PU9POFp9zC61JVXLY4cuvr+v6WpIfOLjseg+diAnqumiOHNFLjU
         dkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588312; x=1791193112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=Tc5MAc5RsLp0NCiygoUBPneBt0BI1dnOmMzLYBHQsRCPPgmX9BGhcOX9+Q+hybQTm1
         d1Wn29l0niXID8IzeaI4qfZa2fQDkilfchiG+sS84S8An4FAB3qk+QW1KkGxk14hPDwb
         Xcl7BjgOfE68OyRTF2CdG0fNqumbhL/UaW3A5Eg8P4LeUW1/XkpAeui9g/HlhgQrpg/a
         aXwelVy68iCWMl5JnF9fLynZhh36t/KZe89tgAIzABwB1a7hjaL3ZIqQRrIOwpCXeT+X
         gjd8KqHf0Hh1hxh2GnqsLjt3wS248x47VO/WNceIUiku17m/hUZ/C3XBDKLqiN2OdvJD
         Bbvw==
X-Forwarded-Encrypted: i=1; AKwUvBwuPi5Q3nXRqEX3qb/bWIb9iJVHcl2dtA6TCThEntBA7Z5ksGcWZwYCTyEg8mp5IzI70P0DPrT0/OXHrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjFXL6vM6Wj/fq71EG66tBY2fHB70vGjh1ek7R/rDC1h+qEauH
	2X/72eofdifReGaReHSoteGrcQppgDRkF988Z7QULaKoHZjWFbNsrbtJY6Uoh5uU1BFfVZr0W0Z
	PyFM8PTd30a6gJaTdiIcpxJOQmQVNdeCgtMMy0pvPoOsa9LC2s4TGjL7PjFQJz26L5KklVp9yFU
	4bQOtS93MJ5NFocBl25IChoCaBuMVCZVQ3qLsBFJv4
X-Gm-Gg: AYBFou1UmW5Q4NIhKaiHI+8/DBQk0ZA0QEsYtylejbrvqehfFeQyO0gU+po62tYKiHF
	oiDrygscwfFAf5+mNMCxgazN4N1QwlGdcbsIvzoJEY9XG8BmLT55HrJJ5hhg6qk5ZI/dSaP3pTX
	2ZCt9eKvJZVk2o0WUu3Ovzd+NRTTSadO/VxCbkehrTKUoPTMCxQd+MeTOmz8E=
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id 00721157ae682-8a649f6fd99mr67447627b3.41.1790588311727;
        Mon, 28 Sep 2026 02:38:31 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id
 00721157ae682-8a649f6fd99mr67447477b3.41.1790588311305; Mon, 28 Sep 2026
 02:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com> <arOe2yA4KOvhYqRb@sirena.co.uk>
In-Reply-To: <arOe2yA4KOvhYqRb@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:08:19 +0530
X-Gm-Features: AclHuK8ozZ4LOVya0q4te54vm9li9qjkifPcUO5lK9UE0weRjOvI69Wxbge_Uuk
Message-ID: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXz6lZIaCYwPpg
 acImlH0G722QaNf6IBeq3bSwnEV1ZWo/IMINiMK04qBYwMlHYXUHyaHU8ZUHISkOK54DNYZbm5F
 VvK6K8Detajbqn3dA8cZ70E0Tq0p4CdJwPElkVC3FFliKGkif5tPdXiQq3TMSyDUBLpX0v2iHd1
 2g2hnmyC1ylfN5s5eTlBp3a7IUpUgC3XRX/MeQjuBjYll+5wJd4b23weeIOCEX3h2mNVWhbXGGk
 xrp+jIWpv/p43gbADzR9Fjf05nGh5pDtT9dgfefIuY7PdcK3rdpXPI3HLizUUP83F1ciY0Szmqj
 xrcKK37CT9FhztxdZcNbbxz8De+rCh9XKvA8BG5Hzms6EnUhjcp1MuU6h+TRDiN/rav7l5pLT8z
 3DjBMlBv1k1HIi8RKhgH7BuL2Ns7xj3yiR/eO1BsX5AwsJEBioeMN7b4IcJFM+RIcVjpn4B3X5a
 xqnyQ0bfh3ftQ1gKFTg==
X-Proofpoint-ORIG-GUID: F0H0fKjC2Mca0XBmAhqbpX5Gvf1bAC3o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXyOuqGYUdXvSc
 QjauHnEKXazfd1dUo7IXR6Gy6KE0go2d0fRYWvS4bPzU1XlOSlHa/Cn+AmOCQQcfN3+5jJtmz3W
 loCs8gHtUcoARS08BmIWGrtYTD/iw7w=
X-Proofpoint-GUID: F0H0fKjC2Mca0XBmAhqbpX5Gvf1bAC3o
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba3598 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=RlkvObwyMWO3Bv68wiAA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038

>
> > +     /*
> > +      * The sync, lane and frame configuration and the MI2S bit clock are
> > +      * shared by both directions of an AIF. Concurrent playback and
> > +      * capture on the same interface are therefore expected to use a
> > +      * compatible format, rate and slot configuration.
> > +      */
>
> What enforces this?
Both directions share the bit clock and slot width, so rate and sample
bits must match on concurrent streams. Would adding symmetric_rate and
symmetric_sample_bits to the AIF DAI entries work?


> > +             case SND_SOC_DAIFMT_I2S:
> > +                     cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> > +                     cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> > +                     cfg->invert_sync = true;
> > +                     break;
>
> Does this line up with the clock inversion in set_fmt()?
invert_sync for I2S is set at probe via DT parse but the INV_MASK
switch in set_fmt() could incorrectly clear it. Will fix it in the
next version.
-Harendra
