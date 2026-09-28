Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDFB3C1D79
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597892; cv=pass; b=mapng8oHrVHmqGibtVHViQatqf4QGzQoGEI0Zw8VfLDtIvIEzWWPoFGzNa6aPG1HR41BR0wZGt0QkB5CEM//iJ9C9kG2I6CgSXn2nZz92wYGWHTvRCf9q3l4zxsGPgls8nnHl/xTLq4CYwiGbI/rfyC3MCT9gKz4ugzXbQJ5pDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597892; c=relaxed/simple;
	bh=QD+IP/JQeXFvG68TvIWuMoLOYB24jv3h0RzVmWZVzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/4BGwdIREqKDmtkoHupQ8iTbF/NCSWzKxRJGTWPJl5U1Fgvw/omdpgKuwGW32/RjbsTSGowf++M7kAavnU/RJWh9g77R4vB4wEQfC+YneF3+/AQJSa6GClrZkUUShq/nxcLHnwWOXfM06MckuoUzbl7eeL/0U9GUuRvnIr1SzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7IJNSFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmTc9wGU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7IJNSFc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmTc9wGU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBATnU782816
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=; b=F7IJNSFc4XLasLfh
	wmCm3cOuG1L32UjmoTkxsrcwdVAUOlzyb3CB/oKsvkNsdaBJpOWSQ+n1VFj+XMEN
	Kr75rJwm4IQ+BrJcwP9H9r05BmcCZ3ZuW1+gasBqKJZ49SHE8wYg0ycVny2i/yoQ
	3HKo3yopBMQL6EfHeJSpNGrThfOrRdS4kXbcV7sxk6B7NS9e6eLttyf7iW4XcImH
	ZSqb+W/fFfPdv2ejzE4ywZsTAiBf7h1P/jIUy9Y7Qiyw4fDNSGhFYKA2bxxjw0jF
	sqIlvYUu4kfvg4GeWeuOxXy1QHIL3DXBqagYCgeKpXv4kGwq8RsyJeyLRXI+fQlN
	qm3aMw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4ad9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-674153ece6bso2681369d50.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597889; cv=none;
        d=google.com; s=arc-20260327;
        b=qkt7AgjS8O7ItkJwdNX/JL8cw2RKgPkSPkHBym/Gphr2xhO3sPOoZPlHOM2ct21YY/
         pvVEhaINgPED5drp4PcIWiVEWQ9l/Se5H8n5R8U6UKjv6kas1sFGYqVlJ0CIeNx+LLKC
         GsIv8u+Eu7aUFE8I/s8uQIdZUBZ/D3sbEcSpdSD+rum0+QnGhBsm9IYQrLMWol7MPWzg
         ey3dsrZZpOMwT7xmgS96JEYZx8+MK8D5UXthdbZ4f2kekgnHqQhFYm86s1bJlp2d2qyG
         UyVFJ/6mzXxo/GmDfOi83HoFqbDvNoGePXSxGhxChArQNs3A9VkAUvjHvzJD88RF1LRE
         7Srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        fh=RYZPU6E6fqRejasIgJBSEXAiXWD5Tses6I46XFFPlvQ=;
        b=QaWi7c8YKposy5ZvPYD7bWOWXlrSAWqZzscAGGn4euUrdI/+sWCqEsCuIk3CNSsYC9
         c9B2AIvfpUSVCp5v1b6VuiDp6NSIQyIyCEpBbzUQirdYgMv36XFsRrQp+9ApzEbM2KHT
         jlxYtfvgT+tiZ7wh27ALtj30Aev5LRp09yJZU+qWojOGAhXYAjL0yvkxRcqZzHwdQ7cg
         BF7GTOQskV3HIkpYC0FW0v6Ocjl+F64JR0OXmdCZGZxYSwqqAijDqQR94sB6jAXDhk4w
         WtiPb8EMTwA1TkSePoIgaJdbRjGR8Dc4hi820KOBKNal90BpdVAhvSgyTYwKWE09+TG5
         TTvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790597889; x=1791202689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=FmTc9wGUwoWQb7Mh5xXHr1LAIxgIHf/0qnlkwZgp9VrPc9mmOI2yyqwXvDnQpoWQ16
         3YKJqSML/bclOi/5a9exdNjgDZvRPVAw5MZ3Un6DuonMxj27pglgB4EWr7PYFcRX46RR
         4j1C5t0V18RhUDjEmfkB9vNvYgwe4U5IlSIzANrAUjuVjuzd6MO5b+ZXW+ravr9JUXbT
         6ZVPrlKAz2he5uEP6mWPIKwoPjnftBAF1G2F1dD4eFxSCtHL5onuq9gdGkU6D9KkMTWj
         yfg+GINxIlT7k0wzG2lR0K1+kw8cmkmniNnJl3KT7o1mTztpqqih9U8bsy5vjrMXgrO9
         QUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597889; x=1791202689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=MDvpn0IwMTvpwjy701fhpllYsZ0JNNwzztjvIvntdIHwqzQunlH2V9p8t526Cydnib
         PJn4Lc4/K0/lt+qtTKm9TCOpiI+K6D3gBKRTkYjUzZZRFLmzo3KxqWB5hEUCU3vmqUkZ
         U5M8bnhNJ30ap7WesZojI0uI1Kx8zKRWmDbiFEfsghFFWwQjDmkdhd/1PTzPFrDZrvmp
         RCsIBZnI3E9KuDWflTmA9mc8KUrEubVf8YBgiJAmjvmhAKd4uWKXRHTdWkp4E7144GdV
         GAiS/bgIi1S0YZyMKAUiyIzO4PO9/49wWpacDVvNdsCJQggQm2Zs3EBAg7VT6nobnUF1
         fm6A==
X-Forwarded-Encrypted: i=1; AKwUvBzBawz7LEtiTeru1Wmvo0HsRX5YZl2LVmOo0hPwNsyEI+B+g4geTr1amfnhEHrOQL7gl7njpkBOaSzUgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ9IATDB+St+s+I+K0q1kRIvYwADdzJZTePPD2xmMHgNqnZbBd
	ZNv9cBwl+NzrSN9It3bbn7eOpmX9b5Ux4R2ef+4Cw4w58qMH/pLPmdR/YjMzOhvAykI2vwGkiLj
	IqFETx5qWcMAf48kCOCvwA6mXL/S0svsfQNpK473zfnsLavGSFuXn1SxIl1B8wIPfySuBmlgfIH
	2Ezd0ziPkswHdvTrskhdfrzVh2+lUt5qyPPeedQU9j
X-Gm-Gg: AYBFou199NeyvqU74byEqTy9gSYmzGw7DkQnBs0BiEj8Ru9zoFXqzxdB8m1XwYWsCzs
	66tLh9COptfuWMSmcDdsGdPuZsnzRs568nvyywb/nj3L72hxW9hxNIVi72I+d5Zp1pM/wj2Ex8u
	K69Ik4kDiWP7ABRM0CTFe3L2oaf8VF4fDxbdKujaIyBqCB6/afMgkcym3emg==
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id 956f58d0204a3-672ed3a1adcmr5448709d50.80.1790597889300;
        Mon, 28 Sep 2026 05:18:09 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id
 956f58d0204a3-672ed3a1adcmr5448691d50.80.1790597888749; Mon, 28 Sep 2026
 05:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
 <arOe2yA4KOvhYqRb@sirena.co.uk> <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
In-Reply-To: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:47:56 +0530
X-Gm-Features: AclHuK_s5MCzD1RecRG5TV0tZYeXGtKCs8wJ16v90jxnA5FxxzHDjGMMxqJkfeA
Message-ID: <CAC-tS8DUxJ4uD5s_BYc52v7bigMc9Mn585YGDQ_x9VaZdLe+yA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: L5-SUBNtzsKZUchKvJLAhQ4irWBR2WTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfXx74NsrheSa0j
 uNL0sqrXtfdXSPvl5gNjlAENbuH2QCnn4kG26Ws5Ce4E30QBQa4jEyY9QxBrzMQqv914hSBrk2R
 9o6FRnUvs7Skw7dgFstSYCMzXg0v9pbA1WqxJtw4wCEKB4UPqd6MA7s5TwvWLvGzM8cZq2TyS20
 Ve5YBjsdcvbERXOwj38+5syeN9Mc5d04pSXD6DOOTekNFUjDYEwfQ8K3TH8QTw5195Gy/tHwZcq
 WuYIh2ZpPlsqWU/W689uQh+R18M9Y9PXsRjgpbafPyWsRj292kx+GOINW+3T8pZhmvy05lCVPl0
 WN8eGUeOQFYFD34iPLc/vhrSGTgKcz7HdesaSqNvyjXcHIOOFnRU78D+4zY8ix1LWbZMMWTzUCd
 nVxY+qmdCqJm2QXDuZDlQT+XYdujDUz9tqdcLyuHZREuA16mgz19GpPPslSLgLB504XvI6tAllK
 B1QpM3o6vxYo806cM4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX6hf3VOOMEBym
 suW7NgZKNbkoX2jCb0yyAQxN7L6uiHfAv5sEcOC/oBS3d1PuPPNVrtLsim6EfHwYDPdYSDFZ2vq
 rXQbxGxZUu4863Iyb8klxnSgXQZmkUs=
X-Proofpoint-ORIG-GUID: L5-SUBNtzsKZUchKvJLAhQ4irWBR2WTg
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba5b02 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=6YM43U1n-Uw7COpwBTIA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280048

On Mon, Sep 28, 2026 at 3:08=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
> >
> > > +     /*
> > > +      * The sync, lane and frame configuration and the MI2S bit cloc=
k are
> > > +      * shared by both directions of an AIF. Concurrent playback and
> > > +      * capture on the same interface are therefore expected to use =
a
> > > +      * compatible format, rate and slot configuration.
> > > +      */
> >
> > What enforces this?
> Both directions share the bit clock and slot width, so rate and sample
> bits must match on concurrent streams. Would adding symmetric_rate and
> symmetric_sample_bits to the AIF DAI entries work?
>
Please ignore my earlier symmetric_rate/symmetric_sample_bits
suggestion, Playback and capture are separate DAIs on separate
dai_links so it won't work.
The comment text in hw_param() is misleading, hw_params() doesn't set
rate or bit clock (the machine driver does via set_sysclk()). It only
writes sync/lane/frame config from aif_intf_cfg[idx], fixed at probe
and via set_fmt()/set_tdm_slot(), so both directions write the same
values. Will reword the comment.
-Harendra
