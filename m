Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171631;
	b=z3l1obkSNKPIa+TI2Vxvp8xNShH/Nvc0So1zDel2owKQB4//UigLhnhcmyPyXxgf9OKe
	 DEFdTjMAecLdLVHEsdQINYoR5BFad7KmKalmbuDkWJdHtTSRzhj8jhXjv2joraLJQ8Zkx
	 iB3YWKV3ciz3VhD+b3SnasQhoVsDdYLMlLc5Z1QkgudTQ0PD4XcSWSE3ZCqv2nMYXol00
	 aaOgUhOJpJTnlHOjK8aLuI433HK/jFsf/Ho/EBF1WlLa+bNXoBQWqu/Inos9GGVUNAWt9
	 K8ElPncSU1U2gtC3ailLwLAowchaywYJSyp+pCnvZ1MHUYTob+52TNFDRUFNHUgl/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
	b=xktHMWYKjvmEIVXqvxBDvV5Bu7UaMHOIh4+3wNsu2pOyeA3H3YbxmsbHSI3NdasJnT05
	 sXrCeSDwzAUvVXSbqlXx62Gu6A0ETdn7JiJ/0ZDhUx8IGGJvSUAK6tt4nifxYsvE3Y4Hn
	 1nkzDgkfli6WHNxCbWrLpcVX5/Doz1pYfvaVsiIY//nbGzeiaOElgveO9jnj/tiicG5pJ
	 5V11ujEdvX7BQwr/Bl4Dk87ej6w3ruhD2T3E9IKMuMNqHhhjeIMONC0F+XA/zUAtG21u+
	 brdxX/9/+IjVTTvn24/UiGxwdlzlynSzaGP7bk4LA7R4v7ofKb21lqQJktJPYq1oRsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRbXNFdH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4F606A337
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D4F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRbXNFdH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so1153451c88.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171630; x=1795776430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=PRbXNFdH1tl61XMbtVD48fFCXbhmymkgVwyQ/93GUHKktdVOxd/pxeOOeIMwsM/swp
         byBJWIdYypsgKTjCesALWHAOIxsV05wxxDJJYyOKdEmxTqMr6pHhVWMIXJdiLvbvTOE3
         vYGrMNNV3v818XFc3abRUqVeV2W9boJjtEKlrMBQjgEwug1b2NyPAvMTs8uOeIbLvQ78
         QtBlKfK1wGMO7OMyBfmIRsBqI71S6DL4/xW0Z4FbWj7CzjpLjEq9QajGSVSCPlR8aasA
         ff56guEpOTbwE9+Kb3gNiOAfOZisF66tP5Dq7tqO6XJgRHNQR+tUUNGJfKeK/GZIXZmX
         OAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171630; x=1795776430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=yUdWTUwMA9IW/koL24ldBRRUgBbiteKEEU/3W/3QkEccHVzTIRdcV/ZqBlys4lbs0s
         uKpx3645ZOnRkb03vcVZUo/2vYWt9aBOGhyQWihu+CFS54ySgQjuNM/xt/lJYSFOmyfv
         mocgmVGrL7GKygqkg/NcG48n0crZ066PyaArENlr7cc5df5xifltKicMvHjbZetgHr+A
         mwZV1hFZqnNs2RPESjUZSP9OH1CIQQEkShB3HcwmsTuQb7orAApfUpdMHFCM+gWGaBtJ
         i3uwvqO+zRASrFG9+K33uX4yciqWSH/TmrOtcYy0zm7iwQPxygqFAdBNv2uCC7Vc0Ei0
         AxGg==
X-Forwarded-Encrypted: i=1; AL+hErEwnt3DP5RkUsdoN5squoejW44OwM5Pa/gEO+L+a4EM+MRS1K+lYvd0FLrOpk7qkSbRbm8dGgvCKJs1wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kzJkNNQNzi/gPu8CkH2UpbxxQFEh7yXs73/ECwDETjI0/LtNQ
	zL2932qYoaWtnvaysYmnsAT9lh+d7gWGEwcOZmW2thnWVbIpb2EZZcjX
X-Gm-Gg: AYBFou14qvv/eIVYQzqv+l1j09pSgmSQrkGBkCf6KhjKY2hsYxsXKJTChLxihxzc38a
	RwZ6BOPfzjzz6gFsKOYlqO83cWrpZPEhMJDSMQSaxK9lEKaElPYHGu+SYYpDbZZIMCVZFO5c/ry
	O1uhI8hSP9MA8FepjxNeOY3iDbfvClRdA/NNDgOKI8KkCCAjuj2y6OFk1hz3Sh7OFyfIe+tsIC8
	gDUjZyydV8EScNXr8rqnhYdWieaX6tPL+kO07WSCnV0M1zW4Bn6VGhlewVRAJdz2sIVB0aFIZe4
	eimeYLzzCWS0zMQz8gIWTUP9Pv8kdWwbMSZ2wmvnluUYOy1crF2BzW+t7eH1K+89OXNnw/jv82V
	png8j9ibAwQPgI278yUKL0N5YoqyUUR9Ji2qOhlJ7bLPbOCchs7d8kz4J1KRWOTGYl+RHSutESi
	5dv53H+zV6D5s99GFYjdGmNyNJRpYttFVxOJNHlvp5frwy48HlceybyglMpH/ZYNIW5Y/p1AaAu
	v42n0ibIpODOw3wQAgQlP7Fqix+8YGT1+4Lgj/chWvzdNxYQTazaiYO/TS5OGZyZVOOWPK8r6sb
	50EiRDBosMY9lG3oZeYMCWEP204ynCHGwYmpmPrieKKlCMxQjQqfndOXG/LukHnDGEHvPFlr4Vy
	847X/MSRtgB3FzgKaXFwDUnu+REXiSAJft7xH29bajItI3w==
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr2432306c88.36.1795171630011;
        Fri, 20 Nov 2026 02:47:10 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:09 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:30 +0700
Message-ID: <20261120104630.10240-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. Neither register is marked as volatile, causing regmap
to return cached values instead of reading the hardware.

Add a volatile_reg callback marking IMR and ISR as volatile.

Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 658ff667439c..0406a11caf7d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -165,6 +165,17 @@ static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_spdiftx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -173,6 +184,7 @@ static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.readable_reg = mchp_spdiftx_readable_reg,
 	.writeable_reg = mchp_spdiftx_writeable_reg,
 	.precious_reg = mchp_spdiftx_precious_reg,
+	.volatile_reg = mchp_spdiftx_volatile_reg,
 	.cache_type = REGCACHE_FLAT,
 };
 
-- 
2.43.0

