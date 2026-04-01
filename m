Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACEA381AE4
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013778; cv=none; b=oyc0DOl1XGHhl6fHlGZNQDkzG9RZdgsRoRwt1QVJmvJE8YGtNzNtM+BSd6A/Rlxm6CbB9smOC84vzyRdOZzQiM/8kmYpet9/IIBONJynu4W4WuSWNQckVVsan4lCPGJ3IqjydvLGjOn88Q+jhLz+j96ZrmQyLjYZqhmAI52HRfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013778; c=relaxed/simple;
	bh=AVfZaoV52Zemlz44iCWPkbWHnMtfye+5gx/LtrB8bIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWs7jXUnX2z29pXm6RIxmP5OG37zPe1O1brhx9LqmmgfmfPPBbYIz2QtIlj3jr0JVWOpa6i72AjD5oK/LAtU+Mb3AH1P108SngorjhNlgH4DphE/p0HBlxjFDhGqfluPg96ueFJfknZ/qZWFIYtp6VsMiShuhRuwpEr5xZU4Rio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFStLK6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i16h6giu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFStLK6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i16h6giu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNX4RA3926859
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUSpTEXIiQ76gomCYL360Rs09wMX852FIY4mdJ31vaA=; b=mFStLK6YZpAkBcxl
	vZAKaCHVDDDUo2KqBnrpZL7h7Qh5p2eaGVu8L9nIH0ydZJCDNfcbAPBPzTjPJ/fI
	wp7CfsKuDbdiTqBQ8XUsx8jgDWospq+IN5IAZzpVSUwLaJROZu42qSsAUnnQWwK6
	p0UhjbezQtagxBUwDzPwgg8Xs2jtX9BAmiIAnwf65ODEIwfipBOtLyx1DvLJvWWS
	iBXGNwkfo1rKCvf4HvpO3ec06G7BX61/qU+3BDDYqG6mSYb68vrDhuee4Rfl41yX
	4m2rM81D6w3lGGKwcKu4ccasDAF7KzJ40s8tLpJvVwB9I8f2x0uHIE2GgOMumHoe
	WRoD9w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b934g2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4d4db1523so11150274a34.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013775; x=1775618575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUSpTEXIiQ76gomCYL360Rs09wMX852FIY4mdJ31vaA=;
        b=i16h6giufxKlSsgvYNJ0vcrgMElenDZVZy2/j0QgU+82aMhI26XBI2//9opnPNinB/
         o90EKVRy3VNeWD2P6YSNwPDy5PiPMG9LdpZxYE/pTZJSnAZgjih4xeMeBLHEMvW0uXYH
         gs31VGeCg9uSCOc3rrkN7peSwqkJOszjDyrJATgsXjZOAB7LH2xebh6epuXkla3nuNVB
         0eGzljD4dtRoijDZX9WCHI3MzIqwiTuYT+y6ktZXl7Gd9QFDlplGJ2GavC224sTLnYj7
         n4s4nGRH11UTFApM526M5j7Xaukx0/psCNvig0cAc23wmNkZ/lBX0zRo0sdXuRog9nJc
         U4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013775; x=1775618575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUSpTEXIiQ76gomCYL360Rs09wMX852FIY4mdJ31vaA=;
        b=XPETVifx1r/ftcKGCydh+ELJLpeXQdhFoOr7RvbwP/9dJ45KadGQPyb9WF/dTMGIEI
         ExN1gEngXnMZ/7GdEPsEyC/pXmemaiWn2gHXQq5GbnP8Zv8RVO4uqbsMEn4WULELu6VJ
         eXEcJh1+yIOd8Qd9l0vIx0/mnLDijJjANLKbDxHR2160IXsM9S1bOLvs/YjolZjTwjy1
         USwvEcdCU5peI6rfyaXy8qJtdaSqkQhnKeby1eUxm9izCaz87V/lnj7RU+zKeUxWO/av
         IWvEOS4O5g7bjQcWwHfUDMulXbBD78TDa+Q6r8FPg7aBUhuwmRZRptRCcbLE/2GK8MWj
         /bHA==
X-Forwarded-Encrypted: i=1; AJvYcCXCmoE3o4zOaVCV9wZWAX/E43VKixQ+wCBkjGz4c0mRWM0aeHsldem2DiVIYBMeDJkT5IgSwRY1zlSSQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/4pYxWqCsM090o2j/L5obkuffg4BkVo8ymG1gsbJOR9YAOLR
	IjcuQiowbSsSmwBCXRajHxbGVAEYE2oZYObbBnCK7NYCMcW1DOtBfxL4cqa7u/7yIuzQhzPQoQS
	SdtXgoR0WyBxBpRG3ex9w3F6auU+DuAHXumDpmscvwCnXHXMz5QfZ989RhTK/8dajpXEeFSvi1A
	==
X-Gm-Gg: ATEYQzw15oh0o5F9hUtPLD2Ga/iFb3azzPjOUV7otqMLLGuZeObLl60H0gdVftdcs2N
	7Z7eO+0tLwhiJcdjvNCcDgEIP2sXWOLFpGXQ4Y7FMHiBTcOYYJcuRKUJhqSHZgEhC3c/gHFMEDx
	s3yoyRqVicJmIZrBKup8Cln8pmYui2BAO4iwKfhR7Te9mq/AKBJlO/dxNayMoZ42djviPzHJrUX
	4vSWJeRG26v2RLvAfm0IZxCSsbmMIe5RssvGIUBEL4NYqnHXSklcamwLeRLYOTKZeFd3ekwzuM7
	l8NZsqWyDwYLevFSlql5F1Q36g1sw/68K9h1ULN/t+FMF7qcqI0+cIlWRY8TNm0NBAe10Yf5VaX
	9a2PTIxfOMc9bEY5Dv8YUFIxlnt08F+bLq8XC949gSMc=
X-Received: by 2002:a05:6830:67ff:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7db992c3b82mr1331210a34.10.1775013774922;
        Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
X-Received: by 2002:a05:6830:67ff:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7db992c3b82mr1331203a34.10.1775013774544;
        Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:49 -0500
Subject: [PATCH v2 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-7-9441e9c8420e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=AVfZaoV52Zemlz44iCWPkbWHnMtfye+5gx/LtrB8bIo=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+H/Bws0KM+n+XbFSKLsYTnO6VswLWPzloPV
 gLvZo49eTSJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVRNw//fmBfRu70pAiuVZ50G5AIWNnCReWKbDWtfEGEZBZ
 QYC0FO449IE/SXGtkHQvt9FhvE8G35oyQEDamRF/SvdBfAEFvwUP0qzFfapue5S/NysSxIfWP3H
 FZnCUJxFJACrQ1fCOG809frFkdIQ99YkbE+cwKq4OjXdQBLMqz7AXkMxxIScUThi0MU5L4d2s/h
 zW8dpauQtGb7BiNuXrxDiIv4NCe3RRrY28NbGBipXSS+yMJFr5bjBWv4zKp47ij1xsSWeqacqHc
 npdPEveCZS+ziEEVcJabBGUrbtdr7v0rLslC7ggjTbu+CQzmxlQd6PtKga5+zQzzFWcoy1NS6tm
 lj5UR7SuC4IDlc7ZSOR1dW55H7BJJ1ViKjzkch5xc6AJOMs02pgRev8a4Zrsacv6Tu1VhQ4Z1HP
 QjCsX4KdOV2FGxblkaWeVv96oWdLZlVoCuv/mCvT/52FV7owru0XOZRax5LUdozIBv5R5px28El
 t1/A998UB5i7TtvhIcH9MTUbVoOeDhywlVtGsYto5zYwuR+mwWAMfV2yXAwnuWwEB9lTuNkmNUw
 EB4l7AQfCDFgv7uPPkVZuo1GLk63eRsC5IFC53SvITmdhEl+vqfDjga47ZrTeuSeZ70qcgM6pfr
 mMqZXrOu5BKN+xB0fZ2fTP+N1TaOw4mmXRm9fxO92qlU=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfXzuarwCMlouBi
 MIT8X/zV/qf4BTHDB9MN6bLglcJ5WpY6tsnDOiUhy7WTLNnXAl79GwQloPlEGCtGyKSwwAPxujc
 oZNorcNz6dlgGxSBimXTBw3McBndQ/QBXSxA0Pzsn3Y1J1M+lSs8d0McqAp8rI5qMpSI4LEfqJz
 olZ3ax551HMnBj6UNIgvMaelqjCKl80t0MyWYzalXScmqI1jJm3C6WVc3txajv0l2B5Q0gt40VV
 RSgS1FKrmn1ZhtVijKwpOs0MRyE2KnofpXYqakt/aqPnS3lh1uxaO46Y6Yb4RlWi2mwkxK/yFks
 /FL0n5ZeX3QxgO3IrIecNw0c9f/vtJ/W1z3n8jNvQw5/9sm0v16gBfjdfgF6qhzcMVJwAM1yqtr
 lxG5NKp7PPZv8BYaANbucz2bAQ1Xt90kbUbCeItC+XBjw8YXEOltNFEG9x2yWv8d7JuMgv/PG+7
 6fhPjyVpZFz81n8I8dA==
X-Proofpoint-ORIG-GUID: HVkHX-tK74a7fZOXnovf_dO-X2Uo1AkN
X-Proofpoint-GUID: HVkHX-tK74a7fZOXnovf_dO-X2Uo1AkN
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc8f90 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YEP7kvCIQ0LacLc3HpEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024

During the SSR/PDR down notification the tx_lock is taken with the
intent to provide synchronization with active DMA transfers.

But during this period qcom_slim_ngd_down() is invoked, which ends up in
slim_report_absent(), which takes the slim_controller lock. In multiple
other codepaths these two locks are taken in the opposite order (i.e.
slim_controller then tx_lock).

The result is a lockdep splat, and a possible deadlock:

  rprocctl/449 is trying to acquire lock:
  ffff00009793e620 (&ctrl->lock){+.+.}-{4:4}, at: slim_report_absent (drivers/slimbus/core.c:322) slimbus

  but task is already holding lock:
  ffff00009793fb50 (&ctrl->tx_lock){+.+.}-{4:4}, at: qcom_slim_ngd_ssr_pdr_notify (drivers/slimbus/qcom-ngd-ctrl.c:1475) slim_qcom_ngd_ctrl

  which lock already depends on the new lock.

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&ctrl->tx_lock);
                                lock(&ctrl->lock);
                                lock(&ctrl->tx_lock);
   lock(&ctrl->lock);

The assumption is that the comment refers to the desire to not call
qcom_slim_ngd_exit_dma() while we have an ongoing DMA TX transaction.
But any such transaction is initiated and completed within a single
qcom_slim_ngd_xfer_msg().

Prior to calling qcom_slim_ngd_exit_dma() the slim_controller is torn
down, all child devices are notified that the slimbus is gone and the
child devices are removed.

Stop taking the tx_lock in qcom_slim_ngd_ssr_pdr_notify() to avoid the
deadlock.

Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index afd2171d3be2c4c19994e9ebedc63dedfba899e0..2ff4374a1e0ce5d3d8f9b074f19fe77daeb79dae 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1471,15 +1471,12 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
 	switch (action) {
 	case QCOM_SSR_BEFORE_SHUTDOWN:
 	case SERVREG_SERVICE_STATE_DOWN:
-		/* Make sure the last dma xfer is finished */
-		mutex_lock(&ctrl->tx_lock);
 		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
 			pm_runtime_get_noresume(ctrl->ctrl.dev);
 			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 			qcom_slim_ngd_down(ctrl);
 			qcom_slim_ngd_exit_dma(ctrl);
 		}
-		mutex_unlock(&ctrl->tx_lock);
 		break;
 	case QCOM_SSR_AFTER_POWERUP:
 	case SERVREG_SERVICE_STATE_UP:

-- 
2.51.0

