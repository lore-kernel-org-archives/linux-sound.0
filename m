Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861B1D5CE0;
	Thu,  5 Feb 2026 00:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770251164; cv=none; b=fRhSvJmEuCexDzO/h6f7UBhM2AWYcScvsjgRHpUiRXSYaGO8fIhPtP2FZImBDjhnsU889qxIN2MwFWe2fIMSKr/SOmh7NOYGQ/gf5dQQJhI1/XSJcAhmj4I+Vu7RKb44DpIfIkZ8watwhCIKfvuZsU4HHuXNJUPJF6Te7xqkAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770251164; c=relaxed/simple;
	bh=MrNz+OlzDjfwvWX2daYWM+tGhBgejuCn5pbVatjqc24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbHgboLlZDWW3kHxEhSdJAqH0m2Xcqxg9Qw1vH/uyRNmZhAzTqdyZ4umjWHSowLar3QVn6SZnCZ4lNeDniUd72JvpjIRFfqszJffGkovACQirQQTfk8EdGyYQU7Bj8U1x0YvrLsRev7eY53c4XacpWubvKyEckIevrVBvfrpfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIOxgUB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIOxgUB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77145C4CEF7;
	Thu,  5 Feb 2026 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770251164;
	bh=MrNz+OlzDjfwvWX2daYWM+tGhBgejuCn5pbVatjqc24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qIOxgUB/Zj2tkSgqtFPAPdPs7UXaZQxRF/m0tNFuUBXmDsfluiQBHl8ZFE6pghWxm
	 Q8G/5ARFmGhzuxtFzd6ETmEdV5Qo4JxSevKq8agqDAIrxNkFmmYboW/uTQFTHy+co4
	 AkdSMlhSsitplozSSY/hip+uwpYqMYkSaHHe0kDgh75pH/vD8rp+ZkwXwaUyxwUafj
	 +ksCpqoPeLWtwq9BlNjk+/rcMiv+Jh/b87UxwehWNatr6H1OwWYKolOWl2WhyLxQ0+
	 o9ORm9JvBLjUjQMeeAVIaQQ6rYCcTDqk2O4AWx2eOeZ+FkqvGFMr90TnVWYGgq0RU/
	 xfp8m1L4iQOhw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Feb 2026 00:25:38 +0000
Subject: [PATCH 2/2] ASoC: fsl_easrc: Fix event generation in
 fsl_easrc_iec958_set_reg()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-asoc-fsl-easrc-fix-events-v1-2-39d4c766918b@kernel.org>
References: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
In-Reply-To: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MrNz+OlzDjfwvWX2daYWM+tGhBgejuCn5pbVatjqc24=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpg+OV+YmeryC/53zhXaMu1b00BlE35Bp154O9/
 xZ6QJqCfdGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaYPjlQAKCRAk1otyXVSH
 0H/UB/0VhF4fpttxdCe86+J6ANk8ebaItdiSNS/XIjtmWBc+MF6CgyhxqFKesP/WcD4zskWKw+X
 8MJ7LE6HQk+whytYI4WsUt10bvSjRCJStyEr3o26jg4SBdOtv2soR7rT6/rJWzUpx/Py1UWkzSZ
 yqZq26OFMpLvdgFcFmwqiGQPlWwaaQJY/g18FOa6rtLhU928OLMR9F6ifLTMWNwUCbhlVzaSrlz
 x2Majtt65j90UKbGO5s64JyBhw//B/IokaJMdqIyLb1wHp8lJdDCxuVmyEq1R3c0wCQrp52dvuk
 +JxhceWZ2Hwgu2MA5QGV7WegdVa+eUKGic/JVhGyzlQ/0y2z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

ALSA controls should return 1 if the value in the control changed but the
control put operation fsl_easrc_set_reg() only returns 0 or a negative
error code, causing ALSA to not generate any change events. Add a suitable
check by using regmap_update_bits_check() with the underlying regmap, this
is more clearly and simply correct than trying to verify that one of the
generic ops is exactly equivalent to this one.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_easrc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 5b6204923e8a..6c56134c60cc 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -96,14 +96,17 @@ static int fsl_easrc_set_reg(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
+	struct fsl_asrc *easrc = snd_soc_component_get_drvdata(component);
 	unsigned int regval = ucontrol->value.integer.value[0];
+	bool changed;
 	int ret;
 
-	ret = snd_soc_component_write(component, mc->regbase, regval);
-	if (ret < 0)
+	ret = regmap_update_bits_check(easrc->regmap, mc->regbase,
+				       GENMASK(31, 0), regval, &changed);
+	if (ret != 0)
 		return ret;
 
-	return 0;
+	return changed;
 }
 
 #define SOC_SINGLE_REG_RW(xname, xreg) \

-- 
2.47.3

