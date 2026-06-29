Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADEE3FC5A6
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724431; cv=none; b=e8A0BTuVFfAUiLpdZvvGqjCwmEnbpBNbt3yi8hNimu8+emtPJuMOE9iNSjqHzGie7dxSyjWyRzQrtZJ82f9C2/xRCNFq9fVrjhvtIQXN1UxjwmAekVRRX0yLh/wN7S6KwgwkTzYBgx2O8XAMGud3MluDagRRZSReIXYzkcrzy98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724431; c=relaxed/simple;
	bh=Gc7zjQ8K3UGxrQUEA3l/ojyEpHz6CDAO+1N6mZySJcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyJXL+Y0QAAEzFjaWNdxIXqb1jxUrDT6Lt1A+HVAOTzON82cxd+Yy9fV6k1594nMOxqnOlOBfEOJ1cc/jPD8RxV3UIZhcJG9Qqa2EBsBvqKJPq2cMrae7fEOvkJUwxdcwRKEiRlYrPUwgHrAWfoFdwUJ/Tcg98RLVR365tBMtzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILn3fVqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds/k0YYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILn3fVqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds/k0YYN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qwf72076271
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=; b=ILn3fVqPEftBrxbf
	hbNT1B+TKhtWUm4n09Np/mVZdX52QNbGzOkOo+0eCuwdMafnDDhXzksj3f78cul0
	/JY36CRdvCq7DG8+9RI4dY9xyaa0bHXKzOgr+J+EDeDNDbDeGF7ma1rd/EAdl1GD
	OGT7STFj1i6QUYlMe/S3UwMCCFfDRYDPAp9cAOjeTL2/eOng6YUxiYoz3Nj7nZWT
	FPeA7LGVmWsvDV9iwwmLYsN/JCob39gjGui/sLO/5Z7qsiYyIwcjcuDvF1IFzOOH
	DQSH2TmfU1TTjGR7LTzqSp2gGB2K6W+8y1hBWlI7lZl1knIzdIH6EN3AVKScHjPm
	JpOLIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gkrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so142818685a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724429; x=1783329229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=;
        b=ds/k0YYN8AgCsM7D0vJ5y8gt9WUEFE8exx3ABZwbfKJpVpm5cpxvV4rjPeloJaEhvH
         +htAz9LQVNBPjt2Z3R4jq9dZhVUCCQ5M8kqJ3z92PJkiQFZ5jA7pI+xttdYmm3YnovT4
         AW5cVC+Aa3BgIs30AWYiwFFpGXO1QoLF4yVrDnf/7MZYAaxz3mbnP6xWC03nefl1yIz+
         bnCAWwVTJlPFH8CXWKIvEeQn9V8KmvFhmaZ7KuxLdhj6r8sV4jw4cxKVnWHRU29huP4W
         BvKzolmXuE1dVnZAoJSQxfswQWpf7kEIB45AQG5UZB9Wf3T4dsS+g6E55cp+egZnT/v3
         XirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724429; x=1783329229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=;
        b=qbU+g+OFsAsQrorOcyFA47uJUhD48jhPMi7WrYzp2zCbO+bLjl0+xsqwSC/eWzYrI2
         P2LZVCuzjMY/sLWwCfz7D3KwGq0XP5OeAK4k8IimNs4lZu2css2RFcvyks9wYvxaMJh4
         nbWSazcifXSWmR1GOIDRgoV3f+ZCgZ7Mc3TlmfzGHFR8XnPBGQGiZEgVRQeqY68QYoel
         2E1MBTlAx8mrTGBHRR5jrMUlce+qt6iNCi4yda61DJ/g4CFEt+UgL66QE78hZxz5+WET
         LhqxATJv1ECzVWFaAOMSif+N46ZddWotdicJatSGtDXgQ2JeCt11w/aWlSvS26GZ5p1E
         sXag==
X-Forwarded-Encrypted: i=1; AFNElJ/Q1H0rZoXPQSgXQxhF88FP6BHcA4+KefQLRaAWSq4MsDF9MZzujwEN2RB3oVJVzdAxutbkl8nWfGW8sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpI5slNFwuVnXLvNPjzTMyWSTk4hSnb5sonlLNVdCfZoAgWdx
	xRWma7FAHUkltQa1sUKILNby2an5blXYzA47q2HrgQQkZH/elviuUg9j4lDsiOo4jRacVQXspbR
	CfaePP/2KGwk8pOikyNPA8bkYqMwKvZpP8zY+JvsDJlQJ7YpkGKwcTkWIcWg/NuLl7A==
X-Gm-Gg: AfdE7ckfDXs/GVAN49o5Ji1PYoPSpDrmcyj8X6Rkg3CGl+uJi5nFyIchJvRKOr+rPaB
	D/r1SaIJh8imHmUP/NWknkfFQAZR9UBngqpqpo8USdmZR5Z8CCM+e7QJxhJKUSG/eql+cO144Ca
	R3RnMZUmFABIY4b3ejyBXab20vZeSXka5eTdqTkW0OEP1AXFlu11ivpsAaaBtM0v/Zja41I1MpE
	i/k0/GdBGa89EfNSzlYDw5kxgxd+upBbgoJ3+4LZY35LUbKHgrtC0pzHvcw7jvOzytNsO7rrRmG
	+FKjr1Wntdek+sYmV8yWAXiVVoDcgnZgHQ8VlE+vTwI3QuNAWDHB5y0MVCztttPxAcap7NKXAOt
	teG0ivwh2ZlMKRO5fExoskg+1AZddW/bQIBktV3BQ
X-Received: by 2002:a05:620a:4706:b0:92b:e0de:f193 with SMTP id af79cd13be357-92be0def3bemr1192772685a.67.1782724428577;
        Mon, 29 Jun 2026 02:13:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92b:e0de:f193 with SMTP id af79cd13be357-92be0def3bemr1192756185a.67.1782724427424;
        Mon, 29 Jun 2026 02:13:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:39 +0200
Subject: [PATCH v2 16/19] usb: chipidea: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-16-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gc7zjQ8K3UGxrQUEA3l/ojyEpHz6CDAO+1N6mZySJcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcUYFPkmtYlqYBD6pOfruG0HB4agBQdjermW
 D2CaNY48aGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FAAKCRAFnS7L/zaE
 w/FjD/0eAzv7lZsLEu+8uN0Gf3x0hmYmNZU+OfT/4weEInEM7TeSQbiN3pgMmvlj80CdY5Q1REQ
 Ex6iSujlHMMD9tcNl3V1BIGs++Pz9dpmj9n+5Fo6INo9YQJfeP3ZfbkkBda+3M0CX+RGmcKChG8
 npDT3s5jcIu0Be9TRlphsuhpjCXJsDBvuxhc7eqwWardj4eSth/HNLkbKfY+ju7Y4qsoHepyAeA
 p5m2K9399ZE5HTJlwCOfwYlVlQo4sJnEl0Afhqsr7b7DkrqCZrOpi6NGsFj6JDD9aokHMeUDntu
 c/1zSjRLx2hKPgU5Q96bRQysWGped1vtY1grnPhifgdnp/jvqRcbEXVYhxZPj5FACP8Gr1ReNWv
 BpTxLfHoW/M79AyNPhdGX+jVcNrzPaGm5sVhrOGIPEpAo42H+MVA3DDdBup4FrH+i3sUIEPEYps
 GV0P5A9CKpLx5K3dIcWMsBn9ZrBorNi/XqU3JgfGBbpcv9xeJvBGCy38l/PMAS4/9u9zgVTV//y
 yQGP8iFBOxoQxugRDNREkWEdHcUi+LdcjWnXvBgZnXMSiqiK1AwLZjKp8YOnvUwQkbEcuCaAePv
 C4sElo1miGCgWPCtW3XInxjubqn+p2OX/c89FWORM3XSJYRsDCJH3OXSvb1aktZuC3a6q7x0S2z
 I06GT6zphKjJr7A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/6q2Zv/5ngLI
 GMlwgPQsxSG32RuQCBwQiJCckpvmSMzWFAkNMZBBuhNqnYuFkOyAyJ+rGzZI0hEPo2YZsLvPQz6
 I9mgx73aTVgG7xtSh2GqPlKov9PXcwM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2Wu3B3L+HjNf
 E7Ryvf9WHrBsxJhWBYk999lZ/ToKfNQcxyly1cHsvBjcTBtY10Aixt80zRtAPiqwP2hVfW+nFry
 aM9VML19Rghiu+QFiMd1FWnweqG+rkFQa8iGgrV2VdZ08Fj7kndj/Sx7oIWubP3h9cSHB8qTz0C
 vmJ4v4JBQyJ+AgKLiqzk2GkE8lOTqDlO4KZvdtrT/DVM1dqbBS5MOHxtzXkINBuJV9obKeRnal+
 2K2Ve6E9K9/FH4/40acadnBLb12tfM3vQ07GAK/aKxdS5skYmVWnhvOhsfe3SIWk3J7SLm+dN0i
 1voXyq7n96c89LltpwNW2J1S5S9ApQOYx2GR5phfLYjZug1O17AekIhxrHtn6BNL8vKCzVDvxV1
 lt4evQQAOOcgFO0ioUMP9JtEKHssG87IKNq3r/i+w2x2C99ZSVnT7FSI9SKjZsfQaI5qrNjB7Ek
 HNmg20NRg8Z0KlKe/2A==
X-Proofpoint-ORIG-GUID: oAjyZ3sGc-hiYnHbQqOvNR6CV7wGbMVs
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42374d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oAjyZ3sGc-hiYnHbQqOvNR6CV7wGbMVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Peter Chen <peter.chen@kernel.org>
Link: https://lore.kernel.org/r/20211215225646.1997946-1-robh@kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 07563be0013f4d28ed6318a0751670ccef01d0a5..7edc512cc37dc24551efe5fca172777a0a4b0766 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -879,7 +879,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	}
 
 	pdev->dev.parent = dev;
-	device_set_of_node_from_dev(&pdev->dev, dev);
+	platform_device_set_of_node_from_dev(pdev, dev);
 
 	ret = platform_device_add_resources(pdev, res, nres);
 	if (ret)

-- 
2.47.3

