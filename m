Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225583164BA
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535313; cv=none; b=O4HVXKbEdKRhXoAXy1+ssplIbQ91i7n8MYC7OwyAW6Jyp+XXpDuN8/bPtlaBH2a5ncLpJGs7FuSirtfSr0YmoEm9loEHlygUIJIqfWFpN7LTAiBRnBkzCOUEY+Hi9yksBlTaInTnZFcHWca1YEOf+CaPjAGfm1BssAVosO2QwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535313; c=relaxed/simple;
	bh=qt4NROSh+/Rj7ta/4J1JCt/wwRJVXnXOqe5ksJfpco8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX4wrW209I5dihN0oqeYo0xiIGSYNGkD/U5L3L5AjEaJ2iyRS0xLveXQIFghPyy3i5F4JC6fRjspZxdnPMQ8y+v69jaWWbEedqkqEC7Xj43x46OXQN/ht5znbFNNQhLMQxfAA2CxEdlHCKZJ5BEGL3H0N8MkfQXZzCyOnpr7bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvi/+Bh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6EJJ7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nvi/+Bh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6EJJ7c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KPTF1103268
	for <linux-sound@vger.kernel.org>; Fri, 9 Oct 2026 08:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CfN7f1pufqYbZZVQo+rvWY8E
	+8qMr4fBv7KyLGvbv9U=; b=Nvi/+Bh3YltzaPxX5L3au2Ca5kiPUufb2lUIehwL
	XmfCUhwgRs5kuvSwXHHim/tl2QyJ+Jj1sp9md6HSMuRweTo+NkU7qjSaSny/G7wT
	Ma2BtTIvKrlx0Os5l6XCiLgTdKMhK6T42OAPKE4WRUBeEvdPUBHUkNgnT8xRW8Os
	+b7jB7iRY7ANWEVCmxO49n3RwcLqIZScvkKaq7LxR2QuVsyc55BXK+lhbPhCVrqq
	teTHcMOZX3rTbuMSMo9TK5lkZinC8dG6msSx12POt1+RH33xu06KzbBzeEA6ITP9
	jaAcX2gWH6VM5nqZ1+/ebSiXEO7fX+M/lfpjUivhb0B+Xw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkv82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 08:41:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a109c937so80775246d6.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535310; x=1792140110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=OJ6EJJ7cyBHWPCMcpw0QET2yAX3jB6okGj07dt4/BYl2Ue7tPEKLbeFiZaddJTRiN3
         GDyiY7W4wd5DdGUpHlSGShpjb7gWYzmOGffeZDoqyBhcBTQiAW5kdJac+//V9HD1CwBc
         i05VJ1CaDEVIVia4cJQ+H4ifd9U8N/olA1/KQjtwHh2I4PjzU5uYmYaNdcGBVunVZ6Ko
         ILqJsqDNA3Zd2kGxhfAtAbiUpFBRo7IGG/WAcenmUgxe+qKdvijetf1xYTG+S3I7na/t
         KTBHfSwNsyQaK65tDIP6QZjb+H+9fUv0SEfMC0HlYCYa5SGTCks0laLiYPXIJk8Z606J
         T0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535310; x=1792140110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfN7f1pufqYbZZVQo+rvWY8E+8qMr4fBv7KyLGvbv9U=;
        b=udloo0TRSgSBE1ePRdbs5JH1c6pKDQy1jyqbKjj7S2ah+oh58hdgCeJtNypNrf2vNd
         Ade2/AweMgcXoKXhdr21F33nMOzM3yQ2KbSJk8EE2ZqipelFWU8L/pVK96BmCBgPxx07
         3hnIRB7HkD67d5xIS0LbOfsZ6ZIY2A+11MaNA5mGIKVaaYNG61X9gvxG64V+rbOUE/OC
         n6RZwijY/U07EI4qZBEZJNbEmaDyACCoCVMT0ZVnR0Y8+T2eglXRhuQrj9upH6Msw4MG
         1qoyq4M2oh+nE7W7BpZaO8EkN/Wj0DwOzgq3EBQ+cpnwaC1YstSRwfwC7iK2NMydePGf
         lm8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmu9kyCMApQpEk+mtCfa3X4eKjGGyxIju1rO+K25Zq1spVBjIQUVYFGcHrql/AC1HqRVE9EiGyI1UbZw==@vger.kernel.org
X-Gm-Message-State: AFuF++n1h0ktV7mKjj0pg3Bk91z8BT4zZhFcWdXwEsj2ZhO3+SojXeZf
	VOAMwX6isuiJRXmfy7JG8qoe80g4r6Lp7Z3skkuJVoJEsbB1GpB8w+lekEHPv2xn+d8W6Ja26Ke
	IbZ9kDFt3S75SFKRPjXHWE0exXbLrwVt/IgEitNGzvXKdlsh1qe/2KpsHG+3vkMgMyRXvfnejoP
	Q3
X-Gm-Gg: AYBFou2nbHW+mggzrM+Z3NI0fwOEe1RaqnS5sOgFZ6o1Y+fEgcF2ORwfX5GuLY9L/M3
	dMe/FdNysjy6kaNRkCuJXtu6JfCMdqV4FlqG0cUIbGtT6SkayeNMdfwY9FxyX958BlmFIZT6Wjg
	teC4U0G8l17AaHtEQ7elOaILy4T18+Y2th2xw2Ei6/kPMM4lGFau4hBeFDds9h8dKIGndKh03eo
	IIr0NkNKHy58ANugCo4R6vZwSFJzN0z6+HiRS6/FtsGZajn0rX+loshkxIh6gYDKgTf5cpmLYX5
	fq1yLzyaqYmQ+OFYmdPxo6bslgVDOWN3CWQLR/sbrvbta2bdHbvUwH/rzcMQRQqyC4Y4yfnqXOE
	gL80VI9XnXsIAtMy9KyYU6lDNVeTYUQAj0+yODcuuKA3sF8m8GnqHthKEyVkZP+224oqgavRIQQ
	GnRgCVWh+rgKcy
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189346385a.23.1791535310350;
        Fri, 09 Oct 2026 01:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr189343185a.23.1791535309780;
        Fri, 09 Oct 2026 01:41:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf7ffesm4278611fa.41.2026.10.09.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:41:48 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:41:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Message-ID: <7brlveujfarxtixe3g4yusb6sov52jzxlno4cpjjzghon3ijpm@ef2u2oplwsmr>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-7-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: 3wAgVpmd36IvtoExidLK2kXNZPvQ_W-h
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac8a8cf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vbmOaEBQJOqfsUEg3iQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX1O316e6uFMIm
 2jXO2ElxWpQGXGdkPmIgTkAnlDxF+E9A/b28quS9NE/mbdI2BySeQd8QFLxgghtLde+Q2/+LNFd
 8lU9KXhGssdemgfcj6xuhyFS/w5c6ws=
X-Proofpoint-GUID: 3wAgVpmd36IvtoExidLK2kXNZPvQ_W-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX0y3wFbNkEsJQ
 QcdhK9dLlu/XyQ9PNG1fPk9ul+kXw0I8e91Ltd6Wu0CKrfF4juCkqVPVzwVK4MJeCMS0rOdd4/l
 Hg57MYtwst8kdCkA6hkgShd9139MsdIcZtTc1Tu0jdQJr62XEPMGJ4/6fVql9i137VeRNFUC4CL
 Avte3N4R+3OAIe3l4MX4AqYBuhyEhb7SLJdfvIS3rnC9mBSixxbmyQ8wOGXftnYOKDJ9qYbtigN
 /yOdAB1jQQ2gNj3inh99onoq3EpLTIodhYkE1IvJnvM76RQkN2JhpvsV6qL1j9c5yAdeBC89vBn
 wPE4O7SnbuqU1zVaFo3XJVoFHk+rXGb508pHzn7Eq/+bhX4aP4hGZ0eb4fx43VRQrqGXLXTccng
 1t46ocVvbhccPsC4zzHI9dBy6B2oRCaJXKqDv77BIz/2ocMOG6phb1BOsx4HD1BC4OLSsPFhmsB
 wVUbN+yvgQtFRF+1Rtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On Sat, Oct 03, 2026 at 01:56:54PM -0400, Richard Acayan wrote:
> The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> compatible for it, with the same data as SDM845 since the driver
> requires the load_state.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
