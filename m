Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6D3264D7
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257261; cv=none; b=nqSBCP09QHL3/PC0PeIIvzmgB5yPIBiXCCwRwJKlz3LPBdAo8i9yB+Ee5CFBM7LVcvhQgmXBY49b8EJOJykLRAJSwKmLXZwSvtPN/ak6aZUb4ld3mGhoGbu7fRxFylKJcZmBeRdpQvtczCxll4Zg1KtSJWU0xJsKUwMeA1EJ/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257261; c=relaxed/simple;
	bh=v2J167Kc+xj+F1x7h/z4+g6abS0dMZHD0H2l9g42OPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4qhSV2/QgX3UBV4ogH9lWKKhEryiY6XaXD5bZ+7AcAVM9o3mo+MENNDJdQ67gBdaLFfnl5m5hJTPEorPqxZ0CmLJwBN3W7RDHcZbPCl7B8KwaDrGo6UBUHrQqpp+z+LuO4I6EpAZ8Vq1XC3xBxndcrp7Y9OB5vzyMluEo/PJ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/jItQsr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/jItQsr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso4234922f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257257; x=1776862057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=H/jItQsrOtLvlZYAx0pjpYLsNzjfMMBwH5LDpJdcW2R1LfVik2smzIro3RDlVKZXx2
         Sw0el3dpbo6syk/CVzvoLlcvqnZSmyUESe+iq+J+PoBdF7MQ2vp4gKddWHtjdp5qKRhK
         yJm65VOu3kV1i+9SbLQNO5id/tnCsEDkxQwLdqXiG66NQDtKYO5xWuISUKNbBJ0c8+r3
         mU8DObU+/NItbFQ/NcXz4GR/DTzn5eUskqOAp4mPreGCSiVFCVWo6d+6dU7ML+rHCeJG
         jLlC8JFGeY+WuPp8GCzeoGu51gGSir8N9hb0K5FlD+clPSIh1o4ZC8D85E0defmeD3ko
         RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257257; x=1776862057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=c5IsOgCNNkj9f1/AaxmqmpJngtNKlO6J7Ah6XTFFzTkxL/SPV6wIvN7hTVWcXHeAyp
         FNTAPCrzvQWk6FFbMp0fQcD8sm/R0Q7Kkq2p4PUqcdalb0Prjcyx3DaPeLsG2Jq5UGNY
         7HgyVUKIUJsFeuyjo5yCCvZvGp9BSq7F2b+qJocSJPbO03h49jiq8A+SWG+En3QDHZxd
         qr/Y052w6YckEskd/tlrX+gNEWqC9XXaJKDd3XaP0Ybz7XNepnHFXfeyBsNeXGLvkXKc
         Fc9b+5478nfMVXGN2GdANa1H1ik3kpY+t0V8BsGHGsnZ9se6etVGB6Q78ih1XjkfPjid
         AwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uXvVUf4zT70895bAkc86zONKik/a03V5VDBWCa6qE6DFaliYiQrqhoJtVGb6Tf1TXUbQ1x7W62pTRLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjVGBCrE2120m9dR6IgFrGyBSFgzXb2Bt3wp7g4EFkdEyvC2K
	sGfD/YZ0Vb1Af2xmuLvO/vutOncE3q8qszGpDtt7TVu5h2iNaCGPLp/C
X-Gm-Gg: AeBDiesnulHSGbuR91easjSEtPRIevjA1cdcs2eBwOadlPZWFH8RbYF47Z++uAbB3w6
	W2wrPUbvkPvvgMpgfQnI390dYgwlgtTn9NWHnQyzSYqUIk4zSm+jmH/bmAFbHqgdGbutm7gsJGr
	0/qZmMJNsWRXKugK+ZRjeYYMXSC8O47U6CYDExk2IvVvWWCAaGq9n4L7biqaLkw83dmq4EA+ZVp
	8ObguWtcoxfxCXGidpEl49SmgNgSK6UBukDgD6jecbni66yJ7xwjrULdk3iLU0aG/hbKTSRy+6K
	HLnhaTPTRT5++VwoXbgmHtjDYa35F/TDcuSyIB8qd+DMugz/ywQbLgZlr57VNF6o7T5IwMYprxF
	zAqkwD755FHfhryA7JmEok5ZKqeyJyMXitsbjYaXWW8UJuT9FEsWsKIFIOoXWNWQy08zKU5A4SP
	6Fh6Er5U9C0C+OftrhTSGjbUGlQ0kUNAXGA7f1vg==
X-Received: by 2002:a05:6000:144d:b0:43e:a69b:d805 with SMTP id ffacd0b85a97d-43ea69bdab4mr9541704f8f.27.1776257257303;
        Wed, 15 Apr 2026 05:47:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:36 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 02/14] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
Date: Wed, 15 Apr 2026 12:47:19 +0000
Message-Id: <20260415124731.3684773-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RSND_SOC_MASK was defined as (0xFF << 4), spanning bits 4-11. This is
wider than needed since only nibble B (bits 7:4) is used for SoC
identifiers. Narrow it to (0xF << 4) to match the intended single-nibble
allocation and prevent overlap with bits 8-11 which will be used by
upcoming RZ series flags.

No functional change, since the only current user (RSND_SOC_E) fits
within a single nibble.

Fixes: ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - New patch
 - Extracted as a standalone bug-fix patch per Kuninori's request
   Previously embedded in patch 04/12.
 - Add Fixes: tag referencing the commit that introduced the mask.

 sound/soc/renesas/rcar/rsnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 04c70690f7a2..3e666125959b 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -624,7 +624,7 @@ struct rsnd_priv {
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
+#define RSND_SOC_MASK	(0xF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
 	/*
-- 
2.25.1

