Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692D2749DF
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202319; cv=pass; b=qkpCOLSwzG25UfbIywe2CWNsASIZWfPa1F7WjL6EYNbIDJAzNi2WZ4Md+h3fvzJsJNobnxigVDz1ECr3dbVpzUE8Y8YtCYI3OqYd31OOMGfyO+MuP1HW08x9hQiLpJkeglu24XavT1MSeTT/l7CNSMBciUV322M+ViAh925W6vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202319; c=relaxed/simple;
	bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CryuhT4YK+tm0eod8sLfhGgKsMcXyAgCo62epYqBsJmXvaQpytNMwaHXosGPz+tmvtsMK43ndf68ASEDS9bj1i/sOdtUr8qkEgHITDIPnqD2L6DHfFaAOrXCl/1+5cnN1a7Q7LQoZoqHHEEbPiwpNYw6r48hLdEPmZxpq4HoVbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMTqEOYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A96STHz7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMTqEOYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A96STHz7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d7Xf3376110
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=; b=YMTqEOYzk2G8IFxO
	eIUFRcj5WP0qqlUpu1hv6PH4T5ILuXy0X4BB2MKsgg8/4gFmcWifXRAW9lsW8997
	Vlj9B0/+r6QRm2oWUva/Joxw9jqMG1VxhqKwlbY9afQKGnOX2OaeyhKruNVkPpJN
	jZMyLI6/dxypGjglx0TY2E0Eg3zwMMFsYebYoaSRyZpTEmK3BMmlHpPDIlq9EKNL
	TxAA1IFHIBbDO6xcx/pgjPpdtaZPQW4fDKj9iDzTqMMVJI3BCk3qtUgYzCXk9ZWJ
	D/SOOztWNj1RtDhDbojuSRtASUZLyDa3+GbJtVmEfp0CdKEK48jZ5Den5R29nTtY
	S3M3Hg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yebmnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8067fa066bcso13612257b3.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782202317; cv=none;
        d=google.com; s=arc-20260327;
        b=Aes0rTjTLJxdtv2Tdou0SGC9WJ0+O9vtOT19Rw75SJO3TAC3/yh7KL0nf1ng3MkLDV
         2DHv8q37UAgGLqgSOnLwiezJ37kRvErVHRb2ZLjhM8DNjCrqx8eA6t1MpUfhdU3qxMoi
         Bj+iVP8p6oFVjhaDJcTkDlg5OEbLNyuYIx9CK9y+GE9ZMRF9UF8unEtDOvclJH6sdGSy
         9A/kE/PFvhPUQCzVpl9yJIxn/1c3Do2lrWcTC2g8w7TdZCbyvzeQctFrEPs7P7/nc0F1
         Wjc3tKW8O94OWhD0La19nyVc42q5TZTiKrX0reVGKYbkCbTz0gmGnCBUMs/yvXPBxwAz
         UGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        fh=Y6L8jM95ou9MJdGDBeymV+/LFZ+KTDgm/9T7XV6YWT8=;
        b=s+PbPmlsOte76RpiYWtERW4Q1pK9NS2Etr81q5sRDYdb9dxfidlStBa8QTXUSLOB9+
         WZST008BteqavkbizbCJ88Jp6aYTEUqNNEAApaHnptcZ+JQTsv7jCM2IDcQ5tc7KBRqv
         ppEvNf8KbGVlaY7E+DTF3fKR3JUCZ3oInWG63lyXSxdQKLGyHgLdM4J67a0w71YKNcZ+
         033vePZLbJO56D7oz+uj+vL/WqpvFRyy7EnFR/pAboVKlOx9EWe4PWnLDs9InLflI1CG
         LLzFKVS8woUPJh6IoNshGOrOKz9KpmhurZWacamy28NBXe7YH/xLnGzkeQ1dGG91f1hJ
         XuWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782202317; x=1782807117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=A96STHz7aOcTuFuk6JxAVUt/HKkprH/F6HS7gkUGPiomu7ctifIZGxBcWxyH+dctTR
         4Sk51KAJiN9+EkB38Bm9kv3B7AXPOXCIschbg+WoOHt3B8A2kllpGvt0EnZLLKZVdBEP
         1h/SVR4ZTXsGq8kEYgq4ElLaQuSVkT+5AQCy0/PVuJYeKvge/AR/iGfVpvAjY+KYd6LU
         SUscPVTTBm8V8VvRTaWlkbA9iatvkEE26BQJB9p7LP8UMt8oS5uuJ+qEJPaEgG3KwPJw
         ZwQ1wk6Muv26+N1rg1/Z68U0/F/AY/kK2Z0S2qJCz7Kqczz8wWsksznKV6GPjU7bB3yX
         C3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202317; x=1782807117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=QjjkbGVQwptC3pOOWczdkM5qciSEHk8cCASekmxVR01YdRr0oziPC6nvwBwYz43wO8
         L4GqXZI01/63H0gjjl4JV/WvtYAlXuH+YC5BlUPRCfOLmNKvAeo+DR1D3KvW4CXu0/k7
         CqS2TeWPxKujGigdxQcbtVPlTJUTI2Q24GIK/LZDQHoRNxAFQMjjz2w6oGjxKEyQLOv2
         uwST6Kr19qoC4NEqSYswdnJBL8hDkDDvDVgIwGDxTXeqS7siFgy37/PKpXeSBJmkM5jp
         6MfrpBrk1P3SoFsmBfxgPqyyAahTiqa3nQexbvEOutZV6WywEfUM5pzrCgfFAEsCEIUa
         YCUw==
X-Forwarded-Encrypted: i=1; AHgh+RoJvMFqpZJURZuCamHg7myPsKyLeYpIFU6rlIb+4pq6kDU26eTVzXUdOLhKRrDTbUntqk5qE0BeWDx6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUCwTQqw+sKR4MUdKLgxTKC4iAaaDgOZpGdhS4NfgPL+j9usX
	el6dB4aekbaipPZapWLfh2Crd+FsBuulrIsvHxUwRXkKyYzHsSeVpEe8wYl7YKx8U8apJVsZU00
	1QDMUSdn8zeWfk34xCGF1PCP+gQRl6vafxeM7nH+ahWmQ9gguQYgsOcacMoYuWi161Dbfvef09S
	to6rLhO0Ih2KwqptWeWrM3AOIWyvOPkC6/Hdyu2hdH
X-Gm-Gg: AfdE7cmxSMu7I0S+O2/ySz8dwXkudRksSqMz59LV8R85E77a+7vCJ8UIsDoam+dN2Ox
	BcBi7gDYRP1i3qZEuf65grFyZaoabE0lEMAajJEOdcSU4Td4+gfcGS+boBUO7qOgSEESlChZGNc
	EmU/tHE3eddsc/GbMo1mpVdl7Bo/ADR39VUrv4dmyJwDDkYWWLKL6tHN6neRMDHyfgQPsZ
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id 00721157ae682-806731eda88mr27100647b3.21.1782202317064;
        Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id
 00721157ae682-806731eda88mr27100347b3.21.1782202316650; Tue, 23 Jun 2026
 01:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
 <5d57d386-011d-4d5a-8f14-901019f3f961@oss.qualcomm.com> <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
In-Reply-To: <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:41:45 +0530
X-Gm-Features: AVVi8CcEIEim4mJtqqqf56j5RT2JtPMKNUIlavtlNFsinkA44--VyQviYnJLK7s
Message-ID: <CAC-tS8DWLz3EK8cOQ84F-2COJR-K7X=snpWxm1doOxP6fQvNXg@mail.gmail.com>
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: fPsG3sHOLQxCpkunr3fQM2o7U2_kpUFs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX8QtXbOXLCTgE
 Si8bqY0pvcjLY5AF6GB/EQUQJI9+rGxYswqB/mZhbQZQUrHbJaRLkvAgWp63Mf4861T0dvRiC2k
 AU2ahOMhNtm8GasmWR8JRuo1kMFNk6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX7dSRNyLTKLOp
 wehCUuyoWZdmPc/GdSZvQIzDxh6qzpWX5zdOVsA8vVqNzMQnO4kIYwc+8K19tjDnaFTHQ2uci4Y
 LuXG41IGdyHQAotuSTIM/qAzZvRzNMukh9gkdIELLEBYdbarLqQT4Ps0lrczVCWe/Bo3tss5viV
 1rwJGtlAtbdGvumZWVvcz28y8VGp2UcO1vLdvlukWig87aCABceRiNXHGnI/JK2ALJIejsE61Cw
 /134FrgL4fXDfo2IgOooOCkVghKGTwkVYk0iJJkWuTiObKqVweqr60/zUziCeaGMqd22pWl89YU
 4706TerjvJF0h6Q/MBTB2TYptUTEQAjBZ9yV6ycwKKLEs4BmwmGLVuQ2jNo6w4+SVkioPcsFwNo
 swYY0kLNJrmQAAsSJPmVelvyJLG5M7xUSUi6JabtFLoEP8nLW9EJvl1RKBY7Br8vbwRKFf0XXDJ
 REmXDeTxiPZDfOmgUBw==
X-Proofpoint-GUID: fPsG3sHOLQxCpkunr3fQM2o7U2_kpUFs
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a3fcd cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Ke4LyEce-jOch06ua7AA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230064

On Tue, Jun 23, 2026 at 1:34=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
>
>
> On Wed, Jun 17, 2026 at 1:58=E2=80=AFAM Srinivas Kandagatla <srinivas.kan=
dagatla@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/5/26 11:37 AM, Harendra Gautam wrote:
>> >
>> > + struct reg_field cif_rddma_shram_wm;
>> > + struct reg_field cif_rddma_active_ch_en;
>> > + struct reg_field cif_rddma_fs_sel;
>> > + struct reg_field cif_rddma_fs_delay;
>> > + struct reg_field cif_rddma_fs_out_gate;
>> > + struct reg_field cif_rddma_intf_dyncclk;
>> > + struct reg_field cif_rddma_en_16bit_unpack;
>> > +
>> Why do we need to use reg_field?, currently this patchset only supports
>> one SoC. reg_field makes sense only when there is change in bit
>> positions across SoCs and if we want to leverage from existing driver.
>>
>> --srini
>>
> Thanks for your comment, change in bit position won't happen for a IP acr=
oss SoCs. But these bit fields are added with intention to configure bits b=
ased on defined value from device tree or based on usecase. Please let me k=
now your thoughts.
> -Harendra

<<resending as last mail was not delivered for a few lists as it was
not plain-text>>
Thanks for your comment, change in bit position won't happen for an IP
across SoCs. But these bit fields are added with the intention to
configure bits based on defined value from device tree or based on
usecase. Please let me know your thoughts.
--Harendra
