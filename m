Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A5402435
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975017; cv=none; b=uK47nDSEEY8mGYnE64IOaZxqzRd7oK62aSVieHBFUVggtwdFI7w6QJMknguL+cXlkAtGQVIpDiq/0voDU7+AbGXgrzvxlfM9BodX2bxAq2P9DU8vL9Q4sjAbNzU8KpgSGrGd8p17V5zG6SkXPH91E8nfit+sslkelafRwNX4j30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975017; c=relaxed/simple;
	bh=cbJ9/tet7CzfKxXA0yxXN6cHWGj8TOdzJxeRIK+7mCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q02N6GcL2Z5baeVkeg6XCYw0e59WCkGfkDJzUcjx3ll18+h9kFKE058daev5BEBNL25rGCiia4eh4859kEzX68uerIdEmsusmwDay68loejocd79yhEdOKGQ26iFEt5wiMtd6B2mFvq9CgSkWgMIgAud3fG6ZuZoSQIHiOOVoaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/pB2b9u; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/pB2b9u"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fede2acso17264875ad.3
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975016; x=1775579816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD839RbG5ZBrMZ9bhOhi1yt6xxK+tKautdFVEVaG3C0=;
        b=g/pB2b9uzk0xRVqlBaxNTloaEEKxaAQzzxrB+mQoplArwy2jE3OKOpQY7HkupqBGQy
         6UfIPDaTlFLPdiPU8b/A16Ndt0b/tincxD0F/w85XlMRispdrQjOzeZasE5BqeEYGhPk
         VDgjr2i7OetNCxkwVekE5w434pr7jCvydXffQLP3z3md/EZ8Bb916Q6eMrA2bIFXJ3Su
         U4dKjWjlPtfWDE2enn7Jm10vher7MErMgbSy5msUfnE5XzftQNFqBL9ygHXQc2epydy3
         eC38fd/qTBNSyA3o4zhoL64pz4AswPjVkEHUNgXL5tskOL2Bh5inikcJcbR+obkMSZBv
         HpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975016; x=1775579816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SD839RbG5ZBrMZ9bhOhi1yt6xxK+tKautdFVEVaG3C0=;
        b=iXxoMHmy3Dsk/l+TyCgyEcVkK95uHH0DzH+ejxziX9F0+2QCifVsCazNScfrmaNlF+
         onzKlIYd7jgUyDGd/iRIF1oB9yRLXPhiQQFRr1f7nPIlbldxFjko8rRMoZ6sz77IOQBe
         DZY7rpKaKXhy+qLuolamLuuNY0/EB6x6DVQqOAgQPL14Aj2GBCiIBTKI5EfEjlxCzwm4
         8FC2DX1HER5o9f8NpuG6erQxxX8miDlYKPCKlObQI2uxkDAKcTZRpkc5HjlZA8YI3ZiX
         q3Kn0HS6QnJ5oh7qeBK4F43b/9lO5diU62+2Or2Rlt/eWHae79k39Q7DsrMuTDVS7g4N
         PmrA==
X-Forwarded-Encrypted: i=1; AJvYcCVYXnmeTCoFpD+hpLUIsT4cQOyX08idL19UcN3bQZunb/KvSuvVYkAvTBYtebspA73RXpo+qKC7+vfYVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOtpMJHWgwaXBgKYGaXB6H4CqZqoQMc3O0pRGT3p7CJonNblJt
	HiFH/Zb/sf7d82RnFk+8BYjUC3Hm69BTr5OxHClp0uFDfi6LJbVgQZbU
X-Gm-Gg: ATEYQzzPnkcxsb5EnzfI5FHyv9eAYQXlwz1/NFXrFQIrIbou2CYSF2DeKX9n8I8ShiF
	SFW18oY0/LDNy61cLGZErNNKhBFedg26Yu73rzyOhlgU+eWYsYxcrpe4uAQcEtmcFkc0S29zJOh
	Bslep6W+MxyhY8ETVIyizyavYZX/zm0eobzrEEWNYwTLaxsaDgItMOnnbiTpI2AX72L/Q5b+PfB
	hK3swDBrgyf7qOfif0/FAuzCWevJDz+lPIZ4Dx0pGjuvGcMThjGba/AR+9ODUSn95oAx9CtShDB
	s2K/d2MHjX/dJCWjRs5fy3usa4Y8DXcTVLAoyGpEBePLEcIBE7v1fujdRV7MuauquptuH2lD2oW
	/siGRrWF+Bm4mhQHJDBICGi3gYtFPbszE3Ji+7dDEIzOPciANxtDot5Iu/JvG7wiiYXnorO2QKF
	zr9W+aFGTH9bhMkaok973spHuZ7FYKjJx/VUdueyyLxfYlqFlE
X-Received: by 2002:a17:902:d4c1:b0:2b0:71da:4ed7 with SMTP id d9443c01a7336-2b0cdd3ed57mr171864535ad.25.1774975015959;
        Tue, 31 Mar 2026 09:36:55 -0700 (PDT)
Received: from debian.killsync.com ([152.59.222.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm116069255ad.65.2026.03.31.09.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:36:55 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v5 2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Tue, 31 Mar 2026 12:36:33 -0400
Message-ID: <20260331163636.15238-3-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
References: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..e2f59a008b29 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -209,6 +209,9 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
+		if (ret < 0) {
+			clk_disable_unprepare(priv->mclk);
+		}
 	} else {
 		/*
 		 * Set codec clock source to internal clock before
-- 
2.47.3

