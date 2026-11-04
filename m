Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796078;
	b=YRXd/Rl35JyzIusQjHPg0vUnfQcJ/1TMvCcExLhMdEStJMcaZVBacYePYExH9rN7poa3
	 0EH/ilVsKAtlMa9s6mu9ldc8gTUZPgJyDEmxfEWzVSsnq61eXdcJMEalTPdkyAkBdH0Zh
	 KOoAiTCdy7W5GkXeTeICfhaEzuo0RR3N4NjY1eJ+YkzOVnAX6vDDTvmHF7CB9nyhg4o8e
	 YdHpyAoedXe4KCAsaBxTUJHntVYbLqjHcYYEhjg0Zn+DHiyrI2BMfJq6xB4F0ZQtzl72G
	 sIXCJruXrQY6yeWnvwEk4F0vKvxz6pFX6azKcxBJoUS9b1S86LBFjZTLPCvRfOl9OFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=a7ak8cxIMh0/hLZl4xKX5ZxpTSUNqDGhqmOjcW6e9qDYd2vMO9YrgoXfbjTZIbnAZmLa
	 rKwteO2ApT/XxMmzKD/zeU+qJ0cchrZ8UH22utxES6wbkApgHAJGApBjZ5gp3Xf+A5M4a
	 Q5+ASHJpFSl0L1/Qh+m130qDMq3XM1JtV00nTZ7RJzyMLYa2sg5hE9ZrbLLmIfRAeVdoE
	 F0tFKF3d/ufNr7H+hmPhyLL13iN0vY5dicjNjRxcppVP/s/+zxs/hOfVLk4VqB3ypH44K
	 8FbZjO28F8O/r4ClIRaFOA8YudL5qRF2sHHhDNjqlyppa4A8ZH6LSAqUln4pOe+BbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30178606A335
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30178606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEDYL3Z6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so10875815e9.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796077; x=1794400877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=YEDYL3Z6VixFTTi2aQ1Fu4+G3ooQc+yBSLETFJPEYDRbUfbrnmFVMvzk4idoP0m/xq
         HAXfLuw4AyNe/DhdDuh50pO+Ye2UBQxQz+gI9bd003BBAyao2EMq8IPY0cxIziSjVKql
         FwKsnnxGv/GpS+xR4nHKQTdY35bcCYplrB2f24q1URxzOZG4SUgG8ux/xJ0xCJnfO7q+
         bJ506KJVp5VTdCI0HDbLOB74eMgh45Xi+C3ygm8V9AnUrgM//fiYLmsvOiimoXB6B1rr
         NIFPc7VV97IgVN67HGWaGyWeBkX7n61aBVX7x/8Fp9lMhtXZ/GSYwoZtlpJW0KiFzAfF
         KkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796077; x=1794400877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=S3RUZw/fRSWUUM9RVPsA8/6hjSTmvSDApovJV3UUp3GElaUNB/vjbhdnuQFcYuVS2C
         DEB5yITO6MDzibIKBZqtVQBI4raXbNUPPzofU0eYS5F1SArj/Vg9sObU5IHbMIuLm1rM
         cRCDUjI3ExQDeygFcMBHjRQjSOg1VMM8sAVME/Q7YUQiFIURbp6taLxFYFgV6My+5zYH
         OjnQHSM5XY6HFd+vXOVILf/q9vrHKhVoKn4WPqJd7CDhmUicFyDEE95rG9cmkaUD8RVN
         O1SUYd3dT/3c3s2nglRkZZ4RGQJLbjYYLvQ5xx80ndI00LaNGmeRR8mFWSP2Pv8kcc67
         cr5A==
X-Forwarded-Encrypted: i=1; AKwUvBwmpUb0sLQgHwj9S9QWrj3+HBzTnCJwUXjLcX9eRvvJt3B3OsHIObCLIfvA2QTGfp4gd2EwQNdLLFJnGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MlMMlRWcpxAHtj2pkkvqijrPDzLNR6Nmoau4Ak52irJ9atQJi
	GDlaotux1pNunUqRQ45WfyC8PjV9IJpMUq+8qxKGfnSI7VBwUief9kBS
X-Gm-Gg: AYBFou1prO2WdHluXrJKfow/+B+mZ7k3yxa/ANwXGGNuGrYfAuonf9/B+GqSCE2tlwn
	MX6WugPaVz+MgdXwU7M7g6yQUFjVGLzwXQ/jQwfWfyUSc+O1hZwxyksGaF7/YPUNIE3FJN2g7YH
	nV66QlqTTX1CBK2W/DIs9pKDFhixxnjM9raMFTyZYWzJmT2xEdUCQWoDzq3wxd2RgXmZtn/IC9A
	NbxqrLXVORTkoZseiyA64DgSLTwvaye7W/73Gl8XwuGfA5aNpYax3MawYxJ/puX21GPAobnf7kH
	J3aoXlnQt2q7UvaPOJR66UOnCKzZTZCeIGvqRGP+TXdcSAVj+mY7A95tRZwSD0ZMDmEatvdIAZ8
	pFRVVUSjPxe4kKR984OjByo117sCjtTUObeH9kFbikJlzTBrxI9yiA2deKmhAm56y9H9cBPR8cG
	rEQVb5CAocAGp8BtMxEnkSou02o6jttxYI2S3COpVoaCL9c4xpHwkYk0zumPRvJBe+w8SclWrJ9
	NbS6e7IiJ7VQOCYYqYtpyddJ6eGQ6xq2tdjAFsWZxRM6Gu4LGzczraZx1UdiU8Wi5xnj3bx1GvL
	eID4fowx7YwMlxpg7lM411KMJxrPUMfeb9rFyMpOvQ/LmvMMTJTnK7SEfkx+O/2KsOIREuw=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr348752145e9.11.1793796076509;
        Wed, 04 Nov 2026 04:41:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:15 -0800 (PST)
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
Subject: [PATCH v2 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:54 +0200
Message-ID: <20261104124057.240288-5-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

