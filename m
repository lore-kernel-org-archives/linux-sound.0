Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D3416104
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342877; cv=none; b=O2RYm2ZUtcBX9MaQA0SorcIE9XJUCQrjxn00MFzCzMBG67dQJpUiS6HpYmUPnPUbKggTcXk2hXsiCHfVL45XVRRpvez00s4GJaqv9a66wJENiRB+nD0NjH5ez1p2th96yyFxWO9ZrGRHkRoOcqJpWwdcDcQO0qzzc8nyIeBsvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342877; c=relaxed/simple;
	bh=ToUoBuUJoS1vI9JQbupGD9AhsrfiD0t/t7tbmkvJ+bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RD0Ul5JYr1Guhy36kYopGMUnLu7mJtcUt/mYQ5xry3BSrPq8MCdQvwU0lwUvmvPq8LWgwGpFuP+hUq92zGafXMWAyZHSm8L8wkRopy16CAx0VjrUZks70C6i6iDXmAs7YqHq0OLzHfzJRtVcW/HGFmsefTyUuTkbXr7Gj7uEPxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjFrAnhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I73Q4QHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjFrAnhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I73Q4QHD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxKxY361446
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 12:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=; b=MjFrAnhnTzb+xV5s
	v+4J6CGSB7Axv+Nr58UzsQpgwafsybZqVyHj6wa6qd80gwGZIVaDIPIu71l1pwAs
	2Mkc5NH/bOSZrO15edr08Y9srJOJX2R1XayYh0b4yygYdSpy7EfuSlqjbaUz9DjA
	HrL8KBUsmxXkhX/v4TIQzIYw0FIR+PZnYBaGVMIIQpSGWE5teYcUbkbrFKyZNhg4
	bU3CEXzfLm2PPlChvI0t7Izu2ovMdgX5HZfe3YF/E3K5Sic6J1EkpbAggWyM8dPx
	ariZaaWueCZsLX2beqMa2/FpzW6FHOJiITC4zMbnd7Tj6PsJlwjElOOZI2OykkVa
	WIQehg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h512ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 12:45:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92da6f3cc81so370133385a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341928; x=1783946728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=;
        b=I73Q4QHD4tMMVbkKi3Ci9ug17mNeUmQz+nYVjLXhWVyMXkKvYg4Us5q3DIBsH6mLuT
         Llsk2heEaUWlv3WPixTscluihBjh0ajhbIUU9EBvmMpvUq80ibELA3p2qwO+FghR4Rra
         EbloWcStSWWo5qClc3o7Zo6ZmzNo3y88ZuOrUyxxDCOFZGJ+0C1L7beuWEHKHLssszfE
         PfUocSvSnkrKJze8ZonK0oG4LnYJg/ZxPAognbfqD4Q1DjabF2QKU/p08iWSS5JepYBI
         41EEAZ1dWYVn3BjJMuemk942O6cmZAEzJtBXtDd/ts0BBrzWpjQrT2iUveQshMlZrh+1
         3mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341928; x=1783946728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=;
        b=gQP6uQ5bGJ/b0KotetmjXUvpkSbyhI2EDdLyXlPvu0eq9XQzzb6tl8czKJ9JMS4eXL
         dJwapy7IMXeIYzktQF9RhMcxyWiIZd4WtjZZ6ggaCu7C0utQHCvvR7Mn9sfBgGJrsXIS
         yEOsYpyk0UZRkGVr5LjY2x8/eWpbxEKCmBY5FVKxFJzsk4GX6XQ55SNbc68tOF62ZEsU
         pnqupM94/hJGVhjMUV6MzW0A/A0AomXCV87HGZpZlhWbPumnL+vZ0QjXX9XWYkMWWluu
         lnQLXyBG3mbdb1nJvlgf3MPaP4H3KpYJvZw26gWf2CYQJ65TkaDbvDEec3rELjqUdIig
         FhvQ==
X-Forwarded-Encrypted: i=1; AHgh+Roe/l6vH7zTYCAJ32FQKW8+rcD8obstlqRv6YFinN8BPhpIJh+0fH9kYnm6RXEhsGjVvkEn/+JwldaIug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtNoRH+yHHTjItUpWYSDRexbGat2/pQX4cFkwmvB2XlQg3fXO
	qm3ckNmnQ0NTpNqyG6WTdJcixoc5FErDlyvl07hV7jzV+9TfmB70Yd8HZn+f0A6fSWZiyfkawiP
	CSu/hVX+E08hhVP5Un9ODZmnQDDZ5j02STvh5jiA1TI52bCGaRRmdkUJxeIZI5AabOg==
X-Gm-Gg: AfdE7cll0CJpRt8d+7J7FIdSlbQYcecpUsbJj3unB3mRSsoZZ1R9KrZn1QjmJs7R6+q
	iVuFGFI39XHIXSNF/o8qbFYKwItKzn+VIEQop9WhmkH5HQmPF2uo6UiSY5S5iyQmHF1msvB/BZO
	KhNILK2DdGHANA7g26w3zgibHwdKNKjQvYcKfxe9h7gWXQkBv3x4IK85ZG/owL/Sf2v4WU0mtgZ
	ZeSQAISWD0kq/ucL+i8L6JB8RokDXjqVs0/S76xpaPPGSRd8b2yzbV65EJLddKBUZL0KRphHxzs
	Cs6DrNyvo8RRIJGcnKNUtn5S+EjQmUC1pYoNywRgbOEbQ6HnhUnNGawKyQTz0GWTTPwWnZDP4L+
	LUkjZcv15aEtoJb1pOCKo/VXA7EGLJcCpgB4tqErL
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr53504385a.16.1783341925207;
        Mon, 06 Jul 2026 05:45:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr53358785a.16.1783341917264;
        Mon, 06 Jul 2026 05:45:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:21 +0200
Subject: [PATCH v3 09/20] iommu/fsl: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-9-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ToUoBuUJoS1vI9JQbupGD9AhsrfiD0t/t7tbmkvJ+bg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M2nbcqYQU2rto0INZYhmejKoOnH4JJ+foOF
 gbtQ5diyWiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNgAKCRAFnS7L/zaE
 wz3eD/9zvS34vmhbvapxOOuDeHkgoWjbwClrYYz28lrOOlhdhx5lHNAE1M677a9LnxVGFTNWSgn
 z/9TlTUdzy917cFnaNTfg70HD8e/p303kaNPl4g8CNn4TxYUEHm9ktX4btw0hsN/hTGOEb9xrJt
 YTxoQgL6mPAoTC0Lw2nQbw1KUtKQD1CFXM5HUF3lWAyZyOo0ZKAUpQ60eF/hC31K9znEizz+t6H
 MDZ3G2qpJhCF52wAoxmhehajnKaeHhV16Ecs/vtwGrv7Yg7zibDx4RVD+ggasuNS3h+wjWclE77
 a8ascuOrwRU45/+MqL4dliFlZ6Ybby3l8MDigKYin/YAH5vuJF1HzvySs9WsRdD6C8Lq4t75DEm
 HXFZJ0fB1GZp0UT7ayM9xHCIglviy66c8S07wtLg6kkkLq2x3VnHMgPUcoT7h8f95M59G3qXUEA
 8ATrnqHYVAYpH0WshNgZ4U5bJMUAVg+VeidCRa+lK85JtBU3wAWCTEqc1gsfTY3+XhDRr5yiHx9
 Q2zV36L8qjBGU/KX0zn+aScN54PuQD+Sw8Fl8IgXOOnNdr4kHuA1+O3XIlVqm+rrQ8GKb7n2k0x
 SL5YGsI5Tya0+tbYEXhNPxmRmzQHjKyZL7455KsB1CiWGQk3FpnaykdRAHJuEVyv9OmujsnRceK
 xP3+XsEnk3J1FyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ua5-oZUBsNF_q0Pvv0vCJ87jKv1TMqea
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXwv9UbWULmQWl
 yhurc+o6b3iU+R9hnvz50HN4G2f53qq5mKLPU1BMjlXyGk8sXvKiUcEcaBdPH2izJO7gDdtCC+x
 ZUJsnUqRS0OB5WOUuGwSBIBR4lTb39g=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4ba368 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=7CQSdrXTAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=31kahzM04Zwkpn2euDMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX91LsWhHBBDN3
 mQbXfo4HN97QiKMV+YGMKZDzFymu3r6ElJQwtvn+wv5rN2kn6of1X3Jk42Wpzifr3jq4IWepXsJ
 OCnxgOQkvX2hwIKyC7UgWGmLzGje/C0PyUg2kwL/9MILdiNltOFDq/DffBXIHSKwEf6TRbFdjK6
 LKA2LTPea9yeLAL3LTACjkLAxFG3Qtx6JFomeqUmsFMC/we+baaf+2+ecjjsg5xpRrISLbWu1cH
 zkrGaelDXOQN+xM0vYmfk4xWlx4ohpmy5bTnTbBy5YEoZg20ECJKfw0GM7+8pD/O9/qICPwcp87
 UrvPMqp8vqv+9+SClvPw9GZ58camlLIWCu/6/qEoZJSig8YCXlS/HMK0sv9W8Fq69SXF/3x+QXO
 PE3wZmoURs7SXJHJ8jduFRFHZpMB/gf/nKB/8xUMdkNwBEP5xPcIXObN52/APRWqYX2kBCYJpy4
 hwZZKy7/XOPZzUvsqcg==
X-Proofpoint-ORIG-GUID: ua5-oZUBsNF_q0Pvv0vCJ87jKv1TMqea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 25aa477a95a95cb4fa4e132727cde0a936750ee2..c83bbc3faad56d6ee1c89b0a7f74028af02c81e9 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -8,6 +8,7 @@
 
 #include "fsl_pamu.h"
 
+#include <linux/cleanup.h>
 #include <linux/fsl/guts.h>
 #include <linux/interrupt.h>
 #include <linux/genalloc.h>
@@ -933,7 +934,6 @@ static struct platform_driver fsl_of_pamu_driver = {
 static __init int fsl_pamu_init(void)
 {
 	struct platform_device *pdev = NULL;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -955,7 +955,8 @@ static __init int fsl_pamu_init(void)
 	 * PAMU node would require significant changes to a lot of code.
 	 */
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,pamu");
+	struct device_node *np __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "fsl,pamu");
 	if (!np) {
 		pr_err("could not find a PAMU node\n");
 		return -ENODEV;
@@ -964,7 +965,7 @@ static __init int fsl_pamu_init(void)
 	ret = platform_driver_register(&fsl_of_pamu_driver);
 	if (ret) {
 		pr_err("could not register driver (err=%i)\n", ret);
-		goto error_driver_register;
+		return ret;
 	}
 
 	pdev = platform_device_alloc("fsl-of-pamu", 0);
@@ -973,7 +974,8 @@ static __init int fsl_pamu_init(void)
 		ret = -ENOMEM;
 		goto error_device_alloc;
 	}
-	pdev->dev.of_node = of_node_get(np);
+
+	platform_device_set_of_node(pdev, np);
 
 	ret = pamu_domain_init();
 	if (ret)
@@ -988,17 +990,11 @@ static __init int fsl_pamu_init(void)
 	return 0;
 
 error_device_add:
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = NULL;
-
 	platform_device_put(pdev);
 
 error_device_alloc:
 	platform_driver_unregister(&fsl_of_pamu_driver);
 
-error_driver_register:
-	of_node_put(np);
-
 	return ret;
 }
 arch_initcall(fsl_pamu_init);

-- 
2.47.3

