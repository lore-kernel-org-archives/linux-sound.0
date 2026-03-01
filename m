Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA362D838A;
	Sun,  1 Mar 2026 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329168; cv=none; b=MbmrTt4/v09R4wsJv/tX/zY4+wWIymRycxAjPeR8F4POXLwB2+51bmy4GL3zhTX5XfI52LNamgIesLG/4e8dddT2Ctm2PuKr8Ac4NYA8xJFTQfZdAiW5oxvsdQYrMoMlcIUUMkFc5K/EJ/3Px/nSkUDf/7U/GikhrSrrBu8OoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329168; c=relaxed/simple;
	bh=gdcyUrN+ICOriwujZVrmtZcPmJjpRmveLri9zQ/JwLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AN91ENgZJU21KWgYLCR6vs4QoH7Od0X369HFvdses+5QPFBGwB5pVRW7EhcB1BCdH2937o+o8QTkAvnyULo7S0c+zbuuyHTt+vtFeZ9+hhWnoqKhEBbI8MBBPRuFtVF6bx6xhjD+2SNzZEqst33e2r4JtiWxTpElhaGFTo5Szro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=en5n2Xqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="en5n2Xqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C189BC19421;
	Sun,  1 Mar 2026 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329168;
	bh=gdcyUrN+ICOriwujZVrmtZcPmJjpRmveLri9zQ/JwLA=;
	h=From:To:Cc:Subject:Date:From;
	b=en5n2Xqm7Yrp294bboYX4Mf9X+f1N5qf+tZVEng6/UosknpozLTCGTJHKvRTMYzQD
	 QtVwjdNsDao2otHOvmL9wYSqJehZZAP4iQvQVUkjtfSagFwnoih7nTf3qYBjLVkoa0
	 aOQ34MkUCTjwyY8bG8jiQi29/V0wf/WI0UyjcWd+PXQwcOH8qhn0RpxgzBbhQcOtnK
	 CIxIPX5toeZBZTBmw8mfJXDl7aTlbZ+iOPcSYpF06NuqgDBLKNc0tId9Fp6XF4583z
	 cw3MSIroMpOT+NQVHlEJYs/nhSEAcKYccwzNEb8R3MznNq403eDympgVHotyMla1fy
	 YptpL2WWV072g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	shengjiu.wang@nxp.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:39:26 -0500
Message-ID: <20260301013926.1700439-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
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




