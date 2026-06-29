Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C8400DF6
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724407; cv=none; b=ZlmX/h80ibi0rcF4jp5JhafdM6DyX6XkGH0xEWz6LCXCXHVDYL5mIPDV/fagOjzqeSwWPbyW7ydmliT9MGO0ULSghvkhfl9+B14E6NJcAdWfrDVFj0Y7d5cyF+W+2fBeL9t03wFEK7Sfl11+1LLtzJcifEwELm+ordFnawoe7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724407; c=relaxed/simple;
	bh=5iHC62z666s2H9eOZNtsPvlVYHni/Q1SrUqHlSvR4Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYUw5jpoowpoO508y7fcVZKawB5qD9YdVAHJ9+W85AMWkzJf1siX3ByzFRYPL89dlJ8ZAZNzZwnlkT8ul+IqpZDmqNtna8wnglK7BE7bdJkbhufLxgLHkPdTt+qeBO+EDR3Sg/H++wOlfwT6M1UOzUBQ1borZehjMeMd7+K9A5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRkU2/i6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR2lm/f+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRkU2/i6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QR2lm/f+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91OuD2400899
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=; b=ZRkU2/i6fztwnJdk
	7IO5FhpTQ9uELV5xMf2kx5yhTQ4SiES76kt6TMus91P7INzavkTPnFtvNcYr9F+y
	hXChLcOUvW6s3m2DDZjW9UWjvy3K+ead5t9C6gutcbXfnTfI7W6oq7FVO2oBcLnr
	5gipdQMoxdrM8rezokLUep+IfzqoHQJQNG30X00ezlWzwZOCNKm0GIG1r6aas3GM
	tSG8pTBpPdKC4xp5euE1xjvwFwb9gx8rHOjds53y575heHceSydkD9S4WKEmji13
	vkYcHHPGXB215VYUTPnnFMxkxMRf6vqfGRZ1NyWvISeRKF3ehf7Ne+UvH9l8D82/
	Aq2mXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq881pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so97954885a.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724404; x=1783329204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=;
        b=QR2lm/f+zcZqb996aU7vjtrQDTArY3NrPCQU4uktVb5W03GR4qMVty7ksL044t+F9p
         JD5BHRhaBj5MCwWQeD0Tqf6S8W5doqRWnA+kZ3XD8UotNQMF3AiNZrTCRXqwCqfqEEbu
         F6J3PBRVXwTzfPy0lMKqqYWkTFAky1jGSmVEO6qjAzll9IMCJKueG7i/qrof3w3sQhqa
         eoZWLVM46RfFndugC+gq6/+L5cCasibsXkRhHDE0q1o/pvMWgjXn7tTPONm/jIbcju+6
         2B0Z1gmqc2nLf9DDPUbjTDk+MpTlucUuSs4JqqBxG896tLca2sglrYvvcdarombFYwSj
         8qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724404; x=1783329204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=;
        b=kkDzFo/tTpBaxUeGDR6TaicsLx57hWtxHX0D4siwy95mWJl1nL31+44LwWsyObrpNr
         r9rfoWlPTw3HQOX4ROCh/zHutQSn8yIZGE8a7RxG41UMLHNdCnT6J4kZkpAhu/YZ3+H9
         +jpokQGAmlYeDKDHhf2C2TH+euVOKDfI+b8IpJDsRu9PdoVUs3lkFpkHRIXDXzY5gZ39
         7VHGnqCNHo8CfockWKm3Gg2qcLF1PZmyeYFVlF7rdIjsVjQhXUrH2Ho7sOYDitGcnf1S
         qkb9+X0wkBpbedM0pMYFu2c2PqqQ1cC0J+HqrOEwdXf7L39ZLQrtHIYVUIja45+qDIqq
         UflQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xpgfNMFRcqeILCQTZHRFm3aiVPinoeSCr0Kl5QFO6+2S1t7+DfCBZ5syyPsM3U9OdS5A6tY4euX6iSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfA7/nzDVglFluhKjRc1ReISSFSZagG1tPU1j7e2m/0F86obZp
	UIa9rTDojF99Y7yWLVbZw4ViUUf9bciBXUNwxv7lJbXFzlTCUEBzWNpnG9qr9dovMw1lKvPxhXK
	3JNV4WsuepNIBstBeI7NjznVvWKEI0SAu6CCQU3IVu79msZQBlbWIdvJINKAW84W+DA==
X-Gm-Gg: AfdE7clLjftEHeWO5Lr8qCmJpCgdOiY4rqlkFZCW4cASAYZMtopxai+MwxV7zdPSWnt
	8P+wEmmw1fuGrAMkl0V5ATd2QgI6wiWt0Ks1iD2HqPQKl4CW5aUbVy3hOigQKsfxt6+Q4Y+0A2Q
	zGcOR5W+NKF2YXWWw3NTkoxilcqn1+Xba5+Vq0jF461bu2/21pn8R+nf9qzm9C12iteXdpXB0uB
	YJRtHHr0USFtOHsaztq5g/WNAZPlyWVNgBBJBen5OEiG+qnckqf9euNPBjHKbC9BruugDX6mDo6
	J3w8wT7BQOP3GFNt7UxLdHBKS+zFflc5mZG8QAnz0l7fgeBPNedV42rxmvLF7prx1BElloqD4v1
	31tEEMi5Yuf0ETTyz/BOY9bJyAYcE+kTIDNkUxOMs
X-Received: by 2002:a05:620a:460e:b0:915:9531:f6cd with SMTP id af79cd13be357-9293a8a7a96mr2397202185a.13.1782724403791;
        Mon, 29 Jun 2026 02:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:915:9531:f6cd with SMTP id af79cd13be357-9293a8a7a96mr2397196785a.13.1782724403205;
        Mon, 29 Jun 2026 02:13:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:31 +0200
Subject: [PATCH v2 08/19] iommu/fsl: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-8-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5iHC62z666s2H9eOZNtsPvlVYHni/Q1SrUqHlSvR4Ww=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcOXpcB2m04XoCsH72/+KXlLVT1Hrj1vwgy/
 IOc5Wf6f7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DgAKCRAFnS7L/zaE
 w43hD/wPlfZOsocHfKTUFsVJhcDF/ETQMNn/4hId9+RMm6T5ZHp69jSRbog5lNfYaqdEh1EET2S
 RDT2B/TdHfj1jeOim/f+DCxKuqp+akBTwoUGXVrN3GvF0ycylarCrN3P99JWiNywZlYYQrFzJmr
 KQnPasd8rXu4GeV0CQlnvJVSdFHEQnE2w91jOXC/OSoOzKyKLqx41JbtE1bQ7WizVboKLTgiMqP
 k1F32lmXmQz8z5OapVRLcm1pihRAim05SSxNWw2kP+6WrJp7yvr5HjtoqWqLAs0E+qHIF/fTusy
 77hz1jMmBNdYDVFcY+6HeGk5fS3LRhNUG55iglR9yJgJFWJLD4ztoxnXNFX2PkOUTi4D8wjerqO
 IvzdipUwAdISu3EM4lXnJV4ppWIHkoBn2hTjtscnm98Tub/1JL3eBhORloIqnIr+ij3hobQwQZA
 zwFmWokXMqXAIZROVuupPTypgGm5NHPS1mj01vVz/fwLKzkEv+25rmetZTox3yUMovtH/ylTNrU
 Us0ZPcuG26Lgh1w5uDYYCe58zBPBbDNehNRiOAwx17NTAOQMM5X5kt+Yk6xDEFU5rV2hlkpXNdG
 QBT4jo8Ybny2dJZvwR4MRhs/vr/nkp5lKNgLQ1QDzI5cFXGvKR8BhAi7jATxQ3PubomQVlgL0oP
 3SR64eGHBbnk/mA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qXW0cNhwAleGJzOGn_GgLKDvqj2ni854
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXxDlJfAgQkUzw
 hm8VwoHVgT/RbGO77fbasC3CdZzbi3yRePgekNbcLnwaDkoXSWqkZ+tisIZx+GIZMQGRBZz0nJ1
 hEr652rq2vzDMRZCTpDnjtTZHFzgNLw=
X-Proofpoint-ORIG-GUID: qXW0cNhwAleGJzOGn_GgLKDvqj2ni854
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a423734 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=3F0hfycR0bi-GMcrnTkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX1b3o28ZGd0YC
 0cs+L/eBrbS4Wd+fTjEIIf72/L2JDkWknqTvgnNVzh4d0tqwAw4nIb6ckJgOspNeoBQiK89ik6+
 h/Iu3u6BWRo/FzYAfZIH4tqkvnjzxa+igRpPdqDIodPFuXWqiZi8Xe4jZgNE+CI3Bk+wNNyDAkB
 WPt9CWD0CwpEQ87DgjZFTr1/9z7qcTRvilsx1otFRPrnD2BCC6S+qRGJzvGY/TLr7FlH+E8i4Hl
 Ak/QDxnt/6MGArOK+0OIotHRhmALCeYiTBWkhSOIsoI3UNWQtz6+aigQBWW9ykqdwyzjN2Ah+OK
 4O77XjLXSVmp3jRAjXbJ4k1r/At1FbGfX53NMl+0Wp1mAW/R6+BtKllQqZ/AoO/ADvamHBnMiMy
 Bqq+213essN8MvAHb1lxbSLHilD6XbbYjhDcWcgbsTIoewNhv1SD48S37WxK9f6inR4veb8qDKu
 oqTFh4o8DjWSJGmNg0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 25aa477a95a95cb4fa4e132727cde0a936750ee2..012839fa0d8a27cafc6a441373f4f6da794388c1 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -973,7 +973,8 @@ static __init int fsl_pamu_init(void)
 		ret = -ENOMEM;
 		goto error_device_alloc;
 	}
-	pdev->dev.of_node = of_node_get(np);
+
+	platform_device_set_of_node(pdev, np);
 
 	ret = pamu_domain_init();
 	if (ret)
@@ -985,12 +986,10 @@ static __init int fsl_pamu_init(void)
 		goto error_device_add;
 	}
 
+	of_node_put(np);
 	return 0;
 
 error_device_add:
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = NULL;
-
 	platform_device_put(pdev);
 
 error_device_alloc:

-- 
2.47.3

