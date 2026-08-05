Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A23438D3FC
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941819; cv=none; b=BGWEXZMcGnMcxxN9/W9gF/HbbZ4tYVsrP1DPcSDPodmvPYYyN+9nlKfdzombFRDBvIJZH+fTVFaAU3NPLx29TfUo0x2nGTAfbG/6TwSCkQDpRn/vekgqfjr4Z3PXUDqQFMZERJL527gVxojoE9Zr3l/LyNbMD/hwvO0ZcwyUQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941819; c=relaxed/simple;
	bh=Fxi47tWj3/NyNe//2v9kC3kr4XC9xDPPhP9JnTgBv7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rwr14U1cs3kXSeDQd93ieKFtPn2OlfuBgF2RQkkY+KNXJZ1YDOYpwBKTu2pwx2LJxh6ZmexambaEJ/e3oPkaUdYWLtLxoDLDzi6IYARBMPmHqgJJhU6BHDPpsdOo2TbNNyPKBl40RLq9gu/wk65r6ZibWieemYSC3sInuVyIM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLOOGCGg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLOOGCGg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so11639575e9.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941816; x=1786546616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg0MOOK6S/0p3zX4MGuoGs+W+gc5BDZqimq1sS5TrdU=;
        b=RLOOGCGg+iZ0/FCDtT70xWMHT71ZbJC3ZIX5YBROmrk8F9kYCMySPnl7SiunhwYbVD
         RAFMnshrYcfPlW3mw2uRDBN0MVKLazD4+Bu7Rnpxoe9Y2bWmJU+NbtyvABrnB+4dNwbM
         3iTXosQpDT1bgC3D9ZJG1AEU6ILs/2cEjzS4mt4nm49p9wJIHz9WIdle9ibKRvepaX71
         zWuvYrC3Cpky00wIY3TsRxoP7BoViRW6nWqSBTUppPU4o4lXbq0TZgYp2LcqhmHDtjdm
         u2Ntf72yP80wkKsvA0ojF0i1RqL/Tb39qKhFnGVmUp8QT0Sz+ifkM3atSXYyQvz9eovD
         Ogvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941816; x=1786546616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lg0MOOK6S/0p3zX4MGuoGs+W+gc5BDZqimq1sS5TrdU=;
        b=g5dC4T9cCjXO+pBpyVu9voXrxgteYJzBJE05B8R+z1uXz0T8jYGytUcgTDLSh+sP20
         iMJtegfM9miNx1GQ8gijub1OO03lgHj0ZhsOHuPZBNxhgPzlfRoAun1konhltbQwhiWx
         nKufZIc2ictKOtchc1KDiavWxNi//2kRHqDwh5TpmVTXgKyMKTPOA/rlXF38HW7Hqp11
         9mSPUmha0RLDWpwXtv+87KmsuKXGeGxXKQQd0npXwirSMhvHtEMonvOuHLKAp8fa32xp
         oW8cpnnmIEJMCGWmdUN+9RpwLb2R2IeIlJhhbOQ64a2GfaH8gWqQWlAujnGwvCxCDrhv
         Zx0Q==
X-Gm-Message-State: AOJu0Yz30e9/x297jeRRmEhkuj7SQs2eqV5fWmnQmk4X+Gwhd3CdXGta
	2HIA7qRzGPl41+Jf3mzLXEFy+b2KSZUWfBV63eXxf3XcMujVDaBmzt7C
X-Gm-Gg: AR+sD10Wlrd8fpTp/7o5dLZXyahF4S0lxbB6ULuJo0gQ73wvuXx3iG2AEMGvQRvAtKO
	yCQswOMjSU9/gz7JgziJpgAYcNczjADfRxgz+O2xfgSgHfbQlR0GE3WevyLU78x43IDMp60tzIg
	p6biAtotQAn/i1NKJA78gw01vOmH+kzokDztucMIDH8r7jSJxQBOn/0gk6IVmAJIYLz5AKnMeyJ
	McUw1pEsEl+4FUsNhA53INZkCDr3lIMmDTSDz4LHtQQCSGS9AA5uDZytt79lpS6VOQgFCSK6PdA
	DWq4ddy54SyMRABOWh4nliibbLxNOseDq0DsdQxZGb5PyGKuhlF4wyrKE++WWZ5RSvEbSpudyqv
	DFFZ13anQmcMSmp4auvF7GP3Sp2+Lix9EBYq1AO36zrsNvNNKxr6681HS/1XoX+JZUT0OBWgKMN
	ul3SfriiZHSGkCI1aP9iMIC+YAQN3nO7R7H6YCAbppepTfgm7dzMsbmA1CdKBmJBD7tcTZHDtZ2
	OjPxn3MGOTyQg1x5DUXSQ==
X-Received: by 2002:a7b:c44d:0:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-4994e7cc5d0mr74388685e9.14.1785941816238;
        Wed, 05 Aug 2026 07:56:56 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99c035sm49252915e9.4.2026.08.05.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:56:55 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] ASoC: core: Support INPUT and OUTPUT DAPM widgets in DT
Date: Wed,  5 Aug 2026 17:56:25 +0300
Message-Id: <20260805145625.1290628-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the DT audio graph parser to instantiate INPUT and OUTPUT DAPM
widgets.

This extends the set of DAPM widgets that can be described in DT and
allows modelling external audio endpoints as part of the DAPM graph.
This is useful for more complex topologies, such as codec-to-codec links
or multi-DAI audio paths, where routing through external endpoints needs
to be expressed using standard DAPM routes.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 44f9bb4473f5..ce71579b5e79 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2864,6 +2864,8 @@ static const struct snd_soc_dapm_widget simple_widgets[] = {
 	SND_SOC_DAPM_LINE("Line", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_INPUT("Input"),
+	SND_SOC_DAPM_OUTPUT("Output"),
 };
 
 int snd_soc_of_parse_audio_simple_widgets(struct snd_soc_card *card,
-- 
2.39.5

