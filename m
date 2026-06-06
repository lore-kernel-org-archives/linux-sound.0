Received: from mail-m93152.xmail.ntesmail.com (mail-m93152.xmail.ntesmail.com [103.126.93.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5184134CF;
	Sat,  6 Jun 2026 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780772336; cv=none; b=IxpWdkAl9BZJ1Ic6la3W6jbzVs9s/kBfMNvEZUBbvcv5wX7Z1dKw8P9RQxf8gSTc1TTrG77NDXVM8z2MiDQRq9gkZfgc4et0YA+0nHHllCBLPORhU7X2w2EzN6Jy+XRKdq9yXYZOMfNXyZy7Cgg8wyedaqBXg4czlF/hDNavrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780772336; c=relaxed/simple;
	bh=m88qVbdluM64RSwLFqRXoNDpYWbOzjnmYJ02QfOknSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY5swjNuMb0Wpm2EN335yL/27RzrNaHCHA2Dnjij9Bzmyf2699rFeUkxWuP5TemqSDJB2YzQHgWXmmKjAJObz3em6bfv4XszFJxh2bQa5x0AaXf94Te+pSOaILyS37dkzUYvaTQuyxbRGNdeZMDhdOeZEN3TJawl8KggoDFuAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Z+0IW+16; arc=none smtp.client-ip=103.126.93.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Z+0IW+16"
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a2503a;
	Sun, 7 Jun 2026 02:58:42 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 02:58:17 +0800
Subject: [PATCH 1/5] ASoC: dt-bindings: es8316: Document jack detect
 inversion
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-next-20260605-v1-1-7f334e16fea6@thundersoft.com>
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
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=1048;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=m88qVbdluM64RSwLFqRXoNDpYWbOzjnmYJ02QfOknSQ=;
 b=QLzThrNUxw4Lby2sFPYgjJwtc3uBY8sxASveB9EWgaDru2EI3v08egBiKLZd+meoDy56kOkSs
 1KNuMUSQw+cDWnkpiGHB9Wh4Dm5yxgHLUvdf3NcbQ0Q3VRv5cumLUaK
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d3cdf09d5kunm343af971138add
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkNNVh1MS01IHhhOQ01JTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Z+0IW+160aYUKA3LNzoniNc//44PX3DvWK203KKzR3NkTJw4zVsWj/t8+ZWjjbn+GVyQex8ThxxvGojWcVVT9zakW9O/6XVk717BAodA04Uw73qw2HVBVAanNoNwKJLmYpb8qPs4Ta3g9sMzCb2j8r0hqAl7BnEZnhzUGKoC9rs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=bw+txc/ADse1JJow5q9GzM7efFpmiteX5+u/h3bA03Y=;
	h=date:mime-version:subject:message-id:from;

The ES8316 codec driver already supports the everest,jack-detect-inverted
property to invert the jack detection logic, but the property is not
documented in the devicetree binding.

Document the property.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

