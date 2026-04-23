Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF53BE64B
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949904; cv=none; b=gJDTOeuF8BhkNkbuB8rDszEyLXZdRQ3rOJRaKQNFw6RER88zqD5k5lp1TQ/mu6V7+R5MOEDOJAxiBv4EmCiNEORW3kMerlMAk3EVPDQ2hr7IpC8yf7QwAB3qU0ThG4GtQDqQsSQz4kYuXEG9vOTSkTBgMB9dMMZGAdZOzHTkfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949904; c=relaxed/simple;
	bh=ejM1Zmsj5fEcYO+eOjD7aSvSj+6S4bU9vJee6fm5kjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vl6JKdw369U5lQv2Y9FwLnZjiLSu2NAF/ZKP4gVoIxOfyiczLBPV9lEe1TlH1MO47zWQLCFTd9WH65rrhAyJ+lUeFOrmBH5GZNGAm7ItoGd/X1Ue+tSNP73W/uGbNyA1zXNsp7jfVKsEelNcIqGE3p0zGS9B/sDd8Hb+hFZcR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KljHhsBJ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KljHhsBJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso3546988eec.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949903; x=1777554703; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sF0+se07evB4kXx7iQu5RCnYJG9uujVMlzreUGv6DlA=;
        b=KljHhsBJjA86ah4HJEGytG1NoK6AudumaRRcEAMlsnYvlnGn1CPRt56SJNbgXdt5CT
         gPD/G/XwATcIP1lMkhDaeKyVkP6ttuoXQ2fH0d6y0L1iWRDuYaDkN0MpXJc5SpiqU3aC
         gf1V9USaIhAY3jziWCSUuD2br+Cxp3WBRDDGfwyhtYORcnEuXpuz4M6WHHxvW1NibNKO
         NDfm5e+IrBSMzbSzkunKvN+I7kFoimA1DsCs0lm3bYNxq1EC+QYR3MffYAhMpucQIRHa
         1PpTPduIVR7iTKY6oSqGNElAGynS4NdRYSGGfynhHiK1Ek4WRpaWqV+Y2odWxZ+DQwkh
         JcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949903; x=1777554703;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF0+se07evB4kXx7iQu5RCnYJG9uujVMlzreUGv6DlA=;
        b=DcK03hQA182MmfnHSHRj6UnR/jJ2tH+M8loS81O9mU1oxc4fDif0MehVOvE7VR7xKX
         LdJikTzLx4ASfxWAa+XP8DT++6f+QEHqsubiGO25tHW83TwWlckK/iBxrO7Y33KlQonk
         VRazIisVuNyQ2VmSELrrWVLMPW6qveazEpUO9fGK0XgCXs/IqZmbbGxhJVCp720qf4H7
         Fi1M7CNYbTOqwIvcHCtlnXWj0hWugVK7zleRKvVw9P1fU2Cq+d2RSaFUcXUscDWaQ2+e
         x8Vg1LVj72lKT8tsEsgWJyQf+LwVAZKjUN0r26zXXTPrqUn8CO7aGHkhRn1cO9EqjGk+
         jtpw==
X-Gm-Message-State: AOJu0YzLf0boEkXzFvNkyhvHrlaVHdwJVJLFlCUu8XuCxpOQ17kMqsn+
	yjjPAcEkT0TL+tcsbeGbG4aRZWR2VKJXLVOsXTqe+asjVPX7+IPVrza/IvolzLFP
X-Gm-Gg: AeBDietMekRERJYxd4OwK+S7qnAkDjpI++11tY5sPgZM+0n9UNXq8/VFqyKRsdPG085
	fbGRFsxOJsU3EeuFwcA4Ingra/o+6Xu8v6d9Xm6bc765Bv5dOvnTnfSQ7mhRM+Z1tFEHvSnrYt2
	k0pK8f6aeuNW9+dp/1ALx4eMcuGFwOxbbt2CdEdCJtTM5TyFB8RTFtwpn+i+2VP5DeB+JaWRhH2
	j4uoaFoIU2BrHAd0A3NYd9PhMvFnZHheA8BWfTprfM+tyiswexWjEYmWL08eBvKQaKZZUifNPjl
	fvwb9+DnS/nIWmlRAjvuTPdTX+yNhKq7I0wP9Th6g8wtifBqGwmOb03yNd/DBaZuSnfEtibM0OU
	gzDZdRTi82WsKDGg6RdyXSriBv42cpsBVKsNnQCsQB7PJV4nA39r9BeO/00z7O4rdqCPRdRprYs
	SmnZxMtk5kIvIwMO0LN1rVGIfr3b1R6muwq7lgyH8xUHfuzhJy7AuthWvlV+bsuRcNF/L/hfHuP
	3MYyRQgxnuW
X-Received: by 2002:a05:693c:3011:b0:2df:7882:1cf3 with SMTP id 5a478bee46e88-2e42c15cf81mr12036056eec.2.1776949902444;
        Thu, 23 Apr 2026 06:11:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm36088988eec.29.2026.04.23.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:11:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 23 Apr 2026 10:11:31 -0300
Subject: [PATCH] ALSA: hda: cs35l56: Propagate ASP TX source control errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-alsa-cs35l56-asp-tx-source-errors-v1-1-17ea7c62ec31@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQqDMAyA4VeRnBeIrRXZq4wduhi3DrGS6BDEd
 183j9/l/3cw0SQG12oHlU+ylKeC+lIBv+L0FEx9MThyLTWOMI4Wkc2HMbQYbcZlQ8ursqCoZjX
 s+prYu9B5aqB0ZpUhbf/H7X7a1sdbePmF4Ti+q6CooIUAAAA=
X-Change-ID: 20260420-alsa-cs35l56-asp-tx-source-errors-8d10c3258304
To: Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
 Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ejM1Zmsj5fEcYO+eOjD7aSvSj+6S4bU9vJee6fm5kjg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmvpDrkPvv0JZwTMRLcw2/GlepVUtzkuf7zzdkTLbtm5
 5bGTF/SUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABN5YMbI8JZjdv/ZyTb7zjca
 LJ+4zv/doZjXu9VfN5XJ1i5ZL57il83IsOSJFu8peQ65zYlPHOMeOi/R55/04Oedu16p8asFW9g
 +MwMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_mixer_get() ignores regmap_read() and
cs35l56_hda_mixer_put() ignores regmap_update_bits_check().

This makes the ASP TX source controls report success when a regmap
access fails. The write path returns no change instead of an error,
and the read path continues after a failed read instead of aborting
the control callback.

Propagate the regmap errors, matching the posture and volume controls
in this driver.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 1ace4beef508..dc25960a4f23 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -180,11 +180,15 @@ static int cs35l56_hda_mixer_get(struct snd_kcontrol *kcontrol,
 {
 	struct cs35l56_hda *cs35l56 = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
-	int i;
+	int i, ret;
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	regmap_read(cs35l56->base.regmap, kcontrol->private_value, &reg_val);
+	ret = regmap_read(cs35l56->base.regmap, kcontrol->private_value,
+			  &reg_val);
+	if (ret)
+		return ret;
+
 	reg_val &= CS35L56_ASP_TXn_SRC_MASK;
 
 	for (i = 0; i < CS35L56_NUM_INPUT_SRC; ++i) {
@@ -203,15 +207,20 @@ static int cs35l56_hda_mixer_put(struct snd_kcontrol *kcontrol,
 	struct cs35l56_hda *cs35l56 = snd_kcontrol_chip(kcontrol);
 	unsigned int item = ucontrol->value.enumerated.item[0];
 	bool changed;
+	int ret;
 
 	if (item >= CS35L56_NUM_INPUT_SRC)
 		return -EINVAL;
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	regmap_update_bits_check(cs35l56->base.regmap, kcontrol->private_value,
-				 CS35L56_INPUT_MASK, cs35l56_tx_input_values[item],
-				 &changed);
+	ret = regmap_update_bits_check(cs35l56->base.regmap,
+				       kcontrol->private_value,
+				       CS35L56_INPUT_MASK,
+				       cs35l56_tx_input_values[item],
+				       &changed);
+	if (ret)
+		return ret;
 
 	return changed;
 }

---
base-commit: 876c495d412ef67bd4d0bdc4b74b0bd3d9f4e890
change-id: 20260420-alsa-cs35l56-asp-tx-source-errors-8d10c3258304

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

