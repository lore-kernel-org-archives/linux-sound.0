Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4CA4D2EC5;
	Wed, 15 Jul 2026 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146709; cv=none; b=ua9NuUNZuAZRYvCoYfHzxNx83Vkx5xPalThZp/3dsaMuk8fqajna5sifsiSZC1lNSeL20HMnTSQkrZAOciaAy9LOHBrKok5gw0CGYhnnJhxoaMTfKGAL+I1Sxa77TxsNx7nf+dtU73+9QzdUwuirwz60dbhtpqi/4Aeha0i+DZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146709; c=relaxed/simple;
	bh=w+9XrHsEFWF0eclQwXVzewT4xPRYC8WW9OGu/ZxMg5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7CbJOSK0P+TJpzoEKRoqnHtH8x7lUCmkultGPLgWCYNzR1BOPSkL1dlFi50/gf2bIW4KZwqAg0OOvvLEUUy8B261YjFTEXjQOLFC5X9qE21k6QK5Fuu50A048VYbKWT/L13kfu3GXnAymH0Vxo+yp1kkR2klKW2nTJEvwb4mZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwSKIuUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwSKIuUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A771F00A3A;
	Wed, 15 Jul 2026 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146707;
	bh=EMxlaPdqelI2GuvNfa9bRbTnnxJqw7/jTKDRud+pUfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gwSKIuUZs2RjO/L5wKtthv64oLRd96CfLl/5kDUiEEdpFmGfN6jfQ5hW8jVC75Z/t
	 /aJOdr2S8HZN17Qs3xoXURlBpnJp6lzZ3pKYIMb9rfW4kRz976coGyxZcv0Cy30hdB
	 lZjgq0Y1Ay+dlXqVwklg+FGPKKUF/FEw/aP7sBQs5iBRQdjEtNsEnzyYBwkDSOJZk2
	 q7HH9LfYTiRNQcKAtdLiQhzgK10fCWvCw7L6/fBHh+ipmfkoY/wMA47dCRpDwFJDaC
	 3QTzXAKn4SJtuMyjIQGsJfDV/MwgoPzuUszqHw7xAZXxHCI6Pf5rxDkJndjPggeADd
	 OF+w5gmSenZbA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jul 2026 21:18:10 +0100
Subject: [PATCH 2/3] ASoC: tas2562: Fix event generation for volume control
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-asoc-tas2562-put-retval-v1-2-97bf467c924e@kernel.org>
References: <20260715-asoc-tas2562-put-retval-v1-0-97bf467c924e@kernel.org>
In-Reply-To: <20260715-asoc-tas2562-put-retval-v1-0-97bf467c924e@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Haidar Lee <haidar.lee@adlinktech.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=broonie@kernel.org;
 h=from:subject:message-id; bh=w+9XrHsEFWF0eclQwXVzewT4xPRYC8WW9OGu/ZxMg5U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV+sLGOMiGFg2jwkjbu1KZi7UvtYeEUxK0LseW
 79c5JV1g7qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalfrCwAKCRAk1otyXVSH
 0JSACACDLorA+Gcklp062VlgyPx/kBCIYBI+oZvVjf25DZb/1/6li4NvNPlK8gndEg2LQXZ8Ly/
 2El38Dlh9/8d0rHkOvv7LgUYldPjuaMXHimfaGCUdjIbV+jiXCNjdHQrbbTGDI7/rdhvkJOuX8T
 OFzBOHbsPv5I10XlBvMujRTvE7Fwtj2dws3EcMlRqvpeoWWrvBRNQDEL0CS6UOJVyb7xGxNylxc
 rSxS2Z6jZ4I+M11GrUQ2jnSP1TxFkNIjW90rRBiz18z9wefw98fRdzbdKGw77AC54d3uAVssBGI
 ki9YcPMaothbMDTYTVXUL4ZkidrYEXt0jDrrljOyhXB70acZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

ALSA put() operations should return 0 for noop updates and 1 if the
value of the control changed, this is used by the ALSA core to generate
events to userspace.  tas2562_volume_control_put() does not implement
this, it just writes whatever value userspace wrote to the device and
returns 0 regardless of what the previous value was.  Fix this by
suppressing writes if the value is unchanged and returning 1 if the
writes succeed.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 82bc0078a5c7..9b863b000470 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -474,6 +474,9 @@ static int tas2562_volume_control_put(struct snd_kcontrol *kcontrol,
 	int ret, index;
 	u32 reg_val;
 
+	if (tas2562->volume_lvl == ucontrol->value.integer.value[0])
+		return 0;
+
 	index = ucontrol->value.integer.value[0] / 2;
 	if (index < 0 || index >= ARRAY_SIZE(float_vol_db_lookup))
 		return -EINVAL;
@@ -498,7 +501,7 @@ static int tas2562_volume_control_put(struct snd_kcontrol *kcontrol,
 
 	tas2562->volume_lvl = ucontrol->value.integer.value[0];
 
-	return 0;
+	return 1;
 }
 
 /* Digital Volume Control. From 0 dB to -110 dB in 1 dB steps */

-- 
2.47.3

