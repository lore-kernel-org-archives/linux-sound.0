Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972638B7D2
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919502; cv=none; b=N/yRa9OtE/RovCzvaSX3VHTZs7kr3i5Xnm16aB2CH0c7gj10IgzkqyKf0eECwprVt/jS7Gb3HcjbkF7zAqWkwpVqVvCBb2v14hBi1BSwXLWaGV1yA/w2TK6Ymq+H9KusgsHLyn/HU/RzLUSk+OXHGac6l2j863qpPPDMYymbCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919502; c=relaxed/simple;
	bh=G0Gm8t6IneiVYTkTeSCPBc6CjJqlMmdql/bqJBW4d+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDTOCHc5uOUMYshg9FxpZFRHKDMd+zZ20QLKIq12cSX/G1lGNtvamqi874wLAWPoVEfWXPZg3FyctLuwsDmoZXB2JFa9la/E0kgf80cuzbbspT3NtYqjxwzilF9WZDQ4nWApsjOZg1jJ40sIle5q6jQCP+6UodW8UU5VwIPs67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=IGN0mRVV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="IGN0mRVV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a041eae5so21103985e9.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919493; x=1776524293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=IGN0mRVV0NbUpCm4Ml5wCTsrjPdXouj0BjERPHLM+P7Lp7CbskHfqRYgUhE8AFAY69
         6W7ONTzFoml1i9t8o6APMvTuKJbfPwDCMlhf+vRQCIgLYr1c25fBp20Jmp4prSEM3ps/
         4oGrSCuO5t5nyZk8UX3H+1EpMo9rW6vzrbr2gusPmiAm893XWItgPE8sSAb41qKGonFo
         +uTP31sqntwcAMkbL79+G79EKcIDbcK5gD99We14iqS2rNf9SGtiEks/Y52L5EX4R83h
         4OCorpuK13a4sj6nEOv0r71wc0iJoMBuzAVMTo/nJ0vqfR0uEehxJ3tz8gCqB6jKIxMp
         axtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919493; x=1776524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=iJyVFscdzOMp2XdiEl20mz+ReuLfs06YcoKSMn3u50Yptga8PvsaSZ979CvYDL8bh1
         +ObWJpXae8hXKk+DcrCb3rmMJPs7xGx7s0Fw72ChIPmO+l0i92OOfT+X8TS3wvhAccar
         HVWRrsIz8XC72gbFPTAUgD8QNCGPIx12HvTWrIKOevPA0tCNvNYcKoWhc2RUCVy1a9ym
         SeOgGSHZQ/D1D+z5o00Lydy6mc2cHFAGOcBNYYvkk6S6xhbfajaURP8rPigPLmcZrm8X
         vKyoJ8TcqeiNMNUW2CFfdyWj/CJ50x6gi3lb4/GafyVl7SDMwIOW9Yr6KmXzoT4rcoDc
         3PQw==
X-Forwarded-Encrypted: i=1; AJvYcCXpwAIw1Q+5Hw2GwH1gK0B5YxYMm9iwIpdcJvztZZztlKVUZ376dBiHHwGTB+AEU6Ya3cqwK2kpisJbwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjsO8DwoSVQhxYm+EvE1Vfo7R/q/Bk2/n4JAAo6/WNqlyh786
	inqMJkv2wfFJJeSz0RVsCSQ2waQbJqfk+6cCWUgCBd5CdmQgCT28WPss5coiaayj2giBYFECd53
	OSdvdRVrS1g==
X-Gm-Gg: AeBDietEod1Le7Sozduoxlh6cJijniV2xE1AwrBr4zKFlAOQnyUCo+OxyVUqXdmlaYw
	vZyv6HVj6GlPXVL7je5k6o9UbqPgrH1Kr+0nduvgICiQ9EU5mdyVWKiAJYZ7HwHMsxJ8oMPSE80
	8MnxtwEOgCxDikEv/SwrObjdZz0xjYzTC0K8nQ/Esuw0nYwzVlpsbsEQ6kiLDaGd/69AwRqPF+k
	OhhV4NdovEOojNT+GC3PpSeD5uD31Go70/WbnkYOvmxi0gFWUQoxhdPgAiOxlsEKust0fKjTW54
	iLSNA9UOSbEFR0UxxFvVf5tSfbjjEv8MG1SSNz+3OAjvEFOmDvvrir3nz/X9RJKRgKZ8TxZbCz5
	rS1K9dTdaznsq/zC2/yA3D6v7+YSoVKo8YmZlXyG17A3mMR482zXg/Z0emv9rKyEwHGCns561pD
	PbhlAgfCMrGRWb5NAdBX/d
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr90911785e9.6.1775919492745;
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:36 +0200
Subject: [PATCH RFC v2 11/11] arm64: dts: amlogic: odroid-c2: add support
 for I2S audio input
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-11-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=G0Gm8t6IneiVYTkTeSCPBc6CjJqlMmdql/bqJBW4d+4=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkvqxVwT5VamJ1TGemSZrpGo//vDKYVhXsDtaT9/n
 d2a1vCyo5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABOZtYXhv3uboq/N4frukMUf
 t4nU8UmbXFJtuSO040y/Yqmh6CY3I4Z/mocXTZBzknidk319x109g85X2gJL3tnpVhtHXvs7SYC
 dDQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

- Enable AUDIN I2S decoder and all FIFO components;
- Add AUDIN I2S Decoder as AUX device to the GX sound card;
- Add AUDIN Capture frontend DAIs in the GX sound card;
- Add I2S input data routing to the GX sound card.

Note: in the routing part, usage of "AIU I2S Encoder Capture" as source
for "AUDIN I2S Decoder IN" is fine (despite the Encoder/Decoder mismatch).
This belong to the fact that the interface is implemented by "AIU I2S
Encoder", which was already existing (and named) before the AUDIN addition.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810678edc81fe1a8e3eeae69786e27010c..54798e5b631fdc594cabc5876ab73a3a85944ab0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -188,6 +188,12 @@ sound {
 				       <270950400>,
 				       <393216000>;
 
+		audio-aux-devs = <&audin_decoder_i2s>;
+		audio-routing = "AUDIN I2S Decoder IN", "AIU I2S Encoder Capture",
+				"AUDIN FIFO0 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO1 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO2 I2S IN", "AUDIN I2S Decoder OUT";
+
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
 		};
@@ -209,6 +215,18 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin_fifo0>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&audin_fifo1>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&audin_fifo2>;
+		};
 	};
 };
 
@@ -216,6 +234,22 @@ &aiu {
 	status = "okay";
 };
 
+&audin_decoder_i2s {
+	status = "okay";
+};
+
+&audin_fifo0 {
+	status = "okay";
+};
+
+&audin_fifo1 {
+	status = "okay";
+};
+
+&audin_fifo2 {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;

-- 
2.39.5

