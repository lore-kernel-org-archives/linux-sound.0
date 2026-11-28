Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851902;
	b=jm1EE8wbf2W5R2Bp86ut4j2ey0+J9iacbB9aTELlPyFXg+6Mi2KisefOFDfgln/TDNNT
	 6BoyW+8kiep34Uv9kK2SjDV7t4pk7ZCn0WTGlD1oV18dFpTgslO196xfHkNOLGMQvZRK9
	 DLWPAyDKB0F2wMVm9GenYfSrPqFKsjdE5Sqs3oiIoLxg6UxJriSm/+63YdBPHJqDnvqie
	 fXjjoqhHN/ff/+BsWBn6IJmlYXgbP8tow6IUR4utWVKXpS7kD2+ZFxCuvrtVr9F1iXLS7
	 cV9kp4lxlgxeeJWclVboNNVep/uRd6a1CuF2mvD/xyazsgYwbwX+lfmTDmHYVLKSXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
	b=G65A3+3Ej1sbx8PZoUKZA50KTUk9y7gHIb3Se+0Wp3pXvUSWr0PayajzY78+gl+1sI9L
	 GRTVim4afsl6nQxcancOQYUWwZLcW7b0gYRPeStNMnwbr5wiIa0hYQ729rGz+egW7w0xe
	 jfJ36+3+iP/Qpoy3j6mfbwLARZKhSRJPaDAdBGJL5znybe4Mxmg5YyLemYKYjTzdyAS3P
	 4HLFzifYBSN17Rt+T/cENZvjrPBInhysCHoPhdCNThZQyqFODQF21/ziqBrJs8uMUcmE1
	 s6/U5uHbSuLB1Tx24/SFvWY+E2lgObLnJs0CzdYnahMh1AiWz7WW0jqlqlviKFY4LRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD42606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS4BtI43556862
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XSCbnCPHMeRDuEhGRMEEnn
	sMEwBvB/NgQ+oiTuIUzfA=; b=eldbdYe87ZT5sW2D9rVnaA/lNs6LYmCYelUOqk
	64KchP0loPaabylQZHnG4zYMduUD/IvKJo11KkerxzGeiOi7dmflBJKfzvvhnzkp
	pGjx+baL3/tAmOpVxD4tcrfO3O9X1AoQQNOe/3g+F6AEoG0C8MVkbD0vZL7EQlGQ
	6HjraZ4UqzX6EqV/SznhIMEqzgY4IpYe/F3MyjyZCCtBdP9bjC7j/ZBP7kcJwNfE
	VRpOUyUQNbs6r8cGnY78x3VJukUlC72wQLIkcn9HQLAjpCxIsbtnRmFJQXfFSoW3
	sIlvVMJzVuzfjXOUo+K/jGIl+RJR+gU5yKgd1go4K2eJrhTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7qqegcrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so5586011eec.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795851900; x=1796456700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=kAaKlk4duvZDiQHfGKRR3xbV7nFWcjd9/UBjnWJnrlbdJh8gmLbiS6iihyH9LA0Y93
         C0Vibrri+rL05Jndb7/m2UCu2Dhl9ZkpTAinCxyP/rFSIauBrsumLS9zwfcWGkmtI0xx
         17T2IXdpS9Xm/nueaWNf/sTrV6hIWnHwECjNp1TU//N7muXTrjVfP3JzETQ3tC2QTtrs
         veP6sKXlEoUUu7XN4HmyQWYe2TYBHRx4EBkuExvePjWBVH/o1yQRUUMjmKKu10FK01yo
         Kqaii/EqoREctOXarmWD9d3QsefDndayyOpw5wBHwwEk1IO8YYtmOZyhmV9zSn7fvPRA
         qA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851900; x=1796456700;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=Hj6cTMdqLfuAMmJ+gyJn43iFCcUOiK+agdjoVgD89A3843bdKIjmNjLQpxyHEZwhCD
         PDj4Zvp4mHUoodMldLjupaA+NxqyhK/QYZpnSGq8GnCxvBu8/VmlTuFLImiHf6ngDwN/
         K+VNM3MVqs8IERk+z9KwYKEzPuvQ5eHHgMhYxmQBFZ+nszwkB8Fh781DaEh0Mb4tvayQ
         XzDkTTdDavTZZS1zljfSbDevHjulMT6gmeH5BBWgi0jJ7EOMjRVRx+Z/0Db4sULF+xcw
         pRW8abv7rQaQAM+wC1uzDXmvxAQCBnu25MbgoKatHdZ5TdGdafs/xufT6c1QNqtdpLVB
         r9PA==
X-Forwarded-Encrypted: i=1; AL+hErHRykHDss5VRpFx98rF7QWJ9fk/IShJCUTcCVlJmCtxkhvjvQbkKifLqBmMwLsktVCdXD0R2nmiOy/Vqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+s3fPYKc5mQ6/PMXv9i1AXGjL46hvrwC8CqIrDBjAVsVOedcwf
	f1xIZ7eEWq1D/8rmeymUsBD9RS0Ktg7wzi2JR/Hx2m/Md2YECsUZkjBtzRRX1lKPoSGlfdZSUoE
	4mhRQEDO0ICtWCD79UDpUH87/CZyiV3CqkIOlXHEa0jtokIvW7LBw8hp2oJCYvJ7A3LStaVlwbA
	==
X-Gm-Gg: AZFdTZfGjWYyli4viQB7LDh72kWPgrqKL4qQRj9985wp379fUjq+U137RxmAY9zyG2z
	JDm1oXwgnnTQ/2E3Hn5uLNE6TX1Qd2r3k/glSgVcLgwPbYfZNGAq6rUP4vZLnn+RZn8xh0Bsxc9
	FDZL41v5hLb0UXGNRrH2UDlmBlu8O4+OHI9yFAreTskwoyfxYmeg31G46sOesF0/IUK/klWwMxu
	7qmtktFrlSyV3P739VaKS16pRGc++e6ip/uduJS7Q43cj65mL6vC4r9nxd1cldITbRtig+K59ma
	Fnba8Z8Vs/MNpYLMz6Xq67WZJsoNFcV/XVKUvR3RMObabhXLFJPofGvmO2ZZW8HZGtj6kgLH+nV
	HwTpTE/WpABEXH/MT5hEpvJg0zhMFZ2gDkD2HbOQ+7muBPnYko/C3bGAK4Xo/mss6vONTLQUn3T
	keSzQ=
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521336eec.31.1795851899621;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521308eec.31.1795851899073;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
Received: from hu-gkanala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm65140367eec.1.2026.11.27.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:44:58 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 13:14:39 +0530
Subject: [PATCH] soundwire: qcom: re-arm the controller interrupt after
 gating the clock
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-sdw-qcom-irq-v1-1-d053ac530faa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGaGCmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3eKUct3C5Pxc3cyiQl0jA/PURANT4xQLSwsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAHuTjtnAAAAA=
X-Change-ID: 20261128-sdw-qcom-irq-207ea053d898
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Oleg Keri <okerixx@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Kq40QeVTZ6oW4Uyj6GarC8GRHcspbCXm
X-Authority-Analysis: v=2.4 cv=Uv/2pOwB c=1 sm=1 tr=0 ts=6b0a867c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QX-rXmrizRA3L83J75wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Kq40QeVTZ6oW4Uyj6GarC8GRHcspbCXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX3eX6hdTwL9o0
 lS90DQ99H09+PWPuKMbMSY/O44X8a38kXdbU4jEjdXmH3QuBo9fVO491F2ULjFNcysQlQCxqRIX
 RPsj62wGYoyM3mDWDq8ouXjMLT9Ox35AvOtXxLxOXANLa0ASRSe4cBQLDMz2MZeSZD7Xll7+/WQ
 wz1IowpQV7N/OPJlpBQVS53T4UhaUsVxFIHvWDuJBKT57c2ebsLqMZEPzvKm2RHnbETLbNrlJ+7
 9grsQGNPBDdafv5378mfs+IkIlhKmwiai8jGj7XMEFQzIdauCjqbhYVMV6juXiwbUlFo7TvyS1I
 sWwAD1hIUqZjM1fn9OxMS48lqO8TSppagi3t9CmktrX7gFDW/JR8bmG6vmvhHD3P4m9bCZJkJJe
 B2FffGCvqHnnea8VPYPcFSgSD66A8bebZWawBVDAz/MGQEadz0TzCK7nYbI3eC06IzBsk7tYAF3
 EdDPu8JoE/4ChBh7Ppg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX0Tj8VLd8/wEx
 vSq795Srqcczj0Lf3av9P/HIPH9nEK/bjoHrsV2DKjsF+xYGAVhsjUv3+A+sbOWAgZ+lbBqJmRv
 pObHGgNSqsfVgFdeH7RXt6t756PbIsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280030

Commit 6c067677192f ("soundwire: qcom: disable the interrupt before
gating the clock") correctly stopped the interrupt thread from racing
with clk_disable_unprepare() in swrm_runtime_suspend(), but it also
leaves the controller interrupt masked for the whole duration of clock
stop, which breaks peripheral-initiated wake.

The driver is otherwise set up to service peripheral alerts while the
clock is stopped.  swrm_runtime_suspend() masks only MASTER_CLASH_DET
out of ctrl->intr_mask before writing INTERRUPT_CPU_EN, deliberately
leaving SLAVE_PEND_IRQ enabled, and qcom_swrm_irq_handler() brackets
itself with clk_prepare_enable()/clk_disable_unprepare() so that it can
run while the controller is runtime suspended.  From there
sdw_handle_slave_alerts() takes a pm_runtime reference on the
peripheral, which resumes the controller and restarts the bus clock
before any register is read over the bus.

With the interrupt masked at the interrupt controller for the whole
idle window that chain never starts.  On glymur an SDCA jack insert or
removal while the bus is idle is not reported at all: the alert stays
latched in the codec until something else resumes the bus, such as the
start of playback.  Platforms that do not describe a usable wake
interrupt have nothing to fall back on.

disable_irq() is the synchronous variant, so by the time it returns any
in-flight handler has been flushed.  That is all the race needed: once
the clock is gated, re-arming is safe because the handler enables the
clock itself.  Re-arm at the end of swrm_runtime_suspend() and drop the
now unbalanced enable_irq() from swrm_runtime_resume().

Fixes: 6c067677192f ("soundwire: qcom: disable the interrupt before gating the clock")
Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
The commit this fixes is currently only in linux-next and has not
appeared in a release, so there is no stable backport to do.
---
 drivers/soundwire/qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a4cb62897192..05ef7bb2c5f7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1801,7 +1801,6 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	}
 
 	clk_prepare_enable(ctrl->hclk);
-	enable_irq(ctrl->irq);
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
@@ -1893,6 +1892,8 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
 	usleep_range(300, 305);
 
+	enable_irq(ctrl->irq);
+
 	if (ctrl->wake_irq > 0) {
 		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			enable_irq(ctrl->wake_irq);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261128-sdw-qcom-irq-207ea053d898

Best regards,
--  
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

