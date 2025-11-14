Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341F31352C
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120221; cv=none; b=OIrQ3aZXgk43gV5aQZEMGklRoUbyK2Xk4xbGiKGnSCZBfcBhGxISMJy0uiEji/V+dDSIYUhfm2TjR69PaNJFUp8Vzg+ZDIwwGjHZ2SEmHHkQJoCeM8wpoNpP/Ji1K+Q8WxcWQjuX6y4TQbQQ566UCpaSR7N7GDxG9jCB/ZzcBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120221; c=relaxed/simple;
	bh=YOqQYfs4nuQmvSgoRMMjC8XlPFHhX1Q2biOJY+6ams8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i2DYul+B72SSUwbhoYUUnN5kMc9XRHkReWdHBVxo94eNTfJNoM9zXkL+t80moLOy64tddRzufV/1+hWJhxSFpPNy5DfcICJi/1+/sBPaUjyteKKP9D4DBWoLdhNswjqboLCHYNUbYqKme0oCIs5uLEJhxoy7Xqoq/6Cb7bs49Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cpvMrB9u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpvMrB9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763120219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
	b=cpvMrB9uOtnvezGl71IIiBuscG6XUv1nI3rpB6dlcqUlSg0WnWYbfVlQNDsai8oq8J4iu3
	PMqa3IhWzRThEbSuUMTJdX923CqpBMA1GVTgZpSyiOFjg/gn59/DynGHZ6dBb7VnuFK5zT
	1GXc4sNGZdUdi/Rrcl7R4X/E5oO7BHA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-k3Kbymr9OeCrqTKk1Get-A-1; Fri, 14 Nov 2025 06:36:56 -0500
X-MC-Unique: k3Kbymr9OeCrqTKk1Get-A-1
X-Mimecast-MFC-AGG-ID: k3Kbymr9OeCrqTKk1Get-A_1763120215
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b7352e034e4so154016566b.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 03:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120215; x=1763725015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P5NBgI6mcvaRko/BuipRaZLnCkAOoZG9QxXhEGpNPI=;
        b=SNnqcWm2uFhIfzR8/EPXbMfXHrLfqZmFnsCzlq/x2AEfCIx+QacBvSkSoXMbAZD8Xv
         66+7hZw/O/u/7lYwre3zyBXAjRUVNEZbg/+lsVN1NKxVc9D8ryplLUzESr/wvgGxr0kG
         EbrJAmqmkIhouaOoOpYP7mYhgAYnp5ZxvhJhUAv5AZzagagaM4aqAPiKhyfP6exL1Ays
         wZtEatrsfmmiPpVAueYoArI+HOqO/WQ6ZUyARZ4oJYkg1bTP11xejM2WRKOOop/ypjNE
         5yBxZdP+jlWnSwdr3XZFEqA8oxylhAX3AuBbOrMrAeAMJz6KQwcNuHMR186bNX76FJAy
         iu0w==
X-Forwarded-Encrypted: i=1; AJvYcCURhJUUO3YnJj4q53D/LPNjuLvoT6c0kqf0BKLmnEPND4AXFj5nNXgcsCCdt0rExII4bU0ABC0c0spCjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo6CByTksdaC3lG3mpG027rTvXbGcu9GV4dUgbIPw9Em5WotrJ
	cq+R7VaV5D+TmzExsa2Jhjq+O9QV7qL3ekgKetjlIu+6o6ugTvq90gWraju3B1mCDUJNUi+Nswp
	1V1ZHRzHM8872YH6yq/JvhVy3n1skzzwduEwvNNlpSPO5VQgBKJFjXV9P5BBXdYeT
X-Gm-Gg: ASbGncv0vWz2E+fTxDSQuh2lcAWne2g/AuDikEeSOCcMtSY32KWxKcP7kiZ7X9cyEMT
	IhrNHU9+o3P1upDFmwbnXu80rbC8ckl8Qui0l/VCZSAzwPQE4uGx8INbqrwoNahHeFnwSKmwdMg
	0XcfLIBjkB8fCl4KX0a2V5rtz2fXx5cLG6dowm3OV6JfxFBxsly0WIq2epi+UNxkLhAIr3v4wMK
	QXfzFuTeBHuXujiY44uy5zsICfFZ+7FboATmqvF2RWRURHnAbQHSCbQXyWj8v8S9+A4wQvdbiAe
	PEch+svpEgTAlOYp5WzFd99lSmIevocINsO5rZUHhuABfy9g/md+dUlpJqHkFJZpmwL4uUHJ1fL
	w3RlyQbRAPeiW2MzsYkwbnMTIiVn2HY6P2il3fWhMjTcL30ng
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241980966b.64.1763120214744;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGncWVaDUYmrZnQ3gSDBk8EIFCOicAB84qOiU3rPLLBv82jXFCsdviDxrNodVDC2Ot4XM+Oyw==
X-Received: by 2002:a17:907:3f0a:b0:b71:b4a1:b29d with SMTP id a640c23a62f3a-b736796a40amr241977566b.64.1763120214298;
        Fri, 14 Nov 2025 03:36:54 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41d9sm371942366b.27.2025.11.14.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:36:53 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	asahi@lists.linux.dev,
	patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to trivial-codec.yaml in relevant sections
Date: Fri, 14 Nov 2025 12:36:41 +0100
Message-ID: <20251114113647.231481-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KtDSzKVhsDRbsSeekOlDjzpc2FnXSTEbgRIYw4opMX8_1763120215
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4acbfcf11cbe ("ASoC: dt-bindings: consolidate simple audio codec to
trivial-codec.yaml") aggregates a few sound device-tree bindings, i.e., txt
and yaml files, into a common trivial-codec.yaml, but misses to adjust the
references in ANALOG DEVICES INC ASOC CODEC DRIVERS, ARM/APPLE MACHINE
SOUND DRIVERS, NXP TFA9879 DRIVER and WOLFSON MICROELECTRONICS DRIVERS,
which refer to files removed by the commit above.

Make these sections refer to trivial-codec.yaml, in order to inform the
maintainers on changes to the device-tree binding relevant to the
hardware drivers.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 836ec73c604d..311c418a76ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1770,6 +1770,7 @@ S:	Supported
 W:	http://wiki.analog.com/
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/sound/adi,*
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/ad1*
 F:	sound/soc/codecs/ad7*
 F:	sound/soc/codecs/adau*
@@ -2419,9 +2420,9 @@ M:	Martin Povišer <povik+lin@cutebit.org>
 L:	asahi@lists.linux.dev
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
-F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
 F:	Documentation/devicetree/bindings/sound/apple,*
+F:	Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/apple/*
 F:	sound/soc/codecs/cs42l83-i2c.c
 F:	sound/soc/codecs/cs42l84.*
@@ -18843,7 +18844,7 @@ NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	sound/soc/codecs/tfa9879*
 
 NXP-NCI NFC DRIVER
@@ -27915,6 +27916,7 @@ F:	Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wm831x.txt
 F:	Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
+F:	Documentation/devicetree/bindings/sound/trivial-codec.yaml
 F:	Documentation/devicetree/bindings/sound/wlf,*.yaml
 F:	Documentation/devicetree/bindings/sound/wm*
 F:	Documentation/hwmon/wm83??.rst
-- 
2.51.1

