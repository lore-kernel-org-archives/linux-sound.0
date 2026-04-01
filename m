Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E7537C0E5
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013773; cv=none; b=AljGoJj+mTYHDhniBuebKPdOrXQwLjFwCC21z+OIaEl0oGp6ZckRsiEG8wfims7GLek8+/ZvbtHblFjgvOQlO7PJ5KjGyZs4W4r42imnmZattCB5171+gUFEvwHY4HhvvaSHSeJaRGyNLFKlOA5d/OJs5mFGH8WrtIATMiTgXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013773; c=relaxed/simple;
	bh=kbO2y45sZLvpmthZIJJ25uuZUuk4g1h1zkNH/OFxXNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYvnCWAsuXGg1Vn6jEldOfE0av2p68Yk6/E2OfUgaVbQtCWMbaZ3q7wAzk+zKv0gc/YJPOnPrVwQK7CSLBxZZIuBDdmH775tw7yfJo1w0NZFPgAXGKu20ivBOaDHMT30IblqkVkL3BegCZFZOfFuvbyAXj0duammTn/7sBnnjAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgpKi5hj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7pYNvLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgpKi5hj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7pYNvLA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNLd613926858
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=; b=UgpKi5hj5XnpTIwW
	09tN4NN9tBeRUYtN7psQp2SmQ2w3WbWryMo3KSXeHqc9tFEDmAIAkS5wC6f9KodA
	23/KoNCTvK1Bj/L9gV0Hgs8GGQraqVz8GhLP1sN1QaNwojcnLBHmRU0FTa24kE3l
	bkPUxiZN/qbdw7rh15lOH8+dAf/RF4W/PUiswKPNBnp6mFbdsjDZdvJ+BGUqcxwO
	NlLusYrwhPePa1AGcn7m19+sISz0bqnkNgX1ef9Ntmqc6tKfrmBQ6ZpWUa1EuoYs
	pzrU0V9y21ziqY/FmptbW0WQ8E/Dq5pBL/LAOwWPoQvoEWAc++LLmXJ0OESQOp3G
	XeBtgQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b934g25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d73e009a3dso18366725a34.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013771; x=1775618571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=;
        b=P7pYNvLAtHft1LV3mPGqodqsfB5xnlsY44jqSKVI2l8MmL3qyokYdOuIjvZAlgrIzL
         EStqdENLVDsKBu9vQSnDXc7PXDBCg+ZMEoOweOyKcdJ/XxrKOIj8O+6S18AFrwUgXkPS
         ZSh6d+jWqUy3L9kuPeFYRL3AwPnwVe0IalhRReKSJpGkNd2stoh40FtjzYadGKe02y8f
         yxTuqJJuWn6GEX80ycGNETbWaXpFtTx/liNGrmNSf6ixQeLh9nmt7Y66zDTHVveihWhT
         oHFC6kRmRbBBcEaEewrIsweMQQGo/X56zLxa28C91lYOnrYTIihPjv1ns74jsK1DPizd
         K9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013771; x=1775618571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=;
        b=cGbRNi7Hqu3IS6TYeOIKEQySPbeTy9NOu5hLpa/9IAut4RYD85VIUe819B0ANdJMcN
         vBSTLw/jFXUtTqKtLcE/Okvg2mbjqIfFL1JedOi57bJvztMUVQ/LfN1ut6mEn6J+jrnm
         g3ZzxBhc+7RSxNTw7OMaJVXQyGq3Ai1TTEtNJ+Dtg7zLR5RSEt1YaGgMukukdnpr6Ma4
         g3RFAYBBU22YT/aKxhtrhszV+34+56P0UEf1Z/x4s8DQaxxUdrJlKXkHcQ0wsUtPqnf2
         ILJKCcFx3SusyRTkDR8LOHMS3dFQMmDVYgIvS3uH7FcZpFsqGMEB0fsyigsU1gsobRPy
         VEQA==
X-Forwarded-Encrypted: i=1; AJvYcCV2KTrSMRYfutpiaGA626TOE9JkKRm4YrFNOM+7lt3Prc69HXnmBk/83kop4BWfmSjPafRGkEaEq4nb3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YziXSvhYmBkW6nKzoS9E98MgNQDAwc/iYWoxqetarPgtMzilAFe
	lZdqoj1/U19UZHzqqnIk14sndB+hf2UXczeyD1ng6JIO3Xr1OocDrYmfi3bihJ01vQOmh//Sgap
	JYebKGoR3wgMTMaezjCe+EmZJRh/t8h8G9IReLAGXBU29Pe62hAj+4iO+vcPi7SRZag==
X-Gm-Gg: ATEYQzzFZyzUUjYixS0o5cBgY/wfB5S47Pj+VHhjkasJa+A8dOYXa/87QVjpuzhiulx
	pT0ZowbtIq2NtYmvZDxjRwk1N5XTIDYmVlFKhzP+h/t6Wf3wUmzRi1Rld818KKq+vH6ba7MJd/F
	SKoc9u+mgH35zmz5Y2NwlQZOuARGqnHDokcYbbiUZOV5r54Le87NOCexaZHO3xLlAG0+wahY3kN
	OcGIdlhABeCFslivfknnI17vSejIWy23yswZvOT7AvZDN6VPE/Rq7PrUfROkRJrUHfX9LMuUV3S
	Goal9z+T2gbjiU9Q5azrFKpxEtvCPvqYqk979xVhHNy+VJoM6j+RYnLOHUfn/R64N2dt8/splZm
	TqBlJm7HfjJqHPB2qGzgC3hntvSlIoBQThmGk4uvkRs4=
X-Received: by 2002:a05:6830:7007:b0:7d9:c69e:ea27 with SMTP id 46e09a7af769-7db99410b8cmr1603163a34.32.1775013771018;
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
X-Received: by 2002:a05:6830:7007:b0:7d9:c69e:ea27 with SMTP id 46e09a7af769-7db99410b8cmr1603147a34.32.1775013770650;
        Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:44 -0500
Subject: [PATCH v2 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path
 ordering
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-2-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbO2y45sZLvpmthZIJJ25uuZUuk4g1h1zkNH/OFxXNI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HXQ17eY/AysPOZgJT0P1HYQKYt0DlWxLJF
 OVWJFMx3dWJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUs+A//TvwvmBOkN51ZzQcz1KmKpKI7R2PMtPeD8TcF1yK
 svc7GZTWr9qMoEtwHY+24dxJwBiAW/WQ3UYDnVbgF27vDT9GRAMaokU2dtbHcWcpY7So00PmaeN
 3q61YNXYk0CuDz9OjWmmVrWeP4gJRxW/+YAe06xjXYIExfAG7gCZ0y0XySyIQ3MCPL2RFm85pK+
 TXHT1lDQ3kUSCfkTkx/z6RFhThRBCEQ5n1DoJL0hVddEXucZcRCxGMx2Do7y3/RUU5DqfkEijWm
 9LBacsd+VDQ040VfpIvZJbYGlU7gpjYi7u92WdeQ6dpjyb17FwYcXYSLVTI0eedhjRaq0qCFlyP
 SMpC6DBAzBfXiIwpYg7sHhaCO6o/ekGrCqVoz8/U8B9ihq3z8otjdEXBhQTssyAK0UJsNildjqq
 3qegM8z6HdldAq4PmI2k/MtJRehEY8I1iUjFsFJA8hbp3fUoX0qYBvMp6dGbwAfkr5zhdXUGY/h
 nsXoJ11lqDwv5yDfFUStj04TlwT8IumK1dGw0L3aJpJeNkTfeQDNd1pR9dhZEX1X0pJ9EMHZjWN
 Mf8DNok4zikczGd2RvqIpfAhSN/uBq2Vw7004ez9Fgu5Xx0uMCCsGn+HIVZt97lPRB610XBMz9J
 Allu+ItNT1hBe6JLGmMII+r/JZ/pVNTsfJBQ+HvHEQK4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX8nJvqoP6bBLE
 x+4KV4xy2TxFV0UptF1+s7RAVetk5uSeWOpIY04IHHKYHUPLDBhF+5neUVSusxr9pAo96Q4+MnY
 XTDovmlk+1xIUa7BskRjhF4+tNloA6rKx8i+R9YlYOjn3rwOdPXRMEo2Gv8lTTpexpR8vFUTApa
 NagahpCCESLjnu6/z6kFLNZKVn6Y2QYFjtmweJHsYnDb20ld90+0cpyQTc4xh6DgZf1ml+knSbv
 GhGgqEz2fPn9z2rztbbkoFvjXls7TD/rH1rIaQteyCdkkR/CrYY+6xcqnpUi3tFZTCaDroRl0ZO
 WE2nooHWE+GrFqr9ItICoP++0ml01v2jWDxU7IX8/xj6omOwSJ8sY+lUeR9GOqsOQhG/9pa2Jpu
 bWJ5VpugwcQx8hNGKJRQ99A8hWYcL6Fya1LMILCOXVXZr5AO1BSrrtPlV+C8FI3AVQsdq4e5HQ7
 aVZdfy8VJwpobR7smZw==
X-Proofpoint-ORIG-GUID: euCMpQoCTsgQjdg4afEZpXGLeWRGPfwb
X-Proofpoint-GUID: euCMpQoCTsgQjdg4afEZpXGLeWRGPfwb
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc8f8b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024

qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
allocates the PDR context, as such the error path needs to come in
opposite order to allow us to unroll each step.

Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index b603b9337905438b6c9f5dbe800e560c864d946d..f26fe54b2ffb4bbfe6da6b717257313536abf60f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1660,22 +1660,21 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->pdr)) {
 		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
 				    "Failed to init PDR handle\n");
-		goto err_pdr_alloc;
+		goto err_unregister_ssr;
 	}
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
-		goto err_pdr_lookup;
+		goto err_pdr_release;
 	}
 
 	return of_qcom_slim_ngd_register(dev, ctrl);
 
-err_pdr_alloc:
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
-
-err_pdr_lookup:
+err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
+err_unregister_ssr:
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	return ret;
 }

-- 
2.51.0

