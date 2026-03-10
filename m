Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540C3CE4A5
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115763; cv=none; b=pihgIUr2INF18nb0SjqPAPapGmXzKtSEmDjkjq1YcMKYtHuxTNToTuEYaI241yqbV8zEqfwjKlKX3R8qRmp5qMCjrJZIC7s1MLmwvt0IqgPOg52mp0T8FWibRpI08t59gIGpaqi7+AXwmCYUEg/cCCAP4QiKzaK+PjwyG9vJOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115763; c=relaxed/simple;
	bh=zGVaLAxemQaYiwlKZIKzDKYyFQu6oOcs69v7lEwpQxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIX5HrE8reWB9s2capk6SPx7T3Gd765nzUnjSNXI1HFs9Eu///vbACReyaPyhgEhdhsr5q4eL9m9MDWpP440q4QFOAx8TJcX4auvj78NlwaiUDh//HCCSeO8L7TJgnq8fYVrtiGnWTm8rr/Ee04VIUvS21iLN2gRtpHWKjPchgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvNduocD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KL/Yryn1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvNduocD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KL/Yryn1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EGoH246825
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjlsEWsqPCF1j9+yQxHiKqzEkI4BuT/eRnZpqywirEs=; b=GvNduocDtWHuXiLm
	4AK2gsSAKEcrh7h+tbt+gfME2d6DtDpDnVDE3iEVhEqycS1itbGsHMyZH9SUpgTZ
	x9rokacHv4UAUpNHnGDj/YdwwiPzenEO0eBXXWiAipiD9oOdgQItWoDaAFww90u4
	V2a3FAVXZqKNe51ERigavJXSPien1CBqZBtzvsQru/jZ10v2LpSmn/+v4mFrSCBU
	p19eFu9IVOWEv0TdIW9puZeSUvPorOU9NUFcKMxMNnyj70hEW9UXUD54CA5Td1l+
	lx1ihKnepX2gRJbfvFh8NbrEB2ytmfrO1vEBTc+Ee/6Dr+Jx8Jnzwtt1D2jJd95q
	rykE5A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8800q6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:21 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-46700e0b188so14969399b6e.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 21:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115760; x=1773720560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjlsEWsqPCF1j9+yQxHiKqzEkI4BuT/eRnZpqywirEs=;
        b=KL/Yryn1vhE9YHwNjSBADAVf0xks/Bvh/eBfmkr3lz30Cx7btVA4LnIs1VgB/r9tWY
         WjW6Vw0PvIggAL2yL0cxykHdA8U8yNWnEPBntPgg6Agq/jkFFXaoMn0w0hzlyBkZ3Srr
         HBTSZn5rNqz7zaNU31M3pJwpgT/p3OtN6XN+vPUTBY97CN+B09/WjAC518K/CxW1yC96
         S2z4mCR/+7eE8rcLFzbrz+Tq7C4OgjjH4YiYvvqTlPH5TsSYqQRPzD7jgcItOrp1yHyl
         065tY39nOPryJYlUtYki6HUVU1K1HdmevEhd026rI7g0Pb0TpDR9UMnpHGK1KMpIxhIR
         JtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115760; x=1773720560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UjlsEWsqPCF1j9+yQxHiKqzEkI4BuT/eRnZpqywirEs=;
        b=YAbHqwfAzqXKcFhaLr8BWF9aHs8QO11Q8JkhrLc933fYQxqYnRxLK/PHibhUpmAjyw
         zAS6T7tFd1/nqopaWmaVhhRKbEQdY7e2VDh8GslvtUs+dhPfTcR4vgZ/bdyLz1ZcFv4T
         0wGnggHfFvInw7PjJArLoFuD/Pzh2WR6x9Xt6x/07J/qpcOnDZaDm+s71n5vmvp563Ow
         vW3SF9gQ/zsob4eM321FAnEH5HaJmN+USyZGkLvx3HWnW5bFr0B032iKcndiBBZHPoaK
         jeQ85r5mXeUjW4nBnyAYbU4IPIPv9tRS7rtFFBtTXAbV/6LzfgvXrvuAZicsD6f/vrqq
         so8g==
X-Forwarded-Encrypted: i=1; AJvYcCXkHK4+oTGwrVWPVG/oaMIBJjkrD8IMjVeoZ8YM23Cwp/cnpOpNVOKXhAdo0SIEfwU6Eo/VQuhohX/dHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBwjD6ADauZEf8dNBT4E4T+hA2JpxOugCRvUgBjHZ8tg+8ZxA
	t62Vjeq6milDqXH/7U2VQxUjDP7j66/QDbqGhFQHPFkdY2T/og/dyT+owIJNWH9oQUg2i/CCBVh
	Ag8npvne6jLYNHA1n45j5apsxF6QxJFiFmS67EAQ7qOPdIXsHTBUR3cAtXnn5DpyCxQ==
X-Gm-Gg: ATEYQzyyUJvSTI0OgF6YdPp9YMrYmDgVQO/T0kqBgVOgCFoWfaK5I8lYF/BdoUIqvUM
	ZxY/pxoSYPmhSXinguy8vEYss9TKuwSZttFb9HoX5y8nHNeMdMSXPPCokT3IS/ee+ZvI/pW5b54
	vpb9L4m6IBW7cn4oMECeZl0Smr8lStPK1zGPTmp+D8aYN2Ga/WWFsDTcqit17yhh9QM7bWau3C8
	Z42vOghl+ckC6uBQY4ABpegw9otV9VsZiyPvdW4dkF6V5wFMde3+Wnh4//JrWM6MkpJjLCibsQ1
	5CK2r7JYJbJcCdoAUWjCHN0M08Z24IbkHBqSMU2ku9UTgqR0e7DQkHMkTiVdEnR3a1f6Y2PlSgs
	XthsY5/DWHN73Q27UoU5JhLObYASvVyJ9acNonuG6Kkg=
X-Received: by 2002:a05:6808:2443:b0:467:1f90:412d with SMTP id 5614622812f47-4671f906e7bmr786585b6e.11.1773115760144;
        Mon, 09 Mar 2026 21:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:2443:b0:467:1f90:412d with SMTP id 5614622812f47-4671f906e7bmr786566b6e.11.1773115759681;
        Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:06 -0500
Subject: [PATCH 5/7] slimbus: qcom-ngd-ctrl: Initialize controller
 resources in controller
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3519;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=zGVaLAxemQaYiwlKZIKzDKYyFQu6oOcs69v7lEwpQxA=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpLT57UGW6OKOXgPyzrTb0L0MvKgFdYUyKa
 sGIUnV+ErGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXCxQ/9FMzppuWFWHC3LmXCiM+ouPWDPZi/Nf1ugV32/hk
 Vp/j1WSGg5HDjPIx05zBnlz1Dqe/MFHdycKNtuMuRDHClxV2xeI27SkTrKsNE6zVFNAMRFKAcrN
 5vZmyp6mcqdlvv2VpBFD3+k2kyGF3hVaXfZ4Pb1xpdxxOOSiby0dgLWXOJfgVJBLCiX9jCKkt7V
 aZ0367oXrdU/ztqefS89/tzU6IuifVZw25Jli+DXYQ9fYfm7P16kUSCSZ/cD49ja3x6m7nDyL5N
 lfyRpBlibT0enrWEEoD/YhAs+ps2tr5NUhAt9S+1P/H8c98Nmls2Lc9iRMcHpWcmOzsFX1mpXKz
 nFag0hnMrqk9t8XorN7KJ5lAYzlyoDhiPD18wr9oZxxtWauAB8PfMRChYDESlUN6RmIPvLhd+Rr
 4jXBSIUkkw3DIKaqkIotyGctBFsfohPL78w1d33DikWnlgBJHnILNJxGFtdx5rQFEEarq1u5HK0
 huJah9o3dewLbPKgQcmO1Og9tDNE+K4icvLcb2GOb2KYB+Mg5jtDBEit7taB3z7L3W7XwnMNyzQ
 dD7T7jEA6vNci/UddIxy75O6t3RSg7ZrBy+FnioEkVSsxguirX38CzgzRdCxCxCyJxtja3xsC49
 i8cPixAKjpLf/nP9BW71erDCo13pYViw+YksMmol+udk=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX7ARF5vVOrWP3
 jvMMPS0Fndw2m0tnYpX+8LOqM4vQVvexNNOx8Xb1XmQmcYQZFkzRIHmiz1YV8zFDP3krMcsrgqm
 8SdoL5csfW7dQTpuMXbASl7/yEfgIpmqaT6h0ltTy6Xw082a5Z/tu6zmmk7FVnkFzB9HdmZwr0D
 uZUC+Ge4Fu6kSzfoQ1+boZVRhjD8yutPYemG6NQL0gF2Hf2bJ/b835eRqahhSB4gXAdVbkfTuMT
 LsFFyWz+L2pZH7iA2kN2SFhWlHeDW9BGxhdGtOeOkmwFM0m+gvfLCfQmpinUpQIFDp9RjhQaIe9
 +fp+dR3M2G6x9smfyGJ145X6ktwMaD5a/IWNVv2TkmpvRNBZ96IYmwY5KNAs0rKxYlEKZfuesLj
 mtqddIXO24exKblE9PYVWT/qV65RkZTp66wcZLTmKfHC5G5lKgpSLdRaUBHG2Mlf3I0vEQm9HVu
 aai5aoLCOMgrrNsOsvg==
X-Proofpoint-GUID: x0m-Ji163gRPc_XKeLcT4yS3bmeqflDQ
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af9971 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UUHtT1FIUfGxZnwV23YA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: x0m-Ji163gRPc_XKeLcT4yS3bmeqflDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031

The work structs and work queue are controller resources, create and
destroy them in the controller context. Creating them as part of the
child device's probe path seems to be okay now that the controller's
probe has been updated, but if for some reason the child does not probe
successfully a SSR or PDR notification will schedule_work() on an
uninitialized "ngd_up_work".

Move the initialization of these controller resources to the controller
probe function to avoid any issues, and to clarify the ownership.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 76944c515291a62fb9cb192bec5cd5c2caa542f4..d932f7fd6170773890f561e3af444ac2c5730338 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1584,25 +1584,8 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
-		return ret;
-	}
-
-	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
-	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
-	ctrl->mwq = create_singlethread_workqueue("ngd_master");
-	if (!ctrl->mwq) {
-		dev_err(&pdev->dev, "Failed to start master worker\n");
-		ret = -ENOMEM;
-		goto wq_err;
-	}
-
-	return 0;
-wq_err:
-	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-	if (ctrl->mwq)
-		destroy_workqueue(ctrl->mwq);
 
 	return ret;
 }
@@ -1649,9 +1632,18 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi.qmi_comp);
 	init_completion(&ctrl->qmi_up);
 
+	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
+	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
+
+	ctrl->mwq = create_singlethread_workqueue("ngd_master");
+	if (!ctrl->mwq)
+		return dev_err_probe(dev, -ENOMEM, "Failed to start master worker\n");
+
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
-	if (IS_ERR(ctrl->pdr))
-		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+	if (IS_ERR(ctrl->pdr)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+		goto err_destroy_mwq;
+	}
 
 	ret = of_qcom_slim_ngd_register(dev, ctrl);
 	if (ret)
@@ -1685,6 +1677,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	qcom_slim_ngd_unregister(ctrl);
 err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
+err_destroy_mwq:
+	destroy_workqueue(ctrl->mwq);
 
 	return ret;
 }
@@ -1697,6 +1691,8 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	qcom_slim_ngd_unregister(ctrl);
+
+	destroy_workqueue(ctrl->mwq);
 }
 
 static void qcom_slim_ngd_remove(struct platform_device *pdev)
@@ -1707,8 +1703,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-	if (ctrl->mwq)
-		destroy_workqueue(ctrl->mwq);
 
 	kfree(ctrl->ngd);
 	ctrl->ngd = NULL;

-- 
2.51.0

