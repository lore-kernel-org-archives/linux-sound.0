Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85627367F5D
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805671; cv=none; b=HTQ6hSrjH2ACusZ3cEY9c8HIGPKMXBIuhEzanvHb89UD1ehvfFHRBqV5dU/A8k7kw3Tld2U+ITZcQFV75MgYnwyXBB7mV8Ukdy53gG2J1CoJbWHGgftvgQRXfTtQ3zV7CGjouoz+fM44SiAWu9LTuulTH7Gznt53Bkfdo8p5fX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805671; c=relaxed/simple;
	bh=81k4vDNl2gcK2y3l5OMOHs+wHy9IM6fpjbVqmXKA9Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLABMzvRaiGwQKTMD3IY8jXEKkY/o1JXq+c3u7HAq++5h4QEhjSKR/BpgCGRbfzAfhL8w7+hGU8X+332u9FuPc/PKgpch3oUtwycPhEjcepnJp92GnBr4bYQ6vdGihiWObSHByvEeeqdHtEB9QGd6GGgX3gW3jT8QebTldSCq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=V0bB8fsn; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="V0bB8fsn"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b883787268fso811127966b.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805669; x=1771410469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBzLromM8fM+G/3XeZ5Gq0URj+zbmif8mTrB9fiboAE=;
        b=V0bB8fsn35jFn6xl4q1t917TvmoMTUX5M3DMhisfkFqsijVFlNs+c0qLhnyrymJwUd
         IDOD4wK7uRyEt6Rms+daf853JztUT1NYmR7OB23cBndBzvqPxlQG66SxmQWtGzwc6FSQ
         dLasFBLr3c4qXPvzUzOLNAPdvGzB2wSgT5Dgl1cpw+r/+k0PW+ZUh9X/IoM3qS52t/Jy
         nbQIbUmXhhS2VGTfwZ8ODPMJKGcrA+2+b/GwYbVJ6ac86Ybk4JW8EkNqUAc6mihu4BZ0
         N1NCcJ/pViF1iRb/oWQZd6Hb68p/6RXBZUD6YJHtUn03CFYzyNCdhEf59R/Y9X/jVjqe
         6gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805669; x=1771410469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBzLromM8fM+G/3XeZ5Gq0URj+zbmif8mTrB9fiboAE=;
        b=DcGnWjrpd5YfyipgARe9xQsX7ZraNKQRiuc96Cs3O0/gARW5UBI5xyjCImaSJy8YER
         ZK9GxQbWQfBLIQaKkxt8/Gr0NVSzqtEZdELmYUnWuc8Hs2E3wQRo7yA3Lxy2UHenE/7i
         EAIgFC12/XZoeJAON6/r5MqbWIhBgMjJE3mKoBDM3zQIap1BxkyqOBOMcjS5OG+Quc4O
         krW+zPgazLMOTEhzALGm3b8gcGi8LD8kehvI+tt7gPFJzIjEl6SANUMpvrq1qBLvjQVI
         rdGc+6ESVOnhGyrGMoin4oavdbI3lMP2RAGQK1nXoaNwWK7i5zSWOtbcquY33Phuvp1L
         bokw==
X-Forwarded-Encrypted: i=1; AJvYcCVrK2Qg11+T5cPmDjXz8EwToxrMglVxpm/hZFPs/7Fagbhi6QTA8izuFFffa5ig+5lVq+XzB3P9HGWj2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWO84gQkLI/A7Z/2tanhStRRfr37VyW5iLYOF6N3IsQQHaGl8G
	jiiZf9BY96P+JV8LJs/Y6OynXgSNckGdCdR4zip6TCJBcyLOIImHXpVBr7Z69R8vwI4=
X-Gm-Gg: AZuq6aLXVjXDwjm2s6l6N7S6UQnEvdAxPenDVoURHvrPwr+KqYIqIl+nqLt48eSfPM3
	FEvnyj4CxtvFkOX+nLnCHVOn4TjAW17eqo85GBIIyDdwtizQGywjRB9uA7tkbgR1BcQrcT9666D
	xkIc6EG3IoZ/M/tahUE6k9ahKpF2GYJUhhbV57OVF+ZKsX3HmNZDBgX+7umW6zwr0w+II1rT2Ak
	392qHydGa4auQQeVi6elEISZ14uYk1xNe6aN2lM6YlSd8yL5vyMvgGvEW/vDQY550jqWi71ZDVJ
	Xd5CqNrmfIK9w7UL7ABcJHF9Wc0id5lNNGvqgnyc31MnVc18IfwOj0FkrN//4eccNjFo73m3RrB
	fQiSoLCxa1SO2KbMDNwWS/jYBk4S+S6HUO9XU6UnE+HTy0sb1+g2Y7skJxV6LXnqUMmyW/Qfbm0
	VelvYQAbBwiiDcE0IbpSnXi4XD6u8QKPXHeQephWMTcVtAYFDqvxJBbSU6d09k18RZiY3+FVzo9
	uqw
X-Received: by 2002:a17:907:3f86:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8f6adfa879mr131503966b.38.1770805668927;
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:33 +0100
Subject: [PATCH 2/3] ASoC: dt-bindings: awinic,aw88395: Document
 firmware-name property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-2-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=1023;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=81k4vDNl2gcK2y3l5OMOHs+wHy9IM6fpjbVqmXKA9Io=;
 b=+TuqGtOHKZbjaHLp9RSffmfo1Jo26IZ+ZHUsmxB6KmReKvO8wMOW/FZJTG9rdaSCMl90jfaEH
 oA8dZV13TgvCVcuXWr6ktGI8W9pKs1sPbXA8VJJpqU5TzlZQ+RkFJGI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the aw88261_acf.bin file appears to be device-specific, add a
firmware-name property so that devicetree users can point to a
device-specific path to not conflict with other devices that might also
ship a aw88261_acf.bin.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 994d68c074a9..b9abb10942ba 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -35,6 +35,10 @@ properties:
 
   dvdd-supply: true
 
+  firmware-name:
+    maxItems: 1
+    description: Name of the *_acf.bin file used for amplifier initialization
+
   awinic,audio-channel:
     description:
       It is used to distinguish multiple PA devices, so that different

-- 
2.53.0

