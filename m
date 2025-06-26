Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C92ED875;
	Thu, 26 Jun 2025 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961676; cv=none; b=mdJgZoyExyUyokgF/g1hi3mhI3+Vva4KPXRZWPSzdgMRqB6O2LrHTKSu8S9Z3CHa8mtbp1uO2TcxqpZUIxMu/x7ezx0XGXwuxF926yAJ8ihJcpsZtKQMdTIPDX4d5xSyPIIwhQqzx42XB8x0GO3ob6CPnVYFe9UsrekWIwoTJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961676; c=relaxed/simple;
	bh=3voyKilclrJyFpyj0vDLDIuW3RdmQV7SMimX+9MHXPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXk3DTJhYAHUy6pj2ObsQLG30I+WJZNBGwW28AUXTuGcPEluE4ks4nhlwHREGcFBWYV/ROV84E3loIAwUOdxFXk7aUl4DQ7e8gPHofFG5yeZnUO+Q3q9xyl94eVbC+x9JpNtXSTDarP4srFvbtUCUcicagnd8W/BdmC986IZCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SjbDdLhN; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SjbDdLhN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QIEMTl1807739;
	Thu, 26 Jun 2025 13:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750961662;
	bh=4aYqEZqvY1R6ptZgQ9lV04nxsm6ZavtlpgfJ9aUmVPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SjbDdLhNEK9udWDTh6omWCm25LncguH+n7s96ajqeMShbRy2OZQyfZxns3htyBWbX
	 5Po4D8ZWQ2nYC/NfYjSRlQnlHS4mCuuYRHvAiKkL6AjmKDl42bO/5Lny/Lm/630oS+
	 1i1zrv/ZXZSq8L0aOrFmUxb4593VJwAvOX6LUTvI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QIEMVF3842200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 13:14:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 13:14:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 13:14:22 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QIDr6A1713573;
	Thu, 26 Jun 2025 13:14:17 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>,
        <lgirdwood@gmail.com>, <robh@kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <navada@ti.com>, <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v3 4/4] dt-bindings: sound: device support list for pcm6240
Date: Thu, 26 Jun 2025 23:43:33 +0530
Message-ID: <20250626181334.1200-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250626181334.1200-1-niranjan.hy@ti.com>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Removed taa* and tad* device from the support list
as these devices are supported by tac5x1x codec driver

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

---
v3:
- update the subject of the patch file
---
 .../devicetree/bindings/sound/ti,pcm6240.yaml          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
index d89b4255b51c..b0d5f57dc0f5 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
@@ -29,8 +29,6 @@ description: |
     https://www.ti.com/lit/gpn/pcm9211
     https://www.ti.com/lit/gpn/pcmd3140
     https://www.ti.com/lit/gpn/pcmd3180
-    https://www.ti.com/lit/gpn/taa5212
-    https://www.ti.com/lit/gpn/tad5212
 
 properties:
   compatible:
@@ -81,10 +79,6 @@ properties:
       ti,pcmd3180: Eight-channel pulse-density-modulation input to TDM or
       I2S output converter.
 
-      ti,taa5212: Low-power high-performance stereo audio ADC with 118-dB
-      dynamic range.
-
-      ti,tad5212: Low-power stereo audio DAC with 120-dB dynamic range.
     oneOf:
       - items:
           - enum:
@@ -98,8 +92,6 @@ properties:
           - enum:
               - ti,pcmd512x
               - ti,pcm9211
-              - ti,taa5212
-              - ti,tad5212
           - const: ti,adc6120
       - items:
           - enum:
@@ -114,8 +106,6 @@ properties:
               - ti,pcmd3140
               - ti,pcmd3180
               - ti,pcm1690
-              - ti,taa5412
-              - ti,tad5412
           - const: ti,pcm6240
       - enum:
           - ti,adc6120
-- 
2.45.2

