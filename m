Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E023D75AD
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539550; cv=none; b=q7GWJtPI/y14NgIXGx0sU/CAZofu7FMA3R5jNK5pqj719M9vomo2AZBpnrFyPX8VtYkfpj+XQLMYnjR7q1PJOdqwqfREerlA7UJeDQcnxOW16tUwWNvVjiS52G659zPhbGdGDQcx/F6pR6j2ccWs5tVprNgUUvsTFfJqw2FB07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539550; c=relaxed/simple;
	bh=RqOeWSIPxWyUUNyaNQX6aGDUFSUyf76Fp8vD0VV4O5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNgyKpR8EjsmjuJPOyA6790HWwUmjgJ6drmn3oJMxwvrnmOFdvijv0Yez6+CyOCk/ZR0DOI8NHwVfYOexwOXqPmyTEr3KT1cwf5pZtrRzv5kJWdDqWzSF2TdKRjSQeJ/cjoDXROnDxsKXLtjo8pEMkRW2uDTbi1q0WzIumVkWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDhTnvx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKU94T1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDhTnvx2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKU94T1Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K97anj1653578
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=; b=pDhTnvx2RVHQxDXo
	L74bzKL50Y8XvXYW/tZO/n/eD374mT352KgWjZjr6iAb6e0RHwKmI6PwYGiVL2qg
	zYQPQkOe5ejxbXNkih9928+IhyjhzSc/StiLZ9oh+V7q82QV/W3GEgIZAMek855a
	MFf3bd3xH/Jbia99eklhqrvTT2p3JlcPRWGn2i80jyScu/awSJLAMfR2xk2jdwxr
	vWI89MZ9/NSe3jmaj2AuAJ8l70gBWXPwePtNLKeQbsSvYY/3qXwQkG+UMexoXQNl
	2sxUrrvWDLThto329LYAqNROuXnYs5/Bk4kfqWH3txfDr3D1Gv331NWrdBOJiD4w
	BrBImw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs502h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso83941271cf.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539543; x=1785144343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=;
        b=dKU94T1Zq+yTetzImpwX9DdyvmtUKNCD+61398Sn4Nr2/q8jfHgCzHt90E5Ur8FoeX
         Xp2duDs3y7f9PgOWJ6+C0bhUeWQRwsFQ/X7bEeG7AiS6Ok/efVXh8Es4oHZGDdQH4T1d
         mjJaMiQefuwMmO8egcGfRVYD1AWYTacQyYuPPQ8yATlICeudsirtHLV7iWzaMc8jNilR
         vBsuvukaLFc8kgJkGyTG6kshrj3gePx9MokivuYPQP8jG1GtUfcDoVPEnjfxRHDhRJ9z
         YHSMW7nst9WW12cd1qahg7piRuhErSljJ0osBx6vpkbZJ1icJ9zcrhUBlBfToF5pXH77
         K+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539543; x=1785144343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=;
        b=bYe/4F0TtTaGgV3gKU+vVvtYsK1sZYGA1F4v0SMPCsmh3T8FSPXqDFyB9URIqXP7m/
         R9H303oEXG++KPePc6YdDrojE9LLKHIvtjx4ov9yCeAmB4IoSzG2PxLaKz0c/Uz2G3l+
         4hUe8G/BlNgymm9WKWqfCHgpJwffVUoTqr1YhRMq9AgfFQ1vp6Rvt50yr1Fp9Qq+ppyT
         AsRV3p3gZjRGlIQXIs2crPg46SnUaS9/iS3/fNHpH/v7UmriyFpt7PEMpsyqjKDRJroD
         u486kyIRb8RsX92GnJS8NZY0XXXbSkPCqp2xs4sbln07rJ79Y3sPMjhY50ezv+CfgZ8s
         0W+g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4ygyq/DTDE7D1ItjXChSW5KIgnxcnTE+l8Ui4l3mU97TBJ1BRXQHNLIMJqjyf9o1qfgFMpplRQ5rpPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfs7RBpJq5yRP+QdzBiyDsvbRAREgONk90+tEuMpDvA5wfsMl
	rfPDtNyb5XuWbwMY2nh86o1ich9c+2yQh0YVj9tj4JSyz/3DRymnFweRQtNaF5gmFnGpiTEdgKQ
	vxzoUaT8ciJXoryJVRpCp79tM7YVz/bQWewe1cX/7knnG7BTwuSjV8uouxOijnkWLPg==
X-Gm-Gg: AfdE7cl54Z/rzyuyJ9OUQO82hOP3qcbwGzIJMxr4ceVhUxDrVwSiwT/vnsVop6SiOW/
	4og59CF/z17mLJeYbaLZNLVlzxeWOIM/l8ly4lTtATwhjZEAscHTOSnWCeYilr03CLgbbdjwWg3
	2hyhOA/omFuTq2+CflziO3rZ+s/YskCXQXu3+uE8jaEYOD6sn1PAraYhxc5wKb5EbtT+jQjY9cu
	fsXYmIw6VmvjDD9tjd1ucSnatniBPJQC9rJhq3vOewlqsktp09jc3bPbaF+q/sD8YAUkTCWsIgn
	CFLENGETWpTJS/DEfNh1XI+7C7v0yMjh4E0psQ7YgPyTUqbVY9t1+ueWJlX7PzSrFbnC9lE4Is0
	LX0go7NdsoBB/OxLcEZx278du7DDTVw==
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr123372741cf.59.1784539543054;
        Mon, 20 Jul 2026 02:25:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr123372451cf.59.1784539542656;
        Mon, 20 Jul 2026 02:25:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:52 +0200
Subject: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RqOeWSIPxWyUUNyaNQX6aGDUFSUyf76Fp8vD0VV4O5I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel98Yq2nzHQpr7zc+lfp9wUTQhIqA4ulbVtz
 ++G9Q0pmKyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pfQAKCRAFnS7L/zaE
 w817EACiOlcLCBRprjyobSbum4i2BmSVzsdPwYul9dr0OU82QH1C5u8pWbLrvuPsQB634ec3Jfd
 GZqYJlngzIE//uUIpnHd/fmBmZGgAwz/qNkfpmEITHgTZg6wNLiAjJxEkreHpzFaTo1ET2Bvw8i
 5XM5cJ97A/3jhhSnDO32PRFQ7w5NAk+ClsamFytOSAr77WKUfC6ocdJVann+NfsPdU3XTBjQTri
 AXcNA7CIj+llJo1OwaMVdlBTJ76MGAhAYC45kEQGz0qpg4eECtUyY6rc2LS+2cToVao7+l47Q/N
 k1pQ/JjAsRPk5Es4S5jXikd3H9ID0hgAXYV+Ywk0zn3tksl1M3CbG27TGBvRp4yq7xrajuympd1
 XksOBEoVT+Z1ANm0e1sLuXLoFLDMf8miLPLRPXspYL74Ca7tzcEqUuKL4K8pU0LYFGvzufuKltc
 wuWk+hdBIobiw0ZC3/h9X7INj2GAVFOzp9dTL46iWF9O1U0RrZ9NlJnZozrfwixI+GElJFwnuap
 35WtJezSneQjrDCDpBRH/k3iKwb0+6Tw673pzmCpt22LACgFd9gRTdtNMlDYSncH8+e/amevHaV
 CFGCZKeDDNgpp8ixAPR3srPMEHWwcv7Pdr8GwiPFBXrUIkI34fsT1tLgmQ8XDa/MDRM6ztgc1eX
 QaDnELK4pLqXNjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXz05Y8ZjELsG3
 0EM1km6AhicKTjbyXkHUtRdX7epT1e5v+k8UBDOPQlrr/1lwQhzV9X0MrBuPGmWdp5r2t+BRcPc
 MKDtBpeAcEqSDLpkIaEqcRVxfOt++b8=
X-Proofpoint-GUID: 6695ROqhy0TlfXFt-BB5VEvQn7sFviiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXyyTXAuhu3s87
 tLWGvK8wRVOy6Bjl218Ct+ZiTKAu5GGaTgVTUw/89i/QWqORJIvo5jyDnH+rvB4dJOpxIevq3SO
 Zbr1QsU9yA6/DXzoLUC/ME+d2GyT3Q/R0gIfE4zKtDHd6Jn0P3y9YR7A0N84yTZ1yPsHJ/dEI8A
 g3zNB/6aMmMAyJsQUOUg9wA0ElyX7K7AlwilYCOk8g7qsoMjTkhFvgWUfoV6e0Cui/Ublp2aVJ2
 fQZe5j52mkfcSy6Frt3eRK8M8NXFfzTnv12+FORQg47Kl+imw6gkvMtdm3WD1DdlzfDX9Ghm3T5
 zrxCAuIoVtgMrdZEMuQ8qWlbVmP5gFYLj1Ao4o54CAlPqnvUs+7iPNvZFQXhRVSLfGtb6+K9Dgh
 Esd8C5Wc5aEvPt5vSzjqWQBzd/bk7uDUkPW5gGbnlSG+vJ2Tywktf4r//Rv39e3VOBAERqz04Cj
 YhZRvx4PDq1WMYINYEg==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5de998 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RoXXKHpjzh-0z6vojJcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6695ROqhy0TlfXFt-BB5VEvQn7sFviiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec87029420981581e48e 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			platform_device_set_of_node(pd_pdev, np);
+			platform_device_set_fwnode(pd_pdev, of_fwnode_handle(np));
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

