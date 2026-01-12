Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB421D599;
	Mon, 12 Jan 2026 01:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768181284; cv=none; b=oZr05AHNs+DfdqgqIdtsFk8/3fAa7HwkCi7uysHOIncArOMoX57WyGm9sYsTnSv0v2mxi5IX+mx6eRYdPPkqJyNQ7Z0D+6HrB3WhXXO82bZyFvUGEl4jsmRYbvEPDdmFy1wct5fWRb9a4RNN0wF/Xu3DWyxog1CpZASrsLl2wlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768181284; c=relaxed/simple;
	bh=nwGe2W5SWCRSHE29+/Ndbm9rY0Wk+RojngMU9ZeFESk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJzDAwslQ34YFFPV3lPgfDAByVavvNyDuTri9rF0xKI+LYXjXF6wZQYEB/pvHJmFbRts8Q4DBaqwCZiwFxeHzp995xzN/EgpTMTLD9HLmnz6QWe8ptKK+7S6KjrS6hHTpO4M4xOm7rM/x8QkS/GO6q+dBleyVflkAV8yaj/F7vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=cFZaUlzU; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="cFZaUlzU"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1768181273;
	bh=s234wik/F1vk1XVydjYSkGI0/8UknPrEave69DIzBRQ=; l=1257;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cFZaUlzUxPHXjIrfmWWinJMCItPXgKZKt8s6nLFvbGBl00m0wyJH/pfWVMpVN/Y7L
	 qIh6jHh63EHn1rFAyWlGq792AzrES3uLgSCMqZOsddtdhM8u61hSFvQFxxO1nfexq9
	 1LaDK1khvfT3FWfh7x+1tTtYEnAPt6UnLaiI3gHxx/evnTWOyjdTsyQifx4BefEaWb
	 lTgjEcjG4FLMCgWDi9kaO5LhvLK7eTm4a++/0hA24YPDHiqiwQTdxv4ir7QDjO7q2H
	 sU4D27r/rnEcMsGdLFAasEFjC/OVFQilsOrLO0GiZ8PmehEUeZB8QRiKBN120vpb4F
	 i94+bb00HHcXw==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572456:1:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 12 Jan 2026 09:27:39 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 12 Jan
 2026 09:27:39 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 12 Jan 2026 09:27:38 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
	<musk_wang@richtek.com>, <roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
Date: Mon, 12 Jan 2026 09:27:33 +0800
Message-ID: <ab31e3965e9cb50ecdc14d5ea90d70dc26d1d187.1768180827.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1768180827.git.cy_huang@richtek.com>
References: <cover.1768180827.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Add rtq9154 backward compatible support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2
- Fix commit message typo
---
 .../devicetree/bindings/sound/richtek,rtq9128.yaml   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
index d54686a19ab7..a125663988a5 100644
--- a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
+++ b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
@@ -14,13 +14,21 @@ description:
   class-D audio power amplifier and delivering 4x75W into 4OHm at 10%
   THD+N from a 25V supply in automotive applications.
 
+  The RTQ9154 is the family series of RTQ9128. The major change is to modify
+  the package size. Beside this, whole functions are almost all the same.
+
 allOf:
   - $ref: dai-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - richtek,rtq9128
+    oneOf:
+      - enum:
+          - richtek,rtq9128
+      - items:
+          - enum:
+              - richtek,rtq9154
+          - const: richtek,rtq9128
 
   reg:
     maxItems: 1
-- 
2.34.1

