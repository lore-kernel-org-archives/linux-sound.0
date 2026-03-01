Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ACC430BB5;
	Sun,  1 Mar 2026 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328542; cv=none; b=NaEC2VDf6940GMyuddb6IkigcjRrCbPwo7JcWceWj0AB9fzVgmIJNiRGRzUgOtJjHDYJLCAjHDJ7dgToOPpQx9o8S/dDLa6Ud8rnb5ZPW4w7vtJLKbeVj3glZcgjdH0RcW16XFnvKL9iIgM2SpYgKjFpJv73dKYnNhTfu+14exw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328542; c=relaxed/simple;
	bh=yCFWfBeF+PZWVyzX7yo0tje+vkMpIDDmkqMn7lQz3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpQSZjvyhNClKx+I38kxsO0RISQpxCMWSwYESVuIgQVpuOPMzE/BY70ErooDXSqfgaWdkuhjYQ+AVIijxztFIbDL1LZcRrxHX0nuDfCWd/jzFei38HWeEQkocAxYrMAR+9prqXn3u518TSK4vkaAvbYeOg8ai95QQf5vqEw/4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmiAXkpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmiAXkpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79121C19421;
	Sun,  1 Mar 2026 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328542;
	bh=yCFWfBeF+PZWVyzX7yo0tje+vkMpIDDmkqMn7lQz3oM=;
	h=From:To:Cc:Subject:Date:From;
	b=NmiAXkpN0YXZskNBYaqO00ycoX0M98kHron4VtUpMVskZ+Km3VSzcENyVZGEJuEeY
	 yB7a0AsUzRFP5fOqwIWq7l+Qmk7BaYodC2R9HgX9exKlL8Br1xMM58Oqe6KEm8J5ta
	 Ga6cAtHLZIIME4EYlq1yCmaIuZwuHIkthzBpWjoX6XplWv6MWGTBMOuX6l6dQcHI9K
	 3/hX8IobIsRyBZISAU7cBb6zf08DYSBIB4HIZ22o7KhZzGF2m77ZlfGAb/mrIAukmj
	 UHKUvZ1iKQr9E3jalHJl8Od3a/4CAA0jv06wMEe0tsccP1e9L2pCT69wfjjIO5Ulr8
	 Typ+3v8xODvSg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	guspatagonico@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:29:00 -0500
Message-ID: <20260301012900.1686856-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ff9cadd1a2c0b2665b7377ac79540d66f212e7e3 Mon Sep 17 00:00:00 2001
From: Gustavo Salvini <guspatagonico@gmail.com>
Date: Tue, 10 Feb 2026 12:51:56 -0300
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X
 M6501RR

The ASUS Vivobook Pro 15X (M6501RR) with AMD Ryzen 9 6900HX has an
internal DMIC that is not detected without a DMI quirk entry, as the
BIOS does not set the AcpDmicConnected ACPI _DSD property.

Adding the DMI entry enables the ACP6x DMIC machine driver to probe
successfully.

Cc: stable@vger.kernel.org

Signed-off-by: Gustavo Salvini <guspatagonico@gmail.com>
Link: https://patch.msgid.link/20260210155156.29079-1-guspatagonico@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 67f2fee193980..f1a63475100d1 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -696,7 +696,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
 		}
 	},
-
+	{
+			.driver_data = &acp6x_card,
+			.matches = {
+				DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
+			}
+		},
 	{}
 };
 
-- 
2.51.0




