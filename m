Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A743846A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341920; cv=none; b=cY3Qgn83YyOF6iUuZln67nm7JxF9exm4WVn8IrfhU//KMJ0N5cRzHushnPhLqiOipLBzx53nsmqZ3Ln3MSq6lGfhDCftCmTZq8/dpQsJ9Y+85PR04zXLfC9agQThA9mUn8v0bXDvFGedlNuhrQDSdMbkkPsN6e1fcWcRlu/FV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341920; c=relaxed/simple;
	bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrTFcvdnXsJ8XrxNohsp1I0Wf7rTPVyB6sgiF8RE95kpXrs0zYQPULAwXqfv5IhSy2DjvGaJMXNTxK/yoPDz2kZTNcZg4XrsgrV+zzLFuinGTwr2P9UnT6GsTPohHup32C/QKtHKLLuczkI7o30wpv5dXX3f5ZfkWpE5vGi/qJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdv8xzeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlWKq02o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdv8xzeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlWKq02o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxG3j369006
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 12:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=; b=pdv8xzeblN7EO7HG
	FH5xzwmFSqOU2Hgogzz26thWi65+vWdeyuOWD7eOyLyNa29P0b+SaswNqF9kS4FC
	KA1OVnpMYTn/40Nz2pxTYv4trMR0LigFtFqWn5NPzbosdepwcoCO7dLbSdFCU11+
	625Rv+YZ9WtsBt6QnCuBYwmabFKfoYm1Etyt6EIi5GTkcT84WTKLii+0R8U05BkP
	QzADCpTzhPgK8NnvXRccEl/Ux/Y7UZb18sHQKEENYHn17Kvs9gUu8wgAYrYfwdim
	kihEO6nIPf5AxXiTwzdTR5gncp7wXW5IQPREllLfupSbD+sMCFkBnKT21iqYXfA0
	EiG0KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9934m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 12:45:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e56b2b350so610109085a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341907; x=1783946707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=YlWKq02oRJMcz/JJrS76k6GCOgDGk8s0AIo51pAHuyGVptlOPrAfBvzbNXulUIgLlX
         87bMj28Wl5fUahUjbv9Xtn8Wf7xk4yAnbFMkfOCS8twqj34OiA8By6Z+RAiYJa7UpqtJ
         w+lvEumbwV16rV7xRgY5wKMK/nveg4evf/5vbe940C5nDjoD0eQr/ZhdjLu/fF8lJNrL
         ZiPFnp6zXfivbpzDjXEQKkLViw0iE5lSEgOT9MI3XKCEbUycKxNYfVLM70dvlAcpBAu1
         UZqvbIExVbHBr9K7Eiay8XwzXd0FzoAa8V8OyMXTSPHNfEUpy4YC+cd4jgOw22MlrbW7
         HSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341907; x=1783946707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=pvO3HZXyCTR8YQURHjV+gUXXDTQrEk5qFxw5METbDncBDUvUZ3EcoLiK59WWitnKkK
         eFtRQc5RuWBarE9Sbt9+0J1xh0X8ZO29pQeK57gbzS/HwPCSt355NvjAhWKrDd70Hx7v
         7vOjeNIozOWjIwexa4x8Isqa+BFVyIq54hgZD2YMfujpXGDK2MbiJ8owHhirVyhVU3U/
         OJNq/UHg2sYI2rFLYlRIxmChgTI+X3e8i4AZQrVUTxDlCZigIbkoqPVgwPF4LVlgBW4V
         nB4E93TWdNaTYSn9ij3nVKIXfrJEohKSaGC5shHrM2WuE53tDGavxioZ7Trzo/E4SaxT
         uBRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSxDl6yR557+waMNS7ekgsdYPpg1bcUQycjzsxYEjWgcVFjHqsuZhcgc1OttD5UV7CUAsEvMa6Wv47Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHF+HjuSODSiIw8JzOA6a5OOupU8xhy0TwP6eUUbOdyDJTjfWh
	H+5f1vWJU1q8tXYvRX0dUX57JcpnrUgMHBu5gm6sUoD980svk31WHgUIuvMnM8gvX59Z6by1Aor
	WL0WWWrJdY00AHTN69mFpOh/+AJrluIfNdZg68Hno6Rn0lMRuR9Stk3dJKFbuwHlwnQ==
X-Gm-Gg: AfdE7ckxJX5GYLpX/JOzGH6ehqfose4P6ps8cbCgF6XXVtKjkhXkbsNnFgoP3L+/2El
	s/0S0MOHD9uElOH5awypXTgpszpxSaBMqEBGZOf6LM2hnpW0Z6eq3+kNAw34HeBepVkC1b6+9Gu
	bxUoRRcQnZ2Ue71PpiffO/qGVKl8SwYQ3XpUG4k4DBvLAqeD5lOnoI/dsngPUPRPdNQ9du8w/6G
	rgpVE3zDpvHK+IxQB+zpS+/7BYIGs7N6bv/OjBBkLCQNYY9vZB/GI9jO38JJEdTiyG1m0O0BEMm
	6pnSXnoTiEEXeT0JL0TxCTrxVMvRIMW7x1d4NPIuPNMRDvT8UJocFu20ZHZC8JloiBnp/NRsM9e
	LMlzQd1t7TQGu9IdtbQn+nwaEuJo0PyqGDC40LJ/0
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45844585a.55.1783341906054;
        Mon, 06 Jul 2026 05:45:06 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45828885a.55.1783341905233;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:17 +0200
Subject: [PATCH v3 05/20] driver core: update kerneldoc for
 platform_device_alloc()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Ebner <manuelebner@mailbox.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6Mye7m4WIbR8PkDTH2c4X+IwaDKU66SIcDpL
 mQAGRuCAsaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMgAKCRAFnS7L/zaE
 w4ZfEAC41Mo4fJZG469yMU0Of0D0DGwRVaKN4uoZLlhdTRAcVxaepoBujUjtupSZqXiayqNHV5U
 gi5UTfW3wn++NDJyYjf09qZKyCOyEnE/UmdnwGURK5nJ+PshyBSYME0avY5FZHKVYTCIXlPzGqF
 UHC6t7eVnwL46lXo0kHJ7EsWs4t3tAPczpks24WUn0sdkVu3uPWOSTcCd94HIBE4WBs5ytMBh/+
 /FrSJqgIth1+QT2DtNBUdqqbCdI8jabVZp3kRhU2DP/pDsdKfBtljH8QRtloSKXSAddgv+vDvmZ
 5KdXc433Hkh/oTWAw8jbFbKHe67pgQKXGKko6LXTH77itBDpywUUWcIk/qEbCKQgqCku3xTgHZP
 H+H4trXem4YILFtiNbwsiQFtaD9iv124/YqQzguOiNSJYYbneWqaJUXkLzRdiHcklMRySNnUQ1Z
 zzlY+2vbp7eQSY7hvbHjthXmH7V3pryL4Y7yDI+OaiYJcYu8ca/YbMP5Lq2mqASntQtP0qTkBwv
 WlH7HQjT0H2v8cocaoPHpRRmZ6FmkINXxIXvK+awAkiCuscSrZeN9lSC36RmTZANo+qHicYPUm3
 0ymNHLd9ZEW7+c55YFCw8msnV5MMfdIaQF6xsNtguNg6ayHTyrtqvt38bkFvNglpZCmrVFxNFQ6
 Ysws8qDm8bTfJYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Tbxzf6XaSPgCB2ldUY1pbwRmXmNyytTs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXwSbY1jsdarLj
 1WXlxTaBC4U9UyugaRHy2TQHhZiSGTlh1tGZs6nser0rlgZKcYm+okgc2IAhEKI+ahEu2p5b09q
 owAY9gKwZVoKvoOc0+oOGhVGFeFYKjE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXxCSRpGFW8DU/
 yaXgtpLnZaSIB82Xi1bxYqumCgNSIEUqVixhE2tXZnq3Y7/775hFprmJTfE7COQcSMsSMcjgwGA
 vtDdoTQ0WqIvWVN+lAxWt+0LCFuNCOlYCHwzH/zjtbyu5OuOiet/DW/ORioARkGXuhNZNhG4B70
 Vzi1l6N/3ps+u/0mhh8R1FbBjchmjixfUdDEOyXffts8ayZwBL/yy5pvcQATC6snT/KbhuWcUoU
 rHRcdc9vuvo+jyS10d2/PmW3mZANvYVwTbvWdIaFNcENa171oKk8asjkS2DG3Ts8U8wtIftCW+M
 XK1Ii9rHomEadVnjuV1Zwo84mUjt9jxvoPEgxGJDYlOfuhtKtG9KPFlcxiZ6trD9JF7EDWOiSfy
 uQEuIPTD1RGuaOTzjrys1WeXO6kfa46jpHf74x76/I9wdhGTzNyF2LMEkgyoP8vy9tITMdWX2O3
 EG3tPGcmUbI0WNUNzow==
X-Proofpoint-GUID: Tbxzf6XaSPgCB2ldUY1pbwRmXmNyytTs
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba353 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=1vxtNpAeqxpoFZHZEuYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Users of platform_device_alloc() + platform_device_add() must not modify
certain fields of the dynamically created platform device object. Update
the kernel doc to say which fields are affected and which functions to
use.

Suggested-by: Manuel Ebner <manuelebner@mailbox.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..9357942d0c79b032645035879b2bed3d53305b9f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -619,6 +619,13 @@ static void platform_device_release_full(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * The following fields of the dynamically allocated platform device must not
+ * be modified manually: resource, num_resources, dev.platform_data,
+ * dev.of_node and dev.fwnode. Users wishing to do the split platform device
+ * registration with platform_device_alloc() + platform_device_add() are
+ * required to use dedicated helpers for adding resources, platform data or
+ * assigning firmware nodes.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {

-- 
2.47.3

