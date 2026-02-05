Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3C1D90DF;
	Thu,  5 Feb 2026 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770251162; cv=none; b=Q6jwA7RS7S0/yAEyGigB0XHbppvDUFDwme3yIDaEq8f1fI5QGS/OodcL2e8L5kZtub6ZZyMnJqeJFd6bv7lzvIkiEzLwhJne/Fc5ZVvo1UlFu2lvIm+gCc6bNWQ3pEnJxSZhLoJhKtpdrpaRR/fhemRnticvHLzPbiRrUAYC+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770251162; c=relaxed/simple;
	bh=LFS4JZHl4UTp3KzrHuIqWCJKhlCNu8bS9Uy/XaYFofc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1Ew4uF8V5ZcU1cu9CFapvM2pJOyoUT4h4sCUISaNt9a0UM/zEY496h/Cq04yRaK5tB11FvCePW1dROro+FYZqfap9Iho+thbki56oZKvZoaveql948koz2YB+UBuqmmeKXpV/lmnEsDse9HOED0u2+C4/5MeiIjonLikO4pgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyhdAhZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyhdAhZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853F1C16AAE;
	Thu,  5 Feb 2026 00:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770251162;
	bh=LFS4JZHl4UTp3KzrHuIqWCJKhlCNu8bS9Uy/XaYFofc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lyhdAhZvyQlKaMRXyV9qJ5wggHHTpNdd0qYB4p/K9RaouqGcanr6RVtWaV37qQtY/
	 HLmRByf9b3cr0uE4dGVT1U1o0cJodAp0xnOibnVVAP9kGvyO/awMNxxkNItRuGfAqM
	 ryDx7o6yICkmrDRt0jKEOmRvG+F/ME4I6ZHb5b0FY12ybAJuOm1cNxbDjxRGDG3/yw
	 Z+4fg5tMzxGy3qlV6oarXNuBA3QLDYjooBQsO7QIMw3+WgslSV/88hfuLUgRbYVpNh
	 mJWpgNcNmxGFYADbMNPShpJn0WACJcPK5L/NOfMXQcH+l5nwRpYpZWSqLOmx3qaqiY
	 xJeskrQ503rJA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Feb 2026 00:25:37 +0000
Subject: [PATCH 1/2] ASoC: fsl_easrc: Fix event generation in
 fsl_easrc_iec958_put_bits()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-asoc-fsl-easrc-fix-events-v1-1-39d4c766918b@kernel.org>
References: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
In-Reply-To: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LFS4JZHl4UTp3KzrHuIqWCJKhlCNu8bS9Uy/XaYFofc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpg+OUA/rkio9uQzm6s9oNWQb/nE3YzGoErWzwt
 kCuK/D0quiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaYPjlAAKCRAk1otyXVSH
 0BsLB/9llq6/DvrDV/bSRPNyMlDET3724YVp7OJBBmC89Vci9LVKyJSWFh/i6x+WAnef0vnyJiX
 d7xOGmmtdNN4Srh/qUhiAgUD1Z1EDZFtVI6gQaSAmG6uo6+iahGrhixYoKjRLC91ylpaskaq6Ep
 KlYeHrBUGJPWLl/RBbDCL3DPEFWDcBPXlfPVP9HsyMEsBzup17lswNGCfQwRcekerRZ9Uuq8s8m
 RaBgAeEElL+R4HMpBLvpTIoyrQmDhKpn4ge2pqVEo0pTbr+0qZTBpUTtqgUHmpC80o7RD6MF+5R
 BGXu8KJ4REL7K7Yt3MfSkS2a+kXBDMhQLxceddfM9pK62sgA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

ALSA controls should return 1 if the value in the control changed but the
control put operation fsl_easrc_iec958_put_bits() unconditionally returns
0, causing ALSA to not generate any change events. This is detected by
mixer-test with large numbers of messages in the form:

    No event generated for Context 3 IEC958 CS5
    Context 3 IEC958 CS5.0 orig 5224 read 5225, is_volatile 0

Add a suitable check.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_easrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index e64a0d97afd0..5b6204923e8a 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -52,10 +52,13 @@ static int fsl_easrc_iec958_put_bits(struct snd_kcontrol *kcontrol,
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
 	unsigned int regval = ucontrol->value.integer.value[0];
+	int ret;
+
+	ret = (easrc_priv->bps_iec958[mc->regbase] != regval);
 
 	easrc_priv->bps_iec958[mc->regbase] = regval;
 
-	return 0;
+	return ret;
 }
 
 static int fsl_easrc_iec958_get_bits(struct snd_kcontrol *kcontrol,

-- 
2.47.3

