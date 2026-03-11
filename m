Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F08F36CE04
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192641; cv=none; b=epspqNTbjDu1llLv/zQFsOnG2iXt9A9XiAqyxX66SxfJBDkQcUFmTNvJsyuy1M5T+/Ha7AKm6RprvI232VGi4hkcRDsHFFwAen+vlL5aPlJiW6IzfgvzlLIizIwqEX2n+10gKSO4EMWpqXY5ZReR0LS2FbjwcFtDDclNN3htHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192641; c=relaxed/simple;
	bh=ihJwfkzCs6BdMROR1EIEVe2OLNg0Qq7mc331gjk2O1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeqlqrhNwzLWh2XLEeogGuJhHx+r9iiLP5cj+B5JpjdpEaDlJQquIwV98UZLdLxbP5wsewn2wYyos6xxk8O9YQK+QXsoAk4iqfqj0nz+EUfjge/RySKk7gsKgZmpwaYVJtSpuOKNmuhZnQefPle1YLMNkXAYJUu84T2oWCsxMKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP7ttoWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBotim0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP7ttoWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBotim0g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJHPWs3418255
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sT5IPYC4UnHqleGHP2h0UMI6
	i8sGmw3mElFsaqMjQfE=; b=IP7ttoWVPFDuYr7uWvQibNLDhF0OpKAYEs8F1ucj
	z0stsDmpJgQG3JAEpH8F7LB9ZTxyoi8KRwXr8lbn99roqmQAFvVpFpkOAInKe7Be
	AnuXPQqI7hT9Gi9ElBA35BhMa3zWEEIV7o9K4mhskk2w1HbGM5PsGUZTX+8vnCvY
	GczdHEO7IhL6y2L1N6HcP2r+Dw9TYiYQG53es8Xg8dJaurEaOX9JYP9NoINrO6Xb
	T1d+dWIkiT5H7lsYNxCKxslAwuUcwyRoMurB+PM3U2lmW9uxZoLIW7bLM8geUQKW
	vnVGoX5YnOdXNj9Q9c3g3B8sVef6ici/cVQdJYBAzGcS8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2av55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:30:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so68938861cf.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192638; x=1773797438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sT5IPYC4UnHqleGHP2h0UMI6i8sGmw3mElFsaqMjQfE=;
        b=LBotim0giWLeTfkWW4/uAZ0Vdal68I/2W6FPSUpm+HamIlxhXqgWmRFn83wrRFWX1f
         0bC03GhzSDD7I1I2DFxpae/L0w/oYlNYOwUx/zioeBXN1eMRwzDSkvycYyTVADgLY4ea
         bpnxmByeM75vNzLluArKJcslS3fGLPL0J0GTSaG6xojW0rckw2rHB9SntOPrRHPHP6Uu
         n8cmvcPwb03f/8x9GlAtm851ehj1WZBzaFxkTRONihDZYxZIs+TwvGX934W7ut8DnRO0
         EGU7a7NMjOu7D1MfyklgeRePTSLy2aTmgiDfLnzAghsCiA2taC+Xx/nKcMOkn0zLcDmG
         D6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192638; x=1773797438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT5IPYC4UnHqleGHP2h0UMI6i8sGmw3mElFsaqMjQfE=;
        b=aGzXt5Y1oSh45FcXZDnpeuc2NIMgGCiLr3d7342iwmB5vtxBQLZX3ZX0izNTzY/o3m
         F68hmbprOZb466L/yQKc0OUrsvlbbfrvUHEB+AmyTzc7Xxp6niJpGMl5qagfzMY51sSR
         VdilDiiavMIksnJt/Fv4J1oSqlGNhBa8sTkJqtc1yBylOjO89pioNXyYuF4qZuwMZFoD
         fJZdU7y7hZb2WRX3wGSGp/1itJdQsWE/FJnG1WoPDc8JstWafSyhXGPekcqUdyfRpATU
         5Gpl9w6LKY/N+zEGYAXUONPiEkYTtw4+H6GisLCt2qFGocwyZ3KykT9zf29/GQYzDBKz
         fHqA==
X-Forwarded-Encrypted: i=1; AJvYcCW098DRy5f/gN+IC2bEvpnMgUsO3joreBkJiWmLNnZnlwcePofrs+2PWqIhhYw/1EsdKmwoRiPOjLVc5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/93wx5qHQiyDsFcrw38SR4htR5jlKpk3r3GxkVOaJ7HOZIFR7
	EiiWISobbKytS4RDr7dwy//1bFau8UBJ97I3JEtYf3ARzGWhdY+87OhP1fxoiTbkGh/DuYb2v8H
	NK2Ay8YKMt7jNADYIa5CB+6VLw/OWtwDgypgBpOEcauUnAiUT/lNvsZZRM5Tz/onhIA==
X-Gm-Gg: ATEYQzzHxaUXxxYTttJTZn71F6nGQhnHnNVgPc89qbAIH/l60ggg9WurcXjDlwYoZKb
	u9ZxrTOmbm0DpdWqKvgvIHBh0uySYGnFX6iROtrfRmDUw7E4v6WlSptVQg1ioxAbnm6auEaNKWL
	G74SDe9CqkIT41aYy+1mxT5uvX+zUFSjROymNZa2dbYf4yCBbgtuwRB9J4Aq0n7h5345hk/pwaV
	45Ot9wN5rmPZdtNm9jEDOQd/84F7LPgCLj3jGeq1K9pHHxXKIjwEG0fXwk/uo5sucI05A3GlosR
	raJpz6B4jSNd2iAj+wE6DRJQ82ykwPc7zg+tfI5JaSZXrXjsgChjhGj6G2Q7/iBw91sgccdKN3z
	13nBfQMvpwDe+tbkBK4PBK2ybJ7V5bNY703P223BzIF396JtpjssjUbmxtEqyCItr0IkdvA1twF
	9WvERXlxgN/QaGtKyB0uHyL7sMHpsS65HJU9o=
X-Received: by 2002:a05:622a:64b:b0:509:23c5:3298 with SMTP id d75a77b69052e-5093a1cafcemr10426881cf.57.1773192638387;
        Tue, 10 Mar 2026 18:30:38 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:509:23c5:3298 with SMTP id d75a77b69052e-5093a1cafcemr10426521cf.57.1773192637985;
        Tue, 10 Mar 2026 18:30:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603487bsm134034e87.41.2026.03.10.18.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:30:35 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:30:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
Message-ID: <mliitly6dwqxvm5oz34ipnigjlqddbq3tjlzplq6z53zptxbyq@jcftal2n3u6z>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0c5bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vcyf5Ab826s2KLMX7cAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9U7QMWXlN5jXUEM5Zvh4t0q6BlqT7L-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX9rFZdeo+8poL
 4e6fjHrz+mz/Ajt+yFL0qX6NzpT9sbE5V3R2LsZidC2z2NYvtf3esAMm71BlFN6zjm9O1BNEbJC
 35uzsLNH7Ysn4u9raV97+wwS8KyCv4mROjBiFCbIT6cXO1Jec/fTUFtaSTehuWxyuh6IGfd8RKP
 K0pTf1kmAEdPebic6i/uNKCtmXcAVl5KCYMzCVy5fnoB+cSH5jyR22PONKRqjenXzNw4r/7rdTO
 awlQmnLKFgQxwYagQDN9xir7a7CpNQ5TG4BBnzikiSKS0NRvmWfaIsO/F2gJxyrNeowo7MJ+EZ4
 IYnyN45FOcG12JvcslWzzsEHoFrpg96PfYQjhXsPtgNhN7ZcikfNp1v1E0THFOpOyH4SqMPav2s
 Hna82vC83In1QMXSseqFmK3HxQMZGefL70NXvRi+uU/+vT4gcYHEfPcJWv5tzUryy+kD4672W21
 Fo9gpf/ySYoJux/K9bA==
X-Proofpoint-GUID: 9U7QMWXlN5jXUEM5Zvh4t0q6BlqT7L-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110010

On Mon, Mar 09, 2026 at 11:09:03PM -0500, Bjorn Andersson wrote:
> qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
> allocates the PDR context, as such the error path needs to come in
> opposite order to allow us to unroll each step.
> 
> Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
