Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C04E3771
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662064; cv=none; b=Z1AGZULgyL74LAIXiN4EKBgF/RjLiKyf9+M7LawaflbkgogrkrZho35iwJVFWLtT5Emq5GwqN3/a/SVli6JVqSvm1heGyQzxlQcO5x/hj8l5K5VTrqyff6mIQG5tDNCq6S8c/I3xatdMU1VrOjw2S1wVI57vzGXwKaTFocRllwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662064; c=relaxed/simple;
	bh=JQixsyyJcxvuq6vRrhWqfb0xYNZFr9S1o/h/Dp63Ezk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfikytxXrxAS8vOyHGS61K6mzzHJM8sPlrGadmNSJl84CJzhhP2NNQzRSfBuNtSl0yDEMq4BAb3VHEXjbkGG7OTcg9Bbk3ytT4v04X77VxottMIlH9K3ERCmYghVkYCHhNZMwrT4r+Q9D/MtZYvi8a1xr4wdrVeNFcE8AjcssHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McV40nA2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McV40nA2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1133359a91.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662062; x=1781266862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLfT4vQgEatwltGv+p1FnX+A7JnfmLWZ/F6m5Pdu0sU=;
        b=McV40nA2V6AKKc4/J8JDKMvC75hnCF1tNzuEQvxPC1ShJ7X/3Bjot5YanYmdpZpEr2
         uw1hxT4bWg6YVvSSOPCiMPgn5p8hspjiF5jXeMdh7Qv9ug2uPqoFWM2xyOEyz2l5Y/lI
         GM8I/DDE+CXvjol6jkqgTpYbob1AAo1OfCiNS24vfHrXDUvaXSmBqNuo+m7+k9+5PZvv
         57Hbh2K8i5h7FaqJn5FEq3nSqSbKKCGvdBv8bwlRvj/O8tvlLxZRcVP1YW3RFSkRxfAS
         Kcw4ZspX2L4WqRUar1SD1HNvSjSQMVa8cYfz7t12dn5LWRMXQLslSZapnrMzye9q0TEz
         3ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662062; x=1781266862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLfT4vQgEatwltGv+p1FnX+A7JnfmLWZ/F6m5Pdu0sU=;
        b=EztSz/w0CtY1iQqEzPp1SsvT9j5rsJDqUdauLfqoxjgo4LBKlsytswj89k7CZPHhJ2
         bpk4Fp5e3+qTbDaiKudCA/iejr6p5pqQSdcAepoviPZZxDJtgg7PH48m1xIUN0ri/9Zr
         TBSFmiALt3nETZfbm5nKPiBatEtd+miE6WstnkpP+k3YxCY+atYEEEEUm3RflamSkgDP
         xJjZjyNprHXXieQ2bTN9NfLyLt9HNa+9mQ7BlXZNBGG9eH12tT7qUm7fi3ntKMnapd0U
         Fkt8XYJGGspP0e0VGM6kuKy9W/ibqm6+WIeB0MB7JME40uOmnsR9byYWZPMLxSo9GBhf
         sbhg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y5/MM/t2STNubEaQTGala0VieG+uT7THYjkF480ENuhrwiTIKAjL8IfQgyZzj5kAqEc4EYp9DC6UHyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaGrPIK631MvVjoZip/TCqRt1xq89ZJVYTODUStgviaN0OJC7
	2t+tE505KXIBPih89dq6SjuJLu5ht7E07K1BSq9Ir/WnmfA7JN9ZxtPo
X-Gm-Gg: Acq92OH1B6iqtQIqkzvOQj5iHAd+5pka7S+W++xuZCXUDDeLonvoTVM917cdKZXVkpJ
	HHmc1vP7nNb3sgV9Zj3gSopwPflSDAgTdOdqoUTnyyKvz3w144c53fLVhSWR6Y4/hizgTcCR5pR
	8A+3aszQVbHDRGtFl8Od5JQ2+JXgo37QorP/2Z5aksDa0wrCdXs5SkUrL+urnd4L3pHRZ5xYdeB
	BELEsfj+UNq5Hc8QnI3rr9dqf/9rHMp0j9cYMhIfzWeEz6ZjgY97bR2PVkGdNMJfFECY0+9TATx
	3D7y098ZgVkwC/e4QK1d8LnG/QVgth6gudQB1umCZ4nU05VFIu7oXiHvFDg2iBBh1cCFuq9WJBu
	j0XpfSqtYVDjO9oMwULgxRvelZ1fpA2pYCkgzRyeeyBcbH/wTaAXWlQbjNuapcay3n2B927UHzP
	yOL8R5aFyA37fvMduFa3TDZQorzSkAiFplXnbzh2SKBKrYBgAd84Y9WiWbaH2rwGmdwFqH
X-Received: by 2002:a17:90b:558d:b0:369:747b:48b8 with SMTP id 98e67ed59e1d1-370ef3e8b74mr3862879a91.8.1780662062568;
        Fri, 05 Jun 2026 05:21:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:21:02 -0700 (PDT)
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
Subject: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Fri,  5 Jun 2026 19:19:54 +0700
Message-ID: <20260605121955.105661-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 6537321242c0..d7cc5a14a099 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1585,6 +1585,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+
+	/* enable spu clock */
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (fsi->master->spu_count == 0) {
+				ret = clk_enable(fsi->master->clk_spu);
+				if (ret < 0)
+					return ret;
+			}
+				fsi->master->spu_count++;
+		}
+	}
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1642,6 +1655,12 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (--fsi->master->spu_count == 0)
+				clk_disable(fsi->master->clk_spu);
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0

