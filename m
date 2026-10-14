Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3B3F4835
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959580; cv=none; b=oBpzTXWs3Ba3uorFW7aJ7whEJsvHXzr7Vwd1SjTA79WMcutuMurdOxvGcDPuEqtvBedD4DF2DBL9Ay7Snq5JnQh3kA6bgtAdipyJFD3co+OVSgZQVUtCCUosefPMgBdrn6LplsE7/Coweoqd3L6wKZJquQ6oiyEuyc7cMBS/1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959580; c=relaxed/simple;
	bh=hVW+USzSBzAzqEAR4Q3BT5OZl5nI+OxHGOBnkcNEMt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbdaw3zSNgd1ccoGP2wfhR/y2g5/0rz3QzZXe8CYLaLj3PwG34dZ5czlBcnpaGDt4f8qxWA28MTtpLhcQsFdaoSSYUFCcjj58S0N+ZYWXX8T7xhsMCNeikNU1H/YnvQi7rLnwx+FGb02vV/oX4TIZK/2Z3gPF0pkqdT4FGnU7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVlD0eak; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVlD0eak"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3305085a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959572; x=1792564372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqnHfSSLyz6asBS72kYmaKKBcl1WGQlYY9Lj8Sk1fu0=;
        b=CVlD0eak55T6foYgkesQzE0Wt4zTzlZAZj4O8VR2Qfz5yBY5vm732Fej0kXbiCjMtd
         rT2jW8ejaxepFDK8m/hEJtOJkEwlqgfReT8NJtDgZrqol4AJ9jRQUATMB14k/wZ+N4EM
         sp6VKWKiAltGw4xeTE4TUg5eX01Wt/cpPLQm1Fr92D0TqyWbyxNnqWrk4HdJ07tjvj5V
         0z82M2NDviX3EXFADNm5l1wN073qKl0eDiCSkZA2qqqYkqLzgL4x1Yd4sdem2bDE9WT0
         cCpBbWkmdPzmtdYF98WEECp2OocD248WIgibua7fG74cDv34ON4244xpPshdrQIhQxG9
         nQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959572; x=1792564372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqnHfSSLyz6asBS72kYmaKKBcl1WGQlYY9Lj8Sk1fu0=;
        b=nLTLQd+kTHL0+SAOpjpqdjQK7ZxoxP2MG5HU1ZsPBq+03tsrmp5nCe/1b1+vNMc38j
         OVBFEj/Drs+Tdh9AGV/W3LD1hMekBPFjEh3anltB4wNATY4fPuIHNggV/1xoV/pJskRG
         LKKbZhAMPNPxlYJY+AFvz5fkHxYNc999Rxrydqhn50gCUp9IM6M0ahHZZkbTUB/zB2JI
         i/MeS1mzxgioEc1fHrbqExG2jItFOnCTZuLIPg0s2IoRt1P3VPJKmFAoJX63dhpJVOAp
         /yuXG9bq0f2liVQoy0wzEJ9AMsD4Ir6UGdHkR505ruCnU7FfW9fiLJ+na34yPXRe1GAN
         b/iw==
X-Forwarded-Encrypted: i=1; AKwUvBweRo4C90paQBovx/sRIcQBczihRrGg1VdgScesAEFJS2uKUWiXhYQj2i/jTo/UtJWKPhlstQUxpyxIXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCBEeGRoyzVxU1bxNnR5C6xOVUS1QHY2zMU/81RCSw1cQ31Mlz
	mzZagL5VC1O4LZN8htXjDfArKypB9pIXSujHA074z+4B63hY5FhR8rut
X-Gm-Gg: AYBFou1Iief8P8TjgjRytpgwFsrffi/VprWOX/cGxjDSLmidPf+rdSVZohWNyeEZDo/
	9CEUEspHnIERlDO0TUb4U1R5Ub2wexBOuIBS2KUF5l9GGR3JR55O+c1282hhdTG8Urp2esbHtUR
	DB7DNkXIXVfQ2KH0M3BkkrEAaKdMoucTUEJWQDJefEBWhVzWTSJHUGNsnkpbVF8SBkOLxTvWWfs
	TL0ZbqaeJzEvXfwqZ6VFAXycnzQRc4MzzizeNDx1XnAaBTjeozfnsW6ulSYKO8ute/TrMAXTAJ5
	XaQth5SuNetyOzW2S0rjnNLk7mCroAI3pqCK+44kXlztTdSy7hq0z3SGV2ZtfA0vEercQ0jFlCL
	ZEMOql+kihhdmS9xxt7cIkxUhrwW4/W7yeAe5wjDTa946NlRwGIX+EuCZQeP5AVNX6S1vHibn65
	m/47gGeKQ7sNR8O2ScqQDhdw/AKqJq9iziLTad7iDonlxieBREN2XmYlI9xqeUwi/ENQkwWuVpL
	FMQ6yDSAfTcsyJWszW7OYyr+9YLDmMEJ8HISzsMmikfBGnJQIwZLZ3uhJOaydmZbRYDMFFrqcd/
	lkhJ21AWrg==
X-Received: by 2002:a17:90b:3e87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ac36c7c3bemr3209970a91.28.1791959571559;
        Tue, 13 Oct 2026 23:32:51 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:50 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume control
Date: Wed, 14 Oct 2026 15:32:29 +0900
Message-ID: <87b3bfa7711b61d89c21044d02fb3242dd934385.1791959026.git.sammiee5311@gmail.com>
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

The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
(LRBLOVOL).

Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index a3843094866b..5674d97fcd84 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -112,7 +112,7 @@ SOC_SINGLE_TLV("LOMIX RIN3 Bypass Volume", WM8990_OUTPUT_MIXER5,
 SOC_SINGLE_TLV("LOMIX AINRMUX Bypass Volume", WM8990_OUTPUT_MIXER5,
 	WM8990_LRBLOVOL_SHIFT, WM8990_LRBLOVOL_MASK, 1, out_mix_tlv),
 SOC_SINGLE_TLV("LOMIX AINLMUX Bypass Volume", WM8990_OUTPUT_MIXER5,
-	WM8990_LRBLOVOL_SHIFT, WM8990_LRBLOVOL_MASK, 1, out_mix_tlv),
+	WM8990_LLBLOVOL_SHIFT, WM8990_LLBLOVOL_MASK, 1, out_mix_tlv),
 
 /* ROMIX */
 SOC_SINGLE_TLV("ROMIX RIN3 Bypass Volume", WM8990_OUTPUT_MIXER4,
-- 
2.43.0

