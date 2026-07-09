Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B53A2576;
	Thu,  9 Jul 2026 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633543; cv=none; b=tFameRCZ4dv20gV7j43jsiR+S+Fw4/5nAWSs2V9nyzys0uhNLDpdKOMv5l3NDZybB4+40i8Y7sK3EKPewhyMzuPC7sdab+frl/mYXN+9OSfAenGWZmBlKB/evuGa2F5fHUXOMjODax7prbYe+0NuqngDtdKV15TCDoN39xtK5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633543; c=relaxed/simple;
	bh=BzfXC+KvE0vSQazNiIl9J3TEEr4ziRMqLTt+kh8gp6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbjPy2L8jo1knEpXu2ahSsNqTXcVsS1z2a/I/Jvv7lE2UpBJcWP9bzSD1wFGqY3LU5im7fy8pPhtChNIevmIPYi6E0TQ0G7uRuwbGO2U15FowgFOB7MRY9mvLcOtPKJUHyylzYjBCo3WePb4P7FMWWz5IRMzr3/FS+9boZi/aHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=O3AlB/oB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="O3AlB/oB"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1B71A8833F;
	Thu, 09 Jul 2026 23:45:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbbIywkWF4-8; Thu,  9 Jul 2026 23:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783633532; bh=BzfXC+KvE0vSQazNiIl9J3TEEr4ziRMqLTt+kh8gp6s=;
	h=From:To:Cc:Subject:Date;
	b=O3AlB/oBOSaBSewOmSkpm0RyP2ocbs+4qvlHIlGTu616x+KgRXpzYPkYR5tMoxlFt
	 s96ySEdvW3oygbJU4BKMruDviDyceDFhL1mP4ilYjQCGlg4LRrh5WHVyWkfRKrVADI
	 O0Ba9Q7wlV6K+MOvSWoM2LCk0gZJhePh2W2ggV66FjANVqv3n40B9p3Un4t58vxHAz
	 g6FYCeCBU9EbmI1j8NYCsVYCpt9pK5dIHKxw8jKvHtvyveQmxfIOt6XNO6AoQYnqJ7
	 4qST8Oanl9G1iV3ddWF6kqNBbpYQpVg03vVfv7b/Xuvz7K0a3nLTK8tz9X2Gp3IeQL
	 qeK2xpz0V429A==
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
Subject: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
Date: Thu,  9 Jul 2026 23:43:53 +0200
Message-ID: <20260709214414.8461-1-skbotnl@disroot.org>
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
Resubmission, discussion of the previous submission stalled.
The values are equal to the values reported in the _DSD.
You can find my ACPI dump to verify here:
https://bugzilla.kernel.org/attachment.cgi?id=310050
Link to v1:
https://lore.kernel.org/linux-sound/20260506181807.22547-1-skbotnl@disroot.org/

 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf3e289..e14a87336478 100644
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

