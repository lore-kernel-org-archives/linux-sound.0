Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340064;
	b=ZhL32pjplDvUJ7+DWdnAaK8rCf+epo7ItUAYodr5h2FhsjliOmfWJp16UjuXNvRdkdw7
	 EJFUFDsjvJqXH5VvBnSNKzx62x7rDIKzAMx07V3bR1ghZwBIju8bTR+VR0ucy15kEk21f
	 JUM2/w0ZDFTmU1wxmNvTJ8c4YWjPRbqe7oysarD5ZdCAxRe097qgE5hiM+5cFgg8LVHzg
	 3OHWFAzV20mdxOr3dTrbkymPxNUcFHYX+9bWyfy2m3Mpfrm4BjOn+BZ5J3J4E7s9qgyFf
	 +/gh68SdKxFXGQNB7b0SHLIqo6e3nhsgYeEDgtst08Wo1O/9AO0zVOBm0BhG3DIFYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
	b=ITqgMNBVyXplEkxH5h8btcWQRB/sGJJdPFSlGVJr7Mfx1Cp8d5iF5hMXnmEbYasINJrM
	 deZxTw+NZs4lzd8IFy9ety+4eHVCNU+R/Eb/fDn8FVGdANPqt3jPefFYxkB5JfYL7ex6H
	 rHDl1vGZBzD+tD9igppafwWH+slGjMsyhL2R4asEjZhCkywCPyMvsbe7TJ9bqso5k1+VG
	 sugY39YlX/ehGOLxnLhq2E0uRqPLcPA2wHXaYl8DtL3UIqp6qIomvAtDCgNfmAu4HrnOW
	 B1hwxZQcFA0XJuDZYJzwiInDdnY2lZmB6cxDL0JPSPs8a0A9/rQ3SNgQPJQY3RcH2Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AeqvcKlm;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECF606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7ECF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AeqvcKlm
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1000595f8f.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340062; x=1795944862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
        b=AeqvcKlmO6WuW5/08hABOdRLV36YdZn1cQZDAfyiW0/pWBJ8jTutocF0NbZ8Nxbg0X
         R4MdFnPdIzRvth8dfq7if23L/h2AF7Z3ERsdquRYCP3/9szFrj9hkralLojo3BSIaxOg
         aFFkFqFzbjAmjrJu3ZPAQx48BxgQv+TAFp5SiHd1d/mLp8f1FWmR2ktqxTxgGrQgBBAb
         7fPimDdzgEl9SW5l0KxFkB2rAtp78KYaDG1p78ekLNVRg5EM5n8MEfkc3bzDvXqh7HU+
         rbFnpM4qYmr2VEAFt4J3zCxEL1B8rrpfj8r2dVA/AzYM5a5SVGnkQK8gDf4wZJ5QLV2n
         RKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340062; x=1795944862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3U7CcHWRUE31wmoeiAHLUkWdPGSZYVZsuRT2MibCOxY=;
        b=qEIhLn2SkCsJmMOkplZhtj9aKwcoz0YxYaDfi4xcuYoW68Dn6fiMgqocUcjFPRf81M
         bLAWXPMIaeaZkGttMn4syBeUH3C95/XaYumrBX+DmKCN6djwgXsuTNSpazOiRjAbnMWS
         UaQdtXFZX6gCwO7fCiYhPTCbOPVfeFEEArfgMhiQ3vWQT6DR5HK4ouxQvmsjytSawaWU
         8rFoEupaVg4mA6cG/3HZFW8+Ih75+oCJOnhT6hkVjNQyEMWrmcrysSP7x8ximYlQ148V
         iUOgPsiuix6HEBDfz2hW0wD4zb3gKiJO4MGsuE9oLPrQzAaJg8tU5gyYYVJgZAcXtS7i
         30wA==
X-Gm-Message-State: APuU4Z9qjKFffmgrUvGYAwH+Gr5NCHCifppYLudEboFMU4MRTuWNuaFD
	Uu5AzsEH8qbSICJ10dr72fpJFyffp238+bhff1RxDW5QDmlipHvfGGa2i0zwn54L/ds=
X-Gm-Gg: AZFdTZf8Annxe0drxkW4ggm9+4LZwP8EWWPkpnqUMZGBYYJWKC8CIzO3/FzbO94Xl9c
	lMHmPlHRFX0vPk2zJjlpcLmDotL2/7M6y9JTsvQF8kx3fyYtAdF5oUmHdzpG/8ATZv0GSrICjlP
	f8BZBSo58Xq+FCUNDiWn76SJ8cPZbVDrhYlz7Dbnmc5jnK7TBRmXK2V85Fm7YLtI1EGTUvFWY1h
	UoQ8So1iSWorMt0VNleDOAZLDSjZSOK2hDF3iJfZUWGUVyo72KFW3sQkQC/0TF2rVR7J6ny04oq
	XxL0N/nKlcLywFpqWXLUM4FExuKWW+n3VTkgc3+/TE1k+k0hBFDTH55xQS5/d9TuPaLb/A1Mp4v
	Ljkldp546xEF/9abFdf/edG0MDw03hgs3TI11txDFCOQeuU8xb5kemvgYBVObLksvSVeDy3duh1
	heBOA0s35+9k9HR7vqGirwQ/7RVWgPwWAxL6jyiQfDejo7zKzKnvxIx1n5MQghOtj0tnARR8u2d
	9aJE2vi+uGvkr7YQPD5/MFfhoO94eJXAtOjBtJLXZoqiZ1JdIJZ+Gu31Ry4Kj3RwZmk/ro3r2ax
	vy31WOnCFJm8Ar319JeDx2wd4IZP+eIuXKVi4wk7pjij6LaoZeRUgenfBfdhVQp+M5OjpCagaGf
	ioj4lEE/FRvE=
X-Received: by 2002:a05:6000:2f87:b0:4a3:7954:ac75 with SMTP id ffacd0b85a97d-4abb2910fb2mr15442071f8f.37.1795340062126;
        Sun, 22 Nov 2026 01:34:22 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm17007803f8f.13.2026.11.22.01.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:21 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: awinic,aw8738: Add AW8155
Date: Sun, 22 Nov 2026 10:34:19 +0100
Message-ID: <20261122093419.72135-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AW8155 is a class-D/AB mono amplifier whose mode is selected by the
number of pulses on its CTRL pin, holding it low shutting it down, as on
the AW8738. The waveform the aw8738 driver generates (2 us pulses, 40 ms
start-up wait, 1-2 ms low for shutdown) is within the AW8155 datasheet
timings (0.75-10 us pulses, 40 ms start-up, 150-800 us turn-off), so
the AW8738 compatible can serve as a fallback.

Only modes 1, 2 and 4 are valid on the AW8155, mode 3 being a test
mode, so restrict awinic,mode to those.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../bindings/sound/awinic,aw8738.yaml          | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
index bc6c6b172238..5ef7b800226a 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
@@ -14,12 +14,28 @@ description:
   (set using one-wire pulse control). The mode configures the speaker-guard
   function (primarily the power limit for the amplifier).
 
+  The Awinic AW8155 also has its mode set by one-wire pulses on its control
+  pin. Its modes select the amplifier class, its gain and its power limit.
+
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: awinic,aw8155
+    then:
+      properties:
+        awinic,mode:
+          enum: [1, 2, 4]
 
 properties:
   compatible:
-    const: awinic,aw8738
+    oneOf:
+      - const: awinic,aw8738
+      - items:
+          - const: awinic,aw8155
+          - const: awinic,aw8738
 
   mode-gpios:
     description:

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

