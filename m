Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543440;
	b=n/BH6hpyDs4ogHT/Z5IFg98hmfrDv2VdQdFqiFeYb1MOi1Dja0YfoRAFWrq61q6zZDBC
	 p2OCqIm/L7BsM97ti5uMwliDIjF0LKl7dYlVu4k5RLsy5hjYRasj1ujCdU9r3h2vq0ueS
	 vOV+TTlaIBmRNzmNUw9aKWnR6lzs/U7XgU+3MxNkwvc0EWEy7lGx6fYvqYsPHFXGRf79z
	 jc0aSgTeQGGE4s/nkuYrnIs6YMs+bWvcHjHG/ctLb4PkqlMo3nh4IJ5waAE/sPiieawV/
	 4Rt4/oUNV3zPYsgQeloZHs8INSRgKs9h1jsdmvQc9nB+uc1uj54LbTkX9MdP3aJ8tlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
	b=w63iiovHmmYOa/UVCfZahMCLvKWvrlJLYOJ11FkS7LKIprS1zc9rHay13sBhRU9+7CqU
	 yo8AWmaoDEMcRzC1BDPYcM/XvItEsaPnM/qebe+zJKe+khO3Fzzrs/cXu5kNbakVu8lnr
	 w65+ryYhWL6LefcnH9ujVq5TnAtNCk7cs5SX3zAEDy+UPao4sGLOhcbCGrvZw29pFOhsI
	 RCJs1TbFD0WJLEvq1uRaobAH0TKRrEfxggPtrt3tqxllccAybLkRr92cL35I1FvJJ9RA1
	 rUZvRrNd73zoWxxYM2KcJrBtySTe/q/xsj7t5DpjraldocEzrsm5F0PTDZcpqHLrX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D12606A330
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D12606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24760205e9.2
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=xyXJcmJH5wPsOL72onw5F0BVHspNB6fuOYfQQ2Wjiv+rYv3SQHyW6LdOMQTp8MEwhs
         kh+AalkYom2n6GOMe1KJUigZ4UrLRFvojVNCiq07f3Sl8tFSafUlMjsAG/lNtHO4UONB
         gkoZ4e3N6Ylz7HjqRMYK/Mv3bR/9WCzybaN/1056W+yV2Rd+74WmlsiBvQqK+nabX5kX
         etWqijTGGhorbsgh/42yDc5tNd4KCnkErlmB95Dd76Wrgrt6zo02Pc8n83UtgHc8V6zY
         TKTd4yT7eUCkdwBu2RLLwcx1qYoRWBdrYEOczbSraAtzkOs4IqknsrFLC7Rz7kftSv3C
         wJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=VDJJ3O9XHLNOIok0g3xpiiPp9VFMZA+ysXNt7qNk5dtFLbkET5+vEdyNy8QIlfJaLT
         kiKHjK8TYCybsS7jh3nWe0b0luJWmNbf86Ms5Et54V51TfGdtT5WDQT78J2zhJtXF2iH
         baiXlAqafF26/pcTn8ANeConzmQUWPQEMDePz4uEDkWP7csDlrRJtRvhKIwOGEsWhpP4
         WxB9ZM5F0XSPnOS6zPnSlJtKrjwoIn+9frso7QM7nxUsX0qxEN2/iCq2VYtZqwx6gdfa
         pmUDgvs0kCsgWR6B85gz0aN4t78DjFQFtke2a/chTvsWvtVlImvA6xMZmSvEe68GCboh
         n57Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjQbJ3vkDCfkB0HKYuMCC4BEyYT0cIMXZY+Yq+F/vHQUGAYRI3Zshi+NUh2ts1hVBNUC1MACCR+0wgYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBQKyxkPjoZYOc1pOhHCBAx+1hKe9zuRMbx6wnnMz3qqeE6K3H
	jyF0Y3Hik622Wck4817/urwYy66nSYN5BC7rRWFFdy7UiW+r/WnDXvbC
X-Gm-Gg: AYBFou3+Yo/dreGIjOoDMwKOYuUZFYobKKY69I3/dFeYYi2v6Q0zLVG2m6xFLwcw3S4
	FtblIbcJCFSVJsielllXxXRTNSoSv7VLWBETmstLicFgJLkqy5Fw086Xe98bkJWJNAucLzxBeRa
	x9T8QsJSBEgt3Udlws1RGqexGMcPi1NwN/yspL/cSWF20aLHRzR9OqPXEY46cygdYDBmqhpFdNN
	GtD3b19aNVvczfQaQr3NoykowTBxBqhVhV5VTPxpxAWu8zzH8ngVuMolZ9UoTNwJcwY8JeB3j7k
	pNe96Ncdqicb0rrU9ZERqCoaZddsenvBqNmIOIxHk7kmwqJQC0kOpFVEtsroYAm60h39w0iTqUC
	tPDJxRAyLma65kdHUNzizIzYQCgxy0tsthCFNj4UeFt2HpuJ1HbZa1yWd7RWo5Zz52FJl0YaeYp
	PtbMmSNn8FynATG185/N3i+megI0UqAJvNEylspaXzS1pQdmM1abUyT7TnY6KSBz7cYYwh2CZ+Z
	1F35T+iZvJ9KfAUXxP0obwDggSNDuCbUUYrctZWh8WZpV8cIHSZ8dj+zpWVYUZjvkLW3u3kx5aM
	+AWhK4l4O+pJmu+5O+0VI5bxODVCwGnduJCBZO5IguqgI7Yq7VjRU1f2RJ9Q8JNoDeyozjaeIC1
	MSxLh7Oawaov2f2rn5tZew0ZD0Ll2a6VvMcCJ7WjAHjqL
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr176697105e9.18.1793543437845;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun,  1 Nov 2026 15:30:34 +0100
Message-ID: <20261101143035.880469-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

