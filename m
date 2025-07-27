Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F661E376E
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632739; cv=none; b=pVE5ZTBMOrV66B2YlkEcu/mNVCT1gIyOfLz/L5SEadU087uDvbj4w/NHdFPQjyIczeLfvegvhSw4d1KceRdZFMnK3Ikw/dwy28xh+ooPq/M2pgnSVm0WHTMrpKOoYhGndlv3v06x0PljwGDIhfvPs1dSN3wLe7WCzBGsz4iJKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632739; c=relaxed/simple;
	bh=RjNfiA81APDV4IT96AI7K1pjVGVOyfYFfry+faPEv90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYomK7Q+nkYG7wyd+RGyGfYgiBCuGkYESQ6dI7QV2o1bNpbLjyrs16Rwczlhc+MSs5s0SxcjsIit7RQGfCoAC+PnJ0deaielJPNh7PUmbAE3HCKj/OdLr9SUBKDcNXla5riUoobTbjPFD5tnjzAVOs3g5REu35z2gezVmmQCRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldZrEYD8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldZrEYD8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RDTqqE007327
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 16:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=685vHDCtSGola1yY0CRVxCW3
	5uOqefWBiVFuzxBF1M8=; b=ldZrEYD8G3pn1c56jmZ2X5Fs48V+E/a7JXZSmxWN
	RutyLLaPFcJqhoe1a+DhgFqSAVQ3J8fZ3qY+5p9sFueyqPldAXTZiu9CPZ3GRN1V
	64c75QfcLE4nV2oRXbAn/3ZAGm1Qdra9cAXGHIUJ5sSxvcrySi/U9U54EvODa5nd
	z33uNCDZUDlgDeQizrcWfrJ8bGXTo/13c1UgjWx/OF/cORy1OT79TAw6R/fms43t
	yZiJLZEWdqOKN/p272DUhpdd+eNLl0GIugArMQGVFz+v5mIcUfH+yJkHsTjiYdID
	dpyZRUDb691/hXCwjbjSxLFavNRMo2MOITsZ3vd9kAo3hQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk2jmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 16:12:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fe182a48acso76756796d6.1
        for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 09:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632729; x=1754237529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=685vHDCtSGola1yY0CRVxCW35uOqefWBiVFuzxBF1M8=;
        b=FTBrPmUCzlvbm5JOLuIq+4anxToXDH99Kg5JNBDRGLuHWvRjRKU2oLAQhN/M+B4K9h
         jzPGxM9Ij984neSRTstYrTCSTL+gIOr6NMClHJdamY0wioIl3VXAxp4Nd24HEuK47ThQ
         7vlyEcarwPooIqfnM3pyMZ93gFeubPjv7Mw0Pw+k2yvbmDQOdp2t/rJPmSARqudvrLic
         zkqjN9QO2Quxu5we69Bk/3n/eZKDSH/o26PdCrlYGwMQ1UBpauxrlY/eRa7c4SmisEXv
         bawgfoQ7bv1sEItBXv4L/sRz+AnjZyypJwu8eukQlyqYl29WsXIEwHLdtHdtzMn9vNO6
         SV0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxR283KrOgs69t3As/oEkT88Cl20FcIZhkdGNCDc7w47zQVshRr7hNPidERKnJTZEJVzXPctZEPWNmGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EVZjVP2yzio3PP4iXlH+9O1OFb63z3W50o0yuzlp+PkrYdz+
	7PyBKwhutdf9zlRG64IIF1tUOwR3R0d+UjcaG2/HWXMeL2Do9XWS2aVI6Mvd58Rl6N0IPkMvVpG
	IfXslrW4J+ZBWEqKep3y0e/T+JGLAihqJbJPjrCshGCXdAG9NOfkXIz5CFD+yEhSOgg==
X-Gm-Gg: ASbGncuQbby55519jMlbXNhZJy2NLtRnLl3j09wu/tk0qKNAfbGokHvfojxDeMqs1LO
	qRqdmYrf/8gnCHRz1z6HGWR5B7F7iRYYosAfCCM2VglGPnC7XS6M/xqbeiEDdJFwqjCHPWVzRN7
	pqd+llH5PSwzbDOXS50pCgaXNA+Aa6F/cnMC+i0je74d252gxbaOLCr1jR/CtU5ZYy4S1OLNIrI
	Jrym1bK4ijZEv+5b6FypgnkLS0bGJKsKJRZtYtaKOXePg4ky8840skmr411l0r5e6QncnRgOcdH
	Uj+Mr4LOP8um9K6r3+iWJjv9LEWYWvWpSvtEmcwEo+EoGhquukLFCI/EOoAOSDKDcGO2pP9+t5N
	rmHQZxFice+FWHy7mJevsS1LY3Pj7Lb02FzCfaTNEjaJeHQdHB16N
X-Received: by 2002:ad4:596f:0:b0:706:f190:f2ec with SMTP id 6a1803df08f44-70713d9c3b0mr193045876d6.19.1753632728969;
        Sun, 27 Jul 2025 09:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrgOtZO/BrhsYDwqI7MpuwYvF38Y6kA2ThfIBA0C1aFDjGfvO0v6UznSa+ysUHy7ifVbV1JQ==
X-Received: by 2002:ad4:596f:0:b0:706:f190:f2ec with SMTP id 6a1803df08f44-70713d9c3b0mr193045336d6.19.1753632728412;
        Sun, 27 Jul 2025 09:12:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f407b4b3sm8601681fa.13.2025.07.27.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:12:05 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-ID: <6f43g2ywh26olthehlxmstnzfb3rrd3gavyzvmuad44w6bzvhk@vuphps5i577a>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
 <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfX26JAp6CYrVVt
 n9TZ5Ezqq0x/y8e6ZTf6uf9IStYJ0xMZNmqgxAXTOgGzMcKLTDXdXYtzgUYlJ9hjN46l19vzWhk
 3YJVtmJJqvUFraDz1rFX6R3HWihwm5IzjHdgCv1vPaqHgCPI720WbMwui93iBXpq383K0SJwjrX
 s2xtTIb1gvTe7khp+WIFr1JlWiit0yn3eWrzP9h3Z/EZqQD43C+DDySRx5fmISY/El119iZS+jT
 JmMRBR76ukFwQlxsvNid17hgPeZIcydzyoG+DgQr0qEZE5a0nr812JPMW5AEBvzUUZtCw/zVPIR
 OzlvjohH9doFVi6vSB/IkCCQyTpXOQW1gq9BrCOat+pj3QVcmy5jmNhH2QiX/rR+X0/WHnDJbpD
 m2TW6DIu+xm315zt+5QpRx/bjvg10Hpmzs2DgU5o41U8sAtgoL60iMCvwf4SYcmS9vtDr6e1
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=68864fda cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hECnEToTbSFRC2ly_LMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: QEHz9XI2tHx_cr-xA0YHaa1PANFIiw_u
X-Proofpoint-ORIG-GUID: QEHz9XI2tHx_cr-xA0YHaa1PANFIiw_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=804 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270144

On Sun, Jul 27, 2025 at 12:25:12PM +0100, Srinivas Kandagatla wrote:
> On 7/24/25 3:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
> >> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> >>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>>
> >>> Qcom Slimbus controller driver is totally unused and dead code, there is
> >>> no point in keeping this driver in the kernel without users.
> >>>
> >>> This patch removes the driver along with device tree bindings.
> >>>
> >>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>> ---
> >>
> >> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
> >>
> >> +Dmitry, does you computer history museum require this driver?
> > 
> > I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> > the driver would be actually useable there, I'd prefer to keep it.
> TBH, I have never verified this in full audio use case in any of the
> qcom platforms. This driver has been unused since it was originally
> added in 2017. AFAIU, no one is using this lets remove this now, Am
> happy to take it back if someone has managed to test this.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
