Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586273C76A0
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352684; cv=none; b=AJjVfgZ4wgOXUNQ4TXQ7v7DlqJhj6gPAyUneDjWMhDwY/6KxqUlbI/8eUfhHdMzWOiuluVgW7FyL15RawauYxqGyq5hYQvnHKGDV4ADdyBkfbyc88LE3P3gwh6OhLalOum14oUuea5hWcvh7VxUvkNfberU9vx3S9RyY3Ajg+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352684; c=relaxed/simple;
	bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iz72WS6/pXdDzoISn+6kxY0dadcya3nmlyAwUoBSl1nhbjdZvbVy5B7y0StA2Vwrg2NqC1CgEZZqgVkh1QnZLmdXEECICa/hyTKX9wOLWffNt+KIvP89yOvCHw3yZr9wnltbOwmookMZTCKZ5V9BX8uJKy5Sqhh9LCS4G3ZhA48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWGFOeBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyqTELfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWGFOeBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyqTELfq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6CDEH2157882
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=; b=SWGFOeBToZLVCsfU
	AclGf01G3MMPajCTFPa2NbUKgtwHkcfo05wNMqK4mTngoJ19FiVJSJIsdmlsLRnF
	UTS5hflujNJKf+GLZUpXTmOIOODszeTUyzkDYH5lRyVCjrv8biyMBvDqKnyA6cUR
	B1MwZVtqtJ6ZQ5C8cKyWqtOFfriRbCIjY8sk/YdMjRplzi0eIV02XDAf9o+Mk7wt
	ypK1ptckarndPVVFRuQSzrpXfrh5JQ33mIO7EOBPTfQ409d6ZU+TxnRun3zbhUrI
	SbkBDVuhVva/nx4/w3KeLBtmaXLN1johEvs4uv4afYTH0Umf4ApQvWJmlzn0q0gL
	Clt9eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42916-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:37:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso30727541cf.2
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352678; x=1779957478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=PyqTELfqkrAJRm9epzE2vKNYjdbsjg1+CfEM/HHQSqD4QkjL1vr0tXM+12a+pg3UuE
         7lT76ds6fIvByMCPd6fi4E9iPgiOmMhFVSUrqPtm2bky/d7cP7xyLfyaUQ6XdPNzZTZY
         SO/wLhJIqJLgW6nn5IOKsauBAte9CYFCDQd/6f6WI6sHQb0F104ax/JH74nSWIKIyVCE
         /JxRdro0RWT3+/mr9Wv4XjQVJ+xmcLEkS2dZ7Ppe2GvdBANFOQ7wkYVqf0Kgn5Mux/4z
         UbVGL7nEbXNV/NfgVmqXpWh5Z0gCUQdjSqhU3Ft328J7BtWEu/CCg1nYL0FIeoZxGv9t
         Hf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352678; x=1779957478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=IRpp2ilkVi+LsZ3CP8Iz6EYlc2CsWf9SNb4oJDNZRnrEaT9LW4sblxOM7HM4RWX89R
         o8hIVSvWPtNprsdYex1CUnZl3CeS5EMRBzPb0DOeBOFM/8IRk7sn9RTcM+Umcx8ameqA
         hF41myU5EqT3Bp/5EMcJlo7fg4lGAUmZG7VnSKHa03V/pvh0fzgiOB1S2DioY/Dc23rU
         dwTm/a1WSjVu2jYI/EgI0GJg8Y5g6K5sifd/vG/sLLsju1E3QLEE5vb/4almcIMyj+4z
         BYugqFyvb/rm6lqGYRmrkI/fKNQ8sJb98Wy98/F81tjfEzF5rXjkCTdm4ZNIA3BeZg5Y
         TEOg==
X-Forwarded-Encrypted: i=1; AFNElJ9fI9zEX6XrXN/1lnpJv8LbKyLsjU1DRh8BbnUi7by1Q9nygW9FEkpTg29SV6vQlbI/rAwkiyBEOrj8LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLejfNUXhHi9MhnTE7LyXXZfBCgf01lgpAEQGd6qbYUvRnogcE
	VcXg8FEsHGTWVv7JHwdcinlA8ruhao99wEZPDAB0Cz2DrU826IjYSV6TONE+i0Qdtw3k7HQOz/T
	3T5gTFUXBIm4Fp2pJubKx3TLyxsv8HOmQoK52InIcXrTSK5Yy0xBOvh53SMj6t7HeiA==
X-Gm-Gg: Acq92OHpoUMoZaXkkecHK/FBa8cKm7UKhnsHnSKcfNMepZxwnXlv9AzTiklJWQuoWXX
	WA0Z6g3CJvycXX21uJ8egC2WZOyzYNQGRUyeL1E8iWc/NAAtwVEs26zqhY/iz9uvL5ABT0aQnZT
	I6yvY83gnes0eyRaALNxJMQBXNnoSvcRIQJS25kVas2Cp8l1w6t4uaaMHlYPeK+8U3Z5qMcXxQ3
	SjHV6tqcSSgZgmnSJhbtABZwm+YUiP9hoIuVtwYJ3zkxDsQyrymJTe8kDcv8MwQGeajYVy71xOE
	54r+SbxcfzeZH1HjoTHml8yVGSyzijmOeNaqCgXQz6N+dK4R80+IOnfuhYdqsPvanz1QZvjk42n
	oD3rhaM6eAZqwmAa+3nFc8dgRov0YEU+9o19RZyVggFp1czsIW8o=
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26297591cf.22.1779352677976;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26296871cf.22.1779352677380;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:40 +0200
Subject: [PATCH 17/23] net: mv643xx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQr7v0D29hL0tmocOaZkm4AyCQrEw14ql7mO
 8tYfriVLeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w366D/4v5c+pUzv6avtkL6q+xKqdBL9umLghKhBQ5kt5mjMgzYly3eyiiCgjeCEwSWWdfTYN6t8
 MDk5oxdf4dZTDqe/p0EFtWy4qVPnsfckF5Mgtv2EfrFY/JmTxCrEMhvKl6MDM4OJriNxylX3tbW
 pqSlkS5Mjcx2c79ZfHLJ4QNgy63fKtrYEP8jXkM/bO+zd0VvWHV6OJgGTp1uNfEKKD7Zv6W9jXs
 I7NhKYZRcZud8P5CCUTX8ofTjAVM6BslN8K1m+1TLzAyAQoFdnTaP33aW6oTG8rsJsFtPqJ3QUy
 wl7xZWHSGDbNFObyxHawwwedXKh8ziJ5AlEss80+ejJ7Cuj4qI5W8oSo8Wwb4/vbNVIzFAn+uyH
 zmH7uZ29ujLcnvmBxqZIGFKjQiaMTKwjmXQIqwL9bFwKLahbDsLpo0+FNGfYHYmkqwz6KIUrLh/
 4dRzbuYGCsoGuw0Oql6O23EQLf/YjisobOJzrHLLyRC6qvueCdjZm4rjiIfBL/l3WA9rNztpXgA
 591GvrhcF2BWHdz40g9Fm376D5h1+nFi/hxT753Yk4qZ5tHoInYYJt67skgbVjixR21R4P3G1VO
 BNHf9MuUxDhXR8xWiil5e2yLVNEpIh/547GqRXAJOq2vGoV9XerYZFXgnsgia4YoruDBFHM9Hcc
 iFPMjG1LS8Y1p9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec466 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=deS-VIKRvcGxR6069T0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: H27-V3RsHg09jhcn__Na1jNSwRp54_3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX1oanWtRr6oDY
 BnBjDcPXSGzd4YQ/bbu4voukMuN7v9QQxaCQVzWjzZn2BFHEdAtxNBF7FjpgICcTUB2Pi1aBCvc
 92dwQ5HudhYKPKHOOd5GOzm9Bvp805fK46TKpzEaZlWAvW0S7reKYeE0gsWHSDbX+nW1QFDQdgU
 b9XgCIGfZ6WhGFCJejlAy3dcxof7hLK8ohjMnbnebOHjAwIJLL7Era4u50NDpNxFqcmfsMpgomj
 3pNqLOUcGR1qzUMfw5yOPbJY2W1JXQNxsDY+CyweVBDczHK7R9tOQuLoolHska/saO9w9LNJjHp
 +SypU7FcGRwphi+Bz87mE73+uTdABrM00nYdozjD/IGOL0cqpNup73cvSsOpE5IqzGAoV1SkIGX
 JRoEnLN5AFUH3fKcVRcAqfoQKkjt2rmmttaEyAyTIbV0k/TR2myTek7rcEeB0YDd56NJ33gw15b
 9dpYNa3sxJIaoqiij/g==
X-Proofpoint-ORIG-GUID: H27-V3RsHg09jhcn__Na1jNSwRp54_3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 1881583be5ce2e972fceb14c2b8348280c49ad1d..9caa1e47c174c9d7a161b7f2e2ee12a829b813d4 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = of_node_get(pnp);
+	platform_device_set_of_node(ppdev, pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

