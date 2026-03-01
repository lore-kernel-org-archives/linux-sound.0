Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811A2DF12A;
	Sun,  1 Mar 2026 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329171; cv=none; b=GbIf9jfrlaIiSn91DWQ5mTXqKv+ZdkDi1vZddv2148FkGjKvehiYcg9iotJ8f0PKpTG57bqc4tbGZkzSUJe1RxGs0hrR0mo40/CpAJ0Hx1PAnH1e3x4hEZ0IDgKvVtwoLsKDUNAe5nGTEAV9emBpWqOZ/XSb8Q79qforZNlayx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329171; c=relaxed/simple;
	bh=ko9fHYcXPgW9Yu5KL70TWNOLqAo2KPcVQ9OgI1jhV94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIXXCKxudTIuo8Dn/Qiueq9f2a3Ah/8EQFWZEuzgDuGddpjS0b1vrDvA7obrHV0gKeBg31k9hCLJpfADriHERGaKD4AfumEqRU0PwUm3h9KFsgwAYv784BBbWotnfc/NzH1gXj/K6Jt/8ik1lgKXZwiU+U8Xqo5GXYO0hq1hs18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLSirBKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLSirBKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B1FC19421;
	Sun,  1 Mar 2026 01:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329171;
	bh=ko9fHYcXPgW9Yu5KL70TWNOLqAo2KPcVQ9OgI1jhV94=;
	h=From:To:Cc:Subject:Date:From;
	b=jLSirBKoCewwyC3XLRPK3+meGY8Z7gDf0kEDuoIYNwyYqcpn0FjlVB/ICaqhOPzc3
	 HRAZfxPRrTIGacFCa0dVeVHHxeXizXLLGJMPlqWzm2fM5nISRabj4Ym/rNybgDDWZD
	 K80Ph0WqDiwKqa+bL4UB5Wrm3xOy7XmmkK9kTjEpyuvqdGKAEvv+QQFohcX3isaiP7
	 cKrcNANcZ/AmNXKx9uiL+xYVX9ZwS252aFGCKgigH54CdWVawV7AFuFIs6nWjoLUKP
	 XtBfdwPOaMo4LQmI1ska56wMIy6A+ULbl1jXTckv33hTy6fKUVXmHvCjT1vpSf0X9j
	 euVwQIxX3uXTg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	shengjiu.wang@nxp.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Junichi,
	Mihai,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:39:28 -0500
Message-ID: <20260301013929.1700488-1-sashal@kernel.org>
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

From 80ca113671a005430207d351cb403c1637106212 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Thu, 12 Feb 2026 10:18:29 +0800
Subject: [PATCH] ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names

In the original txt format binding document ak4458.txt, the supply names
are 'AVDD-supply', 'DVDD-supply', and they are also used in driver. But in
the commit converting to yaml format, they are changed to 'avdd-supply',
'dvdd-supply'. After search all the dts file, these names 'AVDD-supply',
'DVDD-supply', 'avdd-supply', 'dvdd-supply' are not used in any dts
file. So it is safe to fix the yaml binding document.

Fixes: 829d78e3ea32 ("ASoC: dt-bindings: ak5558: Convert to dtschema")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260212021829.3244736-4-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/asahi-kasei,ak5558.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
index 5c2f131c86c3f..18919d9112a3f 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
@@ -19,10 +19,10 @@ properties:
   reg:
     maxItems: 1
 
-  avdd-supply:
+  AVDD-supply:
     description: A 1.8V supply that powers up the AVDD pin.
 
-  dvdd-supply:
+  DVDD-supply:
     description: A 1.2V supply that powers up the DVDD pin.
 
   reset-gpios:
-- 
2.51.0




