Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E4306B34
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090553; cv=none; b=S2fK52I4if6+oYOnf1oIXWmB8mXctr2jlSnYKojbv8FGfEU3lj/MAvCmhF8lWYDiQw9qzAjGOFGS2gb9SO/0hm6Xt+/QqfkvM06QClRapoDIdn4mZdRAgpHdFbm5457fbYY6hpXIhcJslQqzysDi5uFsnoznXPYAlNXkwf5wc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090553; c=relaxed/simple;
	bh=DUFnGFR+b0RlkETnIw6FBxZGRdV4PzHTSFPqvHJy19M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmQ5BOkLw08gNb2KgQfvNcMrOq9LdryAgvJEAiPg5aU9YF04rMS+G9UgwwCIwXOypAQUhnfEjxe5yUZZnlri/jDV5U5t1HW7SwaK3A17xOXL2iI0/82uBQXuu6b6TdEb8eXQ/JPYjQf8RVtQphQc5VyerlnyPFxeTUecOw4KUbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI+2bHfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI+2bHfF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G3Phb008141
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jROajlmlcBln6vhnpv4vvF5t
	CEtoLH+4Zh8dpioFagU=; b=AI+2bHfFH59iPt5l4s5H4K0lpIczuLf5F2mAfs+a
	K8iWJc2K9PcOkimdSuYSYPoVRDMAb5P2cgHHXsJVEI+g/BMGRmgIA0WftaCuj/cc
	ljimHivoESGk3rRQvLz+mZc+yoUNY2/pbgg97JudjNvRFRBRrJ1hkoiO+rFU4+d9
	8ZNtqCSQbiTn0Fk7Y1jox7SyE6Ln8CpqfV3msYkdyjI8u0bpqvsPA1QYVWb+DeBI
	LjKwPDmIf/qLiB6JuoC2YDmg0vZswqS8vAZKF0qdj3EKfQeLqZ9pWtjC3IVzwHyp
	8C/YUBTfVtjg++P5aCY8ZLTBOen2wcvYWD46GBoARsJC9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjustb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:42:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2f9e8dca6so52698711cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090549; x=1757695349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jROajlmlcBln6vhnpv4vvF5tCEtoLH+4Zh8dpioFagU=;
        b=Xmpk9vlD8vgcNh1Lwh/UsyJYfHpm3DRZBO+UU4YgBAyMylX65to/Gr9V2bYRhAj3fN
         CeP2iRA/qHkc5lqLqeDOKEXCamnLCfGL/HQSKQFBYdfDA/Cw6Ku6/fFI3s4VSVIsTf5O
         Xi9nIgEECqoa7MpNyG4EikmO6rumNT+ZLsEzzCB/gvASnHkrYHGyR5atS/pcAJpwNZS/
         u5+64WrE0l7LnOmDwTkSlEfC7VXVO+061u+dSQW+6Azza2qPKvw2+7ZkN+TCz+CwmU0g
         /GxSujANRtD2xV6DJWkzEoaTM3Paz602eg1j8K06HinIaKx4bU4BPcld0KPBdi1/zT+6
         WFnw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJZVs87EYVIz7p/xYuJEmHoX2wwTSA1ivunLCYpc570WM5ZU/d0JY8lxHBYxukr/wk/hp6LHZtVyKAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tcJADj61rvmw3zxF0oouLSYylkYqDLLzFWQn8jRzZwwt2S4J
	WrtV+4eIefP9/Ho/dTunqZcocqVdRCp3cDu12iLOw7lKoeFdBcy6lLJ8rtwljtbiBUYQt3OgVW/
	IQPv710UbFn0q8vZZiap5zxE2CCTrIxseQRvlvl4bra8dvYhLBXxBJ/odel97MODE8Q==
X-Gm-Gg: ASbGncvNVRsnb+f8UzM5ZfhjTuXwHSlEECINNwh17zTPBK/X5tNryDqbVQX1zVDqxdU
	TMQAHD1RPdyKu+Y7kkt+A+ofbeehCUos54LV5HUdyoUNvbHS+HjtGq4+xEMrfJDulWpAkS0Ir7p
	CGyt0B1ZpW+MLMIVG6eFmIZZKo9AWSkzZtgFcAAmlqllW+WzUnKvUxCmr3pykt6sISr8ZTKuuxv
	C4RRduSJUOt2dZ3hBMaoajxmmSIP7zpBI9y01QW0Hq2MvWLYpURb/oOaafCX9cpvUpUgX6w+FD8
	ZvASGr/5v3RmG81hYdP/7eV20K78kBfsYPr0J5Ug5psRePxx0jdbhJ3CnuvsJ62lh6r5+lgGDxO
	SlJckEQa5ER0B3boLfw98xZZtgj4xhD6k/DdF9QUVzjIF7Za5YQWj
X-Received: by 2002:a05:622a:5a88:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4b5e8ae4c42mr57976121cf.51.1757090549052;
        Fri, 05 Sep 2025 09:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPiRLE19NZ0JHt5HAhIWc5mt20Vu2UIiF998qL/Cy3guuAy/WYnY5wUX4hI6ZNygHmSZ0kCg==
X-Received: by 2002:a05:622a:5a88:b0:4b5:e8ae:2c4f with SMTP id d75a77b69052e-4b5e8ae4c42mr57975671cf.51.1757090548543;
        Fri, 05 Sep 2025 09:42:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfcd18sm1858430e87.108.2025.09.05.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:27 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:42:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 03/12] soundwire: bus: add sdw_slave_get_current_bank
 helper
Message-ID: <2yvgofbauwqzdysb3r5jfijedpg2qdfb4znfkj5veuyanff22d@tro4rzcfytk6>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb12f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pQdESfS3DBkDoFfcH0sA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: P-1IT6M2eePmKkseY2x7oE5YzJC8Hx0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXyVWGsZZwWSyu
 dXk6TQGN16FHzNv2kcTiqOWtLtbNqvXZ602SAtWXJoSQEqTMU2rXjCukDbNNMsUOv7wPSPJ4+Fb
 LiPLZ8nYOQEwzFTY54arSBdl7pMSmjb/3ekpTxzM8baI3IPuHrCtchCyuefcTA54SqFamCrWTSK
 vsdB1DrJdJfnIh19hjIvguKpredrFXPlTE9yjdfRccuQw0+eWXM2LpOXuNKm98PAbUhsIjdHQkM
 F6/3uBtv489m3YksKOru4q1A3xdV5QJK2dsiDdfoa73jkS5xIbxuVnKAtVRNLLeaArfgIYFlQkb
 amA9NH3uEtxvkiAxvJpQgfrv+U4YV+b8QBa31I0Al14MRkJaBTZ8QInz+1qi/ZeYJs4Q4UdRNZh
 XS/NC4Gi
X-Proofpoint-ORIG-GUID: P-1IT6M2eePmKkseY2x7oE5YzJC8Hx0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Fri, Sep 05, 2025 at 04:44:21PM +0100, Srinivas Kandagatla wrote:
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soundwire/bus.c       | 12 ++++++++++++
>  include/linux/soundwire/sdw.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
