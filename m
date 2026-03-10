Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0813A785F
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115759; cv=none; b=GqOO8zcO9Cs6jbnN6CJ7YrnWMyupF6bjOS5CZWiOk38YPYJZ+f++sDetXbaZWVBEVEfQii/bBp4u7+i4c0PxBDdKM5Sbn9PA8JKiZFQN8P2V5RUm1sZGDWqmLAHnAJsf3iPB6wQtXsHzhzgKnD6bz+Al7MN2OMgCr521eG3tsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115759; c=relaxed/simple;
	bh=3Cb5y1P/EwWDNdjU8vL9LecqHowixFacmPbBDFJoYGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPlYftO5w9XpU6k6EZPaJsXqiMwVyVSswMAD+Dti30RmjvR1VEJH22QNDEt9d+yqLFBJNxZiEH3/mAMSw7jpvjsIpUdmxIS8Ks44Qs0bF8kdbee0bWnV06L/LCoD3uvMo91k4dea3DAf7eju/nsvhVxANw0A+4rDscUaIo2tX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDj7FyQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKI0yQ9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDj7FyQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKI0yQ9p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EPGl2817521
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e//oRhmp8fUgAIO1Epz+iBv98UyMhnprwAdMQTvXFJo=; b=CDj7FyQrVDr2WR5y
	njY4P9bVuHGyEG6rjCTheF3/wmF3jSw9cb4g+mZQuo6VfZFOeP07w2K7y1zUUcbb
	e+yOA05L86RPnGCDVhJiXzN94vC8AEuweLFfsRwHjZU+TVnv1tNB3pbVdq0Ek/xA
	gIhzQwGqL7NcSs3LkUZYZ3qgZg4mezLOzyxQ4gGp5Z1ItqQHo9YeHawKKoRHnYmP
	sh2WpqcSumF1HNMzKX54+h86GMXgGqqKl0OMTwLx1++ehEPriZ6tz4frcOJptibP
	45x+rKi7yrpFBsEMvx+ye8XLDNT/nDMTtUp9g/ZiWcnmMAB9W1cMN8OLZ7jzIt0d
	q3d6Jg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr42dnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:16 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-41702ea8343so14496746fac.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115756; x=1773720556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e//oRhmp8fUgAIO1Epz+iBv98UyMhnprwAdMQTvXFJo=;
        b=OKI0yQ9p3Qmvk93RsHFdnaNxZUa33siAos3DyufaSq5tqif50I+np5TIWenlphC4SH
         bjjf+nGgc6Yv6QdLAc+jfV+lugGC8/rdamIZhUQ03WLKFR90FuQTf/sgQ7tQT5mEK0M7
         Pq/TSLET/ui2bulysnZfXoHUxt7EYJ1dmaEid2LfLMrqGZK4UssEkLaWB3apLe2STcEK
         PAnsaA1qPl6rGG+mieypVCiq1J5BZCph/ABsCcu58gAQlyuVo38C2bBWPrV15hUxqCRv
         UU8jl+MrrlafSjtji7iUC1hx8q3PQRPOS7lZtl8aLnyCmL/4gXubDovbEJ3dRecjLkyd
         H3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115756; x=1773720556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e//oRhmp8fUgAIO1Epz+iBv98UyMhnprwAdMQTvXFJo=;
        b=MqHOFXdCrkG0BB0vA4mW3kSx7rVzr0k27Zk3gGiVo1Bwnyyph++iNti8cx6nrE+ydu
         IzPGndLKYezEMG0TITTwDk+lk0l7FKpoc6F32zzZ4QXM0/09qW6EIP5FplhtVaPFBb9a
         j/Sf49LGtWR2vytvUPlkU9wFu5mpfpZtT8Mk1xJToiT/PS8NAw3cBapmey2pDHrRufl4
         akC+AmxQAWU/cvcUkmJkT0le6cQe5uRmXZCicXKjABjcA4yA6zvPPnuL8WePF4aPEpzx
         M/OI5btOdAHw39vrsW82rKZMmr/++JeyS6eQKdqKCkIafmHM9pJ5dVRaeouOtEKb1ZNb
         LvMA==
X-Forwarded-Encrypted: i=1; AJvYcCX1D4iUiEER1o+8yDa+6fuLeUNhgU11/D4q+FM7pKkMxkNsx4ygqvBtlVLEOjo0xMBk5An5dBxQR2uNhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9DNeXUyYFpjiZkZRq2LKu6fpF/YlbYayWIvrJpZU8g9m0sMc2
	HB6tHCUalB6tb/9mGgK93omTva0tu1AMC7cmi6OByVR4DRRlZ0ghQPWrimw6aopN3kiYHBjzQwa
	QDmgiDvMtgNc3/2vzY5SjJuQfUHiQrAr5gjRb24FwEhwreP4a0NJS6LgPmWecGKRaEw==
X-Gm-Gg: ATEYQzy3EjYM22uuw+frG/ULUr+ZdgH9PCU2SGWLe5pAC0dsGADwM4GCnAqDpOHG1HH
	x1TH3eOtV1ZeBdCV9aYp8fWgkkP5yIuqMlrxrHiho79CFsDx8NQd6pf1SQYAedLGLHyY6epH1s5
	M2R93gtnlKq+eiFMUZfSZu3SzOS+NfnRU3WBsUnGDmW5FNHAvSgcL7ohQeVSPAxXkCAqdBMtwHd
	yEOp/yYj4P8+xMG5IvoOZaH67m0n0fLjJNSRcf8RfTrcO3w4gB+v0RHdIBTMIcmq4kssElI/hCm
	901SwbWS8V6JgOTaPuW37yrCX5OzjndKPuB7aYouH9+Tci+hYR8NuiZMEYWzA1ojxU9XcO0gBxn
	7gEmTfFfBxa+l9Hc0VqOizhmiMEAurXmnBuCdT9m0pko=
X-Received: by 2002:a05:6870:b288:b0:3ec:3685:34a1 with SMTP id 586e51a60fabf-416e406f8fbmr7071906fac.25.1773115756263;
        Mon, 09 Mar 2026 21:09:16 -0700 (PDT)
X-Received: by 2002:a05:6870:b288:b0:3ec:3685:34a1 with SMTP id 586e51a60fabf-416e406f8fbmr7071893fac.25.1773115755618;
        Mon, 09 Mar 2026 21:09:15 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:02 -0500
Subject: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Cb5y1P/EwWDNdjU8vL9LecqHowixFacmPbBDFJoYGs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5loy7yRVecGED9eETlNTSgHoISRiezX5TjFr
 rLQI7M+i0CJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXL5hAAmPbhESMgQoZmt+1S7TaqAJrYaWBb7gOkLbPPcgs
 +8KONegyxNwiLPc8IvU8V6ZUs7I5MzRfZWsDfBrWI5WVgF8L9FLMdXuHcLZ6e1hgG4yPq7ECYc8
 7qxDLRSjI9YsuEtXTU3jxRMHsvYZlm3nU7uh9JNItsEsj3VmOjg7ATlvsWfy95AFHY5iSgUvLi+
 pyydiZqe3ofnMeRlCToAoclOU9MUZNB96gXQXchesPl8QVpkuml9BsMewvZExM08JCl3b8IYic9
 9lXaAxDvsor+55N2AXRV5ySfloEFrN3f5tpAQTOkjbQ0LOjEFbgcy6wbDCBjp99ITnPNnmcvzrZ
 /RwIf4kmuu+o0WVcjLt8BqrCs8Eq/cSel/GB+tqC6z9ZLE7Fdflyx7j+OGUSSbFL1WtEeWtnhTw
 odH1sBOUv5KX0MYG/j6Ti1RqZwAiWxANw7O6VgtJWUQytgRGWi0hp8NfVfRiDmrNswsSBbPcR5h
 4DNb5ROyx9NzoOHqWRWxPJ5qrgKDuJd4dblA0ni9+YU4SYgioL8G4nfdwEE66Fg/1Oh5UhhJ262
 YX4S7e5kxhjJ8b+LZQ9XfjgJq5acT7sBJlJ0IOPk+92PdDjzVxTZ0Bxo0PDgkm9Buo/IL06DmbF
 13/HOyDDA5lkU16l6ZHmv5ycf0wpl8ihf2M0VQENOyCI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX1sCUmDjZqy4R
 act8v6w8tj6+e9nqlc/Zb8U9MNSL8Gq955t/BV07LT+15p5ad1nRtLDDZaBiwa6pFgKaw9Vuj6O
 Mx33CMy5TuDDanPeSTvyf7L7/h9ZZaIVATApJbL9nZn3Q/ecxArUJtktS7Mu//lImaaoJw0DYat
 p9Dfmyg8ByTqkeLyiHQX9v1goEx7gVGdHlX7CHMRVcuTciJCiTttfivI6GRCOe6KY4DyXvicVML
 Y/98d1/aK9sKIJfJBcrITQf1rpgQtRkMSKry9qacIBTjHRzR04em6LaenP7UAFI2irG2dcoZgeF
 +FcEXeTh0DNHJe4NNfQs9KgyNuRr7bRNDcUJ6e3HD1glRIQhbVjTuez4jrFiKO8hdoTQuKCSCWH
 QgRw9Pu6uP6qQhRgsNscYauPvp/jHv/jHIiV7OcGvuH5JuRiztf88VFRKNJeVKpNYwoS39yARaq
 Lc+X5qWLIHfmeWU7xwA==
X-Proofpoint-GUID: 0QpKdGIRSk8jCbB6lA4fRYCnjGxXtgPS
X-Proofpoint-ORIG-GUID: 0QpKdGIRSk8jCbB6lA4fRYCnjGxXtgPS
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af996c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EWo_CA4GmUQ_SZ-sejQA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031

Device drivers should not invoke platform_driver_register()/unregister()
in their probe and remove paths. They should further not rely on
platform_driver_unregister() as their only means of "deleting" their
child devices.

Introduce a helper to unregister the child device and move the
platform_driver_register()/unregister() to module_init()/exit().

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d2b350835626839371ed6e19860e2..c69656a0ef1766d5a9df40bdf37bae8f64789fab 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1562,6 +1562,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 	return -ENODEV;
 }
 
+static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
+{
+	struct qcom_slim_ngd *ngd = ctrl->ngd;
+
+	platform_device_del(ngd->pdev);
+}
+
 static int qcom_slim_ngd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1664,7 +1671,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 		goto err_pdr_lookup;
 	}
 
-	platform_driver_register(&qcom_slim_ngd_driver);
 	return of_qcom_slim_ngd_register(dev, ctrl);
 
 err_pdr_alloc:
@@ -1678,7 +1684,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
-	platform_driver_unregister(&qcom_slim_ngd_driver);
+	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
+
+	qcom_slim_ngd_unregister(ctrl);
 }
 
 static void qcom_slim_ngd_remove(struct platform_device *pdev)
@@ -1754,6 +1762,28 @@ static struct platform_driver qcom_slim_ngd_driver = {
 	},
 };
 
-module_platform_driver(qcom_slim_ngd_ctrl_driver);
+static int qcom_slim_ngd_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&qcom_slim_ngd_ctrl_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&qcom_slim_ngd_driver);
+	if (ret)
+		platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
+
+	return ret;
+}
+
+static void qcom_slim_ngd_exit(void)
+{
+	platform_driver_unregister(&qcom_slim_ngd_driver);
+	platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
+}
+
+module_init(qcom_slim_ngd_init);
+module_exit(qcom_slim_ngd_exit);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");

-- 
2.51.0

