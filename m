Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E442F546D;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231496; cv=none; b=Ed+733WmuKo51lkAzu1QXbAI2+Ikzpg07OxhQfzwioAgEc1lownkVkhXHDgnzuIr0UTqiQv0540MBX2d5CUoRTaoQ2s1/B+JNnD0irxTJudLY7Zt3Va9LBeH02+Palh5fvjXggatl4BAruLByy0MhI9NqIqs8Y+1S8CYwuzYRcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231496; c=relaxed/simple;
	bh=G4bnGmOO5plEsBfAujTOmpUkEStvPYgl6gKTH4QdAro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISvCIl8u6shSEobH+9CaFEzsgR6DJNRlxLSpExJQgk9bf7PSppT5zh0S+DbEgNk6VqW8erNuRINGYAC8qWjF2rS/0bp4r63MW+qQBIMynh4K1KH0TnOxnRZQFJeNR9j7OjTEaJTZtI+L35S6XfGpCIrgBjeyCcQEUTxtW+AsaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrMbzcrm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrMbzcrm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4D34C2BCC7;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784231495;
	bh=G4bnGmOO5plEsBfAujTOmpUkEStvPYgl6gKTH4QdAro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OrMbzcrm03GAuul9UD6cBF28DHbmPnBkxWaJioLgXIRjUy9fLYUUwdJ17X21CXIFS
	 C/BzKTVj3Jn1+8dW88rTjis9pOfe6mYv3O9zjncQ1RmNRb1Ox1RPF3jxEGD8Bur/PG
	 k3I2oSLqeRvjVAijiG5KIKJD8/kgA6zE6jy06Df46IT0TCzj5XXKaD7ccoDquTNqgK
	 rOl3Y97G8bxxyTpFYV+3gp/rivhNi4XM1xAlWDvLDY+Fdx30jHhMwUNHU0duB9D43t
	 G755pRZxG/gAznH/I8rrt2UxNlD4olBUnJUGVA+HRU7PfVBhO8l2lg+4yMAmXdQS8a
	 3vy17ZqVmX3fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A06C44514;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Fri, 17 Jul 2026 01:21:16 +0530
Subject: [PATCH v2 2/3] ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi
 heartbeatpulse clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
In-Reply-To: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784231493; l=1568;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=wmQ8OjdIV+ggh2217ROVouCyWwoJQ4NDy6vn2YVHcG0=;
 b=yySkd+ybybOOPR+Mp3EHCeg9BsMlxA9Lg/+eMnDvleD0k2A+Ak8sH8VWTcrKuk48lLIU1enCw
 lEJ1RMVlw7eAKE6m79Q6W0dH7yhvTqQLyugQGM6q05LDZg8MSL0gjZJ
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Extend the qcom,lpass-va-macro to add the qcom,hawi-lpass-va-macro
compatible, which consumes an additional heartbeatpulse clock
alongside its existing mclk, macro, and dcodec clocks, for a total
four-clock constraint.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad..ae4df89678 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,hawi-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro
@@ -168,6 +169,23 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


