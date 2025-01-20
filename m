Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A401E1A31;
	Mon, 20 Jan 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363717; cv=none; b=fNkcxyL2M/XUvr/DjTyDsDNzTWznOsWf19Ud83q1uck1Ze78IF+JJNd0jZZEaZU9smOzXIyf9TgGsGKdNkurX3vDoBtg1s5vljqfl5G9W76PGa3YfoFuEtprN0J5paQTFs36NNCW/uo2DXNdtEiDzQsq4E7rZrtZEJQjgg99X5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363717; c=relaxed/simple;
	bh=n0u1NUx3/2UHHzCicOPQE9GqysOtTemnhrpVN1uAmqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6qzcSnaGB2fpd3yxlr82GPfLhdF1QFiAn5Obtp8M0G56gb/HXROnxkDUhUFyD7nBznwyQTVG/ibcVgtiXERbZtXejxxqId0GD2miCR9SLGSzMRXWbEEO2fxYifRSYc/FVSq+3C+3HwHp3vAtYDd9R7Mk9SR8jXMFtXv866K+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeM7wXzu; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeM7wXzu"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54026562221so4275624e87.1;
        Mon, 20 Jan 2025 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363713; x=1737968513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kemYtUEz1zvjOhFDJKfAsLfEWEsWSV34vtPdI9CAeRs=;
        b=FeM7wXzuvcESG6wiXARM0p8O6mILwQkhXP43d/U0eat23886ycMLKmpmBSeVpnk8k0
         Gg0imM8R+BnOlH+63euF0GW+HlTRkrn8JrextNFauCilrSy0yv07SfI4QGjeC8cqtSZ4
         8cXvZpgoocu06r5wlEA3efDNWqqWQJX2gtZ3nXYagGz2ewGSIEQsrU4ce0FZhqcSkQov
         5IRRSFnsk/Brbhsn7xw5kg7YCvsVpPfrgMeLUW1yxythylNEOsUAsQatPnqgjb1TNhRT
         hoj6PYkpnAFH+UWP29hXn/bPadfkuOu6HQhg8hmTmuUJaqjz+35ffu4w8RleNprk4rpV
         8vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363713; x=1737968513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kemYtUEz1zvjOhFDJKfAsLfEWEsWSV34vtPdI9CAeRs=;
        b=Hbl4q/CdNKAOs1HH16Tj+dJDmXxVM2OyuXUW1lC5o9Ucx1UQtSMh2jVqwnNTMT7euM
         0hHuTiyD2RtsL+VbTCvKcKYx14DIsmTNllkj+qgK8RzwesCWHqU4vqqofyo+3Vv9s+nA
         UGHjVQDPgoo/UlQbOZ7hbO+nn+WvsnKrifLhYKersU5ZaJV2Eg+Y/tTsBptLctENQok7
         pIvDiDBYgwAuMVCASA1oTPwO6XI6YzxsiUnLMbzBXHX3KWh+jtJ5Fb68OVRxapKr3DVp
         9BRja5RJ3y3AwfdzBxFCNqjenLaDNUP8fwWPlQmj8dkZX5/+QulvdmRSi1uk0rItz5VB
         7ouw==
X-Forwarded-Encrypted: i=1; AJvYcCVGv8K1R60tLB1p1tPFMBZ72Hn5vluX7Pig50pLZq6pE0TOT5y8ztA2BM5qIRTkrF+Dr+aiM4DBKx/a@vger.kernel.org, AJvYcCW5w8bz8s2I1b5SquSafPzJUbXsD1y8uJWIWcfGiai7rXNcHDInLbbnjjBN6GmeDgWrLO1VNPg4tr9+j4GP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJIBocx+FzI+S0avEgxE4LvC1CqBLBrw0VZ4NxtpwB8YqjXHeE
	3ZNAc5DlgYQ3yhXhlxZuEgwxt65hbW5FHR5TtoCqOPuclr0G4DBs
X-Gm-Gg: ASbGncu+3Sju/QCK0V5L2BCeNV+PLgtZtxSbZwbxRT+x86NsQ6cgtfaIwUxEJZxi8Sw
	xABkeZWV8YrqTPlwD1eYvyHWAP8JW7P2qEHR4yKTeM0iCLvmxuz2DnpTDyoIvazQUhljQVuBFqn
	lIHACX+ruQtzaIuvx9KJ5ISysLvH1dQPVnkNbGTV8TiZmton0sAQj74/PnIxpkJJ0Q+5qpXzK+V
	yuGhoAnzzWyyK/6BIzAv1cyxT4w5rvM9FWUMgcO0oS0blMNVVOKz0vWZ9sQjB99R4/SrH0=
X-Google-Smtp-Source: AGHT+IEx9f6MEs2aC51GCXj2Q1K64ptJHmYy+Hdi/JLLomjH/N/gqY/c0ZG8Kw+1i2PuSCCfvwdWcg==
X-Received: by 2002:ac2:4f8c:0:b0:542:21ec:ff02 with SMTP id 2adb3069b0e04-5439c281fbbmr3440206e87.32.1737363713091;
        Mon, 20 Jan 2025 01:01:53 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:51 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:27 +0400
Subject: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588
 SPDIF
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=938;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=n0u1NUx3/2UHHzCicOPQE9GqysOtTemnhrpVN1uAmqo=;
 b=iOT8mfJebuaPxft5/slu2bZvjmAlbN8O5ZJoNP6fn6QS6SeeJeEnugY+DXOnUfshXSK/96d7m
 kGJMVQz76eYBd7mC7FBE5UzvhfFLd2uZaV8z1itL8wAbE2e0t9pertJ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=

Add a compatible string for SPDIF on RK3588, which is similar to the
one on RK3568.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index c3c989ef2a2c81eba73fae3d1ee4bfd18a8e5d29..32dea7392e8d49fc6402a64fc9f7115a47a8b8ad 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -31,6 +31,10 @@ properties:
               - rockchip,rk3288-spdif
               - rockchip,rk3308-spdif
           - const: rockchip,rk3066-spdif
+      - items:
+          - enum:
+              - rockchip,rk3588-spdif
+          - const: rockchip,rk3568-spdif
 
   reg:
     maxItems: 1

-- 
2.48.1

