Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4EEEA8
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101144; cv=none; b=TPPiQ5wZ/LyaZo2FgUtPMgtYJIgK6zLJZOO6Nk25gDj1MpMK8hXeK4CV2XhZw1yRv/kfqIvAwZhGR+RJj6HWCeQatgi3jS5pSHBFtSK/ls8nc3FVzuu6P83HMj5XuAAuVKIUDetooXwcZOz5nhg3TTjcjdFcpBX+d55rW4rbSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101144; c=relaxed/simple;
	bh=T0/65QF3MBJJQP31ZApZm/ZsPyO0vYsXp8Y6HM9btnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhjfDyEBZtEZGea+SHBek77WMOYCHw9Ixq7K9l5AD0UKos7qGih+wugca8QTBr5YBRhhQSdm/fDXlwyCrxkXw107E0InoYj9B8dvzdF7zQbbUo68WW0AKfga6HvV8cE3OD9ZbRUOEde+UD/mQD+Ms0HsNf3e1gxYG8H4/RXo8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAld0740; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ3TesTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAld0740";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ3TesTR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCG6w1212341
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5CmMvftPQdRpm7qJMkIbf75
	0JXDyx3tsLWdLk1U9gU=; b=aAld0740yTZ9VG9QfBPf2t95d9Rq13GKogiQTT9O
	YVNYct5kxhrYkFEjXZYiFCXdTWtOqdWX1fz7RdBAaZpaRKHCl6JBvyjwJDw0MExq
	MPLnp0N/nfdlQ7ofieRWP8DLgYGP2IMwPo+ClCXdFtKejxMmF2wPfi/eF8L2ZXc2
	qoMiU/Z28kEbDdzdvme029wGhnBwWs2kX4Bg0SRNeXuQsaHYpoqZwqzIgFowJJdZ
	tVDW/ZSRUhTYKr6CE8vuazziYX9UBcvpmd4i2BwtT9oluohV+EJFOGZXe5yRmbmC
	RF0A28dCIGQZsp3CpyRpHss8KBB6rrl42C6MgloXox7vzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd83cfb36cso1292237185a.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101142; x=1773705942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=BZ3TesTRoSwYwlNTy3PQYXDgaqwYFryhYolXmEb8MGn6kFstA4er48Mf7xvo/kHopa
         bMLpDQKe+41lXFiBwGPCT0Cq1jQiEgdhk320TVlAN+JEFTqw3nuMDpgP4bdr1CVLpyyG
         ZFIdTrP1fm6yKi+EIa6BZ/PJT8PiD2Lqi5RZAUJOZs9iRQuxqMCRZdav32yjY7Kj9uJJ
         ZJfDGljm3WiYofaZ3cQA2CZZA925CrCzmhWIREM1nLiL70UcVJvC/DO5QOqWjHHTAJE8
         FVmiOWf6oKnTmzYleLRgpYX6G2CLwBtPU2J4C906sBxQL7b99SXe4/yg/2IwroCsOduD
         84dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101142; x=1773705942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=m2dcs2VXRLrzCIImJ7208B7WTxpB98u86pxr+4BtcL+Kl8vmwlqa+FiFj5wI5/Mfy8
         pdJ7vhOYz6SgnghHJFC28sUCbyLJnU0Qy4iieA5lsLCf06cSyPnRnBj4A4XsyEjAq1fh
         r0iotvQiZNzvxzmw7jA5EFCzCOHtWVdsuNPzNBCbRygdT9sgP90XOz4geyTa6rgUH92w
         G+bM1zMBkQ/nJbSHglt6fFG12WGa2wQg3BxiwsqhTH8b/EKgiSOKf/Ro8/uBD+71k/H+
         cr2Et4/ECopuXgjwjDOm5y6fHpSLXXm8QM4j1Qd7mQKTqiAsnB7nn0F1vs+STrL4bGcs
         ZdQw==
X-Forwarded-Encrypted: i=1; AJvYcCVobmGzT4ooLgpHgHk2dPy8jPiX5uGURTvaylBdi/61El3XhicPzPQKTX/FwmKULEcxuaYxUSJmMT4ICQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLjNxwf4hg6WTNyBID4fcwbM/+H44gX8l5fLWuO6i4KjZyreg/
	PPZKFdHHBa0VmvPaXBEZIVxCj1uZbMXjoDNgZfyUyhHjo1yizNjzCn1UAUJyySlTG6yGXtwxLDf
	O06TGiJ4U2lDtAZCSDhlF9JCNMGui8uXfB5VvDJ/+SaHOeMKXRnWwiK2C/AiIt0Yfkg==
X-Gm-Gg: ATEYQzzZzpQz6SswzpYTtB9HcxHu2SK8npvj3jnyaNJb6AvQ28OPKY1MEdGE/st14cx
	k18vy2ZYB5Q75WfqUC4NEChGIu45cPJ3uiNRLGxb5Fo17Jbmj0gqzmakgKXuyEMJZ/aoq/rlkaq
	1pbL4IaVRFc5qBAGjvOzWjw2ES4V5Usqj83tNvF7DFN/iDYNflAQ7q/1w39WFqKovKax2V5Ftcn
	TOJJo5HXf2j7ExNwouFPqYvV/g37HIHlyYvDh+fj0KGXcBIBmgP1gnEAG/Xsg/7+a6/qpCQL8wz
	takP/OnJ+XR2ohtNGRPLPgq87TlrRFElt6Gh4j395f8M63NjMRVtXRfkNeMLDmrCrDJEwkKE0Lo
	0SmBwfeUe40YX4ef2qodeyQrLDbcRRpDo7hR0eyPN07Xa/5Nh771yT+xjpIe94x+M/nxbGVeSis
	dNmWGl4c5TblJ8/56nuG7zC3H2jbO3UQCn9G0=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491285285a.78.1773101141881;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491280685a.78.1773101141400;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e051sm2527439e87.57.2026.03.09.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <uc3jucz5fafdy3d5d4vtykozt5kqfyeax55nb4yjj36vnyxdtw@uwabt65hakpo>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af6056 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4Fe6SZaiIdGEmwW3mTUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: z7RG6ZbUI-AvswfX2XxczyZKW3JbxWaU
X-Proofpoint-GUID: z7RG6ZbUI-AvswfX2XxczyZKW3JbxWaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX93bmGu61APVb
 pFJHP3O6eMAqczYoFsn9YZhDYcdHkbWDsPSzSPO5Ut0iVjN5N5C+DgLWSMJQnXVmK8cdhItPF/X
 CXsEu9vlktsluS/k7PcqOfZ5zrc+fxopCizyzkl8CmnnuN9EkUBfDXVSX5nJ5BxSeaAzLyKlQUQ
 ytSbisToC0hnyWkgeQVx3KsJnDTHEg2EHne1u3/V28B2FT16Vn9rM5R0z15D+5jXjtrFy433dI9
 RhU+shFApDyVqxvv+ClfsP+cJGT1jaq0hZrKSluyDWkMtANcXv4RGXMbEsv8SpMRsKsr88f5gr0
 r0ZmtDCxAGfu9ZlLhwfvq0V0ax8f2v793Dosdr03rHrdfDhONQn4wd3Eq9BYSgLiCkA3xs7jH1H
 ivJGJNNjMm9ZDZVc/aGmPyVpDzyHtGCImrPs9OaTEWNVHtoFMzUF/b1T/u0tNtqgHoNNAFXs8GX
 /EO5FHUP/CT3mYK4iGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:33AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
