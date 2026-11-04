Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796082;
	b=cS570ErExIrJ1wshDmVmpjJBpMxR55mm0ZyfwTzpA6/PUL/ajcjv9nVd0Wi2Qn54OL9G
	 dXTPndyYHX16UvP+uwjGR2B+hHCtCj2VjRNnVQTpuLWyKZFRRuXOmrZYxuk0B8C1v0wsn
	 +rqCjfENW+LsMaxQqBavxFrok5ZCAbIT3KNeRUz9WBtWFO9Y4FbadqJcOFiCJUHdPMKtw
	 qtpdd0ndlvSSjxs4kRjYfW4oJiX4k55wixN0qDugFP/n+zzI1zFnseEKQhtIX0y4ww55T
	 F6FEwsousdc0AX0rJM7P1DO3IEPtzwZp9mV8p9gr4bVfSf2qhWGnjO6OWLp8QOrPK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=CLPGO+2AmLH22e5He5/7s0GksozQMRo9oRtqE+cwy2Oz4nMBUKFPDuO4o5C2EkODgq0b
	 CWnMN+6jvEmE+v/6eULS2YGMs6KBhaYfxRMFvgMfbfvS6/NkUrXC5AzSZSe4N1CRs+VVR
	 s4hskykHP5ngLmZm/2bI3L6g+vEKT04t9KBT6lgmAS7Z8n0jZuVjsJjgqPXHaPpDeDGYB
	 0XV0F5WHX4vGsHiOIitqXNjRTsBOk8yydo1km2+nfalSn4v/bnz1PmwzNPG9kyT8jYaJ4
	 1EIOLTniHnSsDlGyqHkxx3FHO4gtM2Yn1UxenRcA5hX/GyZboq7Q4LC3VaiFThZP33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CRzmj8+/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB7606A337
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BB7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRzmj8+/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5077175e9.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796080; x=1794400880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=CRzmj8+/NF/BN+I07yf2oD4T5kFJjXjbNL5RcAPCsr8/KRarKHlyodp9inl5fv71Jn
         o7SqXX4rln8aBWEqErqW4hisC4TP1WtD6JdJ/q+ad/HnKWRnTuZU05YCtv1yT1NLHa4n
         UGOqs1zvron1/mHeqNxuqiZX91xIMqNTF01XoJjsoWs5cw9WuvMLlByz0/+gwcdiR8sb
         Fu9GgS6OVoMg3398FtSLpfqztKxtrjwr7qsCXyr4KSlLxF20QjurOq9eV87E1Qaxxybo
         Tszg3VIasQAonxfHIZW5y0AGXwZQneMpzuJ2AQU6QNhYLlvfuBOiYFHEiYwQN4/YL1Pb
         dGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796080; x=1794400880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=lYweVOft+vwA/v4Z667W+eFZQQ4F1Dt16tT6kp66UZXous24RT/NSo1x3EMLaSFied
         0lHPYnULMNeXuBt8ncvW42OPEZcdQwx2xkrldC3M15ZhragF2mjE1ZKtiTbM4YhWfQcv
         RLcQR7ymJTNzYM0qEjZ9UpZ+YhLUAFsUsdIXLBDrpr+EmaPfMNKqFLs9Ts6fZe81lHLS
         2BM9jPfnxgVoeTCRaPzWWX7nZ4RwVNI4Vi6SZtR/2pfhi4hxO9N+Wdz50AfflO8jsLNx
         TqOzv0sI7DVYdjmdPnSB0ueujjFLR8EbSFbzYaXFA1xReVks/lu/djb4Kv87X6ATz17n
         Xh2w==
X-Forwarded-Encrypted: i=1; AKwUvByqjoVzboTSg45NZZCbKLpHZtbk5MBINVWL2pQulaCrS5d+Uu0/ISdOhmwnq57dSj0GyXH63GlwurYGcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QqvFfTNxiFiUkyFtymxQL886sRRgLHLqSuqj2Z78x7htPTETq
	T0FFUQevF3qFSLoNmxLB7AzMNMiveL0gY+7RnOJ4v4LtkhK4w7vEfFLy
X-Gm-Gg: AYBFou2wuyvwT2ZXlJL4ZUH64z6ZuN5otyX/9Utfbl7XnYnv96Y30wyInh0y/YYO8Sa
	Xykyq7Z1An4s1IqSzxguLMuhaf8iWW3FNUCv9sc+WJnecRzSwWLr1HCn+dTP1tdXkeQKR5w9ZB0
	zFNpzTPYD/o7Z1XuogFBDt5uQt644HT5To8WPmRoP3g1umgfgb1VpI5f7+NWOydrWkAAhRBttS9
	QZOxbTtg8vtpver+sFn0GeU4u2rI+G3JeWGkEbHKjkOFlR9tAbWawl+wkANbYLLHlsnYMfu3dRd
	4HzdYQKr8qesZAUxOoMmQ0CXUu0twCIkAXsf3k8RCrZng0p1t0LzVkk+XYItWgl8FZJOU0DKKLr
	OfWHBCYglk8JlUEiEUWjnnPT9NH6wWuYXwJREMKX9BUIETopjlVLlScIOl6DIczqcrs5iDQxoU8
	QDK+bZaVwm/25rHcigTtxBJQgm2Cve5ZgxL+F1pDiXqxe0UFbxvPVbY2nkU1IrGcP04sAOZ4oLb
	u8TbMJqPUXtaCEL2HMOSPSTkxXw4zSkLK9vUJh1vlGGDRnbaIIbguIdST1Epa87U9f5li48abOf
	Tswh+ldtU5+hkfStMIupzlHel1xzsg+uzjn2oRcVE8tuGQF1wVsvx7pSqkzFHnVjbyn7pg8=
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr378083555e9.34.1793796080386;
        Wed, 04 Nov 2026 04:41:20 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:19 -0800 (PST)
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
Subject: [PATCH v2 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:56 +0200
Message-ID: <20261104124057.240288-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

