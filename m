Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AAF29DB6C;
	Mon, 20 Jul 2026 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576055; cv=none; b=qTuHBdZSTyCNXZuSi1nKUhjGpm21dwSmnCRecn1r2FKOO/YvTxbCg1L8ECy+hdtibVydyCkJ5p8ZKc45Og9zh/L1o6hTI6xlYYhz3IeivOwq1hg6sTxTqzpK8XwYgRG6wjOFvO3BIhazJrUJ2e6iu5WzNtfylAsOqvchRgE1O84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576055; c=relaxed/simple;
	bh=CmNrd492sHNTKKzbYCGaXBAny5hcqZLEcI+MXCaax3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xh6YP0yRol+xxRp5hcuL0GysXmS2mO2XBdHitQtSjXqVS0nzJMl1omLOJxbTB4EkdP7Z+f7lIhebYUpybLdiHtSitWYPinLiVWgfn7GX7KgKXcHBZ2aU4GNvOY2Jsg07jC4bIFrxsGF7ZX0spz61L+fybkm56nWx0OcgN29hhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4wJM/AU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4wJM/AU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50CE5C2BCB8;
	Mon, 20 Jul 2026 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784576055;
	bh=CmNrd492sHNTKKzbYCGaXBAny5hcqZLEcI+MXCaax3k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=S4wJM/AUQw6Q7ZFDqHOV9/kQYmn4FMbHdvN0eypwDE0GGYSpkpueDdTxqut4tJUvJ
	 dKHYmE/SgKbFm9wB9wBlhE5bRm5DItz2vhw5ALtBoYPqAf1hJXvTYU9D72aMMC/ycz
	 kWXJvTz2tMpSyIeR+Gc04u9MBWHCWFqAjIXnyN6gxLprlZQi8gJJwP4RCMKBWWB3/n
	 UWrS+7g+PwdPFc470R6AmSJYDR+8yUlEzn1YdWrh9Qpbm2uVU54JYNH4GXoCCyninL
	 kCjJCEzrTNXyamDJQIpUcYb4Qs+JlQPzJzfU+UcyK9XKXejL6IM/drGTMjUfRzIClB
	 vv61CDaZPSJbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C6BC44515;
	Mon, 20 Jul 2026 19:34:15 +0000 (UTC)
From: =?utf-8?q?=E9=83=91=E9=B8=BF=E6=BA=90_via_B4_Relay?= <devnull+spark_psc.outlook.com@kernel.org>
Date: Tue, 21 Jul 2026 03:31:58 +0800
Subject: [PATCH] ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk
 table
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-master-v1-1-6f56d5a54d96@outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA1NIrXWq4iL0Ux1Fo1lRkQI3
 t1olx+8/yVQEiaFtkggtLHyEjNcWcA4Y5zIcMgGb31tX96ZL+pKYt7UVE8XbKgdQh7/hD6830d
 dnz2gkhkE4zhf+SI8cXz8YziOEwUDumB4AAAA
X-Change-ID: 20260721-master-9e8351d0d61a
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?=E9=83=91=E9=B8=BF=E6=BA=90?= <spark_psc@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784575921; l=1505;
 i=spark_psc@outlook.com; h=from:subject:message-id;
 bh=sPieR3UZfAQY/O5EmOaFntl04LzU4hXdSmuT+Pa9MUk=;
 b=tcrtQFzYLHt0rPWGpDtA+KzxseW/Lj0w5h1Gllgj12fDIlwnBoI5+A0dcq3wLcgoRi8fl9ltj
 uFXucVuRReGBJSNzfYY1reyukjPc/mC2Gc/sfvkMNIoiQKktRzx63wX
X-Developer-Key: i=spark_psc@outlook.com; a=ed25519;
 pk=2Jj+f2FmVYca2wcyeqtE4uty2ySW1dJ5k3c4Zde3V4Q=
X-Endpoint-Received: by B4 Relay for spark_psc@outlook.com/default with
 auth_id=886
X-Original-From: =?utf-8?q?=E9=83=91=E9=B8=BF=E6=BA=90?= <spark_psc@outlook.com>
Reply-To: spark_psc@outlook.com

From: 郑鸿源 <spark_psc@outlook.com>

The MSI Crosshair A16 HX D7WFKG has an internal digital microphone
connected through AMD ACP6x, but the system does not expose the
AcpDmicConnected ACPI property. As a result, acp_yc_mach does not bind
and no DMIC capture device is created.

Add a DMI quirk for this model. This was tested on a system with board
MS-15PL, BIOS E15PLAMS.10B, and AMD ACP6x rev 0x62. After applying the
quirk, the internal microphone appears as an acp6x DMIC capture device
and records correctly.

Signed-off-by: 郑鸿源 <spark_psc@outlook.com>
---
This patch adds a DMI quirk for the MSI Crosshair A16 HX D7WFKG.
The commit message contains the full rationale and test details.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index d6df7de..3a8a5da 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -521,6 +521,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D7WFKG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260721-master-9e8351d0d61a

Best regards,
-- 
郑鸿源 <spark_psc@outlook.com>


