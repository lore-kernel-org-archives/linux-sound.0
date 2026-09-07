Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52514494831
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781659; cv=pass; b=Em87IFdNyGvDUZxWGcPHkn8GsPvn8bEwEPFCBNNmyVWueaEFmrINoOCihr6Xn+83Vm5zsXR0q6l83YMr4boo/LJCXgMIH52GEFUyuGUNgLRyRTTsu6w0hGcA+oLvCq3HVXOxKmJ5NQHdQ0EHuRuYdlPi9hKy2hnG8NjAo7MvPc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781659; c=relaxed/simple;
	bh=Wer6SSG/uDE6Ee8Fljcjhj1Fc9lWtsOpuA414gbFytM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJUlSqeZdCzUwyYf/25lWMzpvPVSOcYKBK9/uvxJwc5xlhh2Ds03K9KDtOUKTZE8HNHkXh/nR/IeOKSLjUSRB/ro4UJKodHVIaGnWWTXrf5nBrCulO/xSIvjyYVZh46QwGvMw4037RU7w4X0BwWEFPIRUTaz60LG81G3WMMKw7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVh+6URp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJF04qEC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVh+6URp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJF04qEC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvSUQ496319
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 11:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=; b=KVh+6URpAkw9KsmP
	irbg8XvFBh9A6eBx989QXAL13WlV1Jrh0mmYPZdj5c01TfzI5xEL674WJwhfe/jb
	OUAF1Vr19KYwnmcSyjRMXKsxQSN8Eki9ZmSKwly25d8wWP0yCrnERjKfhU+9MroU
	prIf7hQRZvLYIqHCoodMOd3xbVg3LhDZ7fdV3HctW0nwhRcCI28jcWO10KUi7QDo
	zwJEogawHXaLyFiJgy+m3QvGGkIIyLD96we8/PazWpLwlWmaAo7pC0I++u9MsEmW
	CT/UDrMsb34cZOdGk0moA5xFjihWv1A2af3GDOcLHXLBRxtFA09DbYaL3fVux8C6
	i03mMg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk856a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 11:47:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66faff68c0bso4880284d50.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 04:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781655; cv=none;
        d=google.com; s=arc-20260327;
        b=VhvP5jwEm9UweaFwlvxw1vzy4w9fE3KHSz1nT/4GMl1qc8vc1P2CTYZmwPjZFu7aS0
         oeNDvJNSjlmqVKSL2tC0gxnQPrtPZevSYGlfFv5er8UUUGaan+3MPjLoX0opBH9S7/tq
         /JrFylY6cVX2umjsAGsGm9H40UjHzdqnrSKIwM0lVk8T+B8VPh70OB3rLVbKJzFzFPYi
         vIMzfFvKLgzGZyKXiYqN/VVWNpMaV0UxrMpZy68F1v1gHKocO/UYRbQyJzIbEwMf+wk5
         DmP9y8ZaWnY23Tj/YJaLDQ/JutaxIQLTfA2P2TYZPRGYCDxzOICM+TIeQUsqXMkeH7Z7
         8B4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        fh=3tmLEFOfRSYQbZWjD1whKUHcAzIRKlOpk6jtD+bQPpA=;
        b=fl7s5WHOjJe2HQAo1K26rWDUpxsFLLpbBO8XI3newgQtF4Mxm6V0W7nF5Xy7zMjgj3
         9JVJ96x+iSNRBNSR6JWXOWV3+bq5t0OSsLi7XW+N9n3SN1qTlj5pq6yCCqO4pdDufSif
         mwCD74LQPr27/wOkpwEBv+JONDsD15z/FvcOXkZhxJLaMJwIj1L3prN848TIVZmPgQEF
         xOaN2hANc3/QMQAxf0uKJ1l2Yz1koZaQolz7I6QxorHUF9egJ/Qoz4Osko1CNZzN4KZI
         HiZMnH8UdtS9Kafe4w7h1YfDPwwsSvYt93Z2b54LwlDc05DPaP17T3ojjV1nB7bV1CRB
         if5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781655; x=1789386455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=VJF04qEClAXK7KQ4k2taKPoVIPcpYumHrL18CkFh5faq4PSxXKQxjlu5NAVr3xMbpU
         ta066dVCSXfnxvQiYuIfJGrjQXyG93Tqnypa32T9GW6eHU68SzvLNAt5Ft2TDX/76CTX
         Y1KRIctW8TXKTE1XY6+Qo2laE1Op/utSZmLHbtc/oN2qXjiI17FejN9e5+V4GxrdYprs
         O+AmKOhYiuDlrNpkmbvvRFicpr/R0Rh4ou5Xy/L9GoYWazNBKNYHz+LEyIr+ctQjH4eL
         7ypdCFm5m72XsyWgNEHpedaJmECVLq3bm1R6TqY2F7KDM03jTMUxjiyr1yjb5UCMsSvo
         uyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781655; x=1789386455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=DpEEesqbOOrx0WySjVty5zgarvGCRWmPuRdCN034lFkkxLuHSvskoDBKj7ETRL4Sss
         xbA4w4sEBLW3UkwlNmWa+ITLrVxKub8J3z8D7j8KCYCaIqEvai+zt01gWvBSdt6z+Hbi
         XpyL6Lv5VJ+53gv2M5BiYUaoxbSedrIW91Hc9ftPIgM6+cqBKjprbASKnKi/ZqMhNuXr
         TXCbE/+IURZQDgW7V7XUgkcDOQ6aCd4mWgBXMBF4zkr5Yf9FsvRn4A6oNfPvGNDcyF2S
         cnzS7Lmur12VBSxaXhfj+gAITzGh2Gju1Grr+Uf/lh9KuBiMzVksKq3aARqj/gGlvTR6
         kZ0A==
X-Forwarded-Encrypted: i=1; AKwUvBygyJ4q3YPOAejZ709IZfwiIdIAYgjxop3F3IpxQOTjhoQsz9k3IZFy4sDbOu35JuKWn6LAeX4iEREZfg==@vger.kernel.org
X-Gm-Message-State: AFuF++lEXSF3weRpVnHbJ6sQHhu+zMeHF7Dvws7dnbySb4Q690XY/W92
	35rVXaSI9AIsk5x+3xL+91ODC+cKgQI2rTkIxr85TsxziRJiVEhw81k6VNTZmN4D963+iDH4IUV
	ez0sZ9AedJT7K4ZuvZJbpCrA1BXvT8AvciHYav2fI0cDNV4rlVBIqVyqb+NZpNM2DeNDOK9yc0w
	jiw1M/TXkNNZMkoMR2O0Q4TpyaJU+HAv4e/tLJtkvB
X-Gm-Gg: AYBFou3tkGSzM3pgFbhTYb/jzqY5+oJoJQjBdeDL59DZd0NX90Hps959QsqQjznFZz0
	NfyZTklEa9c6mBMu7JBb6uysAW1GrhF1uCSRNM/mXZ9jopcwiDZNuYZz2AUHO1IUvx9iNu0TqDq
	qlUAIw+qzya33QqvvaRFfDtZEKJCkFGy7MfFOpA1QZCEdE2tbtMdQ+eBxPDQ==
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id 956f58d0204a3-66fb5abc685mr5954632d50.35.1788781655467;
        Mon, 07 Sep 2026 04:47:35 -0700 (PDT)
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id
 956f58d0204a3-66fb5abc685mr5954550d50.35.1788781650223; Mon, 07 Sep 2026
 04:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
In-Reply-To: <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:17:19 +0530
X-Gm-Features: AcwNN1XXb0eVO7BU5GwO2TvIzIj99UoYsYsbFLmLlnq_kiZvskMwYXQlzc44yys
Message-ID: <CAC-tS8ANBcNatz4LO781zT_4XKwE7TkHrDaQ4N8JFr5x_vFvFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX3UwCoQxOtLuy
 X0I9u2/SR7L3jciM+wn7x8ktYsvRUp2nLUThJDkiEGgmfSDShiwUBopoYPMR/T8rz/EIfoEPWGK
 LTduwtH5srYsSloH8aQsd/Fc6FOPxVM=
X-Proofpoint-GUID: MBiBXUsZmSEDQ3ftWDY7D0-xIiFLg5rB
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ea458 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnI5DnPC5xRnza1bqQQA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: MBiBXUsZmSEDQ3ftWDY7D0-xIiFLg5rB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX/iR3FtCcXnrn
 8cfdk5VwBhy067HS4EDDqGtw3/ACqpVmRoDbhnlLXx31aeMsFtHbi0PGjz2r2OK4qrAbzwotnno
 MhaeXjNhOgUHpY290Ewx9uLZWag3y7vwIS6OiJveuKyPpf/HZUydnPQJXneold8CpAYgkl3USes
 emA9f6xCghl/9WXRCIzBWAjy8tb8OpdSvhJCWmyb8JxvcfKwSD22pUKj/qY52X9pbahLVSAyQeE
 sfHw6TQJMOVTIt2X8ydnc2CJGEM6Bu0CRUF65LB4JIP+pJD/B02BRePsEI9w9ZEtZRNNmDHCSS/
 PoywlD5HMY5o0Mza4CCn4aj1JdcQ7raMGrzDpXH23RUDaoWpfAkvtEZcfXOoxptpQ8RZrt2zCWT
 tZFLIN/VCZv8U/8sJd1UlwEPNFRjTO4H4zJac/9g1t8mIv54/hBM96B+JcTxnz2Mr9LMYvmSulD
 S92jUeHT4k2rRSJiNeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070130

On Mon, Sep 7, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/09/2026 10:30, Krzysztof Kozlowski wrote:
> > On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> >>
> >> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU=
 DAI
> >
> > Why do your commits have leading blank line? I mean, really, how is it
> > possible to create such commit?
> >
> > Additionally, way you send your work is making this unnecessarily
> > difficult for us. Look, does this work?
> >
> >       b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.co=
m'
> >
> > ? No, it does not:
> >
>
> And now I checked... and you did not even use b4 to send v3 and v4. I
> mean, really... why? All internal guides, all external presentations
> EVERYWHERE we say this is expected and even almost a must for bigger work=
.
Apologies for that. This is my first upstream series and I was not
aware of the b4 send requirement at the time. v3 and v4 were sent via
git send-email. v5 will be sent via b4 send.
-Harendra
>
> Best regards,
> Krzysztof
