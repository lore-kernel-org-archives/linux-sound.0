Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102469;
	b=2Tqp1OJwGw7H9jtwFaYClOjB3hMPh25J/lTJDi0iQNL0/MnaPpNssRezL85F3usFZ4df
	 MQOIT1zVaQdinmj58mMpDELWOkXtlmvkXplaVMk/M9g45y9a2jhERe/GzQR3wZGWeiYmo
	 qBg/ffxpXysuQCz/Z3rLW61JYWXL3WZy7fW781eywXqUPVDZCJJzFMPEnhSG9gue/6k20
	 KYNXXyoyAKOWlI0gCOaVavDU7NFRpTXD9yff9SyQ11HGky9O2ZIrqDdSqS5mohzVamZ1C
	 O5U8yZoZcKHk40u8xde4IVz0hY+SS4Px1cYMnbd5SZcAOo8VqIBX8kwMBVG4trLHsfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=2vds3/XHOFLZzX6E67Kgad8Q4ru7Mk4CsE+tnn/nJeHy1WyL9Ubdth9PLq4TEFcpDBRr
	 hOtrFi+Qk0v8Xae7C34p+OYYwZSsc6qqCnapgPjEJOhQk0TY2KkjK6wlRPEC06gBrOHqM
	 pcGb/UjwIpKSQ8j8vjyucZZ80D3vzpvmQchwYo2Xddn3Su2jImi8i0fw+NV7VpwiC9Ynh
	 +P51gWRfHvZuKcZMMJqcXNva4kJwk9gBhzCWyJ3nmVXdLIVl+pu+1rqRlnNoo4jzewWnZ
	 WA3m8Dy1SwCMDOWOdmNGygtZH2+zk/5m4apW2zH7eknaDCZUKRvpS8HBrT1YpVAFKDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f/lWBDEk";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592960A381F
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B592960A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f/lWBDEk
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so6323607a12.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102467; x=1793707267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=f/lWBDEkfIPYFql3vPWiiT0rc3kWE1tCkHjWfg1CKxziyIZSDJ3v+JAjoHedbkvtho
         8Cm/kuiTJKwJvHx6CCRVdEGS1z9ABZ9tUjnKP67gzJA31Rd7eGJaCVkvqC5m4OM5Fy6t
         NYXMRa8we68AinGC9pbbxsO5Z+xeo/AYq/QoqXNtOCPutbu5qnFeAflJi0Eo4Ptc2gub
         qZUcENewFIXSny4FMvENO4D/KDg4YI77snagNteSZRUsl5PyWekoAEt7l1kL5qNtx/wy
         MmRTbLXTQWua3o+U1KtLi99yEXXzgPTjtO74lpJyjKd/DJ6OcI5LnyCuTst+PYNCy4uW
         tfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102467; x=1793707267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=tbi7k4JDYMMW9471PiQz/609W6nEUdlvucydIA8xI5dN0jM9kP2oFtywXZCU98xjFl
         9jdgBwAgYhpjp/xFjNYjKiPwGMqZ/0gh4QmHz147/ONXZ8+kj44cH6Ufw1Jmcib2b25Y
         XCy5AmaoxaGMyQyCluW86778aU3XkbBFuMj6/veJay0lIAvMec1SgHg3eh3xX0+JIEV9
         aD3ri2qcTfEzaMUGKFrVzjP3bBWaXmDWLexvHAztTYsyAEb8eLyPaRJ7bZLXpOJRzCjq
         YPtH8Du44O+dKCQN4vJJQ/iww4ia1M/Jl1lpeJFQ8tNLXFrjhDUKcz80Xh0j8hPVEtIM
         z1IQ==
X-Forwarded-Encrypted: i=1; AKwUvByKfZoFcZlbDSK4X5FJKIkAG970kkHFv0xX5wjCBP7OGN4vXhlL4sPr1bcxtfkhx1ZHpU8X8B8pXlGpvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLi/gabC5pL/krW3iWwqm6cHlya3VMwnaAtWpKQbV+ZTPEmPTt
	oYimsD+3c/24Dd+INhxvjB0yfBj54ChR558gJ7FhLeXpTHMyvwegFpzz
X-Gm-Gg: AYBFou0ydpF4Sv4cthrbnh2RBHZ/OsbDhfvjpgEQMLJ73U/nKU/Niby4DHwkPq4JQoD
	K/b49HMsI9YGedgVg7CNIg8ldSi98t4q/MzIeHoPbwBOFAtskrEVb0hCKJ2yyMyZDOO+KNn3Y1C
	/2qZQeyqd4jx64RuDwpuO1NF+9q2tRBBO2L7WiMS/jJE0+udK3b1fBZDqinQi1Poity4A3q5hCT
	4bF0DUCls9E3t5sWUOE4GgU8rhh8cGNflNDcTvNGrOvCD0RVAffJAFXCI0NDr0FnhmaOWOq7dIu
	dTDoz22Vv0cNZPQH8gqnnaeYWcGau7ip6B8SnNWKCvGShsMqER2e4/29bhS2zaUys1vgLPVhIjk
	mYzNhPCk970vBHrARM7qz8kWi2Xz2xuWdx6vrr1q3UFp/ut1CAbA4UqhRKs04VEOvLn+VKAdvNN
	1lHI9elQGqXvmwzyepZvmj0yGnbLPkuKG4l6cJNZEHCRIuQ08yBCLoHV5pKQT1wTimOfBK+BPPe
	47f6hxSJme3InOETK7NLvYvWhAvmST2z0keHbUc62axZqo6BNXQgBeeft/k54Wxf9dePGmdzgDC
X-Received: by 2002:a05:6402:a6c3:10b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b44324f449mr6887681a12.34.1793102466212;
        Tue, 27 Oct 2026 05:01:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:18 +0200
Message-ID: <20261027120019.93611-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra20 AC97, Tegra20 I2S, and Tegra30 I2S controllers each provide a
single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml    | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml     | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml     | 8 +++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
index 4ea0a303d995d..19e242f6cf028 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-ac97
@@ -45,6 +48,9 @@ properties:
     description: AC97 DAP _FS line
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -57,7 +63,7 @@ required:
   - nvidia,codec-reset-gpios
   - nvidia,codec-sync-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index 68ae124eaf804..9a17866da7731 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -15,6 +15,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-i2s
@@ -49,6 +52,9 @@ properties:
       limiting number of supportable audio rates.
     type: boolean
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -59,7 +65,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
index 89c3c6414ab13..fbe4cd4619683 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -42,6 +45,9 @@ properties:
       - description: rx (playback)
       - description: tx (capture)
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -50,7 +56,7 @@ required:
   - reset-names
   - nvidia,ahub-cif-ids
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

