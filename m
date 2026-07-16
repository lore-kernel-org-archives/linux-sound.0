Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ECC3314B7;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231496; cv=none; b=U/e9uI1UWWvN6UUGiAnGeVugyutz4ZhkdokKVddHo0AxjiS3JlghXVN8Ox/W0gX+V5Q9Cjjcqo0HL3YhtE0kZML8/zQfo3ItkSxKR7SJoj0sRBSQ1t5oqBbnXg2UBzHX6fwEWqk0RfNiy3hENLRKe9CdhHLDboKFq5wS5TwXLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231496; c=relaxed/simple;
	bh=5xh8In4T0B+e6FRwZmqeK+VMgCQ2uzOm3zsUrgFp6WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDTIXYjNOVXwO9tYeOtH2I1SPNGONCCmh02Tzrz9e5UxXTZYQfU5OnglRJgb7MBXGdRz6HtjYrxHfCMsveEUoRYyW/9pL2s3o/3zPZEdhWah91TH2ukATap2ZJreOr1pu1q69pdLSclj3lwdUUKG6jWsgPfsgcYcVR7KV+3Kqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxX21xdf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxX21xdf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98D83C2BCC9;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784231495;
	bh=5xh8In4T0B+e6FRwZmqeK+VMgCQ2uzOm3zsUrgFp6WA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VxX21xdfWUAxkqGLKEWhTj1JyCgfcyw7ZrgHg1JngytTD4IzxWzvxNAS9Jo8Bpf6f
	 e/tMXmDadp/AnnUVQmT+U7cKqgQ6BIVfiYaGAaBFJdYLSLR1B+jPs2PiKgw2NxHwX/
	 ogT27IP3xjmugb/127y9rN0GyOnryJR7VoLXj5hnliiuadCRcklDWDsuq6BpwyKXnO
	 tQf9xUZgPUJl3wR/pBFIn0YQNLHZdht2EI86m0GtggJmRYyG3OTQGkPyrtIL6JSe1k
	 J/QZSePk7+6ohBvWvdMkWUbAgDa+bDiw89D3wi9qT7TfiyFxbFjh19OfyPXoQ3+Z+n
	 Zz4gYUq6slvIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CB9C44512;
	Thu, 16 Jul 2026 19:51:35 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Fri, 17 Jul 2026 01:21:15 +0530
Subject: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat
 pulse clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
In-Reply-To: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784231493; l=2245;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=T7zITenaLQ9Lrl6goebTesyTMddGvt+a0ZHdbi6L3fU=;
 b=FV3jm2e+mCBnFDWB8NR67V8GBPxEM1HNiCySFYpUWUd90ENy/Gnt1/ZMbvoBjOrRLUZdkL8D1
 iJRUnE1h7O/BcQnGGNnuZyaL+eHRoADGR+o7TyqDiF/qRc5E0xBNc2F
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Add Qualcomm LPASS VA CSR rate generator node that exposes
the lpass_heartbeat_pulse clock on hawi.

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase
and can serve as a periodic wakeup source for the DSP.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-csr.yaml          | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
new file mode 100644
index 0000000000..131debb04f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The LPASS VA CSR block contains the rate generator hardware which
+  produces the heartbeatpulse consumed by the Bolero codec macros
+  (rx, tx, wsa, va). It is modelled as a clock provider
+  so consumers can reference it by name in their clocks list.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+    description: Must cover the full VA CSR block (base 0x7EE0000, size 0xE000).
+
+  "#clock-cells":
+    const: 0
+    description:
+      Single clock output "lpass_heartbeat_pulse". Consumers reference
+      it by clock-name "heartbeatpulse" in their clocks list.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      va-csr@7ee0000 {
+        compatible = "qcom,hawi-lpass-va-csr";
+        reg = <0x0 0x07ee0000 0x0 0xe000>;
+        #clock-cells = <0>;
+      };
+    };

-- 
2.34.1


