Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F53CB2F9
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115762; cv=none; b=AgtFuwpWuuQhhxpoPjuva3VKe+ed6AQpe4lMCNOdsAobZtbQgdy0ycKFQf12SJi5RjcQ40jyd1k9Se/OFi6odNmY8fLrCohUsWHRBPYtvO2bT1XJTr5oAOdx+P14dHLHSiKTopNsHFW2mWe7FvtjuDQWtO8lEe9TSJFhjo+i8PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115762; c=relaxed/simple;
	bh=yHNRVHvntJT7Tx36zVXQ9h+CerzoqsLrT3e6rWQ+uvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LN8adQbveF/8+7KEh4AEO5Q6GSDw249JdTFXsu23G9SgiNt+cUWFl93tLCryeUSUr15kBbeGYOxcOrnOEEKx7bY0Tsd2C2dgrVuPQ7fcp9vCgxAX6dr+ysFcCSY1xIG3nfh+KTJ8K8FyQvOQaXm1Ihto/trLhsY+UvF+PrYoHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5wXBrjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebzbju4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5wXBrjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebzbju4S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2F8d42021954
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=; b=l5wXBrjQqyoBz3uU
	6gf/eCMNp/mjGdVJ8KTy0Wvk5GkdlgcHtJW1Zl7kLdwkUl+u9gYrjT3BxgA1uGu+
	hmfZNTfS15JdYBle4FKqZUBBHo9134xMioO9NNhjJAYLtC/eOYcK6HKDgmHXpQ8p
	rm7+zytQ9VvMIm8CNQXVHHjQBDanpP58fUjbES4MzAkGtzZPGVzovKILXsKTC/1W
	tk0ttfTVuVoU6Q4iSW/zwSARL9uCHFVXc83Ml+oprDz/8I4W6l8FoBjLif2dFQjp
	k4uZfGrlVIJkS/vJCS/1IbAvTiXfd8zPOuuyXU+MJ4Upd/+LHv3LAd+TTUvcHvwx
	iv50cg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtg2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-40ee506cf49so50693489fac.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115759; x=1773720559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=;
        b=ebzbju4SqFP7TpK4FmpWjuVZm9Q/FawHMmP993ID3ihhQA5rFudzYyhus/QVcMMBU0
         5GPHasC7svaKYkE//jtDW5853lcoghpqsiS/BSwKA11Rr9mtJnCAOQgVDGFNpdLwtFMg
         20MJKzTwn6moPfRN5uScLyPbyJ5lp5193yWUUIS880UvKIaeNabm6uYxH6VLDiJ/jymx
         mR/8LU7oW5TQa/FkSK/Pr3Yx39N9CUxbQuzPm+W3v3DAq7u8pViBgBUeN/rpXfXvfzxM
         +21evcAkMNTELzmGK7oPv+yTfxdSHu+st9WbOEU1ttqK2gF2PYbd/mBbkBLelTNG+I77
         8eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115759; x=1773720559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=;
        b=Qucmf1w9ITBMpiz6d10cyPHNOxcDT39pRGtWdzVNxpD0iyVWgAHt7iQUd9MNe3JHLC
         f4rYufpYs93w6ioykLJkX44J5s52gAsc+qm8X4szBSL6UJrnWirlD47ln+w2bay9Ihg5
         a54x/UfjC0UuZUZdUNI9hnF1/yHUiHB6dZtUw7cz4vPBOaO15ywpTUcYY+XF2CJ0et2/
         dWcX0jn5oqgcJk+KL3UcB1reGBz2nqK6ZZq2rlruRbpXaXwWSldMo8gmorkmpbTdsnsr
         vl4eOlml8c/fBuPe9dzZpIlatWchjwPXv0nPRVmc92367rofs+9Ad7QD39nGzA88WIUG
         e6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt8TLiSpvT22O9MbKX7d23Y+uUZzcb9GMsvxIKGH+Ju2gQxn+TqFOCidAXszFSpCO2E0zYak1iR4gBvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYhCgeyABqednwyfnrPrLAKTegJOgJ935ajemKHkwWOKBO2rF
	4txYsHxSJxd9j03qtg9sbqzSOcdIv7RJYaOXYIO7DXOP/vrq9E5Zi3SIL9jWnsi66pFktNHhbE4
	wb/Yp2+qeUPrzG8CgLCF2xwJAaZ4H7gCp2h/yt4WtlyahOawIoUuhXjbEGNXPAlwpMQ==
X-Gm-Gg: ATEYQzz5tXQNUoDQZJ1n+Rr5rVfZEOhsQgId5ir99iSSf/F9LMnuMryMvVSyqDuR7Lk
	mHgCgyy1Y7PjGpR/Xg0abo4L4i/whnUyAZsiJ1w7yj/jTMWMCghRd91fVPxZWbeFY/Rf3LbjF+k
	UzvS9g2PB+wER3lR1+tZ+A2yWTeKjAYG7ezS6MmWkO5jbRKigFW21jsWZr98mtBYnqW8SMmVqtg
	b/lzlU9XZwjnSJFSq3MN+jqJ0u+Pe8PNEBUjUFRdI/IL0NL/PnfsA0MULal3BHpLH1BduLKsjV1
	8p0mUvpPoXSqoyowJ2pKCvJLVJl/o6WM8Ped0psR7/Z8K7sPlQpbgMAA+s8IHv8ib7dR0WwrC1O
	wyaSDdeWGABR8H+irM0o2ahN2QN0oHveJ8z9yU7teqMc=
X-Received: by 2002:a05:6871:56c1:b0:409:e3c4:6027 with SMTP id 586e51a60fabf-416e45d1749mr7785244fac.55.1773115759239;
        Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
X-Received: by 2002:a05:6871:56c1:b0:409:e3c4:6027 with SMTP id 586e51a60fabf-416e45d1749mr7785219fac.55.1773115758745;
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:05 -0500
Subject: [PATCH 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=yHNRVHvntJT7Tx36zVXQ9h+CerzoqsLrT3e6rWQ+uvA=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpVAa+TCOg3EjuGeYS5AYt0paEICH4mxwWZ
 /SYhTOjjoGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW1Yg//c2ijG5PGehgPGqcoo93wCG32YQwPz9wBoF7H7Qf
 ySYaXYLQ3odq/bPzw7M4apMwn0Vb4JSElZlakBHLe0kpqqUhkJCn6RTpP+ThO0AdW4Vk+H377Xm
 V9K/tYLISYZ0fXdPqdgLqtUP2Z7WJ5bC0/prNEQJ4mYWx8y69rsM/RnQYrlxB+U4JxNz1fOEzR6
 VxAhJrGTx6NWXJKxcZpOTNJuLGFmnn6x9PUwwid0GiHeiP4sWKOLdcSzzKS5ll65Zvhm1F3BkZT
 UFDw3cRNtyFbBPoV+OswTIRiaBMsJnyW/bpgZCPBHQbrrxZSnCKLKn7GzHCDGp2K8Kg+x+mQ1Q5
 eFerFu8KkjO9JmjV1HBhk2PolKy3cJ5C3U/ePcmbN3O4Z/LRUUL/6Kwd4pE90HjE3X8xb0ekvPy
 Xfh7SRmxWL+hHkgImR2Sfjp7q6ykho97cz3/Ix+4OeH3P/UqYDUIidxJcaZ1ZjkJowmybXxmL1U
 Ln9hsbv0LhDaMghILgJyBgxlSV8FXoiE1bKCRu4Pl/E2CVgD1mAvs/v/RWD2JQw6TaTk4B6CV/9
 EOR75En7FGN6KpqMPQTgauxtJ3BMcR+P+szTGmEasToaT3RYsw9d3sZISElPh4PHjvINVMWiY5a
 DxruBzZ/HN/9PQ45/tlS7Wjdf+yMeRnZP4wNgj/VGI58=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af996f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YGvZ9ezxgrw7oyDE3t0A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX16Y6vWvC617O
 CUaolPmuWQ0gRbP3XaCUTH/XtTR8FmFGzk+CcvnDw7AUQlsYbLt7k024EMIspStBYOz6Qc1VDt7
 2SAG/P028rur2Q1zmoHXTlChuO55WmrPXlw/kOcLWL2tjPk352DXhGZXSQaK2bNzJz0M3knH8hO
 WHv95XrXnV6ENLSfzCOEfLb3VNVnAAinNQJO/EDUUWEXKugXozCs9WeMoDlmYASItsiCy7/DqUp
 TaMiez5mCd6omlAXiqJVF9BVyd9+Gridk6Ty2iSJshuzEYTXKzElajjPA8fvf/BNoDzz/OoQeh9
 ovsFqFHBubcO+otPe6cMB/p4B69t+zqqvuTQnfXHs3ckmhLxpuSVhN7uiGAuUdMUUU50XfuvVNf
 tkHMr7WmZy4FY3M4QyukZh7dIwlsao2XnWPuWiV2EVH69ymVKEfrM8Z8GkPisIAzKyVdLT84AdR
 4pBV/rNkHJNpb7MHtMg==
X-Proofpoint-GUID: hgn1OztWp8JEy0JhrVB1KFCuzYwyi9lu
X-Proofpoint-ORIG-GUID: hgn1OztWp8JEy0JhrVB1KFCuzYwyi9lu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031

When the remoteproc starts in parallel with the NGD driver being probed,
or the remoteproc is already up when the PDR lookup is being registered,
or in the theoretical event that we get an interrupt from the hardware,
these callbacks will operate on uninitialized data. This result in
issues to boot the affected boards.

One such example can be seen in the following fault, where
qcom_slim_ngd_ssr_pdr_notify() schedules work on the NULL ngd_up_work.

[   21.858578] ------------[ cut here ]------------
[   21.858745] WARNING: kernel/workqueue.c:2338 at __queue_work+0x5e0/0x790, CPU#2: kworker/2:2/116
...
[   21.859251] Call trace:
[   21.859255]  __queue_work+0x5e0/0x790 (P)
[   21.859265]  queue_work_on+0x6c/0xf0
[   21.859273]  qcom_slim_ngd_ssr_pdr_notify+0x110/0x150 [slim_qcom_ngd_ctrl]
[   21.859304]  qcom_slim_ngd_ssr_notify+0x24/0x40 [slim_qcom_ngd_ctrl]
[   21.859318]  notifier_call_chain+0xa4/0x230
[   21.859329]  srcu_notifier_call_chain+0x64/0xb8
[   21.859338]  ssr_notify_start+0x40/0x78 [qcom_common]
[   21.859355]  rproc_start+0x130/0x230
[   21.859367]  rproc_boot+0x3d4/0x518
...

Move the three registrations of interrupts, SSR and PDR until after the
NGD device has been registered.

This could be further refined by moving initialization to the control
driver probe and by removing the platform driver model from the picture.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 52 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 09ce3299e15c25b1b9cf6b1559850adf4aa20737..76944c515291a62fb9cb192bec5cd5c2caa542f4 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1613,6 +1613,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl;
 	int ret;
 	struct pdr_service *pds;
+	int irq;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
@@ -1624,19 +1625,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
-			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
-
-	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
-	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
-	if (IS_ERR(ctrl->notifier))
-		return PTR_ERR(ctrl->notifier);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
@@ -1659,24 +1650,41 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi_up);
 
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
-	if (IS_ERR(ctrl->pdr)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
-				    "Failed to init PDR handle\n");
-		goto err_unregister_ssr;
-	}
+	if (IS_ERR(ctrl->pdr))
+		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+
+	ret = of_qcom_slim_ngd_register(dev, ctrl);
+	if (ret)
+		goto err_pdr_release;
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
-		goto err_pdr_release;
+		goto err_unregister_ngd;
 	}
 
-	return of_qcom_slim_ngd_register(dev, ctrl);
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier)) {
+		ret = PTR_ERR(ctrl->notifier);
+		goto err_unregister_ngd;
+	}
+
+	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
+			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
+		goto err_unregister_ssr;
+	}
+
+	return 0;
 
-err_pdr_release:
-	pdr_handle_release(ctrl->pdr);
 err_unregister_ssr:
 	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+err_unregister_ngd:
+	qcom_slim_ngd_unregister(ctrl);
+err_pdr_release:
+	pdr_handle_release(ctrl->pdr);
 
 	return ret;
 }

-- 
2.51.0

