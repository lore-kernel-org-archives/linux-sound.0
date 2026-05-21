Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41862FFDE1
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354384; cv=none; b=qcxjEzymOg1WyAat71MdSSsfVXRg7KsrJE3BsesKHc7qZBavFSsBWHic5EF1gCS4CJWBofzuu+9wzYVR6WsozHaDaouYkqYgVZd4wtXjp/q9NH5QqHwwFpyDgiGeUahNg3nvVO4OxeXOsP9gTY0yiWmA2ihR9FA9rRBZ+LUVEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354384; c=relaxed/simple;
	bh=rhXX0+hyT0zDUTxSmyLBrqK6ajNjs9sZyKq4hbamtnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhAHpcaNnSHhtKf9fj+oNBzqIxjPIZaTpU66l0ZqrKKWeClX7G7rsh5cWJWbW6xApyXKutPM46g52/c95JxpSn1McQS66JCUbD9jst7U1EtslFvVODrCA+jbGHa0TlFlDu8r9yWjfiwvyCW85VVb/zmpdmyjmqpOK/Mheql8rUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIhnv42c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0PsFW7p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIhnv42c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0PsFW7p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6gIOb1798325
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=; b=pIhnv42cOOFiln8f
	kFw5jgHplGSpeAAJ0Cytn19IGKTikvaWlORb9ffXZ6Vu6Y9WimKHPGfsQlVUvOm3
	r4bvDYEaQ7O74cObcz7CYi4FCYaj1OrTAX3I102sgO8EkTnptUE1trvlPgXB2Wal
	H2i/4ZxWOWoAg17n8cO+twTraCfWmhHQh+oBtnyRiWhM3IdmAkuoLJ0vRZIZr69W
	Lf4XjW/ergPahswxd07+8tfRyYNu3cb0lD2jGfnZBtXLLaNAoj9GIOgXJ4pPo6cs
	8MtRrVZRkF5qCWDZ/y5hUWaZx07ef9B6dQUzvEQcK3vS1xjBbTEf+07U1Yhl6f48
	qpxkOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4231-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:37:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cadacf92so3049471cf.2
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352673; x=1779957473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=;
        b=L0PsFW7p6KhzXdUJhNDlB2B7Mq21/PEzUGlFPrrnWgVqdhIGliFotMzQNAsl0ZqOt/
         BLpkf5S7pLle31SISxw0BAw4NxiWTcy3nigIb2xai2i7AFTJn6p3lXY50dH0EyNf/mtM
         JfbPMHc7AJ9VY5uCTGgsCK+IVkb+H1ExA/ehUhFjJYfCtkwSpdYuBxR1B9XNksN5ricg
         oKcYDVCHG2C+LQqPx4teynqFq4nkrWHtZrH+JaX+XwRCGxE5cdcgqAYJcK9+/Z7Mig1F
         FtGUDfC7SX8+KW5zC8QoudGP+PR+8QHrnk7LQisqTZun4dqgMmYz3yjzRE/c6qYoiYXL
         hfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352673; x=1779957473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=;
        b=cuWim3kjhJUz3o55p+ounbvjCLu+uB6bfIF5FUxHn2VBHM3Zh2hadmhX8oDgrkxtVk
         k67d/qC+ZEj8hRLpntzRP0Mk0dN2prE0H+Go/1LamZ/Z0Qxgj8Hb/4PhFN/9NNh/gssK
         PQxUizUE4E82PRntal6agRtc1asvIsb14eZQuoxARsiRhdo4W64l33FTLNskaGRblFv/
         mbCx55htsng3KcTn7W9q8U1CDHMRKs6g+wZRTw5CPT2FPfxCessIAVI0ogDIyFjZhTDc
         +mqN1iRBHFyI4OGjWIUUJCqBd7UsRmfKYYrvyrL/g0uFWqnNdiwuWlw3Y2XQG55qOUO0
         NB6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9emeMVjFWwvyPRoUfi2lVeB8sQDnAlV/VXDnzjOtrETERv7/PHwkoE7xzUNGOloIhQnerL5jh32vBG9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuyw5Aa0menAdDaKCwyi67vT/OYvF4kxRLw9YW/kTtn1wbKZPc
	97Ix3WDG6iRT0oVf+hqqtlsX7+1uMcJD6ZAd5I41bKTK7iWuQ9opuy3Xn6tOufwJWAT8zwweAfV
	AtqGOFgYPlsP47vRy+kh9Gtxzw1yiEoJxZ4G6D50GZwJhcvIEf0NYCzxHM2/cFpL6qg==
X-Gm-Gg: Acq92OFIVKSHdDgrL4v0422V7sFsuHZDvCnYF1aEGdEmVNIVwE3Q3MU7WFpY+G7zwg+
	wzdJ/tJo0zCo7tSEcPCG65q43kLwkB9U5+p7uBd0Axqb7oQagfc03WQQF0PL5NjVDcebAbfZhd8
	UCPW6f+r994iFRD6Kv2mHc8ol6DCCcMGEtb+RKFl849++wNq/O96vGR9kg/o0scfCOaKCCmYWbi
	BjTl5mon1eajigjYmH4HeIj1aPFkEHCZG63aUH9TnprQDl2zaebmBRHdK0uo108xxxeJlw8PQOb
	xy7gDpXF44ydxRS0qCXxRdZ1CcCA3YSRv48fWQ2a0Hn+sZn9tE7nZb/s3uJVD0VqRzvzHdfpkuM
	Wm0YdDvDrL1y4j2BRvHlKRa9AGWg7FnFtD/iC2oAHLiQNlZX3kLY=
X-Received: by 2002:a05:622a:4cc5:b0:512:e813:7ceb with SMTP id d75a77b69052e-516c55d2560mr24462431cf.46.1779352672410;
        Thu, 21 May 2026 01:37:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:512:e813:7ceb with SMTP id d75a77b69052e-516c55d2560mr24461621cf.46.1779352671784;
        Thu, 21 May 2026 01:37:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:38 +0200
Subject: [PATCH 15/23] mfd: tps6586: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-15-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rhXX0+hyT0zDUTxSmyLBrqK6ajNjs9sZyKq4hbamtnE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQqDmHIVs4kdm5DllgC1wieRn0dTfi40w5+0
 YZj3nANwgiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKgAKCRAFnS7L/zaE
 w81CEACP1pUKe1vdi5szoShgJ7SlWvqPeODf0sDK2lq5ecuRIcOXCXNzZANxrv7nwAPSjjaTXDf
 Ww3svzj8ZcTYKA6TPCVub0Oa5ol6XfGL66UF49JUULJIk5xWhEuKXb/yZNVWElkqXaxDfQYcDxu
 SB3Eox4L5eO7dUyanLTruaUo6Yi5irnV8OexBKV7aFuTkSxuwwYuM/tOHsLq3X/GIomwiJfS6TO
 tEfOkkat1q020En6KN1pwOWL1Q1bpgj+0gYD8ycJOmEeuM8h8xLAq6M14A/c9jqQwNlGUuGn3WT
 8JoCR4r/5354fbl6mLc3BZV3VRO+FQMyQ//h2nMuWisORPsmjDieTsEMSHiB4ewpHGCP/Eo9xK3
 wvD/6hoCy+868y0ZzjuNXghfJvpA2XGMVCZ/NOM5+IqDHYySNcAN3WH24riQ+zmTlh4GEFACNYF
 Usy9BXy2VVrpSbYL8ZrFf6HYadDdgUT+Z6+3AnKzX+hs37Gx48+YYdSJgdIifqc8JU2QKqeUHk6
 cWN8RMlX1URpAS9729ac6Xia16DdH/M5dwauw1mEDiDsx6TadFqnvQqbHwklcUEuewuVBqmstNv
 dHs16McDSCRVSViWlOG4sDYHx8HJ7rXWN6iSalNq6n+mFMdL2s3xB8SS9TRiBXxSAoTA+op5dA4
 PTIIcqPqF9OzQfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXyX6DibTa9wIS
 J4Y974ZnS59auWGByzl6+RwHtodLY2DXPEyIYxrDwmf7w/w3fB/+2XDzeNLY/wtw7shuzyneNx1
 nkUVQI0xZ39lc/TPKlr4qy2d/9yF05P3RsnzfYYBmZUqYAt6Qnhg1ujNKh+HGAx8cg3H7eA4zW7
 ZgCOtWZjZtnwrjJ/booRZc9oZ3lK/LLrnlFyfNgA2KRRR82BQkQ+xdpjjbZ1Ep+VFjCk4QejhYa
 lE/HzQ0lG2BA40EtozspBJ6QCiY/JvC5hq1TFY2Q8Wl9C3Fq6uEtkAUPaaPH/n4bwif20XbYSqP
 81cPrUcrLapAgjuOdNdok+TzAOBtqXETagqLd0wGn+wk/sRDoUzQn8ue5egv26mRrPwI3hn0gYe
 btlUrph+7u0aN09Yq8QFbiFPoSHIIn1GGpXrxD6Rqy7uyWrtVnW3sEVFqL3bmBsagdHM7VC439z
 eTUkdPZ7PbkiUnad7Lw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec461 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ESSmVKC5p6WdXJfq0SwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 36bCuMwFqAcAk4pSDmilUE5hou0YWyGM
X-Proofpoint-ORIG-GUID: 36bCuMwFqAcAk4pSDmilUE5hou0YWyGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603315ba76ce1fc501c908f1cec0d16..3cfd2f02b62f3cc370e0d970ec2643b638fd0fec 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = of_node_get(subdev->of_node);
+		platform_device_set_of_node(pdev, subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

