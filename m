Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C21BC2A
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101054; cv=none; b=To5Q8yuqlkMeid4eMyj9cYo3cpDSik90WAEekDkCtbCJr7JbG5eyhOpdloOh3lXi7L2yNaj81fge43Tayx6NOIE2EPa0r+t40FWfti46zJXx7B/UksDDvivjMqgJ5ZGlrH3oVsN8g7/axMdizxKesn3Zk3DfTuT3MOYiykJqcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101054; c=relaxed/simple;
	bh=VQWCIUrbKweKNWorNf7KFwPTbOnRWvHmue3DUd7hCW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgTkXM0kOrC9OixD2PcE0n9tfe12YVmaA+gJ+tCLPBsryTU7UA4AZwVXEV/2lWF/NTWPAamdyVtFiXVWXbihBvRGlJPWvOxwyg05QPXpYsIt/pf87mLhEW+VEwvA0IDtAcveS5YgyJw4vIj+3fdy/1sMlEcMAd9Lb0ZBSswQyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZkP6IpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HL136g9U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZkP6IpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HL136g9U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBtuc3148317
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDBB6MSWvIU+uCb142BM52FL
	425T3hgvc07Yy4sfD2U=; b=nZkP6IpYkgOyZjCtuUwwRI/ObSj6aw7Irq10/R97
	PPiuu9fKLJwceK/Xpa/ltlNYRujyeGcThKXjnd1ZPj5BOWnCNOnOT+tuwIqX/9kg
	KPHv56GsLwKOToA1ScWSDHUqqWofqSFma5li/xOf+VFsbJXzKPscn2meX2n5aZsf
	XtSa6ak0iWjrflH7/qf8aiyE2D1I5OaO4RYJrfzuX/e3VtNDkNowVusVOqEC87Nz
	wJ5TX8ER5EDtnxm7bXTGnP6qHbg93W0JM7UpnEpZ2OW0EXBM4a3Wqe4flApHSn5I
	uOLdhni2r/07ThP2hR/CEJLCeB4ZAOY0/M80kRu9WTivcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5uah78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:04:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so1441655785a.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101052; x=1773705852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=HL136g9UKbHSedrtjUerN3cCib9lfxyUL+gVy1If8gubrc5bFeDRE9KktfjMH8KeDr
         wUitAU1ORz6QySSi2SvmBdOq41kGbOdWSAb/iHbt9/gmHJ6kijPybCcrdnb8yUwV1Cna
         g3uORZV3Hc98o8ZbXAgApWj3gxm18s0szdrQ5567FBaK557TRRWDsQwUTggUaCaCEF6V
         x7UD02LMSFvajQ3bUccJXPlkqxbCtDWcKdsgjksy+Bc961OrWXNjszzx0hviwvyaGwmm
         Hr8p4AQrzW+FCgA9WlHoB5wpaKbK2KWI0ZfXr2TPdhUf/vOc1OjKusRLptBT62qLXm4c
         U5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101052; x=1773705852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=QfyUPzIAtg+RQFKVWH5kH4CUXDqG0DDBYzPs3DwzOITinPbVTc+na+84nsZTaTxjP9
         HPRRcK09N/S92KHjoEFEnnTnPmSfMf37vy7H/+lvO6gh4njLxiFuGxjnH85BFnY9BeRy
         YY5n3OgKvOjFwDXgL3c5OGJ39RDihcREajx+MvasNuGZ6Lx5Ak0OmYSRrW6NeU5fd4Rd
         2LxfCnmf86DbXr1n1vdxPxRYaqioQ5b0hjyyBby2OP/qLhsK8RV/nBxOtYkjGvh6hNIx
         0915+yRT4eoDSGzeszOQAmRkV/cFfAwI6IMy9+ZN2jG+S/knKAsxKaHDNpgoIQMrg6Xx
         lI9w==
X-Forwarded-Encrypted: i=1; AJvYcCVSlBaZSDfrYGSIYfvvqyIN9PODKefr1RBaVrbNU2p+2IEZ6x5JxBwqf1rEm9ln2hL6sKOQMB9IAYDM1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZ3iX461Hi+7Vz5P5BCr/2HThwEheHbplN/9kuME6zL9mFvKY
	IvifqdVKcp13Gk6kRcWzdHE4GDk6LX+Mg8W/S5E+zC66b/KHwUb2oQ81BX3PwKZbLtORpliYc7N
	IIZ567MLW16+WqPF7n2xRzH1OFx8owBelZApu04dlnxj0rEy/k30UsNY9MJk2NER6HA==
X-Gm-Gg: ATEYQzzE2JAOg9EqYZTGKFXX870qsHcUcomPpmct+fronjSvSlM2hwBcT8QYv8exqLT
	Ya3MDbRukdbL5fO5jiRei0Lr1YpOM6Cy9PHv8ijL+ttFJFZYLxrBm4kCtCr+h6VbN+gQfP5+UZV
	AjiPXhP/Sz0qEBCDFwzGDY2kgmGBNsBRMI7W9cXJJeqeoGzufBlkTiDBcyryIpN7wNcbdRrbq4+
	fB5SfaDHcyKC3qSDZnjNw56EMoFkXvch9TOHJDM520oVc1yTv+2PfDXPYVo1p2jSggCJKxEQj7v
	pmYhnxie+P/XBEfbkA+WDRNHMHUiPizffkaEknasjbaenFSW6moBo+756eVTrhG+nOT3LInMvhO
	0ncVRuRDUdlUgX0o4EGMARSN0c/z+m1m672asXewR0Ttk/YC0yxnxdB04cmUKv3pdsqJMrImqrM
	JJhrjHHWMQCQ2p/ayWarWqJHwGBf5VuoLKTHM=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634216185a.70.1773101051672;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634211085a.70.1773101051178;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2378748e87.62.2026.03.09.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Message-ID: <3yzmnaovl5dwhxc7r5dr4pjrvcqpmlec5vrlzhnj2cnpobqpq5@uvfiuyakrg6b>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: AcHbmI7Oxk3xD5shoqKox7tUGSVncqNB
X-Proofpoint-ORIG-GUID: AcHbmI7Oxk3xD5shoqKox7tUGSVncqNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX2IFmJu+wHoFc
 1HYQRxJorIgCcsYoH3qfIq/EeqVe5gA4eQ2xnoGk1svZPraa4cOXUFfHlNoL72QW6gZN/4O9IZQ
 k+jRaz6lUXtPQQmsefV2DkSOeAkSC6PIBTovcl9/pdYYDtmBHWR6ymo/McldSzT4yFpZLpmnJzW
 oQkPnhJzFjyNFdgbugARtD3M04S14gX7AW8zU65gRO4Hn10yb0r/rJ3hdRFeSyzkTL7x8hQ9nS4
 4NPEpONw8OfUyMKoXT5uBvGolxGoxiJZM5a2x480gC+KczyK01nh/IQWidMBjYQKiybqVcaA705
 vX29fVieZefrGFByQLMG+z9ScKoChRLYMhWHj4X71ogA5OAgPfIFaPTokWBTLngiKZ5y3iPcFhC
 tGETafFIrZgGIpQuGPW96Rtb7geAYx+vcIAmHLDhz/BLsSAbYWT3+Wff6za5KtHrCXbvRWsQ6dl
 Q5LNajHrbWDhS4L+i6w==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af5ffc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cjxZHsy2hmLZGnxokmcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:30AM +0100, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the

Nit: see Documentation/process/submitting-patches.rst, "This patch"

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry
