Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044936166D;
	Wed, 14 Jan 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428535; cv=none; b=sD465jk5CDd/hs7vY1x6H5NdjqyJ2eV9TlQhnSjhcNq5U8SuBj9eToG/fEr/ukTRQMU+xpU6h5X7inheQAQ73qzoDqgxuLUsLrXCI0MVr0gi6dKOOCtMzIsTZUUb090eLkbwQR7zySZFgZmbG3mXG8wAiYjGxwTqD9atx1cJVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428535; c=relaxed/simple;
	bh=aqILKRtoAlmN/2PS1o7yjJtfTfvVyv80U9M03cV8WM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=onWx0iEKLt5wG8gcj7wBrBNSYqGCdfysWXRODOZRXsAPcRKQA3nN1cb8K7TFknivmdqowKzkiOtSXd3xHG0hU/SJDLxQgU+F3a9Jbuzo1mOv7YvlwUcjAV4VMfYHdaWXnuXDU51lhG/3A2LvDVuvAJViAuA5HQt0Xl7UIdkb33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACVNTbEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACVNTbEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEB6C4CEF7;
	Wed, 14 Jan 2026 22:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768428534;
	bh=aqILKRtoAlmN/2PS1o7yjJtfTfvVyv80U9M03cV8WM4=;
	h=From:Date:Subject:To:Cc:From;
	b=ACVNTbELbPQUo1izn8oQoEfc1Cp+HXjDndyG4u2zjdVuDmbYBKkYUkVpf5//7n9gj
	 GGsZyrck04sal+pTA98zB/eZwKEibxVBjimiqh4uvhBvWpPi24RfUbcl1C2gBmToci
	 GbjR/l3vzHxd5KgrdrAEsbrC5iZ6J5ffTICnoLzyLekKSU7qbHiVF6LL3usdKX12Y3
	 uUWwK2yv1DyPmjvz9HEsaSF4Ik0qpjJp90kswqYbt3lr7b2JY+4q8uAQMyb6LsWRMh
	 ojWODru80gWs8vSr4WkeerTfYrkyKbch4z/LuTfCk3l5V2UXLuox6/ppjTNGsCQZOl
	 3pgl5dp2cfebg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Jan 2026 22:08:35 +0000
Subject: [PATCH] ASoC: rt5640: Fix duplicate clock properties in DT binding
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-asoc-fix-rt5640-dt-clocks-v1-1-421d438673c2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOMTaGkC/yXMQQqDMBCF4avIrDuQaIzQqxQX6TjV0WJKJpaCe
 PemdvnBe/8OyklY4VrtkPgtKnEtsJcKaArryChDMdSm9sZah0Ej4UM+mHLrncEhIz0jLYqOGw4
 +uM43Fsr/lbjszvat/1u3+8yUf0E4ji9N2mkAfQAAAA==
X-Change-ID: 20260114-asoc-fix-rt5640-dt-clocks-4e3ea6a47631
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aqILKRtoAlmN/2PS1o7yjJtfTfvVyv80U9M03cV8WM4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpaBPzAGZEULmyCR7N6ebCNI7Umg3vVwzRYInaQ
 9kM1tZUFwCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaWgT8wAKCRAk1otyXVSH
 0EjsB/sHXY9XYb9XRvynR2f2Yh4L1cikmzRpyd07cUnpoCJ96kw0u6rBunkDFqgFQ8HQDfNDh0a
 PMYyDqRhMxRuGEoIE+d53qCeP5eKPwaQxkXd52q7EMvukHgfwuhGVvGBSOwcgz3RA3YaFmv0mrX
 H1TuUJNGCqe83DzDBL3ULIOCq1ZQwNBi1OlcfPgQ0q1iaYCiOD4F2fwTu1yYwiRLTMKKRsmwFel
 UMtkMDxPlbvGJsKZLEwRHxqOBOaQKT1xFV719qDg+Gn2wJTytW/Y7MnK+hECYGKzUMVwhTW/p0+
 XuubbCseUi2gNioZrbRifphq9j5//irwymGJ+zNA0Rkhvwbw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Not quite overlapping changes to the rt5640 binding resulted in duplicate
definitions of the clocks and clock-names properties. Delete one of them,
preferring the simpler one.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/r/0e68c5f4-f68d-4544-bc7a-40694829db75@nvidia.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 02591d6be12b..2eb631950963 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -44,14 +44,6 @@ properties:
       - realtek,rt5640
       - realtek,rt5639
 
-  clocks:
-    items:
-      - description: phandle and clock specifier for codec MCLK.
-
-  clock-names:
-    items:
-      - const: mclk
-
   reg:
     maxItems: 1
 

---
base-commit: 1a75f24a7f8c2cac9c34126d7221ff59c5265316
change-id: 20260114-asoc-fix-rt5640-dt-clocks-4e3ea6a47631

Best regards,
--  
Mark Brown <broonie@kernel.org>

