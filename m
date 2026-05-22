Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E38399D08
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455114; cv=none; b=lLQEWby2pqM/NInu8CrDuM/V9cxcznNgeh94KA62TwQ22d1d+fRHEm/egleOnEuovaphVPcgDKxznnN8OvITqMlvfFtcl98q7e90KZHE+yMpoofyglmRz2JAalvhRrDx+HizZ2O8peegNge9pZxevaNBfrnbU5dQjv368MBobz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455114; c=relaxed/simple;
	bh=TZ5Gbdy8MpD0BkDYauXmi2P3QUkOwpzPVQi/b1SuMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sW57KWrwVzUkW7/J2tWyBEQw1M19/1QRl+AqAgI+1I0ZAiC+LKOWWv7zsVHinnOSfe0trsL3m3RWWxnmngEpDR8r6WlhL6y2uVFo+4NY0Ox9hasTnQTM7laUPUpgfF5j0GupbeYhQORuocG7q+30vkSMi6n5TnGpcCpv7oyJC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb25CypZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKglJFw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb25CypZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKglJFw4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9wSgs312895
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LU+3o0EUymr
	NGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=; b=Nb25CypZwbUqsUc7tdjwjjwNkQ+
	bBsaMBdfol9M8d28egxJ8jv0POZtQU9FcD8sj2SvMFm+Mep/m0M5kU44K6pa2vVq
	JS6K3PyQHd8j8Xxmxns3JMF2+L+VgDpQVnAuRKPqwsjPbJrnjImFbTpCfdrA6u68
	sqqxmcsTcoheKnskeV8Ua50qlyMp8AdEdHjpuejMf7Kbiu3sN+jY1tnZZ+/j9JOP
	AvaTaFUjlbS4KHgqvRJGG0viAGlmDaELLReoKBlo0ZLOOz36dfdZPwMT5SKSM/XY
	iPjlmbns8f9LvBaPRq2Da+tf48zAO6GnjOykTG1yVcCy5VItzxIlF+mbs2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833vwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366344513a3so15367734a91.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455111; x=1780059911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=JKglJFw4JJzaq/dM3OjAxPw9Lo5OqwaAC91XanMZ2ItjZKb+3irPF/nSaDTia5uz9Y
         xFi1/9z1VGv385Amw+cVUn1cNk3qxdqhik+NTZRCRDr0pwRAHKRv4x5Yq4Mw7RpcVB07
         hcaEg2ulJUcO/CE86QZ37sxd8PKXOrsgnBZZpgnKseBIJ5tOgxq4WVLBckdoF/Qc5e3O
         moNOe4UtiWZ5/kteHSkhX/G5jBTkpv75jTRH/UYNGD740vqFae6L6ucIZ+9IfVp5OsXd
         2fVeZu2EgukbYEU9dDTPfRjaWfryAFtNh+W7NvkuHRr2kVX2wkxmUpeU+048Vqmlpcv3
         ybVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455111; x=1780059911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=lj+oLaokz23BIFbHSxlzbmxwgqnph5v+OHdNvBFiZD8Y3APVIC9xfP7UrcuPLo2Uqs
         BiSTHvb8wJ8ThlhMlwdKFlMTpSuFOt1zqnBfvaQ2oNOIk4FVfAIzW9v7PGvnJ3AFQpal
         w7E7M9NEPkteMBOU9U9qNKZz/4vfZi8k8JsIqk7udeNRqNsqa/dPzbmfP5yLTZ0LKBAE
         ni2gGThzWfoDF9eozF1NqGB2e9EHGW/pL2HQzRi6RlDKQUom1oWRUtWVTmJlH2eEpNrv
         2Z1TcBlUPmhs/GX2/mCaqM0EMe308i+XylmGit/FNgQ3akH1cHradxph7YtxoOdGQeQ1
         6y8w==
X-Gm-Message-State: AOJu0YyxpnLsVVJG9JCw6dwuNMaXUUaxedsT0l0/1ysoC97/cO6UPCqw
	KGsORmdDnF07kwcpXU0vQ46dh8UZTb5Fhwh+LgDm3zOacJMhbbq29N7joot7fdSD3KH0vPBPkSf
	GujajOv7TGT0zlONPa1fht253zYyarpd9tvD2fXHhR4R6Yrq3vP5fBcfSe0pkgQP+Rg==
X-Gm-Gg: Acq92OEqFhwQou2qCK8o9d3/fBXi/M/+hg1B1BXQFUjwE5qej/0MC9DdxXWKpnVuUfH
	IZMvQwkZmmh59thkPistfL6J/SWQv4fPFxQsP5s0A7UyZOpPQuctgyedEWFxkyu1ho7pXR8EvcZ
	kCXRRJjjhjhFTNaTgt2lI7ihzeymbBLrI2kcZROs6cnCUWhT+5TwNSZRrBsv1HJqkmFUjzqxasX
	RNw/NOQeL57Ibm9MxYRZCmEuFV6wQ0lLbghQKQmB6vDW4tat14bglb+erM5CIDAQHVGcYwjhSAe
	re+YmEv0/dNMtU5lYde+ezcWzGdBC7PNnJlNvqssa4CXdGRZKGWMj1XvxabgNkcqRVuJtsEALdv
	kgK2MRo3+FlZUdds/XWjo/sJ4QS48kx4Cl3Ueh9rpwtQzpPtnrQ==
X-Received: by 2002:a17:90b:578c:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a675ff469mr3717462a91.15.1779455111359;
        Fri, 22 May 2026 06:05:11 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a675ff469mr3717425a91.15.1779455110919;
        Fri, 22 May 2026 06:05:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:05:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Fri, 22 May 2026 18:34:42 +0530
Message-Id: <20260522130459.3411038-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX5CH7msPIvAqf
 bRWIUTy1++IdqNFICFKWEV+BSp9P3Q1I9YvI76Uppdfbj426kXJiTJEE2Ar8UdNnVf+STxNsSkx
 LFS9w/YBYqIDm7D5RCLDq6Uw5C/raV6ns9L7wwpOvvYLqPlRppsF53kPhQAvhijnRkW7LaS6aCr
 RMINrmDm++1uqHB+zew334V+jqQX2Bf0TRKcz5A2rnrCyF2Gz+JGYr890jjoO8luWLQGuPW4Nra
 GU4Zt2U75n5zzpfuKY2wEgt93gHXWomxJCN79P2qdOtfAR4ZEQwvhxhoY1AQf24aB938D1KCzYv
 fL57fLkyweOt3HH/LXzr7b6ldCLqUV0UwcQgueu+OfO2rbUR4pBwcUOQj0pq1d4UOzpXjJ1TYod
 8Pi6QgvieIuE9s7BsVL7FNZcvjKORH5cJrZYVAnRCK0sAwU0dO3x+bsY21c6FmHlqp4smiy3M8n
 5YYv+ibsNnL4EYKs8gw==
X-Proofpoint-GUID: rzkgcx5ipOfgQVS5e_VEu06uVuKZKmVf
X-Proofpoint-ORIG-GUID: rzkgcx5ipOfgQVS5e_VEu06uVuKZKmVf
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105488 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220130

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This fixes the missing unregister cleanup in remove/probe-fail
paths and simplifies error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 598292fe3219..3081c115d584 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1
