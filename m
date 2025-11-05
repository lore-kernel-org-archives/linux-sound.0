Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AD3203BB
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358611; cv=none; b=VWUMwhqZGgbZ3NAchjD8ekkgDsoS85wqGg94+SDweS56PIz2zZvu1r/rR4fPH93TQnsLL/WiKFpsROn5O8CJibQQuxJ7aDuvCnKQ2GF5O1gDTAGg/bjbdTxh2Dvpu2Bi4IuUzHXcDE2xFf2O4qRlJ9p3vNQmwLJlSNJJNzJB9zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358611; c=relaxed/simple;
	bh=l0Nk7GVBJ1qI7KNylnbSMpoEa3nN+cyLJ8/L2EcFb0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T86uURcf+A6knIWbBA4SiwTtLBQUmrX5cE1O4W15jIfzjzfhPran9a1isXoAhrDnDf9IKrKNTPuZAdxQXNOANVm2lbzQWhX8CZbKozdy1eYgE3C/5RHQOfQ+hYjeNWbZaTNBj4xUJYpSlaxnM3nOzgBroeC1gMxUwtOhdc78mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bx7IIG4j; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bx7IIG4j"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso21341b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Nov 2025 08:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358609; x=1762963409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=Bx7IIG4j/E4yaZYGmuQ5xX/zbhEK/nWPnOv6VfWQd/m2ip7V6gpd5RUWdyB+eiOjpg
         GfT27+qFz+2gi0Pb5DZ3JkM3eqP9oedgT+VidU9IR1cZ4gjQR2aMg7Dod67uUFcMJ8kc
         OuO84d/Dibq++txeq1/bJxxszUrN48toUVP8KLKhN2fN3o9RVkPVoFZezoP7RgTgooOf
         McVrtJmDHBbXZIdicwUjEb8EdkxETLR7zNsW32V58yH2HxIrhXcdo6qNQ4ltsRiIqPTy
         Gs1XV01pck8BOt4F0/ZLgYCk9o0C3N9+O6ja1qXXgbLGqFz0svDeckz2Tlt+fgM7pLhK
         lJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358609; x=1762963409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=oBbh3dG4Mq/citU5CWMx3Kpt9oEQ2DGzMZEHfb+CqAkEyMt9atXJsgZLpbs9FqGsFM
         CBLH+Y3tPw/b1/EtVHDy3zzxP5PZ8H/rwNlWG376svSfLB/kNFPvZiBDTjRMA7lAznJy
         kX/lI0wgcpGxifPfLHO/KZu+Z8mYsS++riaTwstFrdn24YVXC2YHcJzWRzPVgDCoa07K
         ItwX2Y38DfbZmZv4ZU9UuN2A+kzLxWga6+6/RVQlopGhp3uLKhsop+Ph2FuVcbnqbLsc
         0gvqDz0fyAixJwbFEzqcIv+PDH+S2pNi17a+bwzQOcZKNcT9ruh66iQUdAqytSy2b4Di
         q67w==
X-Gm-Message-State: AOJu0YwrUvXt3YzoxWkrnZXj41L8f90XjF0As12uMYMZoFeKsM3KVFQ4
	MAE5fazqdoueGA7ox0vigQXHsKUUGNt0w8D5pk2t5p+3/VCBFjIOZLac
X-Gm-Gg: ASbGncstraUeC9CZoaoKrDZbkRVqoS9Gjohfx4iuVvVq2QoZqylqPQ9CjAJTxpD505o
	DIP3whDrDNVWOE4Fls8d2kpQAl3fnQMkgqCjgXg/ZyLrKMwjO3DubTV2AxYf2B2Ydl0r/6I7pfH
	TEjNy7rwb1W8wmXk94xhewTKyf6y/dilkfBzjoobyCLQq1PFZbwp57gZjI+5/+VjxPK5fmWMGv7
	w0PB3Y9h/UcRfZfaSynvFaRIJTHtVloa09wKRy1ZzEwtznZ1OAyJ3poofY5D5V6uLnMjSbOtxRy
	uMpPQCoJoHj32DrLJRR7bWQ3IgYRv3p0uFvrF+NxiwGGQobmW7PM2bEAaXr9C0kBg52HM9+lUZm
	bBGzcWLYhy3HXTbkqhJ5I/qDd1tpK+vNgGpLl4CUXNGZhilYogx/AgZ7Gb2cVZdgrGZzLJ77CVo
	JIAuknmPZet9s=
X-Google-Smtp-Source: AGHT+IHJwjnUIGI8gDNaxibj4sXg44XjKfIRuSM7Iw8kysNt9Y+apm7udBv6IooCou81dlnb75b3uA==
X-Received: by 2002:a05:6a00:a03:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ae1ed9f9femr4377537b3a.16.1762358608506;
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
Received: from [192.168.72.66] ([240e:441:9718:7c7:b13e:ed12:9e56:bf18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6823f78sm6638331b3a.63.2025.11.05.08.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
From: Goko Mell <goku.sonxin626@gmail.com>
Date: Thu, 06 Nov 2025 00:03:16 +0800
Subject: [PATCH] ASoC: spacemit: fix incorrect error check for sspa clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEN1C2kC/x2MywqAIBAAf0X23IJaBvUr0cF0qz30wI0Iwn9PO
 s7AzAtCiUmgVy8kuln42AuYSkFY/b4QciwMVltnjHYopw+08YVsBWd+kNo6ts75qWsClOxMVPS
 /HMacPytboKhiAAAA
X-Change-ID: 20251105-spacemit-i2s-fix-e63d655ab94c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Goko Mell <goku.sonxin626@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762358601; l=1364;
 i=goku.sonxin626@gmail.com; s=20250522; h=from:subject:message-id;
 bh=l0Nk7GVBJ1qI7KNylnbSMpoEa3nN+cyLJ8/L2EcFb0c=;
 b=XpqASyQW0RdHbCLkEf2XfIsntbTBZK8hH71TYZgySwP0P0jIrF2a24Krhc5ELR/kzKnFBR+nV
 WhQD04oBe62Dg+xi0OVCFhFRVVymT8BGqaaQW3Tdd9/O3KDLSgKAMh1
X-Developer-Key: i=goku.sonxin626@gmail.com; a=ed25519;
 pk=YAEtp1QQ+5hMv+clz+l2GN5MRRfR5AvnzZi99Qxamqc=

Fix a wrong IS_ERR() check in spacemit_i2s_probe() where `clk` was used
instead of `i2s->sspa_clk`.

Signed-off-by: Goko Mell <goku.sonxin626@gmail.com>
---
This patch fixes a wrong IS_ERR() check in spacemit_i2s_probe() where
`clk` was used instead of the correct `i2s->sspa_clk`.
---
 sound/soc/spacemit/k1_i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8af05e1604f518b63cbbbaa66b73cfee8262d87f..1cb99f1abc7cde3370ca643c8b955132d8a1013a 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -414,8 +414,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
 
 	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
-	if (IS_ERR(clk))
-		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
+	if (IS_ERR(i2s->sspa_clk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
+				     "failed to enable sspa clock\n");
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))

---
base-commit: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
change-id: 20251105-spacemit-i2s-fix-e63d655ab94c

Best regards,
-- 
Goko Mell <goku.sonxin626@gmail.com>

