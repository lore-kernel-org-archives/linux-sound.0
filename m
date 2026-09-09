Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5939B484
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935198; cv=pass; b=m3GE5Oii7rde557vcaBw1Iu6oirq+8v6HB959myptVP/w+1YopjC9ohreq+ngyI+UJqiay3aBGMkT0vOvtZODNRUurqocNCj0LsyLWsi4bOOeMJBDTTXSJDalfM4G6BBwp/e94j8vFYKYM9TmcjkzdBqVbiDJ93tXhiojFKLVnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935198; c=relaxed/simple;
	bh=NKoJ6JE3E+luIRxglgalTNs8vDhX048M3Yn5LzxShXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY1KGDYvFz9DP4qsqjqfMECFzoesAm67L6RAGzqAZHjIuuk0KvqY/An2r2AeJ5+wg1BgIttFhrdHK80lej//Z63fwdsNL4cjJdlpxvNZGEpvSYG0NmwDrJctIbm8wotBSRDEy5giv0U0qIlGYCJICBBwdiZAaff0GG9J18UuUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/H5nfBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7MPN6HM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/H5nfBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7MPN6HM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mfux33817269
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 06:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=; b=L/H5nfBf/HUiNmWd
	unIzWDWxr38VJB/3XxIaweghFfymZGIYjltXc7ElRQUfChY1VY5Rb3/u4PVPAKDa
	4hYs2GtyWx2f+Tm3bFXHhaZ4L+Tp5fBJybix0R/I1LXJsrto2PAilf8fMuGokstN
	tmw3NC+20CfJgYJ5b5gDwKoMXvehV1t6CxU+6xwfwTl7WtENZwAnED3jVLPjmInt
	Oeq5+Dc0qrfWaE/E1AVq2GUGD+0JS6xnWskGiyH2YaOj0YO8d8WyviruKe/gj3mT
	jTlz1FES2ZiW5AlpvbYwxqkFOrFNmz0TFbTuLl+INGdvflkAT0WRxCPpFrAf0g/1
	SpJPtg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstu9s2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 06:26:36 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67105617528so1019150d50.2
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935195; cv=none;
        d=google.com; s=arc-20260327;
        b=F/J9b2cmR2x58Fm/VRzUZT2BDVBUKptyY64GETeK2i/XCsHqIBvMaHujjjs+IxGlmm
         8MCMHKHNAPLX2qTdbiZC2zEZ3G3orQiSKuuVBmUYugvhAs32apk7c/MHAjtxbPaXBx68
         Ha3Be7SEmRjv2DoEszF3sce8pTPGkYkDRD+E53XmS6tX9qtW7rk+GZtImakx/jX6jnZ4
         7JWsfNVuaYrdStWJagcHX5b7avGxkevza3k7RqHIIsIGHwgpY5LxCsyDyyvnBw/plvuE
         ug3CuWHLxa51yAtKLz0A16UYG7oCQUoj5UoCp9KSZ/XVbtv2d31tZGeY+iMB1u7I5ixa
         utLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        fh=3oRA4xU3xy+7XVri+SuP2oJWRVv6B528/wWsc4eM7eU=;
        b=LlTNnVMhUvn7Z8Wxro1glh+u8z9P7xpn+Y05xt3hg1Gjwjl7V7y69h/4IMSbVVRaXB
         D/tQoQntTQvox2OYnphsVRbWP86vAqeP2T7TM088E8E+n6WNkzVeXLTxzL9d2vdM4wAq
         366dXMGb9PssLvkmdnc1vTLthhzPQRskF7sJKQ+Q7wV0zIts7q1XOCHXaK4dkUbHt8Sm
         FIywrE55fqbUoceAf0U8W+jOgvFtmQoglDN+XtMxOiqslSSZZfkKQCamrekit8d9qZ4U
         ZPpjXDw1AmvkrJxCkBkuc9yxoXZaeJQRTk1vrm0wJpwVn+VyeVzJSiI9Y6DqDacxkvKR
         R7rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935195; x=1789539995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=A7MPN6HMYDrQWv5fC5ucSz0zVoM9rf/CUSaTI7NYEKXyau+hILqsZDVmedrGtc/eSw
         LIF3pCsJOePH086YjJRAeBqFGp4VBphX4Kp4I365bmvTDeKK9E+9YBY8tXyNl7eZ1zPz
         yDiZ+QNAjVw80SbuW5LPAL36Mmhpzp9z+Aoo6a4r4nMiMixQSmI7d1WY2XwBhfvR45MK
         PBdS/4bQQ1nlty8gW885q0AC4YShGQGh2SXnhIwcngs8Bz/Ckpq/ad1M5k6zv1q5v4sa
         AerlRzzFp7AdQJOGsenT8dVN6VRpfFnq0jBOBzPlQLEBhcTOjcF8aKTgpE8WYzpJowcC
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935195; x=1789539995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=Egs9qxhngypT2HvoNfMvQ+9yA1L/QUkNmSeaoLHmvxFNllIGeUSZiyKdcrwMY/q29o
         Ed85VXUAVlE0jHaFIyvx+GUVklA1Z0ElhY23BYMwxtxGFLQJGv1YfR/Gkpkhm+vT3RzB
         xrNVRtPjjm2alisZNITHF+sSILVJPN0DLP9YjZ37fc6m4axBwwkqhRr3oKliBd/vy2Mw
         ko+Sfwx9NXOeD8h2EuVI8j2RZfYM4axbRUu4nzaJadjEHgUVchA7Sf9UqHAS7Ewk8jPa
         drONCfoysAdgEygNGRKCPKBu4ddS5XK3v8LYzxmmO/svQc6iyoGvFKfQLfQl8cepFpsm
         6XjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrZ86v81upCX0yjdFPNJXemSIoWgqxuPeZFEEricEVHu9dksMMbIp5qVo+NNcCW0a6Vy/QanHKHgg5YQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nzbAvmmRw9PFikwTEYTfR8a1Okw8KxD65Sf6Jp7hDXe30iA1vw
	9dxhj/POi32XFmSgZHK3Gv4zOJFaoGiie8gSlD3P26cZVyE1oTAIXCb2nrp/oRn3EywGAGsDMAJ
	FohH1pVh/4PnVD5W5WBcSoF83P0HjQtXwLOw5DkKCHgA6/we7hQVYSzEgBGrBjzCPnP3ey3wP4e
	2AzqARyn+yAUv2FIEndTvFYDeWd9kKNShSnehmqkFx
X-Gm-Gg: AYBFou27yyDXSM5MIQxn/ZYv2motFhxyJFBWdem4MrZGCDWouycF2eppZF7SBfJbaRk
	bmzGIrTusucutpfm/O7mBlBOUUH9C+nuQVE9zlogv9e6beXUMdF37blAc0Sp822sQpfUVxiCX1f
	ofq1ST80iGCfgpy92JoIVRcxQDzLOgKUa7t9gLBzpL7BtsKr18e49vOAxaig==
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id 956f58d0204a3-6710b80f5b4mr71245d50.34.1788935195177;
        Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id
 956f58d0204a3-6710b80f5b4mr71231d50.34.1788935194710; Tue, 08 Sep 2026
 23:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com> <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
In-Reply-To: <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:56:23 +0530
X-Gm-Features: AcwNN1UG8vvPTUZsvntZ8kx4jgNLH5GSTTTzIh3U6QIOG3hHK7a5SxUyRoYHjrs
Message-ID: <CAC-tS8B2CFFZ5XvTmUpWj_FxfJvfZ1mu91xML5wABOz07aiWTw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
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
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa0fc1c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=CrgXKhL8gDnHMrsOWy4A:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfXyCmquGfdv4Lh
 qycocjOtQs1OleN+Xea2IDzpXqMPnGYXAcyaxoCnnEsqDoNUL75YdYwA4NOL9C7TFKHDd1HaD5E
 7HAlbh5dMQmUIgy+Z0t7E2DHTnrWZjQ=
X-Proofpoint-ORIG-GUID: _YT7f4cCZXcjW1jEcq0c-9Vr1iBXUhl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfXzfe9o9odu1J4
 fdimoDnYlccSewpyQuFFveupQip3VF0GlRD0mFLEYuz3dbWkd/LskJQxtGPTE+0XH1eqDDcM68i
 pLj+Fvw1zCj/jr3F8yjw5l726SRqyyhJfE4MWrd4F47ZhEu6dx7Js7R3yaVfdyYAb9cPYMjTxyy
 4PmEj2mTc5LzOQCQ6rWHmdHZvk4Y+lWGlmmSMIXfOSRs5lhZJqalh4VV9FEHvHtzj6NeR5jyIKd
 BfMmjvxbf4AZ1zHMDBQzpmQn0pzpAU/HnMhbYprOmac6DN/M4XnAe+Hk5712aPmnufpgAlXqmfv
 KXkQHAIBnVcO37GGT46c8YIqihXnBUl4KcMQMqdZAiLbnz+dq4AVJdYSDtTS3PoKrMo0f7ggQgd
 HnnAAnycJ28snGMm666eJ06rs9AB66xiMve8o/Vyl1MLY7YithGm4P5M4qwwFNeCD2q27P+ssBO
 8lSgUd+iqhGY2wLzfQQ==
X-Proofpoint-GUID: _YT7f4cCZXcjW1jEcq0c-9Vr1iBXUhl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

On Wed, Sep 9, 2026 at 1:19=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 07, 2026 at 05:39:26PM +0530, Harendra Gautam wrote:
> > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > controller used on the Shikra audio platform, together with a dt-bindin=
gs
> > header for QAIF DAI and AIF interface IDs.
>
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
> > +    minItems: 5
> > +    items:
> > +      - const: lpass_config
> > +      - const: lpass_core_axim
> > +      - const: aud_dma
> > +      - const: aud_dma_mem
> > +      - const: bus
> > +      - const: aif_if0_ibit
> > +      - const: aif_if1_ibit
> > +      - const: aif_if2_ibit
> > +      - const: aif_if3_ibit
>
> The driver doesn't request any of these clocks as optional, are they
> really optional?  Probably easier to make them all mandatory and then
> relax later if they can genuinely be optional.
Thanks for your input. Will make all these clocks mandatory in the next ver=
sion.
-Harendra
