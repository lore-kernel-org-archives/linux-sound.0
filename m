Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689133806DA
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013778; cv=none; b=eL9aXWs4Gq58B/p9A+eV1k4qQybgJQ2SPnQbjrS82llxNEA7qeLfWAJHeS4ujnrGUdIB0FG/60NZwQPZ7NUbrP2ED+sKJKVpz2Y8igtb4uikQk1Z6PHVAerMarTIt+7u2nY/CoFFINKuztlw/R9no9R1NptyRS8SItQvoLxslmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013778; c=relaxed/simple;
	bh=AgZTO6aRHtXsJJ51b58atkaG86Hg2Z74yGqzC8W+3Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCPQ7rrijHtCQe9Yr+CbBbxUtuOFdtSIDmrEkeSWbn15T9vvyL5Ustea6whi8ArJTq3VO3iubPOsoMdG0zZSmbEHpJDdv4FRXpkOFj8hlWb3RVGRryqewEMTspyTo3j1M1izG6N5FZm3BOpoTUXxXP4t90KzjVuv28/3tWV0QOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntHbCXBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PADReSqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntHbCXBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PADReSqG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312GXME1578358
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=; b=ntHbCXBRicJ/yuzy
	h+BYAzKqPwC5vyQiJfVedgazbaOIkDll83ey1zj5rahoWJ2KNmiWL9jD+SnXpOiW
	OFRaHR7B57YZfuNcv3WZHERws9i44sk5ZooI9dTNURci+7+albZSFjkgVgcE0rEL
	vRD/OJFXSyeq8b8DNb0Zgx13Z2tSiFWoXNoglypS9q2LJUKEhvsyIAArYCzensx0
	pOH8/Ew5xOkdjNpQRP9B4FgLI/QcOt/5oLQPvI1uiagB2q0aNcLBLAUGi8lKeyjz
	EWm1KzteaHRHxQTA8PiaFiq50URyLgcRGH7efBs3ftqJSw5flYKTFqiUmXOu1Z/U
	Nt8Nsg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6ksy0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:55 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7f23bd25bso2995256a34.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013774; x=1775618574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=;
        b=PADReSqGzJiAqKwhCQUHyLkVaB2fJRUns+/vzcxRdPZxvJWdYoi7JSO/4gRhJ1jxLL
         L/wAgXrm0NG19Dj/JnjTsyvaoAGSlgoGKNg8UrKjZc/I1fISnZ0blwRetMG1Ic1TnKxO
         isDBinpgyNwTWFFxSlUlzJs+3iMHRAIrlm+jc1oIgBYuKprlTNsh8stWiUT57fkYhyo1
         s0QUTF1uxqkBPzxkLK62jJN44Umn9TSyTf6smR6Uj1r5MgE6Q+WQ929dUIVEd7sLbME9
         GfpXl6gzP6QUuxEiKpJ9ORFMjrAqCiGmld9MTTS3Wz5PTPAelMVX/B3w+tJDnvtg9qMb
         zZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013774; x=1775618574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=;
        b=Uvg7D1TEy1rddNUoHKFl1plzOwm233EyBEBaJfLCBF6Nctts4Xwd8zrEe8XTXINoA9
         4uFJ5l2mW1Kn0mLy/6t8kQU200b6NUbneUwAPvk6XTG1zu+U/J0GOdAfhBTl59WUn1cB
         JT0K8u2jOMohwNGYEuN6ZccXiP0MNaKJBc6lTybop3gAMbA0QjAaT8ojUPLCjAss5rvo
         0nVFB/ZNxNAbsQmCO72HcNxJDBw14YhY9Iy9xkjStGhAYL1W9j+vlmv19qOyhfDXLH2N
         CB35yx11yEqSJ4D3u+1Ju0Ic+mvuwkER+rmuNYEfiGvUE6awvuLNECs7OTg2nwHDzUqg
         LiGg==
X-Forwarded-Encrypted: i=1; AJvYcCXHOt7R8o1B7rZ5vPF5kFmXKzhqHP2tI2s6bNkMEvR8QnzjQQ2wb/fyJ/sFVPZMhEwsKRMDTRTVyynQ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8mcMjm0GOjr5G5CcK8RZPSQc37xlo+9+dMs2PzcgeiZJUs7w
	awuQb2gaJI+uiGQ66cdzHHktVCMmGJF2ovIad+K8s1Cx7HEcBG1mDbTEh8oPV9IaggRocFyJgje
	+qTZ0nE7F/AmvPkTb0oZ8ty2AIiJ/1mg0Rp8toqArD4bN9mYRknXiSVQArDsG6i/GeQzstDQTvA
	==
X-Gm-Gg: ATEYQzxMVEIk1ec8R+zoQlMkOxOvkxxmjh+Ei6kVMrUaJrBu8LcIiDgB/X5z0L6Nwf8
	U2oXpnF+fminTlcpKYjBnbesWL4AjL5IZJs/ETk7sxTDWlpeJjZHH1irlRpFt1zsEay9PujEwvg
	vbimpBAiOb6OTnHM1mdzqt9SryC4RKUkcinIWjaC0849upUt9OdMSs48m/A7e+ojiIG+X9H58Nv
	XyYccw4GbfAEqsooui215bL32GDGeRtoRxixPtuCe1inZfH5IvS8n6Gb/osRJS1m9lE7uE4zqKy
	A2XJU2ZMRPhCjh86lX+BTvhAN26d3U9ejZztduikuXEFsZpueR4QjPXg/liNlbJ7sMzmMySXYu+
	M8mEo8h9n2f1851R//NNPNcwUgE2hDDBQqNxTAvOnQes=
X-Received: by 2002:a05:6830:1dba:b0:7d7:cc54:7792 with SMTP id 46e09a7af769-7da37502951mr2400265a34.8.1775013774134;
        Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
X-Received: by 2002:a05:6830:1dba:b0:7d7:cc54:7792 with SMTP id 46e09a7af769-7da37502951mr2400256a34.8.1775013773739;
        Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:48 -0500
Subject: [PATCH v2 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-6-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgZTO6aRHtXsJJ51b58atkaG86Hg2Z74yGqzC8W+3Jg=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HnIvfopxK1sVdpIf6pktTc98fDuKYqe472
 mwdkDFj4eGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWrxQ/+J5oBrt0GAHEY+UjOAjVosP5R+jeQH94U0b5BBvI
 XoDvTouPhKNkvSXnCkGV+KDkiWdflE6Nayy70/2D6/V1XxeAQaDCIflu+jwEUwA6DMpqKP/3/nD
 Zo/FEtKjYiDh0kaSHQzi/uI8F9xC9TDGMihTMu24LsCzeOFoIFDZWZ63OBIlGBzmgS1D0HwKaPH
 tVi+7vOFCRvYrxj+5JkVyNsrqzj+uo3ai8choSmqwrEVEoPkXPKfZ4nHfxsfFwJpgftdK4MrQq/
 kqazxv7Mkp2AYf7KzeTHbrAeQ7VL4RpXJXnKa3XU43SRVNgEf4AJPiZcwgS3dnzWpAtfds3kP1v
 ayuo+dzos8C37/2DRMTeSuxTLiqhCRlqm33huCP0Vs01Tz7Kly2CwtFbfh4BHT6kbEyXt/xuU7P
 nyqpLYTAadVjVYyb8rubfQs1BPw1MRyvmarnlQjMLuP9H838MwuKV44yH+fNfUi0y1O7vqoJw3o
 zq0PXbvY5rjRqGairqwyB5dAGiRyDs3rS2Iu4otaQ6jgKxhb0tLx44M0VzhXjLwC5dzDEp1Qj7Y
 PGQAQK4sQwxBmep0q5BNFONoLm//1OdtalmtJthHwzVo1nSvkJ4qEARLwg9ELcGigWDBxLlnZqJ
 gJAmbyYueat0Ly3SAByJhdA0fGHP6uXmHE6so00VD+WE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cc8f8f cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7zRpcr-n2crOtZbBgkA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX6mAjEOUZI7Jm
 1CqCBWU9uDREYiPigfA0o86DpAmjAfFa4rcROK/aFMbQr95ZtMgc9HNZpXDQOC0488Qf2AeubCm
 PSX7XTSOPN9fmDTAGKDcqPwj/84PhShmqtrhWZ9sykkZWYvDhADGstElWnKEcHzu1lIvwGsLfMy
 sEdLVXFdcNy8wyuAQVJGtqCvIsH5DlOWyrKpu5tFTUdL4BdXZeTTqPflYm6FIz+uiYVhAVsGCOQ
 c4CjzPIkXDUG+mLaDsyxc76d90VB+WC7VS7PqyaLkqGn6KUMlxMBL0wWyF3WoN0hjoxGDlBHqpS
 FI85GwQJLvA3nUftNf7wlrUqIsQONFE7zsZf34KvjN8wIOaC9Ba9TbMW7qFVx69arUPb5g7r18d
 4CUtM0H1vmlXBjtCn+8Dum/ogD14uz3pVEdTAIR2oAmKRynetW1UVHsJdnDVYTMkvGkQ6lT/tDU
 2OenZU7OLdgGg5+P3Sw==
X-Proofpoint-GUID: wKvISFahxKZd4oiBg5s62ixkW3SD0gCD
X-Proofpoint-ORIG-GUID: wKvISFahxKZd4oiBg5s62ixkW3SD0gCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010024

The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
supposed to be balanced on exit, add these calls.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ca5c1c00fad163c69672db3b37bf225490e7fb96..afd2171d3be2c4c19994e9ebedc63dedfba899e0 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1582,8 +1582,11 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
+		pm_runtime_dont_use_autosuspend(dev);
+		pm_runtime_disable(dev);
+	}
 
 	return ret;
 }
@@ -1696,6 +1699,7 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);

-- 
2.51.0

