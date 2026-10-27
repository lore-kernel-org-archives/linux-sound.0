Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102458;
	b=GlaLjk2Zu7sYLEbKWkHwiVbdg1K9pnalTMmR/atimjbIWfzSUNRjCgpkTfLjU/c8Lcis
	 3/ZAGv93D//ZvUeYQ8bD/LBxyl4Aeo7kFdfLpSqEnsD2iF1RAFYs0zMkaBSlQzWw8yG8i
	 StP5WlnRK+LVzY9IzQWP7Fa1C5yt4SXXtHA+7ycmocjID1ZHZUhLj3yFoBk4TO35n8r18
	 s6t3DsvWd9hvXemGaAS8gAZWH1RRUu3prhXKPNVq8x/r/vaUV1PKaYpM0u1AQGE85xlww
	 AVkge0D9jzAVnX6MgSjY/M/gCy0s/JWgMIz+sBJbIuqnZK1ii9FHcRWn8iCCk6qs2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=0trVFTI16L3fYsHvOJ6skOs9zIZ0K5+3lkLUME++WE4Hf0TDnVmuWrxqm9Y1klrcbFzx
	 vnMZXmwGMvl+nFmHFattjmvI2nnFrVCw6My8wsWtLzwENOA4P7E2RYp732I3aOynNtf0k
	 5n5JEVjtDVjH8HrqZDcRE0q4QnKKbvv2OfD7jBarLkURtxY7U2JYN5UcW4fQBzaljOEO3
	 +nGWf2rlIaCLT8F8LPzTkgIn/OpoUa4WVkTJeIqKo4BiaVn7eWwH+mkrtGBUdSoG1Q5R+
	 NSMvhDfOhwf6yNi9djxg7uVbN9Kt20qInaxhUDMSVpA1Eid4EsjOAJsUvm1tHOQdsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13620606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13620606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso4356302a12.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102456; x=1793707256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=J0njOPL47nH+nuOWZgYQd1iIoRASbk4F0ijanhdpEKFSNwiQUSYj1A/63Ui9POlQu0
         BHjUVxBBQGr2/xis3Jjrqd+yaPz1vgde8hZlyQtGuAzKbIZmwlMvvV3sn1uWuYHLZ8iX
         r8qkYOLFyl/3FSZSOncs0badumBga4ckaoy5sce4lIpvacvmDe6lm6noQm0IXPDLOjlR
         YTRxUPlVjVk0UelR+bqruaPbbRT+Y652yOTQrFQ+aSbpoZA14e4lBJZr/O/BEAkV5Daf
         PusOj/huYVTguhx3ejtt36Tfzg25l9r6A+r64SbOEfDLrJZE/bowF1L7pN6ero3rSDvd
         Ajew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102456; x=1793707256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=adMObP6/o0Qg+qBB84QA0agblOv7wOQMwaAmS6c8QYXASiaRpd4TnLsdNSnuy+2LoC
         i5QBeCDvgk3wIzemc7U5biomjGAaKlkj4Xi9tzROSQRPMeBmA1rHUSOY2It0C9FoaEj8
         DETCVRZ+WHh+8rUT4DAdtUspVg1HLJ5FPbUJh3tOw4yzdd0VuWzzUXwxLgRArGZdKC1Z
         R+syhtZMymjq7ipAlOK76pm9izNPGoxaawZIb0XN4T84QHxY/g5DiUM7HLXiEzWCKghK
         i7G/Sevn6mmKRl5wi0blDGp3lOvwuC+4SAvgY6pmuptDG5js7mpXN1K3b4OZBPAGLK9v
         WUmg==
X-Forwarded-Encrypted: i=1; AKwUvBynulKIcKxjPMFb+SBRhJguuiK67aKPftHYO938y6DOCs3K8yN34bAIDm86i4WdKRUUAQaErLZYWAVaYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgOEIDr5J6DsBZwpiDBAlwAsQ7sEnWqG02G3Z7mCu8TsKm2i11
	jVEn8yh0aRUsRgV/fq8nwdKtNkFn0UfV0puXlRsJiXL83KDX7vLNRewi
X-Gm-Gg: AYBFou0sqLrJFatU70MMtSjLTa6qyeXPLRtPaA9VXVp3FGHLL9GMJ2Td8XlNRfxvpgp
	WO3G2Q8E4nSNXgGHJ+hYh4vZlxO95asEuQrZtARv5d3m2GxXLUhapzH1VVejyOFSl96U2cNlpeb
	EIj+5rxBtyjXdVecSQ7hJmw4cAhLcr1XhwEOl3tGomq/tFff4HboMQnGrWbVIQTyIvq9WbP/lIF
	isX0A1rznymryUKUiopporO27xo2TQzyvbRE7/n+mr+rS8PlWJ5faB1DLpC0dNFxDOpfZHjcH//
	AL4bYIVbw57GuLoFfVXdtfwzKcvAnMN7vMGYOV6gg6Sive5F0b7TJuuewZDSAIpjMLtUhVO0NqA
	zuyuZaMbaMX0gZOe5cMaR3slKCeYosQmbtEsm0W27uvmpYX+pbUFY3Rx/i1I7QXtf1k+MuYIqJE
	fnjPJ2pWTBswgK0uBpW739lPBMDDrHmbHDvfWjn+h8iJJZdU0MUn7yOGH8FL2ofaOL+ea3DChxb
	jb3rlQpGDpabohitbdWijCjM08RMX8SBYADQZRKpSseK36XV4jvJ3FSWLTCROEAjaKk+aWYvYah
	qnyzzNgXP5pRfDnVXjX7OYSw0rBKeYAZQjo5FmWT8VPIFOPVjA==
X-Received: by 2002:a05:6402:4142:b0:6b4:8d52:ade2 with SMTP id 4fb4d7f45d1cf-6b48d52b5f8mr498029a12.41.1793102456264;
        Tue, 27 Oct 2026 05:00:56 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
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
Subject: [PATCH v1 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:15 +0200
Message-ID: <20261027120019.93611-4-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
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

