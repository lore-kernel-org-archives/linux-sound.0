Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793001611;
	b=nqIjk5sQQtjig2tQFSyl+nlInGVYj2XM6PPhvqTVc3OP3Q4M8zUr2Ge2nTOIgOZdIatm
	 y1yD7jEE0+c47X2KGXhMbB17MFnmt9jP3RmmNjhYqvcZo6KRaDlylhPytEr5eCIGHTzxf
	 l/3ncGlZVk1NEk8/Xs2Cc9aC78wu5TkH8yaVKMnQwTonErZteC3f1hNDi8jBWSj4jszlg
	 UO55USlXjjGV3ZC6nLMd4xcA7f04aBpsjwY1gYm7dH4lE8ZfYiudIjPm2L754KPbDyFR+
	 MAtIopJeDfDfa/j/dBxYLYMEAzasTfjMKM00iVyN/ZSi8l6xPNIrDi5/Avk4/r29tFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
	b=Mx+7TeP7SuG2G26cdmqGKgqjnL6boZ+sHPy3H6c3y+n8U0p/yrkwKygRrBSgaz3eyNkQ
	 18t7vfxZhrEgKCmmG5Hjy1lZqdZjeFZZ2GeoAV3HCyoMYrxABUwegUxfdSAQ3QEOIuSL2
	 ay5hLmSGwRfq8MsEL4o773kqyftHUIhqm5qX732u018UbJH/GCRbfW9wvF3JucvaNMXpM
	 JsnvjVJ+rmYHNgmX7YyHJNLHrlkCiju06RSI3wkj5P2PvCduzwWaFKlqEDnl6hKi/eGqu
	 c9U1Mb4rMaQi810dCMeMuHHFhYwt/0OnIT7/R3W9Me6AayvV77IQTMtWsb5gPf3cJSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6469606A31E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6469606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7X31907968
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=; b=FZNNPCyc84uvbmU2
	vLsuCZW7hbFubv78YAxU64lJocnrpHdoL9Uwlk3a5sKT+x2V0MpzVOlBQlz1wV8m
	AmyXiOR2d21OeNNBzEHBFcNQuoBn3mYmDbEZ3AOSXcn5H3M8l7ToB1fax0nKrg/l
	8PyyJUYNXqoOGUcqSNuEse0Af3VTl0moMF+I0LyCczV1KwhnsdrGXcuYEmAMCCNS
	IKe7Iw+AzMDdHKE45s+g5FVoKDCUQtNOq7dQXxVdZQ1IxMg/x9852a+L2bmEQWNg
	S/QCAURezUc8uz3Xc5s0x5qXQ+5CFkxwqEpipt3YJLUWpP6avPzy3cfDYlEuiL40
	Ye0FVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnerr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 08:00:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1269302a91.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 01:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793001609; cv=none;
        d=google.com; s=arc-20260327;
        b=BySD32w59PQC7YkqFL88SvMORdGSPTnt+XRz7XIYAt+yg47zpBTRDQC87Zl1Z2byYF
         zofjYujBba7zHAM64SETXobtxJucdK8SEyDLLxcGNBBY4hTukA01rt7BaEhFAQfby//F
         DDKn/ufe24FUbqQFRla4YaA5s22LBdZ9JWCaj6+LdEVPB83d0UPPtdkI39xLmGaOkbFS
         3t3xsyFuA/z2uL6O25YGJG9EEydicw4mmWt7FLAHuhgFf7LgNPcQTAN0QmdyYmz7Kx79
         KHiIz97Og4yU683MUi8U74VI4hT3rA94vgYHfUByLZJFk+mRexZUo0GJKkxJ5UXv3MNg
         +aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        fh=8Fos5nmUKUsHghIwT1JvkkH7OI9r/Gh2G+DH/KiSj08=;
        b=tB+avVmDj5UrCx3kZj1Ikm75xNiP8PQishg3uEEKTB1+QyT4NJNNmETxOl+xklpAxP
         5PfkMIhUl0T3XSysx6gPLXAjeq20X8PSw3oyKBGalhlj53rJUVNl4q8Uj+46MQlE5fG5
         9zTs/jVZIm0wHZNgEuxYk8SR94tI/OCE+y8LAemmIKAZVI43jPQ8h3C0MG00uoIw0xNF
         BoaifQYGFah9+x4LMEwz0DlvDoR6kdQvvha1RsBALGPMf6J+QgqKJJiJVMkpyhJbDgXd
         V0Aret9TKSjyMubNrPEc6XLwo0aLXhBhc1UWSA3hmdhv3dz/K0IPaDC+uzyl0WvuNJ4+
         gEzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793001609; x=1793606409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=VUgYoZLj2Ul3mH9AcX6oFoU764ymNdteIlZhSQ5OZP8YdLtxN5AzMI7hT3xvDZ7UVq
         K4DGYKT+dMR15vrtDJ5Q+euaWHV9wChoPhWJqgV3WDkjEqSURiYyrWy/ogu5GGgj2mKq
         h+V9oQm22fUZWc2jdugm2IurYsI7pa9WGZpxdsYIO6alpvK7s40ysH4rcvD9SJ1sPLZc
         LltzTdb1uWUUZErSxdmXsP591D0IpHxvqTirlwMVWTMXtLl4TJplD/oYvyX1rt6S6jSS
         JPush5E6rY2TPM2+iQ3sMxmmR83YWSgGlLq9XlSbhIrDnGOJzB52qSunL8f3u/vqOHdZ
         9q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001609; x=1793606409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=tNzLPguPFOyZi5dAEUvARyQM21O1C2scu0J/KyNS8ZhS/4dzMMYt2xOkDP+x0oip1j
         yxGgkm1p3Wm6pS384icF7BgggtaDqDXOzYdEn0LnMcRCjthyMwUlwZyW6zReRgbXUufx
         8CNsgGSDgwDkPrrpGoFNdGPdgSlYtrGB1N2lFPVcdY8HYcKiS8MJgWwOOCxYMwPePhUm
         wLldJL9ezsawy8I9KspklHoCF0fvJ5DsirrgsVG5pM6wSm5nz7rEgbLtlHhbPu0WH8MP
         UpytmFQ2KSbI75SqA/Arvt1TZcLnhW24ROKVmEvFXT868qcSVsJz/gXmcZ1xfD2YGqu7
         JQMg==
X-Forwarded-Encrypted: i=1; AKwUvBzgej8run7Ffevb1GXrZSA5xnXgImql/xhWcckt+RET2ONMC9xtutulfjyLfZFoGB0JZD4FXb29S+wDqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYII18qjVCgX2dUBx/pS2KdeGb3ExdTtPYvLQsNN2ZuTkRi69QvT
	uKSZG0/ea/IquhRBLCZLoYQMEW+dUBMAxkP5e/oFMKWwmeJvPyZ4uJTIy4dt5p5/TAv4xyM8v3g
	GHwArtnRM547MHjIbgtna+xaqQ9IZt3k0bFMAdXQ/lnVRbkhLSK6ERqXPyD5azVu3T4hs3L9tvV
	O/a9o0Bz+1smWBiQ1W9OST6bh6UrW44w7Q6MAGHXMb
X-Gm-Gg: AYBFou2Igqv5VwfpmKwhx2lEGp8M9AZz/Iws7ZyNsr4bMf4wGe9D5P6BXdzke49/ETx
	UnXIKn8Us36CLVaIJv5zrqxJaWgHAmm6xOeIJvPX2wKCsNhaiUqlsFLd8EiXQdnVRpCu5oHoKMi
	dnGrulc5GaxhYg/HYW95VTwbu+m239jTMcglK4RSsIm7hOSTXlSYlIfUzWGg==
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3adeaff8065mr5626659a91.51.1793001608541;
        Mon, 26 Oct 2026 01:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id
 98e67ed59e1d1-3adeaff8065mr5626619a91.51.1793001607894; Mon, 26 Oct 2026
 01:00:07 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com> <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
In-Reply-To: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:59:56 +0800
X-Gm-Features: AclHuK93uyU_SxCgBpB4-_dBDgLh4eV2_m8sdQ9jjZ4Hh87n-yd-DVVLCW3wDMQ
Message-ID: <CAFkd8hs4K+P=6oOjUc83hVKx-AWNn+kGbB3pWuXOTwgES+yRnQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 7LVhuaZQaezfrfGeWd88aCxT76HTXEvN
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf0889 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ftKU7t2rRAnlxZ0-E5sA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7LVhuaZQaezfrfGeWd88aCxT76HTXEvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfXzZRXTxORmNqp
 Rm+hDAbNs6o8D/OuVR3r1fF+IcjCm+s5dnsCvVqNJrUFdBPL+sQqoBavGh/gZxatoP3odlhTEVK
 /CztZpMh0ihDXxGTZwTDSYsFZrhEd6zDvkVbaZq79xW0bsyEAl76IfpuMpdDQ5q1Eec50l9zCwL
 xwTaYZQmdH5XmgajZ/2QCGNhMuf/U1XW5xs8UfYN4Aeg9mK09HuNxtqVqcNvG8dvLwq22hhqRfX
 iSw778Dr5Vhi00KP0KNYoA9ZUJf0JvmrhjzIyKUhMZIkiy1oU1mqsbwU1iBPPMXA3zLMquYHmB0
 Mgk0NvrvT4E3mPp3iSqi3v/28xlDWlFOARcfuGDqS6/s49ZQ4q/uksIUtUhRlWppeKkLDbX3958
 CLyBrPawwBtUxUwaSxA7JR7XEsuyZScfaFb87BmQQeIqDUkV0gpso76BiOFUuItobXcXtC0kUEG
 zmMkcglW8MggFP7pefw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfX/Rw8ZXDlVwpw
 zfe2xQHvXVX6Ock9xZGF/2+ipfhOmz3174Xv9aY8OkC27ToZa5DgmnfAT9PaouvnE7SMaCa/tjC
 FvWPqy/YhqFQq0yFAUG6s/YKhxs3cD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260031

On Mon, Oct 26, 2026 at 2:19=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_chann=
els)
> >   {
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > +     memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> > +
> > +     switch (num_channels) {
> > +     case 1:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             break;
> > +     case 2:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             break;
> > +     case 3:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             break;
> > +     case 4:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LS;
> > +             ch_map[3] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 5:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             ch_map[3] =3D PCM_CHANNEL_LS;
> > +             ch_map[4] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 6:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 7:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_CS;
> > +             break;
> > +     case 8:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_LB;
> > +             ch_map[7] =3D PCM_CHANNEL_RB;
> > +             break;
> >       }
> >   }
> >   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
>
> audioreach_set_default_channel_mapping() silently leaves an all-zero chan=
nel map for unsupported channel counts.
> Since this helper is exported and callers such as q6apm_dai_prepare/q6dma=
_hw_params/q6hdmi_hw_params() don't validate the range.
>
> would it make sense to return -EINVAL for unsupported values and have cal=
lers propagate the error?

Thanks Prasad,

Then we can directly reuse q6dsp_map_channels to make it simpler.
Will update.

Thanks
