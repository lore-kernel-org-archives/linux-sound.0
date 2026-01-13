Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE930FC03
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293909; cv=none; b=u2zM7TMHpddNw2+11VdH0aU4iPlGS9DA36bWcsoRNwEHtWTQIHP85wUadv1qAtQ9sx4EbxOjDm9y+e5wzMd0rKAGhm78O/WhMoNwbPaC0RlabJvRFlowwkMlvoIL6g+2Fw1fiEKzLoK+Mv9DQeZT4t5qa5f1fUany2tkXOcoj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293909; c=relaxed/simple;
	bh=Vc2XEyvmED0yXDfIZ9BtFVrsaKJzlipaq2Z3yVIHu3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkbuJnDMywYjIwKNO+4d0FCN+GlC9iWOjpnLw0uGWmkhLA0JFvfOQg3q54MWqWaBPis2CJt8PrAwc29NUzQh7Tp9ih0D+M7XBfarAuEpDMLP4l9M/eo/aVEZCwA1GvtywJCnGmZNza4W03VamqhoQ00GRpB5fn6nJHUdQQ386KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: linux-sound@vger.kernel.org
Cc: ckeepax@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	broonie@kernel.org,
	patches@opensource.cirrus.com,
	cole@unwrap.rs
Subject: [PATCH] ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
Date: Tue, 13 Jan 2026 01:44:02 -0700
Message-ID: <20260113084402.10427-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS42L43 codec's load detection can return different impedance values
that map to either HEADPHONE or LINEOUT jack types. However, the
soc_jack_pins array only maps SND_JACK_HEADPHONE to the "Headphone" DAPM
pin, not SND_JACK_LINEOUT.

When headphones are detected with an impedance that maps to LINEOUT
(such as impedance value 0x2), the driver reports SND_JACK_LINEOUT.
Since this doesn't match the jack pin mask, the "Headphone" DAPM pin
is not activated, and no audio is routed to the headphone outputs.

Fix by adding SND_JACK_LINEOUT to the Headphone pin mask, so that both
headphone and line-out detection properly enable the headphone output
path.

This fixes no audio output on devices like the Lenovo ThinkPad P16 Gen 3
where headphones are detected with LINEOUT impedance.

Fixes: 45b8e93bd0c7 ("ASoC: sdw_utils: Add helper for soc_sdw_cs42l43")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/sdw_utils/soc_sdw_cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 4c954501e500..2685ff4f0932 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -44,7 +44,7 @@ static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
 static struct snd_soc_jack_pin soc_jack_pins[] = {
 	{
 		.pin    = "Headphone",
-		.mask   = SND_JACK_HEADPHONE,
+		.mask   = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
 	},
 	{
 		.pin    = "Headset Mic",
-- 
2.52.0

