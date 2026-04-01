Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41237F8D5
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013776; cv=none; b=p6JlGJMKd4Rp2tfTGcse33AH7oeDQHczrI3JdyPkvWgWzU8DaxG2AUZpAoeAeKUvda9ANgkEfv0/fuHFKt4W5765+TEEVAT32AfcIEeDMGb/OGnJYPG/xT/34YVHy5uGRYtOjtQdiva/yu4zElT5j/1HlRI1F0o9K46EHSnwHaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013776; c=relaxed/simple;
	bh=3orZ/lm59tquC+ygmtUkOAAIap6T40OPZUvH9QyqCTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDAfJrAoAUZRVPdKsBt9fV/u+auv0z/Bg1JfMncedkcK35/GSVtVZkwZf6Q9v0GT8F73aiimU58tkRmJgtxzPdEVcWO8Du8Viw2SxVaAO87ZzS2PJG6w1U8qdzjQzYzz70ZBgtBttcJUIWDylUBGqZlYMboLhGZtQ+XCdJ7wXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhTWvBho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZEEJZsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhTWvBho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZEEJZsG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312Z6vp718541
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=; b=HhTWvBhoCDLOguV7
	Je3OwjhxUGyPJVJ619D39NFHv4/r201OFZhIwDwO59gd9qO+UJMcweoTiMbd2w5L
	JOo4zmj1LxZsTp4FeMNLEsJrjEuYniuulIM9bzc3eJISKWgfFFn4ruTMsx3xDvNu
	i21JNRQtNWLo3rOkjc4PHDuZPo8YbMPTLUdMRruQAxMQnyA07QSHtXKfigtGh5Mw
	bnZV+V1+puXoMJGp72fc9RL6fJtY/s5Q5eqHWFlOlgD5XIxiUQNuzaDk1tW2y4Ma
	aPnDkGDXqTYNB5bPdlsYIJ8ThURGkovKElzx/nLYdryM1O/r3lWgP6hgIwrCeTeR
	/A6T8Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcssw8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d7e610d5dfso27539652a34.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013773; x=1775618573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=;
        b=EZEEJZsGNEVVe0SyC2lN3n9yolPLA66AxXXZUK3eCvQm6YRErBjZBSeFdc6i0N6mNZ
         X4HepPl8ll264Cixv5EBIKAbhNgb8zgEtDJwvIUYXb7k5WMagzHJcfrP8sIkgF3jk1sl
         1Bc4tKjxqOQ2OhKMFeFmMzf/QRmrnfF1Bh/JUS5h+L4KEdMJG5o/DShGJ1Z0kgKkgKxy
         uujj3bcKB6SGIkPn0iFKY252DI8izfmUC32R8Z7HD9qWvXAMTma4ZGEoG1iDqTZrutVW
         D2PdeZaJ7NKdiN+HNjEQfVeFMwWcRB7c9APQ+oUwbQaDeVPII5yfeSWUyL27zD7Epf+w
         KAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013773; x=1775618573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=;
        b=YuNsQ/K0k1SiovPUjXbVZ2wSdyvdoax25aCNWlsAhFA5+Q396JG5w03CC3LNamAjnL
         Asq8MR2slok/sZP074NGDQnDK/uiD6k6QAZqlwPpybzv2I8jJFMiDIwZze/1uaCEiw7P
         hmH8XEGCO7k3/SDQx+mHGgt1I4v9aPhrnecPOJD2BR5iXgFmy1CCx9D+2hP/ZqNlU9Mp
         PtRdyraxvi59qY8iJ0te6phGFfvktdK5UjUwg9FiN6bs/Va/BzmGp+pMWRF5h9KR0xl8
         yHqq74stjGJZDZRrF1UvXif2pgRjIxAX+hfNwhPgu2TIGNDscG64xs3vnnIVx8PDYweg
         /Efw==
X-Forwarded-Encrypted: i=1; AJvYcCWcsMb3pC83rNLKk6sbnrZxkdA8uOOXdIDhfsvJO1QfqtCAoo+rNevN+G68va7YXWGyVccd8tzXuPbbvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IzXaqR9t9iRqKWE5vKmQ/8tEn6BxWInFX6abnG+OVLxtJXfn
	RX8DbuDC+7Meq1CBTYPEZDPA/hbESnXAgiOdfbAAEpfpH8HSchZUfaOUMJLuVHasMmtShnXGbM6
	SKe5eXNiiUOBiNVTZLJM9Tqnt4q/FzDo5WOxLixy9/7QmKBXqR+sOp8LESAjhV4vigQ==
X-Gm-Gg: ATEYQzzw2507J/OVXo2nfmJDXLsaCkOtyW8EJFqQB/jYQrfGczdDQrXO3YD1dOYaJZc
	xklk2zIvio1RJ71UWJzh7imqlCzVLmiDxfGgOW1X06/oeTftkS4gVJ0FtrngGtwQPJGFLVTfljT
	Iygq9i+aboDLmrKTXwo9+4aF6Ru8X8Fo11HP1zNp60niJTZl8wU0aOgBLLv5U2lvsgtoU2N+Yhb
	RII/fB5oHbW8cyilRWBHv25tKm+yuRQStpqibMktiprKjb5F/f64bbyy4FWoWMdVIQ5Fg4+zt+E
	mRfrz6VXPApEGvysVxxtNlqbdeeZ9A7JVomFTDDcr3gWVWYAYoqjugyGFYGznPgzYBP03qslVEX
	sXPgmEl7+ld2eXlemuTtMgJnxhbnIZAFxSnqI0sailm0=
X-Received: by 2002:a05:6830:67f6:b0:7d7:fba1:c767 with SMTP id 46e09a7af769-7db9942cec5mr1568057a34.32.1775013772599;
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
X-Received: by 2002:a05:6830:67f6:b0:7d7:fba1:c767 with SMTP id 46e09a7af769-7db9942cec5mr1568036a34.32.1775013772161;
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:46 -0500
Subject: [PATCH v2 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-4-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4485;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=3orZ/lm59tquC+ygmtUkOAAIap6T40OPZUvH9QyqCTQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HmNUPOTo1sn40W7yxJTFOgbTsxGuXKHYLL
 HlPCOsGwwuJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXQ0BAA37HQ/TFyVD3DFAFGSXaqTd6Qnyo6/U2CUPAW1in
 IaJ1EliXTGyscHOv9csdNj25IhVQXj+5WYdoSiODv/vGHolrhohhBRCAktrL+YbSRrcARYi23u0
 QA7pNWG+D8MbEsgr4S9Kur5rDBrRXvs2mR0sOlMDaJfJHJE1IAmPKIxUWDaeTPQlP9ZU+BOOgfw
 RzsEEmT5NN30Q6zjttYNcKTECXB4TGbPOmWWFH/QwemGq07XEsruqCVtgdWrUmTgXPJR3tBsiOM
 p401WjRSYrmoL1BAJqnkHJuXV2sf+nkSS4x5RMWLaVz4Rwyu7i9kmAG4CJiBKepiC51qXlpCwHF
 hbPZLDLdZsgwgGGhLQ+bV2Th80R9CMpAXwXVoHVZ8c3EIyDq2eMMLQli1evZ86M0jEZyF7qz9XM
 M/6ElRAvH5BLs+eSdvZWMcD6Om70+/duQdd4GiEMpqiHBraincptzab3SAsxM8frwWUgU6kP45+
 uG7ZHCVUvWkTH/DYRdkIAlWCipiIDVGgTFogbUcijlhnzxdpM/kHgVwW673DsSzL61h1KhAiZih
 gv8IvA7waVE/8V0fPiqacKD4J5B4quivq1F9NnUyG2pk1GcZIAuFIZAqjF3BnugCygb7Yd8ZVbe
 97GMa7ZvDY6Q/ELs72ZI56LnLXtdY9deN9Dfvs3gHBXs=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX2eLn1sfSunrS
 F4/O9QaQlnApQ80wvWLem8BMxxU8Wr+Mn0VPFrHDyTfFIXQVKVlaEhwV6NN08YdCSGcMe05vNie
 1Z097n4SvSXifzYhiHqOhAtm3hG/+dx85I9NMjNjo8GlmDKzNkZk1eXmcnPhFH/IOVFQ0comfCR
 iE+oQt4wgYmIibAT/JxwlQ/++XobQFloh7MRrbCSMX8qwSFtDx+k7tfaVzDxJIFNf23uGGgRjq3
 BlcbQQoWfxb13iFpOJtO0bDNXxmUy+/lxFBVA/B4gjQMiJQMmv80KG47AAJT0z1EYLcduDu3uJy
 y7US6D7vIGH+yrCKz/1vY8/lUs2QA+dkKgd1ru3rSkpLfEjIUpqLpGdfDptg494NKoVfGDD6OnS
 IqilX8rFKa3Uy4eHnP8YNqUnCO/Gz54XpL8OSl+PBpIjCTNACnB57DdMRc7U4sTupBfCKJ9TiPt
 oUvWUhzAxbvJMkW66Vw==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cc8f8d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qvPh2VUuy8EyYpbUS7MA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: IRuD5Z_y_A_MOZ3yPomNSZqE2sma7Vnx
X-Proofpoint-GUID: IRuD5Z_y_A_MOZ3yPomNSZqE2sma7Vnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010024

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

Move the enablement of interrupts, and the registration of SSR and PDR
until after the NGD device has been registered.

This could be further refined by moving initialization to the control
driver probe and by removing the platform driver model from the picture.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index fd533d5bceb6d7352e8ac6fdce321d3acc285f1e..814ecb01b575984f0951919bba0b8ef4fc64a6dd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1609,6 +1609,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_slim_ngd_ctrl *ctrl;
+	int irq;
 	int ret;
 	struct pdr_service *pds;
 
@@ -1622,20 +1623,16 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
-	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
-			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
+	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
+			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+			       "slim-ngd", ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
 
-	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
-	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
-	if (IS_ERR(ctrl->notifier))
-		return PTR_ERR(ctrl->notifier);
-
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
 	ctrl->framer.superfreq =
@@ -1657,24 +1654,34 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
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
+	}
+
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier)) {
+		ret = PTR_ERR(ctrl->notifier);
+		goto err_unregister_ngd;
 	}
 
-	return of_qcom_slim_ngd_register(dev, ctrl);
+	enable_irq(irq);
 
+	return 0;
+
+err_unregister_ngd:
+	qcom_slim_ngd_unregister(ctrl);
 err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
-err_unregister_ssr:
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	return ret;
 }

-- 
2.51.0

