Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD4423A94
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399284; cv=none; b=t18wCq5cGcMkMMkp/4dKuJ8e9GYzMb1/JfSbCzv4sKDdBK+We5MNn/DHUma8TnnEFIuj5nMYku+uDDFj5Nq38Nuk3/7JHywLSsp2tLEHhcdq+yz7DY8IRzfJnWLxnPL5tQFntMzSVj3iYFGODVZa+tqYZRAqzPmEr8KAL0tOlPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399284; c=relaxed/simple;
	bh=NpuLlSvp0rt7DE2FRksRcz4gv2u4yN/jMLTiXBFh070=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTSs0Viow/1+23B/h31ulbvmK30bgIrDZhMOKoY9BUFsc2OYusyq83y6Uoc+9q2DvMREqTixswwolKTfZdUbUjCEzQS0Cc1UsdQVkiB5yRo8Io0bzFaKKzwapRPbk/nCn5wbc8iWBn140zpt/e+3n4lB1hoh2E+lHDLtFh35WhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYDRu9Bl; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYDRu9Bl"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso24301445e9.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 09:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399283; x=1771004083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG1BWUJ7TOLktFU2J54JTHa25r13uiqnW4MFnSd73FU=;
        b=RYDRu9BlkXYIIJCpOEfJvhBKgylOBGDe+7YY8VIvDB//PpqghpwxYmtl6LOESxPtgG
         kc2ip49N4wAgA6TdGUBCH+MDgmn7WwMUz6fZ79iKRmp/JN/TOBzZU0KtCRInDj2Rr71i
         jLTlLQ6kGVzDRSgowMlMZjOmTQNoy4+ovKhj8kw/mQogcC03c8nQk7ZGFvnUMDeBB+rZ
         VYm/BkNIiUdXNpD3FUT1IWhg2c88iZvDViipLPGfrH7dzv4rlbcAnh8rmw6l4J3T/x0H
         l6MFco2YsmC/zjXbW5DUMCiHj+P3SRgE4klPOYlMhpyjWkIlicCyRkqItECyVTsbLcEs
         xwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399283; x=1771004083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WG1BWUJ7TOLktFU2J54JTHa25r13uiqnW4MFnSd73FU=;
        b=OogCp1T14HWezNprY44WW2SU/rBl0fhJ6lAcynDKYFlV4n1vrE+n6x1oSNbzo4uua4
         TYalldOLYSun1gt2UFSjelmSrE8sjx7IPNmKy+uANqVKe7qI/ovno2CiYp3YYzWimwHJ
         ofBiOmulnSRXW2kFc4l2zfZb9w3nu3b/aEvXUM68wiOXVX8S6BKBEtA9rBgwU+uoAl6y
         kFKK9ZfTqDwoM6rsGDwCVMC6QgjRyZQz2xa9Kq0kzMJxusKCXc6iwOiyWNA+iSSiBLj9
         6QVTk7FKjBOPU3k63ouOt4QA6h9ag5ylq181UdQesijEMtCjRSDoRkt4UAvCfTy9RZWh
         QkbA==
X-Gm-Message-State: AOJu0YzOmjE7DdpASVm7UTmBuZ20+hjaVYAfrdfgh3lCfKB5Xmf22I+A
	/Jypp6LuAFoMF7ZFhUcSRDiMKCl+euMtS+wN83iZVeftzZCAePAOLOfC
X-Gm-Gg: AZuq6aJW04+CgRIPUrxGVqsQZvgIPwQUXoq397cvK7OD8VEM5wRbj+W23VPoAZHn4zb
	UjRXQbNhBPjrzy/HzezRqm/y+M9UPkNXfTP4qwYrLGhMj8OEK+oD3Ha7MkFwHioW4H89nf4uKaw
	AtB/RHwz3O9vI1d1L3+OZSNeh7zlhscb921ozvPSapEykqET0rnh0deK4XVU5VnZEO4EcH2Zt+L
	jIQKK0ZRuAfuaCO/FNtd6TRXO/i4zy7iEscV6AFZAshr638j8Qt7eO1195ylcj90ZoEdH5WQdf/
	h6dqSAvZ9IJiNVu9Espk8ZR98M/4VVrz2LcWwgzvSMlPQbXQxmqxCoI19ZanTeu29rIDB6Foqvi
	uEt41VN0aTaZqJIgMl6ToqLRU8CEJ4/iZeH3bdzVBZmhbbDx3ZUxst0HNrBNyysxE3DeMgnFitQ
	WF
X-Received: by 2002:a05:600c:3588:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-483203ab7b0mr59042215e9.7.1770399282694;
        Fri, 06 Feb 2026 09:34:42 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:42 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional board pins
Date: Fri,  6 Feb 2026 19:34:22 +0200
Message-ID: <20260206173423.145954-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document additional board pins that may be used in routing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/sound/nvidia,tegra-audio-max9808x.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
index 241d20f3aad0..4957645a8e03 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -35,10 +35,15 @@ properties:
     items:
       enum:
         # Board Connectors
+        - Speakers
         - Int Spk
+        - Headphone
+        - Headphones
         - Headphone Jack
         - Earpiece
         - Headset Mic
+        - Mic Jack
+        - Int Mic
         - Internal Mic 1
         - Internal Mic 2
 
-- 
2.51.0

