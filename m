Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE3338910
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092312; cv=none; b=t57q3kC+iHuZHfNpZR6OYFQHHWTlOTlQ+vFpDuCOEYFEdQsHjAC2cb83qubYVciHtkYo2R92StGSupVj2ULnPclZv9NAx/PR6FHf/hqHJ+nBy77wVScMpciTMxmiSVGttZLbdhKCBmYfGQam9SGeYQ7DwR2mNfap5hxdVhepn3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092312; c=relaxed/simple;
	bh=HKOtwDSzyfpc4r+p71+NekAihXrkWUS0xjBtkIxY3a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkDkeyGI/NqxY/Vy2dOVEbVH/OrFZ2prlmDX7np0F2GUXtCVWJqqc4Q1IDu5kH0tmfxk53w5scFum5Tv9ddzxA3XEol3hB4+GtrMEv4tSBRIc6VcV2lFSAZt7Nv3pqGLpGUpeNuvP/K6VYivpwHvEMdKAiAOBG93RJxfQu0FLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/qJ02+5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/qJ02+5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423f236418so1421811b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 22:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092311; x=1784697111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDk3AaOarzS5zPuAPo5vxdFtas51v1EJSd2mFAJXgc4=;
        b=X/qJ02+5iP9Swftp/W96SZTTJ49wpKdzAeWmUzy6y4nucKsC49D1FBMkU6atdEOcgq
         buubdqCXqzZydW4k2DNTmDtB7AfANYjRFD7463d+jxCZwMREp8oTqjIin9CcsmcUJR23
         pGF9DbcA6Ax0yyL2NMWpUWwvZ7oN7MfZpfBvhEsNNkws6lPgSiwlhzoKjeIClsNjslSE
         xnsWJbs2khVPU1Oes51ApmnLLx48yEIAhAE4GGbZYDm1Up6M21uLoCRLiMNnrdoZ2/Vn
         ye4LsFmmop5a527KQZiK8DKznLERPEysg3AVQloPMLba2gn1ikeTETytCQYxs9abVIJE
         J2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092311; x=1784697111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDk3AaOarzS5zPuAPo5vxdFtas51v1EJSd2mFAJXgc4=;
        b=nlbFJoAu6N5dVakJvfICvR7kVqK5MbUrqZhnO2ynIUfl8AbW6CDrch6e8p7nIcj6Wo
         OiXqNhW1LLE9aF51KSCq3+2mTNa3lHNPYyLPgewlSGtucr1fqooe3tw9L5LCZu9QXbQF
         6kRa0MsP1I4grFXYvolaTHGghxHjgE1tfa/T38qunHe+w9ti6syXmjVvc6SARo6BZBIt
         W78QpFObTfB6YK1cS8k0IFNKGcg1HhCOybwM3F088V8GzqRAziZ9KRXXq/WHL2Y23XnP
         zyQcu8R2WBnzgiQZraLmUnZ3WoNrST4zlPHuD3MRba/8sIwdWObz44zMt68906J5wD4P
         TKew==
X-Forwarded-Encrypted: i=1; AHgh+Rr3/GBHVw7km0Zr5V5SmR7YoljIy+8QuZ8zMqBXGPiWpcytYP5nDk4Su0hRZOtQwupRGEuVk1Mx2mywRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UQzAsGndecHqCx7oTRMYeeJJZchLRhXDtkmcnDMWQLNZTzPN
	oiN5u3iHWKPvOzdpCKgw/zDZm2OjPDMow2AaP698jfoMCfuHbttWgHD8
X-Gm-Gg: AfdE7cn+CB3aDznkv6fPQODdUiUOqsBz+9s42KgE0+XMafSS75Ygb9XhIV5K5un1aIO
	x6yzHAx7vVp2K9HEIN3N1afnMQiw2aqbnjCND8SqoAqn+uRl/m1AZt+3Jy7QFBaAaJPSnYsph+s
	ZDwHRGGEe0ZZbGOqgD07Mulqz/SZLsH1vn0+fDlP1AwQRG0DByndHxjfot6O4G5dTp3+65TkR0I
	hW7M0jcH3HMD9hthn1VqlFfRL614U6nVEhSCd4z/an1CWcCEWMEsSC8Q5Zi7/r8oGB6CWvOSCM7
	gwd3eE/LeTQ+69C7bgdizfZwb09rQFoBoRNZCO/ZEnbWKJud/LMlzz3qGtHp4G5aVnJKdhBVJIk
	TWt3a6W9H+KgRPT23P/GOBFB1hDZ/rsz+Ft4EYFPKqhyAYAc6Sl6QLULSV0CQrMZtfea1+T2Rq8
	mReYZhM8XMPWCq5bAUI1RQo5sDkgNnThjC7gj+w+VCQno4L2w=
X-Received: by 2002:a05:6a00:4605:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-848895db193mr14552722b3a.9.1784092310681;
        Tue, 14 Jul 2026 22:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: tegra: tegra210_adx: Return the original error directly
Date: Wed, 15 Jul 2026 12:11:13 +0700
Message-ID: <20260715051115.17385-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_add_component_controls() already reports failures internally.
Return its error code directly instead of logging the error again in the
component probe callback. Also remove the now unnecessary local error
variable.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 15a94196ee1a..e75bf50f8fb0 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -496,16 +496,12 @@ static struct snd_kcontrol_new tegra264_adx_controls[] = {
 static int tegra210_adx_component_probe(struct snd_soc_component *component)
 {
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(component);
-	int err = 0;
 
-	if (adx->soc_data->num_controls) {
-		err = snd_soc_add_component_controls(component, adx->soc_data->controls,
-						     adx->soc_data->num_controls);
-		if (err)
-			dev_err(component->dev, "can't add ADX controls, err: %d\n", err);
-	}
+	if (adx->soc_data->num_controls)
+		return snd_soc_add_component_controls(component, adx->soc_data->controls,
+						      adx->soc_data->num_controls);
 
-	return err;
+	return 0;
 }
 
 static const struct snd_soc_component_driver tegra210_adx_cmpnt = {
-- 
2.43.0

