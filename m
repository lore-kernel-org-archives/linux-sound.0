Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2C19ADA4
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 00:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571189; cv=none; b=BfeYy+LOVcw0VZsAgSItUTVVrkEk/Glv9iFh+pxv8r1oKMWV+CrPMi8LC+DfR9W7KIngIXPPvcqUZZXQhFac6/bX97SpSAZf1OcZp45Y6eLUZpRCEkMQPAz7IQVudduet+5/Y4FwLqrx5PHUcY0L4Ne6b/zgnmlYNeOSw9LgLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571189; c=relaxed/simple;
	bh=NnIebMcgp+6ImBtusDRxYTiIHFgo3Luuq/SXITrMzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDj4YKc8BoAsVz9o6jMGch4/Q247rlEluCXPPPd1P9sJyo1Yl/s4EylHFDQI61fzft+i1ecC2h18AALF6KS+lDsQAValx7Sw0XwuxXqcQWYNcfoc9dWaBBE7Xk+fFiuZyeqJMx66Zz1RXtBxSxKqGFJNKfo/jNEA8nKje3dXh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrAdGGlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4gntnBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrAdGGlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4gntnBR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Nx6I1561418
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 00:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=; b=lrAdGGlrZRRLEDex
	k0sZXLQMfHuETQmNgwzIk+7ma8Ml0Nvm2WX1ilArVttLWfr/UD0DIqZ0QzVIqu9e
	2EkI98f7/oID+Y39zdbDi6n0/uqXsN89Gbr4iXMCEGdap6exICHYMELDwzHQjYAZ
	lP+eFMIBHV4/uhqZTsdycJTg5QbFZtI1K143RBOZ05Q8GuEcbdXJg9AAmAlDpqcD
	TatIleAma/GFE5z2XExSABy+kgteZSGOUHbBb6VTzfAHP7QpJIr054OIbKAhvwjt
	DKdTnN/GR6taxc0qPb3gABIW2v44h/Cilb5Sr9LZl000P18B6A+z5lrsmvFnBzp4
	SNlTkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbtdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 00:53:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b9dd020cso1019344785a.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 17:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571187; x=1782175987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=;
        b=O4gntnBRNoMk0+qEUeiM4nCuA+0BKXHC5vEfVHt/EQrPyI7tT+0OYLnvAknzN8pM98
         77GjIxNjnyfiX292YQZSE6BDNJwm7E6x6hz09RWr7dvhGbrboJXO+olt0vCNppfbK1YV
         3GyYHr5vIAdgtAIyFoarN8CrMUFcypDc+q3YxawPzGCtSurLv2GWRsWmbbisgFDXEZOd
         Hl3meERGs1dGmWLcTZrCNkimbKLsUuRxhWGvkQuDbF6K3fQIY2M9bHymASf+D6z1xX3K
         YvUdrGG+6DCuIfCT7x67sT2kZzzyZblue89HLWyZYYHD2STQcpXD93SeVis3qK0t8T9N
         7wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571187; x=1782175987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=;
        b=FPqGZaTjo4ERWVRiITYIUkppe9PSilA200faYB6D8apdId7bmlny1H6L601e8L+Z7K
         hGUfpaRRctWziYIDx/ZnS4Mc11BIakDazzMsMXDpBz4WwkY37hZS+eVHcKx+UOhtcvc1
         ZVIm5+15MIL/GsDQnGplGAOC7VJlE1R47Oo7mXegFEymW+LnG9mYN0A5HhwJRwRwXZMg
         BgNyjyxnEDzf66yqZcVCPxnpxsy7CFGL4Zu9dPPJTvgKbOQMeIu49zma7GjgY/E4XebY
         C+uIIocmaCqMudsZCZrkTvIcHZjgQU20xfK+WrFr/i3E9C+XZupk2G7ecHHz8iFGctsl
         NaLA==
X-Forwarded-Encrypted: i=1; AFNElJ90t0tLrvJyyo2vMj2oqkDzoTIZzhFDZA+/9T41bHzWlKw0W4RD/IzFsyy+YtUhwWdcnUmqGdNkOpkhJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaodJtlrmMTYar2WOtAlnO/lgm2+GQbHtoh6/XGfXMW2Hhr2E
	rUeOlZcAs1pdAuS7OY19IzpM1q4uxS2S4TxH0+zen4dXWg1W1bfSJvulH039tvVzPqk04tsES4Z
	kOJNsRCtisXxmnWUHrylSkX7t/xtufPy4QbJL/2gVwt7xliwtB/OmM6D76TJS2Sjq4g==
X-Gm-Gg: Acq92OGM2VrbnTaTO7Cew7yyRz+aLQb9VcMTIoQfrUhvYGt8e1kF8muapmNfiX/gKZa
	+ESvBmKOv+E8PGbU2QLxTqtBEj7av8mMWJaBXj4BtwwCmtbY5J40h04brCwguzdF7FV02gVVfKa
	sBmg2P1wWj+PTQqVPk891EYwkD/I7fiQrbBMlv70doqE11qedFbPP3IOtXoCrdXQHZr0t9YN/DM
	GA1n3/sUDzVWZ8XnGFHBrrlSJDYXUQXe8kCjXHtstXwM7ol3jzX/sa0XgjrFryCDr7PevFJJn8K
	jgit9rVARXSqE4dbK96OiWQN/4TfS0Rq/omdxYTSD9ndPDlrvPjyyA5dR+7mFYcWaHXQUDn6Eyx
	b6vJvXqaAVn6EybDam7ga7O6lC59jPVDfttT+bHXDADAwzVf31blFoyZGJG8xU2wGTP/WqLkvEB
	DQk4ZPbb7JVXIjn+NdRqd6G/SvhavSPVeb/Uo=
X-Received: by 2002:a05:620a:1b82:b0:915:efa6:d714 with SMTP id af79cd13be357-917f243b141mr2084927885a.52.1781571186584;
        Mon, 15 Jun 2026 17:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:915:efa6:d714 with SMTP id af79cd13be357-917f243b141mr2084926185a.52.1781571186083;
        Mon, 15 Jun 2026 17:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b5031sm3113027e87.79.2026.06.15.17.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:53:03 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:53:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sohil Mehta <sohil.mehta@intel.com>, Raag Jadav <raag.jadav@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Message-ID: <wmb446maxntl3gvujkdp7rwr7vsdmcptw7abmp6goolu6g5zum@j2zvqjnowjas>
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
X-Proofpoint-GUID: 6vMdTciH2EVyPUsOmuH-BEhj59J6Gllj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX6koaZPa04GrJ
 JW3yj4D/q3FwqW4rdrW2CyRlZ3EBrEh17gf81atxgzJupMTa2Rdyzj03uDtb7o9tPzVMQUrdP70
 jvu4woEQ8vhMXqi2rAMqfs1zG4yxqWA=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309e73 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=IpJZQVW2AAAA:8
 a=EUspDBNiAAAA:8 a=Y7cAMVT_gd59W81BrzoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 6vMdTciH2EVyPUsOmuH-BEhj59J6Gllj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX2z8/tLJCN4Gf
 UsCbuG4+Aprh9Y/mZnOUqZJF8Y/IQ2kzc9YJphfmPAuT2nYI8VX0xyEBQkiwjHsKNR7hIaLI7Qn
 TRxQ/NWfq+54qSBjJiJIWycTmGy3RpPA8XbVZ1/vPss4AzZi4TErhTYqhnGrkK7Ak4QcNT9L20P
 7XLmVxuPslp8Jztiq91WBDwzp93q12avR/PsDrYoso/SdDvOUbNmxNea1vcrohxH04dE0ewePtA
 lxcdaLHEfluM+GJzWKEU3OzGatS6hTDktsY5UMVed5IlZfUCozygIV37Wti3Uqgrl8E25dQkhBx
 +RcHOfAkRo9aHzOAwYTiouJI8wF8MBQPmcVi5sgcoSr9x7DtLZGk96E0mjs9Mw0uTrMqB3DWc/A
 2zs6ZZL3ps4luJGVe0OQtBoT0z7jyFKYnNBKoUtls16qsjzJorsaszxQLgGIpcfXx/BGaNThlDh
 xroMAsC9HS/K5GVTZkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160006

On Mon, Jun 15, 2026 at 12:04:28PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
> 
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
> 
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
