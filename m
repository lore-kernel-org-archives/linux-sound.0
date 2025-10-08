Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427329D27E
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759940858; cv=none; b=eYkOrLv/HY1B9eEjOm1tmZk+68ovwhDc33AjL1fU0Pz66jbJc+JhoUmQcAGcp5hlw4hL65d5YeX7tPoo4e1HSh4AdFmKop0w/CYQkMF7yzmvs7Us0584bSEkunKQVSs/IApK6u64rUBQXh6GP9od6W1HblFLtRCTdYZ0auYUNEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759940858; c=relaxed/simple;
	bh=3OXuR6x1cne1LuLPDoL64UARuq73uPDb6J+/mL6/TYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZLPQu23ChMu5ge/H7Da+hgcaPqny6K2k+YzU3TU1Lx23TjWh+39x5W3kCQnWydGCM4E5/wfy7Q+hTrzhT18yywL9EosXgII/64flYfYwe2pV66LC9tAxFsBwp5nreLA8mmCCJRfoEwKKCJtHkbv4Tk7eiT/RK8uwXQFbtGEOMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zvwg+TRT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zvwg+TRT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7930132f59aso13612b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759940856; x=1760545656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdFhkBR1PcRYFVfhAlZWxz9why5n4pV8oLNBu5zdtXY=;
        b=Zvwg+TRT4yP7J81L4jH2JjGfsfJjBM0qAheYVuN9oqi1ARazaVzLhpsF2OlaXAUM8M
         hshcdyfkYOdXXeb8TVkcS4GSVviIJ1EcGgzGFKHxAbem5s57+XZLew+vQ1F4EijbcCmU
         N0+SN9qbux1TsnQVHCgQ+dS3u1ztFhHFpiRZYkyxluzsOfKvuX7/N4BbL+nNWoWfhh5n
         7XQxQek21LCT+O95fGLXHAQWGm8cJ06GpbKd7txolrhKEJUVFUOG7AxxBBtOiH32nJOk
         gzu3+Z9XEDdNGsT5J4i+HVdIbxj5kEkR74Wyl6xcQmIGCCmHut56RVQuwOuKC77ipOaO
         arxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759940856; x=1760545656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdFhkBR1PcRYFVfhAlZWxz9why5n4pV8oLNBu5zdtXY=;
        b=QYAdEdUkqL0MY136fOHoF/qHveXXkSNE1S06/zgvTzrXIzvDJqFrIdiCUbSSw5pU8Y
         mgZBzc+sxKkB4iUlPYP981y5umGLwAC7lKIAeiqOvADGcwDLo9e3NSzzOuxGMo2uku5n
         GwppFAz6zJYw1vbQw2EXwHtpRbk7sCKO5PcfjINGBH3W6I5259jl2h7sURYg1XXShd/q
         YrqBNENe6nqxPBZRoHdYgTlV5pPthsTquLB1XuR04f5q7jNzcJjBKVIBxqnmWTQN7Og9
         V87xN4eBAAwBAd61I3X/EjV1ap4wSIMBpSjaN+SYuYL2eLzINe6uiJUHx7Xx/HtKh9Nx
         JSig==
X-Gm-Message-State: AOJu0Yw7N3obIsSYA6G78NROJh/0IptpttrgxPPLGHhhcN3ZZiZBUBVu
	Hxs+x3cKKlA0PIC2kqA4k73Z3jhjxC2YKtpQuauNxV5yocHdYvMmlBkh
X-Gm-Gg: ASbGnctzQqLzVssZG5QDFaFX9NkCWP3MzSahiYjWJGsDS9mu60cBKj0pBX4KDq97rPT
	atpLS+kYtkPoyBgSxZRWZ5idrgZ4rz9/VdrQ+OBYffmd9b3MuhP5R/Uv1Ocjxpn23feKqIaRI92
	7BLFw973AI9fJE9WcoL5ERxELJWqtPivn44tX//3b0uI9+2fqt7DMohmCCFfupqWhehmB6qXvpC
	LdY0PXzj/e8GjZt0PQqYgZYdwFhL+bnQZUvZ6dbywPXbyk81k+k89CJK8Ae7AU4TH95SajJvBhz
	FlSozMqO2Qhov98x6wAuB8PzbLWFNJdlk5zpX7gaJ+3CbO2oVO796JTbhoWhGxdOtkyvTDXO1B2
	5PDR+oZFSKdex1M7GdOUYTNhrPQA8dREKQYc3R8jg3Ava6fhGeVetDTdwS6p9UjLtagtBKE4a
X-Google-Smtp-Source: AGHT+IGIDMHJS9uSnRI5d6+ZuW+SpcTwXd+6qoqDjXwMnJYilH2VooX7wIw5WlvG0u0iIPvrIEtOFQ==
X-Received: by 2002:a05:6a20:958f:b0:32b:83ae:e9ac with SMTP id adf61e73a8af0-32da80db4cbmr5236589637.12.1759940856013;
        Wed, 08 Oct 2025 09:27:36 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3b9c6sm18538746a12.23.2025.10.08.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:27:35 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] ASoC: wm8978: add missing BCLK divider setup
Date: Thu,  9 Oct 2025 00:27:19 +0800
Message-ID: <20251008162719.1829-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous WM8978 codec driver versions, wm8978_set_dai_clkdiv
might not have been called for BCLK, leaving the bit clock
divider unconfigured. This could cause incorrect or unstable audio
clocks depending on sample rate and word length.

This patch adds a check in wm8978_hw_params: if the BCLK divider
has not been set via wm8978_set_dai_clkdiv, it is dynamically
calculated and configured at runtime.
This ensures that BCLK is always correctly set, whether the
machine driver configures it explicitly or not.

Apart from this core patch, due to request from Mark Brown and
Charles Keepax. Overclock BCLK setup is applied, and dropped the
possible lowest error BCLK result. On top of the overclocking,
warning message is given to user as a reminding.
This patch author do not agree with this design nor
concept from first place!

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..73ceca9782ae 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -99,6 +99,7 @@ struct wm8978_priv {
 	unsigned int f_mclk;
 	unsigned int f_256fs;
 	unsigned int f_opclk;
+	bool bclk_set;
 	int mclk_idx;
 	enum wm8978_sysclk_src sysclk;
 };
@@ -590,6 +591,7 @@ static int wm8978_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	case WM8978_BCLKDIV:
 		if (div & ~0x1c)
 			return -EINVAL;
+		wm8978->bclk_set = true;
 		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, div);
 		break;
 	default:
@@ -717,6 +719,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
+	unsigned int bclk, bclkdiv = 0, min_diff = UINT_MAX;
+	unsigned int target_bclk = params_rate(params) * params_width(params) * 2;
+	/* WM8978 supports divisors */
+	static const int bclk_divs[] = {1, 2, 4, 8, 16, 32};
+
 	struct snd_soc_component *component = dai->component;
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	/* Word length mask = 0x60 */
@@ -820,6 +827,32 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	if (!wm8978->bclk_set) {
+		for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+			bclk = wm8978->f_256fs / bclk_divs[i];
+
+			if (bclk < target_bclk) {
+				if (min_diff != 0)
+					dev_warn(component->dev,
+						 "Auto BCLK cannot fit, BCLK using: #%u\n",
+						 wm8978->f_256fs / bclk_divs[bclkdiv]);
+				break;
+			}
+
+			if (abs(bclk - target_bclk) < min_diff) {
+				min_diff = abs(bclk - target_bclk);
+				bclkdiv = i;
+			}
+		}
+
+		dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+			__func__, params_rate(params), params_width(params), target_bclk,
+			bclk_divs[bclkdiv]);
+
+		/* BCLKDIV divisor mask = 0x1c */
+		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+	}
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

