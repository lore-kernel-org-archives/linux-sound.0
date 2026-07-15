Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742ED3370E4;
	Wed, 15 Jul 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146635; cv=none; b=smSk3+iNH0+UI9g0ZjVpA+VMtvHFMjJsslZM0qIKcQm3zuHthpBbTwa5jashNYycwtayAczMBz0yv22vJXJRAadg/Zl5vsFGxZL2z3CSYnBuu/bPjNwpk/jVqHgAW1dXGQ+ws4oUlKpYC3AlzZz2evMJCyDFbv/sOBVuu7OJobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146635; c=relaxed/simple;
	bh=XdmGYmF/eugDVWgzeDYipUI9UEVkrnSwdU/N/jA0f4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kof8p/zgDHDPFrAtM3O9hH6MXbh5breNGPwlr01MZkKsICUdJT2/T+UeZWJFB+l+Ew1NtmEobBMx6o1vTFCVwzsOikkNobMqa+KuRy8K2QBXu8Q1UG9tjunglS0SCbuOgSQ7my3oku/9e1YsN5EgcOAO8oRfsqSSbZkjEzbCcO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8XtUad/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8XtUad/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663211F000E9;
	Wed, 15 Jul 2026 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146634;
	bh=Lfdeh6sL32xSdjedIQ/XVrUFlvdiVsjKjTmH/bHi55Y=;
	h=From:Date:Subject:To:Cc;
	b=j8XtUad/JG/ODAwPcBMCKxVLzsmXXrd1p1Dle2DgaYTk0H80uHK8XzcEoNsYw5H0I
	 YZlDO6A4Orb9gvsp9Kwxkefji4Z/GaEACeM3r/K8lIoQclFJe0mhxL2EY2kPD6aDmT
	 L6rm8YCWseWTdqrASeGecHfQHOxNI0H9xpDqDL3lEZSJ2XJ12zLYpl4QQeGACUbXA5
	 EuTkLraPCNXEINBiYUwSX5ZERtBy95gJYZeTJeJvHqT1KDbU/aw31ImR+HAhtIIzKz
	 zV3QK5JCODV0gWoEzzqDLhXM0Qj087E0los2rtutZqBcMxZ6Pq3W2DhyeaqskiWer1
	 67Fw8Z3dKDJMA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jul 2026 21:16:48 +0100
Subject: [PATCH] ASoC: fs210x: Make cache write through again during resume
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-asoc-fs210x-fix-resume-v1-1-dd81d9c62c05@kernel.org>
X-B4-Tracking: v=1; b=H4sIALDqV2oC/yXMQQqDQAyF4atI1g0kI63Yq5QuxjRTU6iWiYog3
 t1pu/x4vH8D12zqcK02yLqY2zgU8KkC6ePwVLRHMQQKF2r4jNFHweSBacVkK2b1+a1YU2qjcCs
 cCMr5k7Wsv/Dt/rfP3Utl+tZg3w/TjXBqegAAAA==
X-Change-ID: 20260715-asoc-fs210x-fix-resume-30f9ac19c120
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XdmGYmF/eugDVWgzeDYipUI9UEVkrnSwdU/N/jA0f4Y=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzwVyeeVXVK6XxuXb74ixYLK7tOXIfYVXYDBgl5nycNh
 17LTxHtZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmsjSD/X+pxHyWmAuGNVtn
 qwnk35vJ++CtXvNFmRU2Hub1u/j6HsbOW6bPknK6VrOBX1nph4A0R3p1k14xpxNbf8sN6RcLdqT
 kTN/m5jdtvX7W2q/ygua8YTYHDkhm+nNJdswqSL/xr3JzcMMvO3cd5ftHdK+6F7yP6J4aoRPd+L
 TX3cnigtN3Jc45wqedWdYYnprHPmGH804J3n03vjzmXe+gmz5x6aQsTYlZc/V8VJqnHdZ03nOnv
 LOHQzZVXuHQNb/Qs8uSjZjbna/bzU7VXt0v4alstdb5txK7Auec+9P81zb4hvGeWrBQzsy7eGtn
 TXmHrsv+ZKmb1of73zyx/K2YsOql3O2SaiGbZAE3ngYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fs210x driver currently puts the regmap cache into cache only mode
during suspend but at no point does it make it writable again, meaning
that device can't work after suspend other than basic powerup which
bypasses the cache.

Mark the cache as writable again when we resync the registers, it's not
clear to me that the cache only mode is needed at all but this is a
fairly minimal change.  Since this is setting a flag it's safe to do
even if the cache was not previously in cache only mode.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/fs210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 5f381fe063e8..d794ff918b6f 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -607,6 +607,7 @@ static int fs210x_init_chip(struct fs210x_priv *fs210x)
 
 	regcache_cache_bypass(fs210x->regmap, false);
 	if (!ret) {
+		regcache_cache_only(fs210x->regmap, false);
 		regcache_mark_dirty(fs210x->regmap);
 		regcache_sync(fs210x->regmap);
 		fs210x->is_inited = true;

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260715-asoc-fs210x-fix-resume-30f9ac19c120

Best regards,
--  
Mark Brown <broonie@kernel.org>

