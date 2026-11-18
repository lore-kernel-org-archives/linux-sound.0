Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795014608;
	b=ocfXNv5aFQQ7DXMmf7NaPt5D5WKBZSsR3poU32dPSa95St+03gZW2bXV4QF38h7k3n34
	 GpQb2y3qz6QYW1rECpJkYx7fuCH33Tv9eTiA6k9uPtTiGi6K7R0Z/HCB4GPKtSPPIFUCn
	 wuotJ3ja+Ja2frpj5r5SmnjksrYedfAHxP5hkzTWi6WiHAuro3Sw1IUjFsCPOmjJRGv5g
	 RP665QyMXz80vaDD5KwPzg5gf7QfyypSBnlrlSM0cNDu6827gA2qsAtkjaHc2n9C/A2gH
	 fVHxnirid7ywzUz5ppvMR3X6sR9IIcxSLcrdNG9GGOSj2apihl+VFHYCvjWFKdCdlmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
	b=pnV6dqgH66BFHT9gonb0n+m2vuYCauld23LKeeKKZm7yrTxu6N2AgCPl9dBmz9Kng3V/
	 EyBL+5edp5jNOhXKUCph7JvNeD01yNsrAcuvAR0IOlY76o0lytcb1ovy9Z3IWkWylaHW8
	 vlQh3S3OwMeiDZafPBAkIXdjmxi9AlNvqyyyFFl3nNnjdRfKKQOJw8D0vIelfcFhF1RtN
	 XcM/4hU2rG1RLU44WrSfBAjQVaV+ydW2n51Xx6jspdWsMVk1NRSufTQnZ4ZALXOLai5ca
	 +R7Ess2c0buyyJe1Y7nr5IRTbgWWxAavQN8beaY2esNNBl3xlOMiii/Ae6v6TY5VGiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06122606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 15:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06122606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEIDbe1431838
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 15:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=; b=bF+QsBGW2eNNOq4M
	1o18j2IRQvedJAbrFgv18WbJ0L9nfEkbNvK5p3rFjFZv3vuxdIpgImIKggAHvJhI
	gvJ0qQOFkcVPhN8o6jSom5+Sm/Rvi0Rz5vkrK+56bipuIV2WO0T1rThXxjxeOBh+
	p7YTBrZkd5bLWHYSWRQkv7LEKXTUxzwMSq7l0Mxo7gNiau4tvH/z1ObJ06M77uFm
	PNOyGElIps2VaSU5gvHBXYVzV6GXsHLLMtfDBSWJCWWPTQ16sF59kQaxF2ZkVQPX
	iJ1gUuKDwAPngixY2+6OxvBSO4747sRWXISlxP6xPhPajjFHTO/o1Fh9kjodq2Qw
	nu0Hrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrr99m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 15:10:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so1106211a12.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 07:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795014602; cv=none;
        d=google.com; s=arc-20260327;
        b=bvro2R4NZ6Yo1LPtOOuGmoDBBjcubUQCFUtdB/DYLioFyC1x13fjWs7oJ0n6wlBHdg
         OPLfWoViCG892Y7v4o5IbEBUJvDcRBR+P4EyLaIiLAWlLExLFK925R/DJmV+B676FDS7
         bb04j7DSRT1B7li3kowvJ60sg9aWxiokKqfnB7blgGckX0kyyN0qQdAhUpM5Rw7Iys+p
         1EteyYfjh40NQXpwaWq8eald/t84hYgABdSBPE+ch06XZhINDr75i1WKUjehj1AP/U7g
         EIcYLmPpgce2+lrof1+OeBSqTIPB9QNH75WmCFfI/mua7Ekw8shRLiWr2V09mLEGnvpg
         QMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        fh=rxbOC22gMxM4eSF4uTfws1IPjGq//nusoFW+R3E9ApU=;
        b=HppNe9m3bwqSu1hpAZNbrppG4nWVr/Pf0rjNsxkDfCYRM2TlQeIy7TyOLLFNYMFasm
         KA7PeJUmmcMItfw9YMjsNLe0sXcvaj/6CRL2EjH49oTW8OA/rwxkEi6pwRKzj19g5s66
         K3clJjlsmxKJb+E6KRMZy4+UT5FSGZGVgI41ZopOoCxGOk0fq4Il1y9XsF6l+TuDkYqk
         bHHBkfQDmKH7Lq2F7wTeT76V21fsJfHTtupnKRJGecIqnducyNKqyDz0g6LKFubaFoKx
         oO9LFQsMcRRBSqopN4lCl5cXv/fVBfoKfn5efdr/YyN9qTVAXFe82jNmX8O+yLKMEE7f
         gQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795014602; x=1795619402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=apikv5VNqioVqZY0y16A8FlF3b8jNYI/nngyif+HWQoTTUOmYq/WvtuOFSpC4V82Xc
         5UmCbNRdXkCZFstKPiM0uWOkdwuSgIgEMDcqbbIK6QpVoeYP8gn+ML0CTcZ1hPJ+YjtB
         jHY3Vfr6p++uEh2xcWstn1C2zJgGpkXpEreNG/JfdISPVyISQCKnNMCA21xJ+bJnFSj6
         K4asXnebzEqIcUy+77aAfeKL1ieHsEI64Lj9cD2WbFksIUKOxpHLpPEhmrB6UnfSMzby
         UStBSk4KN1pfKWaOy0ZESTbRTXu3fQ1azQIEKKMxf8dbl+vQsCExe19Fr7+VH5MzqRPM
         gPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014602; x=1795619402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=SWlxnBfjuoN17CvSv2IwPcUM4UqXzNSbzp+t1JCkytQWkNcLarKdEiL2SKpiGZfoO7
         s62kh0mSEi5kwPxaFlFaNFeckgybBO3tIHQLDMJS7/zlO6Psdbx2jK2W2szzcQsbiVM6
         c3hnU7U+w6k1JGyrtiMYM9wGUvU3lYoOhqo+uwq8hzb02+HO5UdRQiuISl2ABnmNydXW
         f7eN1NOWgS51oPDuNKAkoPnjQcwW1HR1LhAwBI0KuOxvq0JXpwNYGRmefaJUPjsSlihX
         VG8TjOUE+MrPl6xCf5+HON09fGi1paZp3uI6Aj5yOZ7IMLkm0+TCIWusu9dSGcZ1/A2e
         zYSw==
X-Forwarded-Encrypted: i=1; AL+hErHaTzG+LtA4TnyRe1QHz9A6Gx0cwEQZ89TBV6FEpEOzoOtV9PrhccBQQfi3j8Co35bN/BOMg4Jho7QT3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dd/RfEe/5l9icun7uGmUqhw/iUtuU45q+wrGncDQTqrqC0uF8
	KexPBksN8DGQq5Rq/1l3HrqrbQc8oaUunnObu469nlPgpRXOz5C2xV+bN41dYlf+IDBR51cS46s
	UeeEUD10UKeOQpwivkWh2W7UHE9y3DlhIU14JLJCZ6jCOXGAUP67Mc8MN7+hmAuPMG6JQkC5FBL
	glHo06VwqyRApNKt3jL+6J7LPqY6WSGwOv7RG+cb6phbQpZwiC
X-Gm-Gg: AYBFou25CuftmH/J1EEip9M0NAxWjW5VDNAv4mJxQjbxBTgI3Z2CGNrLw+pyZzD6frk
	rV8xSolCiUcoCw4wZo+qnn3hXGosG3tJokuQlzGaNmRThZilhU535EbOXu8zOFsgZv2SuQjUj5b
	F4kzg24s0fjPJh1wCMEtFqt/pwWYLgsNeGxMyE7qKjiIrqeMB+BkgDa+Q3Vw==
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id adf61e73a8af0-3fe980f6d1amr3184480637.46.1795014601831;
        Wed, 18 Nov 2026 07:10:01 -0800 (PST)
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id
 adf61e73a8af0-3fe980f6d1amr3184430637.46.1795014601308; Wed, 18 Nov 2026
 07:10:01 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com> <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
In-Reply-To: <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:09:50 +0800
X-Gm-Features: AclHuK9NVLbGP6CpcTR1T8ysZ9VKjGHAEIip-iOoYZVrM4ubgXtHt96rt46OEkM
Message-ID: <CAFkd8hu1K_4kfGJyuD2NeD0S=K5fPBk=9=V8Ziv3Qu89YPCxrQ@mail.gmail.com>
Subject: Re: [PATCH v4 resend] ASoC: qcom: audioreach: support multichannel
 PCM formats
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfX4svCjQX1vRGa
 hIgWzPLgBbb3dKPEjbix59wXepgmSWrYF+JX+PKY9mp6oAfgDL1nEBEMoghVm0rePcXfBcz/2XS
 /CX0ILt/B86IDXqrql2ez1f1HyxtdgAEEaXEoUwsdSx0ajgoW+JwOFhcjBV5sjnFp08FzZPOz9g
 AeCIXvxHfpCaG7KLpDUUOcycQ5Y8hZ2oYngD7oSN/OHjKcoZJH0Sy4dKqCqcRyYHaUiZcWGh2ia
 lFM/Jn8x5SSrBnCnastBj39GztiLS4XQ/r+8eFUXjf/Hy+TiLeQs7m1fe9NTAM14E/yrNZ/GVGr
 coiQVjd9gXiY/8mszuduLBX10okrrxWiIZMZm1oPYWBA+a4YVpONctkVQIaAeHVwH05AM9HGrOK
 VekYS9BOjgU57r7SogjsOOwQpl6sC0xNVXemI0nlx+IwfvyUDUBbdV9N0bfFou18MEfp6v2OX59
 BS9XbDoBRWW9EYrZQKg==
X-Proofpoint-GUID: GEHFWy7HFhsaAjxK-vyInDEAz133gcP6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfX9i2xuKITJ/9s
 UwRLBJMypOhfip2ZPYfLkxiqWB7knPnvvFlQvFQmxYynFqhfNbmWaYU9Bq1pQ3TGbiE5O1k0Z/v
 ASRxkBLKMLK6jDP4F//9CCHim5dTWcM=
X-Proofpoint-ORIG-GUID: GEHFWy7HFhsaAjxK-vyInDEAz133gcP6
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdbfcb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_LpRk2n8-sDezK4FkoYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180060

On Wed, Nov 18, 2026 at 9:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 18, 2026 at 10:32:01AM +0800, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> >
> > This prevents TDM links that expose more channels, such as the 6-channe=
l
> > playback path used on SA8797P Ride, from being configured.
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> > the common PCM channel limit definition.
> >
> > Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v4: Rebased onto sound.git/for-next at fcfcd6db32adbd
>
> v4 was this rebased onto some other commit.  If you have changed what
> you are sending, including a rebase, you need to change the version
> number otherwise both people and tools are going to have a hard time.

OK, will change to v5,

Thanks
