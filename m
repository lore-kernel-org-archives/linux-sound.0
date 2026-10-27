Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102453;
	b=jRf7KC079M3K4mxwvd2xwg45m1Fuo6JdBVJouFy+vIhOWg0gB1NtLSP6Aqf/K2aHEA2w
	 0wrXLqL3nIcAmslBN0eYE4F5rqGniSMcFEGOhovayMeMG+9SKTsphEjYcdHJ7UIh7y1kO
	 /doHqOjRioPpjFMv6CC4DIUnSLZxMm1ZDKRyD5pOGr2RF19VYvnhq6RwJO5VJ3yaIXGr9
	 1cPyJFVax0h2XJK6gwnkp05iDwo1pNO76UwdR1JlpVXxhw56tD9pnndRFc4mpNbibTLQX
	 dCKvIyROvjHg9lrRk+HMF+PgOLhGfHil31ZjLYDqxhswq3bZP0TY+YkFzSZJj36xupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
	b=WcNOto0iBSmRbQXXO7oDgWllnVN2k3HkDLyHJ0oozfdw0J1nASD7pQGuaF2FC9vZOVz2
	 KqEDbqFcyA3nEwRsFPhgY/eidB2nQeIdi7UB+HilnI6lGKX9yjWq0vd1XT8QJjLY5SraH
	 ypUxEK1zmk8k3K+eJJr8KwGon8XPaOZLHWoJxGkV5E5v8LeFWgn56IEQFWLyZTDgG0tP7
	 U3NOh+y946CCmEc46CHVulrYItah1BMsKOwwlNhCUwxCgNE4u2JEWxuXJarPS67kJ7z4D
	 m+OhEaVElmSdtZshxIp6VKLBNu/KGLytgMCb+TFfIF7QB3xPgLTds+7fvhw00GzJtUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3021606A320
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3021606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so6465169a12.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102450; x=1793707250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=ENAmsw4Nw22yhGScbFjLDocGggraBRH99Rars+0xxe2Oj/WqHA5Lji1MtwB2XMePKU
         0L5NRLesKErQISbxqHgyLlyfnbcDV+noK2ldPPhJ2VfxpDViDLvYCyBaj3SBy7NYTHb0
         y4JzqR34d2BUAPCsGiW3+xm2787/IFgQ4vfATDc8Mu2HA+II+no/Z8hRt6X//uw+KVhX
         HtPXnu1bjduugmphhrxFGxDNZnVLnQ8dvEkDxoLCDHwIC7X4qLN5MDl/aAAX87pJncAG
         6qMWZjVQnanbI2LcQ8KSessBYQKaDIA3qUxUhBPVELSHctBBeuxe3Nc1VrDRRE90mKE2
         K6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102450; x=1793707250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=F7++r0+FaJ9micdEVLNS/tql00Mq8nsvA3n2w+D7mkzZ/765RcAKzSEvNaOMjksfwD
         hxcJ1qKaFZNuyt0OrcE8S/5z9bHKpyUy/XZQeM9qDTB0Kr3cd7OjQvnM5azIy31eVL4/
         eMuT2W5L7kpF34yQ/yH/VH/XlGS42TKkUxgwkcpRqBonhbx+JtMM5t0FlTm3eAtE/CL6
         I6cCO7D5X0MMQnkKeBlG4RnVYWlLBXvtSfoSQINyiu2I2bxskCy/cyvMrDYq99tBMq1Q
         4gA1IQDQXfKdr0lVy3YANKC5U0R5i5viVoApQzbkiGLqRAFar6soAKr+9aVRFbhkyKvY
         IiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcD5JC7GnKjgzOMqL+3vvIrZwHCOT8J/iOWMnBJFIm5XMVB9VJt/McBNx+vmWpB0gLyqLtn10js6g4oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaBWmFSLlu0K5j8YzS4N+hJKNyHigVJmgAfG2rzD5ESSwFkroE
	U2goYmg6+kjdxYVeZr3C0Uj6kz8p4qgSNz3dmdBi5MiPCnLwPY2WA4nj
X-Gm-Gg: AYBFou0lTplRO3Xz4ckyGhokB/rxbI6+J7bq/EI1mNFXK5tCrCTCJSlf613a+qVD1BE
	FuejEOecg+Q9l8KQfQZW32ph5kVPxCP+j4IwJ+E92E0mt3CbN4ZFRKd5ta/o5kqhDYhFbzYCKzu
	eNWF0nwAtjfpcYFyZ0brwXNEkynRtNUZbnJnOmc+q7q7k75+IhCkfp+vGZ3gCMuHV37FCwAKE56
	Cmvw3tadub9QszGmwKnHfxebeLTYNEkfO+QvkYK8ho1zDmbl1QUnLMuSRevq3Psst4aVScQS+08
	Olqd8Iti+xu70BmV1WNPWyGAxJLpnDWzuIYNKxxacj9chBr45t7kgqoZH2mzWAQA26u+jPD2a0i
	W82VM3NjMnKcHpcLsTIFj93OoXsIZkqLjfoo7ROJY+muTMOe45lAOenzK6XpD/hbx0ACohAgEBP
	GaM1K/RhL8TG/uN8gS7rrSEivR8ed39U/S+M8rvvuX/HoZsk6dwdkDpFeL2JSJ1vDNu1YufmJN9
	aZXafc1rNiDDTXOKbdPySbYrCubeAdug0rM5/bMQmgebCQlfmjo6kfvbzXUQHtuWkZOUphYpIPN
	rsueDLWcT6Z+U4s67KOjdQ==
X-Received: by 2002:a05:6402:428c:b0:6b1:ef5a:6720 with SMTP id 4fb4d7f45d1cf-6b442fcfc70mr10159119a12.16.1793102449777;
        Tue, 27 Oct 2026 05:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
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
Subject: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:13 +0200
Message-ID: <20261027120019.93611-2-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/maxim,max98088.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
index e4a2967e1e818..4d33fd705cf8e 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
@@ -9,6 +9,9 @@ title: MAX98088 audio CODEC
 maintainers:
   - Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,11 +29,14 @@ properties:
     items:
       - const: mclk
 
+  '#sound-dai-cells':
+    const: 1
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

