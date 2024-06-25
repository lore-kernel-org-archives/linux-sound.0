Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38D97344A
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 03:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719286485; cv=none; b=USZ/jx8LFP/Jja/eoBIwxcmbRNTFSFVO+WUQEzmasNqChRkptKLpF9YgaGLrrKUdFz8S8DXluZORvOBRO4APQbXxSZPA1UPxknySOS0o34LDritpmIaM7nn46J0iWjNJhHo/fgyLk2JgHG/KGUboceL8SV/LOUBb2JjriAendaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719286485; c=relaxed/simple;
	bh=v+peBGIoF57BoaJXnu6mP9weEMJ3K6JCIJ4fIrLUef4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g9FgwOgepmXdRMp9U+dFIu8miQWk2Bc+K/RsRmutecTpyeCG/etfYQQLUk2eXrLGApBqtpBbkOu30kCnoNryRVksIK2YwuZU1lc43fVxVqJl+hkEBeXU7H4ePlLRKP8Zr2nki8yAGDszreSdjuFZw4cd9zwzfedy3SwsWqe9PJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJC5AJ6Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJC5AJ6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719286482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SGswU3DecNZJwucDpQX2LopVweijkzu4ZQLZyP0kjsM=;
	b=CJC5AJ6ZvgbonGNBeieJx989TgVl1BGUNcsKM9bXGCJobwkMtfVMTb4H07xH/UHAh1DZIJ
	ARdIhYe+wDRWbL8AUiIkuUuPMnBFfKxL5Aa53CaySQY2M08MZBcgkAbkkhRJvWj1E+jUU4
	dWJffkNdz07BwyXlYEVu9eiW1xbJalA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-p4xS3eBBOvmtyqWgJokGFQ-1; Mon, 24 Jun 2024 23:34:38 -0400
X-MC-Unique: p4xS3eBBOvmtyqWgJokGFQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d1de50e8dso2314942a12.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 20:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719286478; x=1719891278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGswU3DecNZJwucDpQX2LopVweijkzu4ZQLZyP0kjsM=;
        b=OhNqa1ApQ14LiJM6dxsE1saWYnOL/31wA4a70jZFgS2RbgLOvtJoQkN/RZECNTxfeu
         stjkihN67QZG0yZzYpNSwio6D0UonYgH2Eb0cmXv85hdX7/6VDObPIfpXPXX/mHdjh9L
         8tRHE7AJ4aPWVSZb1Q11SEn91LCmHcDKRfdqQR+Ylo9XCLAZueUFpH8np/zxPAwGd2QU
         GrSzL1TsymPbOaZmHvxQQ2d3j3plOrND/EjpSUObP9sncpkjk5QfkRd8PCq90lMZpojM
         pMtjcl6gy4M69rAdSP0o4O8PCy4PSfLz8k5VhHZRS78uy98VJnDykD5u7yZksNyDRd9g
         JAUw==
X-Forwarded-Encrypted: i=1; AJvYcCVExb+nu+5PpvIyX5UL1wYs47xu2f7gTGneyYc2Agg3d28grmYcCBq+q0W/7lzYI7ep1HRYDXDYPKI9swBkUPSOaK3o2ZgzA7xJ0mo=
X-Gm-Message-State: AOJu0Yw8oPNYTjF/1QQnqil2QgT2pX1ro/nhF3nkDsC2kM9CNPxhZBqb
	/+BaMo/jOnfcWkMNNkFlvcIGK+OcmY20gIO5VaLaCjsDO4uI87XYXJEKkUPwadVEDebAqBiEhCV
	NS125sJZjXkdNSX7B1miEme0MEm6EtnhHVo9RV34/TC1p8LH0lwT1837ZU5ki
X-Received: by 2002:a50:f604:0:b0:57c:aac9:cd8 with SMTP id 4fb4d7f45d1cf-57d4bd5648amr4117233a12.8.1719286477700;
        Mon, 24 Jun 2024 20:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+5fJhMOObE/CLVn4hoZPAErdgQ6Q27QwDXYiJwCXvv/sOyyQAaUyJ2xoTNyaljeRrEUGIyA==
X-Received: by 2002:a50:f604:0:b0:57c:aac9:cd8 with SMTP id 4fb4d7f45d1cf-57d4bd5648amr4117220a12.8.1719286477316;
        Mon, 24 Jun 2024 20:34:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30427f8fsm5449736a12.34.2024.06.24.20.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 20:34:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entries after adding vendor prefix in sound dtbs
Date: Tue, 25 Jun 2024 05:34:19 +0200
Message-ID: <20240625033419.149775-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit ae8fc2948b48 ("ASoC: dt-bindings: add missing vender prefix on
filename") renames a few files in Documentation/devicetree/bindings/sound/,
but misses to adjust the file entries pointing to those files in
MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
broken references.

Adjust the file entries in NXP SGTL5000 DRIVER and TEXAS INSTRUMENTS AUDIO
(ASoC/HDA) DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77008faf25ee..0ee7a337cfa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16334,7 +16334,7 @@ NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/sgtl5000.yaml
+F:	Documentation/devicetree/bindings/sound/fsl,sgtl5000.yaml
 F:	sound/soc/codecs/sgtl5000*
 
 NXP SJA1105 ETHERNET SWITCH DRIVER
@@ -22408,13 +22408,13 @@ M:	Baojun Xu <baojun.xu@ti.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/tas2552.txt
-F:	Documentation/devicetree/bindings/sound/tas2562.yaml
-F:	Documentation/devicetree/bindings/sound/tas2770.yaml
-F:	Documentation/devicetree/bindings/sound/tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
 F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	Documentation/devicetree/bindings/sound/tpa6130a2.txt
 F:	include/sound/tas2*.h
-- 
2.45.2

