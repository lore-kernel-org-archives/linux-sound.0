Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67102A1CF;
	Sun, 26 Apr 2026 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161809; cv=none; b=AO2kbdNHdQy4iSiD5VTuNt+xQRIJOcy5BfCRnTIqnf6CutGeJ+M1kRTvzbPfDP/4h2sIVjTthE4l3cZQYqHoq1k88igiRNDlmwgBfgoGsAmHMqBkZ6JfNAWiMWgWodLFh0hAo731Vk/Zy6/aJ231mMZx1kARaim63QTToH4JZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161809; c=relaxed/simple;
	bh=fKeOLDi1b/CZhehpyEQ3J7pCisexHFar3xK6TAxv6jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gkzm2N4U2h6AQCTvZSxmi50HWPC2fJXuNpTgEL3qWiougxGuMDHArsA7wCSETn49fN9VMf433VrgxLrADKZ01ti7/Y56comJ4MJUfaxT22VjJAdoVx0egMNCa/saF9GShueYp1xBTbveKFQ2kzYtKs8NOPzKFgaOHzT1e1u2tIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSzTIZyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSzTIZyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA07CC2BCB0;
	Sun, 26 Apr 2026 00:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161809;
	bh=fKeOLDi1b/CZhehpyEQ3J7pCisexHFar3xK6TAxv6jM=;
	h=From:To:Cc:Subject:Date:From;
	b=sSzTIZyU6YWNkWa5mXzejt5UplXJzWQJ+UAmMakXdl+K2+r6r6S+SIHm4v/q1vayd
	 0BYaafW1btzBukUJ7iDxu6fD7QZwrahFhLY81g83aLV5uukJtpyl3d8cZQm+wxmQWu
	 zfLcZx7U657hmGM/9PIQ3B0K2Zded1WqNSDHQ50Ybh6T0foV2+szHTUbuTCM37ii1k
	 EbdQFr4UPcgkQdDL8bCJRP/RdzFyrFHBkIuFtiIULadh5SIbOSXV42fSdkIFbyK8YI
	 y0x65bxnh00ODowgN5HFJSkVzOCw9OXgoqyUuFB/0p8lIlM6WAL7T+vyPInkp3f/EO
	 rUvoVx2HnT+3A==
From: Sasha Levin <sashal@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Remove duplicate cmedia entries in codecs Makefile
Date: Sat, 25 Apr 2026 20:03:27 -0400
Message-ID: <20260426000327.56079-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kconfiglint reports:

  M004: 'snd-hda-codec-cmedia-y' assigned with ':=' but was already
        assigned at line 5; previous value is overwritten

sound/hda/codecs/Makefile contains duplicate entries for the C-Media
codec driver — both the composite module definition and the obj-* build
target appear twice:

  Line 5:  snd-hda-codec-cmedia-y :=  cmedia.o
  Line 10: snd-hda-codec-cmedia-y :=  cmedia.o  (duplicate)
  Line 24: obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
  Line 29: obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o  (duplicate)

This file was created by commit 6014e9021b28 ("ALSA: hda: Move codec
drivers into sound/hda/codecs directory") which
moved codec drivers from sound/pci/hda/ to sound/hda/codecs/. In that
initial file, cmedia appeared once in each section.

Immediately after, commit aeeb85f26c3b ("ALSA: hda: Split Realtek
HD-audio codec driver") reordered the entries and
inserted cmedia at new positions near the top of each section, as part
of splitting out the Realtek driver. However, the original cmedia entries
were not removed during this reordering, creating duplicates of both
lines. The second assignment harmlessly overwrites the first with the
same value, and the second obj-* line causes the module to be listed
twice — neither causes a build failure, but both are dead code.

Remove the duplicate entries (second occurrence of each).

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/codecs/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/hda/codecs/Makefile b/sound/hda/codecs/Makefile
index e7f03e281999f..88d2f8a79467b 100644
--- a/sound/hda/codecs/Makefile
+++ b/sound/hda/codecs/Makefile
@@ -7,7 +7,6 @@ snd-hda-codec-cm9825-y :=	cm9825.o
 snd-hda-codec-analog-y :=	analog.o
 snd-hda-codec-ca0110-y :=	ca0110.o
 snd-hda-codec-ca0132-y :=	ca0132.o
-snd-hda-codec-cmedia-y :=	cmedia.o
 snd-hda-codec-conexant-y :=	conexant.o
 snd-hda-codec-idt-y :=		sigmatel.o
 snd-hda-codec-senarytech-y :=	senarytech.o
@@ -26,7 +25,6 @@ obj-$(CONFIG_SND_HDA_CODEC_CM9825) += snd-hda-codec-cm9825.o
 obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
 obj-$(CONFIG_SND_HDA_CODEC_CA0110) += snd-hda-codec-ca0110.o
 obj-$(CONFIG_SND_HDA_CODEC_CA0132) += snd-hda-codec-ca0132.o
-obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
 obj-$(CONFIG_SND_HDA_CODEC_CONEXANT) += snd-hda-codec-conexant.o
 obj-$(CONFIG_SND_HDA_CODEC_SIGMATEL) += snd-hda-codec-idt.o
 obj-$(CONFIG_SND_HDA_CODEC_SENARYTECH) += snd-hda-codec-senarytech.o
-- 
2.53.0

