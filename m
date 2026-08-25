Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51A3F58E1
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649967; cv=none; b=Q1EmWyVb0gOgX8ggFCkSSouSZzwQZNaA1+vOQdL5mjLPkd8XGOU/DSeAEaHB2rMfX4AySDrr7PTL4/XP46m64pc0M6HZjDUGK6ctR5ojbkaLMMI4FYrqytcnJGxbSZzYPq55gxT00OXW4ErWi+Py5b/x0SkgVgHc2lNg88hRw00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649967; c=relaxed/simple;
	bh=wLy4Z+Fi2C9rpzCUNoJbtEsgYBy+7xYaZ2MuRmd2b/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewM3h7V5bXEpl9WWfIWKX4IsBH5fMYHJs6B4gk0K2lPQovoDWRsgPEhQ62nqem6lpwZ7xphB86ztXzPKGSYPE3kd1SWs5EEsqz0YFD3cFkKQxVqA5uXQwVk6ZnvxQKjvgrMsYWFf+M10RSpHr/V2hdZqYLFz1K0cx1sadyHpiq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeRteRgy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeRteRgy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c214e625259so680583466b.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649963; x=1788254763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiTNK7IFa8AHM6UkYKdH66pZJxI4e28AjjdcgC/th50=;
        b=YeRteRgye1KEQjwzr52d/Pb2QoASfrRbNtNp7nED42joNfp0X+eO+KDp0Ni+81IKDo
         D4q4/mKyq2yAqCSRY+S0YU8jypjAdw4f7QWAxeG9HKfgDmL3dCDk4qRIbtwwb4XBvOZN
         U6uXWJ2DmIwvBtOWet/693FeLBWmsOaBjB1XDzr/jN5KXu9mTm2fGkniilRLdspkoa8c
         8+s0diiHJEz9LNJ+/0InlSU6Xy4yV+vk/XX6oxeVwc03VW/JCUQq7JTc5g8JSyh4BGXl
         WosyLg4CwYaVBujL9Fhkcx0SJngDTJFvJ17FgSJEiNMnt4iEmrO4wc0x24L/fBQ1+njk
         VJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649963; x=1788254763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiTNK7IFa8AHM6UkYKdH66pZJxI4e28AjjdcgC/th50=;
        b=W+cUel0cuwsqoewMhoDJzg55riiSfc0DA/ZGQxFERsT0wqfg/kfl2r3MH4khNunxfa
         7vE6oM/SgPY2bowWfAlApj1Z2Vq93YV7avdP0qaqnhOOCSpDythEtsUUCRE5FbGC/urP
         O7i+e+/plm5ZeoCb4EeeJNDCOpw98ZxhQqCYrbUj+17vFMR67cBeY+jsl2mcW+j/WT1z
         4BZpcBL+xI+hKWvdor1aoxChadpiEb45cLYbmscED5eskCQKDXQhxHhdjptaOmlhHm/+
         qYmWjB+2O6xWGUzE93kPgg/HiMKbRvJZIiNHQ0GkPSrnenVd4HMaeuoPz0vQy5AH4x2b
         x8KA==
X-Gm-Message-State: AFuF++lWG6OKDz00Jtstd+bryFzGONpdDHWxQoGy3srWd8clsLCmBo0N
	+9C1btnmugmMAfAU0mOVGSwRhsZA4RBiYjct19utHZMPAanPLxhnDDG9UtD1OIASOvc=
X-Gm-Gg: AR+sD12xCSz4WbaVka8GwbO3dh32pum7CNo7Bo4rYsVUwpv7jXADM/W4f8wleaNmcSq
	QqXnDVErn5Gqt9f9aCK7mrtOfuywhnY5zWGMFNtgidev1Al2UENcXidXswuxpjU/HUCtxR86XUt
	pm/A+xVSng4PEJgPPhlLOzbuZrT2qyNgktz0QBFwoUd9Vx9sKJcx+uMcyliscSAwM5D+GbVepfA
	EBC1xTEwvs2uzGH4bMfYZs4CFOe0NhBSqptneAZPrNmh06bGFQOLpu0sto2mjOAgbooeTNzcjLF
	hSrVvwz+S6C124+pWAWL4S4Eaw2aBMLdGj88aAzG9pxLqeZMNxuGkgdPXR/aZJ7IcCMAqRFwsNT
	9Ggng6Vh3GnGTKeBjzqK3eNMShQwFpnamrpDOV30buWJ3zZMFi/LU1xK46YdVHMxzoHOvK4SJht
	JbbwBXKU+PDzliSdjVBLy/E0iv6tK2NOWxEJS7g15zl+h6MlJ/YKo6UdQKEX9todn0qraWnA5//
	EI=
X-Received: by 2002:a17:907:9607:b0:c19:6d4a:425b with SMTP id a640c23a62f3a-c24e5b55311mr570377266b.18.1787649962633;
        Tue, 25 Aug 2026 02:26:02 -0700 (PDT)
Received: from fedora.hgw.local ([78.166.112.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm1510277666b.57.2026.08.25.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:26:01 -0700 (PDT)
From: Mehmet Aysel <mehmet4ysel@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Aysel <mehmet4ysel@gmail.com>
Subject: [PATCH 2/2] ASoC: amd: acp3x-es83xx: Add HVY-WXX9/M1060 DMI quirk
Date: Tue, 25 Aug 2026 12:24:32 +0300
Message-ID: <20260825092432.56292-2-mehmet4ysel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825092432.56292-1-mehmet4ysel@gmail.com>
References: <20260825092432.56292-1-mehmet4ysel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add matching DMI table entry for the ES83xx machine driver, so the
HUAWEI HVY-WXX9 / M1060 board (MateBook D16 2021, Ryzen 5 4600H) can
successfully probe its ES8316 codec via the acp3x-es83xx machine
driver, consistent with the existing M1010/M1020/M1040 entries for
the same board name.

Signed-off-by: Mehmet Aysel <mehmet4ysel@gmail.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 141ea47..2e794e3 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -383,6 +383,14 @@ static const struct dmi_system_id acp3x_es83xx_dmi_table[] = {
 		},
 		.driver_data = (void *)(ES83XX_ENABLE_DMIC),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HVY-WXX9"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1060"),
+		},
+		.driver_data = (void *)(ES83XX_ENABLE_DMIC),
+	},
 	{}
 };
 
-- 
2.55.0

