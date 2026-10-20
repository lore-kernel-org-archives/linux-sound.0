Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484829;
	b=gk7L3cZzu1EeMFSGN43nM15S1DkyaeT94tRX0QKBvIVt1hghSKByrHT9cTByHNujtu+Q
	 GFCTPrJJFGctMkqYSLES04LMYJkDA93i1S7PjONKY2H0WBDy7eZlW7+ySBZr4m04zUncE
	 98EJNmJV3Hq3KFW4VCKwVTE6vbmsYL3nn3hEGtYO/Xju+3N64KxSYKSzKMRfx7sclvPOg
	 a4kY30bD2/jUaZRe2MA0Gleme6voY/fYZqG24Jt0KJskgCzt3BWaQ/9nVffcCVuFSRiGV
	 0gYZoLkQEygOHoNt5JR5yHAf9co0lz5AsJoTmwQYznqEFd2hTXL6fxz1ydSFYUIopqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sR+zDzMi9HFrsdnqSgy6DAeaNbWllNx84H/JCpIZzw=;
	b=w00S8wKRA/f+DdGLXLpZa5xHQDBY9I4FeVM26DR5d8eNr9oSa6T3KhJbaoB4w2FuD1rx
	 x19GwnGGvN7oXtozGECLc7e5kP++3P38wAylK8653gfj2/b7x+tONXUMiIS0+msOcByPb
	 C5HCy32Gydr2Kcm1xI06Hguwxknd52oevZwWbK9OBJIf8+kIwgyVvLNs2V8WDOY6mmu77
	 IqiqLrBPehh+kzYUJKFfELyJReGyitWR0LZuKtOydSKki8SZwKuwJ9dBVGVriP9laubwm
	 jO5LA3drivrUAYNN3EdXvkXsfBr8CWgBYotRR4YVQXgD0HPyruBFq9z/IXYpbVHZi3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QWpJ1hCz;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81722606A32E
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 08:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81722606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QWpJ1hCz
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h7y1OEuGysqMDVk0RdcCkB7ieMe6BbeWyLj9fbcPZIY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484826; v=1; x=1793089626;
 b=QWpJ1hCz7DVxdh8eI/vxGzMvZGTajusM36BhYONyWJn7DzX4PeNVzJhhbr263ZIUVEgQzzZg
 oIMhh4GeXy5g6sDqP5pPQmk7C4z9/doOLWiu9TCfOtabh3gnCQTpUxKucqjX1CfuyZhHbFJo49O
 T40/NmT7g01aqQuJzz+0ppi0i0/KlEBjkiSXpASQlEkDZ+jB8fkdaPej+YAbpgjnLHRYBClXXdk
 fai8+9knPGeA9uSEsk/7tdr/j71kTMgIBfefGy2ZgVq4acGRAuLEm2JE6LvgchdhOuddS/wV6+n
 dLB3M4H6M7ai/5m5S9jxTrxxMA9xcV1q1pMxg90tewfzQ==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55b6189bc852d6b9;
	Tue, 20 Oct 2026 08:27:06 +0000
X-Mizu-Trace-ID: 55b6189bc852d6b9
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Tue, 20 Oct 2026 05:26:23 -0300
Message-ID: <20261020082631.1509275-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082631.1509275-1-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
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

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0

