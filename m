Received: from mail-m49239.qiye.163.com (mail-m49239.qiye.163.com [45.254.49.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F26385D96;
	Wed, 15 Jul 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132771; cv=none; b=pNqI7BuW2n19Bq6W4Rx+T36zSBcXcJzRdHdVXf3pzlIk7EhzTDpwR79ZVOklfX6nXOkchL7xK9Kmq4qHO8FtMUoA29qVi1we+3zSecJlhzrYQ5nEEFMgqn9K1bbLt3wwZu7MvDCe55btjrHdvfD+vZYKj7E6M0M33sc7ERj08NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132771; c=relaxed/simple;
	bh=j59gmiyM0m9SloepWN1XApdWzUBj6iZbH6AyN59eoyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d03AR5m4rD/slfSXuY2BTdfxZNetrcuigFjk/jP/V8t7oo5Fu2bAijNqJ6DqIhjhXloTFTtiT2r9P1a/BriMSQEjajxfvXNQSK3Hg2Vqg9h5YSLTcvNLrOM6wSv1VB1GScBxoQCEdnNmAdjlojLD6EhPkEs1o7cOao93r8M3njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=PcKvA9oJ; arc=none smtp.client-ip=45.254.49.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="PcKvA9oJ"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2ec;
	Wed, 15 Jul 2026 22:03:23 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 15 Jul 2026 22:02:51 +0800
Subject: [PATCH v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound
 card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rubikpi-next-20260605-v2-2-67601d7a8581@thundersoft.com>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=1261;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=j59gmiyM0m9SloepWN1XApdWzUBj6iZbH6AyN59eoyY=;
 b=QocW0g5f9HfLcc8tfi48aEEUjDWYX/W2rNI6/7s1lwRXVcPeUtHtuQt/Xz301Y5x9d3gZD9JU
 HjlYty4scbuC+S5T0J5I6OMHqUlsotPfq6ewEhre4RjYEVVdcPMV9ul
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616e34f09d5kunm638899c2110b6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUhJVkhDShlOTkhCTUpCGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=PcKvA9oJUpnrUuo4ohXEs4RhSl5tGSTQ2duvffT69uscyb5BjUvbLU9GA4Fa3NJqLpyZCxxZZKapFkSRDeYYsuerd2KBOV1a9EvK8w8fPVXgjusfWkycpwlbTPQKcECHbak4o5EjI+97tlnq4TfxCn/M0BS0+slp7sBr+R5PSD4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=qY4Sy0cy+f1gtRrFtI0Z4FNU/zFBUpZVEYqjSdcrBds=;
	h=date:mime-version:subject:message-id:from;

The QCS6490-based Thundercomm RubikPi 3 routes primary MI2S to an
external ES8316 headset codec and quaternary MI2S to the LT9611 HDMI
bridge. This requires board-specific DAI clocking and jack setup in the
sc8280xp machine driver.

The existing QCM6490 and QCS6490 compatibles select machine data for
boards using different codec and audio routing arrangements, so they
cannot be used as compatible fallbacks for RubikPi 3.

Add a dedicated compatible to select the RubikPi 3 machine data.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index dae440ecab59..01bc494286fb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
+          - thundercomm,qcs6490-rubikpi3-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array

-- 
2.43.0

