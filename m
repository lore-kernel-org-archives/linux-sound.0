Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE44F0545
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413643; cv=none; b=AhwqDz4xScKM4ueWP7a0F8SdCUY8LzRFCuMRX8ofyqgSShsE6dpoi9kOtERhnJfl0vstI5PiqkMsXeEvhvpCMNP0W4/lMYTkc+dOGOqbFOLYf9PlhH5n1WEQNHqEDbufZVzaF07dIX3VUmUnIAorJeTO26m2cmREm2cmwoHtQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413643; c=relaxed/simple;
	bh=+U3UOitV9swawLPUgHDjqXjMi6tF/ayfw+8rddSHT3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3qYbvuhAqWO6wY9cHDqgnjfO94DaeErIDViRAnwVepMHkOlTPuegHNCy7jCUA5vAHoCfgpBHvZV2plzbENBVEn/uasNR3z/u6gNP0FDXVGo8uyRyHakEBPXgm9ozug6vyD5RSaAgjAdpirAyf7DC33W32lS2QEA7L4GuB0w6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srfRRoDt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srfRRoDt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06b436dffso289594b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413630; x=1793018430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsWYDDajpUNibo8xaupeGhhH1lTDWeFw4XFOrh3OmFs=;
        b=srfRRoDtD3C17DiyYAeDJYoH1fxQIIym1xyIDFwmvc+ORBH/Pop0HA0ce8C/QtvciM
         e/bx+IQatr0LtsgSeatIFICoXuwgpK4+19c84qPdN9HvMfDJjh7EfhJzG+aBFVRJ39CD
         r4SVpMAtcd5/6uLhIoiHSE74r+OCYbAFD5ggKdGlK56mHyvGGCVzVpp+ZlyA46GH0UfX
         MGgCJhgUIZZ/5MtQivVPAnF/3uljTkxdCz+rjrsuou5HjHn2FG51qVwRr8CV+KxXn15D
         HQxBjCMBunAf8T2g3ZHo84aK+Dyhx5OUukxiPfKcCMP/7jQUgt70ZxFImsREPBVl2+Ib
         uaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413630; x=1793018430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsWYDDajpUNibo8xaupeGhhH1lTDWeFw4XFOrh3OmFs=;
        b=RIzyYZDgrMB/et539ida/SnJu/LT4cXsRmdAmCs90VLp5U0O3euZYR3asEj+uicrQn
         OiCHpIwLNF4hMF3bySvdhfPSVJKkv9ls2idZT/Fc9nJ+XDtcOr33y+lFhmM2Ki90fbNx
         KV64r20FkDfV6wdtoPXJFKEDtv1DJcXQKXrhJSw+3+i1zWBwmKxTR6MFJ9EB5FDzBfGp
         TF21+HVrbNpbONnwi845IyBO5HMuMYiwOOj4T7HEUht7bTG7zVepdtSxRrloqxN7XIGc
         q4uCK1HGzM1K7Y37Sk35kov2trkVddWbJkOiM6ZFoZAs9rgT1oFhtmAtvyt8cKK68M7B
         pVXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxI1cxuuZCrf0He6MoVh/KlUDRcbJuGoTO2ywbQwuXrKkWHLqVKz+9MYtuCf9C+xT2GlgQs26h9w/5Ig==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMXeO93yrUCaVKBl987MzdETsGgyvyEPQW8dJEhi3oSWq4ors2
	YJuncQ2V+v8HYWLX0Fw7POdxmjz11zguoy0qM9CUbnK9b//EX+73unbQ
X-Gm-Gg: AYBFou3++iPHbEt8y713jDRoez7m2mNugrsDgQm1R4hldS3vK1pw9mMNYZZ1KYtI2v9
	14PsSlqL1v7RRr9Nfq8JiDarCdI1PEA2SWD3IGALekpGi8k/xZKpo2k6QTxD4NKXN6qzyBHdXsh
	Pfa/cKkjOzgFXuLXIhopE5zU3GkiVQqN08+wx/VOexrRWMqyB4eLkx3jTL95dJuYQ049opwQrbq
	IDvQuL5EnodbwGUyTKIEL0PyqHz3NHfUMkC8k5+rgkC/RmS92kSi0zptSvVhG741LUBg100bjDO
	for46wHvK3IvGUsEANMwExADMVWXxk+7hPeXSUS0qLk+555MHsm46eioXbtvrK0yoPRiNJMgU1a
	1KqoO8/EqgVNE3LOpbFdlV3q0KxZtUqhx6q8es3ahPl4h7gAqz35zgdA4XxjfQc8XX0W8yFV7Rt
	lC4iYPCLpIOsOZG2vGPjRkmKVEqlvxJi1LOx3qEwEaeVco+uUWxzu1tMtVmVzhtZBTQRkQ/bI4q
	i26nNl84HEaxUi5i9GrAvQjlnKpdoKxYI2fV7mCf7IOKnr2LLmX4G3LS6ShC2X1I/ON1+JzHqsc
	cizHw/9/NE/3
X-Received: by 2002:a05:6a00:4385:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-8a04ac28ab1mr5908872b3a.6.1792413630214;
        Mon, 19 Oct 2026 05:40:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fcceb71a5sm3443033b3a.54.2026.10.19.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:40:29 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: cs42l56: Remove the ADC Mute Switch control
Date: Mon, 19 Oct 2026 21:40:22 +0900
Message-ID: <20261019124022.3410793-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC Mute Switch control writes bits 2 and 3 of the Misc ADC Control
register. These are the ADCA Invert and ADCB Invert bits, which have
their own controls. The ADC mute bits are bits 0 and 1, and the DAI mute
callback already sets them.

So the control has never muted the ADCs, and nobody can be relying on
it. Remove it rather than point it at the mute bits, so the ADCs are
muted in one place only.

Fixes: 272b5edd3b8f ("ASoC: Add support for CS42L56 CODEC")
Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/all/atXh3Br+fuH83S0q@opensource.cirrus.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/cs42l56.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 54d23857b0ad..ecce51985a11 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -419,7 +419,6 @@ static const struct snd_kcontrol_new cs42l56_snd_controls[] = {
 			      CS42L56_PGAB_MUX_VOLUME, 0, 0x34, 0x24, pga_tlv),
 	SOC_DOUBLE_R_TLV("ADC Volume", CS42L56_ADCA_ATTENUATOR,
 			      CS42L56_ADCB_ATTENUATOR, 0, 0x00, 1, adc_tlv),
-	SOC_DOUBLE("ADC Mute Switch", CS42L56_MISC_ADC_CTL, 2, 3, 1, 1),
 	SOC_DOUBLE("ADC Boost Switch", CS42L56_GAIN_BIAS_CTL, 3, 2, 1, 1),
 
 	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L56_HPA_VOLUME,
-- 
2.43.0

