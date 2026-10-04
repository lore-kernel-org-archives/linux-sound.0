Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3A3EC831
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093902; cv=none; b=ff5AHyDhhWSJAg/0HRKqtbcRmTU15HkEmEyR2ZpFX9yxpcy3HnjEjmnpspNiWsznqZhrOYAWd5pXwvAgX24QdSBun5/dgZYCJQuKP39IUNcipG7744irl3jKcmy6Gi8cUrZo/q2nQUEr7yUt8Vy6NBR3HWXl4CJkqZClD6wtDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093902; c=relaxed/simple;
	bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcFNcHge4qL/f9fXp6zndUAasMi3FHdcazrsHLi0B8b0CoKSnuK3LdGmP77IjPwmkvwsK6A09cnKYNqiUP24N43vOtiswavbKrrD/ovhnp02Li6+JM5of2RPnRjCqxjlUpx0Un9SCAi7NVr4MocsTz06Ar4MmHvceEWpUckr6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUXH9Tqq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUXH9Tqq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e4a4e92234so7549175ad.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093900; x=1791698700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=FUXH9Tqqy4+V/J2BXYW0s6bQnwHBaFsdUebF3laxhqnap8pKjApMFX5pm7Atq9QUsU
         FpAvpESLLfSIRKBNbj5ToTmD7ftntfOQzyX1wgjt7ku5jQIGEHau045eGctWdRzCcEHW
         9r+EDIMDBZ0Lc64IuCMfv+1jxbMjzrNgTR+jRijzxNkoTe2g5EeWdZMhcObQP/xXPhvi
         D0zkJQp1Qvl6a/02ndQ7XwfKXXXITZS4InG5hKfAoj8/I/+PC7a4G/9UDMkvhDs6nSCS
         A5RBARpTAA2DrxgJQDhtXagYbMbPHhwsIPQYed3Rys8SDngl2O7j7AOjj94mLPY7231s
         ey3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093900; x=1791698700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=ovFAG2nzbrNHdE1aKGOzGYmMltm1Ku09SBRT2h8Nr2HZlhL6tKbiE6srb+T2dFPGHb
         w24ezhnH8E5+MIGLZVtx6tVWk1UiNFYJoRIiZbkQOlbBsncebCJZxF/at0UjQL5zbZ+s
         44DYM1lyEl/qz9gcke9uzLYHMrepCLIgBXQ9fn7dD/KSq9kgQ0i5uCA50LluTCg04hek
         V7gykZVcwRl8lw1TTQxqsb/oPXUEvi4jDf/8stcx6qW18Sh9jzT9MM6niBr7Jo66VTvP
         A18fykD8WXf+INwkEpKt8vaZmQRFOw+KnH5hlUIyvYswVdDvonUHj+ax2f6uDaKGQvfR
         JQqg==
X-Forwarded-Encrypted: i=1; AKwUvBytQaVOuzUPCQKA4CMtByduJXPBFeulkAy8dD2Z8hcLU1P5/i0yFsQEINcT2Y+32CvstHGULmDfzOyY1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7VyxYA5Xzsp7pQULuI6SYaCx9doJSaSns1FrGpj0rOA+fxzmh
	5oa6re41nZNwLhQO8yYIy0CkJNuRBfFJaV6UCiyDT6kKacHOLajoDmEC
X-Gm-Gg: AYBFou1Q0II9sJTxseKGCeYE263CKHhc+bQJJ3f7PjPdZDHh12dAJzDrwQaOdc28TEm
	ioMSE1kSUreraleTgeStnldiWmV1cW7HW50Ii+996xHPWhKbIDSaaTgI04ruhckzbHovhU+PTb2
	eH9AVODSvl6eJKOpCMY+tG3h2hLaIGihC65nBkVZqEx2Re39C4GJraASMYakmkgGMCvlXalBJdN
	pcdyRQA2r9cl7TfdLgdWPTlpTCMcy2IAHeAeDMmPYJgSShx00q9LBtDavgHl9IHD6QLaFobD6iq
	jGio8X5gMGncjTtC9c0FP2HGv8Im6Fxm2vS71p/Cz0qk2RINPfY6SXaeDQiWZgcNlevJT4ter8f
	THrGk5OxH2b1wDde/EAUPeSRMLvsXxoO+J46CJY556M+yuny6Pu3r5ANZfXkajW48bfUXxw2AkZ
	yPklj1vNEt/7Z8kdXJMiMW7U8XzRqn1l4un8nhveRkl7bXzniB86zdJBdO/RurqjZ/BMEDcxzkB
	KXW9hnzXCeHkXTMZutDvu9ijsTUqxbCuYVaxw9+5h18vD8v8dLKDLjZp+g7o1XkX3SuCd0qJ0Q7
	OTii7a+1zGefNkF3wPRawGDSsQPN3D0wppy3n03hW5KvWBbY
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2835623a91.39.1791093900190;
        Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:30 +1000
Subject: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RM2Kmkv1uvQWTh/GVrPtZXmXm2312b5qR2vFcma
 s/nKbo9HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKme4MHwh5/zmoP++ubfe22u/Q+uY2q/VPFuA/vh/VM9301VOuK8YRojw9Fnp1N
 arHpenZUxm2ntFt9WGnNK5VwTo6rAozy3h72anAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define #sound-dai-cells on some machines where this
codec is part of a simple DAI. Document this property to keep the style
checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 6c100cb36699..bc759eaadeca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -26,6 +26,9 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

