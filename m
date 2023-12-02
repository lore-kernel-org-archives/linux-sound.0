Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mutex.one header.i=@mutex.one header.b="T3g3FD9b"
X-Greylist: delayed 1288 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Dec 2023 14:51:55 PST
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030A6C4
	for <linux-sound@vger.kernel.org>; Sat,  2 Dec 2023 14:51:54 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id B079E16C004F;
	Sun,  3 Dec 2023 00:30:25 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEsZY57NrXHr; Sun,  3 Dec 2023 00:30:24 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1701556224; bh=s585yJTEP1BIT7VQPTYSUVZfeJViMXhJ8P6thTlf5V4=;
	h=From:To:Cc:Subject:Date:From;
	b=T3g3FD9bpTodjDxExZLR+5KvBiNu1YqAhNSn1aZiwCS/48lyni4Ca7/1QUeBgdx9H
	 0XuZ/fllWPcCCTwHRd00TwJSPorI8nCNQz01as1u4ZUUdoNUlYIWCG663Si/j9JJAZ
	 LR+J/nt1dkiIJGUg3A0aR/qJ3vJJ0081juL0+fMo=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH] ASoC: amd: acp: Add support for a new Huawei Matebook laptop
Date: Sun,  3 Dec 2023 00:29:51 +0200
Message-ID: <20231202223001.8025-1-posteuca@mutex.one>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for Huawei MateBook D16 2021
with Ryzen 4600H in driver acp3x-es83xx.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/amd/acp-config.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 20cee7104c2b..3bc4b2e41650 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -103,6 +103,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HVY-WXX9"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+				},
+			},
+			{}
+		},
+	},
 	{
 		.flags = FLAG_AMD_LEGACY,
 		.device = ACP_PCI_DEV_ID,
-- 
2.41.0

