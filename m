Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21EB3E3DBC
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552748; cv=pass; b=K162gKYYnpqhgcSI0Paj/Mk94EKMP6Kdm056F0BkEnMI/lsnPnOnJkkJEDe0/9kY0pfAl31ZOxP44nwJbuO0a489E1zEz7ctUP37SrcjO7xBvDdMiE1FHLsxOeH4kZvrcr7Y3n+tAVTOabhKSWxToUSVBy2pmjfxG1jGYJef9Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552748; c=relaxed/simple;
	bh=K6n5beyT7b2xC5a82nuhKtQd2qh5DqtuyS9OHA9w1qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqVFlQGpp5DvSVMmdTHx+G72B2Nj5BKn7xpMQFEyn17JlhGpRelnlPExdoOkxrJkZbWucmOfBBg0m2Qyd9+QmXG0nQlxjJVu39HDHHxlIw8D5ANUS5l0xb5JgN06pmhfR42AfCnobj0BvMsurDn+WrNpu1beijvL5yklk1orV5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aarzTtmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA6iQxkh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aarzTtmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA6iQxkh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R4jL2057950
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=; b=aarzTtmwCjyN2sbw
	X+Zi/X9PRU/YFpjXp3Z/g+6eiN6An3pgY7L48zEKpxjngrHImrHK5tXpywQUNFoQ
	XnOOEtPqUVv1Tyl0++WDFh6Jz/v0h0CuagulM5lsvwJRmJVoAVB9IBqtioKswfVV
	HrYN/PtNJt5x0YdO9kxIHTVDI49L3IiEyw1jN2tom8jZhW18GRXiss5OLcbXCloC
	+fF5Uq4MN5ZHdY4TPsFgi/Dzguz6Xw7Y/J+RJ/gC2PREOuGzOfFQXASOcOF+puPh
	qtbBnqX1Rs2zcY8xMsAS/ODoUvJs2chnkDkiWENSqzZq/Ta1KpGfmp88T/2JKNgn
	6WzSNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0v77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:25:41 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-845f687dfa2so54923817b3.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 23:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552741; cv=none;
        d=google.com; s=arc-20260327;
        b=cd1bcAIo3fDPyg0lNJTJz5/K/XcD4nAaQhraPvsCduvfVnkLr7odEjxOsYsZCr49ko
         JL7P9jBuux2WYi+wnQncqhCgcWLqvvp1kz1a5mTKLkuiXCY292FsGuBUukd1TvGH6eBN
         evSieDcAs/OSSZW8c8M6XMi+ybvN9W4KI/vGfqxVYasCUymS/5T+b3g5pK+zoDl2Dulg
         Tu5qGqcRO+o5BvXIRoKRhmYig8XBtytuB+K0djz38keXqEDFe3oUO8WSJOtPvN9hKOcq
         E+JqoZE4GRLemURFtYFx0/rdncDJ9t49URCjbSnBEaGK5n2fVlk2jw9HqiLZp6sIeRoU
         LqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        fh=gORNQF7+rD4DQ0bT/jD750EGmXjXqkCmN9P8eKHtjYw=;
        b=Zlupxs+Kb+T+MGoFAvKi4uxdvQskh62dYEYcUQb7jrX2QdfrCvENn2sk3Z9ly1jKLz
         qnzo+vL0OCZwdfQzRW9WE/9cP6VmYWyG4/YI9aOHd9fTakOARIwH/q4yGWoSr5cMcqwF
         ln++Mcp6C5yEkLJ9fGLN0QaW40klWwdbLYiXffCESiHHhzM0aKYcxQ9nI41nXoKLF74R
         VE1WWzskIVGyec26Sgp3K16yKf7ThWh/djpkrXCmrG+FfrMw3Wn4AMc+2tZKTvx1ZZGr
         2D1CucjF7KWE9nlj7fsmm5flR3M7WEzHggiQZlI3atnzDpmobMxOoB7JJ5Z9bzHrr0I3
         nxbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552741; x=1788157541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=YA6iQxkhtNvmZaNj3f4vczlRP1KqwPdmmp5ApJBUAkfCnn9twF51BDFhVBMDee+1Ez
         YtcUEyFFQxV+Nfz57WM44B3QQzH1sjTcplPir8az25Yr8FNfuqbPIdWVtQubW2Ouswrb
         6HQ9nAQEQoQKRuvzyuf66jdROdT36IBYrtXInITk1seo0m5bXwjdnAwqDBLiNso+U/qK
         gw062cdgosalO3axeWCB3fQb7kQ04r2rCbJuXyctyujOpMEkEwoi51Fbrtnf9HNsyI5d
         KzUDHeHowbKfRmhXnO0HgOHR3sFvfQORXgWNxok+AH5q7xpjo+y0Jm634UHbghe2cT2t
         ybvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552741; x=1788157541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=giHGUYYig4qG0A/VtQzF0PpFPte65NnLISSYJvkLbjTMdIQyXmvZu1os3PGvDm+yZ9
         sfWULRPc06nI+BgvParGZUmdpalbYM2uA8BE2RL3EU1SZVGAWz1omYQukzlrRAgcyHhB
         dlq11VHofFPxspsUwDlS582UUOtfGMl/E+ZkLTym2ckBVIRyIcCRU/7t8475mDQuiC3y
         +9I9pW1wzUCM23WOGA3rn7Sb/tmD9wiAoDax2s3EPEjQ8Xj8zHjF2cbQMt0xYT38I39d
         icmBujzflkegKNoMegzNh9wz0zjlKMB2AvSKHy+5OEyuao76bP9UoA3pJ4zkNcXRnell
         Recg==
X-Forwarded-Encrypted: i=1; AHgh+RrqunAHdetX/rPjns39Pfm4n08eX50aVj4b4vB/sdpxjvHnDivFwb8NomUZkDvsv4U6DT+7eWSMSnvttw==@vger.kernel.org
X-Gm-Message-State: AFuF++nRGQW2eIgsepNtWVhAoMtxKwYD+u3atlbK1EH20l09YSKtBoWg
	ozXEtwZLh3dhzXNZAvZUWcSu3uznCkD65dBGKpGFhm7nSS52ahek8tFQBSIEozDtnhUokUriWoA
	AtLXzQ9ojMQGMx6WUaiLOBzCjBxVkKOeeXCDdu9TQ8dhvWT44eORji5njdmshHV1wz5ASmGIQCB
	9mjGluHOeOEAWeen/WHTiimyPhQY2YxYByEZ2q4zfv
X-Gm-Gg: AR+sD12NzPOcUW13L7KDjWJIaKJA6hIHLHjDniwAW+bMEk1fl+rtJ/cz/BLY5pOvT/j
	Svni/AsV5oFwmKKELwyltvQnW05nPUtoK15DZWOFVNJDvrPY3RJW1BgvpHe/S+15hVbNdZSVha6
	6pJWLb8yzW8jVbROahcMuGXfIGd9VXsFfkQ2n425W9xL2yCS/7F/sUGnXSWZA=
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id 00721157ae682-84c98c15838mr61606427b3.23.1787552740916;
        Sun, 23 Aug 2026 23:25:40 -0700 (PDT)
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id
 00721157ae682-84c98c15838mr61606227b3.23.1787552740496; Sun, 23 Aug 2026
 23:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com> <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
In-Reply-To: <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:55:29 +0530
X-Gm-Features: AcwNN1XHf1j87QKD7cF1jGyxFPL-NX8DXn1dD1RwuLYfH38PNhcv9vuhBxW9jVs
Message-ID: <CAC-tS8D3KReZ8tJ3LZdnrUbEE36KVACDHaZ+=cDddKLgSLUgtg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name helper
 and use it in lpass-cpu and qaif-cpu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfX4qnUOyc0Gujz
 mZ/Pdk3adRVZy2FqRT6vRha/SLiMoe6VCkO/PNY4JbvTqEM1NUHILAyw+eZkJffz9xxe1W4Gf6O
 6qcDylHhmnfh0DABQf4Jd+b4awoHoJl8wcEWuKE2XlP3iD++epUsdH2btS2SEB09hNnIA+RXKE4
 yiqa8kWS9ISfuR/xw6zhmw10UM2P7pXAwHgQ3oExWGx+bPy4KQpDtU1llAuWBFrnHUIAcigP0WM
 X8eA8/GOIVc8D9wgbMABBiKDb+vYoB26NPbxIQXLoYqVVBO8qJnCQpNuWjO4Xo0kVjv/bZ3dnMF
 8diyfbBROvli/ceIcOhRh+KmSltCJ04djYJ/6rgtr9I6Ml+8QqzP/MmGGJgDELNRkfER5pYnkp0
 yl/NwdgabR/q5rUGOOUAz40llBaZKPTd2mZ/3LbwMniIBieiMKNKBUqDeKr5DH8N343gszbd70b
 67ncpY1lyX0syWnP3uQ==
X-Proofpoint-GUID: Z6eG7WVW2eSscvCAdErwIbosfvlZhYJb
X-Proofpoint-ORIG-GUID: Z6eG7WVW2eSscvCAdErwIbosfvlZhYJb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfX/wmlKRVDRCv4
 im8XfAOpThLqz8byAmpcPN1JD85GKGWy212uv6vZFg3rUgMrthULrxstEIdDeWqh77lA2+B4iit
 ktM4ttJSXE7mdzQfl7QgsFfrZHVzpD4=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8be3e5 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=Z5INuiQzEjELwub_QUcA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240054

On Thu, Jul 2, 2026 at 12:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:52PM +0530, Harendra Gautam wrote:
> > Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
> > phandle argument to a DAI name by searching the component's DAI driver
> > array by ID. Each driver currently implements this identically.
>
> Heh? Identically? So why even doing this?
>
>  +
> > +static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *compon=
ent,
> > +                                   const struct of_phandle_args *args,
> > +                                   const char **dai_name)
> > +{
> > +     struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(c=
omponent);
> > +     const struct qaif_variant *v =3D drvdata->variant;
> > +
> > +     return asoc_qcom_of_xlate_dai_name(v->dai_driver,
> > +                                        v->num_dai, args, dai_name);
> > +}
> > +
> > +static const struct snd_soc_component_driver qaif_cpu_comp_driver =3D =
{
> > +     .name =3D "qaif-cpu",
> > +     .of_xlate_dai_name =3D qaif_cpu_of_xlate_dai_name,
>
> I miss something - qaif_cpu_of_xlate_dai_name() wrapper and
> lpass_cpu_of_xlate_dai_name() are identical. Why can't you use
> asoc_qcom_of_xlate_dai_name() here directly (or
> lpass_cpu_of_xlate_dai_name() without all this renaming)?
>
>
>
> Best regards,
> Krzysztof
>
Will address this in next patchset.
-Harendra
