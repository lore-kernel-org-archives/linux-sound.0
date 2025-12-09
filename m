Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD427F195
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272710; cv=none; b=bv38NLFZKUjHtNlrCmRFQFRR9iweq+VX4CE5GLYO4MJAy+kr8254z2+t6D7QENS0oys3qiSLOSS92cbYctMHigHieX8ra28eEEVhDC4bAHQv4p9lNUW0u8OO9yWJeov2ERdfgKlApkLpAazGHgK9FNV3sfxPWjayOz5cuLGLZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272710; c=relaxed/simple;
	bh=T8nQRaJTMEOE7oGRiZt2UVDQ6WuLodWd+RVxZirYEM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksi6f9LnlVqlGCmzpbn4RlA/powPQD9YPV8xdYgy9gK2LngfKz96fu78/gsKSlHQHethGfG+i6j3pWOT2y8ftCZHRFM9EyYKOFax2z/tFUUfNgtHYocBtG5nSndEu1/o/VFcyJyliXQSad6yc/fqwwMcgg/KDnb5lTDl0C2Knac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaX8B4WX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaX8B4WX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-341988c720aso4212423a91.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 01:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272706; x=1765877506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=FaX8B4WX+HHTShwudqnE4f5MPe9UHgupLmcOyFkdlrexWk/fbr+nkL2SnlGud1JKch
         vAyprFofZBAMXw3hFPB0vT9JrIB28LPRo+zGgyAfeJ4SthkAXj6gJYcPE26nV3TfA/A4
         gdqfT+4Uv/00vlwYobRNHIoeAhvBhX5KDnMyoKLEjPk29XbBaV+YqikBKqIaTD1VxdpM
         H5JuVH6BdfjbUXCLr3AbE1I7l6OemUq6XpMapV72UElGvMTcS2hBa6zHgn/u5I3TGpme
         33tI2iz3tmOK4FatnK0UEM0KdnFk1p9HgIJQEbzO8JaDKHodp0Z757CuH7+aspg6Wsg/
         y+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272706; x=1765877506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=TOaOWl+bjG7tpcGPjAw+7s5/daqxAOGpFifvkrnOKZLnP7s1bT9ylxdd50F46rSUp7
         CHfikMqgJMXHJiJWa+2/ecsREnIJUQCNz+3ZeTap5u4MPiyPYVQpBqqRV9v59VkpXOn3
         Z8EuC8HWqHpVsPCBEMJpAXVdpQwNC+JTXY37VxTCQ6WvCKG2pMJBTveFHqo4ZiF1nMgT
         9P0Ztv0YDMBtdEIuNYvdL33YGsJJf+Z0utAp6QFqr14XEdkwdk/tIppcyf1Q6MDuGu1f
         gZ3D16zol8RatGElfUydjgjySQ4LMn+9y8XuBoM1wxjtXf9PoYZ2HFVhVSWzU4SXN+Bl
         KbrA==
X-Gm-Message-State: AOJu0YzJpMaLQqZ/dLR2F4b9/AxuPCLe1PLfTyIwCmDjVraP77teNuBH
	fhiy7JiwoOPdUn0ucSs9vWtKkaATnxaVrPcrDNycCFjY1lxFgP5cx1XO
X-Gm-Gg: ASbGncucy9TfECD2xm+vL/R9JX3ytHAcm6hNB2ob3VB6+Iz5NNIIWgoIqQztJf/9gCH
	pNcijBfzzn0HgodDGpo9jvgX0/5moB4sqj3OBvssVkKLQY/sJa3PNSOPw2/tkvNLsN+aIzi/3dt
	3/tXa00Bgfm2ZuIEg+dagv41qsXyjt1/fvfEoFA0h27BTjQIaeiGF5GRgIbeolMxA0/Ettg4c+Z
	sDhNb8DFZa5hrR3w+pr/K+uY/HN+Udb053Vv+sVAAwiOQRe2FlzEVSakVkeI015H/828ybBTPqf
	IfsuOA4YPjLgVwohbGInjFAj9bxv6U+n32emM7lxQcoe3k9siBiRvHoGtBaWDXAN8TnzuCj4c0B
	QqnJDGXpVfUzVZvI114hm/tcALUmLYzUpOethSrLMdS1cuUwA9px9e/x9oIEkFClCvvXlZORYSw
	7bk2bpJgZRY9aCe/zGS7bRdtItx7EqaX7J6jXou5OWUzngPXCyDuwf+JBgPio5xnYEbkewzIOME
	R+jvKf6MkXE2RWnazfDM2r0ELfCBMQt9UFfxc0nkbVqriu9u3AfaFZNd5l+3ZAVMZSCSwVcx1Ue
	yzqwnC2lDoE7QfgJ72pjfbgqLldL9jPE0iYeeJlQnWxA9S+HRsc=
X-Google-Smtp-Source: AGHT+IG5TjEW4C4GY4b2FxVYjWX8+gLJQmB4u4hl40+y/p7T7camtMTaOvWcdzyFLSuameifxgFCOA==
X-Received: by 2002:a17:90b:388b:b0:349:30b4:6367 with SMTP id 98e67ed59e1d1-349a25e5544mr9400724a91.30.1765272706467;
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:15 +1000
Subject: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=T8nQRaJTMEOE7oGRiZt2UVDQ6WuLodWd+RVxZirYEM4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7KkF/kxcld/Mi+rkN61eYvaC++1gp6Kd3f2PDkmc
 6ji2/yEjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWyISAMDELAw8OUm5pUa6RjpmWob6hka
 6hjrGDFwcQrAVG+9xPA/+vQ6/Zbm4286L67/xNKmU71vGRvHo9mqE/+6CX5UYWVawvDPuH3N2nN
 P3PacjbolrHEocOXlE+EuDzMXHzh9YKHFp9kz2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml.

Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
against the bindings/sound. No other references to the file
were found in the tree.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 4 ++--
 .../bindings/sound/simple-card.yaml      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..1df29a556120 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -39,11 +39,11 @@ patternProperties:
             - dsp_b
 
       dai-tdm-slot-num:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       dai-tdm-slot-width:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       playback-only:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..2e1a5b3216c5 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -28,11 +28,11 @@ definitions:
     $ref: /schemas/types.yaml#/definitions/flag
 
   dai-tdm-slot-num:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   dai-tdm-slot-width:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   system-clock-frequency:

-- 
2.52.0

