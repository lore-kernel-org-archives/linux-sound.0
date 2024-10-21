Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A01E0B96;
	Mon, 21 Oct 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518207; cv=none; b=LGlwmCTwcHJykIJYHn31vDvK570qxNI0JuhMFxOVkInmuDOR9aOdSBhL1mpWT+Xpj1IHjqdkYDAm5Tho2B0P328JYNvq/McbqDnHFI7MkjoIsvKxbUz4/H/NyNlUKbYMDngrAeao/I+CTE4PtpS2cD7689TdDT034iCD07lSxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518207; c=relaxed/simple;
	bh=28ZEwNAS2wz8DuwwSFhc4diahqnZwjYWUf4dzSSUEw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=h7CtsFaZ8xZ+aafU9rSp4W4eu90mMVXrn2a7x4uRcXuQteGe6h5p5h+uB50nLS5PgPh6oWANbQwjKUDx+kKUCG1EK+0k3dsz2z10AgJ+aiNxNrpBqWr6m/cVk/bF76LfE9mY5ol/5T8ZRvMMz3EIgeJiqq2U39leilHbk4D6DKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qxpf7no0; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qxpf7no0"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LDS1lk019868;
	Mon, 21 Oct 2024 09:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=NDWic
	yi3U6+Fr7U8T64rcjDoHTLIy2DHOYZyWUxvJ24=; b=qxpf7no0ZoAd8TJi5n1bz
	Pj50K4zcHGa7g07fbDqn6NyQGGtyOBp8WJUZkQCWoRZan1oYRPW+5kKZjuCLrDMh
	JBWEZcrgI1U4HCeeUNZHxmRnGP6mjp9X7oX3D53GW5u4viNMMW29D1+bCYgc4l5L
	dGaMhr/iMNIKT25y/frO6ADdPIhk0U2dyQrl01rN73q9/U0Z7Oq+L6WOb6mSj+T9
	KYsG1lZhSujBeKROCkyF4oTooZfRYwtelJpVqbok++oGLFTI1NeDoPnk+j1I9jQC
	mkCB/xBWXeoadBINKpAvEVIEae/5h3T7aKPCGkIgjG5JwCKn4N/bXSB+dpvkfioh
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42dk5dh6q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:42:47 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 49LDgj5t038537
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:42:45 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Oct
 2024 09:42:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:42:45 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDgU7X017079;
	Mon, 21 Oct 2024 09:42:40 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 21 Oct 2024 15:46:45 +0200
Subject: [PATCH 1/4] ASoC: codecs: adau1373: add some kconfig text
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241021-adau1373-shutdown-v1-1-bec4ff9dfa16@analog.com>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
In-Reply-To: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
To: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518408; l=690;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=28ZEwNAS2wz8DuwwSFhc4diahqnZwjYWUf4dzSSUEw8=;
 b=WWs6spQOo9a4U4sJVsdfc+361jxenLEKpEkx0HPb81NSc4AefMHwSVilMxB8upXM7XR/nYJ2O
 He2Ja5cRfscBWXAD2EWOX+yvC+pCuEjTA82LKER99XdUUxRi4LUz91a
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: KWg7cdvOurh9ytSBjRu9YfJKFE08ibbS
X-Proofpoint-GUID: KWg7cdvOurh9ytSBjRu9YfJKFE08ibbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=528 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210097

Add some text to 'tristate' so that we can actually enable the driver
when using things like menuconfig.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6a6125e94d2dc094b10c6f2fb53dd447e831f23d..72643907cef737ab4504ebac78b2bf7b4a8ead68 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -464,7 +464,7 @@ config SND_SOC_ADAU1372_SPI
 	select REGMAP_SPI
 
 config SND_SOC_ADAU1373
-	tristate
+	tristate "Analog Devices ADAU1373 CODEC"
 	depends on I2C
 	select SND_SOC_ADAU_UTILS
 

-- 
2.47.0

