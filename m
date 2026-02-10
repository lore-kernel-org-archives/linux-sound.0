Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439B31D72D
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741920; cv=none; b=kzG1rzCwvkcaDqAPoyN5IYAlL4dnvHRtRT30WxfZZwNt1kheRy4nKSkYJqSyeuoZaOfO8ZmBJVc/EyAIApNHy2LZsS8NC/Af68kOWSE2zm3aTq3XxFKkhbfIs0I42f3wsj5MoY4MiLRBTDf4LW+lEZXFvLLA8+f78u+cNnLPgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741920; c=relaxed/simple;
	bh=rM5wReeBWtgy9nmTdYAlxFeY/pYQ4Hi13y3M6Ph4508=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIRpSankHjBeDQXd8h/wLtxXYvl8jYBe4CPTCCZabuyCMLBepAjbcslf0eBuKOcwicS6droQA3KhAnUmQ7h1a4aCr/MRpDPW+mFd/Vu6mKrjLMfcQt6QQHwqBKmhkyvBuXoyyiv4bf42txm2xub8AfPPUUrEmc901m/a63PtGlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbuzp09Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbuzp09Z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso58494515e9.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741918; x=1771346718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UbDOXAtO3a1IS407zSIaYrMcpaX7Lzf/cb9+OP6YuM=;
        b=fbuzp09ZXbIEt5bPvOJqaavp3j26Nekj78OiVbnOenKf9BWB+rpy/zbxOK3RRGRUSy
         4H6Q+zj4PR5RqvZfTHANY02tRGz8PsyWJWseprdw5HhRhQsSnl6vpUBW53tiPF4QyIN9
         s16q1mNfb8hGdvmbLxii/MIBTjq9gGbl+0//RYBM9xsYECNJSfgLkKmfoPxe39IYuXLj
         MIiYog3VnncktOYbF7hJ531oV0bSx5Z2862t9ZP/iBWpNJl7gEJRuWeFn5P5AX+8Z6z3
         abEYaXjRgrT9e6HjbUlD/x8rtiQkYXQHzdHGv9tVGPMEu6458g3FIcu2AZLxQWeFtzhJ
         ZkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741918; x=1771346718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UbDOXAtO3a1IS407zSIaYrMcpaX7Lzf/cb9+OP6YuM=;
        b=i6mAtqMEtQR5zLLw8yNy5vvK/Xu0uSinJAJVsgCok1jdlO1YWU+QW0cYeJ0AFRZgj4
         ji6/LEsJ6sK6kj2d7bigGWOA3I9sQp/bHLQ8H6k1LMtEIWFwwSlvQMt1SuiSL1s98yh4
         C3y+36Gu3u+iyXTPCjazpzdsrPSlArRLmDyzB6wS7wd+ELzKfWt20yhBDxjea0WP07yI
         lR6Igjlh7m0V/gknqQ3mhUsid+7ABp66RJpEphjdaAvIBHIjrYZQ/C4EZLt0PJZkniwR
         NC0WL1Z9zShPmLrBcziPMq6QJ5RO9XN951kSpM8p4kiAZnEMB9w82VCjeuZnTrkpviu1
         VisQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVyw3iIyl+/eMu+fRftGCTmfD4X1XCbKadM4M0MZ/Ru+uehuVaESwI1S5Y5YP/SPFI8S8iqaphFb41vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB98qWjNTIhOBOw8EyX9RvZoG35v0UcQM40OSoM/P7GrFPBbCJ
	odHgJ0fnqPNYM0Eq/bzB5ML9sZ6bEPjwD8Aw6eYM7I6TT6fp4UQD+TAm
X-Gm-Gg: AZuq6aKTAk6HWuzN3O8UGtJfMI0d7A2Hrh3/PJrM4sj28N++hKYKkQgLbKrROF4DaNp
	1u8s75F+PtoK4Oi25GHFLXp0JkgL5U9IGx3JPyTpz7Vj0qi64R4LiD1cQ0u1djNcvlS5JX4ev/v
	7ctRJNJMvTCaqiovkTfmQodavmys32vuvdBimaFNfUfIPT/KVpOcAkLRr55XuHqntJopo7ePdYJ
	mqBnJz5fOwx4D1U+sVkYUe+dvRmyXMydvR0qzxs4q63P8247zLiJK9gsOaze+r4pSWZwao+/Drn
	gaBAl3+37Eg/X3gebBN6HZvNCFJ86WrUtNr1BJgfizv/hy0OCoATJY2dG2gkDX0envaQspiO6rM
	/Bq5hW+wlueXBS/fupET2kpyP7mw+DUe6rG62DnYngyX7NFa3+dKEV+M4BTJ9gfoE+ttsmaw6vu
	7D2mtB3G+y7TsZFRl+pJB5CxgiGAwOQaXw0KN+IE2XqXGFASNcqXzO7S4CwFlfwCtnKFk8bImRF
	TRqeqFDfGgStGgHOxgqG+C8Te8sZXTyRm7+grw4mwdxeMyshVc=
X-Received: by 2002:a05:600c:a43:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-483507e18acmr44929135e9.10.1770741917807;
        Tue, 10 Feb 2026 08:45:17 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm96294245e9.1.2026.02.10.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:45:17 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: simple-card: add sysclk-cpu-first flag
Date: Tue, 10 Feb 2026 17:45:05 +0100
Message-ID: <20260210164506.161810-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210164506.161810-1-stefano.r@variscite.com>
References: <20260210164506.161810-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The simple-audio-card driver can program sysclk for CPU and codec DAIs
during hw_params. Some setups require calling the CPU DAI sysclk first
so that the codec sees the final MCLK rate.

Document a new boolean DT flag, sysclk-cpu-first, which allows selecting
CPU-first sysclk ordering where needed. The property is supported both
as a top-level simple-audio-card property (prefixed) and on dai-link
subnodes (non-prefixed).

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../devicetree/bindings/sound/simple-card.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..ddad440636be 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -35,6 +35,13 @@ definitions:
     description: see tdm-slot.txt.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  sysclk-cpu-first:
+    description:
+      When mclk-fs is used, configure CPU DAI sysclk before codec DAI sysclk
+      so the codec sees the final MCLK rate.
+      This property only affects the mclk-fs code path.
+    $ref: /schemas/types.yaml#/definitions/flag
+
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -194,6 +201,8 @@ properties:
     $ref: "#/definitions/format"
   simple-audio-card,mclk-fs:
     $ref: "#/definitions/mclk-fs"
+  simple-audio-card,sysclk-cpu-first:
+    $ref: "#/definitions/sysclk-cpu-first"
   simple-audio-card,aux-devs:
     $ref: "#/definitions/aux-devs"
   simple-audio-card,additional-devs:
@@ -251,6 +260,8 @@ patternProperties:
         $ref: "#/definitions/format"
       mclk-fs:
         $ref: "#/definitions/mclk-fs"
+      sysclk-cpu-first:
+        $ref: "#/definitions/sysclk-cpu-first"
       aux-devs:
         $ref: "#/definitions/aux-devs"
       convert-rate:
-- 
2.47.3

