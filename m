Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF809318EC4;
	Wed,  6 May 2026 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091534; cv=none; b=IMPhfNNLvvSc26tqPctgDEBtuC63SNrF/VEEmlcPYEqhIBBc8jWuijdvUOW/XuPxuaLzZPfuX0v8kfPemWjMi90EiO9alIH9IsVLM+74qz7++zxP9lyKDHXu1whoHnfYpjn7v3Jbc7hyZOc+/LlJn2lKmKE9W3WbE/plMSnk+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091534; c=relaxed/simple;
	bh=B3g5tLFHaDq9C4UNLjtQHDOAc7kvnDsur09qtwVpeGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rvzo0+urmk4QO5r3BGQWSnWImRWmTMGzHkIlgv68rWJ1H/d3Q5SkjzLcVlEkzwdMT7XCrq1ex0zFtWdu1Yjjt19ztqD0GBd81lBxna5qgOz1xFfe+cYxWQro9BbreJxXEZxh3aIiRRWZPj9lqCl+3rHrlgUkqgbe4HCm74CAjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BQFjSG4Z; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BQFjSG4Z"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A987927146;
	Wed,  6 May 2026 20:18:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QQi_MlneqGM; Wed,  6 May 2026 20:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778091524; bh=B3g5tLFHaDq9C4UNLjtQHDOAc7kvnDsur09qtwVpeGA=;
	h=From:To:Cc:Subject:Date;
	b=BQFjSG4ZMceQgPL22jA4oIKcOjRPpeGxyzlfZ2BajAJiEbmmJzlUEr/ZNIJkFgwLf
	 ymSvCKuJONR5H1v9beo2iw0u1fpdLQAMToNCGEWegcb9tTacs+lPH8f9Q21ESlwE2Q
	 O6gdTO3Bi3SmDdzQWSK+c/MSwiniMQEAqVrbo56MZ8xgIQwW4f8qHhl8ni7Xs7t1WD
	 GMA9ZSlXeTpUE+VRwrAnzDeaOgouQLr4ZLzCspFG4tuBgBK4prrad7etpkO0EIb/+d
	 5sY+qfTSwS35BSU8CFZNvYStmDhEw6eXcsW+g7ZTZWXhgnBdntsBB2hkE9cdz14aCm
	 ByER7L855USuQ==
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
Subject: [PATCH] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
Date: Wed,  6 May 2026 20:17:41 +0200
Message-ID: <20260506181807.22547-1-skbotnl@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The laptop has _DSD but the cirrus,dev-index property fails to
parse, so it needs to be supported using the configuration table.

Signed-off-by: Sven Jans <skbotnl@disroot.org>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 732ae534db36..a972da0ae4e1 100644
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
@@ -510,6 +511,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8E60", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.54.0

