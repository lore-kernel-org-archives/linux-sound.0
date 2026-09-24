Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED3D3E1729
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229205; cv=none; b=meCmPUmLHxd3i83KXlC9EzEyYvOkxEkK+V61WR/cSvuBk0sCjilkiQUGLEhVttvlOGgp0YsAQrU4PYddWO6DG2q+XUSS2tEi2GT9c0UcuaYBnQ/EdVOlRJ0buh1MGRuUiVDl5hkIBYp8OSJoWD/mzz0+SLGzw3xCHblWw6OAVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229205; c=relaxed/simple;
	bh=uaflzX6cS3HdS1Vo84NJEzwklOv1pja15ae6R1P33bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaZjsO7KjGSRYQC/BEXJNXoPKLo7NKVqrcTySj5xuqDVTd3mbHP5YYgAQnLuLnyElZdBQ3wTRK9KwnrJzLPXu9zjJst0pAAdb/D+ywtLBmh+/DaYluYr0Kqy8dGtUNIYUCE6ti29QQLR4pJewcbO+KpNRCsakxgbv25tDr1qMns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtBIWdLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtBIWdLp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B53BC2BCFB;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790229205;
	bh=uaflzX6cS3HdS1Vo84NJEzwklOv1pja15ae6R1P33bE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QtBIWdLpjgJwu2bPj7daGHU+0UyBp5SG7BQT121XDXdXrKu2bgjz1RDclZV+zHz6c
	 CQw7CVp1yBa7UEWdyZSxYqHuoI4sUMSlC7w8YlarIdRXCCuI6EWOPuIJ+NZhcFVvaX
	 sziafFcM+To6wInPligSc8/jgljVcayjExfse6DzFCRbu1lV9BfDKuwdgSNiyJWCmk
	 cO42KycoKnmS3Sed+GqGAo/mI4RLyLj2IirFeJBwoj05NzxLH+KZSOYZOVFG5aRosI
	 VLtZ4Ve0/7TSgyfdcRRpD9REdcW/7C5SlP6zkjOn5PN0lXENRJBz5Xq9FNs5l3+v5D
	 G1Wg4JoE3Ll2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBAAC98315;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
From: Shuming Fan via B4 Relay <devnull+shumingf.realtek.com@kernel.org>
Date: Thu, 24 Sep 2026 13:53:04 +0800
Subject: [PATCH v2 3/3] ASoC: rt766: avoid re-initialize the blind write
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-rt766-v2-3-e0b63606a5e8@realtek.com>
References: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
In-Reply-To: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com, 
 lars@metafoo.de, oder_chiou@realtek.com, linux-sound@vger.kernel.org, 
 flove@realtek.com, jack.yu@realtek.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790229204; l=1067;
 i=shumingf@realtek.com; s=20260924; h=from:subject:message-id;
 bh=tQ2FOA/6GWrh2SH94ZVcLZfCLdZZ79jcuuA1pM9To2I=;
 b=5SDniIARGHMY1zbNIImS30tdDLw7oz0KjmXZK6EyjXJNYHIBSXaG/asmDRehqqFalC75KntRN
 GXLLV8/ljfiDkiRIm7tBR514k92PcaH004bniOHFqJURH92meXvhHrp
X-Developer-Key: i=shumingf@realtek.com; a=ed25519;
 pk=ZM8Pg7tEJ0SDXQeBw6SfvcYyqXU9nF88DuTyxzf9utE=
X-Endpoint-Received: by B4 Relay for shumingf@realtek.com/20260924 with
 auth_id=1053
X-Original-From: Shuming Fan <shumingf@realtek.com>
Reply-To: shumingf@realtek.com

From: Shuming Fan <shumingf@realtek.com>

We only need to check the function_status to determine
whether the system has undergone a cold or warm reboot.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt766-sdca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 5a1c1e10e6d7..28b4118e05c9 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -1297,7 +1297,7 @@ static int rt766_func_initialize(struct rt766_sdca_priv *rt766, struct sdca_func
 	regmap_read(rt766->regmap, func_status_reg, &func_status);
 	dev_dbg(dev, "%s, %s func_status=0x%x\n", __func__, func_data->desc->name, func_status);
 
-	if ((func_status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) || (!rt766->first_hw_init)) {
+	if ((func_status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION)) {
 		ret = sdca_regmap_write_init(dev, rt766->regmap, func_data);
 		if (ret) {
 			dev_err(dev, "%s initialization table update failed\n", func_data->desc->name);

-- 
2.55.0


