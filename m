Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CCC3B776C
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215668; cv=none; b=VNW2ZaDcEazleDTQ6oLm1USRtbBizObjtr2JC8sYzWLC5Wj+7M1lEjVkIU/4hv+5tViClcG78RpGjgLwQ/QLY4OhnC3N0d1lMDxzAXEj0NNy0i/Me6UWwa8Xkb2CKPtg9PpchjlKMOHRnNZoFbRPR6UQdpMg/LFWBWr0bb0v+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215668; c=relaxed/simple;
	bh=5ZKt2RSjapJGUOO3d4vZSG9DTmpONEpsSL+hn9zyaLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAZrwXZXkyZuppmVuMVh63Sn5fPVxNPx2OjJDakMbGlotyZfRcSXS1CuWGmWfVZzt7ymYCQRQDSNkMOWRSTx0YcpS79ZUvxZdTSDnKAU6GfciT+d9nQCCCaeoTzychgjLJ4ZTSguD/HB6JQs4Vn3F6ZXJl7HwoZ7P1P2+aZ9ZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXkTBHXL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXkTBHXL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82ce09b61beso850369b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215655; x=1775820455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=eXkTBHXLLc8zTNNMGLFaQRgGYVlYn1G4L3RrDlMLEyhD8eVHUYAPVTTkdUf2x+jQnA
         oZXBR1Y2RHcDqMm9trK+RlV3dijPUH1wlbS0EfGDTpMLtP2pz3Dx2feZjIHN9YktPvBR
         fXW9NgHtavrE8+06skcyKDCHzXrW5s0EI8AZlTs52EgfpuoJAzETkSB3YzP9l7pvWSwS
         2IhUkfQg2L+XUxinEScR+VHgG0j3CSTAWBKUYRbrfv9vT8cvYJia029jsLs98AAVIlJh
         zkoklv0vo43D11UQENsRL2L/fia7SA0YdBD1uRu897TzvivhHKnELLDzcYSbQY8nsMp3
         S6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215655; x=1775820455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=QYQqDOqVNvkNP6jjuVtR5t7QTsqX6QGvixErCdaCZKopn0yfSNmHn6LB5OCyi1nOWM
         jtKlYRwqjbC/lbqx9Ef5gCBpq4yxvz77UaXlgC90nFPD7I33Vs9oNalhcJ2Wtih5+ANK
         6a6M780mIeF9jB7/e2RyEpv1vG7ZgdNlum+P5lYa7y3I5aczMbtFdxsSxZqDST9i5urJ
         VHlcB18ckDZLwqv3p1YPkwUkSKjWclHG8yZpSKa+Q/r8YtFNKwH+6r+lYEqi74lZSlyt
         THPBktWeiHSdCT/7nhpJx0jY6uG3bZrVmEO7m04t53RZhx2SYm1ijQBm9Au49tQdl/nO
         bdgw==
X-Forwarded-Encrypted: i=1; AJvYcCURsvLuAWlqPtaWQd4CapeMZ0VCyRhl78W3Nr8oYtY0fCgSKpue6i75UBBQUE8LKnnG+jS0jtExh41z9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAh4Q4CmkKiK8W44TjrXQKhgUvJEIvVZfkWv/bo5da73K/iwlC
	SFgljeqVvKyi3NvoaTS5TE86RDD69gtKXyNvd+Dy/zvsqldozen8p63e
X-Gm-Gg: AeBDieueJF1/azrmqP4ZEGKb3jbOLOg/aFr5AVelwlLFIjkpNmf7Bwq5vHLCywKR85T
	LHFcC1qN9JgONpQ99yil+T62gLw0kvvp8hyeIELAcSzQh05EIzav+O13RJaOBJGW9k0vSQcy6NG
	SlOTRl9kxsbwtUSQ24yB39DTSSv+B7tvsOvwZxqOlosjkM59VLCTtVqTqznfHaj/u5ymM7sdLfP
	HJrzk06NbbId7537qFfXa/sNM3uXD48oKnDd18FpOQc5JtfzgmnsQttZYCoMp6cbPR8IC5Cx1KX
	Qm9rdnoD4f+W0SNMP1vUKcL6ntJDAJUCEGNKTUfaJOlX15TSpTiTVBokWXD1f9uxOwYXSdje+9+
	DuKdJW/JYwRIxhEon3gD1yVo/8qn9xk/cxlWUe6wXM+SEuKJC90Zk06Li1xf4yYh47bE9zy8qfm
	f9IRWwC6cOY8tyCnaRRjeO2K7mdrGGZ8/u5hEjm1zH1vIPFzmdfCPEtdLDhA==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr2721652b3a.26.1775215655355;
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
Date: Fri,  3 Apr 2026 18:26:54 +0700
Message-ID: <20260403112655.167593-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Describe the "spu" clock in the FSI node.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..9cae87a1979c 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,8 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>;
+		clock-names = "fsi", "spu";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
-- 
2.43.0

