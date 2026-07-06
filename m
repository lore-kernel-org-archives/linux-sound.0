Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32394DBD9B
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341957; cv=none; b=GK70+GH5JMhbE9ZwpAOuiSEhkkRWxkp0uDCzkK9wRFrNzJBMf5F+gYAN9EFUEkFNMKwOe3orwKtyVR4FhDxhV18T6+ZG48welo9BZbcXVxYcIQpsghUfd7aK1tKyRXntrp4V4c/SnU1Lm/XcLmRhJLOZ42eXsNCOXJFq5DMxuss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341957; c=relaxed/simple;
	bh=dJOOLkzsh6Wqn9Xl+Q2MUEX+fF/xdnyRuGBTZrS3poA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdNt6mgl4lz9sGvmA3N1dkP/utp4B520eURnI4/j++LM1vkstyNWO2yasZp1dscQboua04zZHePTYnIQsOozTWuZttXb2uZC5BYs5TT7x9ffX9PNzCwxm70uFSNlV0UUxoZew54V0Lc0Jy+TS8NnfEYIHv2X6bdqYPc4TjrIz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJh35zU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9iSHKZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJh35zU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9iSHKZY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxO55367236
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 12:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=; b=gJh35zU1SYc059Mf
	kDmzOcoi8OfW6ne7PvGIDiA0fUt9s1YZpBnz5nVNLGXFepzjq+wO6cJlTtHczuDD
	ZGqYtYQUPKB+pVGNdLRTXkKNfZAAbm4v0ug8pX8PFkIaNGBY01+7NSHsN/u2HN5Y
	tbm72Yl/fWB/aTmvseGlpzcobggBnxVRm4q0Gog3CtksosQwpxEDcARFFDPfPkpg
	ChwullFaVKNGGJR6F92cq9S6BLPebAuiOUtq4Iz38rx+/oWMW8Ott0xZJiW+0YVd
	2dbOKMC0L9HHcKIfxWOq/UqBsRV7quCnrptznzywqiW0Xb9yNcRzTdtOklJNiczb
	qZigqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urwj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 12:45:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so334700085a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341939; x=1783946739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=;
        b=B9iSHKZY7vu4Pg7UoCtXPL+sUrDmy2Bav/lrLUTUA7JuMAV/y+UmqNWy4Rf5PkNaee
         wW68n4oyTeZ2czcLgVvQzFDB2OYlfevIO2CzvxKqQ0yVhp0D08/0rLycdVx9iLJqXLoV
         hsJrPvu7UdxH1XF8+ungmmdZQpWcp7lQKqubIx+2Rzw2tZSvWmXhlM2zBYFn+1Z8l/tT
         v/aj9Y80EoH57VbxPYTynA1//4SfAXetPJeUBCO78pnv6LQ0RhmSdDyCVN6x3DawnhhG
         eSrN0R/UvnMc030O7YcfS0KEI8/U/0h7GGS1gO9tvsSnYGES0eQGe0axeJQn3n6aaCOV
         rBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341939; x=1783946739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=;
        b=InxaZz0y1QzJfzqjipAhEUSyKjMBN8qHUWTnyGb2WS5Bw54X/Mkh59mvzS9+Fp3l4W
         aEYt7NWhd1GA/TK8dCyp1sfnSV76Dt4ArCXpCqW82W1Gi8/7sdumkSpL+FUcsSFaD4C+
         vwIxK970rhpeWhYV9iP92irp69GqFfROX8heExZOyxNeMht3EnfKtoXuXtHqeVi6QcaI
         /hd0l7NQzPg/sOgbXJVXYtPmWiWuuHbOofPjUlorvnGxcnZJAIGNqBhPqOxSq7lz1lcB
         Ki4JuFqyZokP8zSY0/IACXXQYGCKr1Zl0URduH0X86bEWUqETCBh74RBZiym2Ad2C4Jc
         ksqA==
X-Forwarded-Encrypted: i=1; AHgh+Rq81B9Ji4XE47tltLUIrRSiaSStXCrbPAzvBUbsJ3h5UUOIpSOJRnaOi7jUKXFsHPhI2UMGpAtVLXdWDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1uhfryBj07yXB/HZ9jtjegdcEUTCk5CDRLUyf5Hjj4tr2ykt6
	ItxdCuA+z6awTGY8xy9A/8DIwrax4KbgVqssCB/7Bl7uYOnYimNhwwk2YjzJMC9/cHUWxOP8cI2
	2DIN6WgvxOKAckCNBlKkeg6LlPjT/spjDLc8ObwjDZAolxiqSziW7YNlITp+4GMeiDg==
X-Gm-Gg: AfdE7cmIiomnnIgscY2lzQBuI7eRSoLBFErXJqtzwWdlvpYUGviQM2FMRpZlFYRE18V
	dB+cgi3JIfwyUOQRPMj1MNv6aozjmDekm3re9CaoIKi+/CpnUhHjKi4p5QoNZoXEyhYokELTIwr
	EX6SFXu6gA8HXn+dee0OJm9DqyCw8smXypc5/FILFYdm9JrOhCe+yUISlJ1IAZv1umblnzzTKcn
	uDK/9ykLAxM+P8WgpjPI94l+CUy6keyTvTfAxYdzUCqM3+48pQLlOdYVYu8UeFRZFon7422FfQ+
	siYp5B5g4ZoLY8sRXa8I6lEWfCqIK8/VUbynkDCQ/inGmN3KTaB7jCazn8S2hPuZTL+vt8gg0Ms
	Icbb3pOv4jvnjTd5Hf9m761LjU3XeWMA2sMlzfVC7
X-Received: by 2002:a05:620a:1a20:b0:92e:4b7b:b509 with SMTP id af79cd13be357-92ebb71dd15mr45121185a.70.1783341938896;
        Mon, 06 Jul 2026 05:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:92e:4b7b:b509 with SMTP id af79cd13be357-92ebb71dd15mr45109985a.70.1783341938396;
        Mon, 06 Jul 2026 05:45:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:28 +0200
Subject: [PATCH v3 16/20] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260706-pdev-fwnode-ref-v3-16-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dJOOLkzsh6Wqn9Xl+Q2MUEX+fF/xdnyRuGBTZrS3poA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M7vyboAnx1GXm4N71aps9kZIgDjWS536X7B
 R0DvjC/PLmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOwAKCRAFnS7L/zaE
 wxGND/97BgjATyNhjWpgHVy2n/eBlvyk9m1ACiooUS3Aa21bdFHgaiofDxBxF2cMiA2c0EhNy/t
 yCcK3JPuDx80ppfSjGwmjnCJdeW76uOUgrIR9fEkRhfl5uXDdZ1UuNvgSgWqWLPpP7FiX6sQISU
 ekCOzOUytlF/cDiDZmOMYv1swMV7subHOQoxVfhIDmwL/RnlsR3WOql3VY6yXb48yLv1lXH+B1J
 yrWVkN8KdzQRCrBmBxI6FV2+Slzy1n9it28F0VGGE9eLn7HC+steWu0qWnNh3Df6XBggoSSSgD4
 EV4WaMWdLM/lWmxcqjsEOYh7A1HPAhrpPOfeelnV7dj7Q7t3fD3dF5G9ToZyjI1W/NybHHU2lum
 LT58xttRQ4UNCfwia5kKUaz6cTYDVIucBYOQyaiGnyC6BMlWkY4JjkrMp2YuEdsSxfG0+btmhsX
 lpyOd277A8TCDmgWDOzZ/8tOKvnV2sKttsOGgUMIWaihJYfQ/aS2xnC1dEAChFukUZlIWWWm3Qp
 JHwEuPx13B2be7HKRm6PQil7pRAJHYi9tAmAp/de98huRMq7OQpOJeR3s6aJtjpd+yrRyoD71Q9
 7X8ByYmBR/0kT9aixxj5YiEcTcNcX1dbwkXRGocTR+zDiXrImgKkI99Z5SjhG1gaRZAbVFTqEAX
 XDRBrIltqvBZ+0w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gfviPkKkvGNRKC6TwkNYFhopX5ZQhuMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/jW+NzJoGwB1
 fBZGKNh1CdVA3ba4vOr1l1qUCRdkf0kjgvM3eAkFpkQy8kY19rjfRJaF5ClgZz4VooVxI0VzAH7
 r17+Q2QB9v5VjMNHKwOPtbFNEcyAOHg=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba374 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PjYnKYjuuXkzxcC25kYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX1qqJ074bcbxp
 ltNZgc/j6QnGbJkzbSfVnkOZtCtTLCkDlqkqStPjzzW3LvlsDojdFDBkawl1NOGIefne+vBKYqg
 SSqeKes7lFO2kUZ55PHGeaRacHSlFJ6SIyjYsRGGE9lDEUfqPXAqcPl7OVvjTu2Oblg2rb6rWBW
 zK4DBorbtpCc4c4hCxPueDnx/SM6eAuD9JHAYRLhUBOGRoRBlkPZ/LRHrMWTe3CYmEv9i+EMYWd
 3Cob8oFV/dVSnYHHwBXDaWvDbSIm8SvWzEuwIaY2jMyl28Qhv5nw/enUmxGDTLwEKLoEiEP/1BH
 WlV2kJNgILp2IU1oZt7CXWrGhv97VspremaTIuc4SiRsBT6SRbVOddoKhZBQ1i5pePByTjNNsHm
 MbUSBICGFaVg347WjfJ35BEPRJDqPq6+z0BuV/aFU6OuFnAUGdVcOi3wTrnEZgMokxFRVo7mq2n
 YZ4aNb9KPbsHQJMV04A==
X-Proofpoint-ORIG-GUID: gfviPkKkvGNRKC6TwkNYFhopX5ZQhuMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

