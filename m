Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9EE32ED29;
	Thu,  8 Jan 2026 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909190; cv=none; b=LA5L6O6j3tx8yDjs/kzTZNbzS37ijO7xEm99blhW9v28VtpyXUn3SR5dFHwFqhdBkwkYVS+P84zTxm1FyJLGrMfGOEL4RTq3M6dIPGNKv7oq2zq8B13xh7rllfk7Y/F5ZMVve9YYuMTMUAR+T9ZKfqEspD7N2Hwwl7pDz3LUaH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909190; c=relaxed/simple;
	bh=cf1/6UwDYifaropgmsnpTKh6BSkF0gTiEZ0SJBzKquU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MP4it5RhWKHCx9gEzUT/fzLiBqEUH1OmDWojuHxT40V2+4aNJLbfxpK9+fnKqEiW0aoeLEQqWw5ZaufiB4AQt0brjWIpoJ9M7ux9xuUpDkN8bR5TTgZ/JkMkeXvxVoPKM6leeFLMHeZkXsaIw8+H/Q50g84GIqEXjQHM8goelJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YC7toaff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC7toaff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384E1C116C6;
	Thu,  8 Jan 2026 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767909190;
	bh=cf1/6UwDYifaropgmsnpTKh6BSkF0gTiEZ0SJBzKquU=;
	h=From:To:Cc:Subject:Date:From;
	b=YC7toaff6pOXBj5FKkg7kZjPdMg+By6pkp9qKXojQQuUolAW5d70m4AyQKkglb/DQ
	 rUZxpY7ub+bOnl9HOhy/YcYWJgCYys+SCXe2uZgbFiBVobS9/IXm9pAcDqbsOlkl8m
	 CELkS/erEti1G8QvOeUBFWicV5EZVsbGoL7UQdFkaMT74CCyM4DUqXsZCcOJs0NxZp
	 LGIuExkJAgWZqPEkPS6gKD/Sl/EpO6CvxmSJaMmFT84sMTodBGnQQCec9unUuRkQWm
	 icws57O8lHEeZ2yBOsD6YoEiu3jXkW//FQpDG+GXF7Jy02R9EIg12bhA48N9vFdCMv
	 K4KP51K6mjl8w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5640: Add missing properties/node
Date: Thu,  8 Jan 2026 15:53:05 -0600
Message-ID: <20260108215307.1138515-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5640 has an MCLK pin and several users already define a clocks
entry. A 'port' node is also in use and a common node for codecs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/sound/realtek,rt5640.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 3f4f59287c1c..a0b8bf6cb110 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -47,6 +47,12 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
   interrupts:
     maxItems: 1
     description: The CODEC's interrupt output.
@@ -121,6 +127,9 @@ properties:
       - 2 # Scale current by 1.0
       - 3 # Scale current by 1.5
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
-- 
2.51.0

