Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC782211A05
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773585199; cv=none; b=iZnFJr5pfnzkUzhtcKdBbwuQlmpXaqeS37i3Ew0rLaXfMMXMdL03pmpEqVnZipuCuOq7cxQ6BMSXNiVwetSzcNBkuADkoUHbU7cTTLfp/1+twy6RgyAcpGJf6IMk0yHeOs/MERA1RK34wzFbkLlYxVhd7UWIR13TS27ro7zC+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773585199; c=relaxed/simple;
	bh=2yzcRgR+gda6zITEtXmABk78zocvpgdavVkxTBLgMQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ym1wxbO68EIlaUL0olx3PnjGtJsTlshCvGED3ynXLSDZWAQ+5LewHfE5GT7Og06UA8RdKoWrF0HDcV+8gX/DXQQxrL/SW4Xzyu0o1mFJgSNNbxFPPctGQIJt4TB+gRq36SsW0xZNKIHHit5hCJUHqClkupAD6+bP1AIKiep8wuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgCyMdMA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgCyMdMA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aecc6b0861so12676745ad.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773585197; x=1774189997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhgrX0eHdlfR4S6KoHi5GKoi0yvogbxUNybTwpVLhCc=;
        b=QgCyMdMABlb4ZeUrDb9/ejRzRGN5eMxPAQ6aHf+fRLI01e6mf+EGFexB5a7FGI9oQm
         XNPPGQa9s3wHCYvPorDNc5Qga9z78pnuQuQFviJf0miEkErR1TS5g1lRPbEe4gBl1ch+
         CzMKgzrNgRUPWDJ+OywJEbYAroQgwu/L0oVElHPY85D8TCXeX7YVlQFSQ2E8K8HLdFLJ
         EeqQgXCapJS4Jmo/RL5PEn3cjhX6e6I7y6WVu5ItAar/fvBb45fstz318fOHCoY763t1
         yvvThpOmIFEbtbh5shMyj+uryTTrX8JsuULlgxYb3ggCETELuj8n74ehkgDT4WC/Mm87
         9cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773585197; x=1774189997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhgrX0eHdlfR4S6KoHi5GKoi0yvogbxUNybTwpVLhCc=;
        b=YeYf4lbIixhxoxWqLXbBELjaoxmFdhCtRHbbCf/LNYOKz/WLo8ubpCv9bUKnfVcaYc
         jSS/4NAN+tUr3tioyLk9BzgGGBka3uySw07BWYF28O6uu5WdKqpP4sJRhmtleE02vu5d
         J/YML/hNGc76usAGwN0P03w4qO6yXnSWKm5Grmcl2VeBd9pkL69G1Z6047eWHLZ/t52E
         Tyy7TVvuMl/Q0F6MmnCSpCA7DmiLXWnCFYWOpJkLr9vlXHAwINXk8Nl6unJk50Jltd3P
         vK5RaamNe3xGSz2zPYXemb2Sm0z3BCBPfx0HFb8mZIDr36lAutjmbdUJXSE7dpFV1lrX
         p8jg==
X-Gm-Message-State: AOJu0YzgN2fra5YKW8BBcyu/SAwc5DQZoOdEBYnVOOm+NH5IJ1kQT7FS
	BIfJ6Q1o+IL+FDhuNRsFphyK+icbsh9JmcNssQTTPm3LXB4JRcccoa0P
X-Gm-Gg: ATEYQzyU/TSNKCOHEKdgxaKulYN+/bS2vod28YICh2oaPlVO7G2PDWb60GcbW2Epr+Z
	rawVx8i1wz9tuU7tEUapRqxAX3wjlujuOO/wVeSNDe8Z51SoACKv2JqVzp8QPLIPe2SODQID2s9
	eUGEzpgNAeJuPbufF06ppNe8p4kQq21B7whguUcA7l73HK8VuJDoOeR6whQj0Y9SG/hiT7+Z+BN
	LbN8DsenmoBWI4MJSfOehNI/rU0cvABwMvyb4XkahQY42ZTngvZ3TAgfQvnAKiY8O8KELSx1c2L
	IFL3MIdKOyxn8AEk97xyoV6lqtS+cr3INPZ1K8kv4ylJvmC7LQsl0P57YL8VKkzjlR/BDfmkmwm
	Uc3126ODQfHXEThplZGa2tA29MdA2FEXL52S+wRJ4CSZL0VakdF6CQObR3xtEBko9ybE9oT9W0H
	cXSJJ/qkT0FAP6jD0L5GFSi38=
X-Received: by 2002:a17:903:3203:b0:2ae:c88c:197 with SMTP id d9443c01a7336-2aeca9eb9cfmr101213005ad.17.1773585197217;
        Sun, 15 Mar 2026 07:33:17 -0700 (PDT)
Received: from vexpertbook ([49.228.234.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8629bbsm74422695ad.88.2026.03.15.07.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:33:16 -0700 (PDT)
From: Vee Satayamas <vsatayamas@gmail.com>
To: perex@perex.cz,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangheng@kylinos.cn,
	Vee Satayamas <vsatayamas@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA
Date: Sun, 15 Mar 2026 21:25:12 +0700
Message-ID: <20260315142511.66029-2-vsatayamas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Asus Expertbook BM1403CDA to resolve the issue of the
internal microphone not being detected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221236
Signed-off-by: Vee Satayamas <vsatayamas@gmail.com>
---
sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1c73d2123b5a..f6920a154417 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -724,6 +724,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "PM1503CDA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "BM1403CDA"),
+		}
+	},
 	{}
 };
 
-- 
2.53.0

