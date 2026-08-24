Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C44399E5;
	Mon, 24 Aug 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581402; cv=none; b=fR9mUvoL/U1uiZiAv2tgklX0A4UkfZAfFRwa2M9bAy0JFfXVgMvZAfACG19YvizlxKyIVjV3d6JWpmz8I5aZx5ryt89X1xXeV7gXeJVOpHLMkcjs9sLUBhM1rLHJaswUEllbek398zaWpX0V+hsTxFQWSCaEG2+ccV++GtMEz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581402; c=relaxed/simple;
	bh=nBRzrtAs/cY0h8yCoZPgzFhgu4gu1MzSIj+l+WGgfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8unqvOW6G9IWc2T2w/jYAEDQylkbKMWfKxTRZZCwaH6P5r+LOgTzNI35wglitJjiY4l3LCr2RMikpBjOfnyCZi4IJtNO816PkybsrUUTSeOKE4k0rFoOCwSutdJIm9v5zW7RM53+nII83r7PZftZAOAOkK3OEpvkuHGg7Eoxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JL0KniDs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JL0KniDs"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 69E7288475;
	Mon, 24 Aug 2026 16:23:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDk_6dhFphJR; Mon, 24 Aug 2026 16:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1787581396; bh=nBRzrtAs/cY0h8yCoZPgzFhgu4gu1MzSIj+l+WGgfCA=;
	h=From:To:Cc:Subject:Date;
	b=JL0KniDshF7g94w1QQc6MQqO/sIfwzkEksgFAH1KVbeiGmcPxOF0bU0rOv3fMhC8O
	 BsZXn7SCk0dD3eCpw4/Bxmru79JJNUqeBBlwVDoi+uSJWvxZs9ha3OOyrmnkjtDBpz
	 lF+Qgs1b7PTPH4koUW+hGz4/E0KV4Mv/0uv8S1P5Wd7EEsiHwbgyNOKAUFyssw2NL+
	 8v/IqM72naRjp2zUzRcwkT8Knf2dysKbF/4wnm7QEiTQGIAjDf87Gpr7kVmYKS9rXT
	 vCCH7oqnq/vgiEuX+r/37Y0AFdf2psltFfIMEO2lUoIRNmdAVXBfJtru5vhJ3fWeqy
	 Mdea2IHbb/jcw==
From: Sven Jans <skbotnl@disroot.org>
To: 
Cc: Sven Jans <skbotnl@disroot.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
Date: Mon, 24 Aug 2026 16:22:07 +0200
Message-ID: <20260824142209.4945-1-skbotnl@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The laptop has a malformed _DSD which causes the cirrus,dev-index
property to fail to parse, so it needs to be supported using the
configuration table.

Signed-off-by: Sven Jans <skbotnl@disroot.org>
---
Created against tiwai/sound this time (I read that's preferred?)
Link to v2:
https://lore.kernel.org/linux-sound/20260709214414.8461-1-skbotnl@disroot.org/

 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf3e..e14a87336 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -511,6 +512,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8E60", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.55.0

