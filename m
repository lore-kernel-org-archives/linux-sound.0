Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36573CA491
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115761; cv=none; b=mv3//YC5Ai4f0pYlhVvwhTEo2db7RPt74lzvQpqIxZ47wMiNz4nX3DvddLmNj7iS3AZbLMyBwkSdqtPJ1wJAzbqlPhMGtheIjsHOY5v6KlJMBBs9Uv7xO5dj+It6n1T3fWsOV34N8unnBZndHvdU5lL8/ZDSAsJaChgM3nBWTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115761; c=relaxed/simple;
	bh=uTr8Ave//isAJhHfIzcKDULVkXYMBNmtFbD/mSWV4fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG56Heg9ZhiigxSjN488UTRRsczQ/SMelzNROtc7ugrW232UN5CumLzExk9vZuDFijqvImrgMmMMq5CCVPCsTBJ71CpVDP1aGRO91A0JGUVQXamimfYgz1uFHLjXSiG7jJ+2VzVdPSisSmxGWs4ARiKSnjy14H+zGtObSOcDeEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkf4ppJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMCxunJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkf4ppJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMCxunJe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EOlA2020612
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=; b=Pkf4ppJ80/hN3+D2
	VXLAXWbkYELxbtichDrCeSbTxPVvJ/rd3y95oG3HT8wHAB2n4/XtWqRWLIpSAjCp
	yDLZDXKVWwEIPgTQjRkVdKBjtnLyEG6sqq2kn1Dzb6/tG5Else7k437mDeUI397n
	4S85VPDYEMakSQz+GpMCHIhUc5mqTeXJe/TUWxTRpVklV6kPCiF9NLCEdnUuYD3g
	vtqvTEVVvJwvEoYY/3NrrREprpHEqedu14EDRQJrn3+rLMkZrgtY53wKwrcz+8ty
	9DOvZs88IAa1QlPOyiGghwKvSfzsJYcBt9goPyXaH/7qw48rfAFGiWflBNX7KGxu
	uN8Mjw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtg27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:18 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-409698ea4dbso79697475fac.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115758; x=1773720558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=;
        b=LMCxunJe27DjtQe9lgwT5SNn5uE3pQKCdafc5gorSt8GLoj8b3JpVXKHv+G6fPn+30
         cgv8cZI6g/Pxw47hc9LKXqbn4QJm+JEAiifV8cHbBsboFoV/q7ysXJ4VPolnW31tmyQn
         huQuCsQhnAgQRHPnQdEObMAjFGTCRZNTKaAoxFmBTVqlIyWIik+OUDmMVT0PPFD/zCxY
         2m+j0Qr2FnV+QBAYKUY8hiGY8Tfq4D1Dqzh4m6QX8R43folaRY917N3qBdQt5bVpCUbu
         myK6kzzlx0hoAVblWfQGcZXl2xszeWocLWmpKDWPsYc2ALTX6j0wsj+giW/TE/b5NmKF
         yEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115758; x=1773720558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=;
        b=uSv9gc1z7NnCVi4tYcXuLLApYre2Vy/pf6Jsg+43Fb/SsLqUCo2/IFDoQeAI4omG43
         ZU/0oIoYHsoTwWMWtnbCEae0i7JWh0rLJdhgLCae8orYufZlJmYgeMnm99sAhZzo2J8f
         3aQpQHhGcsyJZXFVf3Co+YUemVFqZJalzX7Wlgu2IAvdsRxOOnAxXEdg+lG3fUF5vTZI
         a+iJDaF8mE/XM6uZJg1fmq3shSDSG2h1EJBaWUgg+ziqa5c4xKl8pydxl3E82Akm2+Wp
         q3FPthzEWTpNKhgPRPHC8pRXSHSctnen2PpMWWBlX/ZBBnhjyVKx3e6rt8oxWs9jtpAP
         UjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvTViHvxxfgW7778tv3o4gWDZaVSmZbl8/tRDKc6xhTlO/u2Ti9h2sVuKgTY/HUN6Qx2zpebWQJ1esKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTPQsdELpMUcy96mblyBIDv+wbM6v/hetcPNFKh7i4W2TpKwWW
	MtlvOJkIEwqCkKzGQncxDmW2a7elrZvlstKwemtJKCV+bII4B9aJhh2GSiyxe2Fm5Rfw6eHpTV5
	/RfMo6Rt6f4hHjF9FxU9fsdPtEKox+IERli/SbFWt8nmLDBGdJkMqhf/PX4Ma9eyPzQ==
X-Gm-Gg: ATEYQzyU8vwhF2kgNROXAwHIVCTvpeui00rrIFWZSel3+lZgFHqcGPpITPGjjehjCZ1
	TlN4Rjcmzt25GLv8i6eoZqc5qFOw32WGthWKSoZRqqOZjSE1MKlqwb29aAZFehmlCFPepTX9VkI
	hU0EjvTDCOHoEd2ZN1n8JwQpepJv0YlsDOxuDykw9mmJsigPSZttHicmjJvdTseeRYxIh0pi9CP
	GE5z+5qI5cFf/RJgbk4JW+TI03V+fO2T3CrkU2I19SRp/yCTNWSXuY80vXSD3YDiUYVIms2y4+b
	L53PmxyPv87Ve4ADDQBMXh8NNgOO56O839XFBAph8JxqSF4gbFQgnF6Wnu/yxLscaKpUGf36hRx
	CAYFliXQy8nuRR2eCHKRaD6CUF+aq3WN7maxLLUxuFRg=
X-Received: by 2002:a05:6870:21cb:b0:409:7ba2:c5fb with SMTP id 586e51a60fabf-41756a7eb7cmr1267531fac.17.1773115758327;
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
X-Received: by 2002:a05:6870:21cb:b0:409:7ba2:c5fb with SMTP id 586e51a60fabf-41756a7eb7cmr1267520fac.17.1773115757967;
        Mon, 09 Mar 2026 21:09:17 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:04 -0500
Subject: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTr8Ave//isAJhHfIzcKDULVkXYMBNmtFbD/mSWV4fI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpHTscuk0HN9e86xo4yvw9zmInztm+IWgn5
 ekAl1ly/CqJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUBqhAAp5HJ3HE77j7SFIwR6eSX1rrYLjbZ7FQNtLoDyVm
 nGVZFsTgjK4L0YTpnTL88O2lAkJmsgwL/VkxTjI/Ord97RTXGTLYW2f7ekJH4k74RzZTPc4Bkss
 mkE1ma60Te5iPtqFTtP6qVpFJbrOIAswAl/LI7HwGOicQxWleT5CELlu87WnxY4As+wsYmFKaNP
 y0juECUpoNM8hZEne85QO1qbN9Iu3WMuCS0YMPHnWb/8rcyrVWIuXVIbz7T+dflxzxvxb19l32K
 AZFX5R9+f0AoBa6FDxbP7azp+BnxMwxC9eVdPGDPBGSeZJQ1m+qN8oefG4AbPfL91WTRh00X4qG
 A2JCG/cf/28JiZjcKePD7kxJY1Jjh96YhLb6yUIe5An2GHPxVZE7BoBWj+NyriOKn63jE/brdWT
 6PaHN6Czyiwp4rZNG30cXDCHuqFVBLkdi49cmWFdj3VFR+W+ElfhDAx/1ZICEYueHf3IjNPwTg+
 MNL/mzN86YkxAiN6P2KdJ0Vn1BMtRep0mLIcA2b7ITlkGSf0NXDuBZt8I8ximxJQM/SeSTTEAiU
 a/5gz2TSKne7thefnfm9llY3QWWGR9Qms/IBFB3nqhMghx3CWjXOUiqvAdxwpW8IK+SDdE4urLB
 j8FXUYZT4xhooNV8tXEtJf4fLrbCleEwbCPjCt5mqvt4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af996e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7zRpcr-n2crOtZbBgkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX9Wc/BGrNcTF7
 Pm69gzHM++yBgXK00ufBpRDYE/SReZ1C+7igFCYNqkkDMCyRhsx/rnu5uDM9wVyfDQ299PX5YCL
 u43QWsSv6dncEzP+POv59UVS08Y4s9a/tWtD0F0BExteHJMSdxg5USHJr8BVkMXL8NI1OCvnrk5
 KkSaLS6ledNa9I3sbJDWu0CFnrmIStbqMBjmapVe4jcJb7N8bvm4baqGcgZEwZNs53njVY/i+c4
 MEYVywB0+2BpYcbfVaEBgK65RPiolr3YvBE6bJiY1ZY+QJNZQDBfyBF+BmmU/jGDmGciT/YwciF
 PUucHHBybJ7f+V40lXMi4Fqz3lTwXvC5PQvw5H5S1LeqAKz+UUb9jPt9US01bIThkibjRSIKAco
 3XkpuJgHJRPwAwkht3jmu4spKNyAgJjgEe1VY3//sANxpUAsnz8i1XZEh/ogE92UvtWeCbZBqhN
 ojfCFGYMmK2/vozC5nA==
X-Proofpoint-GUID: B5HCErLupXOokWWSMEpH4H23T0-W3bhW
X-Proofpoint-ORIG-GUID: B5HCErLupXOokWWSMEpH4H23T0-W3bhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031

PDR and SSR callbacks are registred from the controller probe function,
but currently released from the child device's remove function.

In the next commit the controller probe function will be modified such
that the error path will unregister the child device, resulting in a
double free of these resources.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pdr_handle_release(ctrl->pdr);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+
 	qcom_slim_ngd_unregister(ctrl);
 }
 
@@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	pdr_handle_release(ctrl->pdr);
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);

-- 
2.51.0

