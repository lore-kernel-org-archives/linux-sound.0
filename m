Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458D41B6D1A
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187792; cv=none; b=N7ixsfQFcXSAPMA/D0vU5OVTf5GdboLm8McG+hdCoQDSPOVvvCFxszcmoTcb4+E0syD75AcxmSLrJx8czsIiWtEFIq2l69ao09eNKcorYc6VCTQcshh6q9Wv4kKanCFDa6ILaeZGRbfKXinlmgEQJKXOCog3EyPlyy3Hyyl0eDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187792; c=relaxed/simple;
	bh=3l4sGcazOAOYW84oN9Xf+gn7vIrk4YdcRcuCrPL5cIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ijtiri+XifGsguJlD9CzwvMVa7u5dt1mp7VrAife80WdTPncRSL6F/dDyANvdLvuhHDlFZf9iccpLcK+Oet05uwJU7bS8XFO9o4GxapmQ4UIbemCkhHJLfJSI7WblKGjgGTnLWYQfASzR8pWwlt0Rr6nwa0iniA4Nkz2pHw9BGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH 1/2] ASoC: soc-ops: Fix clamp range for SOC_DOUBLE_SX_TLV controls
Date: Sun, 11 Jan 2026 20:13:29 -0700
Message-ID: <20260112031329.17088-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For SOC_DOUBLE_SX_TLV controls, mc->min represents the hardware register
offset (e.g., 283) and mc->max represents the number of user-visible
steps (e.g., 229). The valid hardware register range is therefore
[min, min + max], not [min, max].

When min > max (which is valid for SX controls), the clamp() call
misbehaves because it expects min <= max. This causes the control
read function to return incorrect values.

For example, with the CS42L43 headphone volume control:
  - min = 0x11B (283), max = 229
  - Register value 0x1FF (511) should read as user value 228
  - But clamp(511, 283, 229) returns 229, then 229 - 283 = -54
  - The masked result (-54 & 0x1FF) = 458, which is wrong

Fix by clamping to [min, min + max] which correctly handles both
regular controls (where min=0) and SX controls (where min is an offset).

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index ce86978c1..b28fdf238 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -148,7 +148,7 @@ static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_v
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
-	val = clamp(val, mc->min, mc->max);
+	val = clamp(val, mc->min, mc->min + mc->max);
 	val -= mc->min;
 
 	if (mc->invert)
-- 
2.52.0

