Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C23037D11A
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481739; cv=pass; b=icujBxwv8nIfKE1Q66yUXLKzhEmWEmrN9C8gsHXk55KvUGGek6I1DKjivQ1XxNJI3SP2FvJnyO/XQsG1zbeE6+T0n94tEe1LIHl86vLjpbMks+fI5EYzlV211Ivk3xUV2HHbbbGRarU23vuYRNIViME2OKdSGhb6aftndnucMmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481739; c=relaxed/simple;
	bh=ImyaRmLghxFwQsTJnShE9IsVAyUjBEQQdEnQ0b9Byos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhH1h2IcEwi1qU2JnKZIMh4XnTrRIMWMqSBcRO8ZOdivI/Ad7+iGT3xQP+sA1pATLNMv7+FPQc3MXIhEBHQ+fB1+6FOLLjo1HuExF3uGdSHGnXF7GoMdhceRFiQmbAyJ6abhCyhxsfWf8CBh6DsZLIBpJBPScw2BYSr/YULErg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/ZBQBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EatizQkV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EatizQkV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v56X1755348
	for <linux-sound@vger.kernel.org>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
	C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
	9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
	YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
	SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
	LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
	vbBXAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff00uf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cced8f230bso82241126d6.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
        d=google.com; s=arc-20240605;
        b=BBo4VrdMxp8tgMjJt+dWs/RelfiiRmTNycrMhDdomrbRwTwbT7h+ygjU7obyGhUknG
         BuGugZleIqVCm56bpXsNJXX7e5McKT7zY0hW+z8xGUWzA3hSRx+ubKj3q847/WWDV78D
         n6RC+avyaCMwl76wRjzZ+ELBWlrTxwhv4B18NF7mlU2dR8+7lUsSWtWDAYhID9d2ZWRk
         imzwJssUBa2PsGVnNtPW6NPEO8Vnk7+UAP6bO6TjmjA9m/f5s92gHvghk3urtE7gGrLY
         y2sXQNfVrptEE84ZOwmzLczDANpj1RPHHfWQ5g1/F3bL+GJYO5aerlPMJkn8BOUuRFA7
         eqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        fh=xPg56V14hT7B18fmIyj9mGR4rgLNg2yC/E03nniDn5I=;
        b=fKqlX8XEaUSB58rXJ97cd2s8jGtst7Rwd5UdMlG9sdLxEtSHDyCQQxzb/jvl2RaSqk
         4kSJkGZRE5RmYxf381yIEGbY9LwKsGfCPE3GhC1FBeEGYliw4tTnDYL0lqfh8lBSq9AY
         kzGHCn5tddSBm3V407YmDfTcX9dqrwCymIMjzjnQTSwg+H7DtkyxKvhbmQsYXb/uS24u
         LxjX4SaZC05yhLoZe9GubCRMntweOH5tl45qptl9c2Hk0PMoFY11SsT1gXn2xK48003o
         D+LR0zL16M/zYjauzA1JfToapYZSd3Sp/6r5sa98iKZI8gUCjQdZ+srOukyiHvyFPVel
         pqEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=EatizQkVu7YoBqs4qPwuLBDMEpEcTxnuqziYKDt0bPh9McXDPanapbct+i5amdkN3F
         Jajg9ZgkfC1/+jaUiPBGfN6wi6ZRDxc28EKDs9Erk02sliQ3TkNYnj7U7vizOnqwEO/C
         YL+eKxv0jnupOirDhq3mpKzt7RP7ts656r0cFVfxymb9MP41VbGf3AYdNhieLGJXf/ze
         2xt13struA3s6xht/UE42oQzJerwyunWlc0ifNJ92XwPKl20aQ5CEi/YveJoz9H6LDTW
         MuDA1GKISMtvP/l6g9fsxaGNmZ0xSQtsPgWMp1+c/FBoZyfq1TPeGfZiov1KEMegbzp0
         3nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481735; x=1781086535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=MDnvYe2d0K6dqxYYXr9Liahw2Ptc2Ee2Pa+GObNm5iVOXSz0PF4hMyIwY5skxa6Vdt
         d2ZK3RfWGUZWF78PeXXVjexLUQ+15FAO5CDlopzJAO6sTP+fzpoaWVrFB8NV3DYqgAye
         F4e40PC+DODKkzPWbob8BY/tc6KfmgQ3xrVZcnGghiP//bm379QYCxV7DZ7puEWcbBZ6
         lrPWWKdCymYUXzqi66EBkN4CJx7OukyKLGex6AXz8hUweiKui+TL9x1KDHA5C1NfOOAe
         IzoOdEEjaUWRK72bFk0O7a4TE3YNP3R30T5MC1NuSUuWAyT39XuoD1tlhnA7vJolNp1o
         /vIg==
X-Forwarded-Encrypted: i=1; AFNElJ8NVJmxcSs0Evx/5ep1G41LRc6xuedSDnVPUziFqs/V9/MNhG0+rhKL44p2WyN4Fsl6hAgdFrod7BHO2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0sdSDTO79sqyTr7/55KvbpZrn8kDXxUrvlqr3haFY94pGhYN
	slKKFvqzrm7g9elHjC2o1g9o6ErJ1a9rCyAh03s2yjMAGffkdI3PmBb6+0YCP7K7zc1drzhRpPy
	6gzRqeWuKWDNx4Nd265LqtxRj3d/Ab3DEqoi1IBIs8rEwRUy6+E94oLlFpXCnM7xLtCjx4FxASj
	nuOGeS+G7S5tPw7PcXExg//j94+kEL+UUdyI/ZdkEK
X-Gm-Gg: Acq92OH8C8nx6/tEZUSX0xQBNeuQh058ZblTUDlC4+XpFKitlQYMy9VC/nToI7HGC/Z
	wnQx/0mxKx3NXXzSJuoCXgGRQgat+hlz1O86jqPtpwKiTVt+6cdCOVi+FzO5dekoT7CQC95+pQ/
	QSpUnysHG+UrDJotn8zmXf4xjj2KAcDqYiUmaBT0nhWfUuZNzPqOsBtVyEDsvUv74rn1UlHZkEy
	wuOmApxXVFRRm0I
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id 6a1803df08f44-8cecdc03682mr27951866d6.9.1780481734744;
        Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fh2h6LrqEnw7bRHysHc6qpzeU9806cxL
X-Proofpoint-ORIG-GUID: fh2h6LrqEnw7bRHysHc6qpzeU9806cxL
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX02toTHNpYfAo
 9aKKdUirlJKr9GSnUXIa2dVznSWVEl1uUF6dhnBfvj5/8cGKR44XqE6fppaYrzOUSmlMqHOYkG/
 MvoB+F18JDmIQyMB4H1Cq/lwhOHwsEbc4YwuPjZkBt+sQpRMfYt4jtKswmzgNTiToGIFZzTkXJD
 P/xHGHKFdNxre/hqEWrxiF/Wv4K/Ce30B1fO7/rcNIY+Te03dIXXx8oAvxjuKA6lXKFbAimDJz3
 K1fd3/M+/gOBfmbHbtDg9B+WAl1mNytmDZnEOr503OKKk779yvR9m0TEtWr9g70q/5S4Im0A43k
 47ghlLI/1b1pOPRRh5Yu71fKYGctGpJx1AWNTKsg7C1SYX/vGoqjMQM3ux5RZddRLbqZS5FQKeS
 TKM3ioTCOY2QM9IvUdoQpP6UcOny+57pB7AhABsT4E6mYHho51YakIJrHksU1Fpe0+KCWPxtI2F
 6ix/h4V28zFXULqKCsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
