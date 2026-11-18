Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036693;
	b=fgUGVrIohCrXhgQFqNsOslaSzB5DmqChzLjn/a80TfA2rQtL8S+jB6tqkrdCoXDOT5sk
	 PLIuVNoy9jZO0+4ogQ3Lhiqu48eL9/ZgPIWdCDjGj4eWiW0RG3bDZHAhVqjGGhhscLWor
	 e0crxmy5sWGHvHh72rbTFMG0EewIR5uEqcW8pDxHU5hccIX2uZB5eXYlTHJ0O7/xI3ywX
	 mX5VshRRTOyrHmv8lwanyfJKBHGKmSOIZrRyBJ4bG2u8eH3scv8leBEb+4GRfEVT2YgDu
	 6OmFgw4IXRITIHqQc5R+ZwYDPhIoJOLyRmnwkpIS6we9fzWY1ih+denZaMuCJh0j3Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
	b=hgfhIK27/4TmLGi7+lrEiAVIKXBZEDcOOdg7+kHcHcoiFozJjBPZOL+TUcNT5y2TPIEW
	 9CkmGFd0tQS65FZuKSNyGCS8uOKushUjR2KUU962aOQwl1hZFI+QKuDQOuEm+NX6zwOf6
	 8WzsIGjzBJ9Q1JWcuyaHN1VHVq3lzpZ2IPinDJGCRnXenMCgz41R4IppqmtpXQq7slmmy
	 /ewmR7xKzD4XKRqe92tZMtyoLMHlkCeaxMG0oDuFAtEsqfD+JrNl7SFpGR9yxsFWRo+yY
	 IX0W1JGHqXeQgg2P2rF0Ot/QmuiRNC3QDzAsjqeSKqXarYGgrzDSDg+AlTjrErKx4tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COdceWXC;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE51606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 21:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE51606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COdceWXC
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2353553c88.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 13:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036692; x=1795641492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
        b=COdceWXC1oh1o3WBBgewEsNco92OICaTqVnIacXcPxsH5zYtwtdhg+uwnQrB9fqxqB
         g/xHfyRSnGghl54HHGs9f3vY2LQahFBzTBRY6tQJu46ysB9zMQsXdiqL6v+zg9smlOZm
         0J0AEzGJPWTDRw2LHN/dorK9Lvg5NT9Ne9hBJOMP7ffNNIlMGPMSR0u4S0yWgMHo9jUS
         iHHJ6AtBIR3otH3Cx85uE098MAv1AOU/WO6xBGvDp5uzuADZhkpWVrOdjejG76SQlgtU
         JU73EyAzRY+rO+V/ZgyZNU4xzpYG6X56E0QmqV3SoVfOwpPpV+rFTczzVYKCawS945oY
         0zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036692; x=1795641492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKlJADHwH5NqUO0o0wdmoyXzEqNGvmRzK8dmHnsCwl0=;
        b=abu+KZEQEbI+pxfMwUmyQci7lt+hdoHNNvPAAf4M/g3XGQ8z1sMnzqG/VkZ4LNJOse
         egIceyTS9SSEFHuPLW5tdJ4SVfPknuceO3vtDY+Q/UAOCNZ8w8vzBwq+doHGtbl2Kmyf
         AljgxU/hNcWzL0chYMAPluNO70VhYTiV1Zxb4/KwUYeiSbO6OBY6U/e4fKLnRJK5sH2f
         bpRDkvIyr7ZQsd1ZW6uY7quNz/lp1SjAEMUnTY3Q25w0IIVefGTv+kj5DCQoxJINnjcY
         eueV5WCzC4A1/ux7WZAj81zxDXrfdY7ZXB3EbPvB6sMePV8JO9+v66i7YdJN3bkYK05t
         81CQ==
X-Forwarded-Encrypted: i=1; AL+hErFeKYsJO9YTTqYylojnIIA2HnzhDptrv+41zOSjGMhfOSMsdum9Dznd84h9Dzjmj8/puvcXi7idEfr7qg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CN9b4tTXklJMhiv4e4Vinuy3cy4SYqRETh+tAQGoWsub5Fyyb
	cK8eW4lhGOMMQAdLmyqQotcWoGm7+73onKF8+YkwXNIMgPtljkRtF0cQUiC6qA==
X-Gm-Gg: AYBFou3Ro5jioY4RcPmDpTlLs5CqnQ2i6K6hnFqsFPRvw5fyTTv1+Ulw2xXD0nw61Y0
	ZXpT5dxUcsp3yN5LAU5Bdw+U7G4e4nMeHDKpJ7eFMyMga8gUCTFnlSpQrlbxbXJu9DadhOJLkQn
	F5SEMYmOnAs0fxJN/Ha95IsIkhhDOB4PraL7RkUiccG7pdp0hqeE8VMePWUwXp0PeAtU+zN/tuT
	BgSWgg+Sl1MV48Q3XOJB9vj8mc1Zs9lhZZdFEH1l99jv7+yfK+5qOKIjGWpc55da5bjWCkuq1CE
	9yCl6gNRhBHac5zQrFL+nkseoKOUbP9TNUWAbOqaX0mYbFVfcdJnw5UMzNrSQGBrnIR5SFpc8aE
	pX5Wj0f65nsA1BmjXegi2kIqN6/gCV9LPajFBBDUVRp0M6f/dfznbS473T6N45fBzPPvbZpBhQB
	AdCnlV5AyPtWlpD4FRtRrwVJJJPmMfRKGqQvgexhyZkB4l3xKge0ddW16KB+mAPgJ1g+wXUYJNv
	WlpgVzFPX1Ih7ZOUc12msvwXoiBJwmOjBWY4L30VUaMTUtsBIV1TaGfnN8sTPAUGNmkFExapXoQ
	fm4ZwCqwCZsMr+Ibys4H5fJXy6EtuvvyuZqyPiKbqTCV2J0uBYwZWcnN3A49KjVBFn2Y6/LLpyN
	B05ujS2/xrm+2mwG2Iin4DQ==
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr3635627c88.9.1795036692103;
        Wed, 18 Nov 2026 13:18:12 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:2fea:c6f8:d30d:433])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm8736807c88.4.2026.11.18.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:18:11 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: pcm512x: Add mute-gpios property
Date: Wed, 18 Nov 2026 18:17:59 -0300
Message-ID: <20261118211800.63292-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Fabio Estevam <festevam@nabladev.com>

Document the optional GPIO connected to the active-low XSMT soft-mute
input.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm512x.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml b/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
index 21ea9ff5a2bb..58ea52e79860 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm512x.yaml
@@ -42,6 +42,10 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  mute-gpios:
+    description: GPIO connected to the active-low XSMT soft-mute input.
+    maxItems: 1
+
   pll-in:
     description: GPIO pin used to connect the pll using <1> through <6>. The
       device will be configured for clock input on the given pll-in pin.
-- 
2.43.0

