Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3921E1C11;
	Sun,  5 Jul 2026 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222689; cv=none; b=sLIQPd/c5JVqCbcEdT9THxEAByf2jdG6LOx49Dm4VtqSUOW40Kzqjhxmnd9oBVBJouXRYNKMi9WfPzpEgvzeTs7fqw61dJFDCk3EjMoWGcknS9ZXwfcvz+8NXCYunQzWwh4gbCag5RJtG9iRLjJsQHiGohF47xhNLgIVCKMf23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222689; c=relaxed/simple;
	bh=QSCvB8YOo+A4kcQt5ZFKpDGazEXo59W+JcRz1HmZd/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSG34wYuRoOhGKna+dN+k5O2Me5zCjBgpOo8URslwnsJpaeXYs2uSBcJxm3qF7lNO0Iycew+MfxcQrzYsOwhb1+ybVxvowe8NLQQ/m4GCYV7LbONhbU/fKa/RICCmQ34odrX6Qw3+YEZTZe4Ik/B1qJ3UbcNDNxrBmdcF/fOkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com [198.54.118.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4gtCqy2Qdfz2x9w;
	Sat,  4 Jul 2026 23:38:06 -0400 (EDT)
Received: from mail.privateemail.com (K8S-PROD-WORKER-10 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4gtCqZ21TZz3hhT9;
	Sat,  4 Jul 2026 23:37:46 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: qcom: sc8280xp: support Senary MI2S
Date: Sun,  5 Jul 2026 05:37:43 +0200
Message-ID: <20260705033743.305783-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the clock-provider DAI fmt setup to Senary MI2S; without it
q6i2s_set_fmt() is never called, ws_src remains external and the DSP
does not drive the I2S clocks.

On the Fairphone (Gen. 6) the speaker amplifiers sit on this
interface; the board DTS enabling it is headed upstream separately
via linux-arm-msm.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
v2:
- Drop the S32 BE fixup: as Val Packett pointed out, since commit
  1b92b0673d5e ("ASoC: codecs: aw88261: support changing sample rate
  and bit width") the amplifier follows the negotiated stream format,
  so this interface runs at the default S16 like the other MI2S
  ports.
- Link to v1: https://lore.kernel.org/linux-sound/20260704192830.88134-1-jorijnvdgraaf@catcrafts.net/

 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..6093ed50de79 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -34,6 +34,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX...SENARY_MI2S_TX:
 		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 		break;
 	case WSA_CODEC_DMA_RX_0:

base-commit: be44d21728b6646189779923b841ad3a46d694e5
-- 
2.55.0

