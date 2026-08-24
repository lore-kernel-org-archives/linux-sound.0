Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0AD3A8743
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559782; cv=none; b=DDi6I9C+FoDosMgfEYAX34TNoWZkQ+imUjgB3lCFd3K0ZbgDEkpVWkXR/608+7TZBjzzM92KSRjX+a7+jRFRWDIlVWkyJs3YNEXQGH6n2MsrbMnG292EPy+vS2OSntrHvz0H0klV8LnrRfxPBXwlBAdHzUzdwld1SMPjqUmZPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559782; c=relaxed/simple;
	bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liqjJpY+GgnMhrU5Beu5SUwfLzfYQp/WYCeYAwP+GItSnCzmPOnZsVFbdkw/zB/8sHuV3u05Rqpzq52l6IorTlv+JdHg/g4IBHiCfATLZpiv/BEBSXoo/lLNpcFg2antLcX0ewyB24zYIrrvkFsxkfTZl12JxSTNwjcIht+vQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O51hXF6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONPpbNrq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O51hXF6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONPpbNrq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BgcH1815873
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rfclZYf7Uzx4bu/Ox2iIC+60
	XIG9HV2XUwYmcsvUYYM=; b=O51hXF6Y7PmN4YnhSBtH22N17WGEzBzVJgjos4UE
	LkzESPN90baTSC1WztVz+Jh4B3YvIf2yPsCqnUyqUla/FB6z6i+JWKtIH5Uo9DAM
	JerXzsx7O1Wi4UTqYQzkeQN1RK87hNaeddlnSBjW7u/Ripd7Ch2xeyuwXBXLjljH
	JOKw6hl+m3Nf7xwPkjXt11oQiPqdo+Ig/nxwj0buEdsr82ZQrxoD/ZxPeiiT8D7h
	ZvBddJAV62fCt1kSmJ7cFI0hm+sWUfh1RUyO0F0O+cSVOLDSitdTfIa6GdhdDCPP
	68uowQRgQvppEBfkmNnqdkrxOyhxnynhtGsQeJNA/Em8nw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtg8uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:23:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1de16ea7so3899814137.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559779; x=1788164579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
        b=ONPpbNrqfgr7+lfg8Zx5+14FufSgVc/xyFc35MaiQVV6M0mlJiwF7ghwnCd4xyqOB8
         jKHgPDsaiOZicOaZ4Qcd00uNUJujCEJ8KvnJv2zF4JzgVjI5KFOmORJtj3qTzbWuheH/
         f3aGQlRrMCu01Ej9fS5R3yA3qmXcnNDJwx1tFi7CYeevJwArloK1BCiCfPPXLVBaUJrm
         E9bWegmNTgrXFcE0a2hVlkc2GNN40fBtxS2X17QJq0vUI85NwgkVcYUqvyh+0eWk6b9a
         QxE35N8JbGO/A0SWvwEb/jmTEIUFLpmQOvYKhouska+2Cc8YPPdwqrMQT4nPXy5iS1uR
         Vvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559779; x=1788164579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfclZYf7Uzx4bu/Ox2iIC+60XIG9HV2XUwYmcsvUYYM=;
        b=j5ysvsSADYU1TqM+BaQ9jxazdL58SQl9sh4rEamE84wxvjjpq5PxDtE9ZjKvQUyfAV
         G9fDWU1yLD3MgwQj6DrEaKeCOUJhXaPMU0GpKSNFCKspkiUb+K0NaSfOnj2P14QmZKIO
         Afv0OxTgBPSQm7X3huRWELCJ1kRoE6BdOwa5mvbhwYv8twecybOwOtvnendxRRUUQPtz
         TO0X6xK0fC9SHM0eNdXQ+sjvRStstfYacnpNtpcYK4SHt55F5SR6yCQVu98MVpaC+pDK
         uGozyhT+vht3Tcxr931p/VZ1pFJBmzc/+EioUlRoQFelDAw9j9OmsyYM+2pTsG9DfiPJ
         L1xw==
X-Forwarded-Encrypted: i=1; AHgh+Rpkf283AznL0klDP8+qfJ+dKvxHUuGR+lcuze8ZGKfa+cOpWYZzyAXpzhr8IMzg7HVBTLwEhBcBsLlsNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lfRFjC2quQrnEl4IxfYPKx4OvO4qW6Fa3BZLLGHxAg1japcj+h
	dSfruEsbtFg/KRCYtBv+h0knsSou2+B3k925njd1cDsdYat34Ez4sBQmYOBcGioxAaCWfrU2t4P
	J5N/rWxg/9zZYAvuuoDGVN179+O+KrHN4PLGUEar3H+L/hW5MPRHT+3hdVYpLKGfwHA==
X-Gm-Gg: AR+sD10Mc3jrSq/2wGFh8Y3IRjyAxiwJ4YbTbbCd7PMoGGfeHqTHRpcaMOHZhIb0UOX
	vT8qmMPryk7+eJL6y/yRwRMc/vvuxk2no+rXPdFFTsgZbzpJHPZhCqVDtCBO73iLxPva88uEPPo
	Kxox0W7JkIUZb1XyUtAPe/koY9zK3Cnlz8UEvjQsuQKcsk3cyj/3foXGgXhrKIYA9+rala7pIog
	/JvMtFD6GV2lP6lHzea39sAWhBxEXYnnGakyk4xVMh7gJquYAuIl69FNWkEM2uFOezx4dtcQmHZ
	U0Tc7vQuEkZRLDVoOv3/JTr7KTtyDF8H7DJXWsGYonjqrr6LSBQy5wvzGPwOgKOpCzONFMrtkwS
	91UbMW9HPlKvsxgc=
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id ada2fe7eead31-778f2cd6323mr5698352137.13.1787559779095;
        Mon, 24 Aug 2026 01:22:59 -0700 (PDT)
X-Received: by 2002:a05:6102:834e:20b0:778:290e:a080 with SMTP id ada2fe7eead31-778f2cd6323mr5698338137.13.1787559778563;
        Mon, 24 Aug 2026 01:22:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1aeab9sm8341362a12.22.2026.08.24.01.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:22:57 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
Message-ID: <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MyBTYWx0ZWRfX/QpAz+NI12xZ
 EW9kJsIVufgptj7QMnTQYdpLLGbBnbxyRqcNmm65fWAKVU8jOz0C9AuftDQcfsMRddVxTUs/X9d
 BAIcrzDDrzGA99pK62j3UK+ppEuf6ZwKHJecWkG2f1DI8EN9YUTb/BFGSghBVmTeaT4XvWBfgYC
 ebMJcTydclzTCwmPSyJCL8q0zE+qkR8y8//2Cox27ASLr2XHuJZc2tHN4AV+gFbeHDttbkOPAs+
 myBfvmqbUD+zWMOhE+29o8+ANRprwxwMCZJxAbL238OaLbzu8LhhcuiJA+N/ULz7hDbIT9BYG0g
 DHQU3ETfRxiDCt4du5QBXbVA/qV6/2gx12fN2NX9NlGgGw73I2WstVRxXrG+PXNA7d0vg8ty0TL
 0AgBOG6vNODIvBPjUZgPnU1kJwpVho4w3oWgCfOhBwEi0LPQeysgdKi6E3ZSKMCDyW5bVPsAJTn
 mmnpMa4KrWDz1dDBZag==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8bff64 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eKVyUmMguRHMKu-RSS8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MyBTYWx0ZWRfX4yESG6Q85gIA
 /MjDS7+YnStOgIZEKqG0lit8/FACMc95kkNdzrzYmZgfIxN8VJ34IfzyFBMX1Pf9RiWuN5dz/bf
 KpDx6d53bSxJyOk6QOGq/Iv6u8bjL/s=
X-Proofpoint-GUID: qqu_X5qe1EIOqGArmbGytHo-DszinaHn
X-Proofpoint-ORIG-GUID: qqu_X5qe1EIOqGArmbGytHo-DszinaHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240073

On 26-08-24 12:06:27, Harendra Gautam wrote:
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

Commit message missing.
