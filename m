Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A63C3456;
	Mon,  3 Aug 2026 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748316; cv=none; b=QVizZ6yxFvvS1H/jmziENFyEfylf8Kaqw2vzId9+dj7/qlURdGzT4Od8fqYg0k/J013JRDGNWiIrX/ZZH8K1RvO/RlhZ6FhFVJ4lw8F6ivsOkhsfO6v8XIV4dPl4fxsTYZC41RRSLAbE5GX6RNip8hvkHsDXSuvv45aFoSsmeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748316; c=relaxed/simple;
	bh=UnQFYIYl224TteyecrWyHPrHvmIQPLmEPiOJJWgpsAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOTkHlRruNVG4KEkUSVJqI+cDPie4uiKdeYj0XTIgXIb/guYzBdNMgqlibNVGS+/slJCumlqVX6UDRKl+8oNisBZ3YGYqIWd7MnEkpx0C1YZVaNpDYbr8yidYcE33poPYogTpJylXoKerXnp/DM+L93lujnJ9wgDKYfBv4+L3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=GOtQINka; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="GOtQINka"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70F8028055C;
	Mon,  3 Aug 2026 11:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748312; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6O2/lIsRkQYcRZw/zPlIL050BQqUepmVm9n/VyizR+0=;
	b=GOtQINkaN2pUcljcKgY9UW7YnCOlPqdvZ51haPz75xgPg4r6Efhnqxx805nJKi7m4mE4KD
	V+/eLoxLDfi2cT++lAm7sCCusXw2VH5LQidwCpNnqSh5d11pjxOTC1e1FSJwZsRSurqwXm
	TGCu8cwhMzSDY1+O3LcIBFkBAu5VTWNWDO1O26r7y5m1IdMi/sI2o1tYfOzgVPvwhl+HEJ
	72xDUyoA95UIGoeVNCibsUQnJ4XdTVgynYNkUiHSKTHD+m4r7McWfXK88xcmAj/5+w427v
	oeMQiHQizt92pb+SzPmwbeBpsIixPH7encv69tDcwT8uiUj3Wtr5V7i17lc39A==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC285_FIXUP_SPEAKER2_TO_DAC1
Date: Mon,  3 Aug 2026 16:10:56 +0700
Message-ID: <20260803091102.107570-8-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Now that ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1 exists,
ALC285_FIXUP_SPEAKER2_TO_DAC1 can be unchained from
ALC269_FIXUP_THINKPAD_ACPI.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 991136bc43ec..1e6f3f262e03 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -5209,8 +5209,6 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC285_FIXUP_SPEAKER2_TO_DAC1] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_speaker2_to_dac1,
-		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
 	[ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.55.0

