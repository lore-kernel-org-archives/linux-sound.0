Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C3C51477D
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738832; cv=none; b=i2X3fNa7MyUE88F23G5nsuCrzd/iYIv7YddOQm7N9kJvgrsmktPA7X1+BfzYBLb24/z27dcYEtBgpEnRk3uHINXLct2DePr+BVDfUJ3eCf7bFfysAzz0CbrF39BMXum1eygyqN4CwJxclTqZ32gf/QO6vlua24q5xL0moL3b89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738832; c=relaxed/simple;
	bh=TK4GwSqVSypRNEvyHlH/Z4mogXq1weHNEeLJ8TY7A+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjhpSKK4Z5F8fvGIvOMMyzVQEmP2DCDCA4Pd106+GbSAGL0Dr9ymDNUt9Wnmm89T1l94xKEvd1txPF2SEnHgKsL0N6GPCEOsbRf2LnTF/yeJAySv0n8vC2fNz0ANFLcINJEJN1+nVFO+0c/dh4E1INpPUsrr1qG5lbZ1fZ9ekkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmwTAPeK; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmwTAPeK"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so268427a91.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738830; x=1790343630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=dmwTAPeKlMiphPge+gs2lC/Uah8BFhr3JMWBtwqy/tLALHGAWqZuBy7Vx/5wbGa8VV
         IhV7G9eOMLCKAuzT3rJ8bqJsX8WeiSsn08pUgBC/DBSbANQczhIaTxlLaspVOW5yAd3d
         Pd8OH9gPbmHgkiVW+o0Lq1kIvcPgOEEEmoaQVuLAyLSpaLDmcTj82KFfMN8Zur7fAy9R
         DzdpYA65mCedkKoq263H1zfxOS61j8Ebn8i+8PuxYVgQ63/tZ4q9LTDvC+2jsK0E9aqS
         WNt41ZcBQDSntrRxs0gWXf9Kn/dmyf0boFyUEQVd/gCpxSrUbfawduTOILse6SEfiuTa
         P+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738830; x=1790343630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=OEeEBZK1M9tTmrVcxerIoLL7DEPxyrBc2JGdQeUtJ2WIqaWSvtsEFZhggZgyEYiN8j
         /uHvZJYC6bd91tY6c69apvd9hx7BBbLeM53ZlOXPTzg9zNzbmlUkr7uwpN1yPDXBfkZD
         jRgFHKXIALrNzTq/JnwnTVaL7Zie439MzEu0lJKiEczxSWILIdvrFcdD/+KivJs1cwO9
         0i+MW6nqIFpI+Ys/MIsKtJ4VBrxEWC9WHq9Rn2tL4AKSCJf8HGO9cmYJRMlrwR7bM0ju
         KG6jndFLy6OUNmxvvtFFMtpiDtpnCqsb9pH5EGNFIMCZGZRhIWlcjKVPs7rKIbZFVTvm
         f8Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxk/NxO6sUOjFPkSBafDpdCnUaP0jkZ1gCe4VbwQJKxVVjckOIFS9T9HJ+6cMuUhaAcpQfRqrLVCNs5hg==@vger.kernel.org
X-Gm-Message-State: AFuF++kFxt3Fdqr9Qi/ZlHz437w/QWzwd2WWCOBT9lOa0SkO1jwFy/rv
	k7VzDNlEB/gLzuu7i8dIUKQZIEuyOR/c1Iqx4dRRmRkavxJ85FyfmzeR
X-Gm-Gg: AYBFou3TuE90Jfdh81psCqN+NA7PKlqit1zcD29PPQNDSnYXQRGpfvuhmjtp91BWV0n
	gTLlHO2WYrxRMJTqQ/EaWxSWRaCk0NuVgbFMSahny08wNCKxFX4oEQOemcRPCutTgXgx8l9GvU4
	vO9yNz5qtPgh7YyZw47KrrK7saieZgu2xwcVhEW1oQkZuqSnrtnhnw7vtPA0dX8py+B6A0Kak1O
	d2ONGhpJeMCp3ctRmwm32E4UfHwflILlU3VbKq4O4HvXmCVxph4BfrBMJiUUn4lVpYPcwwUowbB
	FNktk9ZgkB4Jyv5yXCGFQvcVSSbLFTdJYhkSf2sVUBS/IXpca/ZU8DqQoykMai+X5UHfM+5Gjbr
	rC23PkeDVkl+Ns9nl/+a+XRwUVHdQBH2HuN562heBG/tRT0cHLamltrUIt2YJ8jjvXJAE7zgFel
	twYhSp5Bh2iRDhEMuaw+fBIafiIAYLa1UTk2Xy1N0idktrEysjVuI+4tGkQP8gvf37e5D0SJWIa
	pLQVXp2EatObDqewTjlMcE3CC6yRCszppxtq29gquySXrQaBkkqn5P5cSB/fTom0Dj9DhFJSt6V
	YEzhhPWHbxXjbw==
X-Received: by 2002:a17:90b:3e47:b0:39e:4c7e:bc7 with SMTP id 98e67ed59e1d1-39e55738568mr3739571a91.21.1789738830398;
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/15] ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
Date: Fri, 18 Sep 2026 20:39:06 +0700
Message-ID: <20260918133912.133799-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the return value of regcache_sync() in
mt8192_afe_runtime_resume() is ignored. If regcache_sync() fails, the
function continues execution with clocks enabled and regcache out of sync.

Fix this by checking the return value of regcache_sync(). On failure,
restore regcache to cache-only mode and disable the clocks enabled
earlier in the function.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e4ecd23df180..5aaff5bebfb6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2104,7 +2104,11 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		mt8192_afe_disable_clock(afe);
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg,
-- 
2.43.0

