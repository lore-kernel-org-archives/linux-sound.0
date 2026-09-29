Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A133FCB3A
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662333; cv=none; b=k5jF0cp+cwrycXBebzxSshh513uT1MII2897bSERAi3qRZKzhbYh4JEMbKPnzCV0CGC6Y+fpUfgE+u71X7jVP8GEqPCkTKqkkZn/oc082abrGl7L/RUx45jBmtjkK8ZM+1k99JSGyVsVRF+V9GE1Wvt2C1zdN7o4sXsnTc0sn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662333; c=relaxed/simple;
	bh=wQeyLinuu+WOuieHCEmL9Z9wKarJd6MhscY8RHxTvis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjwmwRboNGMuEts6VbcIrfZscDzXy6cRkgmEc36LCqEghG0mdduYp9scAevwTYqG/Gb4Us9v2BpxbMavbt0PFjikbvWcv109OsWNr9CPFYY4yq3wm+clQMHoLfszIjFF0IjWnmtzKDuD9ZaRWk9SIhqlCkdFMJcdp3YTvRQjloE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em0OS/zl; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em0OS/zl"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c9c2df74so17162a12.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662331; x=1791267131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=Em0OS/zlP25dNaivw70foLvDhseYa+cAGnZEVOy6RtWdztmhW2HtWlLpdi3TXwum5w
         CAqo5jlSpDPA8Alx+EEl8Z837BFPIZzfDHaWkTlS+XgoxmuweitM4b97QKHNnbsQ7KtL
         pgQsFySVte456r6I0f13Ja1CePQDE/Duu6Tp/LQTMxsPU1grmtzNi+UF/MSh9QIk3DPM
         UQcSgGXhjwhpUeqsBqPwuwvtNwl4QnWvRSHP4z0ZcHIgt3UX+YR/R51uMdJj3IwRetD3
         incTm7kUHqzs8wBOxMx5qafWgua6+qCzeHvLVTH6vEZrlvhIU0Rl7m4107oCLM5f5yII
         gV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662331; x=1791267131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=gKKTvZtsXslndnHavTYBcDQYLUsihLNNORBIMP4+6HVszaONyfl+/8xS2jhF+nj8QP
         ma7Rkut4dffW9Z/CH+isFeVNgk+2rIsp109HmjnMwXuDiygy5ULJZVfMpzrgAvQP6nKB
         oJBp75ET8riTjX902rZi+EgvbyGSPobf3j0hKQF3n8kuXu7UjRoa9g3Ghy4uFyRbZhVV
         UTWGawavfcXaQbQix/Q+Ti26cHTRpsVaWFouBnhAgp74VmG6i2qg+xW9D7MYg4gzxP+w
         6ptS4c8Fhh8U1hoj7XIaHl5oaXwzv5bRj1/NdofKjbBQl9QLqcy0UPZcQENafqri3kPh
         IScA==
X-Forwarded-Encrypted: i=1; AKwUvBzK+djCmVpOqqyfsQSLQKBh/UN84EcogNhvABhoVzMLsjA9xzWNY9+66mXf7Den5lMqeFCBnPxIDa2WhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3HRu1wV8z3CEJUF9Zx8A10tgZif5EHXPWIET0debdPcx+bZs+
	b3HQlfhr3h9BhzelD4RhPZ3NzQIRU0MtQ81sROhylfXcn6mfIpmrnJd9
X-Gm-Gg: AYBFou2gMO8yzjBB5RUORZF1gHErZbpXFZFwBpeLei3gpJ95Tttnai8/svPeEW5OBrG
	3GoTXmy6JjMMj6hP72qiXqNvx1hcmHo6Ns60L7+4op4YfFCc5/VE2pP20BbdWhDVghrplphiCTR
	4zTeOghAJ8w4WuXQLdvsgGw+Eb3bkLESBax4/XSUh7l4k9j1yEhZ1ueP9QcZyn+PhwPGlu5rBmm
	Tt4saSIdGnkZHDoyiVFIEQYXNq1+YR1tBuLV9WyRlTN17AQoUYjY2VM20vpYw7aOPrGNF5kNXsf
	an3diAfxFsNFwbHROD+WWe9sLUOFNvV/Mw73npI4Exu9kPy7WiisCJtpb31Qak73nFnua4Nod4M
	QcFM1JjVijpdUfMPQ3sQ4Fg3IrPrQSgw1k5ZbXTQaxvXvxOJATB/7P47m6z7HMhUea8uH0E3tx5
	jBOYysqCZUEkQmW3IwZzdERSpy16cuz1I1fXXagrKOKAT6xkmw8jdgzUNpkjeLeX+JWkrCQqkkx
	ouoSOUn6f54TCplkZzlNr7kSnywPQwigpsahtD33LdKsVwcZLS6V1xhmZubljWzXTZiB0aJf+FC
	w2GM5QiUVVmjJg==
X-Received: by 2002:a17:90a:e7cb:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a49c1a1183mr871310a91.32.1790662330868;
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/10] ASoC: mediatek: mt8196: fix MCK error handling
Date: Tue, 29 Sep 2026 13:11:14 +0700
Message-ID: <20260929061121.124001-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Disable the clock if setting its rate fails after the clock has been
enabled, preventing it from being left enabled on the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1dc4210e58c7..1d107b85d03c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -502,8 +502,10 @@ int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		return ret;
 
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
-	if (ret)
+	if (ret) {
+		mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

