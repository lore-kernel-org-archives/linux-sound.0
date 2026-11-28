Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795828009;
	b=ZlElmw6zHxL8CEGpJyt4lpF0+0HtoxYFmpCJ1zZ8QGtdgFNbVUCPUyTdWnPr1ZLyY6Br
	 dwd/MKmRD8+CYPr49byr6VfcTmn0/OKQoJtA8JeHGcPI9Uy6dy8hqnoJTwZcM9qhYTtRz
	 syjGX8jtwmvqMKjn3mHYUhVioZ0vIEpv1PORJUO2sv9iVhGziBxZaGV2ClWe5hEMDef6N
	 9ov6wLYum2WpOYGMvWu+ALWH8NFDbC/bGrfpjS0xR2oq162itIy56DTB7RmimHs+6+sfW
	 HpYRFD8G0+rb/AdYsCh/MbA/lwDjN1xYo8oLbyOfA1ojSYZ3ZBpGYvqzkOX5JV/336g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828009;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=;
	b=NvY8IV3sT8k1VLJ8AmZi5UhM5I3qjLfYJP4EvoNV/m4PHEjQ3cclEodeSmD53TK/RFfC
	 dYbM/kGHlSgdsFbvfXGkb32n+q0NZBFY6dPqTg87JdznbR/ThCGXiA+rrhwAGhtqNA0gf
	 O5G7SuDKhx+T+/P120EyqX8wPppuHa/m/1K1SaiS6VUVBw6GRmnR9bYOjMO506rvttCYj
	 ZUgkChS2SdIB0AtdRTrE+9hohUX7slifrCvqfuvkMpmHsLB2OOJc9Gnvx2nY2GImSZ09M
	 4DWWcwkKxYfC2YjonUXjL63Op1F6LabbcFrEndgFVhhsiotgQ715TfipQReRc0COVqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwBJoXSP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A7606A31C;
	Sat, 28 Nov 2026 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwBJoXSP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795828008;
	b=f8H+e5SwiP/eYqn4INZZxKhO8+rzxGfrKQpWFr7iihQRWry6vTV+82CL7X74XUZFromn
	 zgtzsyT4Pjkh5yUg/SkKtHs/sXPUjV0VGUq/gDlKtYUu8fvhX51XXMe4qGU2AqWZjd7Jt
	 jpfX1WoGeQyOyN5L0dbZRJtcMN8DmKqga+oGQgV2da0retpsCCqc605wwfZ1E9YqohDeL
	 lEghVan5YTAbqZjXtvOmwCfRhrBK2FKyKFImOJ1TDyMNhlXNvdHYWVdfb8gfI8U8RVaot
	 f5FGmNAYgfeYr12J+cg94bYX0y9M5GIz++UAzs5rxHSSftE7yegB3BBoJyYlqtP3epw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795828008;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=;
	b=S3LBMYzHoAYm88k7XCJ8AG4m0TDyQ15ymFClcV2L7I3aOV9KFxEJDnCYi782DKbaP8Wg
	 gR+Mj7ZiENZz6VG86UEoxYmMa+LTffqzvYaBSvsYb4aGqp6OQ7yjBx9nfLf0LSiC2No08
	 FnuDcwPiKBL/RHeiHECHaL3GV0c+p64Uz+vr0LFsYhcEf5deNDNP1nDuUPaVNH+psfTAp
	 C4+q75/Jia/S7iu+GRzE2gZgBYtQJOm3WVfVt5neZpb2ZQvfE2GwxDxJXjwY0PaJIjU0h
	 JFQHAIY/zTrIVQ40c/V0ssM8XYSDHwxv0+5s03FnlG/9InuDuVQTJRVoybbzZ/HYZNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56BCD1F000C1;
	Sat, 28 Nov 2026 01:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795828008;
	bh=aguOstNiNosKFJOAXsnYWl5uoiVa6iE06IgtXJTe9mM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TwBJoXSPZB4npE8z1hJ/eEqSP/fckt7RkTpEF0Av8fRAHqWkIjCDwGtEfZftwSbuE
	 cRUL9AaeHaUQK9ZUg+OcHL4mIbt0AkIuHi1aVFOIOIMLWr/4gZC8XyxhQjTcWLgTjM
	 Wz1qA7Av9FpH+2TxCEUmfCKCHlI5X/ohS+OlUp410ESr/dHnWm3tjzjkFsuujoAMlS
	 ecpIx/BFYXxlXQmjIju5d+KxI92JSwVx6VruO0TkVrvD6PC2U1qvQTwYwFNoV5iGU3
	 xhVdjR17BCW4EYV/u2thtmrcNzNMgg4Awm34meyxqdPGcZ9h4ZErJ6YGSNPaMDkfFe
	 7hprf3hx+w24Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D96044DED5;
	Sat, 28 Nov 2026 01:06:47 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 28 Nov 2026 03:06:46 +0200
Subject: [PATCH] ASoC: rk817: Do not free the regmap of the parent PMIC
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-rk817-keep-parent-regmap-v1-1-de515c2899ed@iav.lv>
X-B4-Tracking: v=1; b=H4sIACUpCmsC/x3MQQqDMBBG4avIrB1oorXRq4iLaH/tIMYwKUUQ7
 27o8lu8d1KCChJ1xUmKnyTZQ4YpC5o+PixgeWeTfdjGGOtYV2devAKRo1eELyuWzUeunrV3YzO
 1s2sp51Exy/Ff98N13VMNwg9qAAAA
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=VRMDAVdATty+o32CLZkZxbTwRbwASeEGt2T/3vL6z4Y=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNlcmmq6V7Y55yq95pH6bOB2/VrVltPnfaJua2g0RRyyE
 D6121Gho5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEwkIp2R4dIPw4sGhl26lcrR
 32RUZiZcjEratrHA33P2tYfBf8Q4VjEyPPl6Us76z0XbCZVexY9jhAs/tPUek+ezWvE6qvmp05+
 jDAA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The codec uses the regmap of its RK817/RK809 PMIC parent, which the
PMIC core, RTC and regulator drivers use too. rk817_remove() calls
snd_soc_component_exit_regmap(), so removing the component, on a card
unbind or a failed bind, runs regmap_exit() on that shared regmap. The
other users are left with a freed regmap, and devm runs regmap_exit()
on it again when the PMIC goes away.

Clear the pointer instead, as commit 6d66c5ccf5cb ("ASoC: mediatek:
mt6359: Fix unexpected error in bind/unbind flow") does for mt6359.

On an ODROID-M1 (RK3568, RK809) the PMIC regmap (3-0020) disappears
from debugfs after unbinding the card, and a later hybrid sleep oopsed
in regmap_update_bits_base() called from rk808_rtc_readtime(). With
this change the regmap stays, the RTC reads and binding the card again
works.

Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
mt6660 has a similar issue: mt6660_component_remove() calls
snd_soc_component_exit_regmap() on a regmap created with
devm_regmap_init(). Not tested, I have no such hardware.
---
 sound/soc/codecs/rk817_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 2c0fe1dfd842..c7804b2b559c 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -434,7 +434,7 @@ static int rk817_probe(struct snd_soc_component *component)
 
 static void rk817_remove(struct snd_soc_component *component)
 {
-	snd_soc_component_exit_regmap(component);
+	component->regmap = NULL;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_rk817 = {

---
base-commit: a6c7e545d8abac8ad0b48da4c8b4ca5ef8ea8eda
change-id: 20261128-rk817-keep-parent-regmap-354a8b6c9f89

Best regards,
-- 
Igor Velkov <iav@iav.lv>


