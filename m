Received: from mail-m93248.xmail.ntesmail.com (mail-m93248.xmail.ntesmail.com [103.126.93.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AE1A262D;
	Sat,  6 Jun 2026 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780772336; cv=none; b=aiKiXEx2AcnYMNLRWcWzcMNUIpYUlAIaQwwa9PnG3wLMq1LbImd4UPXvyiBpARxBrhm/hnWXL4EhHHYHMxOyKLpLTUmGhQ0Oio0PU7uHfUeeqSvs1QZgINOkPUdu71/DPSoesECQkU//me1GX9x2egBiAuQEPChPrA9IySGK5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780772336; c=relaxed/simple;
	bh=RoUg/BXWhrYiziL9n4l4DX9+Tj0qADYgbnNxJUacDzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSUe5T/UjC2vOqo2Mg/OpYIpBYCIZdckugZTKElZovF5b/anol4SLt2+JhFZoxhecC7ApMt4+8TXC7qsnhixiMaCuqfUFxi9GhHT++JCJ7Ds+RccGP3ixHL9mInW7f1WvFWMEAzLlv+sKDmXaDgbHWlFbckWTwmtPaTNqY1NBhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=UOodSRfR; arc=none smtp.client-ip=103.126.93.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="UOodSRfR"
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a2503d;
	Sun, 7 Jun 2026 02:58:44 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 02:58:18 +0800
Subject: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=867;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=RoUg/BXWhrYiziL9n4l4DX9+Tj0qADYgbnNxJUacDzI=;
 b=iITATkkO4eVFmz3KPj4KFQsYZqOd+IIF86JA1rF1y8cLtvQPBmvIMI9x9JDIXDrDWZ2DIRWJ0
 +EcqTjFbWncDB/GNsegNvp/7719oku+lCB3PvJqEvOxb7nSkVjzxoO8
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d441209d5kunm343af971138ae9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0xLVhlMQh9JGU1ISB8dSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlLVUtVS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UOodSRfRzF+JwQ6RVlJGp7ITIZvZfvTNJLZKU2fVQVPR/4ULb2ZiTJCnLRz1zer8tqg6XVN2kQzIVY3ckzji9XwimZswzybwuT7mxkfdWscJtRqvJM49ibTGcGKVBCJzpV4cE1KI5F0l9CBn4Rgt5/rUUNS6Zy2jn8MLeKs1m9o=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=5IIegllXcDflxwC/097PCpDjxmrGTbH0MMSgTvWKOeg=;
	h=date:mime-version:subject:message-id:from;

Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
Thundercomm RubikPi3 sound card.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..d95e072fab25 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
+          - thundercomm,qcs6490-rubikpi3-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array

-- 
2.43.0

