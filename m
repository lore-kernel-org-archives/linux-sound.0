Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259D19CD19;
	Sun,  1 Mar 2026 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329157; cv=none; b=Y5GzXFqQBkK0EpoQ/oxq3inXNgxmaeHJIxSom3JOnrGAd61StFFJTusUe2f5zPkT1Gd0wqOX7pMcM86Kqq97pnPVWbHcHGrFB7zc+bNuJa1ppPm87OzedWO27hAcmI+3b/DzJuou03LBFm7pq9zimwPAjnQQPyyMfR2BBKejzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329157; c=relaxed/simple;
	bh=CNzgCQI0ZsZIoEnFxq1r75ypSDvu+pmmkQkksq9bF1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N+pnmAN+/Ow/CsHburlek1PboHbtZ3+g1Ad3yp++yDw0z1LFKhD8KL8WYs8QQzauoe45Ze3T5PShaKow5tWQrmM07aiDVWc6P8uXXGb7M9r87BawzuUfqKbaYL6VeE1hL9pD0K3OV8OLPWXT7SMu3AIyhCyI8d2YNMoI9+CzLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahm5nN+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahm5nN+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A4C19424;
	Sun,  1 Mar 2026 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329157;
	bh=CNzgCQI0ZsZIoEnFxq1r75ypSDvu+pmmkQkksq9bF1U=;
	h=From:To:Cc:Subject:Date:From;
	b=ahm5nN+0O1IqLoEBSyMsF5ufKLVcWR+A+i2feN67L0uMvMwuyKaoTZAFQwXI+MM6V
	 WOadbkA0J1h7hUZmidua2yvvocYIh+DYdDEyKIqnGjJnGHfawzSVLgEaf7+155FmZg
	 BTLapCg7aWmeXgDbek5InYXnmTIYLR2Z59JyrQmSPUUtjzoU5o12+WEtdsSQXgfol1
	 oy0bAYEcoPjBqb0E4mi3er5ovOgmai+rSXD2ySbbV5ERU7xlj3faSbP1VJvqcp5vR/
	 Ew7GFTZ9j4pnZXKsVELwo4tbugY6qoSjqNK+OUyr6ufoyXwjziC8sT/+SvsPChkMNq
	 ob2LZD50UrQeg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	guspatagonico@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:39:15 -0500
Message-ID: <20260301013915.1700148-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
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




