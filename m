Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8ED403EB5
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566270; cv=pass; b=Oh4Z3Wxb75qEN9coSECb7yUx3aorXfRkmWNZhQKFt6nRyxqwoKCiDbzugFLiKXbIw964hRbsIDPRxq+mOxElx2QOK4tzDigLJFqze8/bSPr8EiYbyKuLBTZKNpBfhWUzBCKgmu3I/CdSvvyaE2N5n2CuZxZXnnFju2CzqtXIgJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566270; c=relaxed/simple;
	bh=o01YkiL2PGmOZI/FMH3AD2Qj/EckP+dFtIF5ig+V9Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTE0SkzFGSK8omgVWgC0kM091dtGxB3BMwkATiFA34kAJzntfPm7RCg3JISq/klXlyFLcUNKg9X8EobECvUvK+C6HV3by5aWG/q3Y8TAkGD+xS3nkbk85oIXlASfbsklVBIy2DuyYnyUDuMMZ9e7MURT5mPY6OoTrRhdJC9J5OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrnQ8ioh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbG20eSK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrnQ8ioh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbG20eSK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99AEj2900586
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=; b=hrnQ8iohcG6Rjk1s
	QqP/iPbBW1WPpiy6kAdH8IJ2EyXnqCUdL8XLYFHTI01BwCQPMqZ1s5CNcfPm24uO
	zv5gtNMDHKKDs7b+pNpQEfC7WAaeDn1ftcn9znPvLwQADvtGOuKyTfxzAoTR7svv
	bHRAixOHElB2RMZRxck1dHapFCnw6IyBlsIKbl0J7JtoL4WL9APJPY4TxyWZ+57v
	eqw0wVnYqEvMLLrQ/iQA4CU5wbRlAbZ15BE1CJMIhyir6GuPj3WuNsxUt2jAmX1r
	6DJlhyaD9A8Uq9Qfb80HdwSO4mSTWosEI6F6H/PKnFPqncgnBEEJuyyBv0n3uj/g
	qFA6AQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrr2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:11:07 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8331536a939so131956767b3.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787566267; cv=none;
        d=google.com; s=arc-20260327;
        b=d1H03KgOCjUdzzCn7Rzv8QydUfYfD1vSiwjZMVhnDjj9Vf2JuhaSQwidxXypcJ3gRJ
         mbzzQaqdWEkj6lN93ueUxxvz071UTXQl0O1fUwfPAu2LuIS/acVftiFRYgpv49oTmXLX
         xUn5YLwZOLx500vdQfIft439G4RdkjuH4SuutZE1ibbYAnjOpzDD7Zsja8xFZ75l+zoj
         bg7s1ivc31NcNA3Yd+ZR46O/Xhlrydqtsdig+7HqzJ99iQzkslGzpxs6mI8typismzvO
         Df6PGB8vV0s2mH96aL/ZUM5IRLfJnnRCdgjHiVPIDSyLo3EaAWKJM3/p0mfFaGBm7eOe
         d7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        fh=rUUs3Q525bsSctFynKSiYLu8c0jzdYsnHRqrtcFbMM4=;
        b=nsq+qPmeuFv4x0JkD5S9leXB2Wf886Y7VMkVCQGJQpJRKVmY2lQ6z/VUfHBkZA9OMh
         yu6tj+wl+b5R7/h3PNh6l5NYZutUWl1GO3SL5MlC2kVGW2CqqIIWjABQeAYphicw0RnP
         U8hcMzvnYbvrgO3xHbl8MlC8BrZYyHm/AF13E1286opRagRMz60MrUCYH9T3hqvRF8YR
         yCQ7+bNumCYUtttjT+7HVeSPLi2BORsE/Rgl8oSGv4RfQdcpvlnwzHcCEnwM+uUv9BFQ
         Tb5YOAILIUjl14LhTnP1HjVfl8mzYm7Z6U82+R0H9moLpz5StIXHonvCnRRMotThY4e3
         4sJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566267; x=1788171067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=RbG20eSKP/nJjPQwKQLauiVzD8iFaECGB7C416kzcc0P88Xop7ShBtoKdTFnMqUUfY
         jeWmUQfMYJJx5qouk/RxQL4FpBEVgWneer2uxhf8jGsp4jJsT9P8DoJZKWBrdhgDfufb
         VRC4S1uA8TJ5jRYVl8lkswCiRiL0HOyvQjs2D94gv1tYAUWNLDXxer9nZbhm01twVrBk
         MvThmgR8/R4DuGQuXy2IK1OKLx2VCrTgR31oXRouEmdJgd6pdwbrKxIMAVrL+Ph+y3BS
         GKTZzrQmtGz5M71uqgsIpfgS0rKNmU17C2Sy52ni60faexi38f+y8Y/bICwtbnMcvuiM
         YEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566267; x=1788171067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=WTUYvBr7uMZ8C8jlxvyVDhaPyXUAdDt5VFvw/lLt/3+AwO4ITKZhKVw/tF/BQpeoU4
         1QnrCIHXMLwaE3nGv1O1qbMfZ9BH2y4kJOaYofQ+WxKyRasC2sSoFrFEz7oZi+xbOHZL
         fd0JyXKFonqM9pMMl54EBOw83AUMyFxwdNBRJf3EVAwe3Iwce8tV/9s28AuN9tV9+7Mx
         giS+wvIam3yTeDlzvOnBXAez7P/MMeR4lx9jMo5Ua1nMBnfVsIVcFwyIsAX55x9Dl9zO
         CWanA/oBgBUpWGRDl84l/tEkFTvJk5pmwhiyErOYIhHa9p7fDzByX+PqqzMF/vqvjp6T
         S8Cw==
X-Gm-Message-State: AFuF++k+8WHSc2bjpsDMjZrIzdya/3SKoZ/cUsQWXedmePEjQQVzCpYf
	5DUjF6xTSuVrgbyW0v4RN3Z80IjWR3I6BWufBkA/eqsJcG65uKGcCZm3hOfRfARz3OcNUKxZ9Cy
	6Dp6xSI2+iUgu+9Aa9hpZlzTya4SIUb5RtA5am3SzIGxPuR9doS0hlYVExlHWiWKMdEUsHqs2dy
	MTHGVckS6BBItz2Goy8Mh6xsK4BL2D3s4AGvfxWW8C
X-Gm-Gg: AR+sD12vhnfFLzNwVvX4LQ0RAzE48k/XnOQRH+M4b2RQYnrrCSBzp6AZgKTWGL2EHAl
	UNe3BzxBsNDJ6AlqBplywym2U2B0Y0ELW/8qPdq7fdKKvKO8Qir6xZgrdrKDtNUFi9XQ9iXwbyd
	w929XkEu2tpfpwQ/rpmyjzxMF8mMqBqfK0Q8ImmSD3XTgSNrPkuX/vAGo7QRM=
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id 00721157ae682-849f01479c1mr74939537b3.5.1787566267316;
        Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id
 00721157ae682-849f01479c1mr74939347b3.5.1787566266757; Mon, 24 Aug 2026
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com> <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
In-Reply-To: <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:40:55 +0530
X-Gm-Features: AcwNN1Xdai-XKJ9Ozv3HRsrFmel4SeNQCvovlso6MLPmQjGIsIp6fX_fta8kZDI
Message-ID: <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX0g+BCfTUjUUl
 AoUZxMfPymX65FKiQG31OUtWfOZq7xr9qD66LovZ38Pbz1fO5qVoVo+s4u1SEJASRMGmRCvmIxJ
 HNqhhLtIW8kxZqhNV/sET8GdqHXVWMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX/jPQd3P7shGl
 zNNUbe8pAxoekoHGKtXjXz+qSdjOYIX1tsq0t1eA7/VZRN4H4g+B9WcHGnBVN/gpZXzk5aYPht/
 MF4yCk/vNbUPCVYaDfUN1V83i2+RYfUbNfPYo90V3Aw+48RJGmsIWf9RCVN/o3a/wS2/r5How4R
 ohRRZhf6GKQ0lO8cEB+bXJbzquVu85Xaa+geVN9g+L0QNmiJ9JSu5je34ZvX1A0a2bSn1M/tO1F
 tDJ5vVOOEzUjGkvAnE4Dr0samFiuNqDnPzLYpFq1B0vvfUSma9sLOeMz9BUuKvsEiIho4D5g0Ne
 2eCR1je/hDZI/bZetJodgyebreo/SJSO9jtRMbzvvCrYDj4p+pCZJI3YQW7GLlz8gJjhp/pbmsU
 KSLT/ktoAMoLpjtgLBmgdjIFal11pRWcUE9HL0GTa6rfzDPGHK+TB2Gxu9yQL0ULmbSfwduwEHE
 AOJeH6qjEvZzndixVCA==
X-Proofpoint-ORIG-GUID: b8kcb4QZOMGm6uZbOGGwCkKc4iKkuQRW
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c18bb cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8 a=HWrUbPwSkS5HGAVXgNUA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: b8kcb4QZOMGm6uZbOGGwCkKc4iKkuQRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240085

On Mon, Aug 24, 2026 at 2:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/sound/soc/qcom/qaif-platform.c
> > @@ -0,0 +1,544 @@
> =E2=80=A6
> > +static int qaif_platform_pcmops_close(struct snd_soc_component *compon=
ent,
> > +                                   struct snd_pcm_substream *substream=
)
> > +{
> =E2=80=A6
> > +     mutex_lock(&drvdata->stream_lock);
> > +     if (v->free_stream_dma_idx)
> > +             v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai=
_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&drvdata->stream_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253
>
> Regards,
> Markus
Thanks for the pointer. I believe guard() can be used across all
stream_lock. I Will address it in the next version.
-Harendra
