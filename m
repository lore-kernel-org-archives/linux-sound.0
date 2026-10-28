Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155250;
	b=rg+8Il7QDjzhkx4jllxW7Qv3IIviMnDHc1AfiMCZsRpGyWAeuJqrMx8mx1YPEokcTrcS
	 ItE2mHZSOU2v5xbAXgQWfIig49F4VO/0S23gNnBdnqJ48a2/ZYNpWAYZpmRTJ0+/m8H3S
	 OTcxZUebdTTvHMlVtcUMZa/Qs+Vw8V02Q7ZS52Y+seosR7CplKxPUkxpUFxsOZwVsvVDR
	 46Ep039IKORWX4T2+gMEYXilIFbW1IxID9pVTGNSuGTy9WBr2PoadlDkdBy7hj0IcT+wu
	 Ux4ybeFYRD+KLuVhlCCtWjry81aF074Mr1Hk5M5NFdvtLU6UZKvMdttmci+8++v2VNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
	b=hKFvGmB2d2hNiD1kgffOOpCdk3eGHFBKnKWSRtyd7Q1RuC9zHxeKgwgTk95RZiS+zy60
	 jBQKuTCw98DSbUVzzRoxhmGNlW20C93VocVh3gbm95lamC9xNZpDVRlLXsgYGFLOT8zkY
	 EeIc2JSnWwf4ubnnNelll1iC7w4MIhoIBPQwutwPFEEtKGSah6jTZnBCbC9gn8XyaQN1E
	 X42bAGupPZaubwmJMJp3meQANptIGj4SWs2qyZIcRIW7mBYyTEFCsN20c0Y+YxfYyUPoo
	 +xPBSFpajvgGE2ZU8rFZ05tKL4N8kJaPefN078CPEFedIEr6k6pb7eke2plqpvHU0pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+Giy5Nu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F97606A323
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+Giy5Nu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S1XM6L284209
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=; b=MP0jeGojr59swceb
	S29QoMx2oPgTkVTBRpSWG0EljdUAEgQz3Ms/n+K/GyOnZfgFdIwcBI+Pfz8ah73P
	HbNoFuCrRwesYx7sNi9cP1Scj7G+sY5f1nAO9vKv713tjigijZXvFa9iEqqfpell
	Atv7cLbpPx4fwKZxgEfRZrkzI0onxbrOnrCml7JaZ1O+iBzHbQF+nlfJXsudH5h5
	m+83gfcpFtIZjHS2HKLhQ+v5y9oYqdj0IbEhfYDEjh9TEw1SFI1a2FlYEVdLjpA0
	EK7FmTY36QHBJS/EcrfXXLJE04xG3tcyDnH1fVKXoNbFcD8LDLO69JWFqqKkhhDM
	BmH9cg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7g604-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so490245a12.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793155247; cv=none;
        d=google.com; s=arc-20260327;
        b=rj94EFZE5ils/hScLcqJAr/Py7BgnxX6sHwvrNAoMSpwgsVU+C5CXlLAEHsFlUH+8w
         iWO2vGx61mwZ+aod4Xa446MOu7t89tYij6rZ7+M4Rtdk+bIU16aoP4y02MGe0w/3tfZp
         3B3AgMk8z0e7E4z0HrWiFTdgnLWV694wmyx/WwLZ6YNtHsEvyxgiCrU6PmkSrzDZ93Ck
         ufN/DO6u3LG6uSJPCGhTG+/V8QsHo3GWn3B93JOQ37VtxUFYENNpb/nQhJTr7bRIHzeq
         84/8Sn9MwiF+8mjQu/Fqx7VM3VOL0QmiVg5mPInI7ItST3Pr5V8nmyCNjetGS6jrA7A0
         1pHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        fh=iGLWdY3coFj7HAfbPpmY6r35dZyoW01gkN9+JRrhfSE=;
        b=V0H33inFUanh15qdGvccbtbDQiyYzQoS//jQ4tvVz8WFjkmpktCwqIeip7KB5wNxkw
         T4b0McZa2j7rVqXPK2E8yfBdkqmNuNAP8XWDn+4bTtVCVBUTRhcSkgKF2gzzCylHsMpJ
         CIjEysTHeSphSG91nE1lFwHUHcD51+yQ6dpsrdW83kv6DfwFlOBJOtdZIN2gD8uAG1rM
         nQhnc5i5BXPFxN87FDkm7a3Q70KfJjajuNdJty0OGx1rGFm7sA4rHZVlp+klbUo7LGme
         pvy7m/wwBXC012vzjUYwBFIOaUqPJsjB2REISfMKHU53kFhbu+d4EU55daL6jr5XG8oI
         C62w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793155247; x=1793760047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=Y+Giy5NuCKDvwYLgoa8gioY7zhKKyhbwc8oJqIn1N0YtB+29Bz1MXHq3gzRz0zTdSJ
         GKVLKCEoLM61K87vbj9MHhwcNNyCs/JnQCNtFBSXYcQUsfLGGCrMRFzuI2l8DjWvDXbT
         WftgdgdGe4Yjoo8avPfnrnX5bcY1UW4ExBvUPFVC9bgLBUkq32c/1hEvBxajVwC3TbQp
         I/O+KVmw/0JrqgDvMBkeATeq0GI531iiQ1U2ekz5tqA0ScZ74JmQ9f0qV7tse8y90CAH
         vJ+12qgMHAvh8fhl0m5jspR9WVYODFNk8jZWqy2MqsQ6tz6b0sn/lHJjCi/vXKnRh4hl
         Q9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155247; x=1793760047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=dKRROH5uF+RR+NV7YXo/npTIqUhZ9TXnoplO1tyy/1S6EogEoWpQi3PmX5X+ZEpgBi
         n0/ss8IioJlgxMOnx1/uxTdz+8WaZ853LwogGXpRG6774E6Uoh2vknHntOqGDrPi6Us9
         TQ9lQhutKChyRk8rmUjlaIgQWGYqF0y4fZPye+axe1tAZtKz9wEeLP+CCXn7jnOPj4Yo
         KbF9JBUo9YCD9g8dQm6LZnogMB1oum681YacbqRXZBFueQNRgA1ksFKjGH9hmolFQ9t6
         nTez0/0tgA0I5SSdPB44oUWfr9qzG1XljY4rqMSq+OwiMu6BWugfvnqE+j+tooYyVUb9
         nuSw==
X-Forwarded-Encrypted: i=1; AKwUvBxrR+TktRRQffLtMpJtjtcI5wehF5+wQdL5CerE0Kwlx4SKOmWbSlLKuhu0BB0/2dX5j6OVEPSKBjkxhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI41QFtxuLIjwGNdL32i0yvyK04IFv6WR5zfnKpIdiYjJpPsk4Y
	i1mgrEK4TIfP0SIRMMIOWT7b0qKdCbLddDqmen87Nlq5q+Hdlf7fDeIt2mGhIFCNmORJZtQNzeI
	zctecEKIfGhzfibZ0ylcah30fIiwnRwRZJMZuPhwprp1dACPC6fyGkUKpmXqaORfzdMy5Q9gjXY
	QZQgjjvqmJnio9nXHssHcJG2RLGyb1kMWDApXsDVHJ
X-Gm-Gg: AYBFou0cJVcBVgRPA/novM708o+7ufpVvj2OCZk6K3rzd+bX3lEGeII/bOdYjtkLmVi
	Nsva4JNbyGhBBo/v58qYirvlwAAQ/TWvpWczs09T+dcZ0tGAzbXkveqT/sinzpkBCms3LWhgsJZ
	BaGtGu2UPE7Sa4RjQqnZFjBjBklGm8L6k2VQHp/e1ExphgDTuTzfDMYdHp/w==
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id adf61e73a8af0-3e9023e1c1emr828633637.66.1793155247570;
        Tue, 27 Oct 2026 19:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id
 adf61e73a8af0-3e9023e1c1emr828612637.66.1793155247093; Tue, 27 Oct 2026
 19:40:47 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
In-Reply-To: <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:40:35 +0800
X-Gm-Features: AclHuK9R4i_-p9NyTVXeDuSZ-1inIa2D1mlRB5RBblU7VSo9hG-gWj7dTK6LuCw
Message-ID: <CAFkd8hsBqFQcXi66wWsZhRt7Sm29jVL0vZ1aW=NR3kwjtcsQUg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX8BXaZUE324aw
 n5/y/EFERPjpUou28IUi2dZ5k91K5XPl16mee/TkwTaeVS89xdZ8eipYwvYXsnT0gCfvpvY3JZ7
 Canjauwf1v95rv68NLdPMgCX8rFzI8o=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae160b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=1tmr-2Z58gs6IC_Pm1AA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: f7YxKjpZWUX9r7TXdo6Nr4_Pp9NzNl6w
X-Proofpoint-ORIG-GUID: f7YxKjpZWUX9r7TXdo6Nr4_Pp9NzNl6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX+aldDnhFoxFM
 PVSqd+L8VM1SUw3RIgoizQAl4k0mlraHsbloZXzmcnrUSNuIyTy1i9opTY+04xG6l2Tt9f3C23z
 s8lWQiCsfEQMQJ+3RjQPf8ENmbZfGa2c/yH7G3dXmklUPITKUImz1GD1D5M+tbn9QyxErL6oTcB
 BMuC9kyPY0znxSVY+mpmpe0WCxPsugBMmVQKVVCfV/pij89yltk8fy0u++5USEMQNXD9byY63of
 JWHXnlg+UZ30A3tXadSCm8tplPb37en0NqGf05jepSkQo+VrwJzK4m0gzkbWl5yKAhkgo5RmMRP
 dgK0A+Z9CnZgmvIHlwkVV1FA1gPL51xTJB7goeDKWwX1edG8eW3KtDhxHU3TV3/Khhw/LgXGfFr
 Zb+l483CDRdsqOgEPRvP3VfzN47hdu76dqQs0Ouqz6W8qurS7fljFPv6lnIwJ3uHA23Kqk+mjbL
 B6l2+RMtKG9MlAFAfWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280010

On Tue, Oct 27, 2026 at 9:47=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/26/26 8:25 AM, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> bit more context would help, why you need it now?

Sure

>
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats.
> >
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v2: reuse q6dsp_map_channels
> >
> >  sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
> >  sound/soc/qcom/qdsp6/audioreach.h       |  1 -
> >  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
> >  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
> >  4 files changed, 16 insertions(+), 32 deletions(-)
> >
> > diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/a=
udioreach.c
> > index d2dc5d37bccf..33161523c7da 100644
> > --- a/sound/soc/qcom/qdsp6/audioreach.c
> > +++ b/sound/soc/qcom/qdsp6/audioreach.c
> > @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u=
int32_t opcode, uint32_t token
> >  }
> >  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> >
> > -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channe=
ls)
> > -{
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
> > -     }
> > -}
> > -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> > -
> while you at this, please remove AR_PCM_MAX_NUM_CHANNEL too.

Good idea,
Will reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL
>
> Other than that it looks good to me.
>
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>

Thanks
