Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA8247280
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021262; cv=none; b=au2N5ZO9VjKOCYDSjVHt66BwmydwEoiheiSgZ+NQlA70Q0rOjm6+4QBDL7L78sBs4EZo/kU87+2noeIBJ6DS6Ttd6+cWHM6iUwHVjpLgZBUmdVsnsBEZ5VNB6sEXzwiOeka/ISWUwAo7kAV37RIFR06DR7uwiRiCvjpK8vswOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021262; c=relaxed/simple;
	bh=UX9OZhcnhcNzoqUQz9+KX55OzNsT07DmDs9dne+IrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFKRLN6Ihw7V+l+clqT7cldUx45ARVLpirwmEQOeAyKtK5LFeYJOMSha+VGkwU5Vx0X9wiBqVeXN3O3cJJ7OedQiTPR1FJUNOTlhp7beM6q1XLgQMPCMmk5RJ1X7W00vnACdA0s62+hax9YEwaYzhepYTD1D9EU2g2jel7qfFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cI6R9VFS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cI6R9VFS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFK3Ya022686
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 17:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BVf8E7Hm0j7X/OZWTJXCmK0q
	4KOUyKl7xvwHfOg/+ZQ=; b=cI6R9VFS7p77NVjciGQsr62WTLBi9NhIpbe/t49O
	6RWfC2bamhuC3sE1aIxspGBb5vTebhyUmrkLdQuiaHnCn9Dq0e2E6GMD3VDXwsjJ
	6M7KsuNwcHDN8NUzFZI5o5rx10e4xoexn08LpLdHMOnr+N8q+MExfGPmpD3For5w
	duqCE5PKoPvehCiMl2vEEWmYd6Up3SMPMWPcHX5yZaVzv2qRAM3vX418qko7tWF9
	tv70jVPjAMRzssTadWp7j44WOKB84PuErxYTm128i6lRiTTLo1JZVApNgNbgOYdJ
	oEtp/ft4hpajzDcrd6Beae7kZCNDtvLSDTtOxZd++2oqJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52p3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 17:27:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a527so10539185a.3
        for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021259; x=1748626059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVf8E7Hm0j7X/OZWTJXCmK0q4KOUyKl7xvwHfOg/+ZQ=;
        b=QMXIXNYJDgfnLJZ8udO1vBcLjheEfnxAT9TO5DGNY+LAdf5lJ2l5/yzXRf+IVuCmff
         GbIO4iwEZFhlcw3SnAdC3qa9dH3IljZfc3c061mrBy4+wDuUU31S9AiFkMTswK37mZ4B
         +0SytCLfCSp20B0EJb5n673C4ubA3rXZgmLyhm8vB4YWeBUGd/GswpqxlAf/JXqS3OhO
         vVyfOXDWDuP3zOeBFVBIskrLBk2OeGgcNMN9IsjKLi8wK22xUOfYfln12jSCsa6ZoAnt
         78lxKHtBPq6OuYApqVBGxE+6Gr9h9P4xe4grnCrutyiDCFnUcAuVtwWEhTJ/NEveEo+d
         svGg==
X-Forwarded-Encrypted: i=1; AJvYcCXOlGngygEMA8JTniMEVfqZE9+E8uBtkKu1F0Rh+Pt3U4M1XbZM4TBGnY4C/lebfX4ZDSfQeC+XQp372w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zMt24X7VfnIA/as7nNj4r5NYpKg+zShF6QVoQh2m8X7nvr7c
	9RTSxn0fhTJuYpaAfxViIanyKKKjtjw2oq/+gT13/hfT6YjSPoIcKQx4FAEW+z7F+R+NI6RDC32
	D+hVusHLQeMlESyOCQSEq6RhBXZA5T/cqgJ9JSaTB4tKwiJBsHDvBiZ5U5i70WC8dSA==
X-Gm-Gg: ASbGncvRhF8e7r3qP7qPuhgc4WJm3XeRbwOj0MMAUGMG5F7TlAu2Xt5vQ63Z40luE/p
	gJACGSeHhkNqMKJmgZOHQfXoVHxL2fw/DJorAQflInqPf2DfPqZPbZsWXW/fS1E8Rnj1CaFtHF5
	/RiNNNXd7qR7MTVI2HEVsBM5r3DHTprHTtThHPQRup+sQyMHmbWX4rk6qJhdbJgJ4ENnhrbXTVd
	9c6HI0TaDYSM5s0kQ1l0axomrgMCk1RFtlcVj6HcQEZRMYV1jIBOHPi1DLU5rIckdSctaKa2Wnd
	Uhl4fvQpm0g7SuE9a2w5HERsuK7z6/gjt1YYhEAQ/4zfvshfVmsaPdWENOj2gtbZJPp86KTl5oc
	=
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10150485a.21.1748021258971;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4v4FFYt2KJcqNPAHKwwKQS5uP0VM4a7TB6GLuNQGEXytudQve/yAzT3dTU2seJ6C3/uT+A==
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10147185a.21.1748021258637;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280d820443sm35986171fa.7.2025.05.23.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:27:37 -0700 (PDT)
Date: Fri, 23 May 2025 20:27:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
Message-ID: <wbpucxl3kf7kmob6bbhexivtgrsn5ehgh7zfuebx2vxjcg46ws@gfhdgi7yd24o>
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
X-Proofpoint-GUID: URhtJBpeQVlKWUHFbq7soG3mQ2AdfJnE
X-Proofpoint-ORIG-GUID: URhtJBpeQVlKWUHFbq7soG3mQ2AdfJnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfX6Taq2dJnJwvH
 FsyvrauZqV3dsyGaTUvADp6e7InqjiIQP90WjzZ4w0+VLqbXWGCt9jFaZrLKUMjNchTdn85BNnE
 g/jYvDfLhFuxmcqZFAjLezPNy9xfYifFvJ9EUdxNylvs11t8pH+6XduVvaLSRgBtFz9VZLX8laI
 U8Yk6OcMjmXWZquca7DWHMKsR+bUNz2956M1mda5eq9T0ng7e+fmc/t5RXC0CuV7ZDzTzy9UYD5
 1i6kpeHE/nruUk6zgq7edzcpLiwEzGSHSN+ltr1idwl3+SaMRGRS89j6zQZeSZZb1eB3XuA1xgo
 F7f5OY5j5LpAXBPqyrmxXEm/gPCtyHuyN+VEFNuvbn2yMcftvCGteWzeSMI8GjbQ7EFJRi0CrRc
 nXaw4p8c1cdJNZTSmKUHKCzIr25fYpnBNuHBJpe90fMeOx0/+5rMvVJdobVRyUxtc4BuUF25
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830b00b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZT9l893yBoyBf-nb0IA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230159

On Fri, May 23, 2025 at 10:53:17AM +0200, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
