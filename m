Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9FA40F8CC;
	Wed, 10 Jun 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107037; cv=none; b=EODeBVcv7hbgy2hC5r99Vb5F1jof9kbHg+phl0c8ulzDXWGrS6Ib2GWM3JXEwf0t+cmc1aAHQdddu1rcez4W+NKjSK+htIDZG1FVuoXxX611UV26mHu1RDAod0qOHX3KI6Fo0Zgd0uWkV76O0LKFVMC4rQOjxGdH1BCMjIGJOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107037; c=relaxed/simple;
	bh=Z6dnVy0IPF1i2HHyjgUfXO20JQjwcp5mVvu+2hci7/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrqxSVMBv/2RmXBvD/nc+Q/B6QIxJfKEiBc41GE+o5etjJ/YgG5b2m1GCtERm49ejZac30gT5GNJBkckvbMghOSjqkllatlE/pYveEMv3OwHTw5sR5fFq5tCP8PzuOSnLKS0lU0UFyqmbYzY88vu+l5S83j+ksOCnSSG/qc2XI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=M56vYu5H; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="M56vYu5H"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C37F326DFC;
	Wed, 10 Jun 2026 17:57:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1eBA_By-t0M; Wed, 10 Jun 2026 17:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781107034; bh=Z6dnVy0IPF1i2HHyjgUfXO20JQjwcp5mVvu+2hci7/Y=;
	h=From:To:Cc:Subject:Date;
	b=M56vYu5Hckz1dJ0SL6vmKDebV2BnjxoveywHu0ycOoZS97laA9t63ehizV3TvTd2Y
	 dotE1m+AD+JL0nB/9y8YW99Fb2H4g5C+69hEa/Jv/fIeO7fZKu2BUsTeTt0tryz58r
	 F5AaGR0CJkOYK/EBRoPMmPx1bIbJu/hSzC/rkid6WwYmTRCYBWvKBF14AbHp1Z1qaA
	 zogsGhbWAM1VzMCY0EEEVpjjrFVE49t59wLsSAQWBg357GWNhjRRisFgwEb83ymGAy
	 WM3o5qtWaMpU0tnK9tlNRDX98waXXIps/oLCz+SDuER4pPUnHaIF5zk5UCB5SWB1uO
	 obOadnASx+Zzg==
From: Marco Scardovi <scardracs@disroot.org>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: Add SSID quirk for ASUS ROG Strix G16 G614PR
Date: Wed, 10 Jun 2026 17:57:01 +0200
Message-ID: <20260610155701.118313-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Strix G16 G614PR laptop (SSID: 1043:1074) uses I2C to connect
two CS35L41 smart amplifiers, but its BIOS ACPI tables lack the necessary
_DSD properties to describe this hardware setup. This leads to the driver
failing to enable the amplifiers during boot, resulting in a -110
connection timeout:

    cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Enable(1) failed: -110

Add the SSID quirk entry in cs35l41_config_table and
cs35l41_prop_model_table to provide the configuration override. The
setup uses internal boost with a 1.0 uH inductor, a peak current limit of
4.5 A, and a 24 uF capacitor. The GPIO indices used are 0 for the reset
GPIO and 1 for the speaker ID GPIO.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 732ae534db36..4a3b14468dd8 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "10431074", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -510,6 +511,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "10431074", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.54.0

