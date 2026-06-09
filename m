Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380A3B774B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022184; cv=none; b=dCmsrcxoYQOXApvmxcQf8ITMXYyUijHT6D8d8CsJoFdriw0fYo9FsIFYDyxHMXAEyf70vUnz90diikZ/oIpI0K+Bdph+GcyTRSDGSiu9S4Wp76rBUZQSFVbE4dzdtam7UT3VF/+2mYqZPXvdad7meH13m1Vqwcwa/hlxf6T1o8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022184; c=relaxed/simple;
	bh=yfzYmQxfGvQ/mzyfJdHs/Ur+od2hVjzLHZHfwLDtpIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCBqrX4LUEbgEVFYvqLkYJ+2oQP6zxyK5d49O0dCw6g2qxVVixXBp0WVOmslfhNXxUaaFDA6qyea4MDnSX3uRT57Uj3KWVhCwaeRBgk5DCqZnUsW/XWxM1UYD8sAw9ZKMxcPVKqpdKUQCkG2dU+RECgWO67q3PxpugPyfJI0DNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAfGp4yP; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAfGp4yP"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce65629acaso66095486d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022182; x=1781626982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=sAfGp4yPKxZy/AqwS1z2frQia7/HoLtyzvZdu7Vm0MnqusuOgHYJD05IQxIxaboExw
         SQz3kscMOUKUwnnRzFWn09hsiBWtykHxjMkMYw4GSYMSmhY4Xjq5eLFZ4yM07L7Lt3T1
         b0QI3JJuJ5sPkx+QGJC58qvcBAmtHGsN81TaE2avFu5Apo9xiIcwteapWU08GJLEKl0Q
         xHiaFTueCjwkuf0iOwfBJ/QUltXdgbAq0xbo5nj2k3DbJP4dHECccVnENQJdxT7b2aIj
         /KEd9+t8XuBM4/I6tcgiE3Coo//A31J7esmvl2M2zjfGcZT5VCT2+NGwnyY+F9b1SI3n
         V1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022182; x=1781626982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=ItjKloxWDPboe8VgslcYVm9kyTh4eD8RGvZH7A0Shv/skRBkZUdVfbJau4CaOh8xMi
         5ey05MAMmotBx+/X6ZyYmwHh0vM/bg7otu7mZe0EvcsXTgTuG3cK102ZC5g0wF7XGST5
         Z8B61dzYyTmtIm5sWogpRtKD4HVzFGwRUG7ykIFpeIXr0BvKoI2lG1/O+1TAh2tSIh9o
         zgueLnO3oTKtx/QI75P9oRkJ8yP2YBrqQgn2rBePaDtwcrXVRey0IJnLeElIGTW3a4gf
         zM83Ii6839XdwzScOwwtWe349gWch3vrCPJi6Twb0J9lwjqjhGAk5QXkKuVZ5Du207Fy
         0a2A==
X-Forwarded-Encrypted: i=1; AFNElJ9TnruYdAkvQ+4nmrSbQZr+tivxujtbH3alfPhi4XmXZS9J7F7mWZxOiKR+o/NWSFkl8HcKJnhaWhYIwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrZdmiLBI0ShwMdXC0YPe5SsLrL4gZJAAXgQKQNTVPlONPKvo
	RKx0zyx8FPcjUQbTaeh1oui36MVWTq75anhZDZY6gBtRKDg60lHZVegt
X-Gm-Gg: Acq92OEafI9Ic6WvsFnu68cR1b2YSBmGbFw1zlLQSNM4O7bZL1tlkw7iQT48tJTR7PZ
	mlgLHEvo18sApKenV7Txj1N/01yL5EnFzGBVTJo99X0NxdlC92Zn7jhpLdDT+4VnLbcazrfoXzn
	0A+cL3tRStNjzCJd7I/hXO1RpohQdOi1JwY+AsY4GIf8kzurJRqaYi0eP5vE9xcRRTtXISnQ8CP
	FJJZPSjzMmaPGywhjxNC2MBfH2vv2SqHEg6zuCthUMLO5OamYm03pNiDjf0XV4OrY2+TSzZSv9m
	/mqchx6KMJA28R9haWYWOnhgTDcbfj2f58itdvSQ2cXRqR0kXg1v2BWJ756fu469Z/AoJsB0y/G
	f5SAkQKQuZsho2SPwODXsCbGmKX8nkw9Aoz2DmgfBFYUPasSOCRCTtZJr4ycx5k+7nVoUT6pbPe
	t00zoTQmTTdJgcEx05KnBEtj6iWKuxjX871TNcP6AP63J8h7n7
X-Received: by 2002:a05:622a:4818:b0:516:e01f:523a with SMTP id d75a77b69052e-51795bf3cf3mr311258251cf.43.1781022182509;
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c4648asm210177711cf.10.2026.06.09.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Tue,  9 Jun 2026 12:22:43 -0400
Message-ID: <20260609162255.31074-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0

