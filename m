Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D831F1505
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737475076; cv=none; b=uX5ZywNDtPfADfAuSABFnW7A6IoLkpgc6FbWc6/iRrd6+GGRflXMlv3/cPts+Vu6x34HVXshQteJ5fTHzPAFxawD4gK955pPOqCXuNBnbWPPExuE2qKJffJz/t1KxJv/7fC7oHskNIMg/Jpmyz+BCWPa/3P4CvLUksuaaH+Epcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737475076; c=relaxed/simple;
	bh=ug9oqEFxKECWa1w5zLfOkDoW5S1uZY3D4RE25ZdFb0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W3HdjIEIjHjHiIS4mVhuT1ghyrFxnl4Xeegp93Kdt+Jb5RFTztmFlXlCJGh2v6q5Eyc9eyS2KYJ5SIZ4Q/KDcniKv6V6ultCWUSSMWJfvRKc7UgXvHlFmHapENH9OQXnpXCV3DHgFdQnt1pXyT2hyZ/kqoctPC2aIO/ecww6ou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWatJpoH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWatJpoH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216634dd574so68206095ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 07:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737475074; x=1738079874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54fTfyhpY5NGW8pO1G86lM/RFbFMBqCbRj+tnJMdK78=;
        b=SWatJpoHZWTeWbzVJioiqAZKYGyLoZoDx1kV6xKbDgAMHabPvIQGwZMv/PvMy2hciN
         Lgqyau+6Q7MvdqGYoLzETlZl73oSGHp9nEpuTxpu0I7dM5CxQAtYVWvIYd3azVzGoXjr
         z5uvw/93smol883QdF431n2V3q8UIT8gSze9s4hHGIfMO7H2qMcWiNECm6/5w/DELrah
         HHeP1VkWCar2mvsAmtZbj/QXzbOJt4F0DNqzS1ZZ+kAcz8XrWuOAQeS/hij/Dr46YvaY
         +FKu7mk5xWJQ9lgzVEky7A9Go86PvrwCU9DnPgTBpMFo1PsCa6JRFOhtdHQQ9RMd6uOT
         Sprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475074; x=1738079874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54fTfyhpY5NGW8pO1G86lM/RFbFMBqCbRj+tnJMdK78=;
        b=vnyTs03OOdUDqLxPtYCIsu+MPTonOmuo+M3B/Z75Eackj11pOsOLNjL08xILsPrF7k
         RhIrXDG+cPal5IUqoV2fR7czYaSr+9o4b2GhzWIc7aFTZquYjV+I9fz+2Z+4MyXHykJX
         PQXOZjfRUIMySrKY0TFR13q7d2RfPiqN3Ge06SY91itN+GoAZE9TzCb22WDqBe6IllEx
         QC2i4OapSgvzV5XIoWFYmEP6npliBhJnCwxT1M45vJKPghEn3qUcu5Ti8fgdpIWeO4Rj
         KJcodny2GMuzg+cH94LTTw6AqxCWy46mjcoCy/OReLidunhJPRSzS/qvhIXwm/nvi/Ld
         JxnA==
X-Gm-Message-State: AOJu0YwL/b+u6zIiPToFEmB05O0sMw7hgp1ZM5tlsLxz4JhIVH55v+vk
	c9rKHtz/JmYQVUrvL5X78skPXW3lKFZloi7IU95D4WhwCG8m5mC+
X-Gm-Gg: ASbGncsIHLGVik7J02Lg7+2AXQNtSvmipB227qupBAw5C9GyiozIh2KCHGWSdbjr9G+
	fyFko9fJoQ81bj8LH+QH7LqbfAMTwVq8OzNvfLqkvcxIr/ghe7ZT7l6kyU7BPJ2hd7WY/EqbUGE
	T9uy/iBjh1wp7MhFJp9gEVRWV/hXBwcQcT8bhO4rv4nOLwkZICQAeYwrvWwmeA6nco3MxqwgJeK
	Z352F82dCp8VBHKhPJBnWvaTqF8KtwO5+lYNPaviG4cDylxrMjB7QYR7R5RVu9sVO9CnrIRxBW2
	qz5GBhWg
X-Google-Smtp-Source: AGHT+IGFzcsmrbsCqVMeXM6Pl/f+vZPpQ5YcVGEzFpWqGM+CBltkWa5CqFvs5KMdAxl92rI81igocw==
X-Received: by 2002:a05:6a20:9f4f:b0:1eb:48e2:2c2e with SMTP id adf61e73a8af0-1eb48e22cf9mr11410760637.32.1737475074149;
        Tue, 21 Jan 2025 07:57:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:20e2:e522:a533:a5a0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2a44sm9250929b3a.36.2025.01.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:57:53 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: dt-bindings: ti,pcm1681: Fix the binding title
Date: Tue, 21 Jan 2025 12:57:47 -0300
Message-Id: <20250121155747.3740995-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The PCM1681 is an 8-channel Digital-to-Analog Converter, so fix it
accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 5aa00617291c..1f0e6787a746 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/ti,pcm1681.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments PCM1681 8-channel PWM Processor
+title: Texas Instruments PCM1681 8-channel Digital-to-Analog Converter
 
 maintainers:
   - Shenghao Ding <shenghao-ding@ti.com>
-- 
2.34.1

