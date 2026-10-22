Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701003;
	b=POE3LwuW0PQLXnnCEhmhXN47eO2fRC4COQQGFfHTB9tKJuIgqQ7MI+iAjsbm0G//gkwA
	 91cyo9Kdtm5HUClbbH8MnUnHonQh27czrGpFERSDnNQzZn4w0RN/7U81q6ajTUqDN3oJC
	 9C7KzIClkBGDKIxiS85wlArbbP2R+Bx7cL7YkmKqbZT3itJNVd+03zckSafvcqqSGuQ9L
	 kgBpheKtX7PxfzIJGBtM9AglFeTv6fMb8U1fQeeb7wn01It2eofTXwpiSZCmJTGDlmayE
	 5+2U8YjVegWNW5z/hRKhC28FyNlCm6wZ0f0MGqZlkyQE8BiQCwqGNjYWYoT/Uyj/GeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
	b=Ak8FgbYP75uPBcuWT46UyjKOKN/IN1ZkWfe2TardwdXKkd/1FbgwJZheZsCQ1APzAm8u
	 WcbjfwxDYXpS2c1GEQxCJIOFdMnWWG27S4C3Ss2jkHKoWFKFyEWcVHBm1G9lS/v8Z+S3H
	 6DREWj85Kfx8v7hdVU7Qilu9f6AcXC9C9mi0ErwQP/iWGgb8F/dzqnL77rG14HbZ+J5zU
	 jweJim0Hp6FLsW/RbSO1Xf0oS6Ew0ZFeJDjt1YJeePnoOAM1FD7l793vA6ZJ291d0Bq+c
	 GrEEb95xetnsVBrjNdB7aMhUF3CNb2IK9dUDGC1CoMKzl4lKQwWY3wEPyWUzpGYVYiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF360A2604
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDF360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso385857eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701002; x=1793305802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=UpC6z3YgoFOp+e9UwyTUdWVzTO3KVRF6+aoI5mDP5mAk8QvN0MDrCfReNgke8yzN1X
         /ryB9pG9Ww14dsp5cXojQQnip+PAON29ABfumIkpQhQJEHEgnLoU1mQXhRsKoJ0NfOwv
         H0gS+G9LCnCDh2v3CTv2etn0uCX7nGDtEysgJrkOli1iw10N4wNJ/7y0zaAhE0Z0YPW1
         DbIpRe5CrGrIjz3kmH4sY8LMxQr/QVImqYc58JS62pu3rfAAZTKszIxJAt6Tz4Xc5qFt
         vqyubXGNLBCtjwI6hesqjlFq+nZWfNi/cwZMn+CrlxAi9bYCAIAV6t/Msc3y30y5VUAl
         jK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701002; x=1793305802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=O/y+8Dwq47x9YZwMCLLqBYflVhlulj8pTgjuSfclSEwf7JvnKPAkCw3+spddUe7G0l
         f6NB6FoyjUgobZlc5F84waljyAlhLUWugoHHNckU2Cp6IaIvnMWr+kifbn8Hy1GlXd0V
         adYoNy+dJflDo7jC1W2KEJmWipaJmpAueoxPhcIlQLCSpmMOComhPwUL4X01M1sa4Xkd
         D5wz3KV0UjFJLB7AnqItz2Oj57g2lbxWY1cbbQ5luVyqWirxu0V+mHKL4Plpd/QvX5ho
         XgXXsOVyC7FB6p1RvEOMtSLsuRWkRZKoDDuiD9eVoiE8UKtHv666KTtOVw9dGf87ht86
         LLoQ==
X-Gm-Message-State: AFq9FYI+QfWcOTJHWRGthJsqjV4KtDuSPaVnOetCWxYH+3XFfGdoSvUM
	c+7z54t3WlFNIjibT86nZtfDoLfBIMmaPU9+F2ZCwNG9U+8GdarpcpWp
X-Gm-Gg: AYBFou0Xy35Rg1JsSk7Kk2pUPIrof+LUktOwmGWX8KP3nxTFuIfu5kbeLsGOTBzJbXG
	OrVZXv0OPnuFoujdORdtmU2GfxkkgBAkgl+jWo0Wykgy8M2XE8tGU0ioycY/e9tUlmrRXClHFae
	gd10l9QkJIVUxJylKN5tDP7FghJRIquNES018V9dqkluPJeX+e6htEZ2zgiu0FNoB/uvIBzlOFi
	a2FIpST0EAKUpRJYm/RoNyUu4jPMD73TOWUyuogD0pyXBwwkvPvgKM4DcSbV8qok3X6xPQroHZf
	Ot2haIClRGy1NI4johU7PGH7xfzvDOQYen3gIg3OqKRfq0yq4svRJOJMhL1nmy1Ftcutg6mrZKf
	U9Lm2uaSoIOX0FkDYvI10NzdMDtRouBVt/8IO800KZZNKHlqzFSpcwyAccfag30Fj2E8fB5mauc
	KonC7xWqfRoiT12VQtip+CPpan78tbJGK48e5GOhVfw7KecAeMD+KFT2ZEr90Sjm4qkIMnLHgLh
	aLLQxsWQxKhFXieGrOIRqUbUeZ24+uQZ24DnkcMRf3W2MYCqVPUHajoEfSOC6lAlw87f8Ob3CWQ
	TNYWuGvb2kJp3HIn3kEyHneFLSNZOf5/x5liuAnw6CBW
X-Received: by 2002:a05:7301:700b:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369d90e363bmr310924eec.2.1792701002252;
        Thu, 22 Oct 2026 13:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 13:29:47 -0700
Subject: [PATCH 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
In-Reply-To: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..1d41f582261d 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,12 +39,18 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
-      ti,hs_extmute_gpio:
+      ti,hs_extmute-gpios:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
           The GPIO specifier for the external mute control.
         maxItems: 1
 
+      ti,hs_extmute_gpio:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        maxItems: 1
+
       ti,offset_cncl_path:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:

-- 
2.56.0.257.gf7497c7d27-goog

