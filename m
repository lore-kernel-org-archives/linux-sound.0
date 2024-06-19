Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC9446AB
	for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808413; cv=none; b=j3hZ/GxrGukFMEJ8JMTo7x++uZxNCAHcdMlvVCF2TPAwCR1NoomxxvY4EHR7LxivXiuV88f0HT5ywVEShry/xUiRx9Eh79PIqglqV27PGlBiV6XMVF480Y/tvKJWP3OErCe0dSHZadM1+7WuDiQhqy2BdSXEfS6n6iMRREwjPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808413; c=relaxed/simple;
	bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmIoJt+DyqL6vElb1qB1MWYBb8dsfXPnZeHKUXnJjRkwH4TmxVD6KHRA/1YEDzEiuiHxbkukkcJPpyFRebkmJv+mRtDYFou3gWyfQP5TQ10KRe8molsv+tcDGo2Sv0mSOTgsE87OkU+cHywLTBiUFFwJ91XNdvPN4Wd4YpOhIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nTsI+o+p; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nTsI+o+p"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f9fe791f8so152146966b.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808409; x=1719413209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=nTsI+o+pHY/UV52Al76Mvnaok8JB+yR9WV+rPxJ/kqF1xOkNZcBSkaZpgCL+qVKmUm
         4yRNl+QQw4tP4FYbBkPOgD54Xx/a8iDHhBtTZ5TVcpWr3BROp5OriGeVGIr7923/TkJ8
         P50/DG2i15G4ig69wvQ0zHeb4T6GGFKMFGS3X1hHJtW36kwo/rmPsUoSFdej0iIApSu+
         qLSedkLzxqfAt7FLD2uD9JSFhnBymOzvV/wBta+prnro9SwuYSE9bMVV4cDRf1GVW8NT
         +E7s9ntcvcPilLOYDPdAWhadg1STpezPyH9qsAPFws6eQ1nYkvetx5TgaK80sL1PqMXg
         tVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808409; x=1719413209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=MATdhYFEXiRraaVihJdlLU4dHyjEq9i7a8CsvgX/bL038mscaAnfhXkZcUIktAoX/C
         NYqIreRuEACR32fSw97xwnr8qIvKzBGvCBsWV2BkxnGX7XKKO5wHeDfJaSusNTqyvgXD
         W55NpdMw2p8KUwd2yIzJgb1gv0cEOSuYYd54c55J1BJcJtaJafkcE32Tb/NEHmPhVBv/
         w6bi2hijVW0E7+UajMOWTF5o2TePqM/ttABqL7B3F1ryfWBf2OIot/q5NprcvahCq2NE
         /Zxw9sOD2kJ9rBZGNyBIXmJ+7KUjkSu7MyhqVjWZ7i/NktgZHH5Fe4VT5XmR4lJFikWj
         zqDw==
X-Gm-Message-State: AOJu0YyGXBC8IxV0hph2spPu4ef7RnqRaaDBCdB0C7yLCVXX9jRxUSk6
	44LkMki/46wG6gMNqyd9DIHZFFga2s7PIKNtTHTuAsWHr5rXCpzr60PESk+oHtw=
X-Google-Smtp-Source: AGHT+IEqbkgHHSkr76X0mYyJBfUpPDdN9txmatsoq3rJQUzm/9BdsMES9B/PEOaOBd6jfIHg3AGJ/g==
X-Received: by 2002:a17:907:1887:b0:a6f:af29:8d60 with SMTP id a640c23a62f3a-a6faf299090mr113414466b.2.1718808409118;
        Wed, 19 Jun 2024 07:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:46:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:39 +0200
Subject: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QI0i0OiF8VYohADgb8z89zwTIuHnJGPKpXLp4
 Qxcv4WqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURVjvD/
 47o1wFtO/MX9Mn1jUZZQNx3N0YH/5/OHi7NghWuFvjOuv8lbyavVmqO4XxRjg6FXgHm36BstV/oZGC
 9FwTaixQpKNpb/clIOQV9JdHIYNxrTLva64korNqz2oUrR1LTubS2zelRWDSvKOv22pXPdV3P36FuR
 NWQaB/IzxKR33NgNb1Jhm3RKmkozk1NOu924V20WIHg6NIAXnEXgM7ZJ1exJtFyXy2xre8YKLg5JYW
 mFSpJoOEDvmaAp+WnNu4uAx6Buw2diS0Og/6PHy9Y+E2Y0TsXD5to7mfw9mJ0/VLduchVm1B4qaGV6
 xhthu7ePjErq/3euvoslGHaSS7fj18hJgQozXdIS4fJsHlZEnCbK8loJTbceN0pk61F1mFf3v/218M
 MY6mgLtbZt3GWOMS32pyWUvZ2TO7OLlYMDmknXyJ9Ixk2raSlHDJr6NLmgYdMETXyrYci+hRcLrHqV
 s3+b32VUtjoJS5EeyteW4/YfEYKjMi8p8a5H1BswAYyApuSFGO8D1vB1ELkFy6WExEQq1Z4NOjN55+
 Wy0+TzDIhmBXiXM02y5bOC4OCu9GS1brAJ8apQNFKhDo+yydxwlfB49gxa+O1j7JWZIqKiCbk33Jzf
 CtZdlPYmWP8n/ZMTIRnBLo7jfgADK8r9FFrMsAIui/aDrKdOmJt9nj+mD19g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the audio codec sub-device. This sub-device is used to set the
optional voltage values according to the hardware.
The properties are:
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Also, add the audio power supply property which is dedicated for
the audio codec sub-device.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d95307393e75 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,32 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+  audio-codec:
+    type: object
+    properties:
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -67,6 +93,7 @@ properties:
 required:
   - compatible
   - regulators
+  - vaud28-supply
 
 additionalProperties: false
 
@@ -81,8 +108,14 @@ examples:
             interrupt-parent = <&pio>;
             interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-controller;
+            vaud28-supply = <&mt6357_vaud28_reg>;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1

