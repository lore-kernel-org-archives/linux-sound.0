Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554713CF030
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193078; cv=none; b=Hp7JZo5WoyU8x/zVt3nuhSWBQbCu3M36m/3wjmhtFboEr0sv8zOQPkr+45VQ1TtHKeJkYnYUWXrIm55wSPvpObF0U/pt/c6ghKtYd57c3NyIB0bu81UjVerNLDDeBIAq7qpp4R1JeicklftHMx4S2OV5uCyo3WE8yLks3TakVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193078; c=relaxed/simple;
	bh=G373Yt5tLG4x1eJ5v/JTk6nz0xO6F4q1YQsFJW47C9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmV7eifL5dkmZJAuWn5aH7SBjWavc1bWr2zYUaSSXvHqMDNz83PJzh9NZYwNemc7V2VOOTxlCVFDvYomjbUe2Sklqp74cklasrpXQ8h/aLpJZ3EKI9i3PAWTKZQxj5kw8Jd+79eRYpUlSKFK9HmrNOCgRCcjTBWZXaQtnCMv26U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bBYBrDxv; arc=none smtp.client-ip=91.218.175.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bBYBrDxv"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G373Yt5tLG4x1eJ5v/JTk6nz0xO6F4q1YQsFJW47C9w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193075; v=1; x=1792797875;
 b=bBYBrDxvnQk111ii3FdJdGyxNN2WVsyIezE1Gmpw4KX0r8qDQGOqp/y+PX/ASYBe38II6b8j
 9CN/Sio1+O2p6lD0/2dg6v7cE2Eh+qstdO8HGBvRsiC7JF9lJoEnR3sh4rKe6JzS0UBtY0tVuay
 sz+j2qOjBXifUdYt4TOoeyBA=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0eb0375ef824dc11;
	Fri, 16 Oct 2026 23:24:34 +0000
X-Mizu-Trace-ID: 0eb0375ef824dc11
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
Subject: [PATCH 1/5] ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
Date: Fri, 16 Oct 2026 16:24:11 -0700
Message-ID: <20261016232416.2628603-2-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROG Xbox Ally X20 (RC74XA) BIOS reports acp-audio-config-flag 0x10
(FLAG_AMD_LEGACY_ONLY_DMIC) in the ACP _DSD. snd_pci_ps then rejects
the device, so the SoundWire links carrying the two TAS2783 amps and
the RT721 are never scanned.

Add the board to the ACP70 flag override table so snd_pci_ps probes.

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

