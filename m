Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CF2C027A;
	Sun,  1 Mar 2026 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328565; cv=none; b=iB/waGBi6/XenWLQ7Fz7pwmJccRlFXDm1JNAfaBsijOuIbd4K/6xxznYlVKvNf1RhNLXjNJvtJnt+J6ilc0yWW9MB1nfkyL5W0eCzhEZ7WfijmDqnkwq8UZNheeJgWqtLhtv8p630y5TYhjs4iQqoX2YGiFEXQCYf+71JQL3znc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328565; c=relaxed/simple;
	bh=m/1fxpkhaQCd0EwW/XKukVJU9AfCekF88fZqrJ6uprQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZrHeMiDMAE2G/oQ16x8gnnNnb86Hlis3jGTwxoqHCDQZva/6Ekqe5l6LokpPeRlPm2OxAlxaYIgzb2t4IJz5nARP9Q0Dzvd/TBsOXLwAmsmK2MNgbRm8Z13+SQUpSZU8YlXvTLN2XQiTrZmxXLEAEeeSUXogMBnzZ2oAKbxAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EonhW3GM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EonhW3GM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8356C2BC87;
	Sun,  1 Mar 2026 01:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328565;
	bh=m/1fxpkhaQCd0EwW/XKukVJU9AfCekF88fZqrJ6uprQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EonhW3GMe1eU3F3pjTyRCxtQ7//+269vO6Lx0xWFcH+549VIZsM183B3LZ9/ttvf3
	 1QneXVJgod3P55twDQDGjf8sqgSG4sfvpa3pQ4bo9ktNEVUIm6zWLmMGOX6jzeABgL
	 soVgbbK7kU8w+jTk7Q0/2LM1jmAUYTm4aZViVrcQ0K/MBrmluK+U5DyKR6kH76jNt2
	 nYIxicXK7uqMo4EfiHHuRKfBC1OFK45M2aqCumtXhhff8UuZlC0Xd65bJx9nW3qzJ1
	 vZYT/39WzPjpiJgE3pxWJSLYCA0lUD6w+wmmxUhvE+YLzMjBGhj1NP/MfyTmrGPT2B
	 BUrNlEhkEtlAA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	shengjiu.wang@nxp.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:29:23 -0500
Message-ID: <20260301012923.1687143-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e570a5ca307f6d7a6acd080fc219db2ce3c0737b Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Thu, 12 Feb 2026 10:18:28 +0800
Subject: [PATCH] ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names

In the original txt format binding document ak4458.txt, the supply names
are 'AVDD-supply', 'DVDD-supply', and they are also used in driver. But in
the commit converting to yaml format, they are changed to 'avdd-supply',
'dvdd-supply'. After search all the dts file, these names 'AVDD-supply',
'DVDD-supply', 'avdd-supply', 'dvdd-supply' are not used in any dts
file. So it is safe to fix this yaml binding document.

Fixes: 009e83b591dd ("ASoC: dt-bindings: ak4458: Convert to dtschema")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260212021829.3244736-3-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/asahi-kasei,ak4458.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 259e97b7a3c0f..3a3313ea0890a 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -21,10 +21,10 @@ properties:
   reg:
     maxItems: 1
 
-  avdd-supply:
+  AVDD-supply:
     description: Analog power supply
 
-  dvdd-supply:
+  DVDD-supply:
     description: Digital power supply
 
   reset-gpios:
-- 
2.51.0




