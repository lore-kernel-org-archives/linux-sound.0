Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102464;
	b=mxW86/PdA6r4o3vUnH3bq9kPFli/B7rqzwiWW778CVzzVgSg8/zus3sGYM/HmPGTDxbI
	 Ld1ubO2/tKdP77FVxLMOFImZMZgUb8syPFYYcRacb7SAqw0vL53z6FiqfjXRWjp0CeWxs
	 L+APJykkZ6Txs1DROXVrbgb3hxs68ZKhIP4SM4XlK2Hv9IjAVfKRydzN5K4piEXbPkMxF
	 t2wCSiFFRSb2KZ8tvxwPVXZFNys5M0tM/AQv8p+9SKtVLUY2TY2rVtX4ZO8sGP+1ME9L9
	 Ja9xtbY4mw36QfAhtCVZyAx1DmBRDv4citmK6KNOzumHjet4755ryk13nKvk+sh+lnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
	b=4PKT73RA+LHfq7h7XgXvfmym/kEZ+DR2BWrM47VsDHXWD6boGp0TqU4ll35d02eHhwRd
	 9x+I6Iuxjz2oj+T9wC/ONuUYrUPPPvuXyCccayCCncUbxglE9gLlgMHQkTuTlqwAAOKCv
	 NSsPNcBrlz4bI92UHlX8OiEsGoWW7B7Ipo/guLvMmwdFQhN4NWeIF22fOO1WyZ/eUrmzL
	 QqPzJjexxwzH/7nhBQ0mC8KuxQC4XvrbuPMrhMtw1kVvML8rXRLUbn2Fi/8ufkSLI1xVC
	 xXkjreLXaB1hye4P+nkllx05T3dq/JPYefIaQL8FLvQzzpBaoa7kvzVJ7QEWXlLfuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890860A3806
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8890860A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso4129486a12.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102463; x=1793707263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=TxnE6HkSm/cAlbvKMme5D5UwKuEoIsGqzBXQWe5BAeNxcrBBNg3gamuWAv0zjMcLp1
         C25hq3LrHYFU7tBgWoYYbL1/P0S9KUNsVtF0hg1a0OOU2jZIn8saECLD7IkiUXMlJN82
         WvNgK1t3oR86E1EYtHaxka1TEwGZ4httlFXNNltQuZsezGrafGFnBSQyiDodQO6bUdfj
         b1vp2wkO5/9lJD3sscinQljbsYNe6ungHs08+hEjEJKthJWfYFGe3o+46U1GT2iWmDpL
         hlfj2KgoT3xH6dEYYLtlRyIZ+Byip2Os+8Za5NAkoBFigQDL0lGDkAxCGySfcD2ZF3O9
         YgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102463; x=1793707263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=ju/SBUmycE/AyZ9eu/uJdWIebSAoPol3XDNPiQa2F0ox6rAUej5kAWf7icwPquF6bD
         pWl7dTR5AEdUUnCzajPx2dTbY+4Rs4QNQP+TwYT02aTlICDff/dyqFTXN9FvUuok0iUF
         h8qoa+jTacb/H3+g5991jaWVR1T21N/fsCd16zmC7E6njBNBFT5iiFbNG6YNEzH6eSnq
         dq9tSmGd0Ph4ZQH5CX/a88q3WfFUXtaq0thmAZMp6TA7jez+5n9PdJLXQ6ZG/3STT4GZ
         LGxkZv389brjduLV8UTl9fJKLa8nRAguUbzay1nI6ZOg2/uN4n/WhMNpsTdtRksQL+pZ
         dDHw==
X-Forwarded-Encrypted: i=1; AKwUvBwZAupThsmlpWkWCBWszt5oXDvy0AQA7ubTi/Rqk2lIsz8R9N/WciISdhnyQhnS+5O74+1yi3+oauGbVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWLlqUspMbeeFwss62dKH5BS6gbBjfOT5evFPsfXP76IIJSFPZ
	GttEhc+AlwH6y1y21B2kQsEEpOX2rj0/2ABHAlJ8rrhQAANntL5iVjBN8wO4iQ==
X-Gm-Gg: AYBFou2eqATSdE5ISdXL96f+Hr82I1QCi2AbfjJrKmeq+w9zYnObClwRcdwXEc94nAM
	y10j8ppOW1bihN9nhfr3EO9uL9NCrY5u3tCYe2Fm20AdBGXTT8rrp2dvHRAhuvSQqQ3HU7Ionzd
	KoycKOpK5Wt/jN+IQ4xQPqow5nlCxFCfH9aQipnfXX93RxQlJoZpzEzMoofjxZyn0fdrwTmfTJ3
	PBJ0KPKVJBZs3OssFl3lyha66VRH2gJXkszXr5jhUljYwqwF0iK+M/Ctv1zcPnF8lETkS+WP8K/
	NdR3D0YiWreQBZpi9fzd6cUMAk1Tu+9Hfph8AIEtzzjWBHFkSzQ3OEaQBFONmUFXKZleeTKP9lz
	lE/9rNdpqSlDVgR2AOcFwPCgau0U4keutXOtTWAlljAIQfwklfq+oQJhxPriFs1nVEi7yutnGFi
	13ntnPmtZi9B3C6xH9XKMdm18LcNy9pJ3vNEu6SlW/4fGJuWYSvo4FU7X/K4UTvUiIxj+eLYYXO
	DCpsE4tse6EtCbEpepj1ajADRbugYB0Bw5yd24flX0ERhdWbPeCR1OBwcosFA==
X-Received: by 2002:a05:6402:b04:b0:6b4:1037:2b6b with SMTP id 4fb4d7f45d1cf-6b44311e24bmr7137730a12.45.1793102462588;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
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
Subject: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:17 +0200
Message-ID: <20261027120019.93611-6-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..39bf1af7c3ab8 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    const: 1
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

