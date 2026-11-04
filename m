Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833177;
	b=XWd2GB8/h1NpD8O46D5zzt3RZJNHlCjOJSVaJQWCQI6I9pJYfmA99RsUN0FmT7HgIFtP
	 qa50psHzlu0pYxtln/2jy4KQkqyvWiA6c0WZSfPI4mZaT64IAPQk2gCFhYF75FLblmvIw
	 gxVvbzpL4mGH+V+8LOwmZlkIOGeBryR6G4iaUdN/o3WQLbBJjVsmxy9SFtcPspnGhEbtZ
	 pnhEAAR/LTgVr8wAgSW4Oqqx/nn3lzAROt2u3VvO6Qjo+VfzkxII1vPOlxvT8mqMAyXR1
	 1PfHH6NyB5XxYY/gvP9uqTr57ACJ/1vvlRl8CQmHNgaL7ngDuX0unSTJvjoZh6NSMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833177;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3ejjsP5CUTkIgbJxIswC08Q7vBzgePxT/LNcIoo2w0=;
	b=GMlA/OUnjK5ry0VGjC2/5RTnWHZ2VAFLB8LWbSj1rJ9btfWb4xrNeCT5YbofXkQu3miX
	 E7qO2cN+m2szGjvVdtOVSU15fGy3elbz8X8XOOmcLqT0oMtkyxVHRwzFsmAfrC40/8jhe
	 asV0hBvcxEgUI+9IKuKDcOfYRjmqFvi46k+AKpyCyJ8TLliq5eqS8m4Mkxu9R12hB5S+V
	 Edo2r3TXggB8Reoz3DiQzJLM2sy7YyLQvWBEVfZk7reSsfu+o5gIAAzVCElX4ru4Clc+T
	 qg9bhbHaXx0vegrRMESFKGS09a2UzPWllp73BtCLYSgfR3rpmoKrgbLK6WGifoh5L8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPNqAEwB;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28160606A337
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 22:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28160606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPNqAEwB
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GpkFyOepvSaTmprHNZGRwrHOetWFypuIqLJ++aQFUwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793833173; v=1; x=1794437973;
 b=UPNqAEwBAQ8xNqHCwO8U/N9g+AUjrfHKwBqK/a3gpy4bSGPY97/qpd9N2JsN4AzWt1Gc6mO/
 pVXLTKzLDASPrfWVOhDCKN0t8VO2k5Qhq4xzj5CY0BAzi95S5VY18EHdXZsFeOHynbqph1cRiKs
 89M9VRK5iL6ih0QiEZKyML/U=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a75e10ecc4a965d;
	Wed, 04 Nov 2026 22:59:33 +0000
X-Mizu-Trace-ID: 1a75e10ecc4a965d
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
Date: Wed,  4 Nov 2026 14:58:00 -0800
Message-ID: <20261104225803.1574849-2-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
References: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROG Xbox Ally X20 (RC74XA) BIOS reports acp-audio-config-flag 0x10
(FLAG_AMD_LEGACY_ONLY_DMIC) in the ACP _DSD. snd_pci_ps then rejects
the device, so the SoundWire links carrying the two TAS2783 amps and
the RT721 are never scanned.

Add the board to the ACP70 flag override table so snd_pci_ps probes.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2fb9789cac0ac..858bb51fa0383 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -105,6 +105,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* ASUS ROG Xbox Ally X20 (Strix Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
+		},
+	},
 	{}
 };
 
-- 
2.56.0

