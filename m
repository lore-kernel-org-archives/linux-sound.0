Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1E283FD7
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434227; cv=none; b=b8ckSfKE2XpEwkbCIJh765Z8huRy0LSqstVhe87b/DNUVLj5IWunz7gc8p39pU69rSW9boWIXhOKKwYW6M+1Sciy4Q4sjVjDO/mvxkLInuwFNmPtF+vEbXCTueZ1zjw9jEaS1OxH62vEo2WXvv/UMWOSpX8+0xW22Pq2x8U2jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434227; c=relaxed/simple;
	bh=L2QoiMpgOAYzN7j7NsvzKHgBXzYZoaXqi8JnrpWblsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1IsD40Tw+DeiJmRXwIyrXy4y5qVNmdxLhy56Ga6VjFBDU2Ld/1q5J3+qDgjhbYF9DNkC0oEHzE1hlsEbIXbIugC550jxA7q7k+ItBjplQPei4zF1F0lZ+8DLwDV/5RtpdpIcoThKsOA/3rEq2VXJhvj3Ffsxe2IiaFK0utS448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=fnoVvoK+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="fnoVvoK+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4dd5f69e7so2022274f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748434224; x=1749039024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCHwIJitPDNtzV+MO2vPhGWV1mftwYBcoejgITmYhyc=;
        b=fnoVvoK+RKDsr6kjPWOS9KgbW7tQDaB3uRgk0z2DtTzbQ4B7Gp3RC79wlnc78j8++a
         zrdD+PuElYd5/rhSNii0W2caT2/KKzLy01yCtJ6NNY+7+ZcRe7VcR/uISAeCV0cbW2uh
         0B+ijIxly/Zd17O4KnXdL7gc7nZjXxw1P1yd7vgWHdQ9O1bL5T8pE7ZOzZt7MUyAnZEY
         Myvw7QF9lmJzRp6+HOxDIqDUBnYIuc9icWgljwl5b2nmV+Vum7JTcVPpdOLxI1issX2a
         cQzFPolDC4CfxW0H7Qovr4c+jyD6vu40eFZw7f/2NHGMacAMUaHptx4EtwpBJ68btsYp
         jXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434224; x=1749039024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCHwIJitPDNtzV+MO2vPhGWV1mftwYBcoejgITmYhyc=;
        b=MyVWhtbPNRaKxOWYrNEG0fstMPXLIYTlwLyUU2D6Kj//g7NDgfw32XFrILDHRJhh6o
         JHvc3i87HVSRC9Ynvi4xfMDyHEUDIyCtIvqiWBgrX/Q2s0+bvWI5k2ItI0GoAc0LPAdF
         zZsA8qRLpoWc3R/b2xz7f+XZck8//1o59Sq5Z3ttliLqST1pkut+MS4uLsw2e8qKbVRB
         A5+OtXB54SYurQje2utDIS9h1PaMtDJawpYyUdKOK+SxrgPUNamJ1S1bJ0LDy6pdYRHR
         Oh1RlEdlwLlLsufjL9+kj0m9ZBvMLO2ifEpBLtkh97SoLxP7Yg95xkOvg4BWHgoC3c4G
         3tCA==
X-Gm-Message-State: AOJu0Yx1vtztXIY1zVT9ubsiOnKliKZ4w/wER1wJsXIw+T0tb6sY+T6c
	JMIqpIdPWYCsMtT5QD5oyWaPCVAhVOyz5+Ca1Pc3cvuwVZbs5c7oVYpgi+n6jyrWBN8=
X-Gm-Gg: ASbGncufjr50RzapZQ4p6MpOL8QnUbbQEyUKHZxt6QFL6uiGQPrViothnm3j6B2UqgM
	/rBXAV/J6sKhl/UwSsJqEmM+FMHkOqWuL5QR6zFONF2EHF+nfiB6reBPopSMdxDCk+WyB1Kvwlw
	p5+chQg0osm17TqZ3S71WdLZYqHS7R1SBRs+bUdrRpaycCVyXAnp8sETXI/SbxYMN/BKhPt6TvI
	Lrq7+sh3jpqsmcpKGg6bp3N2tWn7JIqpm1O3eecu2ilgWFvYZEU87lk980Kia3zoZev0WBhhJcC
	T2RG+o0YNGvYVp10dRg7Hm4XnsWhwwhiX1uzXgvp43lMTt1JyzaeNp+0V78oQgx36r1jza0bJxD
	l36i5XmAXKiIoAxsn6P4OLC5tanXyQCqFRbwVN+Pmdqc=
X-Google-Smtp-Source: AGHT+IED45FQM2vua2vIu7C3PBz+jaHdAgReY/lAMgqoxxgZ4KBbr/mmdnIHszTsfaSdGiBGi/ntYA==
X-Received: by 2002:a05:6000:2c11:b0:3a4:e6e8:ac1b with SMTP id ffacd0b85a97d-3a4e6e8ac5amr2972942f8f.51.1748434223753;
        Wed, 28 May 2025 05:10:23 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006499727sm19874145e9.3.2025.05.28.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:10:23 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 14:10:09 +0200
Subject: [PATCH 2/2] ASoC: dt-bindings: tas57xx: add tas5753 compatibility
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-tas5753-support-v1-2-a50c3f6734ee@openpixelsystems.org>
References: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
In-Reply-To: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, peter@korsgaard.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=L2QoiMpgOAYzN7j7NsvzKHgBXzYZoaXqi8JnrpWblsA=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNv0t8tlsWJHF6JYAINe/SQ1/WK7J7WDtFULhk
 aN5eiyvExKJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDb9LQAKCRC5WrpGvQUG
 8Bh1EACE40ZRk1UccTLzW3s93Xm4PFR2oG9NTmDHZ8RYCVJqcdnRInm302dSwHxSUZ9kiLaKIS8
 cnchN8+UU4Ry8scY+fyzeTTQYIC9p7xXnLRfUxRYZ/BQcgIruPy1PAxN0yoEG0lWJn6ajLPPnl1
 MTlgP2VDvG0rEwQDavRFpxmY983+kNAaeeoyJ6VGyfSbZozJyV32nJq4Mo39Ptt2OAgN2xxQJJ6
 m3fdggpWULzuD43FlHyBgt4TrW2cMjTyDcLh4ayk7qTG4BmJMbRyeqwoKiDL5TrgttpUk5KXaVX
 I+4bcpC8IBOgvs+DAfA0cSIUhznHfOVDzhgji6Wn9Y4M14t81UYOFBDqOVJXg4SpFUY4ZegHp1X
 RKAX+aM7jjNDDPMLC35guHxD2un86YCsTIZ8ARfo43bpE3PMQcV9KwyvWqHUMjBAL0AZCrTphIn
 is717hztgexbARZanZb8ooOsrp5jdsfPkt0TADW2XKIs1NOlv+/6WEsTNDrdUGb9ZS9m2Z9NAut
 ieJgPhhIynmrrtTqolSgZzfvI6fiyUP+kP25jaOxglurHZEqlFUrlgf/vVBpCW1te2SStaRWaWa
 Lu29/Z5I2bP9pB8YEEFGhFEQ1vtl3F5gtM4fDxu2s+NuCBI+dUh4AlSSAnvmpGipBq2rSj5fRPL
 L/oZ228M92bw9hA==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Add tas5753 to ti,tas57xx devicetree bindings.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 Documentation/devicetree/bindings/sound/ti,tas57xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
index 74f7d02b424b9c5d5fd7ea573d7beeb5a2253337..0b013a34e2c10787cf7627a84565078c49bdb7b6 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
@@ -18,6 +18,7 @@ properties:
       - ti,tas5719
       - ti,tas5721
       - ti,tas5733
+      - ti,tas5753
 
   reg:
     maxItems: 1
@@ -98,6 +99,7 @@ allOf:
           contains:
             enum:
               - ti,tas5721
+              - ti,tas5753
     then:
       properties:
         HPVDD-supply: false

-- 
2.49.0

