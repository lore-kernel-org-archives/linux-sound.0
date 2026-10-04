Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E44175A6B
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093887; cv=none; b=SxV48KOYCjcoc46jlkrWukTvYk1O489ibHBqfBM50Ae8tcxFlrn0DeLdU+YO/8+aPpJ8rC9UXjTK9zLXHUc9HVwFmdShkJScYi+/VGAdeP6N9BJ+Hm42ePNkfjTipG/PLUXWkUv42DcWW2NWKI2HjRsnrcMHp85iao8RaFLR2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093887; c=relaxed/simple;
	bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEnAQoCJlhfSRyu+Dqc3KFslsKy5ev3vuhNTDhdJY03Guc+rTE5fPaeGwYS/S3q91rg7JXkl7pLAgDQk/nbF548NcaVMH8CxsBrQ6zI8M62+j2X7PO7RTDJtvWHxzcVQC/4C3VSuuKNaf/K+LdYTSs26vDG2jdSwBKqSrx3bU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPIFhkWy; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPIFhkWy"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso403466a12.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093886; x=1791698686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=oPIFhkWyf3zK/2zQ98swDJxNgHTHxqUJAqn7iV8dcSvkKhXxhHTUkPAWBL6lJdeqYM
         VICiJQ6guz4Loz0WbZa0MAQPorruJx2fAQ+9rekSrzQdWdcbJ1GSlX0CQtHVeKTtFA52
         HkkobioIiP+DAJnZceIwPB4Wmua9Ml4X/tDK5J+d87tu2UZAz0Jn85OTmUW4sYRaC4iA
         hNKd1xaAkTd0TaITwauzIoR6oHuFjemF93Qp5q5joXr2BJUrqHYbBlH3lY4bVYTKynus
         KpLF5oofFXaZ8wBkYDtdyZ21qTx/1qaVufwVbA/4uuM5eSI8HAZvwAcg2EoFf2K+bTwi
         z52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093886; x=1791698686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=GxWSXpV6+EocARIOpWXr9AncFpQFsFHEysgaVdhzf8s8fhvWqqpgijkAYZ6m3OiMca
         pmuuOZZUIWX7qG2ktT031oP61qFjE0frZnbRxHxfkdXZNxAr2CxraxMHY0eL1CNLizea
         A7SitjsSdYhNGmgWApNO+OYLhcKy930qsqrm404Eu7uM6BnBvggMCnqfaGA49LgmR1aP
         900O7M8K/Yd7zSJ1pBLdq973X9LiWmEdVog7LsG2EzI7Y6adQFhZJkIvWxoSRiDYY0Mm
         FR4vgfoOVNbTzpffZ3CknqAwbis2t2pSf/3yeU5olBTLf/VuhsAvZJa26XsyFp00Fqzr
         v1EA==
X-Forwarded-Encrypted: i=1; AKwUvBwC8T2y5oGG0dCx3x81EBhwwYJi2m9jD9fQxqyiUkFa8X8qTbOedaj8CPvTUBtHYMHFrhswNV0MKSvp4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIy9G9o1lbYAcfCYngfD8E6XQFwcZHvNbisWb8lTC7RSLtUdbfT
	+GNVvlOP3wJ0dSeOo5TcTdcQ07Wv7Issa0nF7bahbOtVh/Hi1BIQUaUY
X-Gm-Gg: AYBFou2ErAV6KyO/rSnt0JElO3X1rxXhS+/pmxH7ljx8+7jbZgN3TfX5wjNx54il9LY
	x5feQZrxVKqfe578dVF2oo6Q1ljZ7kA1j59kPLEU1uw6IkU1IaKWVSRE8oySWVmvz/tZ4k1PrNJ
	gem/ZLxXy3OUUXfy5e/axIjUlp87yiTydEIHvr3TaaN5fza/dbG4Eri6LrLtojJpzC1obKZlOj2
	jSh1Xup6ry3PgT4Jwf6BoUOqFb3hUl25UPboV6SJ3JRuHKQ6oeCJvy7e/Nj6I+1k8Hq+zFp9jsN
	h15MhM9JCZVpAi4l1MAHtPXNDBhuEX2i3AYlmiSbKODCAPiua5+g+XP1SIjQm3nYIgyQgWDw1Es
	GcaWJNuk0ecwquD1UWBOprGQzLmgSZc+3fkT5/Xee0NJKYffjKeChBz+NRXCqmLBjK6tYoQExJS
	Vii4uraFFQDEQX7zy+hSZ1HNYWWFXBFAFrRiiSe8ljZNLVubMQuwBR22q4AjDCpvzrqxDVbWCdZ
	m/1XKKbq5v2WWFvzl0c+xwYhvO+689JnbsV2IEksttFqjjGo/CZhLVORfipUqqKaZuQIkjenx8u
	wo9cEBi1Jl+uaEfY3bFNkUQMj2AXdStCF1cPUVDTmYyCU0I=
X-Received: by 2002:a17:90b:498e:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a79ad96bd7mr2514011a91.13.1791093886117;
        Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:28 +1000
Subject: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+REFZSpCqk53p5UcbNR45vnz18yDNnn95vKJH3b8
 6FvqWZ8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo39TL8D5gvGJ4vrVDcqH1N+NnXtIakiRrfQq/kFam4x/B4nZFhY/jvaNzDcCL
 TPdXm/5kfd+NnsHyZa7zjxaz193ly69zsXeSZAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..2637aa5f4326 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -32,6 +32,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
 required:
   - compatible
   - reg

-- 
2.55.0

