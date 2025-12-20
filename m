Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6D288522
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256990; cv=none; b=nTiQZ0tdyW33fZS7VgQYkVGi37jqnoQpzFUMw0ANchmHT+1/URTfXDGQJUIjZpaeFUv+9/ayLFxRy3oX49PeqnB9tXqf3QoFsVE9+9vvkk068aYxopKwEi3bXd+KViObkuVnA3p/fOm9iM3nsxtubAO4Ivbx1WUF6WC1mzmW/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256990; c=relaxed/simple;
	bh=gpwOqwf2/gavlVg3ZgQ1B7lKVXuDeUkUMUNtlQnTYUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xq43WeF/KdfWnJQs7cQ4bgT8xosoZAsxI+rzulXpIVkLCLz7RGvnniwTt023vS+EC2PCaPFlfopKP1xZfMeto0QV0OcP9GQtbOGBV28d/+Ur2XH8ZPLR10swHOrdymT7Fa73vuWZcorC+D61IjNAY4qm//66gT62BkQc/++O3jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaCAqTIs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxIzEFC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaCAqTIs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxIzEFC1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPJ2H3763384
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GJ/BFR0XoVWccgk2a3ghRJ4G
	HS1MnzeM2O8g4YdDhlo=; b=PaCAqTIskI7MidZhosWYswEjxJ8gtu7OGe3Lz+6E
	QpEtkrRfAdMarv5JHw4IRnh0qO5024EHKuZq7vgUFgLXzw/K0j/FgNUcv3J0lFZX
	Lc4XxBRoZn6JYPddnqhIc+OZSpthCuvOBvClsPiHIR8QJ6iTgr75qnZPsOv/rVn2
	YrYfnXYnM1o7aOP8zrmN38jtgWKvrvb1G3IqGuysxCCbbWhhA74TYaMcGHQYYvAv
	XmdBFcpE2pNc/YkAmaf9aml0lYheg2ZlPT1f6rdXYmOX0uQnHVWuFMjlrWo9RONV
	FSpHUoSYCQdBKmTeZwuA0klQ3m+s6ezFAlQATw97MhiHtA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrt953y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:56:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a360b8096so65099276d6.0
        for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 10:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766256987; x=1766861787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/BFR0XoVWccgk2a3ghRJ4GHS1MnzeM2O8g4YdDhlo=;
        b=UxIzEFC1id9a1y7WJhgL3Ug/W6MeSRS8hI0sotNEjNfgD9pUq9qcRDXQLv18/gyVWE
         MOuFMmOfJd4bxdUhGrT27TjrDVIKnFl5M4otbnbatCfLFCrviyV73U43YsZzH83O1xE9
         aavMRC3V0fpgybbwH0CTPPY0LVg6c2r/Q8faCtlxrAW3UQQ3/M/2NFB88dChT/RIpyrN
         JusX5t0S27hY8Lhuc0IERVFY4UzFpPMTqqupzoF2D0gWlObJjYvnT27dbsL4gDB+rsu2
         Sl61MsqvKfSgIHvYuf7VGH2kDF80Xwpbe4JHn7KStI2OiaeJbD2y9cxr8gxbr4Q1lmmc
         y6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256987; x=1766861787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJ/BFR0XoVWccgk2a3ghRJ4GHS1MnzeM2O8g4YdDhlo=;
        b=kmJyphM3DMWfxNh7jiqL34PHL4ADoRBauizPbGaowF4hzoQj1E+RZv6goY/fFJS3YR
         s7M6aXBCUun8gi3tJiNPerqian40M0/z9nXuI9aiqeXYCOT49SATyxm5s3RuI/jcffUN
         h74a7sCwZ5OlEdP+7k15iRiM4hDNgtf6goInJL6+BvWrEhUKGUMop2h7/gcKOCv5wcGW
         JNfO9sJaO/Wf4/DynQH13dGzobX5YuTddU6f4vRvlUHlh71Ws/L2X3TtXDNGd3mpEjPL
         hlbBa9LV6t6DEiOXsZCoBQDLZRfeUtnleQG4QCejolLiPZgpYe9QuVy99/6jXsqlEktT
         pOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxNwg82AB3nSfRtOnAkJFcJbhwKyQPIJx0VMLjq26Pu66XamMPRdWHcgSSiageeeM1a4Oc6NETNF7Dbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2Onbsxc2haQUUjcUc1PhydFt6/Nj6z3m12F4BOaCR6ljb1EP
	RJcOUw2UX0erODWFCWe108yxedGvc0LJGJe6QmMdeUcw9Ca1/3aW2jzqy6K9TZ1kQ+phnfriS/q
	p0AScwhkHJxL2AyXNM9HbbDxbd6unyL7J5U/QkwI/TjIRWHQMO3uquu16AP/sbPn2Ug==
X-Gm-Gg: AY/fxX6CtSW2SMyXE70LdT3xtn6B6+ytSkIm1e3c0uJHpnEFh0hFrRKtgvedgLuhTVm
	cudwcPvwX68QqAAK6a/Qz1C5FAMJDqTpkeJAft71RUteV0SDDOTTX6V4ogDdWbrwbliCYbY3GHn
	9Vrm3/I37qNhgvizYAPAouqrA24V6mkEbAElZqQRtR9RGOdc5KhDFT72FErptrafBmkR7g3KreH
	ooNZLnEQ+/5ONqMnUeZCyYNMFHufYTDDQh9zMwEm6axJAfVzD9OidfxL0HAyxlTy0zZG/fN/GKJ
	hFxQqaDe+t9HBNDqXN4U1Py7MdlGciIumTu8lIyxT/L7ZIEmlUDvn1mxGNIj7f67WDljExkDzay
	6JzCMsXhV6GRs5ssgcSceOxxal2vRflO+rYofG7o1e1wdVxx4Omy6EU4M3ucXjgOBeWVsZisd1X
	ny8P8sJEueb/TZ1BNDBRpU7J4=
X-Received: by 2002:a05:622a:15cf:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4f4abd0e694mr107830201cf.31.1766256987330;
        Sat, 20 Dec 2025 10:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsQdO7CAECz5sdl0VvSxhuLEKamLp7NsQ5QxyBOQTaa5yTgWuCscNBtptTtJ3fr8X1C3WEBA==
X-Received: by 2002:a05:622a:15cf:b0:4ed:b2da:966f with SMTP id d75a77b69052e-4f4abd0e694mr107829941cf.31.1766256986864;
        Sat, 20 Dec 2025 10:56:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f477sm1699483e87.71.2025.12.20.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:56:24 -0800 (PST)
Date: Sat, 20 Dec 2025 20:56:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: drop bogus container_of() error handling
Message-ID: <iub7k2kwm3uibvwjhtlyxpeugig2jbhsodwuqaq7hvxalka4jn@kefgsuiwqgqn>
References: <20251219142715.19254-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
X-Proofpoint-ORIG-GUID: o1mOFUurzRMt_HsbcbFJAkKfYXp8yY1T
X-Proofpoint-GUID: o1mOFUurzRMt_HsbcbFJAkKfYXp8yY1T
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6946f15c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r5afS2MLfkluYLZWxBIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NyBTYWx0ZWRfXx8vQdDpXxUQJ
 Vwj9gcpLV5k6ihYebi5Z4jpG9zP/CIMqzERTlFMZms1LIXfH5tqXi/Uoin6sf2ai8LQ/0dLbHb9
 5U39bHkVQ7PJYYPVDWdZG0UMj8TXSCgfu105L1oHNYZ3ZThqGnETyyam1KSNY7wwVfEwife/kux
 Zpy+3EocNkva1vhl822Rz0+E9YlyzLNFra9qMqNlqGT8PON4PD5ukf6CfnmT4MVvO2QKPjolTAg
 0rnGGXDgNmuzb+1NZm9c8Szca42aYhxS+NNWYGTjvNC99E98D2ZJAMup6c1TT2HOb2v1HaodRiY
 JdsVovNp8vZF4hfEvAt6bYfLWDqMxwuoTwstoaH3oFfE2e/jPYo8sV3MniIgqsb4hiPMwRtReEU
 g+KgX45VNdF2Oe/+7HBA3XMuQCxQ2k/B/T3LPtBviXUkvv3HBHLKsOM9syTU7NH8Si34JQLscR3
 lxMROj0cwDD32jAdszA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200167

On Fri, Dec 19, 2025 at 03:27:12PM +0100, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never
> return NULL.
> 
> Johan
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
