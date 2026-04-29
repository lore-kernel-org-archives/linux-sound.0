Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E222370A;
	Wed, 29 Apr 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426786; cv=none; b=DN0i2F8zvOo+zrUf6dY/x95FyA9h/Iq7msIaDjHrBpXjXN2Jo0g9mySXTiHrH52DgNbKSJFCDhiXokisPkExV9x3FBFA7YJXnAzo4jUseNzBWRrOOzRRpa26Ag1aeyYAfMvMhUI19FwZx7HA+8+37i0iBKJh68oDK7DXNIPWq4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426786; c=relaxed/simple;
	bh=rQ3g1iEURZi4LnziZ1fc6sbszDwJlqQ9RIGs3gyTlGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqZyzsc521o54zwKbPIT/nk2kEc9esWFlXTvzidFOa/HDIG8oPGNd7pWF2QyOzZZuoBI4F8vmVPXlj6E/oMZNoAgYiUwDtGf0oSW/U7Z5MHkxaIdyL9FFRxu8Lz95yH7/lwvLbpD1+5CAe8WNSA+Jc1vKVYGwa2Tv7x/6rTwbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FaAGJtSS; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FaAGJtSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426763;
	bh=Fa1GhJ9Mm6+UlP/0zx8pjid8wYuGhB8oXYTC38+xnlU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=FaAGJtSSafvVC1M50qydn+RM3yPEyk61qo7sqlA1MKbwjWYpfCr//pb9xQZGuWzOn
	 XnJUIp1q/qOyImmUsI9kuGcifNLKJcojlgyN6mSYTHZePz3zgJ4yUjS9ofuIq5CrKq
	 Lm/gR7reHlTXz3B1+z97kQ4djFGUua2PNRb4URMY=
X-QQ-mid: esmtpgz14t1777426759ta66e92bf
X-QQ-Originating-IP: TnZa94EYn/Y67XrWQDnUM6ySI8l1koZCnIZNF1cOgfk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8148319090196438835
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:51 +0800
Subject: [PATCH 6/7] ASoC: spacemit: add fixed-sample-rate constraint
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-6-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=2155;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=rQ3g1iEURZi4LnziZ1fc6sbszDwJlqQ9RIGs3gyTlGc=;
 b=1QAW1hqaGPJM7giTj3fW5j/i0VLxVFmLKJwW6gR8vxiDo5ByP5sbUNgS70bD3NzQFt64DAf0Z
 HYKiC8VJCVOAt8KHIMtFWqYJgdquan9RXkP5vET9BXSGlQQqWfcQuxr
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MwFkbloawFgLdqwuzIolXdFu8PlJrDU0tcUuI5gQcmauejLvoJwaahYg
	n6J1F9x8gUI6vDG9aFJXgpIzLrbFuEbxSsuGrZk2qEEbJ0eDVUqrF4ezIrAQle0L4bgjmgJ
	WfcXHkP2iN8not2q81kv+O2ahHk4Pr95V8XFkZ9VgMvvJT1mEn24FT+EfRHf0nnkvetmXMd
	dQtYsRzHJrU8vXeNzm4LzP+9t6GqNffjtOaIjmmt58AA1JxeVowbzUjM1TLFPV4pTVcC4hO
	b/k5ggE0JBFy8Pj8dF/VNJrj/Z/qp6DuRELZ1SP99P1NJIqJAhEbtkHf+2XFbt1R7MvT7sP
	6mhDFjRdDk2N3SaVva+Prc8SEsg1gsgY/ik50t1S63ZVRRLtLO/pCO0ooUucw9eVfcBsfog
	usl735+nX3+ovPl/z+/wO1heieh09IMbKf/oRtyJpFNjBVOqWyC9Qw1EPsNUjMGBdCtAniy
	lLPi4d4xQQ2xziZM4mGqA7HlhnNsh/IwhJ7J7o132G9GP36IdepsGBd7jMa4TXTJqMTXte9
	x+HMs+UfaUMtyqf2aEY4B7WwPE2h8I1apzVIXmaLf0ar30ae0xSR9lpbIxnQyIzLBYgeZBP
	D4D/GAg8Vrcv7fKXkPR/QhPADO/8kG4o0YfAHUuejxrATACHj2GRhfXqIOG2q0cMnHyWd70
	7uZ0ZUfGHBYw/jr2RR3MfkxMZukXLSSjPHEd3iGSqm/zt5pMZxXYLpI9Wrp5sUB1E0dPCz7
	c1mQrfn7L3/ys2VnsFkC+l3fXV+KFQNXFXtcel6Rc4SXU9HNh6/yx2wk1iiYVd/sYIdQM4N
	k++yonT0fGslVwzJ3bbWsr9hw7P6x/+Otbc/Hgc3OjIasOMfH8Bt0lKlwkWdSneA/sVQ1tB
	TdzuZ80SjACE1S0lF7w0YLMT9oYFN+/aWWBfMNl3dQb8gy6UY2WMEFVofXBeKRiXt1kgnzd
	1yssyarUjC5Cz5IxDqxbWQE5t9FlxHmMhQLWt01lbUZluS/DM7goQBuKtM3VnM9kOBBom+S
	0i3La9eUffrAdag9jH9wYXXuXeFTtrRxF4heOLH7JaxAe+A9n0odgP46HVreW97HnVrus1+
	kGF7F6VPwqD9UzEELOs1Z2YG+ab6bmYoT0UPhM55Pnmt8pxKUKzE0Zs2dodfp6c7jJsRQqH
	bYGCPnVGglUMNrlsS6JfHmjDau7oTWaSKzh7
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

When multiple I2S controllers share a common bclk, they must all use
the same sample rate. Read the optional spacemit,fixed-sample-rate DT
property and apply it as a hardware constraint in the startup callback,
restricting the PCM rate to the specified value.

This applies to both K1 and K3 SoCs and is only needed when two or
more I2S controllers are active simultaneously.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index cef883ba4de9..7d0794d21ea6 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
@@ -54,6 +55,8 @@ struct spacemit_i2s_dev {
 	struct clk *bclk;
 	struct clk *sspa_clk;
 
+	unsigned int fixed_sample_rate;
+
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 
@@ -111,6 +114,13 @@ static int spacemit_i2s_startup(struct snd_pcm_substream *substream,
 {
 	struct spacemit_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
 
+	if (i2s->fixed_sample_rate) {
+		snd_pcm_hw_constraint_minmax(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_RATE,
+					     i2s->fixed_sample_rate,
+					     i2s->fixed_sample_rate);
+	}
+
 	switch (i2s->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		snd_pcm_hw_constraint_minmax(substream->runtime,
@@ -437,6 +447,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
 				     "failed to enable sspa clock\n");
 
+	of_property_read_u32(i2s->dev->of_node, "spacemit,fixed-sample-rate",
+			     &i2s->fixed_sample_rate);
+
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");

-- 
2.54.0

