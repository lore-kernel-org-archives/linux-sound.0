Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C537F016
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013775; cv=none; b=euoYa4MjiVXdrWsQ70/x9oqrU7qbQzea5JH4dm6j0vK6LNGmJfhOULPDrwNP1zhca0STkXQ78M8fa+ygf+w1L6Pe0sfsl8XpHNpyFUDTQGdksHEEQnjCdKNt4Xi75BBYGbZJd9A9T1JOEOhbJDxpa65lrNYhuInQQp9jqsoGYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013775; c=relaxed/simple;
	bh=eh1pflsFy4i4xWuCJ3debJEBSGewUbDoQf1aW0vXPiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1YUCzxueNDz/Hfp//sK5JKA+Y52iaAPGOjWodKbmiNHdfEDP9ammRXwCuqX9g66zXP/pLKWg/uLaYGmqDjXOJa3XvYoc/V6fZeUu/u7HZp255yCmo2co97vXnPmSmm1+ZB452FNvEJrEepAlRqnZYd9v2SPQ5VS2SK7re8k5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1oZZ4zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPvkHnWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1oZZ4zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPvkHnWE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VJlUad1579394
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=; b=R1oZZ4zcgENv2srb
	SjTxEfcJMUYSe4XsmDipeJXQbykaifAQBQJO1parvpFtRtvSS2f2YEDdO32vgPIL
	uqROD+Afz5NIYn46/FNr0uSenVCjYYnL/atzLfJi2xHXTv8stJmkIZlxsDSxkqxX
	W29SbR0C6drJ+U5awUoCt/jeaucRqIkDjhqoDaLm+WF3TdmnHY2SXFil0MhO1eom
	bHv8ZGsJyxT2MCNMra/TujUARAK8phalNPLaAV6UUgK8t7Z9SqSt7HOYol87cXE0
	bHP7iK71Yg7g2mId5KXp1VyaJ2pivIFAxcLM2V47L5oWu7MFRHadAlTpcMJpFgnM
	F9Tpuw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2senq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:52 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d7e995a87cso27145971a34.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013772; x=1775618572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=;
        b=TPvkHnWEEiH/SEARC5B4XRHQtrmTEU/FPDByprl5Zqf1FfWNUNKfT/MQK5Tx4ljkq9
         6y5s//dVJgqfma+pBgG0Hc5M1MUhENB4UfBWESNJOaAE3tnIradjIuJEnB/MVALW2nPw
         rTid0wKKWb96kHCxS9qDCN+n2+gUfOPF8fITKvyJEgCijPHIdliAUBqkDfNhO+lQebOk
         MY32qQ4zScDqTWkMm5mIL73AkGnDh9wh0kV+tSyYcb6e+SEixV1IEppcw8RlyBPLC+HA
         hxatf26XMcqPBJO39m5oNhY+d15Cnv05hPg6fBL3osZJiygEc8lTVxCNXa9zpmMw8izS
         rZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013772; x=1775618572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=;
        b=lqY13++vsNEbrpKjPoU6EDBkzGzqnCefbicU+LdDM6W+VclLzO5QMOITUsLhgl0TVx
         GFD9AYXnPkSiIoQvGgnSNjnesunMLMAaVWkPSfrV4/fRTwNMdNavqnCVNrvOjm0QQ4wV
         wgu+feKL2WXXND+soNcbFXLyO5xcw71eBQ6S+Zskl+QL01KTEquoCIJplcE9MN+K0ZAs
         1hG+rzf8Bg+QatpHfv1PiE+xRt23rXWjRScISAtdxciiKdJXupGODNEeQMeyOHIUw2Oa
         CZim/SP5Zz3Yxc3HfQbWlwkrq5Z/aU45jkmwRcx51tW8TJz65RNL/Z1BAobwZE3QxvGB
         F2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBDWiJMBP2rNXBiQ7K9KttowVUFLgsX5E3GOzLcMQwV+Rek8Ows30vVnSIPGwYZpjNp8EbC/CV1nwneQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbgOODisWD/zzUx9v95g63i7YtwZ4K/bqKbqPEkAN4zr3DASMK
	Fvx2m8o5nJwKWMAWOSBp3kYGGL01N7ehUd13BZzhIWaQDFRruAyzVjwz+wdAJKVBCQ6U8UrRY17
	PNPd4HYUyhU9JlrlsGD0rQuhl/JbEV+o2BkDmQhioRhoifgtmHOhNo2ufvOtPvdTmEA==
X-Gm-Gg: ATEYQzzugqf79s6x+03sQ8Sv5rBISGq4WLO559f3alDj3gNc8kYRaT45Y1yupjjDKOx
	3czPLqa6HY9LMe4J5dxuzyxBJq7HXnlRnOe73z+UbItbei6Oem/o12JwHesY9ny3T/BhRs3am7j
	HKC6XXGRr3tV5tMJ+ve/ZLmMBKQBSovE1nnlydap+oJqP2mYL/jEigRuLSMnYOUcfdtdzg34e7B
	msixFb31NpUN94griimSTv4m8N+u5tTdIBIOCczORfMEBpeQFyHDeDjx9IoiaLzBlDBMqCP8vSW
	Qj13jPP/mpwDVLG/G63MUCojV1hVcdWVEA7FpyqQGGJOp/h0KpM1IR0KgkdDLBtycRbfyJhk2f9
	oASi6Vxh7tDTOmy2WroX9j1F0EmKRM6B4Fh3acTVR+WY=
X-Received: by 2002:a05:6830:81ca:b0:7d7:d1f0:7493 with SMTP id 46e09a7af769-7db9934565amr1409206a34.18.1775013771766;
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
X-Received: by 2002:a05:6830:81ca:b0:7d7:d1f0:7493 with SMTP id 46e09a7af769-7db9934565amr1409191a34.18.1775013771358;
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:45 -0500
Subject: [PATCH v2 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-3-9441e9c8420e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=eh1pflsFy4i4xWuCJ3debJEBSGewUbDoQf1aW0vXPiQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HEE+6zNK/v2yvG3jpdJVZIL2zvWuS+H9Ov
 Hg0ELibHk2JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXF0A/+ORqUdaF7mRoNlZKgJfhlryleRnQNlHgahS/+/E8
 Zr1nuupkvYlUttbGyNne6kiNfcU0lXDEZkuFNz+VqvDc9FtVCTn1RpAdvTTHpa78rUEgXOp4vWV
 ZyDt/vyEYZu8J4brtB+Go72Ug2XJHDBuIi+htYSa5bBhLeUgV4VBq9NgFF/sGk+QIGyVkN4FH02
 bbeKxHlMDWCWVY1W77it8/LVjExl8neJ/265ZtHB74mer8ojfXOM1dE1RpH5IM1QndktMseeKSm
 eOtbtTwlV3LVTH9oFj1azptmEyLZaIdPOGn5Wj6qezuoDz1WhgBp6bnAeQB5yxVFcjQbZHx/ILh
 mtO9Dl1bkps5m/bJOpQB5+Jdxmrpzy3bGcPx12pKonYj8K6QUIZFWkaVEyYc+vlKY1loHPdaVvE
 IORld5eusPmPCA8AKYrgdQFZhDJJL5TtFq17yucRt7v5E43HAx8lmmPUvALhBqW6otXGsJ4dOee
 HIV3Muq+gD7Pnau+rTNNqoDU3iQYIjmX965ShihiFeG4GUeiFr8TIf9WYb6oCIAAv2foq4tNv7+
 QEdkPMSAWCAjpffwnoIt+76tRvG4X5RvCFLG91V4qQiqv1l2d0xH93d3nBgqERxIBrZcoIMEK5X
 ZNVJqnwY372Jdu99LcI5kCRku0qqNvDJa2kaH6KBmikw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cc8f8c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: QEjTFibZx2h28DiQqLOl0E6M18fXUrKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX+YTJYhEYMMTO
 B+mQ7PJVLcnio4bp88YKUFpqDg5+D/2XspxNocHvaXmCUuEOP+0JjbI52TC6EbpOamwEmGHTYy8
 PNHXpJiY2OujlXJzu2ETAfwMD4fo7OnQIqBa2/mEtd/e276vaxTDno3Fdd1HZuBd+BTENu9wi4m
 aIaRPQzQj+RotJHS9IDJMcfA3EXDJjE//LZ+NfK29guP+J8CXShU9xGxqLJ1luiePYJ4QC+U6AW
 6uAO4z5xaFlkraOvAuO7V5/O/QGSq2XL84HhaVwgcrERwcbw5fYbdB99YIxGDuHS2gvb3JOIdB/
 BNUpxU4im8nc16e7Zu31wH58uJxHNCcfHNsPLADIwFNn+99oBAUK2M8m56VQex3KZtYqgBThBJo
 H9j2EwB7wSLZQf2N/UL/pVT2ydI3CHDL2qefuOvu7jFEWqBDWiSQApOUdiqBROOXKlytxg5SUeA
 HbYLUBCsrQHmDiyNhFQ==
X-Proofpoint-GUID: QEjTFibZx2h28DiQqLOl0E6M18fXUrKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024

PDR and SSR callbacks are registred from the controller probe function,
but currently released from the child device's remove function.

The remove() function should only be unwinding what was done in the
same device's probe() function.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f26fe54b2ffb4bbfe6da6b717257313536abf60f..fd533d5bceb6d7352e8ac6fdce321d3acc285f1e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1683,6 +1683,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pdr_handle_release(ctrl->pdr);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+
 	qcom_slim_ngd_unregister(ctrl);
 }
 
@@ -1691,8 +1694,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	pdr_handle_release(ctrl->pdr);
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);

-- 
2.51.0

