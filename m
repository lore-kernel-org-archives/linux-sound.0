Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260D365A19
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192732; cv=none; b=HvK0UXrUJ+9SWpL/iDGBBhJ90+tLZDnrFum2bS3sjxLMA3Nm8xmy0SBpZkH1qAGB2yGfEjut1J9YeKZkEuB2F+vQVyWHehH08F5teW8Uuko7Uj+aZ0jzNJJ0WPyHnZs1vSflw+xH3gkHwIRWOQWUs9vP+umDs7ZvEPNWwhFaXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192732; c=relaxed/simple;
	bh=62McvjnrRf38byDSx8kuXLQIr1z2+8msCgGQAJ8XYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW7HfvfIN4jIyQAgAVkycsvdLOWDyijcIR+XYUe+agQxTAwiF1y+Ka5Hnv7OhrV75skDxyJ49KCZUkihcmvdB+/+hoAZLfP0kxxjj7SAUPdFlMl6zbfVItK+LB+R8gylncbY+yiLsVTMDI22OeNYkaEMu5dz7PKjkRsbVM5s9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9m4Efsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O96O4I7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9m4Efsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O96O4I7s"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B0Rg3c1266034
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6jr313rzYSza0mek6eX7tJDZ
	hZe4DMTE5zhNfkpkyYU=; b=P9m4Efsyvb8Z7O4tvL8SHvbUds2vJEs7uIQu3mRP
	F80XwKJIUmneNpTtsXDVjxrP0NJu0tR2VvX9hnuqJ+B3reTDZhw8kMb3RouyEpBR
	Gtp3axZFmJqcZ8Stj2JAnvtci7EjHDkeHjKknfcxKiXN61Fm1rZVzrKyKrkfNg5z
	u8fPV3Y0h87SjAFjmykFSwdfOJ7Yc60/70Zkz0NndYR0gEIFWfJZ5ZNznaX1vnTr
	YL5uibVIDtSfWZOP4/71VGSffU/V7oyFWsH0WEkDazky09ZsVBUUy2fzGAaKaVsO
	UaEwp0LP9LQF/U7VBER2qbOER7fCwM5e8SE+6XVjxznhvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfhsta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0684d05dso31898606d6.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192730; x=1773797530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jr313rzYSza0mek6eX7tJDZhZe4DMTE5zhNfkpkyYU=;
        b=O96O4I7sDem6HSuWSMJfNaizZr+4MbqPmBIf8Qv4zWGBnXmm+LxTOgs+qdiIVKndAq
         hcgV63Np4IZEQ+Vq5/xcP2Q0JpiUvQqP1KpCyVHqaAngrcULt9RIwrAm7X4po5t30+Dp
         uDcGqlIdMr7D0oEc/XytzWgoLhF/Gpn5Nw+GhC4+XTg2cVu1NhDgs1hxwkJZ7WO4b/Lt
         C5OJK1s59r+7wm5r+k8R3Nb9tjy8cVvawwyOoR34GhiqHqSzZb/5wwA1089SAiAPFHHP
         PCzLHp341PE1zU0mWHRWxgv6nKRlyCq+rte68O9F12wS1Z/ZoeTnYuHnaH5z6Uzj9So9
         QXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192730; x=1773797530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jr313rzYSza0mek6eX7tJDZhZe4DMTE5zhNfkpkyYU=;
        b=exBAdpZn7xAC5MxH7xad7wHYYd57Zpp2ZeOp3XHDqiKDLFZXJ14Z+jzgzptjy6VQoI
         jznHVKndgHfsm4U7cHref2OOavCDHyuVmOqOoPeL1ayQNjqusm3Kby3pojeWE4uzaT30
         Qqv9EDZjNE82vNY8VYl7XrkaMii1Kt2gqxcExzIFsiMCnq+YBfSOwMBkRoLdPBPY1Y6M
         QCO75yHsTgV+txDOHg6rvTynfbPo7hseSByhj2RXS6ZeIhaQe8ZWqGm9LHNudNC+0wpD
         87Fb5pk2LOgkfpgaooEW/+DjClZcyr6MRzJYfOPXHSIWpab1FtOkJab0LZ3/s4T5bhPC
         UWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRI1Dc2H5nmbdkKZtKmhRgvaex0z60knlsxadHXmshFC8Q4Zm2Wg8eoknlEN64vpemzQK4GUVQbq6C1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwepwNRDhrflqF4anI3lrQdCOYIU5G72JGaQTAQjzCcw0/0lSg
	JIfmMQN78MXbRSbvRamt3bi2E4wZG/AWOEqnttbLs3ShdgHtObm/GK0uTsT83Rsh41fAJlEjNSD
	M/W9unMFeiz+TsrVCQ58vG75l5eUmdTvgo27gmrbckDFvVt6l59wJh6Mb1wDytzkTqg==
X-Gm-Gg: ATEYQzwyNrZQ3fZv07HchK9TLq7yMhUrB/ChM1zJZ5ytNHGeqFDnyIm+tbHPtcfi7g9
	G+U+/DEDDOJf15CdFYrv/gGyRTLfGf8mSjuBurY3lMvY3NMwEy9r6Ydt9q3RVB14O20JQPhIX3M
	j9ECB2W2fdwjPUogdSwc4cJRDq4TSznwPBZsbzBAhPrNHbP2UPOxqefNBUFyjZ/GFK3Feqxr7IO
	yfsvM3SJRJzdcZYZXqxJWH+IkScO07uZNQBViwIjkrHdcDe4bDE1yHenFxEnYNESCyWNhlHqeXe
	OxiR8OJvNc0b68vsnJNsgAcGeP/zBbUusg4+DYyFZ7Bcd3dw3TCbqdoxHjaqn2hYqc89v84peDN
	kS8Car5UyuuwxyyjZlS0swjPeGdOMP6l5XmANqQ4jf4shb52xP8Zx0iW5uFX5cO34zDYojaqVbk
	wcQYu5Ypv3dJpxiIQgtl2PYYATcaidWNhrDu0=
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr207207585a.43.1773192730128;
        Tue, 10 Mar 2026 18:32:10 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr207205685a.43.1773192729682;
        Tue, 10 Mar 2026 18:32:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33e51sm129141e87.14.2026.03.10.18.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:32:08 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:32:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <2kqcac7xsvdoqrsgttxdud2avzn6bmeqq47tk4xd2uy7dt6gje@q37enph6wcda>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: iYT-obw5E7QuRqi0qyHQoQmF8cNMttoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX5wr0kr6prG4Q
 u9yvqOljJdiTA+oUpPSOMOBmnEhPZCG0hLhixbtfHAjnwWf05e4ds64GiyuwZyGYdUMLwqG7jzu
 J8RSwGDYo18Nkn5k67PxCBOl1lRaauuH6upmRbqicHkujPVXj3Erw3ZKbbCW79M7PuBD6Fl6/1X
 mpbNoHD1U/WLQpaxYW8URAITpayGIfuwQ55FlgHleAqfmcNumvsNf3pNTtM5pUo65zfyUHTcSNn
 4F5uX/XYVI0cvbzoOjiokdzi19n1gZVU3MIw1dW3tbO7IJA71AG55CW3rLE/QqRiycGuFP5wHq/
 6dpcatsxAhg0Vh5ss30clZHJknHU9/S/hKzQ6IroZOQvUmOMoJUGrVbWCdIZxdgmWCBuwmeeSwO
 gL5s+e0+mmRhWfC85UqMswYExQCb1tkCGyFcqzux0QtBDhIemMBGBYaHjDt/tBt8SZ6RDmIBVAS
 /47pSQ5NHXyZUGOh3Dw==
X-Proofpoint-ORIG-GUID: iYT-obw5E7QuRqi0qyHQoQmF8cNMttoe
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0c61b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ubSMT9RlIHTlT3bI7wkA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110010

On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> PDR and SSR callbacks are registred from the controller probe function,
> but currently released from the child device's remove function.
> 
> In the next commit the controller probe function will be modified such
> that the error path will unregister the child device, resulting in a
> double free of these resources.

I'd just say that the foo_remove() should (only) be unwinding what was
done in foo_probe().

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
