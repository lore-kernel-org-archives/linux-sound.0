Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796077;
	b=PUSYwZzv5zn2MLizD0YsaeErmUCs1WblOM/OUhWjUbY/Nho0rUD9xHmnwqQBMpQYuEPh
	 GEV0DcCtIQRy7XnjAmktsLbUYMj0HlFyXlZHlcLxfwAuxyWEmFtmNwxMWw3Idywd/Rq8l
	 LuVwEOhgd0HOVi8SbiFQDsXFxRzMFUKpPq8D/dj16igtGmLq7OueCZjlI9kzcxyIWMCn+
	 Y4JA8k+pwepIP6i0xqPIt5gYeUN/liUChPWEfHqhJABmoIGbRiyy03jWaocQbzLIpJjMk
	 dQo5/ga4oWwZEJgTHOosRE4m8UTcmubYq348O/AmKh0FbPEza9ia93MG9xroLaTpIkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=z/Y1Zm+PiAnBI+ExmlE7N9cQhcVeewfA9k9kHYAwvnNnFEa3F1DiLd+K3Jy/JWLKREci
	 Txo0fxzC/FH1x5umOzpGGHcI32IRbqBU9QIi32vi+mh2ae6MygYVo4llQaUdKZdqiCmFQ
	 XnFItAzVto3osGjb/ZMJLNNUvwFRGQ2lyjBXwilBXtPhF8WNqoSQVoCLPT+NxWKzFLBow
	 6MyK+FBBj4v6XVJ1wsEh9w8FQtAbfIHNtDZtvJvYQZPl38cCQCNz8k3r5e0exRgX+xSvY
	 IIyDlGgvAnUUdAfWr96KwYoFkrF2QjGyCbwLbchWMgJOVpdIPeKbp/OWdUO10NVp02g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32D7606D80F
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32D7606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10488545e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796072; x=1794400872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=eNhd0UHHlwredQE9dCABAE+no7ssHugAHzFNVD852XOpfPGxF8uQ9W5bPcI3+MwqR9
         Cw++Le4R37QwQjXfc7M46J56SV978jsy4//A9Cy2feU8/LlulcdRClN6aPk837nurjgn
         l4TyUixz3zG3gjBQX03Rsnm7rjLh1fJTNlKDUOxYodLhoED3eUn0Mu1xuXAzVGPXWsDL
         dvv50lpMvZDaxqD2yHPFMqfoQ8ZhHJNhlBPenAaQdepaWew5UKtMxAA3Ulo4MhH/eHqA
         FccmAKvd6BxvHxocuIHe4/MNg46zvMZYOffXunaoQYmCQGxfv3vVaKdD1LqcXiY24ExE
         MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796072; x=1794400872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=LZA1kb/wpSARbTH7tvgbUAODm4lRCvFg57X1nw1D9L5/b8IptzYiRnLXDuq2uVN+I6
         4sRpC/E0fumgUDPZ/Iy+pwacloEoB3IJRxNLZm2kEwz+jwSi1IQex7wNXwJibYoXZy4H
         jnt/znjyqPG33oeyYW2SxGTObtlkoBRIF4U3nJ30jg8KqYOSRVGDTey3jZwxaUMKpdyw
         d0tWkLgjT/2+1S9g/LWWcz75ep8x7A4vlTiwUEQ3+Fge1dr7yUxUN42SxdEsP2REeuXB
         oy0Kp12TKns+gA+DtvIhdpdD+i3OFlHqtjPzK94K1Cz1+qh6KJSfleb3zaIb14ctY8Bw
         tK+g==
X-Forwarded-Encrypted: i=1; AKwUvBwvHSkhlW5Lx17O7Wq+Z0tdtlqeinRiq8927hc1i3irryKNz0OnhQDdQ7JpiogDhmQkZ4cmI+KZnlLXbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jmScvqdBZoECJfOmmz38H6fjcbM7xcJM0av03jIj9dxgaZogh
	TpL2s04DLldh1DTH1vZ6BMsPughmGww3npLVSXLCp1rEx+AGEr5QEObX
X-Gm-Gg: AYBFou12sCx/TXDXws8HoMD3CP0CVeRuTtLRcpN2XGaQY/rUTMHfbqZtJkAuP0TrUej
	SCPXK5w4vFGx+y2k7EFlAyrLfMKQY9dfDj9c42C5id9oZlSBEe7bLJ7btuzFoQFIvSy6FS0zi4g
	CC/a38Pf0K8/9Wu8r2yEm+qKuPMbAIKUrI9y+TI9QBMAERYK1XX0qcofoTDFTz2BRTTq76chDqQ
	wu+6HCywrLTcHc04QLWzDO+ovh7Tu2Q/X5hIhubWs/rfq20/skFl5GgkiKiimHr7OY5TGH+d1jK
	v8dD7wPqmzL9BG2bNCDDwH3zAysGLihEtjPzb8oI0bhAttTglcosTEuPdE3y7HdfpGTauA95Ztt
	o16C6RMqcikr0fkOJ0gc3oGI8c0sOqFlb95cMd1lsn+k41TQ+s5pf/dhO3cWGPSC4ytUO+SJ50s
	Y2pdh1WddqXogtOu7EoKoQHsaFRv4QkKuAs8+W8tPBk8NHMGfBq3A6Vj0d8E8Pnu8THvSZ7sk9w
	jOITTd0lC1X8CFkT3OJ822VWZKrG86+QgatvgRY9PMT2CAKjfkmPCJpzx72sfDzQqn+9ijvJqjq
	p5ujge2ACLVi4eCXfmQKPjsLaeNjtFP8iwtyXmWpoOrYUXz5rQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr361875015e9.0.1793796072166;
        Wed, 04 Nov 2026 04:41:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:52 +0200
Message-ID: <20261104124057.240288-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

