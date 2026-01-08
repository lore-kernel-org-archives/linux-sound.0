Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020AF33D51D;
	Thu,  8 Jan 2026 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909192; cv=none; b=BgRpy7FzkTYPm9d2ylcE7H1PF7xcs4v+NvrMFzIG9VeTxQ1gLlFRmHKFsJ8+RW/mh7jTY8imWL1crZN3D8tqLlq1a+230gODVYN+8UXP4xGXwNid5PviUBxw3TY8pAsgrZ6/uF7Y6oYaC5fjsAqYxIIdTSVhWpk5uE5LuAVJWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909192; c=relaxed/simple;
	bh=ZzSqtnRtEj//N+Hdq6610QbqR1q6icmP3gNZvPkrh/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/oxQJvxurrLmvCcqqR86eKuMJ96DQjDdUdo91kWKB165VDT6ex4jkx/RTNyQnXYLvOMWhCZxELqvDfqRgKsaJHEDXhf1lgSKpZqTtEOhvH4Fg46RRo5rF3KQmt4TIBv5GN8fX7XJaXtXbTCUxPRtFMmR9r1t5TPB22OnJbaZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sO1QXwVI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sO1QXwVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9334C116C6;
	Thu,  8 Jan 2026 21:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767909191;
	bh=ZzSqtnRtEj//N+Hdq6610QbqR1q6icmP3gNZvPkrh/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sO1QXwVINqVu47pfjHXVXs4H7rpJjNNp34Rg1gDh/eT3aa22OG0qIYIXX+Z25cIi9
	 sw1iVJZnXh+yw+ErSsaMwWknfLTJFdXFTfeuAYWHKViMCcMONNIcirlHDQaj729otZ
	 Mb1Gc7k1zU9gUDE+sQqV2Xjg2UfCdne/pXFOzxtfnPycMrjoLHgJnMa4b8mQBo+mla
	 UpKUjpkbkwn6Fa9zWLWSQgovnWYff7Kj5UfBjXeXFW5wqsVagJ4lY+zcthCiKu8p58
	 OQC0xe/QDw/m0NQ+25OF3shTehhuZeZ/aE2qwvrRmlDznL+EagZFBnW68ANruOorT9
	 CALmDtTBBUskw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: realtek,rt5640: Allow 7 for realtek,jack-detect-source
Date: Thu,  8 Jan 2026 15:53:06 -0600
Message-ID: <20260108215307.1138515-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108215307.1138515-1-robh@kernel.org>
References: <20260108215307.1138515-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver accepts and uses a value of 7 for realtek,jack-detect-source.
What exactly it means isn't clear though.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index a0b8bf6cb110..cd95d7189d34 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -104,6 +104,7 @@ properties:
       - 4 # Use GPIO2 for jack-detect
       - 5 # Use GPIO3 for jack-detect
       - 6 # Use GPIO4 for jack-detect
+      - 7 # HDA?
 
   realtek,jack-detect-not-inverted:
     description:
-- 
2.51.0

