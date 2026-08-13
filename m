Received: from mail-m15599.qiye.163.com (mail-m15599.qiye.163.com [101.71.155.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB62D3BD225;
	Thu, 13 Aug 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624171; cv=none; b=bHOPXDgcii5rraKaIzOnQ4lB0NnENEHbvDVFtqqY+ZUE9AXRopcMGygyMugK16SONDdkqjLWbKjC3fykvw6yyZzYtQ1tJeXimd6n+i0/J1Dufcq73ILdxPyzSUjQn0bHtTOJTkU++nhbvtuEY3O0slkyvHCWK550ZdoJ1zDAAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624171; c=relaxed/simple;
	bh=/H+h37ktJXQFR3ayxqO5EhAjCsQanT1aeEs7IGCODHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DyLpO8fWySb0+l2sXu6FIumyzhkpqvURukQdgaTFFI4e0JWfoty+NOlrgWsBdwOyyjsFNpW/DqaX9O5VCZnkRt5z2ImubhhUHreaptsgY5aNudy+Ec+VXXSYk2TYdSK8obB8OTY53TFth6EZEZMColFKiNyzkkKBvGUI+sCVAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=hmO2hLxo; arc=none smtp.client-ip=101.71.155.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="hmO2hLxo"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49e09c484;
	Thu, 13 Aug 2026 19:53:43 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 13 Aug 2026 19:53:34 +0800
Subject: [PATCH] ASoC: dt-bindings: es8316: Fix supply property constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-b4-es8316-binding-conditional-fix-v1-1-6cd56aa1370c@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIAD2wfWoC/x2NwQqEMAxEf0VyNtDUXVF/RTzYNnUDUqUVWSj++
 4Y9DW/gzVQonIULTE2FzLcUOZICtQ34z5o2RgnKYI3tzUAduhdyGTrq0UkKkjb0h+al3rpjlC8
 a5/xIb4ocLejOmVnr/8e8PM8PqUEbzXMAAAA=
X-Change-ID: 20260813-b4-es8316-binding-conditional-fix-0bbc9151fef2
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622023; l=1569;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=/H+h37ktJXQFR3ayxqO5EhAjCsQanT1aeEs7IGCODHk=;
 b=imYgtZBUslINZE+SejnGIsjy2NA8dFogwaaP9RefhU4EgAhiiiFpdoyCdXixcUO7l434lMjRw
 S5W+f4eCS+fBMieLkT7PBZCX6ltQhza8xCtr91DKiDDP81I9zZ8OY9m
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ffaf8960009d5kunmf4a1915b47dc88
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR1MVh5MTB8ZQkxDSUkeH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hmO2hLxovFAuvK0oW2lCckNLuPFYH3Ry06aqW0xuLnD1UP090s0Wx6uhtf0Sntud+PKxw4B0twe6OyvRN5XpM5tcCl1h6JDHOkF9FPvdkeUllR6MOvHMfMnE2TsbZ2LVFKaxgnQ8KUSj+oFsx+tIhbqvas7e3hVHrveKaq1yS6M=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=/v4oCG7KsiGimIbQ0haXjVkJtc7ra71e9ZPL8hOWsr8=;
	h=date:mime-version:subject:message-id:from;

The DT meta-schema requires a `then` clause when an `if` condition has
an `else` clause. Invert the compatible check and move the supply
property restrictions to `then` so they remain allowed only for ES8316.

Fixes: e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/r/20260812194234.GA693895-robh@kernel.org
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Fix the conditional schema added by commit e9966d450b46. Invert the
compatible check and move the supply restrictions under `then`.
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 276c73bb4790..f4ff23120c5b 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -33,9 +33,10 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            const: everest,es8316
-    else:
+          not:
+            contains:
+              const: everest,es8316
+    then:
       properties:
         avdd-supply: false
         cpvdd-supply: false

---
base-commit: 79a883d53960fb2eaf02f72a37182078b4fc938e
change-id: 20260813-b4-es8316-binding-conditional-fix-0bbc9151fef2

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

