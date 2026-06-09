Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1C404BE6
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005187; cv=none; b=qQAz2s00Bz/Mn/nj5oPYAqbcBCN2tO6jPlvw3lOTSzaIWeJW1hgtlWg/l5iRzmStWLtIvea66pylwMSyTqVTAyPJda9LcwvE9TEDtor/TVMBKGjAGxbFfSTIeaurY+O4QymhGvMmb+rve9J5RXgTPuUKgcI8CGZvrFTISL67Xeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005187; c=relaxed/simple;
	bh=kTAg9q9u6VoW+qN869GenvQcA+UPoEV0Jn/gySZyMr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSrvUMNYGit67WDKM+E+WgH4Z/izmCGlbArCQsbZHeLamH15AI5JnMxHb/6WRF/OmWj+kDvA5DJBVGTNP1poJKDNeBdmIM6zXkDxEzrXxNOXi8sKeJm0mVtVep3LjGayGa1XG991Fg1lRC2qaUxFmH9RK62LXMvzw0PZNUea9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADf8QRM9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADf8QRM9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b8d414666so3048935a91.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005185; x=1781609985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3igX93L19Hd9A1VIL7yayX5x/YnSKR6u0HXaQm3XtM=;
        b=ADf8QRM9I/Dn+EnWodaEHM/QAmnovXtJWlFfFdUGOtHAknGN0WSw92OitysZMdi5/o
         aGv4z9YW7Sz2S4ayyszXbNij30TaHuBi1iwNUyJ01TAllbHFW5k7zR4DgmBsBBLqpEDD
         QhPhYnC4nqQkmtSGgsflU8hjFt4l9lR/UXIEvaVxQirNQLKtTyX/yVl866DoXm9Ko2Jq
         eJX7Op8fHZLC94ESl8IetHgSEU/C5Up4b9tCvksWp2XlHe/bqBjQzUsMi1XQqV6bZZMz
         GzjgP+0Ju2i+qsIE8j0joUQX1bbo+ES1ClNkwsj25y/RR8mJKE8SaWBtx5vsESqAUiUH
         tv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005185; x=1781609985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3igX93L19Hd9A1VIL7yayX5x/YnSKR6u0HXaQm3XtM=;
        b=qMG8glkj17Pf+NN5AK8mfk1sU7sWdmRUdqIPtuFMc1VOx+x5CpYI4GnIEVlnZhlTjX
         HCv+q8FfrkDOaCkLyngBDFgY3fP1pY9eSN9Ek5InWQf+ctOi5ATWnk/jXYT6a2ULSFr1
         IrOcKC++qqqG7SLQqyp7mZj2QORjZuHGLJJceXA98Y3qmp2CzvbwKYjZbBj9r+kMtvxv
         ISxNRpmICa8HlEwczKOwA0kxaTKWGAn/rQUBTGaq0H78X9Hf4Vf6ziTjxYj90h9nNYuQ
         FyOu1QBdOG73/goXaZaq4H635DnYILTz3JkoAhA/82gxuEa7ACor4JiPTa86V0CCqr0d
         WekA==
X-Forwarded-Encrypted: i=1; AFNElJ+93wFI4IXhwj4nvAh2fdgFq6fYUqwQ2XePSWJ/SnOJ69JVaDPwTOllqylneFcn0tT76n2FSnAmG05UwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkhRF8JqQrqPo8Tbi5tJQSqYyZMQsno3S5VxF5xZ6A6rz4Gm7
	4K6YKjd0/UE9rkI+9u1lWK/e6s0t5Ylkj90RJ6EQACzvz4/Hmo10BOvf
X-Gm-Gg: Acq92OGGBqSVorH60ubO5+cqU/rd9azXvD8SDY22yhliGf+1lxh4WpzLi43uXX9YE0X
	tYVQW2Lt/ByNGhTNe17sCuS838BI+Wftu1mEcq9xhbDbk1T23dTah5DQHyEXw5Ld40EcJ+kDdIK
	3f8UzmQHj1OcEpQJhHPa0ZEIhZMzJUvMaOTpop++/lkgQMfLGn0K/Hv1kN2HV8u0BihhNlrUHZK
	1WJsNZ60T34mAJSt0wbJiIfSa0wqqviGSjRwb6LZA6jctodjxvvsGokIohD3KjRwUSQ7af1Y3/N
	CWbgv468hMPhaEqf1GPvuRfdEsb7i0fOVvWbuEDKn7tQlFymFUu0kDCJVpcPuxXixFJjtXXp8B7
	myzaugJBtkE+JSSLdQom+XYhwMFgHKn427xi3Rpv+cN8/9BeJdisJAvV74qoZb30NZ4qqRpmt97
	0Q7PTKibryN7nm0ED6p+FFqUg+LPSMVB0qr+a3fUdsMZdQm6zFA+4fHvVXcTrwWU7k4KoF
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr37204835ad.9.1781005185183;
        Tue, 09 Jun 2026 04:39:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Tue,  9 Jun 2026 18:38:35 +0700
Message-ID: <20260609113836.45079-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown().
This ensures clk_prepare() and clk_unprepare() are executed from
sleepable contexts and keeps clocks prepared only while audio streams
are active.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
Changes in v5:
 - Drop count & spu_count and rely on the clk core for clock reference
   counting.
Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 51 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 716ecf0401fe..e26f39dfe059 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -730,6 +730,54 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
 		fsi->clock.rate;
 }
 
+static int fsi_clk_prepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+	int ret;
+
+	ret = clk_prepare(spu);
+	if (ret)
+		return ret;
+	ret = clk_prepare(xck);
+	if (ret)
+		goto err_spu;
+	ret = clk_prepare(ick);
+	if (ret)
+		goto err_xck;
+	ret = clk_prepare(div);
+	if (ret)
+		goto err_ick;
+
+	return 0;
+
+err_ick:
+	clk_unprepare(ick);
+err_xck:
+	clk_unprepare(xck);
+err_spu:
+	clk_unprepare(spu);
+
+	return ret;
+}
+
+static void fsi_clk_unprepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+
+	clk_unprepare(div);
+	clk_unprepare(ick);
+	clk_unprepare(xck);
+	clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
@@ -1580,7 +1628,7 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 
 	fsi_clk_invalid(fsi);
 
-	return 0;
+	return fsi_clk_prepare(fsi);
 }
 
 static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
@@ -1588,6 +1636,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
-- 
2.43.0

