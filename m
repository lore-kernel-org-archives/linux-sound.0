Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF69B51DE0E
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755822; cv=none; b=Ts4/7N+3/Eb5D6dzHO/e0JfuMpEpxQbaOXlNpexTGdqsdz9qtZJlhDjLQcMm17thYnoYnJ1AJkdfYVc9quCJ9MHTiXkC4Ini8FuMmZMHNtJbnChoKvHSN5ouUFvvkvSoL3XpKYDRbrSxvBuxsM2MAxO797hwWYx1KjhQEeJ8BF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755822; c=relaxed/simple;
	bh=WAJrSEZkQYTEDq9vyw5OAkxECQ/CYjweOnUO5CKaYkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qNumhnr7VIah6h6MxhN6kl7z2wj1aR+ddj5KuFaBUFjf2n+0Am8RUYpVQAFvTIFBIWG7cbXHKDcbvGd5yI2oTOVjFr00nzOYuP0N1/uH1YbIyB6pAbTTbBbBfLLED/i17u0tStaiqRss//dpispFR6Vwtjoc7ahBU7M0o9N5+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=j0iTv/ug; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="j0iTv/ug"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11321425e9.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755817; x=1790360617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=j0iTv/ugO+bZmAnCrRAs3Y5Q10OWOOc0wzKUp2TZ0+1QlWfOZZI0obAoMfphNVfPsA
         1jhMixnCcp6226zZvTjGJGPPm5wMgOcYe0cK9kwtJ0FMrRq4RUtXVkGrLHpk3pOqpGun
         EmXHXKNeypXpe2DEYeiys/EzonrFn3Y+l87XevDrB0Y8PGeJxfg2ABo4+v60YVnqfuf3
         7U4MOj9dcoLKTJScB7J2ePqGnSxaoIagSiE6aTFyJosR5H0atmq3PaXUlgJI8r3N9hy9
         VoxiP4aULepAd+lSsl6ydRf/O5HIm+y1R6tBmp2HnVeN/Cfv0U/We7sUzphRWpqjYh5/
         rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755817; x=1790360617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=OeLFujF5tvYVVCFQ90EGLyaqqqR++7MpBp+lOGeOEKvvpTVtI9OdXcPpLpAx1F1MKk
         et/sxs1QzAbssfA2U6+B9HtB96IWUI/E8bzBZU3C8EwMLD3kwMZGgcVnNNFhWLSAE+9D
         tVvQQm3/ua5cw4UQvJTE55SOcdfcFWujwJfy9vyd2X28Y0UENNRD4OCVOem7sW1bwcPV
         x1qXAIOa5DTv9dlpw2mynLr5kaZxXy7Vq1Hzp/zBTi4oWL8CSiyj/vpllKopynhLdFsi
         auzqkjgUOfb1+Vjtw5zN3mOEcmgMgqklsmvzVB0XXSjPHtlsh4cHlflVWbnXkM1R2RLg
         7opw==
X-Gm-Message-State: AFuF++nGqoWD1B0O25gHyHf1dmC8NA3idqlQXaUTUQqV58NdZjpTZdlL
	dspG8qeLynCHMEFmStDbqV7Y+0N63BUKJQG2Dvn49nXSgk4Lqtla3utMBCC5TJfLZ0Y=
X-Gm-Gg: AYBFou0nbUHAC801X4vnpJ9b8UbAVOGAYaHusWNAjUCSu7N58OpEfA9K0QeOQOHvzwB
	vLH1cxu0cdM4F4huk9Y6DGDmv3VGNMVZMTmrdB37fqqLDyycaWiy0+qmXx5mwaW15yLQeyqyHpq
	sz5X09sVBQt7IAtDRs9MoV6g3G1XCfv6bFz/OVPSSg3dn4B+fKxSJcfrRfz9+zPqu97VPWSpn0o
	I9FfgKVf2wnBuT9xr/ljwx0g99b3L9dLTt50JFTREGtX1bTqeLIBzfSuSFoGjVfkMIb3alzbEj9
	Cz/Qn4CRf4712k29adq+UchGiWX/QJRLPMu9/cfSUVk0g8Yehva2RrADsKnz3xb05QYb7XfdA+7
	ENdKnfQvqNp+ChUZMd6ikIwBIwuiQLZgS/CC/OZLrV4bRtWjFCnc8BADUKBtITDvR6xtNhqTuXJ
	Jxq+Gq9y6hGpwLz2s1rI+TDSiAz/fBPQuEfbdHbK47xw4D1WPGIvQEnoIi0OSvC5BC8ZmgmC5ve
	0s6e+1liM7/lQ==
X-Received: by 2002:a05:600c:4e16:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fc574a641mr39896255e9.33.1789755816874;
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 18 Sep 2026 21:23:14 +0300
Message-Id: <20260918182317.143223-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba200296937..ff4a85f4cbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -559,6 +559,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

