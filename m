Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE93C1995
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352704; cv=none; b=IywideP0JGbtQik5onsLgbuuj/J007qIJ1bmjDDbl6497xoxu7aLCyhQM9eBzJSAjt2ow52SVL16HC3Ud40adv8+0xT974ZZ0gVB606CInowlt51N/bliUeOazwUKoI9MppwyQEH0/5nLfysoQ4FDlD9zSrare/eOWL2NNUlUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352704; c=relaxed/simple;
	bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1TxE8aldqehcjOliuRM8S7zMcUbiuMkz7/oJab9rr1bGDrQhKpAkvkEJvzgMBTO1cLwy6fMswkMlrKHGg8zM2mlqkTZxXpgGp2/9uZaDr2rwpHUUdlWdwy25t6MMzDQCvzhyiJ9NrBsjD3GIuFhG8ffSLSjeN/CQeK2e19gjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp3UWx69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhaIf/7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp3UWx69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhaIf/7B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7AuIv119115
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=; b=dp3UWx69oG0Izzqc
	yeVxoq5UdBu7a2A5JsdE3LpwUghGj6zyXyNXxJfVkoK2mT6E0w7BUtcRNvDKJPPM
	TN483t10j4dVSOUPBeYIPB4OEWaWYKpPHDxLi9/U3Cu6Dv5xHACGMEMS/O3C+7pg
	ENnjbDeEoonWTgWTDsEHEF4VPpLACWr8LMfn9DGXinYJqT+0rcYYnGN2vr5rqGlQ
	vKYV2wGiM46rQucyBmu94NmsS80Q4h8NFk6PeJWUG+EEWF+skNymwcjQrsWkEcgG
	47q0scBNIs0YVcoJe9EK27ewNLcZmI2/hO3oXU0N7wi+I5HvNEYxli6o0M5m3zzU
	L3c9Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso130063691cf.1
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352691; x=1779957491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=QhaIf/7BCmQQz4Uhfo9talKHpfQHqcqPhqJ4JA0NhTw4HRLLH2nQ793ACHD3zVinJv
         97aMsLPGzt0yVkWlOqmKl0n71oHCM5fOL1u4U9hIS5OGJfdzvQ8t54XLNChSvazeqpyN
         g6gVZSiAjRJ2ee+30ereMy3ko6JD6jsKyGB7xvy9+LZy/zi09bW1g9Gyk/AiXM6Js2cy
         wpREYsdszFeGYL7t3hSB7VqCYRcDahsMFYAhK3BJMXgYQqjbUYBGiALYAJZSB290opb/
         57OxRuwJOjngby97u4NJH9ct066UGk0FYiozihyOMhZeGcSGIgJ1UHXXnZjLTO0EWh5y
         h/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352691; x=1779957491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=VwF2qGBYHY0SM/pohDa2W5ct7xh7CDd6UywVSMO7oGpKsSt+JFYfBytvJa6a5TTTu5
         hb4FpBC8wmGSOyks9nVFOYDBzNpuefstxrMORj1RmOcf6nX+CzPGDxWcDwdt75MB/AOs
         3kRx74F3Y4E2Vxjibbgysrn0dyAWY8KEJqSyIWC7Gu4TQcle3I1kvlUgJm0cZ8SLoLuv
         1QxsM9g4UCenubiZVBgvvjuAxjxXyToc9OyuPM135EDT4kRLCfXIzzeG4eBqfeA3yWnA
         eh21eHRpw+82yiIzVyQP1BrSdPCGepy6NRwGaX9kGP5CTu4+Y0veoRKW7Ifz/l8ppqLp
         NKpg==
X-Forwarded-Encrypted: i=1; AFNElJ9hgqnpP+S7S3CTLFAsmGIVIGtFtngzDdnCvHEJBqxIHStPkBaU2+c0d7HNDSsksrNeO8oCdNjMxdCRNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2GSNEEPAxgxxBTJPEsMfqcaVLgbNPWG2qEInROOl1ZRjqLh/
	Nz2BX10DW/HP4VG63LkR0qv9teCSVS1eO3fhtioF1MuQ8VvpTLUuxHOskofkqPRoeLv5FBGeNXu
	eIOSrNEMYnshexZAMeRujV56OnDjXx2KSMqXknm2hlfN9oraMD1LUsqke/ejjB7R4BA==
X-Gm-Gg: Acq92OE3lmKIm0EJItA5OIt+2BufZ7KMF+lenQU7PwmutIqu5kl/D8uP/l8dbLC55vQ
	sYKXEnmaervPHsBG6no4792gWZC0nvUeo8gKh+cGlfIYARKKLi/bXv/DiRJAH7Oag49iElBMtu2
	z6sZo+i4xqdHWcBWYkWEOvCrREv8xpU2a7OsIisnwr0czln/5ijcoXzshL6fteGRpBpOFRYmj1j
	/LXiningvxDnkDmbCYeZxr+q+rGhswmasggaeh24fjXu21z+iGwTAeyH3vTN5Mbob1TkSZ1TGr0
	kH72chwUUuKjm2Pu0rL0f1R6Z5F0XSZ+a48rKcnX91yZcohu3kXAkngHPYTuEZcDckF+4/dmQSN
	1VZEHcMVhzExRWYm6KNxhTFfi+QYNsb2fzlrBFHjg0ClLDJ+lq7k=
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id d75a77b69052e-516c55aa333mr23589901cf.50.1779352690334;
        Thu, 21 May 2026 01:38:10 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id d75a77b69052e-516c55aa333mr23588731cf.50.1779352689012;
        Thu, 21 May 2026 01:38:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:44 +0200
Subject: [PATCH 21/23] usb: musb: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-21-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoOxC6iyQxs/Rjohg22JgwSDvEJ4Zjh10SaAJTOCBC7F8EF9
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqDsQuAAoJEAWdLsv/NoTDzugP/i9A
 ryldFb9FSAmLemEO0qiGBJZcIslmI4+zSHLUyf3mJErewenQEkrJ67YaF+/3EQ5MKNyh9GGap4N
 HtGBX+rVKJiaLObdha+gBxpyS6ODT5vek1/ttYbafQUROxyO4O/xUTmjpefynxigMDNr0fgL1I/
 MWZCvQgTDxHHhtsDCDBN1+NUaRZxPWR+JJL1w8kNd4dDzckYCA58SP9ww5I7ra7aru1xMOrrwGl
 gs7ae1gcBWZ8xKrE27WxLDTib5j2LSaEH/HzjVB2moA+g+rRDXavYwEeiK5D8TWPW9yL8zD258S
 zCxRfgNNv1zSpQWkB8N8I+VinrR92PjRSlXon9wPiLEzKpKNC0nINH13V5/sg/3aHqKNLCCgyKI
 b8aSrCdHIpqpUTfORHm9i5ite+y9BjPMj+rIMrXi2RUGIsI994PQUL7w5QFe6P8YPwzHLJh/NGx
 /buuLbTuDArWEIxlY7UzZiJjOApMS4cf4UOi0dqDtt7b2z3XxceszldqYh+NVfxhtU98dhFizvw
 esErqQwHHDTfVZUB0S9c76YGbrNCfYAx2dsfizUx6MiEPZhYlZzigAfT3rvXR37GSjkWEUP9YMG
 2ZTKMdi/8fO5AG36zxqYmmFE69pEP1X1dEk6R0yl6Zg7ycYddoesnbfoQSrg+iX/XgrEqUYYUz6
 XAXwV
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -03zxz1ruuQ2A2LgA2D9Riu2XNimWQ1y
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec473 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-E7rG7sKBpYtUKygALQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX+wKyXEddJLN3
 aRpD28EFeMRhmGeeuIWXfU3AOmhYFu1VLv+4iBjmVUd/4JBuufhLXKkJyiesbCdrhLWg8v2aqIZ
 Ue2mQcWFEp3grF+oEClSgjflMEGOIUjrUHm62sX5hyJ8jJ2gG5h1SCz2cG+c5S3/6jTr0LrM+i2
 QnBfaySdcw65rMF9+TSlyE18mEpvQ/0YpGrhtpU/IIGFxbrH+C7W4Ku8f7TlVyfjrq2oPSLSp4K
 qN4MHGwdklVcEJ9z4+W5xxqVm3/rxcQtRPOyaXxOgxCPd+4j9s5Z0ysID+FAGSAmoKYPL4eEaAH
 c9TRuRyGLLSBfhQwY//AunD8uTNerTUMxKco+0JqIIi7x7IKH39jZvKpd8xZn/owfnLePJiMapg
 99xiNpJTCaZnIMDVxbBq6swk08lq5NpzfvLiIwp2uc4usQ8yRtkl5zy6E7ogQOHBb4aoGAEhjeV
 PCHH+vhRORg9jwuOirA==
X-Proofpoint-GUID: -03zxz1ruuQ2A2LgA2D9Riu2XNimWQ1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

