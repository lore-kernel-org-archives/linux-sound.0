Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F583DA7E1;
	Mon, 20 Jul 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540513; cv=none; b=WN0uMeJJGenZV+IcGBaYgv/xozNrWipS6N23ych6mk19bMUuhKw3oYEXqAJKOO3sOYf1Zf0TSdJWpn7kc1iNNGvEHDuM4Z5MnbDd8j5Lq1QVhac1DeyEWkdJTNZfmnDBTs03iGxg49KcvZoUzLeWg/JTReBrFTcu9qCOni0ypGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540513; c=relaxed/simple;
	bh=7qP/saATMfVrYH3GbylnEd4uteuiWjMTWxpwFd3ZWCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H8zoFlkxEYFOQTCSZVA1gVnBki49kObBhbG7RaC2m0Q6xpwU1jAh6B0UMh8LzcsRo1q4A5OScCAE6M9CLSbuh/ZHsFIgx52aXIj3BIPDBRo0VweFataYYf9PIflkdEOeBXWFYXXrDNs7d8jOlGhXsdlZxvmkrdeq10G/D1Tj27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcHdevEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcHdevEv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85583C2BCF6;
	Mon, 20 Jul 2026 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784540511;
	bh=7qP/saATMfVrYH3GbylnEd4uteuiWjMTWxpwFd3ZWCk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tcHdevEvfChpSV2LWrwexjtdrcqkN4yszfSeX9gmQSiiiIPUZrF6FF5CYhlri9BrP
	 FKgbYuHVcSf4VhuLq3YWb/5s9aPsT3CRWnpddUJw4sQEGjvEDrrIWc8m258hmBobpE
	 MvHXG24NGtGgDQFXomCGBxPn9CZRMFxMoRroKEMlHBZmzMrhaTjDXGBt/Pyk73lqv6
	 RV3DAghhHBoSIYjh3AuBP6+zhI7T/SNpvht6yB99h7Sn63I1cd2I47/778vabUOJe+
	 pldDlyhXZT9Fe2S8eIRhnlBX75gxb9Ie4syPYSfq+0xL+UvgjtCeZdCHjleNxbAJ1T
	 7BTIlK7QDYhTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73411C44527;
	Mon, 20 Jul 2026 09:41:51 +0000 (UTC)
From: Philipp Oster via B4 Relay <devnull+philippdev5396.outlook.de@kernel.org>
Date: Mon, 20 Jul 2026 11:41:51 +0200
Subject: [PATCH] ALSA: hda/tas2781: clear cali_data.total_sz when
 calibration read fails
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-tas2781-calfix-v1-1-3a5fa6ad90bc@outlook.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlATjb4SHUzXWggLjQjEvycdZ
 2CmQMZEmGHqCiR8KNMZG4i+A7fbuCEj3xgkl5obydltszSjYM4egV42WOG1FhiUWqFFV8Km/+G
 81PoBHxcj6WAAAAA=
X-Change-ID: 20260720-tas2781-calfix-3a1d661ef44b
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gergo Koteles <soyer@irl.hu>, Philipp Oster <philippdev5396@outlook.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784540510; l=2997;
 i=philippdev5396@outlook.de; s=20260720; h=from:subject:message-id;
 bh=3ASFuBghZlzq4VeXWB7VHquriNyFyHqybRG8T5MRS3s=;
 b=GG8FGNBRFA3VHwPkrtKPNzvRM1WwLT8GN/sWIf/FRCXQ8L4PIYdspcglEoscAZ+5RuhpVqzfC
 w68i4MXscGLDTwGtzHp5CUVEpt59yvmXnepaAkc8gWvjMJCd3B1O3kY
X-Developer-Key: i=philippdev5396@outlook.de; a=ed25519;
 pk=eT8kbz1b1YS9DKzFAuB7xKR6XscHmecvQiv3Mddjjhs=
X-Endpoint-Received: by B4 Relay for philippdev5396@outlook.de/20260720
 with auth_id=885
X-Original-From: Philipp Oster <philippdev5396@outlook.de>
Reply-To: philippdev5396@outlook.de

From: Philipp Oster <philippdev5396@outlook.de>

tas2563_save_calibration() assigns cali_data.total_sz before it reads the
per-device calibration data from EFI, but its error paths return without
clearing it again. cali_data.cali_reg_array is left all zero, because the
function returns before the register addresses are assigned.

On the first playback tasdev_load_calibrated_data() does

	if (!data || !cali_data->total_sz)
		return;

which passes, since total_sz is still non-zero. It then issues five
4-byte bulk writes to p->r0_reg, p->r0_low_reg, p->invr0_reg, p->pow_reg
and p->tlimit_reg, all of which are 0. Register 0 decodes to book 0 /
page 0 / register 0x00, so the auto-incrementing block write zeroes
registers 0x00 to 0x03. Register 0x03 is PB_CFG1, which holds AMP_LEVEL,
so the amplifier gain is set to its minimum and the speaker stays silent.

This is reproducible on a Lenovo Yoga 7 14ARB7 (two TAS2563 on I2C,
ACPI INT8866) whose factory calibration was never written to UEFI, so the
EFI read fails with EFI_NOT_FOUND. The two woofers driven by the
amplifiers are silent while the tweeters driven directly by the ALC287
play. Reading the amplifier registers over i2c shows PWR_CTL = 0x00
(active) and the TDM slots correctly programmed by the RCA profile, but
PB_CFG1 = 0x00. With this change PB_CFG1 keeps its power-on default of
0x20 and both woofers play.

tas2781_save_calibration() in tas2781_hda.c already clears total_sz on
failure; do the same for the TAS2563 variant.

Signed-off-by: Philipp Oster <philippdev5396@outlook.de>
---
Single patch - see the commit message for the full analysis and the
register-level evidence from the affected machine.
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce18..b1c89cc35 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -355,6 +355,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 			if (ret < 0 || ret >= sizeof(var8) - 1) {
 				dev_err(p->dev, "%s: Read %s failed\n",
 					__func__, var8);
+				cd->total_sz = 0;
 				return -EINVAL;
 			}
 			/*
@@ -372,6 +373,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 				dev_warn(p->dev,
 					"Dev %d: Caldat[%d] read failed %ld\n",
 					i, j, status);
+				cd->total_sz = 0;
 				return -EINVAL;
 			}
 			bedata = cpu_to_be32(*(uint32_t *)&data[offset]);
@@ -383,6 +385,7 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 	if (cd->total_sz != offset) {
 		dev_err(p->dev, "%s: tot_size(%lu) and offset(%u) mismatch\n",
 			__func__, cd->total_sz, offset);
+		cd->total_sz = 0;
 		return -EINVAL;
 	}
 

---
base-commit: 199c9959d3a9b53f346c221757fc7ac507fbac50
change-id: 20260720-tas2781-calfix-3a1d661ef44b

Best regards,
-- 
Philipp Oster <philippdev5396@outlook.de>


