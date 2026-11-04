Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796072;
	b=kMImcAQsCaR3DKcwv2sTXtOvUFXzChPpGkEnDdSfhbW+woFTm6CnSOVgStBrTKimE5M1
	 vUlqEbiYvkCiSO3J6BZdZM/ZJjw1H4jPykyG1CQby2XXqViHd3tPb4jEV6a1LFy32o04g
	 mpDYszeUX3WN8Og33Se+tySM4/9PyUKNetqSNk6Z0cSdF67qpKxJ97O0Qo51hSEzZS1D+
	 TyihnbAs6iU2NLbn1+MVnmH6Uqae6/GSu08W13Kz1FC7AGKBj3R7zmRRcUWQNkaMhpovx
	 DWJ4Yke5Tq8WJTkKpUGV230buC4318XR9L4udGm3FAjfMi83dn5f8VejMfXK926VOlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
	b=VnYCUZSSO5jISbt4oK9NoQJY+umnlimNhTJzx9/UD3GQFbRwspYbBurIUFWIGlbx/S2U
	 84d0X3XpplvJ90EVAVUp4tcfmst5DSY5n69dHDke61gHESjep/rWljChXJVWbbsuzaccr
	 MI8QBmGfrRx0pDSqzPXlo2tOI41TDPM8FMiccKBf+Lda7UqdmfxyZweqePVN2+7RGUtl1
	 VbYlNdRa5EW4Ff0g5C0tQ2LWcmT+SS6m3ropEdm60lx5UpAWSYu4Ug6XiJKZsliMNqNqu
	 ZkncIlsysCIsaUfNACupODpclR458bEug35J5cPCqBYcrORU7k364wdt6qC6iXWROdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D97606D807
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D97606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5736605e9.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796070; x=1794400870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=q38I+c12QN5Ff+QPekoyCZn8Kf0bFBhgnEHmqjpngz0F8BLwabeeCpMCt0d2t0ExEK
         IIofZDdHxQW+naBfyhbdhYK4a/oei6+W8Vynnxok+eQ9HpPBqE7ihesgtaQ+tjplk673
         MMDI95NW48fGyQP6eSOCzqkyvWhMLoUWJ9YjztVGahHBD6IwKzKcofVlRRIlE++lAYHS
         94BvzjIFU5XXzYsdyRVRIFyMuZVvDoYbigyDOPljOu79AeUlhfDNw1bYKukXsOHUdB26
         hCz+l1jYWxVeCFTr8o4yrFY2ElhgnvTIKUSc4t1F/qX1ibKvgvElAEDu7o+eipJgNqea
         G24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796070; x=1794400870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=MbO4Iw1bA3s8eAUlvZCQsnJ/MuRk5L1ocZSU8Yr0vdgrwr8YaW155EdOcMaOiDB7Al
         PMAXAN2UKgsa1vlEdSBzDeHR1n2RO20J36vbTnGnXDVzEeHm5YlaiMJBfrdXlOMuVAfS
         zlROpFmjxkkuFttT4QAlfHeQndckLGy+O5nZ2AZwJdDZ6RYjYsENiNXetpndC1kQUIiU
         lGbsORlE4ro66m/4zvzXqu/cknSL54no/VifhPcBt/1u8Zq0LGV1Jl6ISQYURc+c7+f2
         BO4wANKLpIWcdn6SJ+Fi1U4u3lgeU4bRPA3t2s49FtNOwnA4NrnVjqe4DTZ1XCzKVrJu
         WJbA==
X-Forwarded-Encrypted: i=1; AKwUvByCpI011h8zwFJJGWCLbq+M3dA1zVmahvyE8fowuy1ahapfS8QTC/FMQ260zWi2t46ic15zX2cMEwdDpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IJULQQDCi3pWbKULoTio6Hfw9D4VCCL+7y6y7n1K11I7jtdKg
	sEU2zXvd8z2gz39UOVU9vfWZJ44QcLhDI3n83XIlViMU1ELtuaXhkkmq
X-Gm-Gg: AYBFou3A9hon80h+ilHPZU27Ckr3nyL5zkejx4eH4blO3tRpXUYFHqWPk6hqDrgka0/
	VbZgfDJmdF0DxtoPdloNjKUVE/vaSVAIZIIzNjZn0MGZuClvKdqrd+siLRrxFb8uwQbVQWyQHqc
	GYsaG7ofM3w0AujkFsZdQ3uqYd7vdHQ0Khe9xNJP6VSx3AeBIPJGAgeTzTT2oWb1xHFH0GN4aud
	xVG8L0JZnx1hZrUeDWDc/QdPM+s1EYv0b7KZrh3ugibt7qL4yQ1uteGKJIfsEC+amp+0zILw0k+
	xMF8UYTmML/Qp8zt0MkuIAjnfKw6OTfZm3FJ3johgYmUeQJSUAQCmS0MlTlMo9DupI0WxOXQov4
	H++QTzf+Pc4xtsgE+sdw935RcQHk1NnsmR8tyx1WLs+Hi4pcfL8swy4Ug0BlG3kOY4kYcppgGbt
	0WThzmk4osUQW4IDl4X4Efq+Kn+efNnIZmjKN8wu+UnxTq1O3GxTkMfL3tTpZ8CsFFF00SoB9Lq
	OxdXczP94FC416B+WrpYA4QWM3kzN29ENX1/BvAikw+1ASdGUqSCP0xnMNPq2VPWzF8o1glBLNP
	AMSCpB0H4h7O92ccNKBY83tOTDHJgrRecKHCug0irL6gsedMTw==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr385065305e9.29.1793796070249;
        Wed, 04 Nov 2026 04:41:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:09 -0800 (PST)
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
Subject: [PATCH v2 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:51 +0200
Message-ID: <20261104124057.240288-2-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides two DAI cells.

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

