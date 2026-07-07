Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A52EBDDE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385801; cv=none; b=o8sE9j5dpS6eAQTXrTLWbKZFj5rI/HwcQ4DyKTK5KjjgCYGFIjysl+S4xQVZzSY5+e01OaR8I6i80O2Bh1rm22nzK8TcEDf+kKsBONPYLgNTvyffjiAUKBLKydlWfJr7lDF1368g95KWkmA+NtUrMzp/sC6BzFIX29OTjYIExt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385801; c=relaxed/simple;
	bh=1jCN+3XOIMcy75FHKd+bRO5hGTs0qQo9yrkqtvjX98M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUHccZEmfWIgtpN4nmj2H6TraudkFo6ADwXcw4APZsOxfvatGaikGPuToVUjcGzpLG4r0kMH4YH5XHzN7uMm1pWseT+usbTH1JzVkIjI0YE4k7+9YcJn9ci+9T58pF2UJ+VDhM+gRsMX8e1GWUSuj2/TWbU49hFwQA3a2cZPWXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UCIGXwCv; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UCIGXwCv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783385797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9J2BEeltXooG2kuHveB4LlvdHSnGiwNAVHFqlOAJ9jw=;
	b=UCIGXwCvb9qTllmvtbqBdSb1aTVF8mjvk2gNRk1fNjDmJFT4cj1fHG3BLG0JzYY1PLh6mb
	bt654g1HoIfMnDe7HqkevEZC5XHAe8iI8wgcqvUKJsi5PW0Iv8HLUg0v/9ngEJaeOih6A4
	dLbOlVYSK6RZqVPQaIm9WnQerXH6euI=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 2/2] ALSA: hda/realtek: Fix headset mic on ASUS ROG Ally X
Date: Mon,  6 Jul 2026 17:56:15 -0700
Message-ID: <20260707005615.52889-2-matthew.schwartz@linux.dev>
In-Reply-To: <20260707005615.52889-1-matthew.schwartz@linux.dev>
References: <20260707005615.52889-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The ASUS ROG Ally X (RC72LA, PCI SSID 0x1043:0x1eb3) leaves the combo
jack microphone pin (0x19) unconfigured, so a headset microphone is
neither detected nor captured. Only the internal microphone is
available.

Add a pin override that configures node 0x19 as an external headset
mic, the same way the original ROG Ally does. The headphone output
fixup chain is preserved, so speaker and headphone routing are
unchanged.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cb385b6c1788..f164c2377e48 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4118,6 +4118,7 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
 	ALC287_FIXUP_ASUS_ALLY_X,
+	ALC287_FIXUP_ASUS_ALLY_X_SPEAKER,
 	ALC287_FIXUP_ASUS_ALLY_X_I2C,
 	ALC295_FIXUP_DELL_TAS2781_I2C,
 	ALC245_FIXUP_TAS2781_SPI_2,
@@ -6479,6 +6480,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
 	[ALC287_FIXUP_ASUS_ALLY_X] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 }, /* headset mic */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC287_FIXUP_ASUS_ALLY_X_SPEAKER,
+	},
+	[ALC287_FIXUP_ASUS_ALLY_X_SPEAKER] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_speaker2_to_dac1,
 		.chained = true,
-- 
2.55.0

