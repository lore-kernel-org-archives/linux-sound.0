Received: from mail-m3280.qiye.163.com (mail-m3280.qiye.163.com [220.197.32.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8122253EB;
	Thu,  5 Mar 2026 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690020; cv=none; b=MmP2CAwoY6gQFusD+NW9DNKMLu4efP6zPt+9sSeUsLlOgmOWXHZ4eKNRF0Lv/jj8UV9+1HOJ76TSnKr52FjNphL8YR7QswI4/KNye8qVCBz/MSXeU5I5NtadQ0fjjr/c0Vkk4JjMyiYL16WHfm8xWNE41vy/w2KkLknDtTXGOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690020; c=relaxed/simple;
	bh=htK+tuqbiLwKhVs5RgcotICcihQdkGlc3IGPmbUaGSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDRed2OHFR8opcRu4sIEKrwqUJzAY0qvGQNqjYSxfV12g7uxrQb309VeAIgj9yEyVJl3bCOeHyAOL8ibvqjohpCYANVbK1yBh0KJ08xPRt8OvScJbNfiL78oy/Vf4S13ZdkQTtpdBbtldlEUfQchN1B23U5Jen3I3me/ojqNAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=LOiuycAi; arc=none smtp.client-ip=220.197.32.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="LOiuycAi"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35d4e47c0;
	Thu, 5 Mar 2026 13:48:18 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 05 Mar 2026 13:47:42 +0800
Subject: [PATCH 1/6] ASoC: dt-bindings: es8316: Document
 everest,jack-detect-inverted property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rubikpi-next-20260304-v1-1-327595a4528a@thundersoft.com>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
In-Reply-To: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772689696; l=983;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=htK+tuqbiLwKhVs5RgcotICcihQdkGlc3IGPmbUaGSU=;
 b=0GvDCFePJyL8PTNDYK5nt4k+4SpB5aeXSZP4tu2sjI1pWn1JH/VTPYYjes2xOguTtxtFBILab
 tEgDEYWkj9UDskWX7MzNP5Dpl/c5nDx9ua52NKLaXOlf7epLoBycNNl
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cbc8a2ef409d5kunma04077fcc8563d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhkeVh4fTkwdGk8YTRhKHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=LOiuycAiE7xwo99RSQzFBPqqx3y/vU38qfkKOyfGbMJEtGGLIqmpwDMoz/oFZtMevtf2+IVcvsqj2huWyrVvW4ViwogzBQYOGXFmjTMXOXAIMBdyX5kj+ki0HkUM2MycSGuRNg9kkl+tYx7Xkg9QZsi/EEMVrXQBCqlhBadu2bs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=KTgF3T9PqdsFblKYJdgIhhhIXba0LQIAUY2AuRomzt0=;
	h=date:mime-version:subject:message-id:from;

The es8316 codec driver already supports the everest,jack-detect-inverted
property to invert the jack detection logic, but it was not documented in
the devicetree binding. Add the missing property documentation.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index fe5d938ca310..a0a4c1c99cf3 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -60,6 +60,11 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  everest,jack-detect-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Defined to invert the jack detection.
+
 required:
   - compatible
   - reg

-- 
2.43.0

