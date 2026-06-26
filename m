Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3B3F8ECA
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489211; cv=none; b=sfiC7ALeC+akkg/svzBdIi/QxOE2lKrCUSLiGlVYfj28wJI2lH6MdppSo1DZCyTdW3Jxvd0R4XgNSA5PCwq4iXNUAbEsVTUtE81eCV+rsXikz6GJ9PIam75kN5jCWrHkL+71iBnb0SLnVdqn0hznc+qm4fCHy3iRkkbPEvXyXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489211; c=relaxed/simple;
	bh=RWYJUbsrB2D0C/hltTdpW/mqYZ4ZGnvQZM9E4lwHuas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPo/+5N/aMm+/hczLor2nrFafasWdBxkjtHvPrG2x8jYAKn0F9hqOoYN9eYzmgza/smX6HAXukcEKYuEIGQgVc9j5JwWTkl+DTGiTtuNj0kr5SuKMhqpre9CVUHgvA+dBp1suJRbaex7u/wqfHGjN6rUyuODvKpW5QMKbKW7O9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ob9S1V7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4dBLN7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ob9S1V7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4dBLN7C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFigdW1865689
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fu6EgktbTQHOcOuDvtR4vHI2
	/zHo35AU82VllOZ6cAw=; b=ob9S1V7tN7LS5CO5ilO14xBjnhq25nMC28HcE77K
	2DmP+mA4+/XUzbyRIq69QtkM3X3t/EBg6veOXTqn8td+ywo4wXkjD4f8DCFRYbiE
	Dm5fTetgl8OKDU+I6qmEzMTIMbUGmDGN5skomZk/YyBqjNLv9x6c8JkZnwqTS3K/
	1avRpwzwB/2Qjpuw3wqk6IyjooUb43fXfPGRYJQ2oXyvVhwZ3BwAupZxJRC2d/8u
	nktwqxr6li5lYCjEtqJkemnON4gnHLCqelg6jcxMfnW76Zru0iyDg5zKPZGWgaY+
	2k1cMXkztnNht+ij9vofCABKlTK3M5LiBKnpWBSQdx+HBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3ggms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 15:53:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768072950so12362431cf.1
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782489208; x=1783094008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fu6EgktbTQHOcOuDvtR4vHI2/zHo35AU82VllOZ6cAw=;
        b=X4dBLN7CHvYyp5Ig/c/4uXbucOuyvuKz2LDLWlFdEH273+hrHzgWRbQEm+n9h2eEjE
         HNv2P6lSJFp/OIUMC5NaiYONrb6aQiI4MPJkD8dFsUPVa5LJnFSZxfgKiThKDQeIoVVS
         vulrDm0HEmpIybBmcE5g9kpwSJbPWwNZsiiptN6bGqG0rlT+7J4XZb4JJJKy4A+5rF34
         ejAD4DvzMWGNx6X+oOG321os7FhFx9L0RyN9XJ8QpWY8ITZgvd4+rJ6nx0kPlyRufQVC
         kQ5a0/lzHJ98SZ2b1lYAukok5pztctIXcJVW8wfWnQUjcQqQSjngqsRPyNUvJFBGGXTi
         rm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489208; x=1783094008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu6EgktbTQHOcOuDvtR4vHI2/zHo35AU82VllOZ6cAw=;
        b=WwTTOSmeuiD4L+rg2T9e5Fkrq+0k1eHsZHhcf4967X7gg7BDlcUsPPM8IVrWNiocTf
         8soBvji4sXeGX7fiIVqfYB7hL7De7M8sesFfHJfkSglBM52PTRDdxuvJnWDBIgpiE+0K
         uZ+IGLHx10eIHkh7zvcThvO+8GgNG9ce74rV8sBa1TqUbTEr9YzCGKPkHflDbgnmHqAT
         d/0s/OTdsojWiz8ZiQKeXYM5OClrpfwcYBM0FtEiVJOx+dKaBitguWwE4iunVrmQjVk7
         9y0zS0x9S96JkDuTxvQ5a/dyxuockofYDFJH7lV/YUKq5v7JBuv9HtNi6Q9iUgy0ldBh
         v7pg==
X-Forwarded-Encrypted: i=1; AFNElJ+BNSMTrj8zxFFODSJzHbewRpdM+Xe0sVW6lapOI8JSK+ftii3j21BGPDfeuascsLYMGS8Q8ZAwzlSJAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgG3AioeaueFYWT5qsrP12/JWec+GqXGt4N8zvARX24nF7Flt
	pRiss0KdVpdPX1mcoe65KFk4DgFMt0VxakEc8kjfDbUNWNbNRWHIcHpYSG7bGXWmZyPayLHLUGe
	Acn7nB5TGi0FN2KgP0tXI2gqxDZ+TrITJ97p91owpA/Jec7S981RzLy86GDV/O3chCQ==
X-Gm-Gg: AfdE7clv04XmrXYXPdOJA9AddeWk2PChHdGCX7zYDIJbfeXCGo7KWIE+vt2QkV8E4XB
	RjpwihLdI/07XLq4PRf2aVhhCj8Q7dHFrjM5zksaOcDHB/GZBU5x6zgKRGVul3E4SBP30MXuzb3
	YflxpEQ1T1Y+HZJjXDjVRApQLSKyB2ZdN+OfabNLMQNami16/WQKyuAvFysB9mEyY47V5nCxL/5
	Uh1UcbKED6i53KUQnF47UYwmntfS0XX6PwW8ttKQU9d5eKCxbg4bYNDTaoCLxnGCF5wZjoj7A7u
	1VjiPtzyf1ONwVuC7Et0HSc4Flxoga6/8iJBBdxlBTv8m0FAbXlMgSh3MUE2xSHonyIFghKu1CL
	Y9WLET6nvFKlvTkuTV4yzcCt8kxPoUbuLDDFIP3wQagRx/lR4G5TXVrUWlmA1zVuDBK9s/o2sCk
	ogb9vlLgiH4ONLy1hi0JCuV8QJ
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr85013085a.68.1782489208168;
        Fri, 26 Jun 2026 08:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr85008285a.68.1782489207643;
        Fri, 26 Jun 2026 08:53:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551195sm3516416e87.27.2026.06.26.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 08:53:26 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:53:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] linux-firmware: Add firmware for new projects
Message-ID: <4buz3ck35263bouzxzf2bgtk2n322eta6j5kn37r7ttigduhwh@je7ceptmtfse>
References: <20260626110547.23469-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626110547.23469-1-baojun.xu@ti.com>
X-Proofpoint-GUID: 9mIWM4_g7a5q-Rr9leh6MTxNnL7kaKGg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX/tnQ1VeLb1uU
 5exI7fcNKV08IOnk7j891ZicHUqxBmutjnchpP8CwtfcygEaquoIxDfn5UbGdtOyy2c0/pfNLzg
 bSPbpZona3zgwzsQv00lHaJyt5cvloU=
X-Proofpoint-ORIG-GUID: 9mIWM4_g7a5q-Rr9leh6MTxNnL7kaKGg
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3ea078 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=sozttTNsAAAA:8 a=DlMRXyH5PTNZ0_mLLr4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX8uov66OkDSjh
 Utww+csO52YGFlVNffjeXwV8sneTabEnqawLknnsLr1TAKtnd3fuCZFi3+3F/gutGuwz5diDElZ
 WWomCG+bUpkZcCT5ZtVHn2F6vaREJekidaoGGffVyDM1vmq/UMv5ZYVoUqWYBpXwOwr0lLuHIh+
 EDK72bqiiczrHjgu0mR2Pu4pB5hpJa9ruId/IRNG6ujz1XXzrrfhczSFBhMl86NHylOIFSWW74l
 qPpa7z4+yrzzH7EirvzUI+nqJzhPROnh+YlQ5PRyBra6CUZAiSWqwukA3MBKS4BO3nPPW7SiqRF
 x1fSbWGN3iHR3lITYDHwEd9fUdGM17Ru3yn2uQtTebcPHid8DH3ar09U3lXBibclf7mVAyR4i6M
 Ke4K3u5BL9ZcpUEb+amBRTTidc7j9pk/BFovEtrNTlP6ekJtu4QhyVlCjq5u7aMGqPH9qlTeJeU
 +nLi7V4l6sLCYGhfdIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260132

On Fri, Jun 26, 2026 at 07:05:47PM +0800, Baojun Xu wrote:
> Add firmware binary files for new HP projects.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  WHENCE                           |   4 ++++
>  ti/audio/tas2781/TAS2XXX8F94.bin | Bin 0 -> 49824 bytes
>  ti/audio/tas2781/TAS2XXX8F95.bin | Bin 0 -> 49824 bytes
>  3 files changed, 4 insertions(+)
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F94.bin
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F95.bin

Thanks, Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1126


-- 
With best wishes
Dmitry
