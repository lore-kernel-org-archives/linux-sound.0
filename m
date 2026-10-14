Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85440448B87
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959597; cv=none; b=nYrIy1SLGqFHF6LMxvunt7a6kGsRO31Na4Lz0EWWB4om5jOSlstVZj4WfdRFouhWrp4p+Hp0AeNhfVeecGl8JLDGYYp2bgNFeD85nCDNOBMRAJtcjm300WsJtvRBJfiXmjhUF7ivBEJwR5m8FlwTW8V+xA1eRuf6XpCAYhG5N9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959597; c=relaxed/simple;
	bh=nE32fTzBVH4R87AEkJ/Pn2GSQkElCz40GjNAKQrZqzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNU/oteuKfJrND3rryzlZ+T695gyIRuwrCaqvCKNtutPDC3UdknCOX+l2B7Y07JHME8cLRYSprAnz7p/DmFoyP9YmEk6YkwfoFzZcvDqF421US2h4hBhyJKCL8HcDx3BCTmt0SRPJM7zQuJ/HfEyndxG+n1Kko1/HXYNsUEDYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5XF0u/N; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5XF0u/N"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so2805322a12.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959592; x=1792564392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inZKemHl8Tcy7cBPO+R6o23bsF6T4LUzosGW7cwVkSc=;
        b=I5XF0u/NQ+XIqAxqA/Ci5i7axOb1a+K3l9mNR+Nmmim1zazJPMpHoif4Iw8+6vfZ6o
         6oO/S2aUIOMIiVR8h4fYp/0vqDy9fLOtjWGtzgGZB1SYYbp/4nSEFPWXgUc8i4844gSS
         TtaaZ7+CaKaS3cpCsnclDj7d6in6BLVNTB4QZqGH3ftf1GD32LyGV6tnVehu2iOacfw+
         Zob+bhWZFm7dVVNixG513IPsvshzIJvdts/DLoF3S8/UconteDiVfkUP4w0BVCH+912y
         jHHi/e0rxrGt3XViLeDmdkJ1DG6SHlWb35xP7p7gMDvL56NuLlQegVKDq6oHw4ow1Nzx
         6mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959592; x=1792564392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inZKemHl8Tcy7cBPO+R6o23bsF6T4LUzosGW7cwVkSc=;
        b=VyvBx2KIhLQofqhKDAGGFM3LM/W2wypZGrzmdkpVE4WHL/B5rSWOhjU6NqePLxla5A
         ttsCSvXoniMBlrCdyixAwcZBoeZSV85VUlI+RywIpO/C9UzpsYs44AGHjiIjOCrLAogc
         9f3FERax3llbVPCvlUjP7883xMY09TunD3Tpy1rXfDnp/YlUu6W17pv+t1itaxkS3KA+
         723V5hXZFgeQ0FsGDOqZuXOfbvESJfK8o6qxC6JRirumoVS76y396SN8bFb4K8pcvZQs
         oxna+piSWKVEn6q+xiuzxbmH47zD/dL35RK9PPSnTP+96ywAm+xwUj1j3phtTUracX9g
         jNqw==
X-Forwarded-Encrypted: i=1; AKwUvByL7V8Bbd+f8w5Rg3cNwqudP3SSFsq2YTw1J1TXt/ayW0k8CDYyRwi6hHMDXXARIKO/CnOU3SOubatqWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpZxUZPCkDhOODqX7XSzGNNN8DRjiTI2o3wl+syhufHZxfum9n
	EDLhLGwWP2oW5lV8OW0jbl5AXefYXlt7PLSzk1PZVjFUQ28tr37OlBtw
X-Gm-Gg: AYBFou2syT7rLW5/8DG+Me+zhouRzZ9AFo5JCHcHsFcMyyutseFewMSFKrPkVqKKy13
	KFB74nLqp/YIalsxJzEEen8qawsqwSPS8D+DCg95YY8d483SHQ+JIHrYhEjvkk6B30W2mLTFr7+
	Ys8tcWv1H9TlJ2KshjZMb2j0IMwQJi6lwXYk8T+n8cO9o/gym3sOv6K03NHcz+qz8+fxaXDpQBp
	x689o24bDUJx1nkvDPazQFgM1IvesDbkjNB2NdWWk7Nish6b0pYomEm33VqqPD66EMJXniug0Dg
	BOuEFyG1X1daDn7Mi2BIwStNZ0Zo6BofS0RXKA/UWWwJRsDv9WgSKtOxvpIPN6zsh8ZFSNwyxCP
	Yr14j2KG6gjPo+G59H+aA3hk4cdych2Oil5IdUPg409EXB+H8PX0k00JJ0F4jV3CXpdNodgxUQU
	NdE7ByqNik6BSp2oVWmkuhDVVlJPqdoHMwGP4J8CFWPxBF4BsI69C+3kTo0vymhjf0AYz7sD2PB
	LoaE9VSlO50dW/svQPuf626tY0aofEF4UyHzQBcmp06mWTIIWRsH82K3YCK927DUMkI3BW5WSk=
X-Received: by 2002:a17:90b:2886:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3ab3a966524mr12662885a91.58.1791959591652;
        Tue, 13 Oct 2026 23:33:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:11 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] ASoC: codecs: wm8737: Fix definition of zero cross switches
Date: Wed, 14 Oct 2026 15:32:37 +0900
Message-ID: <36cab58287bd24955e73bfe3a6fb24cae8fad7b8.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mic (xMZC) and PGA (xPZC) zero cross bits are bits 3 and 2 of each
channel's Audio Path register. SOC_DOUBLE takes one register and two
shifts, so both controls only write the left register. Use
SOC_DOUBLE_R, as the Mic Boost Switch next to them does.

Fixes: 2a9ae13a2641 ("ASoC: Add initial WM8737 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8737.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 33a3f88fffb3..0734f6032c8d 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -148,13 +148,13 @@ SOC_DOUBLE_R_TLV("Mic Boost Volume", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
 		 6, 3, 0, micboost_tlv),
 SOC_DOUBLE_R("Mic Boost Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
 	     4, 1, 0),
-SOC_DOUBLE("Mic ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
-	   3, 1, 0),
+SOC_DOUBLE_R("Mic ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
+	     3, 1, 0),
 
 SOC_DOUBLE_R_TLV("Capture Volume", WM8737_LEFT_PGA_VOLUME,
 		 WM8737_RIGHT_PGA_VOLUME, 0, 255, 0, pga_tlv),
-SOC_DOUBLE("Capture ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
-	   2, 1, 0),
+SOC_DOUBLE_R("Capture ZC Switch", WM8737_AUDIO_PATH_L, WM8737_AUDIO_PATH_R,
+	     2, 1, 0),
 
 SOC_DOUBLE("INPUT1 DC Bias Switch", WM8737_MISC_BIAS_CONTROL, 0, 1, 1, 0),
 
-- 
2.43.0

