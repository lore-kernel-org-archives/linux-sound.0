Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BA37F322
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740685; cv=pass; b=WWSTX9OL88LFQ/GWhPZygEWvCXYwwMTTCH1MnV1N4OmktBAMKTKtOEJM3bC7Ed1t0sHaDHF0pa+H6Jx5f39HMvSkXGz8N4h5UH+VPJRBZsrFuaK8VavNJMf9wd0nDaNGnJDMpLBwISMFZGqp86YOj0orOQXFrMBuoAcxHqzLKAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740685; c=relaxed/simple;
	bh=e/Lr729rJWGz+ybwYNJEv1Gw8F8Cga9cb4fE+B3gek0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJiuPKgAu//Kf9YoeBDLelDICsDv/kC60kP1S7e2Ne8tLjaafAFxcDu6vEYLcHCzftaOmzF9QAwZ3OyJCz0Es8zacBQzqx3gqg+3fQMtEerJ0vJgCBv1gHCA3uEDYaUVcpQtPlvOtOmAKLXrOLqpLWr1mEQrtSZdQXsFgfFwp/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMIxFJEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTkDceyZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMIxFJEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTkDceyZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGTPv1658488
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=; b=XMIxFJEK32OQPk/z
	l1RXhzcHK9j6Ha9Hj3X4vMewANPLELNstzY4RnhxpU9nJkFenrNSul5bFOcTdWD3
	ACQ1CIo/S0FHpTbYF2ZIbKhKxHDMBnjad4rRjM0ZtOuFpQ0k3a31hcu6u1z+VpcP
	0sJkwdngSscMpLMkbk7QfgOttHNzcjasSxF4QTh8KdCY3K5RMn28loi6E9qM+94V
	DYoCwTLFis+LoNov4b2JbmeOiVJttG62Qhu88mZMqgw45sYqRKlQ6A/8ZYQztf5B
	5DvpNAQW1EhA4vwVHiU9syfNsEIifBxvfC7GMKxXSLnsjp5JUGDO2vMnPEj4cA5Z
	/hUlYg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rtc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so12790377b3.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787740680; cv=none;
        d=google.com; s=arc-20260327;
        b=UOCZfc1oEZ8CZNnvcmSH1qNqtKWnnF/c2lPY2XKwNHsBXIoM91jNDMwLkLUptjfrA1
         H8EJ6if6VG2rfA0nhA9fNW++3U5wmGs9XJhiSWah1fvLtaYWlDlkFjFT6cFHdFUcjk2O
         BsRCCsj3vaTYU71NGCO8YDDGhUsbzlDSU+VNKg9ibKNMk5ZqDiJ9TKB8zM/GQgby9oIR
         GrJUVx1E6VYj6l8VkSzs/fzOF0Kz/0NrSH1NH6IISU2OHJE2GItsxvdQ6sjupvOwQoZ1
         oSNGOQohYcBlUp0yR0ypzREmqYPnqLNmLIGWJvDOksEy6oBCceQmRtGOkaSMPnsHFDBB
         0KJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        fh=ooK0lZQO+fx399C/5pJBgCrl5vxgLedxQ4HeOEPXMYY=;
        b=r5SrKEmiVpfNlqa6aJJAgI+dQ83WXqhCJEKQflWnP4UkomzZQ8TPy+rxaZQfoFhyZQ
         ZvrJ9HMfsgwAUFo/w2atytxFEmPLO5IFgF8L2giDUJhC6ozENfkjflooaitZWxAxbEie
         6YHFQTwJL1M6AU2OIS+ppVW9JPWjRyRg78G6HuS+rbUAj9zCyUcHPHIybHIBN5CxC9xe
         6106fjDuXQZvVlwZ5Yfh65MJEDZQZd9czWlqsR3aBN+KIOz18sC5R4ZaKCPZ8sZ53FR5
         qa4kcdBzwEAYuVLUgspvZLMAB2xlfC7VMSwIAgcaHrPat9XuiQRL8dc4lyNPodRh7MaF
         fP4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740680; x=1788345480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=UTkDceyZqKC7cInfxQmy1WsIMpCQyUoOA4xOZBTwJn8yZJlU9ZvIqqr2xPHHE1m8/0
         OUbgZ9pW4aFsLiVGSzz2K+vmgyGh0xGG/JQHw1nJei2z11ErzJALGVr5DuLS/1qgrOaA
         1HJVOYvRfhsruG3vqvCYLqljy6+1S4aPIRZqisuuk+Ol8rem+ZgK4PWLPmb0TenEa9Nr
         Eq+g0K6uhkk8snlARMz7O/rcQuT5aGE2zYpuuO5zNfINtlEaxqyLSqJq3fb+UYvfP809
         9mH8IZy8efQJek9tWCRYad/2d8cshHh8gOofbcnvloqx08MGDt1vrfXr8UzhuGcIjmgX
         Bnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740680; x=1788345480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=R4RZySfWmdo4aMJ+oSypU83gRYW3NWK8WEJha5WB59NJVHEE14+TSej8GVsp1NyxGD
         EmUlO7z3AV2HJpWKytGc7hm/cNjljk2fxJg2qlCZ8aHVGeZxPnHTnbs/3kIGFxxl7h/T
         wA5uzOK641dORHLvrclhzW5fZQHYe7OYVMA4gJh8qELoUMDHA9giFUexj/QUDoEkGe+0
         frFFiTR6/8jruFkPZ56UoFsL4iirFg10wpLMQuAXgPZz9gHkS849qnduQ1AfOIszuaAP
         y+B2NGp4Lrk9zRbpq4QoxsVZb3Is/XeaFC7sOqXBzleWKmRzJAvgAfxmI6RLN/WAQRXg
         Z36g==
X-Forwarded-Encrypted: i=1; AHgh+Rp5yjDuWXS938KSAKrP+mVkftZaFfplcvQC9LXbNMLBlBE0UQNXRLb+dtvKQD7PC0oW8rTyajAY/4QwFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nk10OSYYUPmhiVoge5Ba+M1NV5LYby+Bv1kT5UrUCtepfDx8cU
	KK5CreCzxwl24h5dR241DUaprnX0PwycvdNgil/T6V4nqXfXw6YlMqS/0aKzWKzFYRXtBFgAvJW
	fyh3CqXZui0I8+kYS5fMQPakrzjc8MXQMudTsQnR1ZeZlhcGuneJI24wAaVVTtq+7WA+BES4ave
	m/woizth7TBVU/MGicwicgBB2xNNZ2NytGV3LFtU36
X-Gm-Gg: AR+sD13SgSqrRZfI+/kWhQDoPleKkAA4ybU6zrZ6Dgy0GDUQMI15Jl+FSSqyu5lgx2G
	C1gyI9RXEEsWSNCsd3uvCjsp6lJ2zd4z8kl6xOHSG/KGpgyfhG/KO6pitEU4nFTSgGdJMsxekwd
	sWthuNaeFR5vh+luH6eoufG4I8q1FlJiI7SHZ4AkHYEDBcilnWGqvIFOCp0A==
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id 00721157ae682-8573fadc903mr27120677b3.23.1787740680137;
        Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id
 00721157ae682-8573fadc903mr27120457b3.23.1787740679756; Wed, 26 Aug 2026
 03:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
 <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com> <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
 <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
In-Reply-To: <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:07:48 +0530
X-Gm-Features: AcwNN1XBYCuPhgbUzFIDpZZP4PB_1GNeNQnN5gU4WnrdKYte1HfRJE3iB1kMShw
Message-ID: <CAC-tS8CSyrxdLJ773WA2uvXry3=Gwiks1TFG4z8N7rs2d3EHKQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: f49tFcsViB_LZnR9J4AC59TvdhKmatI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX/VSWrbquTBsc
 comMzluO4aL3/mE4HcR6l7gkYMb5ZSdfqWc4o8XrGQv/NsuyUgTPUXHmMIrxiA9dRj7lrgcjfgI
 /2FGiF/Vay9Kq988GZTU4I3zU5CykY5hyZ/ssbELQZXW7LcD/kGFpTeipmGg+dlknzxndOl9Ytl
 9J7IGYdUzL/N8/YucyUEXqtykgH+MzekrGtL1528a8DXL9E2vmg0b4fJJnfRZd8v29S/Ekd0Mvo
 beDjA14ODmgam0duplAya3RUXL9X+YRx5UE76tmrR4brSMteLihzQ1+FLOr6ffp6ZwZuOHcyhNv
 Xp//H/SmDcWxtJASUf8P9zuEVne7NOX/l71MLJsRUay7N4oQawQZGpD+YDp0zJ/DOhNFNgF4d5f
 GW2V/A92JvbOzIDalYaJwV8alBaaQXdTIN7GYWWDfid+2eGkchIYyP04+tnxT6NvL8SdrDJSDnc
 tGWOGyav/igatoyDBMg==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ec209 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ykc42Gtf8Ew0kkRZKZcA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: f49tFcsViB_LZnR9J4AC59TvdhKmatI_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX4pki4glx1BIm
 wtrTnQaAFGkhUw6oCcrgq24b7yi8+7dTghmD+HPEJr9XhjHT5ojjTOy++JX8pz2bvdzLR1YHl+8
 62YO85/DCpZXIPUVeEmL9f+t2HHeqMc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260088

On Wed, Aug 26, 2026 at 3:43=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 8/26/26 9:58 AM, Harendra Gautam wrote:
> >>> +             .id =3D QAIF_CDC_DMA_RX0,
> >>> +             .name =3D "CDC DMA RX0",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback0",
> >>> +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> >>> +                     .rates =3D SNDRV_PCM_RATE_48000,
> >>> +                     .rate_min       =3D 48000,
> >>> +                     .rate_max       =3D 48000,
> >>> +                     .channels_min   =3D 1,
> >>> +                     .channels_max   =3D 2,
> >>> +             },
> >>> +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> >>> +     }, {
> >>> +             .id =3D QAIF_CDC_DMA_RX1,
> >>> +             .name =3D "CDC DMA RX1",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback1",
> >> No dai for WCD capture (or) it's missing in this patch.
> >>
> >>
> >> Best Regards,
> >> Rafi.
> >>
> > On Shikra, capture is always through the VA Macro, irrespective of
> > whether the source is WCD AMIC or MSM DMIC and the stream_name is only
> > a descriptive identifier.
>
> WCD naming is totally incorrect w.r.t this driver, WCD is external
> codec, which can be connected to any dai. QAIF just exposes FE dais It
> should not have any codec level information either as names or any other.
> Pl remove and use the correct naming which reflect the dai name w.r.t to
> QAIF.
>
> --srini
Thanks for the suggestion. Will have consistent and correct naming in
the next version.
-Harendra
>
> > -Harendra
>
