Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AB190664;
	Sun,  1 Mar 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330735; cv=none; b=htKPHr83FtgMLB9sbpMUWpkbDPFpemxgndZSz3GR1yKJ7SMiPO5OkWaR+zxC0I7BFfKgHLGBgC1hZVx3cQYoyPoSpU1HVvQ2cP92S+hlEFj7O0ijuVA6p5OTMwWgoSk3IqJXt/88fbjfImqWN4DvM2gi253XQeyg88XL4XaaO58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330735; c=relaxed/simple;
	bh=8uSuRRPaCdVZpij0IRhqErLZZSr5B4ltX1VOoVsKWlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZE8nwsMGxsbmuWcNPYqAAeoEjz60ViLb5aOJ6XQyoxxiDluZA5qoQ4JDQcSpFyNmFVhJas6zbVBJZi2F6RqWdasinNiAawdARhupRnYmGsHxfpqZhHyJf2FQSfEJFnF7ZP4EHGpm2VTNyAtCVfRNS1EfZz1cin2RcBZXEx9t54w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6RTBgWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6RTBgWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D02C19421;
	Sun,  1 Mar 2026 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330735;
	bh=8uSuRRPaCdVZpij0IRhqErLZZSr5B4ltX1VOoVsKWlU=;
	h=From:To:Cc:Subject:Date:From;
	b=F6RTBgWxB4vYxAFk+yv+IIZtzhWFO6nxoBCr9OnOJz2LuMHEXDr6xrnPDIB7wOP5f
	 gTZJIFDl+cP7UnStHsyvSOefMZEasLH/AKURdSLBBd70jPU/iTh/uvRlR7NKv18fCd
	 fGYPgCizLeQKY5XDc3qGsLfD4OYQjWzMULiZrYs7rgmJFfmdYc7fOLKTvmyeU+EFZ9
	 jmrligTwrktNUByizBdgHbTsEVsMGmsPyQKwncHKnmvb8LIB+WGILYU8NWxCeWmXlp
	 IXxsPpec9JGMWAo1wbDVrj/amLxUKrMC9wBydbkotITG0+hvhwyk/Tj4QAcmO+4WXF
	 Gten7kKUVKldg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	guspatagonico@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:05:33 -0500
Message-ID: <20260301020533.1734273-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




