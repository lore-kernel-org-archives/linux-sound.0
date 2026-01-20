Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588544B66B
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921487; cv=none; b=iA4Pqw40hdSQ1orzwbKG07S8brBfwjIGgtGujzDZPr9K7gHid36Y4UVpRT1rCrV2pFL8zFTFyrQYor7rTMFAObaTMVeE09FftXvLa2fT7vsST1b79Kq0x7cCeSeSyjr9RuZ2SHhfUELiwZycExUNamVmGt9zHbUiebo0X3LPoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921487; c=relaxed/simple;
	bh=BRbaKg0j1YGfSmfS2ryN0Aw2oduKrLhHck+5ZVdAPis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOnzVNNZVCqOAWDoGvbI1fQA5qOwGp+sXCgHk5+Jq501LY3nYQAAlukp9cFfbv2vpRgRVrG7n+ou2cd24kJOsl0rIeafhYzsnwBqveHzKdhiimQmwZmNTqmQuhRsJVg59VBefto/vXgPWVIBFa0MrZaolnH9AOSrD4y2zqx6Mxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTb0yYc1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTb0yYc1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b874c00a3fcso867128066b.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921484; x=1769526284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=BTb0yYc1cl5hEB0C5a1KI7pxhQsPhGbY2W0eWvdxMTsg90i1vNumHjFO9q1czZZLjs
         v6gOhNLuYqn1YrZQjziZyG2Vxd2tJ4bF/E2bU8o69tnYvcNn//+IzLknSRXE4gsXedtw
         KFiLDgfogbL6Xd4fl8908Va5ly56jZE0R6v95Y1KHQ1XBWJ2kwgyKnP3FoFfrTmB2Kdt
         D9IlTUvRwRIdP74aOfEoQY89QpFacHauMkmZgF4WSNfDiJFScmK2lEWpmq1O0Q0/zDH8
         wc+j/y/LjCI5hLcjkPEyMLgTzj/AjN4YoPqioySJViMKF9MZ7ee45TaGehFMCpMXrVvU
         FJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921484; x=1769526284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=Yw0LHlsetPnvPN++724W0lKTIUnVfrOKHwObODXd0mCHFm2yTwxDQwoJqfKM6E1CLs
         9gx+vJM9UoQ9syrOZSpqwdmmsku7FLZOgu/xvHa4ZNeYFoWCxL7PpTqiqOqrak1ywW73
         abH7xZ43yytdN8bnuvF7hvtIz/XAHN3xBm3Tyj0hSnHlCV7QqkZIDXeoNyHyXdElAb5L
         JtogVJ+fvPCOP3bjqMjoYr4uxMFdeLGSOGKJPD2qPISVaf/IpUGhbQ7hVzzU89iKhJvk
         kvS3bxFh/S0NNbMV0fBGPyMw10KBkacY7QnCIRizi9Ag1sBI0FIwF/e+zjWpqG3mRaS1
         l3Bw==
X-Gm-Message-State: AOJu0YzWRh2ufaC4ZizfKJgfxIScyI43lyWP/ASFmFcK8fdy9jXOD6pV
	Fxl0te1Q6Knlf9yuAZ87+CMza9oMYX7ixs2P6qpoUWolCEnrdIb2Og5i
X-Gm-Gg: AZuq6aLjxfBtoTy3UA4O9rHv5aVqGlyFmQzUVE7Pt9eoxEMZrmyN+a4PyMqwzxMhl61
	F0Wg48k5x/pXD4Cgpz/VgfQrhSRvnxY5pnSFuqHfFMz/aWLIL8KRgIgNoE87u6g54moHwpdFHDw
	nRE1NOKM/GLac+nRTup1ilXPLFfSJeMyR/QDX6q3vyKYPH5DY/5Ns29DN6YkWCVyD9os2Nrytj8
	Eb5EdoGWnipAYTcKyjoMUoViVdSyXXWn/6ZVZa9BYfr9081ompMlZu3B8fqdrUMAZ+Vx6xAy8jx
	2yp40b9ZkUhlgaKuKQJzGkhCsx1wS0kzo2NDimvExYZMN2mPoJeg7HmByI2l5RBJrchwbx/oIZH
	5ADN/wzXBTU2104xVVoqEIgZlNovJtKr5/73OmkTBSPm2NRXjRxXP34DME0rBM+1rrfixh0i/QF
	GS+Z8k07mVYJT9T0ng8LUR15RWmLJT6bWEXZYUN8MPi/QEazg=
X-Received: by 2002:a17:907:8692:b0:b73:6d78:9b79 with SMTP id a640c23a62f3a-b8800261c34mr210659966b.20.1768921483413;
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Tue, 20 Jan 2026 07:03:28 -0800
Message-ID: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, the programming model needs no handle to the
GPR node. Make it optional.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 1415247c92c8..bcc265a742c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -63,6 +63,16 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-mqs
+              - fsl,imx93-mqs
+    then:
+      required:
+        - gpr
   - if:
       properties:
         compatible:
@@ -91,8 +101,6 @@ allOf:
         clock-names:
           items:
             - const: mclk
-      required:
-        - gpr
 
 unevaluatedProperties: false
 
-- 
2.43.0

