Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05668448BA9
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905631; cv=pass; b=VepKku+ABSACYgM+1jzwefxMoT5ef4+mEOpLyUD4VHj7BL6/HmCEI0P25AqiKASqNOMdi0D+H1RtLdPr+h7aFmX4W7AH6TovH6ItyeIHNsz928wTsjzGdUboun3Eh3WMCSqG3siAqj0Df57V0wCoKHX8bMd3i8peUMHBbNg0rh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905631; c=relaxed/simple;
	bh=TqF3wLHIA1jAdZt0Tltgjjcw3xRF7uJIwJwkCK9UGR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgmegDkLJ2XKuIffQu3Rr2G9gbwTy2sl0mJPDHgKu+jaymLl3weu24iEkWebxcmj06VS8AjR59iP8jcbh09St5a5KNzWDVsPvV3/UGLRDoCCzdusGsfDft2sxSwoTp4vJD/r1jczMLyyM8Jd6hZVpjysHHJ0F3uE/cdPzMHYXds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMNYH8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxpEU75B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMNYH8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxpEU75B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbDVM3487371
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0cag9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 15:07:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so83058385a.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=kOeR1zkQBodLAD3G6mQ4xKruDq95V0CmdJSG5QixPgWA1vH3u9pULplvc+bzE+UQHE
         X2s00H8y8oRoK0bRL+KnFLbch1yQauRnjQ7V3duJMjHi9xc362LM2fMzFM1cntwDbexL
         kJtsOVAhbpseyv9BHkMyfQwJ109cIw0zU72L7zNBPMc7vs3WKjqOSEXKFmdhxoZgc+NO
         QkL2SfrHs9XdD/v7htI4hieEpcuozzG7momUIzxmcRX0VaKzSWHgQvBJ3rEI6mCe5jQr
         ugFJIXuMjo/dYsWWCITRD/E1LmJFQdNQ3TojRrCjXuBSWTS6ZikrilSiiWGtOCppyKGd
         XoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=8e0IhHhahquTs6KR6jnUfQaVCiNk0je+fSgDv8qfpYk=;
        b=hYChItrJO8XymoUKWnTTPn6Yc/BD4uz/hu24L0ioof4Mifs7CpDzMIKGTWhv/bMsoX
         8ZSIkrFouzcemGg2T+IIFDmHgMfXz6zXDsG+8Ywd5u5eQBTzjYj5ahxTboB2BBQxgcJ/
         v93EQXQj+oQuw4RGsdJ/AgfO7XPJjdtVRsX665ONJiHeOZRgxnNQtcYQoQo2LEc/YwHU
         TkrHHsK9BXk89Z9cW7Bwk4RS+/BSlu3CwP2DKjKgaOxn8qhUEiLOouekzoGqFgcCPYmZ
         n/xlaCbjuFW7tf9OH5dk6kHZWCV2vkJOSJzt2WqsNwePNjyR4+bhB5t8MJj4elXWj9JW
         t2Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=JxpEU75BJcGFAaPUZ+/wUj6q4yHKXfY+srcPSOK3Ckb61ZNhg6GD4cHqefnm8+C3Wt
         AVBnMScCSDWTsDiCqZMgzmpzO2IabglLt7S/4izdAo5QNYmo9lPP1qNYTCB55nktSkpl
         PEOlnhRQm1E8t7VhCgg+OcAs9P12PJnGc+LQ2Ax9H9a7BprU6n14k6UuyLWBc/4P7QzC
         segY1AS+4t+ZAlWyPN3TzL4REiGQ1GNX+QqC/pAhZt1w2cnLBldPjfG/OpjZty9TMOvj
         yRx7jll5WINMV755kkXIlQwftSOHHiV31VdJA1WxamHS6Bl1+dIMApug/WLStHu2Lc+c
         VJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=rSkOXpkE6hrCCPr5Cl1fiQ5XZ5mkor/pK3FaI9vNJnB+5wO2bXB9WBwEWsPU5MM4Gp
         NzALfqCwbzKuhl7EfA6mI9Qn1WPVXIHUNHf9in11Bggk8fyZfsDSiIC9Put5iTlEd08+
         U7gJxuOijekz7OTULGQz5DmkkNC3yt8RlaLFvHaZR0lqFX2HEhCxpfw/6v6lFSi3mW9z
         N6iyE1x7XDQTQzM1/9Bt0L2LgTVPfW78B4v6noI3VMvCXC7CC4nlXILqRGKgK8m3BC2o
         mWF+0lu7yd3A6STquC4VkB+r4aSVacP6AhrPkpsx7bK2Mcyc/DZ+803+yj5gjfA/nFgA
         aMKg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0ZC90XHFRmLezov+dS5FN/1gF0i1z01d3wZShItojq2dhgCx/jbr4QowmCFRoBM6R0Wu2Ka9sNPTQMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+m6gtpF5XVVwHD0hL32QklWVD61vxdT0IfWCxdTdNM8SGpR0f
	CRCgcB6JiIOwnKo9aoP1iMTmeGppIkN7tcs70iV4L/eO+pSrWMvcD2uy0IGAkHupPDbleiImoMM
	grH0+tn/NivQzgNXzqn9+r+i/GBhgjaX8i1XWOlsrD9hbHA4X9CgIAIPIMjPD2FF+R5s0TC1wV1
	xvROy96gMWBNJgKOSP2Z/4E82GlDkWEB3V8030/W1n
X-Gm-Gg: AR+sD12SbPsiYx7vglN/xQhu5iQ9nDI7LzA2MHJaDgKwubRn9E/SH/h/dCQyvu8gQqz
	rOetJJSljUqrGSl+rS/gTtonKwOAnLhpbLBao7mKZNtilC8dKDzdxGAGPLIe/SL+JBC0DCiS8s1
	73b0jGGtiZmM8ve8wRomrcOie8AAXuC+GhfwaPwofaQTloQGOBQ1d+uq8vRg==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772237085a.92.1784905624000;
        Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jWPq6fORZW0Gf30Bx57tZ1Lgot1jUQVu
X-Proofpoint-GUID: jWPq6fORZW0Gf30Bx57tZ1Lgot1jUQVu
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a637f98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX+FuJOh0aLQrH
 2R1PyD5C+0HJ1RByipWsfvuFYeSnKIRin5u8ymodBK4qupw0vTBQ91TxikZu6485ltaSSMW28ps
 Dm/PwM/kmnAe3cP6J4v7c+Osedjm3mPFC8wLOc4LnO0h+wf64d2zKeNlpCEEXPzBz80H0Dp9iLr
 jBTsqMk+0TwwzF6O+Gc7KExR/IDuaFoMOKgLaF0y7ZUZnwZQdGBVBxsStJkuydMtQSUvY9gnweW
 Ovmjh6AHdlByZNBJ2U21EsiO6KhMuOZiZ4zK5Ekib7sj4yTvrT3ev1rb8rFpu1iw4VzKgFZuMiO
 tdXKxhzUNcVf77DecxbsO+R/xCqfQS/EO+f6pC3yTnkn94HSFXfLIze0Kods9u32X78219yZMlQ
 XlTziYxrY1DifoUySQI6MBpm7VVcYrNbg+5hiSGeV8sR5SmvPwsUs4JvDhvSM6cAnZnPM1POWqW
 ll2A6MwOI3PAiLTnKYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX374LnPVqLJCp
 L1UDt4quWladtHRcV/tOVWkPjrOQ510CRuCd0lqn4Y/o2+fXOfnRBItzqYV6fXEEppzglVGpNet
 AIN1F1ZKxR6gOAgDNo5sABxZMa67gn4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240136

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
